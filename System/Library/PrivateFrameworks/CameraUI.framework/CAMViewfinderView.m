@interface CAMViewfinderView
+ (Class)layerClass;
- (BOOL)_isAdjustingTopBarOrientationForLayoutStyle:(int64_t)a3;
- (BOOL)_shouldLayoutPortraitInstructionsAtTop;
- (BOOL)_wantsFullScreenPreviewRegardlessOfLayoutForLayoutStyle:(int64_t)a3;
- (BOOL)_wantsInterfaceOrientedPreviewForLayoutStyle:(int64_t)a3;
- (BOOL)_wantsPreviewOnlyLayoutForTopBarFrame:(CGRect)a3 bottomBarFrame:(CGRect)a4;
- (BOOL)automaticallyAdjustsTopBarOrientation;
- (BOOL)useCreativeControls;
- (CAMBottomBar)bottomBar;
- (CAMBurstIndicatorView)burstIndicatorView;
- (CAMControlVisibilityDelegate)visibilityDelegate;
- (CAMDisabledModeOverlayView)disabledModeOverlayView;
- (CAMElapsedTimeView)elapsedTimeView;
- (CAMFilterNameBadge)filterNameBadge;
- (CAMFlashBadge)flashBadge;
- (CAMFlipButton)flipButton;
- (CAMFocusLockBadge)focusAndExposureLockBadge;
- (CAMFullscreenViewfinderLayout)_modernLayout;
- (CAMHDRBadge)HDRBadge;
- (CAMImageAnalysisInstructionLabel)imageAnalysisInstructionLabel;
- (CAMLivePhotoBadge)livePhotoBadge;
- (CAMMachineReadableCodeButton)machineReadableCodeButton;
- (CAMPanoramaView)panoramaView;
- (CAMPortraitModeInstructionLabel)portraitModeInstructionLabel;
- (CAMPreviewContainerMaskingView)_previewContainerMaskingView;
- (CAMPreviewView)previewView;
- (CAMQRCodeInstructionLabel)qrCodeInstructionLabel;
- (CAMShallowDepthOfFieldBadge)shallowDepthOfFieldBadge;
- (CAMSharedLibraryBadge)sharedLibraryBadge;
- (CAMShutterIndicatorView)shutterIndicatorView;
- (CAMTimerIndicatorView)timerIndicatorView;
- (CAMTopBar)topBar;
- (CAMVideoConfigurationStatusIndicator)videoConfigurationStatusIndicator;
- (CAMViewfinderFlipTransition)_flipTransition;
- (CAMViewfinderOpenAndCloseTransition)_openAndCloseTransition;
- (CAMViewfinderView)initWithCoder:(id)a3;
- (CAMViewfinderView)initWithFrame:(CGRect)a3;
- (CAMViewfinderView)initWithLayoutStyle:(int64_t)a3;
- (CAMZoomControl)zoomControl;
- (CAMZoomSlider)zoomSlider;
- (CEKLightingControl)lightingControl;
- (CEKLightingNameBadge)lightingNameBadge;
- (CGRect)_cameraPreviewFrameForAspectRatio:(int64_t)a3 topBarFrame:(CGRect)a4 bottomBarFrame:(CGRect)a5 shouldShiftPreviewForUtilityBar:(BOOL)a6;
- (CGRect)_frameForBadgeTrayForLayoutStyle:(int64_t)a3 orientation:(int64_t)a4;
- (CGRect)_previewFrameForAspectRatio:(int64_t)a3 topBarFrame:(CGRect)a4 bottomBarFrame:(CGRect)a5 shouldShiftPreviewForUtilityBar:(BOOL)a6;
- (CGSize)_bottomBarSizeForLayoutStyle:(int64_t)a3 withProposedSize:(CGSize)a4;
- (CGSize)_previewSizeForAspectRatio:(int64_t)a3;
- (CGSize)_topBarSizeForLayoutStyle:(int64_t)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 forAspectRatio:(int64_t)a4;
- (CUShutterButton)shutterButton;
- (NSArray)visibleTopBadges;
- (NSMutableDictionary)_descriptionOverlayViewByKey;
- (UIEdgeInsets)_layoutMarginInsetsForLayoutStyle:(int64_t)a3;
- (UIOffset)_previewOffset;
- (UIView)_bottomBarExtensionView;
- (UIView)_previewContainerView;
- (UIView)_topBarExtensionView;
- (VKTextLiftingView)textInteractionInsert;
- (double)_badgeTrayHeightForLayoutStyle:(int64_t)a3;
- (double)_interpolatedBottomBarHeightWithProposedHeight:(double)a3;
- (double)_interpolatedBottomBarWidthWithProposedWidth:(double)a3;
- (double)_interpolatedTopBarHeight;
- (double)_interpolatedVerticalOffsetForShutterIndicator;
- (double)_multiplierForAspectRatio:(int64_t)a3;
- (double)_utilityBarExtensionDistanceForLayoutStyle:(int64_t)a3;
- (id)_viewToLayoutBadgesBelowForLayoutStyle:(int64_t)a3 orientation:(int64_t)a4;
- (id)descriptionOverlayViewForKey:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)desiredAspectRatio;
- (int64_t)externalDisplayPreviewOrientation;
- (int64_t)layoutStyle;
- (int64_t)maskingAspectRatio;
- (int64_t)orientation;
- (int64_t)previewViewOrientation;
- (void)_cameraAppPreviewLayoutForAspectRatio:(int64_t)a3 shouldShiftPreviewForUtilityBar:(BOOL)a4 outPreviewBounds:(CGRect *)a5 outPreviewCenter:(CGPoint *)a6 outFourThreeTopBarFrame:(CGRect *)a7 outBottomBarFrame:(CGRect *)a8;
- (void)_cameraTopBarForLayoutForLayoutStyle:(int64_t)a3 shouldAdjustTopBarOrientation:(BOOL)a4 bounds:(CGRect *)a5 center:(CGPoint *)a6 transform:(CGAffineTransform *)a7;
- (void)_commonCAMViewfinderViewInitializationWithLayoutStyle:(int64_t)a3;
- (void)_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5 fadeInDuration:(double)a6 fadeInDelay:(double)a7;
- (void)_createPlaceholderSnapshotAndPerformSingleSidedFadeForView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5;
- (void)_enforceBadgeSubviewOrderingWithAppearingBadges:(id)a3;
- (void)_layoutBadgeForTinyLayoutStyle:(id)a3 animated:(BOOL)a4;
- (void)_layoutBadgeTrayForLayoutStyle:(int64_t)a3 appearingBadges:(id)a4 disappearingBadges:(id)a5 animated:(BOOL)a6;
- (void)_layoutBadgeTrayWithBadges:(id)a3 layoutStyle:(int64_t)a4;
- (void)_layoutBarExtensionViews;
- (void)_layoutBottomBadgesForLayoutStyle:(int64_t)a3;
- (void)_layoutBottomCenteredView:(id)a3 aboveView:(id)a4 aboveViewSpacing:(double)a5 forLayoutStyle:(int64_t)a6;
- (void)_layoutBurstIndicatorForLayoutStyle:(int64_t)a3;
- (void)_layoutDescriptionOverlayView:(id)a3;
- (void)_layoutElapsedTimeViewForLayoutStyle:(int64_t)a3;
- (void)_layoutFlipButtonForLayoutStyle:(int64_t)a3;
- (void)_layoutImageAnalysisInstructionLabelForLayoutStyle:(int64_t)a3;
- (void)_layoutInstructionLabelOnTop:(id)a3 forLayoutStyle:(int64_t)a4;
- (void)_layoutLightingControlForLayoutStyle:(int64_t)a3;
- (void)_layoutMachineReadableCodeButton;
- (void)_layoutPanoramaViewForLayoutStyle:(int64_t)a3;
- (void)_layoutPortraitModeInstructionLabelForLayoutStyle:(int64_t)a3;
- (void)_layoutQRCodeInstructionLabelForLayoutStyle:(int64_t)a3;
- (void)_layoutShutterButtonForLayoutStyle:(int64_t)a3;
- (void)_layoutShutterIndicatorForLayoutStyle:(int64_t)a3;
- (void)_layoutSnapshotsOfPreviewView;
- (void)_layoutTextInteractionInsertAndActionInfoView;
- (void)_layoutTimerIndicatorViewForLayoutStyle:(int64_t)a3;
- (void)_layoutTopBadgesForLayoutStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)_layoutTopBadgesForLayoutStyle:(int64_t)a3 appearingBadges:(id)a4 disappearingBadges:(id)a5 animated:(BOOL)a6;
- (void)_layoutTopBarForLayoutStyle:(int64_t)a3;
- (void)_layoutVideoConfigurationStatusIndicatorForLayoutStyle:(int64_t)a3;
- (void)_layoutZoomControlForLayoutStyle:(int64_t)a3;
- (void)_layoutZoomSliderForLayoutStyle:(int64_t)a3;
- (void)_previewLayoutForAspectRatio:(int64_t)a3 shouldShiftPreviewForUtilityBar:(BOOL)a4 outPreviewBounds:(CGRect *)a5 outPreviewCenter:(CGPoint *)a6 outFourThreeTopBarFrame:(CGRect *)a7 outBottomBarFrame:(CGRect *)a8;
- (void)_setBottomBarExtensionView:(id)a3;
- (void)_setFlipTransition:(id)a3;
- (void)_setModernLayout:(id)a3;
- (void)_setOpenAndCloseTransition:(id)a3;
- (void)_setTopBarExtensionView:(id)a3;
- (void)_topBarForLayoutForLayoutStyle:(int64_t)a3 shouldAdjustTopBarOrientation:(BOOL)a4 bounds:(CGRect *)a5 center:(CGPoint *)a6 transform:(CGAffineTransform *)a7;
- (void)_updateBarExtensionViewsIfNecessary;
- (void)_updateModernLayout;
- (void)adoptMachineReadableCodeButton:(id)a3 animated:(BOOL)a4;
- (void)badgeViewDidChangeIntrinsicContentSize:(id)a3;
- (void)controlStatusIndicatorDidChangeIntrinsicContentSize:(id)a3 animated:(BOOL)a4;
- (void)dismissMachineReadableCodeButtonAnimated:(BOOL)a3;
- (void)instructionLabelDidChangeIntrinsicContentSize:(id)a3;
- (void)layoutSubviews;
- (void)prepareForAutorotation;
- (void)prepareForResumingUsingCrossfade;
- (void)removeInflightBlurAnimations;
- (void)setAutomaticallyAdjustsTopBarOrientation:(BOOL)a3;
- (void)setBottomBar:(id)a3;
- (void)setBurstIndicatorView:(id)a3;
- (void)setDescriptionOverlayView:(id)a3 forKey:(id)a4;
- (void)setDesiredAspectRatio:(int64_t)a3;
- (void)setDisabledModeOverlayView:(id)a3;
- (void)setElapsedTimeView:(id)a3;
- (void)setExternalDisplayPreviewOrientation:(int64_t)a3;
- (void)setFilterNameBadge:(id)a3;
- (void)setFlashBadge:(id)a3;
- (void)setFlipButton:(id)a3;
- (void)setFocusAndExposureLockBadge:(id)a3;
- (void)setHDRBadge:(id)a3;
- (void)setImageAnalysisInstructionLabel:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setLightingControl:(id)a3;
- (void)setLightingNameBadge:(id)a3;
- (void)setLivePhotoBadge:(id)a3;
- (void)setMachineReadableCodeButton:(id)a3;
- (void)setMaskingAspectRatio:(int64_t)a3;
- (void)setMaskingAspectRatio:(int64_t)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setPanoramaView:(id)a3;
- (void)setPortraitModeInstructionLabel:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setPreviewViewOrientation:(int64_t)a3;
- (void)setQrCodeInstructionLabel:(id)a3;
- (void)setShallowDepthOfFieldBadge:(id)a3;
- (void)setSharedLibraryBadge:(id)a3;
- (void)setShutterButton:(id)a3;
- (void)setShutterIndicatorView:(id)a3;
- (void)setTextInteractionInsert:(id)a3;
- (void)setTimerIndicatorView:(id)a3;
- (void)setTopBar:(id)a3;
- (void)setUseCreativeControls:(BOOL)a3;
- (void)setVideoConfigurationStatusIndicator:(id)a3;
- (void)setVisibilityDelegate:(id)a3;
- (void)setVisibleTopBadges:(id)a3;
- (void)setVisibleTopBadges:(id)a3 animated:(BOOL)a4;
- (void)setZoomControl:(id)a3;
- (void)setZoomSlider:(id)a3;
@end

@implementation CAMViewfinderView

- (CAMViewfinderView)initWithLayoutStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMViewfinderView;
  v4 = -[CAMViewfinderView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(CAMViewfinderView *)v4 _commonCAMViewfinderViewInitializationWithLayoutStyle:a3];
    v6 = v5;
  }

  return v5;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_commonCAMViewfinderViewInitializationWithLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
  v4 = [MEMORY[0x263F825C8] blackColor];
  [(CAMViewfinderView *)self setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x263F82E00]);
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  v10 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
  previewContainerView = self->__previewContainerView;
  self->__previewContainerView = v10;

  v12 = self->__previewContainerView;
  v13 = [MEMORY[0x263F825C8] blackColor];
  [(UIView *)v12 setBackgroundColor:v13];

  v14 = -[CAMPreviewContainerMaskingView initWithFrame:]([CAMPreviewContainerMaskingView alloc], "initWithFrame:", v6, v7, v8, v9);
  previewContainerMaskingView = self->__previewContainerMaskingView;
  self->__previewContainerMaskingView = v14;

  v16 = self->__previewContainerMaskingView;
  v17 = [MEMORY[0x263F825C8] blackColor];
  [(CAMPreviewContainerMaskingView *)v16 setBackgroundColor:v17];

  [(CAMPreviewContainerMaskingView *)self->__previewContainerMaskingView addSubview:self->__previewContainerView];
  [(CAMViewfinderView *)self _updateModernLayout];
  [(CAMViewfinderView *)self addSubview:self->__previewContainerMaskingView];
  self->__descriptionOverlayViewByKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  MEMORY[0x270F9A758]();
}

- (void)setPreviewView:(id)a3
{
  id v5 = (CAMPreviewView *)a3;
  p_previewView = &self->_previewView;
  if (self->_previewView != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_previewView, a3);
    double v7 = [(CAMViewfinderView *)self _previewContainerView];
    [v7 addSubview:*p_previewView];

    id v5 = v8;
  }
}

- (UIView)_previewContainerView
{
  return self->__previewContainerView;
}

- (void)setTopBar:(id)a3
{
  id v5 = (CAMTopBar *)a3;
  topBar = self->_topBar;
  if (topBar != v5)
  {
    double v7 = v5;
    [(CAMTopBar *)topBar removeFromSuperview];
    objc_storeStrong((id *)&self->_topBar, a3);
    topBar = (CAMTopBar *)[(CAMViewfinderView *)self addSubview:self->_topBar];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](topBar, v5);
}

- (void)setBottomBar:(id)a3
{
  id v5 = (CAMBottomBar *)a3;
  bottomBar = self->_bottomBar;
  if (bottomBar != v5)
  {
    double v7 = v5;
    [(CAMBottomBar *)bottomBar removeFromSuperview];
    objc_storeStrong((id *)&self->_bottomBar, a3);
    bottomBar = (CAMBottomBar *)[(CAMViewfinderView *)self addSubview:self->_bottomBar];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](bottomBar, v5);
}

- (void)setVisibilityDelegate:(id)a3
{
}

- (void)setUseCreativeControls:(BOOL)a3
{
  self->_useCreativeControls = a3;
}

- (CAMBottomBar)bottomBar
{
  return self->_bottomBar;
}

- (void)setShutterButton:(id)a3
{
  id v5 = (CUShutterButton *)a3;
  shutterButton = self->_shutterButton;
  if (shutterButton != v5)
  {
    double v7 = v5;
    [(CUShutterButton *)shutterButton removeFromSuperview];
    objc_storeStrong((id *)&self->_shutterButton, a3);
    shutterButton = (CUShutterButton *)[(CAMViewfinderView *)self addSubview:self->_shutterButton];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](shutterButton, v5);
}

- (void)setFlipButton:(id)a3
{
  id v5 = (CAMFlipButton *)a3;
  flipButton = self->_flipButton;
  double v8 = v5;
  if (flipButton != v5)
  {
    [(CAMFlipButton *)flipButton removeFromSuperview];
    objc_storeStrong((id *)&self->_flipButton, a3);
    double v7 = CAMPixelWidthForView(self);
    -[CAMFlipButton setTappableEdgeInsets:](self->_flipButton, "setTappableEdgeInsets:", v7 + 9.0, v7 + 9.0, v7 + 9.0, v7 + 9.0);
    [(CAMViewfinderView *)self addSubview:v8];
  }
}

- (void)setShutterIndicatorView:(id)a3
{
  id v5 = (CAMShutterIndicatorView *)a3;
  shutterIndicatorView = self->_shutterIndicatorView;
  double v7 = v5;
  if (shutterIndicatorView != v5)
  {
    [(CAMShutterIndicatorView *)shutterIndicatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_shutterIndicatorView, a3);
    [(CAMViewfinderView *)self addSubview:v7];
  }
}

- (void)setFocusAndExposureLockBadge:(id)a3
{
  id v5 = (CAMFocusLockBadge *)a3;
  p_focusAndExposureLockBadge = &self->_focusAndExposureLockBadge;
  focusAndExposureLockBadge = self->_focusAndExposureLockBadge;
  if (focusAndExposureLockBadge != v5)
  {
    v11 = v5;
    [(CAMFocusLockBadge *)focusAndExposureLockBadge removeFromSuperview];
    double v8 = [(CEKBadgeView *)*p_focusAndExposureLockBadge delegate];

    if (v8 == self) {
      [(CEKBadgeView *)*p_focusAndExposureLockBadge setDelegate:0];
    }
    [(CAMFocusLockBadge *)*p_focusAndExposureLockBadge setAlpha:1.0];
    objc_storeStrong((id *)&self->_focusAndExposureLockBadge, a3);
    [(CEKBadgeView *)*p_focusAndExposureLockBadge setDelegate:self];
    double v9 = [(CAMViewfinderView *)self visibleTopBadges];
    char v10 = [v9 containsObject:*p_focusAndExposureLockBadge];

    if ((v10 & 1) == 0) {
      [(CAMFocusLockBadge *)*p_focusAndExposureLockBadge setAlpha:0.0];
    }
    focusAndExposureLockBadge = (CAMFocusLockBadge *)[(CAMViewfinderView *)self addSubview:v11];
    id v5 = v11;
  }
  MEMORY[0x270F9A758](focusAndExposureLockBadge, v5);
}

- (NSArray)visibleTopBadges
{
  return self->_visibleTopBadges;
}

- (void)setVisibleTopBadges:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (([v12 isEqualToArray:self->_visibleTopBadges] & 1) == 0)
  {
    double v6 = [MEMORY[0x263EFF9C0] setWithArray:self->_visibleTopBadges];
    double v7 = [MEMORY[0x263EFF9C0] setWithArray:v12];
    double v8 = (NSArray *)[v12 copy];
    visibleTopBadges = self->_visibleTopBadges;
    self->_visibleTopBadges = v8;

    char v10 = (void *)[v6 mutableCopy];
    [v10 minusSet:v7];
    id v11 = v7;
    [v11 minusSet:v6];
    [(CAMViewfinderView *)self _enforceBadgeSubviewOrderingWithAppearingBadges:v11];
    [(CAMViewfinderView *)self _layoutTopBadgesForLayoutStyle:[(CAMViewfinderView *)self layoutStyle] appearingBadges:v11 disappearingBadges:v10 animated:v4];
  }
}

- (void)_enforceBadgeSubviewOrderingWithAppearingBadges:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF9C0];
  double v6 = [(CAMViewfinderView *)self visibleTopBadges];
  double v7 = [v5 setWithArray:v6];

  [v7 minusSet:v4];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        [(CAMViewfinderView *)self bringSubviewToFront:*(void *)(*((void *)&v23 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[CAMViewfinderView bringSubviewToFront:](self, "bringSubviewToFront:", *(void *)(*((void *)&v19 + 1) + 8 * v17++), (void)v19);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  v18 = [(CAMViewfinderView *)self timerIndicatorView];
  if (v18) {
    [(CAMViewfinderView *)self bringSubviewToFront:v18];
  }
}

- (CAMTimerIndicatorView)timerIndicatorView
{
  return self->_timerIndicatorView;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)_layoutTopBadgesForLayoutStyle:(int64_t)a3 appearingBadges:(id)a4 disappearingBadges:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a4;
  id v10 = a5;
  if ((unint64_t)a3 < 2)
  {
LABEL_4:
    [(CAMViewfinderView *)self _layoutBadgeTrayForLayoutStyle:a3 appearingBadges:v12 disappearingBadges:v10 animated:v6];
    goto LABEL_6;
  }
  if (a3 != 2)
  {
    if (a3 != 4) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  uint64_t v11 = [(CAMViewfinderView *)self livePhotoBadge];
  [(CAMViewfinderView *)self _layoutBadgeForTinyLayoutStyle:v11 animated:v6];

LABEL_6:
}

- (void)_layoutBadgeTrayForLayoutStyle:(int64_t)a3 appearingBadges:(id)a4 disappearingBadges:(id)a5 animated:(BOOL)a6
{
  BOOL v23 = a6;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = [(CAMViewfinderView *)self visibleTopBadges];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if ([v9 containsObject:v17]) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }
  if (v23) {
    double v18 = 0.25;
  }
  else {
    double v18 = 0.0;
  }

  long long v19 = (void *)MEMORY[0x263F82E00];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __96__CAMViewfinderView__layoutBadgeTrayForLayoutStyle_appearingBadges_disappearingBadges_animated___block_invoke;
  v29[3] = &unk_263FA1FF8;
  v29[4] = self;
  id v20 = v11;
  id v30 = v20;
  int64_t v31 = a3;
  [v19 performWithoutAnimation:v29];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __96__CAMViewfinderView__layoutBadgeTrayForLayoutStyle_appearingBadges_disappearingBadges_animated___block_invoke_2;
  v24[3] = &unk_263FA0C58;
  id v25 = v10;
  id v26 = v20;
  v27 = self;
  int64_t v28 = a3;
  id v21 = v20;
  id v22 = v10;
  +[CAMView animateIfNeededWithDuration:0 options:v24 animations:0 completion:v18];
}

uint64_t __96__CAMViewfinderView__layoutBadgeTrayForLayoutStyle_appearingBadges_disappearingBadges_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutBadgeTrayWithBadges:*(void *)(a1 + 40) layoutStyle:*(void *)(a1 + 48)];
}

- (void)_layoutBadgeTrayWithBadges:(id)a3 layoutStyle:(int64_t)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v37 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v61 count:16];
    double v10 = 0.0;
    double v11 = 0.0;
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v13 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v57 != v13) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v56 + 1) + 8 * i) intrinsicContentSize];
          double v11 = v11 + v15;
        }
        uint64_t v12 = [v8 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [(CAMViewfinderView *)self orientation];
    BOOL v38 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:a4];
    [(CAMViewfinderView *)self _frameForBadgeTrayForLayoutStyle:a4 orientation:v16];
    CGFloat x = v63.origin.x;
    CGFloat y = v63.origin.y;
    CGFloat width = v63.size.width;
    CGFloat height = v63.size.height;
    double v21 = CGRectGetWidth(v63);
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    double v22 = CGRectGetHeight(v64);
    if (v21 >= v22) {
      double v22 = v21;
    }
    double v23 = (v22 - (v11 + (double)(unint64_t)(v7 - 1) * 5.0)) * 0.5;
    switch(v16)
    {
      case 0:
      case 1:
        goto LABEL_12;
      case 2:
        if (v38)
        {
          v66.origin.CGFloat x = x;
          v66.origin.CGFloat y = y;
          v66.size.CGFloat width = width;
          v66.size.CGFloat height = height;
          double MaxX = CGRectGetMaxX(v66);
LABEL_18:
          double v10 = MaxX - v23;
        }
        else
        {
LABEL_12:
          v65.origin.CGFloat x = x;
          v65.origin.CGFloat y = y;
          v65.size.CGFloat width = width;
          v65.size.CGFloat height = height;
          double MinX = CGRectGetMinX(v65);
LABEL_16:
          double v10 = v23 + MinX;
        }
LABEL_19:
        long long v54 = 0u;
        long long v55 = 0u;
        long long v53 = 0u;
        CAMOrientationTransform(v16, (uint64_t)&v53);
        UIRectGetCenter();
        uint64_t v27 = v26;
        double v29 = v28;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id obj = v8;
        uint64_t v30 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v50;
          long long v40 = *MEMORY[0x263F00148];
LABEL_21:
          uint64_t v33 = 0;
          while (2)
          {
            if (*(void *)v50 != v32) {
              objc_enumerationMutation(obj);
            }
            long long v34 = *(void **)(*((void *)&v49 + 1) + 8 * v33);
            [v34 intrinsicContentSize];
            long long v46 = v40;
            long long v47 = v40;
            *(double *)&long long v48 = v35;
            *((void *)&v48 + 1) = v36;
            switch(v16)
            {
              case 0:
              case 1:
                goto LABEL_25;
              case 2:
                if (v38)
                {
                  *(double *)&long long v46 = v10 + v35 * -0.5;
                  *((double *)&v46 + 1) = v29;
LABEL_31:
                  double v10 = v10 - (v35 + 5.0);
                }
                else
                {
LABEL_25:
                  *(double *)&long long v46 = v10 + v35 * 0.5;
                  *((double *)&v46 + 1) = v29 + -2.0;
LABEL_29:
                  double v10 = v10 + v35 + 5.0;
                }
LABEL_32:
                +[CAMView ceilBounds:&v47 andRoundCenter:&v46 toViewScale:self];
                v43[0] = MEMORY[0x263EF8330];
                v43[1] = 3221225472;
                v43[2] = __60__CAMViewfinderView__layoutBadgeTrayWithBadges_layoutStyle___block_invoke;
                v43[3] = &unk_263FA06F8;
                v43[4] = v34;
                long long v44 = v47;
                long long v45 = v48;
                [MEMORY[0x263F82E00] performWithoutAnimation:v43];
                [v34 setCenter:v46];
                v42[0] = v53;
                v42[1] = v54;
                v42[2] = v55;
                [v34 setTransform:v42];
                if (v31 != ++v33) {
                  continue;
                }
                uint64_t v31 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
                if (!v31) {
                  goto LABEL_34;
                }
                goto LABEL_21;
              case 3:
                *(void *)&long long v46 = v27;
                *((double *)&v46 + 1) = v10 + v35 * 0.5;
                goto LABEL_29;
              case 4:
                *(void *)&long long v46 = v27;
                *((double *)&v46 + 1) = v10 + v35 * -0.5;
                goto LABEL_31;
              default:
                goto LABEL_32;
            }
          }
        }
LABEL_34:

        id v5 = v37;
        break;
      case 3:
        v67.origin.CGFloat x = x;
        v67.origin.CGFloat y = y;
        v67.size.CGFloat width = width;
        v67.size.CGFloat height = height;
        double MinX = CGRectGetMinY(v67);
        goto LABEL_16;
      case 4:
        v68.origin.CGFloat x = x;
        v68.origin.CGFloat y = y;
        v68.size.CGFloat width = width;
        v68.size.CGFloat height = height;
        double MaxX = CGRectGetMaxY(v68);
        goto LABEL_18;
      default:
        goto LABEL_19;
    }
  }
}

- (void)setFlashBadge:(id)a3
{
  id v5 = (CAMFlashBadge *)a3;
  p_flashBadge = &self->_flashBadge;
  flashBadge = self->_flashBadge;
  if (flashBadge != v5)
  {
    double v11 = v5;
    [(CAMFlashBadge *)flashBadge removeFromSuperview];
    id v8 = [(CEKBadgeView *)*p_flashBadge delegate];

    if (v8 == self) {
      [(CEKBadgeView *)*p_flashBadge setDelegate:0];
    }
    [(CAMFlashBadge *)*p_flashBadge setAlpha:1.0];
    objc_storeStrong((id *)&self->_flashBadge, a3);
    [(CEKBadgeView *)*p_flashBadge setDelegate:self];
    uint64_t v9 = [(CAMViewfinderView *)self visibleTopBadges];
    char v10 = [v9 containsObject:*p_flashBadge];

    if ((v10 & 1) == 0) {
      [(CAMFlashBadge *)*p_flashBadge setAlpha:0.0];
    }
    flashBadge = (CAMFlashBadge *)[(CAMViewfinderView *)self addSubview:v11];
    id v5 = v11;
  }
  MEMORY[0x270F9A758](flashBadge, v5);
}

- (void)setTimerIndicatorView:(id)a3
{
  id v5 = (CAMTimerIndicatorView *)a3;
  timerIndicatorView = self->_timerIndicatorView;
  uint64_t v7 = v5;
  if (timerIndicatorView != v5)
  {
    [(CAMTimerIndicatorView *)timerIndicatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_timerIndicatorView, a3);
    [(CAMViewfinderView *)self addSubview:v7];
    [(CAMViewfinderView *)self _enforceBadgeSubviewOrderingWithAppearingBadges:0];
  }
}

- (void)setHDRBadge:(id)a3
{
  id v5 = (CAMHDRBadge *)a3;
  p_HDRBadge = &self->_HDRBadge;
  HDRBadge = self->_HDRBadge;
  if (HDRBadge != v5)
  {
    double v11 = v5;
    [(CAMHDRBadge *)HDRBadge removeFromSuperview];
    id v8 = [(CEKBadgeView *)*p_HDRBadge delegate];

    if (v8 == self) {
      [(CEKBadgeView *)*p_HDRBadge setDelegate:0];
    }
    [(CAMHDRBadge *)*p_HDRBadge setAlpha:1.0];
    objc_storeStrong((id *)&self->_HDRBadge, a3);
    [(CEKBadgeView *)*p_HDRBadge setDelegate:self];
    uint64_t v9 = [(CAMViewfinderView *)self visibleTopBadges];
    char v10 = [v9 containsObject:*p_HDRBadge];

    if ((v10 & 1) == 0) {
      [(CAMHDRBadge *)*p_HDRBadge setAlpha:0.0];
    }
    HDRBadge = (CAMHDRBadge *)[(CAMViewfinderView *)self addSubview:v11];
    id v5 = v11;
  }
  MEMORY[0x270F9A758](HDRBadge, v5);
}

- (void)setBurstIndicatorView:(id)a3
{
  id v5 = (CAMBurstIndicatorView *)a3;
  burstIndicatorView = self->_burstIndicatorView;
  uint64_t v7 = v5;
  if (burstIndicatorView != v5)
  {
    [(CAMBurstIndicatorView *)burstIndicatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_burstIndicatorView, a3);
    [(CAMViewfinderView *)self addSubview:v7];
  }
}

- (CAMTopBar)topBar
{
  return self->_topBar;
}

- (void)setQrCodeInstructionLabel:(id)a3
{
  id v5 = (CAMQRCodeInstructionLabel *)a3;
  p_qrCodeInstructionLabel = &self->_qrCodeInstructionLabel;
  qrCodeInstructionLabel = self->_qrCodeInstructionLabel;
  if (qrCodeInstructionLabel != v5)
  {
    uint64_t v9 = v5;
    [(CAMQRCodeInstructionLabel *)qrCodeInstructionLabel removeFromSuperview];
    id v8 = [(CAMInstructionLabel *)*p_qrCodeInstructionLabel delegate];

    if (v8 == self) {
      [(CAMInstructionLabel *)*p_qrCodeInstructionLabel setDelegate:0];
    }
    objc_storeStrong((id *)&self->_qrCodeInstructionLabel, a3);
    [(CAMInstructionLabel *)*p_qrCodeInstructionLabel setDelegate:self];
    qrCodeInstructionLabel = (CAMQRCodeInstructionLabel *)[(CAMViewfinderView *)self addSubview:v9];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](qrCodeInstructionLabel, v5);
}

- (void)setDesiredAspectRatio:(int64_t)a3
{
  if (self->_desiredAspectRatio != a3)
  {
    self->_desiredAspectRatio = a3;
    [(CAMViewfinderView *)self _updateBarExtensionViewsIfNecessary];
    [(CAMViewfinderView *)self setNeedsLayout];
  }
}

- (void)setMaskingAspectRatio:(int64_t)a3
{
}

- (void)setMaskingAspectRatio:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_maskingAspectRatio != a3)
  {
    if (a4)
    {
      [(CAMViewfinderView *)self layoutIfNeeded];
      self->_maskingAspectRatio = a3;
      [(CAMViewfinderView *)self setNeedsLayout];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __52__CAMViewfinderView_setMaskingAspectRatio_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:6 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:400.0 completion:0.0];
    }
    else
    {
      self->_maskingAspectRatio = a3;
      [(CAMViewfinderView *)self setNeedsLayout];
    }
  }
}

- (CAMPreviewView)previewView
{
  return self->_previewView;
}

- (void)setPreviewViewOrientation:(int64_t)a3
{
  self->_previewViewOrientation = a3;
}

- (void)setAutomaticallyAdjustsTopBarOrientation:(BOOL)a3
{
  if (self->_automaticallyAdjustsTopBarOrientation != a3)
  {
    self->_automaticallyAdjustsTopBarOrientation = a3;
    [(CAMViewfinderView *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int64_t orientation = self->_orientation;
  if (orientation != a3)
  {
    BOOL v5 = a4;
    unint64_t v8 = [(CAMViewfinderView *)self layoutStyle];
    if (v5)
    {
      [(CAMViewfinderView *)self layoutIfNeeded];
      self->_int64_t orientation = a3;
      if (v8 <= 4 && ((1 << v8) & 0x15) != 0 && (unint64_t)(a3 - 1) < 2)
      {
        if ((unint64_t)(orientation - 1) > 1)
        {
          double v10 = 0.0;
          double v9 = 0.2;
          double v12 = 0.3;
          double v11 = 0.25;
        }
        else
        {
          double v9 = 0.0;
          double v10 = 0.1;
          double v11 = 0.2;
          double v12 = 0.2;
        }
      }
      else
      {
        double v11 = 0.25;
        double v10 = 0.0;
        double v9 = 0.2;
        double v12 = 0.3;
      }
      uint64_t v13 = (void *)MEMORY[0x263EFF9C0];
      uint64_t v14 = [(CAMViewfinderView *)self visibleTopBadges];
      double v15 = [v13 setWithArray:v14];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            [(CAMViewfinderView *)self _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:*(void *)(*((void *)&v32 + 1) + 8 * v20++) fadeOutDuration:v12 fadeOutDelay:v10 fadeInDuration:v11 fadeInDelay:v9];
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v18);
      }

      double v21 = [(CAMViewfinderView *)self visibilityDelegate];
      if (([v21 shouldHidePortraitModeInstructionLabel] & 1) == 0)
      {
        double v22 = [(CAMViewfinderView *)self portraitModeInstructionLabel];
        [(CAMViewfinderView *)self _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:v22 fadeOutDuration:v12 fadeOutDelay:v10 fadeInDuration:v11 fadeInDelay:v9];
      }
      if (([v21 shouldHideQRCodeInstructionLabel] & 1) == 0)
      {
        double v23 = [(CAMViewfinderView *)self qrCodeInstructionLabel];
        [(CAMViewfinderView *)self _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:v23 fadeOutDuration:v12 fadeOutDelay:v10 fadeInDuration:v11 fadeInDelay:v9];
      }
      if (([v21 shouldHideFilterNameBadge] & 1) == 0)
      {
        long long v24 = [(CAMViewfinderView *)self filterNameBadge];
        [(CAMViewfinderView *)self _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:v24 fadeOutDuration:v12 fadeOutDelay:v10 fadeInDuration:v11 fadeInDelay:v9];
      }
      if (([v21 shouldHideLightingNameBadgeForOrientation:orientation] & 1) == 0)
      {
        if ((unint64_t)(a3 - 3) >= 2)
        {
          if ((unint64_t)(a3 - 1) >= 2)
          {
            id v25 = [(CAMViewfinderView *)self lightingNameBadge];
          }
          else
          {
            id v25 = [(CAMViewfinderView *)self lightingNameBadge];
            if ((unint64_t)(orientation - 3) <= 0xFFFFFFFFFFFFFFFDLL) {
              [(CAMViewfinderView *)self _createPlaceholderSnapshotAndPerformSingleSidedFadeForView:v25 fadeOutDuration:v12 fadeOutDelay:v10];
            }
          }
        }
        else
        {
          id v25 = [(CAMViewfinderView *)self lightingNameBadge];
          if ((unint64_t)(orientation - 3) <= 1) {
            [(CAMViewfinderView *)self _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:v25 fadeOutDuration:v12 fadeOutDelay:v10 fadeInDuration:v11 fadeInDelay:v9];
          }
        }
      }
      char v26 = [v21 shouldHideTopBar];
      if (((orientation - 1) | (unint64_t)(a3 - 1)) >= 2
        && (v26 & 1) == 0
        && [(CAMViewfinderView *)self automaticallyAdjustsTopBarOrientation])
      {
        uint64_t v27 = [(CAMViewfinderView *)self topBar];
        [(CAMViewfinderView *)self _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:v27 fadeOutDuration:0.3 fadeOutDelay:0.0 fadeInDuration:0.25 fadeInDelay:0.2];
      }
    }
    else
    {
      self->_int64_t orientation = a3;
    }
    double v28 = [(CAMViewfinderView *)self _descriptionOverlayViewByKey];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __45__CAMViewfinderView_setOrientation_animated___block_invoke;
    v30[3] = &__block_descriptor_41_e55_v32__0___NSCopying__8__CAMDescriptionOverlayView_16_B24l;
    v30[4] = a3;
    BOOL v31 = v5;
    [v28 enumerateKeysAndObjectsUsingBlock:v30];

    [(CAMViewfinderView *)self setNeedsLayout];
    [(CAMViewfinderView *)self _layoutPortraitModeInstructionLabelForLayoutStyle:v8];
    [(CAMViewfinderView *)self _layoutQRCodeInstructionLabelForLayoutStyle:v8];
    [(CAMViewfinderView *)self _layoutTopBadgesForLayoutStyle:v8 animated:0];
    [(CAMViewfinderView *)self _layoutBottomBadgesForLayoutStyle:v8];
    if (v5)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __45__CAMViewfinderView_setOrientation_animated___block_invoke_2;
      v29[3] = &unk_263FA0208;
      v29[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:6 delay:v29 options:0 animations:0.25 completion:0.0];
    }
  }
}

- (void)_layoutPortraitModeInstructionLabelForLayoutStyle:(int64_t)a3
{
  id v8 = [(CAMViewfinderView *)self visibilityDelegate];
  BOOL v5 = [(CAMViewfinderView *)self _shouldLayoutPortraitInstructionsAtTop];
  uint64_t v6 = [(CAMViewfinderView *)self portraitModeInstructionLabel];
  if (v5)
  {
    [(CAMViewfinderView *)self _layoutInstructionLabelOnTop:v6 forLayoutStyle:a3];
  }
  else
  {
    if ([v8 shouldHideFilterNameBadge])
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [(CAMViewfinderView *)self filterNameBadge];
    }
    [(CAMViewfinderView *)self _layoutBottomCenteredView:v6 aboveView:v7 aboveViewSpacing:a3 forLayoutStyle:15.0];
  }
  [v6 setStyle:1];
}

- (CAMControlVisibilityDelegate)visibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityDelegate);
  return (CAMControlVisibilityDelegate *)WeakRetained;
}

- (BOOL)_shouldLayoutPortraitInstructionsAtTop
{
  v3 = [(CAMViewfinderView *)self visibilityDelegate];
  int v4 = [v3 shouldHideLightingControl] ^ 1;
  BOOL v5 = [(CAMViewfinderView *)self lightingControl];

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4;
  }

  return v6;
}

- (CEKLightingControl)lightingControl
{
  return self->_lightingControl;
}

- (CAMPortraitModeInstructionLabel)portraitModeInstructionLabel
{
  return self->_portraitModeInstructionLabel;
}

- (void)_layoutBottomCenteredView:(id)a3 aboveView:(id)a4 aboveViewSpacing:(double)a5 forLayoutStyle:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if ((unint64_t)(a6 - 2) >= 2)
  {
    double v35 = a5;
    if (a6 == 1) {
      double v12 = 31.0;
    }
    else {
      double v12 = 15.0;
    }
    uint64_t v13 = [(CAMViewfinderView *)self previewView];
    uint64_t v14 = [(CAMViewfinderView *)self topBar];
    [v14 frame];
    double MaxY = CGRectGetMaxY(v45);

    [v13 frame];
    CGFloat x = v46.origin.x;
    CGFloat y = v46.origin.y;
    CGFloat width = v46.size.width;
    CGFloat height = v46.size.height;
    CGRect v47 = CGRectInset(v46, v12, v12);
    objc_msgSend(v10, "sizeThatFits:", v47.size.width, v47.size.height);
    double v20 = v19;
    double v22 = v21;
    UIRoundToViewScale();
    UIRoundToViewScale();
    double v24 = v23;
    double v41 = 0.0;
    double v42 = 0.0;
    double v43 = v20;
    double v44 = v22;
    long long v40 = *MEMORY[0x263F00148];
    unint64_t v25 = [(CAMViewfinderView *)self orientation];
    uint64_t v26 = v25;
    if (v25 < 3)
    {
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      *(void *)&long long v40 = CGRectGetMidX(v48);
      if (v11)
      {
        [v11 frame];
        objc_msgSend(v11, "alignmentRectForFrame:");
        double MinY = CGRectGetMinY(v49);
        double v28 = v24 + v35;
      }
      else
      {
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.size.CGFloat width = width;
        v53.size.CGFloat height = height;
        double MinY = CGRectGetMaxY(v53);
        double v28 = v12 + v24;
      }
      *((double *)&v40 + 1) = MinY - v28;
      goto LABEL_21;
    }
    if (v25 == 3)
    {
      v54.origin.CGFloat x = x;
      v54.origin.CGFloat y = y;
      v54.size.CGFloat width = width;
      v54.size.CGFloat height = height;
      double v31 = CGRectGetMinY(v54);
      v55.origin.CGFloat x = x;
      v55.origin.CGFloat y = y;
      v55.size.CGFloat width = width;
      v55.size.CGFloat height = height;
      *((double *)&v40 + 1) = (fmax(MaxY, v31) + CGRectGetMaxY(v55)) * 0.5;
      if (v11)
      {
        [v11 frame];
        objc_msgSend(v11, "alignmentRectForFrame:");
        double v12 = v24 + CGRectGetMaxX(v56);
        double v32 = v35;
      }
      else
      {
        v57.origin.CGFloat x = x;
        v57.origin.CGFloat y = y;
        v57.size.CGFloat width = width;
        v57.size.CGFloat height = height;
        double v32 = v24 + CGRectGetMinX(v57);
      }
      double v33 = v12 + v32;
    }
    else
    {
      if (v25 != 4)
      {
LABEL_21:
        +[CAMView ceilBounds:andRoundCenter:toViewScale:](CAMView, "ceilBounds:andRoundCenter:toViewScale:", &v41, &v40, self, *(void *)&MaxY);
        objc_msgSend(v10, "setBounds:", v41, v42, v43, v44);
        [v10 setCenter:v40];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v37 = 0u;
        CAMOrientationTransform(v26, (uint64_t)&v37);
        v36[0] = v37;
        v36[1] = v38;
        v36[2] = v39;
        [v10 setTransform:v36];

        goto LABEL_22;
      }
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      double v29 = CGRectGetMinY(v50);
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      *((double *)&v40 + 1) = (fmax(MaxY, v29) + CGRectGetMaxY(v51)) * 0.5;
      if (v11)
      {
        [v11 frame];
        objc_msgSend(v11, "alignmentRectForFrame:");
        double MinX = CGRectGetMinX(v52);
        double v12 = v35;
      }
      else
      {
        v58.origin.CGFloat x = x;
        v58.origin.CGFloat y = y;
        v58.size.CGFloat width = width;
        v58.size.CGFloat height = height;
        double MinX = CGRectGetMaxX(v58);
      }
      double v33 = MinX - v24 - v12;
    }
    *(double *)&long long v40 = v33;
    goto LABEL_21;
  }
LABEL_22:
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)_layoutQRCodeInstructionLabelForLayoutStyle:(int64_t)a3
{
  id v5 = [(CAMViewfinderView *)self qrCodeInstructionLabel];
  [(CAMViewfinderView *)self _layoutInstructionLabelOnTop:v5 forLayoutStyle:a3];
  [v5 setStyle:1];
}

- (CAMQRCodeInstructionLabel)qrCodeInstructionLabel
{
  return self->_qrCodeInstructionLabel;
}

- (void)_layoutInstructionLabelOnTop:(id)a3 forLayoutStyle:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = [(CAMViewfinderView *)self previewView];
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  int64_t v15 = [(CAMViewfinderView *)self orientation];
  unint64_t v16 = v15;
  if ((unint64_t)(v15 - 3) >= 2) {
    double v17 = v14;
  }
  else {
    double v17 = v12;
  }
  if ((unint64_t)(v15 - 3) >= 2) {
    double v18 = v12;
  }
  else {
    double v18 = v14;
  }
  double v19 = (double *)MEMORY[0x263F001A8];
  objc_msgSend(v5, "sizeThatFits:", v18 + -25.0, v17 + -25.0);
  double v37 = v20;
  double v22 = v21;
  double v23 = [(CAMViewfinderView *)self topBar];
  [v23 frame];
  CGFloat MaxY = CGRectGetMaxY(v40);

  unint64_t v25 = [(CAMViewfinderView *)self visibilityDelegate];
  char v26 = [v25 shouldLayoutLightingNameBadgeAtBottom];

  if (v26)
  {
    double v34 = MaxY;
  }
  else
  {
    uint64_t v27 = [(CAMViewfinderView *)self lightingNameBadge];
    [v27 frame];
    double v34 = CGRectGetMaxY(v41);
  }
  double v35 = v19[1];
  double v36 = *v19;
  UIRectGetCenter();
  double v29 = v28;
  double v31 = v30;
  double v32 = v22;
  double v33 = v22 * 0.5 + CAMPixelWidthForView(self) + 10.0;
  if (v16 >= 3)
  {
    if (v16 == 3)
    {
      v44.origin.CGFloat x = v8;
      v44.origin.CGFloat y = v10;
      v44.size.CGFloat width = v12;
      v44.size.CGFloat height = v14;
      double v29 = CGRectGetMaxX(v44) - v33;
    }
    else if (v16 == 4)
    {
      v43.origin.CGFloat x = v8;
      v43.origin.CGFloat y = v10;
      v43.size.CGFloat width = v12;
      v43.size.CGFloat height = v14;
      double v29 = v33 + CGRectGetMinX(v43);
    }
  }
  else
  {
    v42.origin.CGFloat x = v8;
    v42.origin.CGFloat y = v10;
    v42.size.CGFloat width = v12;
    v42.size.CGFloat height = v14;
    double v31 = v33 + fmax(v34, CGRectGetMinY(v42));
  }
  objc_msgSend(v5, "setBounds:", v36, v35, v37, v32, *(void *)&v34);
  objc_msgSend(v5, "setCenter:", v29, v31);
  CAMOrientationTransform(v16, (uint64_t)v39);
  v38[0] = v39[0];
  v38[1] = v39[1];
  v38[2] = v39[2];
  [v5 setTransform:v38];
}

- (void)_layoutTopBadgesForLayoutStyle:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)_layoutBottomBadgesForLayoutStyle:(int64_t)a3
{
  id v8 = [(CAMViewfinderView *)self filterNameBadge];
  -[CAMViewfinderView _layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:](self, "_layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:", 0.0);
  id v5 = [(CAMViewfinderView *)self visibilityDelegate];
  int v6 = [v5 shouldLayoutLightingNameBadgeAtBottom];

  if (v6)
  {
    double v7 = [(CAMViewfinderView *)self lightingNameBadge];
    [(CAMViewfinderView *)self _layoutBottomCenteredView:v7 aboveView:0 aboveViewSpacing:a3 forLayoutStyle:0.0];
  }
}

- (CAMFilterNameBadge)filterNameBadge
{
  return self->_filterNameBadge;
}

- (CEKLightingNameBadge)lightingNameBadge
{
  return self->_lightingNameBadge;
}

- (void)layoutSubviews
{
  v66.receiver = self;
  v66.super_class = (Class)CAMViewfinderView;
  [(CAMViewfinderView *)&v66 layoutSubviews];
  [(CAMViewfinderView *)self bounds];
  CGFloat x = v67.origin.x;
  double y = v67.origin.y;
  double v57 = v67.origin.x;
  CGFloat v4 = v67.origin.y;
  CGFloat width = v67.size.width;
  double height = v67.size.height;
  double v54 = v67.size.width;
  CGFloat v6 = v67.size.height;
  double MidX = CGRectGetMidX(v67);
  v68.origin.CGFloat x = x;
  v68.origin.double y = v4;
  v68.size.CGFloat width = width;
  v68.size.double height = v6;
  double MidY = CGRectGetMidY(v68);
  int64_t v8 = [(CAMViewfinderView *)self layoutStyle];
  [(CAMViewfinderView *)self _updateModernLayout];
  double v9 = [(CAMViewfinderView *)self visibilityDelegate];
  uint64_t v10 = [v9 shouldShiftPreviewForUtilityBar];

  int64_t v11 = [(CAMViewfinderView *)self desiredAspectRatio];
  long long v12 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v64 = *MEMORY[0x263F001A8];
  long long v65 = v12;
  long long v13 = *MEMORY[0x263F00148];
  long long v62 = v12;
  long long v63 = v13;
  long long v60 = v12;
  long long v61 = v64;
  long long v59 = v64;
  [(CAMViewfinderView *)self _previewLayoutForAspectRatio:v11 shouldShiftPreviewForUtilityBar:v10 outPreviewBounds:&v64 outPreviewCenter:&v63 outFourThreeTopBarFrame:&v61 outBottomBarFrame:&v59];
  CGFloat v14 = [(CAMViewfinderView *)self bottomBar];
  objc_msgSend(v14, "setFrame:", v59, v60);
  [(CAMViewfinderView *)self _utilityBarExtensionDistanceForLayoutStyle:v8];
  objc_msgSend(v14, "setUtilityBarExtensionDistance:");
  long long v15 = v64;
  long long v16 = v65;
  double v17 = [(CAMViewfinderView *)self previewView];
  objc_msgSend(v17, "setBounds:", v15, v16);

  long long v18 = v63;
  double v19 = [(CAMViewfinderView *)self previewView];
  [v19 setCenter:v18];

  long long v20 = v64;
  long long v21 = v65;
  double v22 = [(CAMViewfinderView *)self previewView];
  objc_msgSend(v22, "setViewportFrame:", v20, v21);

  long long v23 = v64;
  long long v24 = v65;
  unint64_t v25 = [(CAMViewfinderView *)self previewView];
  objc_msgSend(v25, "setOverlayFrame:", v23, v24);

  int64_t v26 = [(CAMViewfinderView *)self maskingAspectRatio];
  [(CAMViewfinderView *)self _previewSizeForAspectRatio:v26];
  double v28 = v27;
  double v52 = v29;
  -[CAMViewfinderView _previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:](self, "_previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:", v26, v10, v61, v62, v59, v60);
  CGFloat v30 = v69.origin.x;
  CGFloat v31 = v69.origin.y;
  CGFloat v32 = v69.size.width;
  CGFloat v33 = v69.size.height;
  double v34 = CGRectGetMidX(v69);
  v70.origin.CGFloat x = v30;
  v70.origin.double y = v31;
  v70.size.CGFloat width = v32;
  v70.size.double height = v33;
  double v35 = CGRectGetMidY(v70);
  double v36 = [(CAMViewfinderView *)self _previewContainerMaskingView];
  double v37 = v36;
  double v38 = MidY;
  if (v26 == 3) {
    double v39 = v35;
  }
  else {
    double v39 = MidY;
  }
  if (v26 == 3) {
    double v40 = v34;
  }
  else {
    double v40 = MidX;
  }
  if (v26 == 3) {
    double v41 = 0.0;
  }
  else {
    double v41 = v57;
  }
  if (v26 == 3) {
    double v42 = 0.0;
  }
  else {
    double v42 = y;
  }
  if (v26 == 3) {
    double v43 = v28;
  }
  else {
    double v43 = v54;
  }
  if (v26 == 3) {
    double v44 = v52;
  }
  else {
    double v44 = height;
  }
  objc_msgSend(v36, "setCenter:", v40, v39);
  objc_msgSend(v37, "setBounds:", v41, v42, v43, v44);
  -[CAMViewfinderView convertPoint:toView:](self, "convertPoint:toView:", v37, MidX, v38);
  double v46 = v45;
  double v48 = v47;
  CGRect v49 = [(CAMViewfinderView *)self _previewContainerView];
  objc_msgSend(v49, "setBounds:", v57, y, v54, height);
  objc_msgSend(v49, "setCenter:", v46, v48);
  [(CAMViewfinderView *)self _layoutTopBarForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutBarExtensionViews];
  [(CAMViewfinderView *)self _layoutElapsedTimeViewForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutShutterIndicatorForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutBurstIndicatorForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutTimerIndicatorViewForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutVideoConfigurationStatusIndicatorForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutPanoramaViewForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutSnapshotsOfPreviewView];
  [(CAMViewfinderView *)self _layoutLightingControlForLayoutStyle:v8];
  CGRect v50 = [(CAMViewfinderView *)self _descriptionOverlayViewByKey];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __35__CAMViewfinderView_layoutSubviews__block_invoke;
  v58[3] = &unk_263FA3E80;
  v58[4] = self;
  [v50 enumerateKeysAndObjectsUsingBlock:v58];

  [(CAMViewfinderView *)self _layoutPortraitModeInstructionLabelForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutQRCodeInstructionLabelForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutImageAnalysisInstructionLabelForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutTopBadgesForLayoutStyle:v8 animated:0];
  [(CAMViewfinderView *)self _layoutBottomBadgesForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutZoomSliderForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutZoomControlForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutShutterButtonForLayoutStyle:v8];
  [(CAMViewfinderView *)self _layoutFlipButtonForLayoutStyle:v8];
  CGRect v51 = [(CAMViewfinderView *)self disabledModeOverlayView];
  objc_msgSend(v51, "setFrame:", v41, v42, v43, v44);
  objc_msgSend(v51, "setViewportFrame:", v41, v42, v43, v44);
  [(CAMViewfinderView *)self _layoutTextInteractionInsertAndActionInfoView];
  [(CAMViewfinderView *)self _layoutMachineReadableCodeButton];
}

- (int64_t)desiredAspectRatio
{
  return self->_desiredAspectRatio;
}

- (BOOL)useCreativeControls
{
  return self->_useCreativeControls;
}

- (UIEdgeInsets)_layoutMarginInsetsForLayoutStyle:(int64_t)a3
{
  if (a3 == 4)
  {
    CGFloat v4 = [(CAMViewfinderView *)self _modernLayout];
    if (v4)
    {
      id v5 = [(CAMViewfinderView *)self visibilityDelegate];
      uint64_t v6 = [v5 shouldShiftPreviewForUtilityBar];

      objc_msgSend(v4, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMViewfinderView useCreativeControls](self, "useCreativeControls"), v6);
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [(CAMViewfinderView *)self bounds];
      double v16 = v15;
      v28.origin.CGFloat x = v8;
      v28.origin.double y = v10;
      v28.size.CGFloat width = v12;
      v28.size.double height = v14;
      double v17 = v16 - CGRectGetMaxY(v28);
      [v4 frameForControlStatusBar];
      CGFloat MinY = CGRectGetMinY(v29);
      double v19 = 0.0;
    }
    else
    {
      long long v21 = [(CAMViewfinderView *)self window];
      double v22 = [v21 screen];
      [v22 _referenceBounds];
      double v24 = v23;

      double v17 = v24 * 16.0 / 39.0 + -86.8461538;
      double v19 = 0.0;
      CGFloat MinY = 33.0;
    }

    double v20 = 0.0;
  }
  else
  {
    CGFloat MinY = *MEMORY[0x263F834E8];
    double v19 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v17 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v20 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  double v25 = MinY;
  double v26 = v19;
  double v27 = v17;
  result.right = v20;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (CGSize)_previewSizeForAspectRatio:(int64_t)a3
{
  id v5 = [(CAMViewfinderView *)self _modernLayout];

  if (v5)
  {
    uint64_t v6 = [(CAMViewfinderView *)self _modernLayout];
    [v6 viewportSizeForAspectRatio:a3];
    double v8 = v7;
    double v10 = v9;

    double v11 = v8;
    double v12 = v10;
  }
  else
  {
    [(CAMViewfinderView *)self bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    int64_t v21 = [(CAMViewfinderView *)self layoutStyle];
    [(CAMViewfinderView *)self _multiplierForAspectRatio:a3];
    v39.origin.CGFloat x = v14;
    v39.origin.double y = v16;
    v39.size.CGFloat width = v18;
    v39.size.double height = v20;
    double Width = CGRectGetWidth(v39);
    v40.origin.CGFloat x = v14;
    v40.origin.double y = v16;
    v40.size.CGFloat width = v18;
    v40.size.double height = v20;
    double Height = CGRectGetHeight(v40);
    uint64_t v24 = [(CAMViewfinderView *)self _wantsFullScreenPreviewRegardlessOfLayoutForLayoutStyle:v21];
    UIRoundToViewScale();
    double v26 = v25;
    UIRoundToViewScale();
    double v28 = v27;
    UIRoundToViewScale();
    double v30 = v29;
    if ([(CAMViewfinderView *)self _wantsInterfaceOrientedPreviewForLayoutStyle:v21])
    {
      CGFloat v31 = [(CAMViewfinderView *)self window];
      int64_t v32 = CAMInterfaceOrientationForWindow(v31);

      if ((unint64_t)(v32 - 3) >= 2) {
        double v12 = v28;
      }
      else {
        double v12 = v30;
      }
      if (Width >= Height) {
        double v33 = Height;
      }
      else {
        double v33 = Width;
      }
      if (a3 == 3) {
        double v11 = v33;
      }
      else {
        double v11 = Width;
      }
      if (a3 == 3) {
        double v12 = v33;
      }
      double v34 = v12 / Height;
    }
    else
    {
      double v34 = v28 / Height;
      if (Height <= Width) {
        double v11 = v26;
      }
      else {
        double v11 = Width;
      }
      if (Height <= Width) {
        double v12 = Height;
      }
      else {
        double v12 = v28;
      }
      if (Height <= Width) {
        double v34 = v26 / Width;
      }
    }
    if (v34 > 0.85) {
      char v35 = 1;
    }
    else {
      char v35 = v24;
    }
    if (v35) {
      double v36 = Width;
    }
    else {
      double v36 = v11;
    }
    if (v35) {
      double v37 = Height;
    }
    else {
      double v37 = v12;
    }
    if (a3 != 3)
    {
      double v11 = v36;
      double v12 = v37;
    }
  }
  result.double height = v12;
  result.CGFloat width = v11;
  return result;
}

- (double)_multiplierForAspectRatio:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      double result = 1.33333333;
      break;
    case 1:
      double result = 1.77777778;
      break;
    case 2:
      double result = 1.5;
      break;
    case 3:
      double result = 1.0;
      break;
    case 4:
      [(CAMViewfinderView *)self bounds];
      CGFloat x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
      double v9 = CGRectGetWidth(v24);
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double v10 = CGRectGetHeight(v25);
      double v11 = [(CAMViewfinderView *)self window];
      double v12 = [v11 screen];
      [v12 bounds];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;

      v26.origin.CGFloat x = v14;
      v26.origin.CGFloat y = v16;
      v26.size.CGFloat width = v18;
      v26.size.CGFloat height = v20;
      double v21 = CGRectGetWidth(v26);
      v27.origin.CGFloat x = v14;
      v27.origin.CGFloat y = v16;
      v27.size.CGFloat width = v18;
      v27.size.CGFloat height = v20;
      double v22 = CGRectGetHeight(v27);
      double result = 1.33333333;
      if (v9 > 0.0 && v10 > 0.0 && v21 > 0.0 && v22 > 0.0)
      {
        BOOL v23 = [(CAMViewfinderView *)self _wantsInterfaceOrientedPreviewForLayoutStyle:[(CAMViewfinderView *)self layoutStyle]];
        double result = v10 / v9;
        if (!((v10 / v9 <= 1.0) ^ (v22 / v21 > 1.0) | !v23)) {
          double result = 1.0 / result;
        }
      }
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (BOOL)_wantsFullScreenPreviewRegardlessOfLayoutForLayoutStyle:(int64_t)a3
{
  return +[CAMBottomBar wantsVerticalBarForLayoutStyle:a3];
}

- (BOOL)_wantsInterfaceOrientedPreviewForLayoutStyle:(int64_t)a3
{
  CGFloat v4 = +[CAMCaptureCapabilities capabilities];
  char v5 = [v4 isSplitScreenSupported];
  if (a3) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5;
  }
  if (a3 == 4) {
    BOOL v6 = v5;
  }
  BOOL v7 = (unint64_t)(a3 - 1) < 3 || v6;

  return v7;
}

- (CGSize)_topBarSizeForLayoutStyle:(int64_t)a3
{
  [(CAMViewfinderView *)self bounds];
  double Width = CGRectGetWidth(v12);
  [(CAMViewfinderView *)self _interpolatedTopBarHeight];
  double v7 = v6;
  BOOL v8 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:a3];
  double v9 = *MEMORY[0x263F001B0];
  double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (!v8)
  {
    double v10 = v7;
    double v9 = Width;
  }
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (double)_interpolatedTopBarHeight
{
  [(CAMViewfinderView *)self bounds];
  CGRectGetWidth(v6);
  [(CAMViewfinderView *)self layoutStyle];
  v3 = [(CAMViewfinderView *)self traitCollection];
  [v3 userInterfaceIdiom];

  UIRoundToViewScale();
  return result;
}

- (CGSize)_bottomBarSizeForLayoutStyle:(int64_t)a3 withProposedSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [(CAMViewfinderView *)self bounds];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat v10 = v22.size.width;
  CGFloat v11 = v22.size.height;
  double v12 = CGRectGetWidth(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.double width = v10;
  v23.size.double height = v11;
  double v13 = CGRectGetHeight(v23);
  [(CAMViewfinderView *)self _interpolatedBottomBarWidthWithProposedWidth:width];
  double v15 = v14;
  [(CAMViewfinderView *)self _interpolatedBottomBarHeightWithProposedHeight:height];
  double v17 = v16;
  BOOL v18 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:a3];
  if (v18) {
    double v19 = v15;
  }
  else {
    double v19 = v12;
  }
  if (v18) {
    double v20 = v13;
  }
  else {
    double v20 = v17;
  }
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (double)_interpolatedBottomBarWidthWithProposedWidth:(double)a3
{
  v3 = [(CAMViewfinderView *)self window];
  CGFloat v4 = [v3 screen];
  [v4 _referenceBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v15.origin.CGFloat x = v6;
  v15.origin.CGFloat y = v8;
  v15.size.double width = v10;
  v15.size.double height = v12;
  CGRectGetWidth(v15);
  UIRoundToViewScale();
  return result;
}

- (double)_interpolatedBottomBarHeightWithProposedHeight:(double)a3
{
  [(CAMViewfinderView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  int64_t v12 = [(CAMViewfinderView *)self layoutStyle];
  v16.origin.CGFloat x = v5;
  v16.origin.CGFloat y = v7;
  v16.size.double width = v9;
  v16.size.double height = v11;
  CGRectGetWidth(v16);
  CAMPixelWidthForView(self);
  double v13 = [(CAMViewfinderView *)self traitCollection];
  LODWORD(v12) = +[CAMBottomBar shouldUseSafeAreaInsetForLayoutStyle:v12 traitCollection:v13];

  if (v12) {
    [(CAMViewfinderView *)self safeAreaInsets];
  }
  UIRoundToViewScale();
  return result;
}

- (CGRect)_previewFrameForAspectRatio:(int64_t)a3 topBarFrame:(CGRect)a4 bottomBarFrame:(CGRect)a5 shouldShiftPreviewForUtilityBar:(BOOL)a6
{
  uint64_t v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  double v17 = [(CAMViewfinderView *)self _modernLayout];

  if (v17)
  {
    if (a3 == 3) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v6;
    }
    BOOL v18 = [(CAMViewfinderView *)self _modernLayout];
    objc_msgSend(v18, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", a3, -[CAMViewfinderView useCreativeControls](self, "useCreativeControls"), v6);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
  }
  else
  {
    if ([(CAMViewfinderView *)self useCreativeControls])
    {
      [(CAMViewfinderView *)self bounds];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      [(CAMViewfinderView *)self _previewSizeForAspectRatio:a3];
      objc_msgSend(MEMORY[0x263F5E478], "cameraContentGeometryForReferenceBounds:forContentSize:withOrientation:shouldShiftPreviewForUtilityBar:", -[CAMViewfinderView orientation](self, "orientation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), v6, v28,
        v30,
        v32,
        v34,
        v35,
        v36);
      UIRectCenteredAboutPointScale();
    }
    else
    {
      -[CAMViewfinderView _cameraPreviewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:](self, "_cameraPreviewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:", a3, v6, v14, v13, v12, v11, x, y, width, height);
    }
    double v20 = v37;
    double v22 = v38;
    double v24 = v39;
    double v26 = v40;
  }
  double v41 = v20;
  double v42 = v22;
  double v43 = v24;
  double v44 = v26;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (CGRect)_cameraPreviewFrameForAspectRatio:(int64_t)a3 topBarFrame:(CGRect)a4 bottomBarFrame:(CGRect)a5 shouldShiftPreviewForUtilityBar:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double x = a5.origin.x;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  double v8 = a4.size.height;
  double v82 = a4.origin.y;
  double v83 = a4.size.width;
  double v81 = a4.origin.x;
  [(CAMViewfinderView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int64_t v19 = [(CAMViewfinderView *)self layoutStyle];
  double v84 = y;
  if ((unint64_t)a3 > 3)
  {
    double v20 = *MEMORY[0x263F834E8];
    double v21 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v22 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v23 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  else
  {
    [(CAMViewfinderView *)self _layoutMarginInsetsForLayoutStyle:v19];
  }
  CGFloat v24 = v12 + v21;
  double v25 = v14 + v20;
  CGFloat v26 = v16 - (v21 + v23);
  CGFloat v27 = v18 - (v20 + v22);
  v86.origin.double x = v12 + v21;
  v86.origin.CGFloat y = v25;
  v86.size.double width = v26;
  v86.size.double height = v27;
  double v70 = CGRectGetWidth(v86);
  v87.origin.double x = v24;
  v87.origin.CGFloat y = v25;
  v87.size.double width = v26;
  v87.size.double height = v27;
  double v75 = CGRectGetHeight(v87);
  BOOL v28 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:v19];
  CGFloat rect = v8;
  BOOL v29 = -[CAMViewfinderView _wantsPreviewOnlyLayoutForTopBarFrame:bottomBarFrame:](self, "_wantsPreviewOnlyLayoutForTopBarFrame:bottomBarFrame:", v81, v82, v83, v8, x, v84, width, height);
  [(CAMViewfinderView *)self _previewSizeForAspectRatio:a3];
  double v31 = v30;
  double v33 = v32;
  CGFloat v72 = v24;
  CGFloat v73 = v26;
  CGFloat v74 = v25;
  CGFloat v34 = v27;
  UIRectCenteredIntegralRectScale();
  double v76 = v37;
  double MinY = v35;
  double v78 = v39;
  if (v28)
  {
    double v40 = v36;
    v88.origin.double x = x;
    v88.origin.CGFloat y = v84;
    v88.size.double width = width;
    v88.size.double height = height;
    double v41 = v70 - v31 - CGRectGetWidth(v88);
    BOOL v42 = v41 >= 0.0 && v41 < 0.00000011920929;
    CGFloat MinX = v76;
    if (v42)
    {
      v89.origin.double x = v72;
      v89.origin.CGFloat y = v74;
      v89.size.double width = v73;
      v89.size.double height = v34;
      CGFloat MinX = CGRectGetMinX(v89);
      v90.origin.double x = v72;
      v90.origin.CGFloat y = v74;
      v90.size.double width = v73;
      v90.size.double height = v34;
      double MinY = CGRectGetMinY(v90);
    }
    goto LABEL_29;
  }
  double v69 = v35;
  double v71 = v36;
  v91.origin.double x = v81;
  v91.origin.CGFloat y = v82;
  v91.size.double width = v83;
  v91.size.double height = rect;
  double v44 = v75 - CGRectGetHeight(v91) - v33;
  v92.origin.double x = x;
  v92.size.double width = width;
  v92.origin.CGFloat y = v84;
  v92.size.double height = height;
  double v45 = CGRectGetHeight(v92);
  -[CAMViewfinderView _badgeTrayHeightForLayoutStyle:](self, "_badgeTrayHeightForLayoutStyle:", v19, 0);
  int v47 = vabdd_f64(v44, v45) < 2.22044605e-16 || v29;
  if (v47 != 1)
  {
    double v49 = v44 - v45;
    if (vabdd_f64(v49, v46) >= 2.0)
    {
      double v40 = v71;
      if (v49 <= 0.0)
      {
        v97.origin.double x = v81;
        v97.origin.CGFloat y = v82;
        v97.size.double width = v83;
        v97.size.double height = rect;
        CGFloat v60 = CGRectGetHeight(v97);
        double v61 = width;
        if (vabdd_f64(v75 - v60, v33) >= 2.0)
        {
          if (v19 != 4)
          {
            CGFloat MinX = v76;
            double MinY = v69;
            goto LABEL_29;
          }
          double v66 = x;
          double v67 = v84;
          double v68 = height;
          double MinY = fmax(CGRectGetMaxY(*(CGRect *)(&v61 - 2)) - v33, 0.0);
          goto LABEL_28;
        }
        double v53 = v81;
        double v54 = v82;
        double v51 = v83;
        CGFloat v50 = rect;
        goto LABEL_27;
      }
      v96.origin.double x = v81;
      v96.origin.CGFloat y = v82;
      v96.size.double width = v83;
      v96.size.double height = rect;
      double MaxY = CGRectGetMaxY(v96);
      UIRoundToViewScale();
      double MinY = MaxY + v56;
    }
    else
    {
      double v40 = v71;
      CGFloat v50 = rect;
      double v51 = v83;
      double v52 = x;
      if (v6)
      {
        double v53 = v81;
        double v54 = v82;
LABEL_27:
        double MinY = CGRectGetMaxY(*(CGRect *)(&v51 - 2));
        goto LABEL_28;
      }
      double v57 = v84;
      double v58 = width;
      double v59 = height;
      double MinY = CGRectGetMinY(*(CGRect *)&v52) - v33;
    }
LABEL_28:
    CGFloat MinX = v76;
    goto LABEL_29;
  }
  v93.origin.double x = v72;
  v93.origin.CGFloat y = v25;
  v93.size.double width = v73;
  v93.size.double height = v34;
  CGFloat MinX = CGRectGetMinX(v93);
  if (v6)
  {
    v94.origin.double x = v72;
    v94.origin.CGFloat y = v25;
    v94.size.double width = v73;
    v94.size.double height = v34;
    double v48 = CGRectGetMinY(v94);
  }
  else
  {
    v95.origin.double x = v81;
    v95.origin.CGFloat y = v82;
    v95.size.double width = v83;
    v95.size.double height = rect;
    double v48 = CGRectGetMaxY(v95);
  }
  double MinY = v48;
  double v40 = v71;
LABEL_29:
  double v62 = MinX;
  double v63 = MinY;
  double v64 = v40;
  double v65 = v78;
  result.size.double height = v65;
  result.size.double width = v64;
  result.origin.CGFloat y = v63;
  result.origin.double x = v62;
  return result;
}

- (double)_badgeTrayHeightForLayoutStyle:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 4) {
    return dbl_209C7AFF0[a3];
  }
  return result;
}

- (int64_t)maskingAspectRatio
{
  return self->_maskingAspectRatio;
}

- (CAMPreviewContainerMaskingView)_previewContainerMaskingView
{
  return self->__previewContainerMaskingView;
}

- (void)_layoutTopBarForLayoutStyle:(int64_t)a3
{
  BOOL v5 = [(CAMViewfinderView *)self _isAdjustingTopBarOrientationForLayoutStyle:"_isAdjustingTopBarOrientationForLayoutStyle:"];
  long long v6 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v14 = *MEMORY[0x263F001A8];
  long long v15 = v6;
  long long v13 = *MEMORY[0x263F00148];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v10 = *MEMORY[0x263F000D0];
  long long v11 = v7;
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(CAMViewfinderView *)self _topBarForLayoutForLayoutStyle:a3 shouldAdjustTopBarOrientation:v5 bounds:&v14 center:&v13 transform:&v10];
  double v8 = [(CAMViewfinderView *)self topBar];
  objc_msgSend(v8, "setBounds:", v14, v15);
  [v8 setCenter:v13];
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  [v8 setTransform:v9];
}

- (BOOL)_isAdjustingTopBarOrientationForLayoutStyle:(int64_t)a3
{
  BOOL v4 = [(CAMViewfinderView *)self automaticallyAdjustsTopBarOrientation];
  return v4 & !+[CAMBottomBar wantsVerticalBarForLayoutStyle:a3];
}

- (BOOL)automaticallyAdjustsTopBarOrientation
{
  return self->_automaticallyAdjustsTopBarOrientation;
}

- (void)_topBarForLayoutForLayoutStyle:(int64_t)a3 shouldAdjustTopBarOrientation:(BOOL)a4 bounds:(CGRect *)a5 center:(CGPoint *)a6 transform:(CGAffineTransform *)a7
{
  BOOL v10 = a4;
  BOOL v13 = !a4 || (unint64_t)([(CAMViewfinderView *)self orientation] - 5) < 0xFFFFFFFFFFFFFFFELL;
  long long v14 = [(CAMViewfinderView *)self _modernLayout];

  if (v14 && v13)
  {
    long long v15 = [(CAMViewfinderView *)self _modernLayout];
    [v15 frameForControlStatusBar];
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    if (a5)
    {
      a5->size.double width = v17;
      a5->size.double height = v19;
      a5->origin = (CGPoint)*MEMORY[0x263F00148];
    }
    if (a6)
    {
      UIRectGetCenter();
      a6->double x = v20;
      a6->CGFloat y = v21;
    }
    if (a7)
    {
      uint64_t v22 = MEMORY[0x263F000D0];
      long long v23 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&a7->a = *MEMORY[0x263F000D0];
      *(_OWORD *)&a7->c = v23;
      *(_OWORD *)&a7->tdouble x = *(_OWORD *)(v22 + 32);
    }
  }
  else if ([(CAMViewfinderView *)self useCreativeControls])
  {
    [(CAMViewfinderView *)self bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    if (v10) {
      int64_t v32 = [(CAMViewfinderView *)self orientation];
    }
    else {
      int64_t v32 = 1;
    }
    double v33 = [(CAMViewfinderView *)self previewView];
    [v33 frame];
    objc_msgSend(MEMORY[0x263F5E478], "cameraTopBarGeometryForReferenceBounds:forContentSize:withOrientation:", v32, v25, v27, v29, v31, v34, v35);
    if (a5)
    {
      a5->origin = 0u;
      a5->size = 0u;
    }
    if (a6) {
      *a6 = 0u;
    }
    if (a7)
    {
      *(_OWORD *)&a7->a = 0u;
      *(_OWORD *)&a7->c = 0u;
      *(_OWORD *)&a7->tdouble x = 0u;
    }
  }
  else
  {
    [(CAMViewfinderView *)self _cameraTopBarForLayoutForLayoutStyle:a3 shouldAdjustTopBarOrientation:v10 bounds:a5 center:a6 transform:a7];
  }
}

- (void)_cameraTopBarForLayoutForLayoutStyle:(int64_t)a3 shouldAdjustTopBarOrientation:(BOOL)a4 bounds:(CGRect *)a5 center:(CGPoint *)a6 transform:(CGAffineTransform *)a7
{
  BOOL v10 = a4;
  BOOL v13 = [(CAMViewfinderView *)self previewView];
  [v13 frame];
  v52.origin.double x = v14;
  v52.origin.CGFloat y = v15;
  v52.size.double width = v16;
  v52.size.double height = v17;
  [(CAMViewfinderView *)self _topBarSizeForLayoutStyle:a3];
  CGFloat v49 = v18;
  double v20 = v19;
  [(CAMViewfinderView *)self _layoutMarginInsetsForLayoutStyle:a3];
  double v22 = v21;
  double v24 = v23;
  double v51 = v25;
  double v27 = v26;
  [(CAMViewfinderView *)self bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  CGFloat v50 = v20;
  UIRoundToViewScale();
  double v37 = v36;
  long long v38 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v53 = *MEMORY[0x263F000D0];
  long long v54 = v38;
  long long v55 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (!v10 || (unint64_t v39 = [(CAMViewfinderView *)self orientation], v39 < 3))
  {
    CGFloat v40 = v24 + v29;
    CGFloat v41 = v22 + v31;
    CGFloat v42 = v33 - (v24 + v27);
    double v43 = v37;
    CGFloat v44 = v35 - (v22 + v51);
    double MidX = CGRectGetMidX(v52);
    v56.origin.double x = v40;
    v56.origin.CGFloat y = v41;
    v56.size.double width = v42;
    v56.size.double height = v44;
    double MidY = v43 + CGRectGetMinY(v56);
    goto LABEL_4;
  }
  if (v39 == 3)
  {
    double MidX = CGRectGetMaxX(v52) + -8.0 - v37;
    double MidY = CGRectGetMidY(v52);
    uint64_t v48 = 3;
    goto LABEL_15;
  }
  if (v39 == 4)
  {
    double MidX = v37 + CGRectGetMinX(v52) + 8.0;
    double MidY = CGRectGetMidY(v52);
    uint64_t v48 = 4;
LABEL_15:
    CAMOrientationTransform(v48, (uint64_t)&v53);
    goto LABEL_4;
  }
  double MidX = *MEMORY[0x263F00148];
  double MidY = *(double *)(MEMORY[0x263F00148] + 8);
LABEL_4:
  if (a5)
  {
    a5->origin.double x = 0.0;
    a5->origin.CGFloat y = 0.0;
    a5->size.double width = v49;
    a5->size.double height = v50;
  }
  if (a6)
  {
    a6->double x = MidX;
    a6->CGFloat y = MidY;
  }
  if (a7)
  {
    long long v47 = v54;
    *(_OWORD *)&a7->a = v53;
    *(_OWORD *)&a7->c = v47;
    *(_OWORD *)&a7->tdouble x = v55;
  }
}

- (void)_layoutBarExtensionViews
{
  [(CAMViewfinderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  [(CAMViewfinderView *)self _layoutMarginInsetsForLayoutStyle:[(CAMViewfinderView *)self layoutStyle]];
  double v12 = v11;
  double v14 = v13;
  double v15 = *MEMORY[0x263F001A8];
  double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
  v20.origin.double x = v4;
  v20.origin.CGFloat y = v6;
  v20.size.double width = v8;
  v20.size.double height = v10;
  double v17 = CGRectGetMaxY(v20) - v14;
  -[UIView setFrame:](self->__topBarExtensionView, "setFrame:", v15, v16, v8, v12);
  bottomBarExtensionView = self->__bottomBarExtensionView;
  -[UIView setFrame:](bottomBarExtensionView, "setFrame:", v15, v17, v8, v14);
}

- (void)_layoutElapsedTimeViewForLayoutStyle:(int64_t)a3
{
  if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:a3])
  {
    [(CAMViewfinderView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    id v12 = [(CAMViewfinderView *)self elapsedTimeView];
    [v12 intrinsicContentSize];
    v14.origin.double x = v5;
    v14.origin.CGFloat y = v7;
    v14.size.double width = v9;
    v14.size.double height = v11;
    CGRectGetMidX(v14);
    UIRoundToViewScale();
    objc_msgSend(v12, "frameForAlignmentRect:");
    objc_msgSend(v12, "setFrame:");
  }
}

- (void)_layoutShutterIndicatorForLayoutStyle:(int64_t)a3
{
  [(CAMViewfinderView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  id v21 = [(CAMViewfinderView *)self shutterIndicatorView];
  +[CAMView rotateView:v21 toInterfaceOrientation:3 animated:0];
  [v21 intrinsicContentSize];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  objc_msgSend(v21, "setBounds:", 0.0, 0.0, v12, v14);
  [(CAMViewfinderView *)self _interpolatedVerticalOffsetForShutterIndicator];
  double v17 = v16;
  v23.origin.double x = 0.0;
  v23.origin.CGFloat y = 0.0;
  v23.size.double width = v13;
  v23.size.double height = v15;
  double MidX = CGRectGetMidX(v23);
  v24.origin.double x = 0.0;
  v24.origin.CGFloat y = 0.0;
  v24.size.double width = v13;
  v24.size.double height = v15;
  double MidY = CGRectGetMidY(v24);
  v25.origin.double x = v5;
  v25.origin.CGFloat y = v7;
  v25.size.double width = v9;
  v25.size.double height = v11;
  CGFloat v20 = CGRectGetMaxX(v25) - MidY;
  v26.origin.double x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  objc_msgSend(v21, "setCenter:", v20, MidX + v17 + CGRectGetMinY(v26));
}

- (CAMShutterIndicatorView)shutterIndicatorView
{
  return self->_shutterIndicatorView;
}

- (double)_interpolatedVerticalOffsetForShutterIndicator
{
  [(CAMViewfinderView *)self bounds];
  CGRectGetWidth(v7);
  UIRoundToViewScale();
  double v4 = v3;
  double result = CAMPixelWidthForView(self) + 71.0;
  double v6 = 62.0;
  if (v4 >= 62.0) {
    double v6 = v4;
  }
  if (v6 < result) {
    return v6;
  }
  return result;
}

- (void)_layoutBurstIndicatorForLayoutStyle:(int64_t)a3
{
  id v55 = [(CAMViewfinderView *)self bottomBar];
  uint64_t v5 = [v55 backgroundStyle];
  double v6 = [(CAMViewfinderView *)self previewView];
  CGRect v7 = [v55 shutterButton];
  [v55 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v6 frame];
  CGFloat v51 = v17;
  CGFloat v53 = v16;
  CGFloat v47 = v19;
  CGFloat v49 = v18;
  BOOL v20 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:a3];
  id v21 = [(CAMViewfinderView *)self burstIndicatorView];
  double v22 = *MEMORY[0x263F00148];
  double v23 = *(double *)(MEMORY[0x263F00148] + 8);
  [v21 intrinsicContentSize];
  CGFloat v25 = v24;
  double v27 = v26;
  if (v20)
  {
    CGFloat v52 = v9;
    CGFloat v54 = v11;
    CGFloat v28 = v13;
    CGFloat v50 = v15;
    double v29 = v24;
    if (v55 && v5 == 1 && v7)
    {
      [v7 frame];
      objc_msgSend(v7, "alignmentRectForFrame:");
      objc_msgSend(v55, "convertRect:toView:", self);
      double MinX = CGRectGetMinX(v57);
      v58.origin.double x = v22;
      v58.origin.CGFloat y = v23;
      v58.size.double width = v29;
      v58.size.double height = v27;
      CGRectGetWidth(v58);
      UIRoundToViewScale();
      double v32 = MinX - v31 + -30.0;
      CGFloat v33 = v50;
      CGFloat v34 = v52;
      CGFloat v35 = v54;
    }
    else
    {
      CGFloat v34 = v52;
      CGFloat v35 = v54;
      v63.origin.double x = v52;
      v63.origin.CGFloat y = v54;
      v63.size.double width = v28;
      v63.size.double height = v15;
      double v48 = CGRectGetMinX(v63);
      v64.origin.double x = v22;
      v64.origin.CGFloat y = v23;
      v64.size.double width = v29;
      v64.size.double height = v27;
      CGRectGetWidth(v64);
      UIRoundToViewScale();
      CGFloat v33 = v15;
      double v32 = v48 - v42 + -9.0;
    }
    CGFloat v43 = v34;
    CGFloat v44 = v35;
    CGFloat v45 = v28;
    double MidY = CGRectGetMidY(*(CGRect *)(&v33 - 3));
  }
  else
  {
    v59.origin.double x = v9;
    v59.origin.CGFloat y = v11;
    v59.size.double width = v13;
    v59.size.double height = v15;
    CGFloat MidX = CGRectGetMidX(v59);
    v60.origin.double x = v9;
    v60.origin.CGFloat y = v11;
    v60.size.double width = v13;
    v60.size.double height = v15;
    double MinY = CGRectGetMinY(v60);
    v61.origin.CGFloat y = v51;
    v61.origin.double x = v53;
    v61.size.double height = v47;
    v61.size.double width = v49;
    double MaxY = CGRectGetMaxY(v61);
    if (MaxY <= MinY) {
      double v38 = MaxY;
    }
    else {
      double v38 = MinY;
    }
    double v32 = MidX;
    double v39 = 21.0 - CAMPixelWidthForView(self);
    v62.origin.double x = v22;
    v62.origin.CGFloat y = v23;
    v62.size.double width = v25;
    v62.size.double height = v27;
    CGRectGetHeight(v62);
    UIRoundToViewScale();
    double MidY = v38 - v40 - v39;
    double v29 = v25;
  }
  objc_msgSend(v21, "setBounds:", v22, v23, v29, v27, *(void *)&MidX);
  objc_msgSend(v21, "setCenter:", v32, MidY);
}

- (CAMBurstIndicatorView)burstIndicatorView
{
  return self->_burstIndicatorView;
}

- (void)_layoutTimerIndicatorViewForLayoutStyle:(int64_t)a3
{
  id v24 = [(CAMViewfinderView *)self timerIndicatorView];
  if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:a3])
  {
    [(CAMViewfinderView *)self bounds];
    double x = v26.origin.x;
    double y = v26.origin.y;
    double width = v26.size.width;
    double height = v26.size.height;
    double MidX = CGRectGetMidX(v26);
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    double MidY = CGRectGetMidY(v27);
    objc_msgSend(v24, "setBounds:", x, y, width, height);
    objc_msgSend(v24, "setCenter:", MidX, MidY);
  }
  else
  {
    CGFloat v11 = [(CAMViewfinderView *)self previewView];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [v11 center];
    double v21 = v20;
    double v23 = v22;
    objc_msgSend(v24, "setBounds:", v13, v15, v17, v19);
    objc_msgSend(v24, "setCenter:", v21, v23);
  }
}

- (void)_layoutPanoramaViewForLayoutStyle:(int64_t)a3
{
  uint64_t v5 = [(CAMViewfinderView *)self panoramaView];
  [(CAMViewfinderView *)self bounds];
  double v42 = v6;
  double v43 = v7;
  double v44 = v8;
  double v45 = v9;
  double v10 = *MEMORY[0x263F001A8];
  double v46 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v13 = *(double *)(MEMORY[0x263F00148] + 8);
  double v47 = *MEMORY[0x263F00148];
  unint64_t v14 = [(CAMViewfinderView *)self previewViewOrientation];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  double v15 = [(CAMViewfinderView *)self window];
  double v16 = [v15 screen];
  [v16 _referenceBounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v46;
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
      CGRect v26 = [(CAMViewfinderView *)self previewView];
      [v26 center];
      double v47 = v27;
      double v13 = v28;
      [v5 panoramaCaptureSize];
      +[CAMPanoramaUtilities panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:](CAMPanoramaUtilities, "panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:", a3);
      double v11 = v29;
      double v12 = v30;

      double v25 = 0.0;
      goto LABEL_8;
    case 1:
      [v5 panoramaCaptureSize];
      +[CAMPanoramaUtilities panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:](CAMPanoramaUtilities, "panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:", 1);
      double v40 = v32;
      double v41 = v31;
      if (v14 >= 3)
      {
        double v35 = v46;
        if (v14 - 3 < 2)
        {
          double v10 = v42;
          double v35 = v43;
          double v11 = v44;
          double v12 = v45;
        }
      }
      else
      {
        +[CAMPanoramaUtilities panoramaViewLayoutInsetsForLayoutStyle:referenceBounds:](CAMPanoramaUtilities, "panoramaViewLayoutInsetsForLayoutStyle:referenceBounds:", 1, v18, v20, v22, v24);
        double v10 = v42 + v33;
        double v35 = v43 + v34;
        double v11 = v44 - (v33 + v36);
        double v12 = v45 - (v34 + v37);
      }
      v52.origin.double x = v10;
      v52.origin.double y = v35;
      v52.size.double width = v11;
      v52.size.double height = v12;
      CGRectGetMidX(v52);
      UIRoundToViewScale();
      double v47 = v38;
      v53.origin.double x = v10;
      v53.origin.double y = v35;
      v53.size.double width = v11;
      v53.size.double height = v12;
      CGRectGetMidY(v53);
      UIRoundToViewScale();
      double v13 = v39;
      double v25 = 0.0;
      double v12 = v40;
      double v11 = v41;
LABEL_8:
      double v10 = 0.0;
      break;
    case 3:
      break;
    default:
      double v25 = v46;
      break;
  }
  objc_msgSend(v5, "setBounds:", v10, v25, v11, v12, *(void *)&v40, *(void *)&v41);
  objc_msgSend(v5, "setCenter:", v47, v13);
  v48[0] = v49;
  v48[1] = v50;
  v48[2] = v51;
  [v5 setTransform:v48];
}

- (CAMPanoramaView)panoramaView
{
  return self->_panoramaView;
}

- (int64_t)previewViewOrientation
{
  return self->_previewViewOrientation;
}

- (void)_layoutSnapshotsOfPreviewView
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  double v3 = [(CAMViewfinderView *)self previewView];
  double v4 = v3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  if (v3) {
    [v3 transform];
  }
  double v18 = v4;
  [(CAMViewfinderView *)self _previewContainerView];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v17 = v27 = 0u;
  id obj = [v17 subviews];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    double v8 = (long long *)MEMORY[0x263F001A8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          double v12 = [v11 snapshotView];
          uint64_t v13 = [v11 desiredAspectRatio];

          unint64_t v14 = [(CAMViewfinderView *)self visibilityDelegate];
          uint64_t v15 = [v14 shouldShiftPreviewForUtilityBar];

          long long v16 = v8[1];
          long long v22 = *v8;
          long long v23 = v16;
          long long v21 = *MEMORY[0x263F00148];
          [(CAMViewfinderView *)self _previewLayoutForAspectRatio:v13 shouldShiftPreviewForUtilityBar:v15 outPreviewBounds:&v22 outPreviewCenter:&v21 outFourThreeTopBarFrame:0 outBottomBarFrame:0];
          objc_msgSend(v12, "setBounds:", v22, v23);
          [v12 setCenter:v21];
          v20[0] = v28;
          v20[1] = v29;
          v20[2] = v30;
          [v12 setTransform:v20];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v6);
  }
}

- (void)_layoutLightingControlForLayoutStyle:(int64_t)a3
{
  uint64_t v5 = [(CAMViewfinderView *)self lightingControl];
  if (v5)
  {
    uint64_t v6 = [(CAMViewfinderView *)self bottomBar];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:a3])
    {
      double v13 = *MEMORY[0x263F001A8];
      double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
      [(CAMViewfinderView *)self bounds];
      objc_msgSend(v5, "sizeThatFits:", v15, v16);
      double v18 = v17;
      double v20 = v19;
      [(CAMViewfinderView *)self bounds];
      UIRectGetCenter();
      double v22 = v21;
      objc_msgSend(v5, "setBounds:", v13, v14, v18, v20);
      objc_msgSend(v5, "setCenter:", v20 * 0.5, v22);
      CGAffineTransformMakeRotation(&v30, 1.57079633);
      CGAffineTransform v29 = v30;
      [v5 setTransform:&v29];
    }
    else
    {
      [v5 contentHeightForWidth:v12];
      double v24 = v23;
      double v25 = v10 - v23;
      long long v26 = [(CAMViewfinderView *)self visibilityDelegate];
      int v27 = [v26 shouldShiftPreviewForUtilityBar];

      if (v27)
      {
        [v6 utilityBarExtensionDistance];
        double v25 = v25 - v28;
      }
      objc_msgSend(v5, "frameForAlignmentRect:", v8, v25, v12, v24);
      objc_msgSend(v5, "setFrame:");
    }
  }
}

- (void)_layoutDescriptionOverlayView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [(CAMViewfinderView *)self layoutStyle];
    if (!v5 || v5 == 4)
    {
      long long v12 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      long long v17 = *MEMORY[0x263F001A8];
      long long v18 = v12;
      long long v16 = *MEMORY[0x263F00148];
      [(CAMViewfinderView *)self _previewLayoutForAspectRatio:0 shouldShiftPreviewForUtilityBar:0 outPreviewBounds:&v17 outPreviewCenter:&v16 outFourThreeTopBarFrame:0 outBottomBarFrame:0];
      long long v13 = v18;
      double v14 = *(double *)&v16 - *(double *)&v18 * 0.5;
      double v15 = *((double *)&v16 + 1) - *((double *)&v18 + 1) * 0.5;
      [(CAMViewfinderView *)self bounds];
      objc_msgSend(v4, "setFrame:");
      objc_msgSend(v4, "setViewportFrame:", v14, v15, v13);
      double v10 = v4;
      uint64_t v11 = 1;
      goto LABEL_7;
    }
    if (v5 == 1)
    {
      [(CAMViewfinderView *)self bounds];
      double v7 = v6;
      [(CAMViewfinderView *)self bounds];
      double v9 = v8;
      objc_msgSend(v4, "setFrame:", 0.0, 0.0, v7);
      objc_msgSend(v4, "setViewportFrame:", 0.0, 0.0, v7, v9);
      double v10 = v4;
      uint64_t v11 = 0;
LABEL_7:
      [v10 setBlackoutFrameVisible:v11];
    }
  }
}

- (void)_layoutZoomSliderForLayoutStyle:(int64_t)a3
{
  id v7 = [(CAMViewfinderView *)self zoomSlider];
  int64_t v5 = [(CAMViewfinderView *)self bottomBar];
  double v6 = [(CAMViewfinderView *)self previewView];
  +[CAMZoomSliderUtilities layoutZoomSlider:v7 forLayoutStyle:a3 bottomBar:v5 previewView:v6 viewfinderView:self];
}

- (CAMZoomSlider)zoomSlider
{
  return self->_zoomSlider;
}

- (void)_layoutZoomControlForLayoutStyle:(int64_t)a3
{
  id v9 = [(CAMViewfinderView *)self zoomControl];
  [(CAMViewfinderView *)self bounds];
  if (a3 == 4)
  {
LABEL_4:
    double v6 = [(CAMViewfinderView *)self zoomControl];
    id v7 = [(CAMViewfinderView *)self bottomBar];
    double v8 = [(CAMViewfinderView *)self previewView];
    +[CAMZoomControlUtilities layoutZoomControl:v6 forLayoutStyle:a3 bottomBar:v7 previewView:v8];

    goto LABEL_6;
  }
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  +[CAMZoomControlUtilities layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:](CAMZoomControlUtilities, "layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:", v9, 1, 1, 375.0, 20.5, 0.0, 0.0, -82.5, v5 * 0.5);
LABEL_6:
}

- (CAMZoomControl)zoomControl
{
  return self->_zoomControl;
}

- (void)_layoutShutterButtonForLayoutStyle:(int64_t)a3
{
  id v4 = [(CAMViewfinderView *)self shutterButton];
  if (v4)
  {
    id v44 = v4;
    [(CAMViewfinderView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    long long v13 = [(CAMViewfinderView *)self window];
    unint64_t v14 = CAMInterfaceOrientationForWindow(v13) - 3;

    [v44 intrinsicContentSize];
    double v16 = v15;
    double v18 = v17;
    UIRectCenteredIntegralRectScale();
    double v41 = v22;
    double v42 = v21;
    if (v14 > 1)
    {
      double v43 = v19;
      v48.origin.double x = v6;
      v48.origin.double y = v8;
      v48.size.double width = v10;
      v48.size.double height = v12;
      double v40 = CGRectGetMaxY(v48) + -8.0 - v18;
      UIRectCenteredIntegralRectScale();
      double v29 = v30;
      CGFloat v26 = v31;
      CGFloat v28 = v32;
      v49.origin.double x = v6;
      v49.origin.double y = v8;
      v49.size.double width = v10;
      v49.size.double height = v12;
      double v24 = CGRectGetMaxY(v49) + -150.0;
    }
    else
    {
      v46.origin.double x = v6;
      double v40 = v20;
      v46.origin.double y = v8;
      v46.size.double width = v10;
      v46.size.double height = v12;
      double v43 = CGRectGetMaxX(v46) + -8.0 - v16;
      UIRectCenteredIntegralRectScale();
      double v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      v47.origin.double x = v6;
      v47.origin.double y = v8;
      v47.size.double width = v10;
      v47.size.double height = v12;
      double v29 = CGRectGetMaxX(v47) + -150.0;
    }
    v50.origin.double x = v29;
    v50.origin.double y = v24;
    v50.size.double width = v26;
    v50.size.double height = v28;
    double MaxY = CGRectGetMaxY(v50);
    v51.origin.double x = v43;
    v51.origin.double y = v40;
    v51.size.double width = v42;
    v51.size.double height = v41;
    double v39 = MaxY - CGRectGetMaxY(v51);
    v52.origin.double x = v43;
    v52.origin.double y = v40;
    v52.size.double width = v42;
    v52.size.double height = v41;
    double MinX = CGRectGetMinX(v52);
    v53.origin.double x = v29;
    v53.origin.double y = v24;
    v53.size.double width = v26;
    v53.size.double height = v28;
    double v37 = MinX - CGRectGetMinX(v53);
    v54.origin.double x = v43;
    v54.origin.double y = v40;
    v54.size.double width = v42;
    v54.size.double height = v41;
    double MinY = CGRectGetMinY(v54);
    v55.origin.double x = v29;
    v55.origin.double y = v24;
    v55.size.double width = v26;
    v55.size.double height = v28;
    double v34 = MinY - CGRectGetMinY(v55);
    v56.origin.double x = v29;
    v56.origin.double y = v24;
    v56.size.double width = v26;
    v56.size.double height = v28;
    double MaxX = CGRectGetMaxX(v56);
    v57.origin.double x = v43;
    v57.origin.double y = v40;
    v57.size.double width = v42;
    v57.size.double height = v41;
    objc_msgSend(v44, "setTappableEdgeInsets:", v34, v37, v39, MaxX - CGRectGetMaxX(v57), 0);
    objc_msgSend(v44, "frameForAlignmentRect:", v43, v40, v42, v41);
    objc_msgSend(v44, "setFrame:");
    id v4 = v44;
  }
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (void)_layoutFlipButtonForLayoutStyle:(int64_t)a3
{
  id v4 = [(CAMViewfinderView *)self flipButton];
  if (v4)
  {
    id v45 = v4;
    [(CAMViewfinderView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    long long v13 = [(CAMViewfinderView *)self window];
    unint64_t v14 = CAMInterfaceOrientationForWindow(v13) - 3;

    [v45 intrinsicContentSize];
    double v16 = v15;
    double v44 = v17;
    CGFloat v18 = v6;
    CGFloat v19 = v8;
    CGFloat v20 = v10;
    CGFloat v21 = v12;
    if (v14 > 1)
    {
      double v22 = CGRectGetMaxX(*(CGRect *)&v18) + -10.0 - v16;
      v49.origin.CGFloat x = v6;
      v49.origin.CGFloat y = v8;
      v49.size.double width = v10;
      v49.size.double height = v12;
      double MinY = CGRectGetMinY(v49);
      v50.origin.CGFloat x = v6;
      v50.origin.CGFloat y = v8;
      v50.size.double width = v10;
      v50.size.double height = v12;
      double MinX = CGRectGetMaxX(v50) + -70.0;
    }
    else
    {
      double v22 = CGRectGetMinX(*(CGRect *)&v18) + 10.0;
      v47.origin.CGFloat x = v6;
      v47.origin.CGFloat y = v8;
      v47.size.double width = v10;
      v47.size.double height = v12;
      double MinY = CGRectGetMinY(v47);
      v48.origin.CGFloat x = v6;
      v48.origin.CGFloat y = v8;
      v48.size.double width = v10;
      v48.size.double height = v12;
      double MinX = CGRectGetMinX(v48);
    }
    v51.origin.CGFloat x = v6;
    v51.origin.CGFloat y = v8;
    v51.size.double width = v10;
    v51.size.double height = v12;
    CGFloat v25 = CGRectGetMinY(v51);
    v52.origin.CGFloat x = MinX;
    v52.origin.CGFloat y = v25;
    v52.size.double width = 70.0;
    v52.size.double height = 70.0;
    double MaxY = CGRectGetMaxY(v52);
    v53.origin.CGFloat x = v22;
    v53.origin.CGFloat y = MinY + 10.0;
    v53.size.double width = v16;
    v53.size.double height = v44;
    double v43 = MaxY - CGRectGetMaxY(v53);
    v54.origin.CGFloat x = v22;
    v54.origin.CGFloat y = MinY + 10.0;
    v54.size.double width = v16;
    v54.size.double height = v44;
    double v27 = CGRectGetMinX(v54);
    v55.origin.CGFloat x = MinX;
    v55.origin.CGFloat y = v25;
    v55.size.double width = 70.0;
    v55.size.double height = 70.0;
    double v42 = v27 - CGRectGetMinX(v55);
    v56.origin.CGFloat x = v22;
    v56.origin.CGFloat y = MinY + 10.0;
    v56.size.double width = v16;
    v56.size.double height = v44;
    double v28 = CGRectGetMinY(v56);
    v57.origin.CGFloat x = MinX;
    v57.origin.CGFloat y = v25;
    v57.size.double width = 70.0;
    v57.size.double height = 70.0;
    double v29 = v28 - CGRectGetMinY(v57);
    v58.origin.CGFloat x = MinX;
    v58.origin.CGFloat y = v25;
    v58.size.double width = 70.0;
    v58.size.double height = 70.0;
    double MaxX = CGRectGetMaxX(v58);
    v59.origin.CGFloat x = v22;
    v59.origin.CGFloat y = MinY + 10.0;
    v59.size.double width = v16;
    v59.size.double height = v44;
    objc_msgSend(v45, "setTappableEdgeInsets:", v29, v42, v43, MaxX - CGRectGetMaxX(v59));
    objc_msgSend(v45, "frameForAlignmentRect:", v22, MinY + 10.0, v16, v44);
    CGFloat x = v60.origin.x;
    CGFloat y = v60.origin.y;
    double width = v60.size.width;
    double height = v60.size.height;
    double v35 = CGRectGetMinX(v60);
    v61.origin.CGFloat x = x;
    v61.origin.CGFloat y = y;
    v61.size.double width = width;
    v61.size.double height = height;
    CGRectGetWidth(v61);
    UIRoundToViewScale();
    double v37 = v35 + v36;
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.double width = width;
    v62.size.double height = height;
    double v38 = CGRectGetMinY(v62);
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.double width = width;
    v63.size.double height = height;
    CGRectGetHeight(v63);
    UIRoundToViewScale();
    double v40 = v38 + v39;
    objc_msgSend(v45, "setBounds:", 0.0, 0.0, width, height);
    objc_msgSend(v45, "setCenter:", v37, v40);
    double v41 = [(CAMViewfinderView *)self shutterButton];
    if (v41) {
      [(CAMViewfinderView *)self insertSubview:v45 aboveSubview:v41];
    }

    id v4 = v45;
  }
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (CAMDisabledModeOverlayView)disabledModeOverlayView
{
  return self->_disabledModeOverlayView;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v25.receiver = self;
  v25.super_class = (Class)CAMViewfinderView;
  double v7 = -[CAMViewfinderView hitTest:withEvent:](&v25, sel_hitTest_withEvent_, a4);
  CGFloat v8 = [(CAMViewfinderView *)self _previewContainerView];

  if (v7 == v8)
  {
    [(CAMViewfinderView *)self bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(CAMViewfinderView *)self _layoutMarginInsetsForLayoutStyle:[(CAMViewfinderView *)self layoutStyle]];
    CGFloat v18 = v12 + v17;
    CGFloat v21 = v14 - (v19 + v20);
    v28.size.double height = v16 - (v17 + v22);
    v28.origin.CGFloat x = v10 + v19;
    v28.origin.CGFloat y = v18;
    v28.size.double width = v21;
    v27.CGFloat x = x;
    v27.CGFloat y = y;
    if (!CGRectContainsPoint(v28, v27))
    {

      double v7 = 0;
    }
  }
  id v23 = v7;

  return v23;
}

- (CGRect)_frameForBadgeTrayForLayoutStyle:(int64_t)a3 orientation:(int64_t)a4
{
  double v7 = -[CAMViewfinderView _viewToLayoutBadgesBelowForLayoutStyle:orientation:](self, "_viewToLayoutBadgesBelowForLayoutStyle:orientation:");
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat rect = v14;
  long long v44 = 0u;
  long long v45 = 0u;
  double v15 = [(CAMViewfinderView *)self visibilityDelegate];
  uint64_t v16 = [v15 shouldShiftPreviewForUtilityBar];

  [(CAMViewfinderView *)self _previewLayoutForAspectRatio:[(CAMViewfinderView *)self desiredAspectRatio] shouldShiftPreviewForUtilityBar:v16 outPreviewBounds:0 outPreviewCenter:0 outFourThreeTopBarFrame:&v44 outBottomBarFrame:0];
  int64_t v17 = [(CAMViewfinderView *)self maskingAspectRatio];
  CGFloat v18 = [(CAMViewfinderView *)self bottomBar];
  [v18 frame];
  -[CAMViewfinderView _previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:](self, "_previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:", v17, v16, v44, v45, v19, v20, v21, v22);
  double v24 = v23;
  double v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  BOOL v31 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:a3];
  [(CAMViewfinderView *)self _badgeTrayHeightForLayoutStyle:a3];
  double v33 = v32;
  switch(a4)
  {
    case 0:
    case 1:
      goto LABEL_2;
    case 2:
      if (v31)
      {
        if (v7)
        {
          v48.origin.CGFloat x = v9;
          v48.origin.CGFloat y = v11;
          v48.size.double width = v13;
          v48.size.double height = rect;
          double MinY = CGRectGetMinY(v48);
        }
        else
        {
          v53.origin.CGFloat x = v24;
          v53.origin.CGFloat y = v26;
          v53.size.double width = v28;
          v53.size.double height = v30;
          double MinY = CGRectGetMaxY(v53);
        }
        double v26 = MinY - v33;
      }
      else
      {
LABEL_2:
        v46.origin.CGFloat x = v9;
        v46.origin.CGFloat y = v11;
        v46.size.double width = v13;
        v46.size.double height = rect;
        double MaxY = CGRectGetMaxY(v46);
        v47.origin.CGFloat x = v24;
        v47.origin.CGFloat y = v26;
        v47.size.double width = v28;
        v47.size.double height = v30;
        double v35 = CGRectGetMinY(v47) - v33;
        if (v35 >= MaxY) {
          double v26 = v35;
        }
        else {
          double v26 = MaxY;
        }
      }
      CGFloat v30 = v33;
      break;
    case 3:
      if (v7)
      {
        v49.origin.CGFloat x = v9;
        v49.origin.CGFloat y = v11;
        v49.size.double width = v13;
        v49.size.double height = rect;
        double MinX = CGRectGetMinX(v49);
      }
      else
      {
        v52.origin.CGFloat x = v24;
        v52.origin.CGFloat y = v26;
        v52.size.double width = v28;
        v52.size.double height = v30;
        double MinX = CGRectGetMaxX(v52);
      }
      double v24 = MinX - v33;
      goto LABEL_17;
    case 4:
      if (v7)
      {
        v50.origin.CGFloat x = v9;
        v50.origin.CGFloat y = v11;
        v50.size.double width = v13;
        v50.size.double height = rect;
        double MaxX = CGRectGetMaxX(v50);
      }
      else
      {
        v51.origin.CGFloat x = v24;
        v51.origin.CGFloat y = v26;
        v51.size.double width = v28;
        v51.size.double height = v30;
        double MaxX = CGRectGetMinX(v51);
      }
      double v24 = MaxX;
LABEL_17:
      CGFloat v28 = v33;
      break;
    default:
      break;
  }

  double v39 = v24;
  double v40 = v26;
  double v41 = v28;
  double v42 = v30;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.CGFloat y = v40;
  result.origin.CGFloat x = v39;
  return result;
}

- (id)_viewToLayoutBadgesBelowForLayoutStyle:(int64_t)a3 orientation:(int64_t)a4
{
  double v7 = [(CAMViewfinderView *)self visibilityDelegate];
  int v26 = [v7 shouldHideElapsedTimeView];
  char v24 = [v7 shouldHideTopBar];
  char v8 = [v7 shouldShiftPreviewForUtilityBar];
  int v9 = [v7 shouldHidePortraitModeInstructionLabel];
  int v10 = [v7 shouldHideQRCodeInstructionLabel];
  BOOL v25 = [(CAMViewfinderView *)self _shouldLayoutPortraitInstructionsAtTop];
  CGFloat v11 = [(CAMViewfinderView *)self topBar];
  double v12 = [(CAMViewfinderView *)self elapsedTimeView];
  if ((v9 & 1) != 0
    || ([(CAMViewfinderView *)self portraitModeInstructionLabel],
        CGFloat v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    if (v10)
    {
      double v14 = 0;
    }
    else
    {
      double v14 = [(CAMViewfinderView *)self qrCodeInstructionLabel];

      if (v14)
      {
        double v14 = [(CAMViewfinderView *)self qrCodeInstructionLabel];
        BOOL v25 = 1;
      }
    }
  }
  else
  {
    double v14 = [(CAMViewfinderView *)self portraitModeInstructionLabel];
  }
  if (a3)
  {
    if (a3 != 4) {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 1;
  }
  if ((unint64_t)a4 >= 3)
  {
    if ((unint64_t)(a4 - 3) > 1)
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      int v15 = ![(CAMViewfinderView *)self _isAdjustingTopBarOrientationForLayoutStyle:a3];
      char v8 = 1;
    }
  }
  else
  {
    LOBYTE(v15) = +[CAMBottomBar wantsVerticalBarForLayoutStyle:a3];
  }
  if ((v10 & v9 & 1) == 0)
  {
    BOOL v16 = v25;
    if (!v14) {
      BOOL v16 = 0;
    }
    char v17 = v16 & v8;
    CGFloat v18 = v14;
    if (v17) {
      goto LABEL_29;
    }
  }
  int v19 = v12 ? v26 : 1;
  CGFloat v18 = v12;
  if (v19 != 1) {
    goto LABEL_29;
  }
  char v20 = v24;
  if (!v11) {
    char v20 = 1;
  }
  char v21 = v20 | v15;
  CGFloat v18 = v11;
  if (v21) {
    id v22 = 0;
  }
  else {
LABEL_29:
  }
    id v22 = v18;

  return v22;
}

- (CAMElapsedTimeView)elapsedTimeView
{
  return self->_elapsedTimeView;
}

uint64_t __60__CAMViewfinderView__layoutBadgeTrayWithBadges_layoutStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CAMViewfinderOpenAndCloseTransition)_openAndCloseTransition
{
  return self->__openAndCloseTransition;
}

- (void)_setOpenAndCloseTransition:(id)a3
{
}

- (void)removeInflightBlurAnimations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [(CAMViewfinderView *)self _previewContainerView];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = objc_msgSend(v2, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 removeInflightBlurAnimations];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)prepareForResumingUsingCrossfade
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [(CAMViewfinderView *)self _previewContainerView];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = objc_msgSend(v2, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 prepareForResumingUsingCrossfade];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (CAMViewfinderView)initWithFrame:(CGRect)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMViewfinderView *)self initWithLayoutStyle:v5];
}

- (CAMViewfinderView)initWithCoder:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMViewfinderView *)self initWithLayoutStyle:v5];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v6 = [(CAMViewfinderView *)self desiredAspectRatio];
  -[CAMViewfinderView systemLayoutSizeFittingSize:forAspectRatio:](self, "systemLayoutSizeFittingSize:forAspectRatio:", v6, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 forAspectRatio:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  [(CAMViewfinderView *)self _multiplierForAspectRatio:a4];
  double v7 = [(CAMViewfinderView *)self window];
  int64_t v8 = CAMInterfaceOrientationForWindow(v7);

  if (width >= height) {
    double v9 = height;
  }
  else {
    double v9 = width;
  }
  UIRoundToViewScale();
  if ((unint64_t)(v8 - 3) >= 2) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  if ((unint64_t)(v8 - 3) < 2) {
    double v9 = v10;
  }
  if (v9 > width || v11 > height)
  {
    UIRoundToViewScale();
    double v9 = v13;
    UIRoundToViewScale();
    double v11 = v14;
  }
  double v15 = v9;
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMViewfinderView *)self _updateModernLayout];
    [(CAMViewfinderView *)self _updateBarExtensionViewsIfNecessary];
    [(CAMViewfinderView *)self setNeedsLayout];
  }
}

- (BOOL)_wantsPreviewOnlyLayoutForTopBarFrame:(CGRect)a3 bottomBarFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v8 = *MEMORY[0x263F001A8];
  CGFloat v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v23.origin.CGFloat x = *(CGFloat *)MEMORY[0x263F001A8];
  v23.origin.CGFloat y = v9;
  v23.size.CGFloat width = v10;
  v23.size.CGFloat height = v11;
  BOOL v12 = CGRectEqualToRect(a3, v23);
  if (v12)
  {
    CGFloat v13 = x;
    CGFloat v14 = y;
    CGFloat v15 = width;
    CGFloat v16 = height;
    uint64_t v17 = v8;
    CGFloat v18 = v9;
    CGFloat v19 = v10;
    CGFloat v20 = v11;
    LOBYTE(v12) = CGRectEqualToRect(*(CGRect *)&v13, *(CGRect *)&v17);
  }
  return v12;
}

- (void)_updateBarExtensionViewsIfNecessary
{
  int64_t v3 = [(CAMViewfinderView *)self layoutStyle];
  int64_t v4 = [(CAMViewfinderView *)self desiredAspectRatio];
  topBarExtensionView = self->__topBarExtensionView;
  if (v3 == 4 && v4 == 4)
  {
    if (topBarExtensionView) {
      return;
    }
    id v8 = objc_alloc(MEMORY[0x263F82E00]);
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    CGFloat v13 = (UIView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
    CGFloat v14 = self->__topBarExtensionView;
    self->__topBarExtensionView = v13;

    CGFloat v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v9, v10, v11, v12);
    bottomBarExtensionView = self->__bottomBarExtensionView;
    self->__bottomBarExtensionView = v15;

    uint64_t v17 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
    [(UIView *)self->__topBarExtensionView setBackgroundColor:v17];
    [(UIView *)self->__bottomBarExtensionView setBackgroundColor:v17];
    [(CAMViewfinderView *)self addSubview:self->__topBarExtensionView];
    [(CAMViewfinderView *)self addSubview:self->__bottomBarExtensionView];
    double v7 = v17;
  }
  else
  {
    [(UIView *)topBarExtensionView removeFromSuperview];
    int64_t v6 = self->__topBarExtensionView;
    self->__topBarExtensionView = 0;

    [(UIView *)self->__bottomBarExtensionView removeFromSuperview];
    double v7 = self->__bottomBarExtensionView;
    self->__bottomBarExtensionView = 0;
  }
}

void __52__CAMViewfinderView_setMaskingAspectRatio_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _previewContainerMaskingView];
  [v2 setClipsToBounds:1];
  [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateModernLayout
{
  [(CAMViewfinderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CAMViewfinderView *)self layoutStyle];
  double v12 = [(CAMViewfinderView *)self topBar];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  char v21 = [(CAMViewfinderView *)self bottomBar];
  [v21 frame];
  BOOL v26 = -[CAMViewfinderView _wantsPreviewOnlyLayoutForTopBarFrame:bottomBarFrame:](self, "_wantsPreviewOnlyLayoutForTopBarFrame:bottomBarFrame:", v14, v16, v18, v20, v22, v23, v24, v25);

  if (!v26
    && (v11 == 4 && v8 < 350.0
     || (+[CAMCaptureCapabilities capabilities],
         double v27 = objc_claimAutoreleasedReturnValue(),
         int v28 = [v27 imagePickerUsesModernLayout],
         v27,
         v28)))
  {
    CAMShutterButtonSpecForLayoutStyle(v11, (uint64_t)v33);
    double v29 = v33[0];
    CGFloat v30 = [(CAMViewfinderView *)self _modernLayout];
    BOOL v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "setShutterIntrinsicSize:", v29, v29);
      objc_msgSend(v31, "setReferenceBounds:", v4, v6, v8, v10);
    }
    else
    {
      double v32 = -[CAMFullscreenViewfinderLayout initWithReferenceBounds:shutterIntrinsicSize:]([CAMFullscreenViewfinderLayout alloc], "initWithReferenceBounds:shutterIntrinsicSize:", v4, v6, v8, v10, v29, v29);
      [(CAMViewfinderView *)self _setModernLayout:v32];
    }
  }
  else
  {
    [(CAMViewfinderView *)self _setModernLayout:0];
  }
}

- (void)_layoutVideoConfigurationStatusIndicatorForLayoutStyle:(int64_t)a3
{
  if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:a3])
  {
    id v19 = [(CAMViewfinderView *)self videoConfigurationStatusIndicator];
    double v4 = [(CAMViewfinderView *)self elapsedTimeView];
    [v4 frame];
    objc_msgSend(v4, "alignmentRectForFrame:");
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v19 intrinsicContentSize];
    double v14 = v13;
    double v16 = v15;
    v21.origin.CGFloat x = v6;
    v21.origin.CGFloat y = v8;
    v21.size.CGFloat width = v10;
    v21.size.CGFloat height = v12;
    CGFloat v17 = CGRectGetMaxX(v21) + 16.0;
    v22.origin.CGFloat x = v6;
    v22.origin.CGFloat y = v8;
    v22.size.CGFloat width = v10;
    v22.size.CGFloat height = v12;
    CGRectGetMidY(v22);
    UIRoundToViewScale();
    objc_msgSend(v19, "frameForAlignmentRect:", v17, v18 + CAMPixelWidthForView(self), v14, v16);
    objc_msgSend(v19, "setFrame:");
  }
}

- (void)_layoutImageAnalysisInstructionLabelForLayoutStyle:(int64_t)a3
{
  id v5 = [(CAMViewfinderView *)self imageAnalysisInstructionLabel];
  [v5 setStyle:1];
  [(CAMViewfinderView *)self _layoutInstructionLabelOnTop:v5 forLayoutStyle:a3];
}

void __96__CAMViewfinderView__layoutBadgeTrayForLayoutStyle_appearingBadges_disappearingBadges_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v6++) setAlpha:0.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "setAlpha:", 1.0, (void)v13);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v9);
  }

  CGFloat v12 = [*(id *)(a1 + 48) visibleTopBadges];
  [*(id *)(a1 + 48) _layoutBadgeTrayWithBadges:v12 layoutStyle:*(void *)(a1 + 56)];
}

- (void)_layoutBadgeForTinyLayoutStyle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CAMViewfinderView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v16 = v15;
  double v18 = v17;
  UIRoundToViewScale();
  double v20 = v19;
  UIRoundToViewScale();
  double v22 = v21;
  double v37 = 0.0;
  double v38 = 0.0;
  double v39 = v16;
  double v40 = v18;
  long long v36 = *MEMORY[0x263F00148];
  uint64_t v23 = [(CAMViewfinderView *)self window];
  unint64_t v24 = CAMInterfaceOrientationForWindow(v23);

  if (v24 >= 3)
  {
    if (v24 - 3 >= 2) {
      goto LABEL_6;
    }
    v43.origin.CGFloat x = v8;
    v43.origin.CGFloat y = v10;
    v43.size.CGFloat width = v12;
    v43.size.CGFloat height = v14;
    *(double *)&long long v36 = v20 + CGRectGetMinX(v43) + 10.0;
    v44.origin.CGFloat x = v8;
    v44.origin.CGFloat y = v10;
    v44.size.CGFloat width = v12;
    v44.size.CGFloat height = v14;
    double v25 = CGRectGetMaxY(v44) - v22 + -10.0;
  }
  else
  {
    v41.origin.CGFloat x = v8;
    v41.origin.CGFloat y = v10;
    v41.size.CGFloat width = v12;
    v41.size.CGFloat height = v14;
    *(double *)&long long v36 = v20 + CGRectGetMinX(v41) + 10.0;
    v42.origin.CGFloat x = v8;
    v42.origin.CGFloat y = v10;
    v42.size.CGFloat width = v12;
    v42.size.CGFloat height = v14;
    double v25 = v22 + CGRectGetMinY(v42) + 10.0;
  }
  *((double *)&v36 + 1) = v25;
LABEL_6:
  +[CAMView ceilBounds:&v37 andRoundCenter:&v36 toViewScale:self];
  objc_msgSend(v6, "setBounds:", v37, v38, v39, v40);
  [v6 setCenter:v36];
  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v35[0] = *MEMORY[0x263F000D0];
  v35[1] = v26;
  v35[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v6 setTransform:v35];
  double v27 = [(CAMViewfinderView *)self visibleTopBadges];
  int v28 = [v27 containsObject:v6];
  double v29 = 1.0;
  if (!v28) {
    double v29 = 0.0;
  }
  v32[1] = 3221225472;
  v32[0] = MEMORY[0x263EF8330];
  v32[2] = __61__CAMViewfinderView__layoutBadgeForTinyLayoutStyle_animated___block_invoke;
  v32[3] = &unk_263FA04E0;
  if (v4) {
    double v30 = 0.25;
  }
  else {
    double v30 = 0.0;
  }
  id v33 = v6;
  double v34 = v29;
  id v31 = v6;
  +[CAMView animateIfNeededWithDuration:v32 animations:v30];
}

uint64_t __61__CAMViewfinderView__layoutBadgeForTinyLayoutStyle_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_layoutTextInteractionInsertAndActionInfoView
{
  rect_24 = [(CAMViewfinderView *)self textInteractionInsert];
  if (rect_24)
  {
    uint64_t v3 = [(CAMViewfinderView *)self previewView];
    BOOL v4 = [v3 videoPreviewLayer];

    objc_msgSend(v4, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [(CAMViewfinderView *)self layer];
    objc_msgSend(v13, "convertRect:fromLayer:", v4, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    objc_msgSend(rect_24, "setFrame:", v15, v17, v19, v21);
    [(CAMViewfinderView *)self bounds];
    CGFloat v23 = v22;
    CGFloat v51 = v24;
    CGFloat rect = v22;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    v55.origin.CGFloat x = v15;
    v55.origin.CGFloat y = v17;
    v55.size.CGFloat width = v19;
    v55.size.CGFloat height = v21;
    CGRectGetMaxX(v55);
    v56.origin.CGFloat x = v23;
    v56.origin.CGFloat y = v51;
    v56.size.CGFloat width = v26;
    v56.size.CGFloat height = v28;
    CGRectGetMaxX(v56);
    v57.origin.CGFloat x = v15;
    v57.origin.CGFloat y = v17;
    v57.size.CGFloat width = v19;
    v57.size.CGFloat height = v21;
    CGRectGetMaxY(v57);
    v58.origin.CGFloat x = rect;
    v58.origin.CGFloat y = v51;
    v58.size.CGFloat width = v26;
    v58.size.CGFloat height = v28;
    CGRectGetMaxY(v58);
    UIEdgeInsetsMakeWithEdges();
    UIEdgeInsetsAdd();
    UIEdgeInsetsMax();
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v37 = [(CAMViewfinderView *)self bottomBar];
    [v37 frame];
    double v39 = v36 + v38;

    double v40 = [(CAMViewfinderView *)self bottomBar];
    CGRect v41 = [v40 imageAnalysisButton];
    [v41 backgroundDiameter];
    double v43 = v42;

    [rect_24 setPreferredQuickActionButtonHeight:v43];
    CGRect v44 = [rect_24 actionInfoView];
    if (v44)
    {
      [rect_24 bounds];
      v59.origin.CGFloat y = v30 + v45;
      v59.size.CGFloat height = v46 - (v30 + v34);
      v59.origin.CGFloat x = v32 + v47;
      v59.size.CGFloat width = v48 - (v32 + v39);
      objc_msgSend(v44, "setFrame:", v59.origin.x, CGRectGetMaxY(v59) - v43, v59.size.width, v43);
    }
    CGRect v49 = [(CAMViewfinderView *)self imageAnalysisInstructionLabel];
    [v49 frame];
    double v50 = v30 + CGRectGetMaxY(v60);

    objc_msgSend(rect_24, "setContentInsets:", v50, v32, v34 + v43, v39);
  }
}

- (void)_layoutMachineReadableCodeButton
{
  id v3 = [(CAMViewfinderView *)self machineReadableCodeButton];
  [(CAMViewfinderView *)self _layoutBottomCenteredView:v3 aboveView:0 aboveViewSpacing:1 forLayoutStyle:0.0];
}

uint64_t __35__CAMViewfinderView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutDescriptionOverlayView:");
}

- (void)_previewLayoutForAspectRatio:(int64_t)a3 shouldShiftPreviewForUtilityBar:(BOOL)a4 outPreviewBounds:(CGRect *)a5 outPreviewCenter:(CGPoint *)a6 outFourThreeTopBarFrame:(CGRect *)a7 outBottomBarFrame:(CGRect *)a8
{
  BOOL v12 = a4;
  double v15 = [(CAMViewfinderView *)self _modernLayout];

  if (v15)
  {
    BOOL v16 = a3 != 3 && v12;
    uint64_t v17 = [(CAMViewfinderView *)self useCreativeControls] & !v12;
    double v18 = [(CAMViewfinderView *)self _modernLayout];
    [v18 viewportFrameForAspectRatio:a3 usingAppDrawer:v17 accessoryAreaExpanded:v16];
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    if (a5)
    {
      a5->size.CGFloat width = v20;
      a5->size.CGFloat height = v22;
      a5->origin = (CGPoint)*MEMORY[0x263F00148];
    }
    if (a6)
    {
      UIRectGetCenter();
      a6->CGFloat x = v23;
      a6->CGFloat y = v24;
    }
    if (a7)
    {
      double v25 = [(CAMViewfinderView *)self _modernLayout];
      [v25 frameForControlStatusBar];
      a7->origin.CGFloat x = v26;
      a7->origin.CGFloat y = v27;
      a7->size.CGFloat width = v28;
      a7->size.CGFloat height = v29;
    }
    if (a8)
    {
      double v30 = [(CAMViewfinderView *)self _modernLayout];
      objc_msgSend(v30, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMViewfinderView useCreativeControls](self, "useCreativeControls"), 0);
      double MaxY = CGRectGetMaxY(v64);

      double v32 = [(CAMViewfinderView *)self _modernLayout];
      objc_msgSend(v32, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMViewfinderView useCreativeControls](self, "useCreativeControls"), 0);
      double v33 = CGRectGetMaxY(v65);

      a8->origin.CGFloat x = 0.0;
      a8->origin.CGFloat y = MaxY;
      [(CAMViewfinderView *)self bounds];
      a8->size.CGFloat width = v34;
      a8->size.CGFloat height = v33 - MaxY;
    }
  }
  else if ([(CAMViewfinderView *)self useCreativeControls])
  {
    [(CAMViewfinderView *)self bounds];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    [(CAMViewfinderView *)self _previewSizeForAspectRatio:a3];
    objc_msgSend(MEMORY[0x263F5E478], "cameraContentGeometryForReferenceBounds:forContentSize:withOrientation:shouldShiftPreviewForUtilityBar:", -[CAMViewfinderView orientation](self, "orientation", 0, 0), v12, v36, v38, v40, v42, v43, v44);
    objc_msgSend(MEMORY[0x263F5E478], "cameraTopBarFrameForReferenceBounds:", v36, v38, v40, v42);
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    objc_msgSend(MEMORY[0x263F5E478], "cameraBottomBarFrameForReferenceBounds:", v36, v38, v40, v42);
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    CGFloat v60 = v59;
    if (a5)
    {
      a5->origin.CGFloat x = 0.0;
      a5->origin.CGFloat y = 0.0;
      a5->size.CGFloat width = fmin(0.0, 0.0);
      a5->size.CGFloat height = fmax(0.0, 0.0);
    }
    if (a6)
    {
      [(CAMViewfinderView *)self _previewOffset];
      a6->CGFloat x = v61 + 0.0;
      a6->CGFloat y = v62 + 0.0;
    }
    if (a7)
    {
      a7->origin.CGFloat x = v46;
      a7->origin.CGFloat y = v48;
      a7->size.CGFloat width = v50;
      a7->size.CGFloat height = v52;
    }
    if (a8)
    {
      a8->origin.CGFloat x = v54;
      a8->origin.CGFloat y = v56;
      a8->size.CGFloat width = v58;
      a8->size.CGFloat height = v60;
    }
  }
  else
  {
    [(CAMViewfinderView *)self _cameraAppPreviewLayoutForAspectRatio:a3 shouldShiftPreviewForUtilityBar:v12 outPreviewBounds:a5 outPreviewCenter:a6 outFourThreeTopBarFrame:a7 outBottomBarFrame:a8];
  }
}

- (void)_cameraAppPreviewLayoutForAspectRatio:(int64_t)a3 shouldShiftPreviewForUtilityBar:(BOOL)a4 outPreviewBounds:(CGRect *)a5 outPreviewCenter:(CGPoint *)a6 outFourThreeTopBarFrame:(CGRect *)a7 outBottomBarFrame:(CGRect *)a8
{
  BOOL v12 = a4;
  [(CAMViewfinderView *)self bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  int64_t v23 = [(CAMViewfinderView *)self layoutStyle];
  [(CAMViewfinderView *)self _layoutMarginInsetsForLayoutStyle:v23];
  double v25 = v16 + v24;
  double v27 = v18 + v26;
  double v29 = v20 - (v24 + v28);
  double v31 = v22 - (v26 + v30);
  v82.origin.CGFloat x = v25;
  v82.origin.CGFloat y = v27;
  v82.size.CGFloat width = v29;
  v82.size.CGFloat height = v31;
  CGFloat Width = CGRectGetWidth(v82);
  v83.origin.CGFloat x = v25;
  v83.origin.CGFloat y = v27;
  v83.size.CGFloat width = v29;
  v83.size.CGFloat height = v31;
  double Height = CGRectGetHeight(v83);
  id v80 = [(CAMViewfinderView *)self topBar];
  [(CAMViewfinderView *)self _previewSizeForAspectRatio:0];
  double v72 = v34;
  double v74 = Width;
  double v36 = v35;
  if (v80)
  {
    [(CAMViewfinderView *)self _topBarSizeForLayoutStyle:v23];
    double v38 = v37;
    double v40 = v39;
    v84.origin.CGFloat x = v25;
    v84.origin.CGFloat y = v27;
    v84.size.CGFloat width = v29;
    v84.size.CGFloat height = v31;
    double MinY = CGRectGetMinY(v84);
    v85.origin.CGFloat x = v25;
    v85.origin.CGFloat y = v27;
    v85.size.CGFloat width = v29;
    v85.size.CGFloat height = v31;
    double v77 = v38;
    double MinX = CGRectGetMinX(v85);
    double v76 = v40;
  }
  else
  {
    double v38 = *MEMORY[0x263F001B0];
    double v40 = *(double *)(MEMORY[0x263F001B0] + 8);
    v86.origin.CGFloat x = v25;
    v86.origin.CGFloat y = v27;
    v86.size.CGFloat width = v29;
    v86.size.CGFloat height = v31;
    CGRectGetMinY(v86);
    double MinX = *MEMORY[0x263F001A8];
    double MinY = *(double *)(MEMORY[0x263F001A8] + 8);
    double v76 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v77 = *(double *)(MEMORY[0x263F001A8] + 16);
  }
  double v41 = [(CAMViewfinderView *)self bottomBar];
  if (v41)
  {
    -[CAMViewfinderView _bottomBarSizeForLayoutStyle:withProposedSize:](self, "_bottomBarSizeForLayoutStyle:withProposedSize:", v23, v74 - (v72 + v38), Height - (v36 + v40));
    double v43 = v42;
    double v45 = v44;
    v87.origin.CGFloat x = v25;
    v87.origin.CGFloat y = v27;
    v87.size.CGFloat width = v29;
    v87.size.CGFloat height = v31;
    double MaxY = CGRectGetMaxY(v87);
    v88.origin.CGFloat x = v25;
    v88.origin.CGFloat y = v27;
    double v47 = v43;
    v88.size.CGFloat width = v29;
    v88.size.CGFloat height = v31;
    double v48 = CGRectGetMaxX(v88) - v43;
    double v49 = MaxY - v45;
    double v50 = v45;
  }
  else
  {
    v89.origin.CGFloat x = v25;
    v89.origin.CGFloat y = v27;
    v89.size.CGFloat width = v29;
    v89.size.CGFloat height = v31;
    CGRectGetMaxY(v89);
    double v48 = *MEMORY[0x263F001A8];
    double v49 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v47 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v50 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  [(CAMViewfinderView *)self _previewSizeForAspectRatio:a3];
  CGFloat v73 = v49;
  double v75 = v51;
  double v53 = v52;
  CGFloat v54 = v48;
  double v55 = v49;
  CGFloat v56 = v47;
  CGFloat v57 = v50;
  -[CAMViewfinderView _previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:](self, "_previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:", a3, v12, MinX, MinY, v77, v76, v48, v55, v47, v50);
  CGFloat x = v90.origin.x;
  CGFloat y = v90.origin.y;
  CGFloat v60 = v90.size.width;
  CGFloat v61 = v90.size.height;
  double MidX = CGRectGetMidX(v90);
  v91.origin.CGFloat x = x;
  v91.origin.CGFloat y = y;
  v91.size.CGFloat width = v60;
  v91.size.CGFloat height = v61;
  double MidY = CGRectGetMidY(v91);
  if (![(CAMViewfinderView *)self _wantsInterfaceOrientedPreviewForLayoutStyle:v23])
  {
    double v68 = v75;
    if (!a5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  CGRect v63 = [(CAMViewfinderView *)self window];
  int64_t v64 = CAMInterfaceOrientationForWindow(v63);

  CGRect v65 = [(CAMViewfinderView *)self window];
  double v66 = [v65 screen];
  char v67 = [v66 _isEmbeddedScreen];

  if ((v67 & 1) == 0) {
    int64_t v64 = [(CAMViewfinderView *)self externalDisplayPreviewOrientation];
  }
  if ((unint64_t)(v64 - 3) >= 2) {
    double v68 = v75;
  }
  else {
    double v68 = v53;
  }
  if ((unint64_t)(v64 - 3) < 2) {
    double v53 = v75;
  }
  if (a5)
  {
LABEL_18:
    a5->origin.CGFloat x = 0.0;
    a5->origin.CGFloat y = 0.0;
    a5->size.CGFloat width = v68;
    a5->size.CGFloat height = v53;
  }
LABEL_19:
  if (a6)
  {
    [(CAMViewfinderView *)self _previewOffset];
    a6->CGFloat x = MidX + v69;
    a6->CGFloat y = MidY + v70;
  }
  if (a7)
  {
    a7->origin.CGFloat x = MinX;
    a7->origin.CGFloat y = MinY;
    a7->size.CGFloat width = v77;
    a7->size.CGFloat height = v76;
  }
  if (a8)
  {
    a8->origin.CGFloat x = v54;
    a8->origin.CGFloat y = v73;
    a8->size.CGFloat width = v56;
    a8->size.CGFloat height = v57;
  }
}

- (UIOffset)_previewOffset
{
  int64_t v3 = [(CAMViewfinderView *)self layoutStyle];
  double v5 = *MEMORY[0x263F838D8];
  double v4 = *(double *)(MEMORY[0x263F838D8] + 8);
  if (v3 == 1)
  {
    double v6 = [(CAMViewfinderView *)self window];
    int64_t v7 = CAMInterfaceOrientationForWindow(v6);

    unint64_t v8 = v7 - 1;
    double v9 = [(CAMViewfinderView *)self window];
    double v10 = [v9 screen];
    [v10 _referenceBounds];
    double v12 = v11;
    double v14 = v13;

    if (v14 == 0.0) {
      double v15 = 1.0;
    }
    else {
      double v15 = v12 / v14;
    }
    double v16 = [(CAMViewfinderView *)self previewView];
    double v17 = [v16 videoPreviewView];
    uint64_t v18 = [v17 previewViewAspectMode];

    double v19 = -15.0;
    if (v8 >= 2) {
      double v19 = v5;
    }
    if (v15 != 0.75 && v18 == 1) {
      double v5 = v19;
    }
  }
  double v21 = v5;
  double v22 = v4;
  result.vertical = v22;
  result.horizontal = v21;
  return result;
}

- (double)_utilityBarExtensionDistanceForLayoutStyle:(int64_t)a3
{
  if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:a3])
  {
    return 110.0;
  }
  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  CGPoint v9 = (CGPoint)*MEMORY[0x263F001A8];
  CGSize v10 = v5;
  long long v6 = *MEMORY[0x263F00148];
  v7.size = v5;
  long long v8 = v6;
  v7.origin = v9;
  [(CAMViewfinderView *)self _previewLayoutForAspectRatio:[(CAMViewfinderView *)self desiredAspectRatio] shouldShiftPreviewForUtilityBar:1 outPreviewBounds:&v9 outPreviewCenter:&v8 outFourThreeTopBarFrame:0 outBottomBarFrame:&v7];
  return CGRectGetMinY(v7) - (*((double *)&v8 + 1) + v10.height * 0.5);
}

- (void)setDisabledModeOverlayView:(id)a3
{
  CGSize v5 = (CAMDisabledModeOverlayView *)a3;
  disabledModeOverlayView = self->_disabledModeOverlayView;
  long long v8 = v5;
  if (disabledModeOverlayView != v5)
  {
    [(CAMDisabledModeOverlayView *)disabledModeOverlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_disabledModeOverlayView, a3);
    CGRect v7 = [(CAMViewfinderView *)self _previewContainerMaskingView];
    [v7 addSubview:v8];
    [(CAMViewfinderView *)self setNeedsLayout];
  }
}

- (void)setElapsedTimeView:(id)a3
{
  CGSize v5 = (CAMElapsedTimeView *)a3;
  elapsedTimeView = self->_elapsedTimeView;
  CGRect v7 = v5;
  if (elapsedTimeView != v5)
  {
    [(CAMElapsedTimeView *)elapsedTimeView removeFromSuperview];
    objc_storeStrong((id *)&self->_elapsedTimeView, a3);
    [(CAMViewfinderView *)self addSubview:v7];
  }
}

- (void)setVideoConfigurationStatusIndicator:(id)a3
{
  CGSize v5 = (CAMVideoConfigurationStatusIndicator *)a3;
  p_videoConfigurationStatusIndicator = &self->_videoConfigurationStatusIndicator;
  videoConfigurationStatusIndicator = self->_videoConfigurationStatusIndicator;
  if (videoConfigurationStatusIndicator != v5)
  {
    CGSize v10 = v5;
    long long v8 = [(CAMVideoConfigurationStatusIndicator *)videoConfigurationStatusIndicator superview];

    if (v8 == self) {
      [(CAMVideoConfigurationStatusIndicator *)*p_videoConfigurationStatusIndicator removeFromSuperview];
    }
    CGPoint v9 = [(CAMControlStatusIndicator *)*p_videoConfigurationStatusIndicator delegate];

    if (v9 == self) {
      [(CAMControlStatusIndicator *)*p_videoConfigurationStatusIndicator setDelegate:0];
    }
    objc_storeStrong((id *)&self->_videoConfigurationStatusIndicator, a3);
    [(CAMControlStatusIndicator *)*p_videoConfigurationStatusIndicator setDelegate:self];
    videoConfigurationStatusIndicator = (CAMVideoConfigurationStatusIndicator *)[(CAMViewfinderView *)self addSubview:*p_videoConfigurationStatusIndicator];
    CGSize v5 = v10;
  }
  MEMORY[0x270F9A758](videoConfigurationStatusIndicator, v5);
}

- (void)setLivePhotoBadge:(id)a3
{
  CGSize v5 = (CAMLivePhotoBadge *)a3;
  p_livePhotoBadge = &self->_livePhotoBadge;
  livePhotoBadge = self->_livePhotoBadge;
  if (livePhotoBadge != v5)
  {
    double v11 = v5;
    [(CAMLivePhotoBadge *)livePhotoBadge removeFromSuperview];
    long long v8 = [(CEKBadgeView *)*p_livePhotoBadge delegate];

    if (v8 == self) {
      [(CEKBadgeView *)*p_livePhotoBadge setDelegate:0];
    }
    [(CAMLivePhotoBadge *)*p_livePhotoBadge setAlpha:1.0];
    objc_storeStrong((id *)&self->_livePhotoBadge, a3);
    [(CEKBadgeView *)*p_livePhotoBadge setDelegate:self];
    CGPoint v9 = [(CAMViewfinderView *)self visibleTopBadges];
    char v10 = [v9 containsObject:*p_livePhotoBadge];

    if ((v10 & 1) == 0) {
      [(CAMLivePhotoBadge *)*p_livePhotoBadge setAlpha:0.0];
    }
    livePhotoBadge = (CAMLivePhotoBadge *)[(CAMViewfinderView *)self addSubview:v11];
    CGSize v5 = v11;
  }
  MEMORY[0x270F9A758](livePhotoBadge, v5);
}

- (void)setShallowDepthOfFieldBadge:(id)a3
{
  CGSize v5 = (CAMShallowDepthOfFieldBadge *)a3;
  p_shallowDepthOfFieldBadge = &self->_shallowDepthOfFieldBadge;
  shallowDepthOfFieldBadge = self->_shallowDepthOfFieldBadge;
  if (shallowDepthOfFieldBadge != v5)
  {
    char v10 = v5;
    [(CAMShallowDepthOfFieldBadge *)shallowDepthOfFieldBadge removeFromSuperview];
    [(CAMShallowDepthOfFieldBadge *)*p_shallowDepthOfFieldBadge setAlpha:1.0];
    objc_storeStrong((id *)&self->_shallowDepthOfFieldBadge, a3);
    long long v8 = [(CAMViewfinderView *)self visibleTopBadges];
    char v9 = [v8 containsObject:*p_shallowDepthOfFieldBadge];

    if ((v9 & 1) == 0) {
      [(CAMShallowDepthOfFieldBadge *)*p_shallowDepthOfFieldBadge setAlpha:0.0];
    }
    shallowDepthOfFieldBadge = (CAMShallowDepthOfFieldBadge *)[(CAMViewfinderView *)self addSubview:v10];
    CGSize v5 = v10;
  }
  MEMORY[0x270F9A758](shallowDepthOfFieldBadge, v5);
}

- (void)setPortraitModeInstructionLabel:(id)a3
{
  CGSize v5 = (CAMPortraitModeInstructionLabel *)a3;
  p_portraitModeInstructionLabel = &self->_portraitModeInstructionLabel;
  portraitModeInstructionLabel = self->_portraitModeInstructionLabel;
  if (portraitModeInstructionLabel != v5)
  {
    char v9 = v5;
    [(CAMPortraitModeInstructionLabel *)portraitModeInstructionLabel removeFromSuperview];
    long long v8 = [(CAMInstructionLabel *)*p_portraitModeInstructionLabel delegate];

    if (v8 == self) {
      [(CAMInstructionLabel *)*p_portraitModeInstructionLabel setDelegate:0];
    }
    objc_storeStrong((id *)&self->_portraitModeInstructionLabel, a3);
    [(CAMInstructionLabel *)*p_portraitModeInstructionLabel setDelegate:self];
    portraitModeInstructionLabel = (CAMPortraitModeInstructionLabel *)[(CAMViewfinderView *)self addSubview:v9];
    CGSize v5 = v9;
  }
  MEMORY[0x270F9A758](portraitModeInstructionLabel, v5);
}

- (void)setSharedLibraryBadge:(id)a3
{
  CGSize v5 = (CAMSharedLibraryBadge *)a3;
  p_sharedLibraryBadge = &self->_sharedLibraryBadge;
  sharedLibraryBadge = self->_sharedLibraryBadge;
  if (sharedLibraryBadge != v5)
  {
    double v11 = v5;
    [(CAMSharedLibraryBadge *)sharedLibraryBadge removeFromSuperview];
    long long v8 = [(CEKBadgeView *)*p_sharedLibraryBadge delegate];

    if (v8 == self) {
      [(CEKBadgeView *)*p_sharedLibraryBadge setDelegate:0];
    }
    [(CAMSharedLibraryBadge *)*p_sharedLibraryBadge setAlpha:1.0];
    objc_storeStrong((id *)&self->_sharedLibraryBadge, a3);
    [(CEKBadgeView *)*p_sharedLibraryBadge setDelegate:self];
    char v9 = [(CAMViewfinderView *)self visibleTopBadges];
    char v10 = [v9 containsObject:*p_sharedLibraryBadge];

    if ((v10 & 1) == 0) {
      [(CAMSharedLibraryBadge *)*p_sharedLibraryBadge setAlpha:0.0];
    }
    sharedLibraryBadge = (CAMSharedLibraryBadge *)[(CAMViewfinderView *)self addSubview:v11];
    CGSize v5 = v11;
  }
  MEMORY[0x270F9A758](sharedLibraryBadge, v5);
}

- (void)setDescriptionOverlayView:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  CGRect v7 = [(CAMViewfinderView *)self _descriptionOverlayViewByKey];
  id v8 = [v7 objectForKeyedSubscript:v6];
  if (v8 != v11)
  {
    char v9 = [v8 superview];

    if (v9 == self) {
      [v8 removeFromSuperview];
    }
    [v7 setObject:v11 forKeyedSubscript:v6];
    objc_msgSend(v11, "setOrientation:", -[CAMViewfinderView orientation](self, "orientation"));
    char v10 = [(CAMViewfinderView *)self _previewContainerMaskingView];
    [(CAMViewfinderView *)self insertSubview:v11 above:v10];
  }
}

- (id)descriptionOverlayViewForKey:(id)a3
{
  id v4 = a3;
  CGSize v5 = [(CAMViewfinderView *)self _descriptionOverlayViewByKey];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setFilterNameBadge:(id)a3
{
  CGSize v5 = (CAMFilterNameBadge *)a3;
  p_filterNameBadge = &self->_filterNameBadge;
  filterNameBadge = self->_filterNameBadge;
  if (filterNameBadge != v5)
  {
    char v9 = v5;
    id v8 = [(CEKBadgeView *)filterNameBadge delegate];

    if (v8 == self) {
      [(CEKBadgeView *)*p_filterNameBadge setDelegate:0];
    }
    [(CAMFilterNameBadge *)*p_filterNameBadge removeFromSuperview];
    objc_storeStrong((id *)&self->_filterNameBadge, a3);
    [(CEKBadgeView *)*p_filterNameBadge setDelegate:self];
    filterNameBadge = (CAMFilterNameBadge *)[(CAMViewfinderView *)self addSubview:v9];
    CGSize v5 = v9;
  }
  MEMORY[0x270F9A758](filterNameBadge, v5);
}

- (void)controlStatusIndicatorDidChangeIntrinsicContentSize:(id)a3 animated:(BOOL)a4
{
  int64_t v5 = [(CAMViewfinderView *)self layoutStyle];
  [(CAMViewfinderView *)self _layoutVideoConfigurationStatusIndicatorForLayoutStyle:v5];
}

- (void)badgeViewDidChangeIntrinsicContentSize:(id)a3
{
  int64_t v4 = [(CAMViewfinderView *)self layoutStyle];
  [(CAMViewfinderView *)self _layoutPortraitModeInstructionLabelForLayoutStyle:v4];
  [(CAMViewfinderView *)self _layoutQRCodeInstructionLabelForLayoutStyle:v4];
  [(CAMViewfinderView *)self _layoutTopBadgesForLayoutStyle:v4 animated:1];
  [(CAMViewfinderView *)self _layoutBottomBadgesForLayoutStyle:v4];
}

- (void)instructionLabelDidChangeIntrinsicContentSize:(id)a3
{
  int64_t v4 = [(CAMViewfinderView *)self layoutStyle];
  [(CAMViewfinderView *)self _layoutPortraitModeInstructionLabelForLayoutStyle:v4];
  [(CAMViewfinderView *)self _layoutQRCodeInstructionLabelForLayoutStyle:v4];
  [(CAMViewfinderView *)self _layoutTopBadgesForLayoutStyle:v4 animated:1];
  [(CAMViewfinderView *)self _layoutBottomBadgesForLayoutStyle:v4];
}

- (void)setPanoramaView:(id)a3
{
  int64_t v5 = (CAMPanoramaView *)a3;
  panoramaView = self->_panoramaView;
  CGRect v7 = v5;
  if (panoramaView != v5)
  {
    [(CAMPanoramaView *)panoramaView removeFromSuperview];
    objc_storeStrong((id *)&self->_panoramaView, a3);
    [(CAMViewfinderView *)self addSubview:v7];
  }
}

- (void)setZoomSlider:(id)a3
{
  int64_t v5 = (CAMZoomSlider *)a3;
  zoomSlider = self->_zoomSlider;
  CGRect v7 = v5;
  if (zoomSlider != v5)
  {
    [(CAMZoomSlider *)zoomSlider removeFromSuperview];
    objc_storeStrong((id *)&self->_zoomSlider, a3);
    [(CAMViewfinderView *)self addSubview:v7];
  }
}

- (void)setZoomControl:(id)a3
{
  int64_t v5 = (CAMZoomControl *)a3;
  zoomControl = self->_zoomControl;
  if (zoomControl != v5)
  {
    id v8 = v5;
    [(CAMZoomControl *)zoomControl removeFromSuperview];
    objc_storeStrong((id *)&self->_zoomControl, a3);
    CGRect v7 = [(CAMViewfinderView *)self bottomBar];
    if (v7) {
      [(CAMViewfinderView *)self insertSubview:v8 below:v7];
    }
    else {
      [(CAMViewfinderView *)self addSubview:v8];
    }
    [(CAMViewfinderView *)self setNeedsLayout];

    int64_t v5 = v8;
  }
  MEMORY[0x270F9A758](zoomControl, v5);
}

- (void)setLightingControl:(id)a3
{
  int64_t v5 = (CEKLightingControl *)a3;
  lightingControl = self->_lightingControl;
  CGRect v7 = v5;
  if (lightingControl != v5)
  {
    [(CEKLightingControl *)lightingControl removeFromSuperview];
    objc_storeStrong((id *)&self->_lightingControl, a3);
    [(CEKLightingControl *)self->_lightingControl setOrientation:[(CAMViewfinderView *)self orientation]];
    [(CAMViewfinderView *)self addSubview:v7];
  }
}

- (void)setLightingNameBadge:(id)a3
{
  int64_t v5 = (CEKLightingNameBadge *)a3;
  p_lightingNameBadge = &self->_lightingNameBadge;
  lightingNameBadge = self->_lightingNameBadge;
  if (lightingNameBadge != v5)
  {
    char v9 = v5;
    id v8 = [(CEKLightingNameBadge *)lightingNameBadge delegate];

    if (v8 == self) {
      [(CEKLightingNameBadge *)*p_lightingNameBadge setDelegate:0];
    }
    [(CEKLightingNameBadge *)*p_lightingNameBadge removeFromSuperview];
    objc_storeStrong((id *)&self->_lightingNameBadge, a3);
    [(CEKLightingNameBadge *)*p_lightingNameBadge setDelegate:self];
    lightingNameBadge = (CEKLightingNameBadge *)[(CAMViewfinderView *)self addSubview:v9];
    int64_t v5 = v9;
  }
  MEMORY[0x270F9A758](lightingNameBadge, v5);
}

- (void)setOrientation:(int64_t)a3
{
}

uint64_t __45__CAMViewfinderView_setOrientation_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setOrientation:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __45__CAMViewfinderView_setOrientation_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)prepareForAutorotation
{
  id v3 = [(CAMViewfinderView *)self _previewContainerMaskingView];
  [v3 setClipsToBounds:0];
  [(CAMViewfinderView *)self _layoutSnapshotsOfPreviewView];
}

- (void)_createPlaceholderSnapshotAndPerformSingleSidedFadeForView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5
{
  id v7 = a3;
  id v8 = [v7 snapshotViewAfterScreenUpdates:0];
  char v9 = (void *)MEMORY[0x263F82E00];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke;
  v18[3] = &unk_263FA0408;
  id v10 = v8;
  id v19 = v10;
  id v20 = v7;
  id v11 = v7;
  [v9 performWithoutAnimation:v18];
  double v12 = (void *)MEMORY[0x263F82E00];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke_2;
  v16[3] = &unk_263FA0208;
  id v17 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke_3;
  v14[3] = &unk_263FA0430;
  id v15 = v17;
  id v13 = v17;
  [v12 animateWithDuration:327682 delay:v16 options:v14 animations:a4 completion:a5];
}

void __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v2, "setBounds:");
  id v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) center];
  objc_msgSend(v3, "setCenter:");
  int64_t v5 = *(void **)(a1 + 32);
  int64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    [v4 transform];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  [v5 setTransform:v8];
  id v6 = [*(id *)(a1 + 40) superview];
  [v6 addSubview:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) setAlpha:0.0];
  id v7 = [*(id *)(a1 + 40) layer];
  [v7 removeAllAnimations];
}

uint64_t __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5 fadeInDuration:(double)a6 fadeInDelay:(double)a7
{
  id v12 = a3;
  [(CAMViewfinderView *)self _createPlaceholderSnapshotAndPerformSingleSidedFadeForView:v12 fadeOutDuration:a4 fadeOutDelay:a5];
  id v13 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __136__CAMViewfinderView__createPlaceholderSnapshotAndPerformDoubleSidedFadeForView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay___block_invoke;
  v15[3] = &unk_263FA0208;
  id v16 = v12;
  id v14 = v12;
  [v13 animateWithDuration:2 delay:v15 options:0 animations:a6 completion:a7];
}

uint64_t __136__CAMViewfinderView__createPlaceholderSnapshotAndPerformDoubleSidedFadeForView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)setTextInteractionInsert:(id)a3
{
  int64_t v4 = (VKTextLiftingView *)a3;
  textInteractionInsert = self->_textInteractionInsert;
  if (textInteractionInsert != v4)
  {
    id v7 = v4;
    textInteractionInsert = (VKTextLiftingView *)[(VKTextLiftingView *)textInteractionInsert removeFromSuperview];
    int64_t v4 = v7;
    self->_textInteractionInsert = v7;
    if (v7)
    {
      [(CAMViewfinderView *)self addSubview:v7];
      [(CAMViewfinderView *)self _layoutTextInteractionInsertAndActionInfoView];
      id v6 = [(CAMViewfinderView *)self imageAnalysisInstructionLabel];
      [(CAMViewfinderView *)self bringSubviewToFront:v6];

      int64_t v4 = v7;
    }
  }
  MEMORY[0x270F9A758](textInteractionInsert, v4);
}

- (void)setImageAnalysisInstructionLabel:(id)a3
{
  int64_t v5 = (CAMImageAnalysisInstructionLabel *)a3;
  imageAnalysisInstructionLabel = self->_imageAnalysisInstructionLabel;
  id v7 = v5;
  if (imageAnalysisInstructionLabel != v5)
  {
    [(CAMImageAnalysisInstructionLabel *)imageAnalysisInstructionLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_imageAnalysisInstructionLabel, a3);
    [(CAMViewfinderView *)self addSubview:v7];
  }
}

- (void)adoptMachineReadableCodeButton:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CAMViewfinderView *)self machineReadableCodeButton];
  id v8 = (void *)v7;
  if ((id)v7 != v6)
  {
    if (v7) {
      [(CAMViewfinderView *)self dismissMachineReadableCodeButtonAnimated:v4];
    }
    [(CAMViewfinderView *)self setMachineReadableCodeButton:v6];
    double v9 = 0.0;
    if (v4)
    {
      [v6 setAlpha:0.0];
      double v9 = 0.3;
    }
    [(CAMViewfinderView *)self addSubview:v6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__CAMViewfinderView_adoptMachineReadableCodeButton_animated___block_invoke;
    v10[3] = &unk_263FA0208;
    id v11 = v6;
    +[CAMView animateIfNeededWithDuration:v10 animations:v9];
  }
}

uint64_t __61__CAMViewfinderView_adoptMachineReadableCodeButton_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)dismissMachineReadableCodeButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMViewfinderView *)self machineReadableCodeButton];
  if (v5)
  {
    [(CAMViewfinderView *)self setMachineReadableCodeButton:0];
    if (v3) {
      double v6 = 0.3;
    }
    else {
      double v6 = 0.0;
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__CAMViewfinderView_dismissMachineReadableCodeButtonAnimated___block_invoke;
    _OWORD v9[3] = &unk_263FA0208;
    id v10 = v5;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__CAMViewfinderView_dismissMachineReadableCodeButtonAnimated___block_invoke_2;
    v7[3] = &unk_263FA2180;
    v7[4] = self;
    id v8 = v10;
    +[CAMView animateIfNeededWithDuration:v9 animations:v7 completion:v6];
  }
}

uint64_t __62__CAMViewfinderView_dismissMachineReadableCodeButtonAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __62__CAMViewfinderView_dismissMachineReadableCodeButtonAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) machineReadableCodeButton];
  BOOL v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    BOOL v4 = *(void **)(a1 + 40);
    [v4 removeFromSuperview];
  }
}

- (int64_t)externalDisplayPreviewOrientation
{
  return self->_externalDisplayPreviewOrientation;
}

- (void)setExternalDisplayPreviewOrientation:(int64_t)a3
{
  self->_externalDisplayPreviewOrientation = a3;
}

- (void)setVisibleTopBadges:(id)a3
{
}

- (CAMFlashBadge)flashBadge
{
  return self->_flashBadge;
}

- (CAMHDRBadge)HDRBadge
{
  return self->_HDRBadge;
}

- (CAMFocusLockBadge)focusAndExposureLockBadge
{
  return self->_focusAndExposureLockBadge;
}

- (CAMLivePhotoBadge)livePhotoBadge
{
  return self->_livePhotoBadge;
}

- (CAMShallowDepthOfFieldBadge)shallowDepthOfFieldBadge
{
  return self->_shallowDepthOfFieldBadge;
}

- (CAMSharedLibraryBadge)sharedLibraryBadge
{
  return self->_sharedLibraryBadge;
}

- (CAMVideoConfigurationStatusIndicator)videoConfigurationStatusIndicator
{
  return self->_videoConfigurationStatusIndicator;
}

- (VKTextLiftingView)textInteractionInsert
{
  return self->_textInteractionInsert;
}

- (CAMImageAnalysisInstructionLabel)imageAnalysisInstructionLabel
{
  return self->_imageAnalysisInstructionLabel;
}

- (CAMMachineReadableCodeButton)machineReadableCodeButton
{
  return self->_machineReadableCodeButton;
}

- (void)setMachineReadableCodeButton:(id)a3
{
}

- (CAMViewfinderFlipTransition)_flipTransition
{
  return self->__flipTransition;
}

- (void)_setFlipTransition:(id)a3
{
}

- (UIView)_topBarExtensionView
{
  return self->__topBarExtensionView;
}

- (void)_setTopBarExtensionView:(id)a3
{
}

- (UIView)_bottomBarExtensionView
{
  return self->__bottomBarExtensionView;
}

- (void)_setBottomBarExtensionView:(id)a3
{
}

- (CAMFullscreenViewfinderLayout)_modernLayout
{
  return self->__modernLayout;
}

- (void)_setModernLayout:(id)a3
{
}

- (NSMutableDictionary)_descriptionOverlayViewByKey
{
  return self->__descriptionOverlayViewByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__descriptionOverlayViewByKey, 0);
  objc_storeStrong((id *)&self->__modernLayout, 0);
  objc_storeStrong((id *)&self->__bottomBarExtensionView, 0);
  objc_storeStrong((id *)&self->__topBarExtensionView, 0);
  objc_storeStrong((id *)&self->__flipTransition, 0);
  objc_storeStrong((id *)&self->__openAndCloseTransition, 0);
  objc_storeStrong((id *)&self->__previewContainerView, 0);
  objc_storeStrong((id *)&self->__previewContainerMaskingView, 0);
  objc_storeStrong((id *)&self->_machineReadableCodeButton, 0);
  objc_storeStrong((id *)&self->_imageAnalysisInstructionLabel, 0);
  objc_storeStrong((id *)&self->_disabledModeOverlayView, 0);
  objc_storeStrong((id *)&self->_lightingNameBadge, 0);
  objc_storeStrong((id *)&self->_lightingControl, 0);
  objc_storeStrong((id *)&self->_zoomControl, 0);
  objc_storeStrong((id *)&self->_zoomSlider, 0);
  objc_storeStrong((id *)&self->_panoramaView, 0);
  objc_storeStrong((id *)&self->_timerIndicatorView, 0);
  objc_storeStrong((id *)&self->_burstIndicatorView, 0);
  objc_storeStrong((id *)&self->_videoConfigurationStatusIndicator, 0);
  objc_storeStrong((id *)&self->_elapsedTimeView, 0);
  objc_storeStrong((id *)&self->_shutterIndicatorView, 0);
  objc_storeStrong((id *)&self->_sharedLibraryBadge, 0);
  objc_storeStrong((id *)&self->_filterNameBadge, 0);
  objc_storeStrong((id *)&self->_qrCodeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_portraitModeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_shallowDepthOfFieldBadge, 0);
  objc_storeStrong((id *)&self->_livePhotoBadge, 0);
  objc_storeStrong((id *)&self->_focusAndExposureLockBadge, 0);
  objc_storeStrong((id *)&self->_HDRBadge, 0);
  objc_storeStrong((id *)&self->_flashBadge, 0);
  objc_storeStrong((id *)&self->_visibleTopBadges, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_destroyWeak((id *)&self->_visibilityDelegate);
}

@end