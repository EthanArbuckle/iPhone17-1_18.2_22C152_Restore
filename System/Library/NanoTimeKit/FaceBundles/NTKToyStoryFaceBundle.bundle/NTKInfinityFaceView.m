@interface NTKInfinityFaceView
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_shouldFadeToTransitionView;
- (BOOL)_shouldQueueKeepAlive;
- (NTKInfinityFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_adjustmentForBottomTimeLayout;
- (double)_rightSideMarginForDigitalTimeHeroPosition;
- (double)_timeLabelAlphaForEditMode:(int64_t)a3;
- (id)_currentPosterImageView;
- (id)_editingComplicationColor;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_nextListing;
- (id)_onDeckPosterImageView;
- (id)_posterImageView;
- (id)_posterImageViewForStyle:(unint64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_viewForEditOption:(id)a3;
- (id)videoPlayerView;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_handleOrdinaryScreenWake;
- (void)_handleSingleTap:(id)a3;
- (void)_handleWristRaiseScreenWake;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_performPreloadVideoTask;
- (void)_prepareForEditing;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationWithColor:(id)a3 animated:(BOOL)a4;
- (void)_updatePaused;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)setTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 customEditMode:(int64_t)a6 slot:(id)a7;
- (void)videoPlayerViewDidBeginPlaying:(id)a3;
- (void)videoPlayerViewDidBeginPlayingQueuedVideo:(id)a3;
- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3;
@end

@implementation NTKInfinityFaceView

- (NTKInfinityFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKInfinityFaceView;
  v9 = [(NTKInfinityFaceView *)&v18 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    [(NTKInfinityFaceView *)v9 setShouldChangeVariantForScreenWake:1];
    *((unsigned char *)v10 + 8) &= ~1u;
    v11 = [NTKInfinityController alloc];
    v12 = [(NTKInfinityFaceView *)v10 device];
    v13 = [(NTKInfinityController *)v11 initForDevice:v12];
    controller = v10->_controller;
    v10->_controller = v13;

    v15 = (NTKFaceViewComplicationFactory *)[objc_alloc((Class)NTKDigitialUtilitarianFaceViewComplicationFactory) initForDevice:v8];
    faceViewComplicationFactory = v10->_faceViewComplicationFactory;
    v10->_faceViewComplicationFactory = v15;
  }
  return v10;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v4 dealloc];
}

- (void)_loadSnapshotContentViews
{
  v19.receiver = self;
  v19.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v19 _loadSnapshotContentViews];
  v3 = [(NTKInfinityFaceView *)self foregroundContainerView];
  [(NTKInfinityFaceView *)self bringSubviewToFront:v3];

  objc_super v4 = [(NTKInfinityFaceView *)self timeView];
  v5 = +[UIColor colorWithWhite:0.0 alpha:0.3];
  [v4 setShadowColor:v5];

  id v6 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKInfinityFaceView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(NTKInfinityFaceView *)self device];
  v16 = (UIView *)objc_msgSend(v6, "initWithFrame:forDeviceCornerRadius:", v15, v8, v10, v12, v14);
  cornerView = self->_cornerView;
  self->_cornerView = v16;

  [(NTKInfinityFaceView *)self addSubview:self->_cornerView];
  objc_super v18 = [(NTKInfinityFaceView *)self videoPlayerView];
  [v18 setPausedViewEnabled:0];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v4 _unloadSnapshotContentViews];
  [(UIView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v12 layoutSubviews];
  v3 = [(NTKInfinityFaceView *)self foregroundContainerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_cornerView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
}

- (void)_performPreloadVideoTask
{
  v4.receiver = self;
  v4.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v4 _performPreloadVideoTask];
  v3 = [(NTKInfinityFaceView *)self _editingComplicationColor];
  [(NTKInfinityFaceView *)self _updateComplicationWithColor:v3 animated:0];
}

- (void)_updatePaused
{
  v2.receiver = self;
  v2.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v2 _updatePaused];
}

- (id)_nextListing
{
  if ([(NTKInfinityFaceView *)self shouldChangeVariantForScreenWake])
  {
    [(NTKInfinityFaceView *)self setShouldChangeVariantForScreenWake:0];
    [(NTKInfinityController *)self->_controller invalidateCurrentListing];
  }
  v3 = [(NTKInfinityController *)self->_controller nextListing];
  objc_super v4 = [v3 complicationColor];
  [(NTKInfinityFaceView *)self _updateComplicationWithColor:v4 animated:1];

  return v3;
}

- (void)_handleWristRaiseScreenWake
{
  v3 = [(NTKInfinityFaceView *)self videoPlayerView];
  unsigned int v4 = [v3 isPlaybackReady];

  if (v4) {
    [(NTKInfinityFaceView *)self _hideCurtainView];
  }
  v5.receiver = self;
  v5.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v5 _handleWristRaiseScreenWake];
}

- (void)_handleOrdinaryScreenWake
{
  v3 = [(NTKInfinityFaceView *)self videoPlayerView];
  unsigned int v4 = [v3 isPlaybackReady];

  if (v4) {
    [(NTKInfinityFaceView *)self _hideCurtainView];
  }
  v5.receiver = self;
  v5.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v5 _handleOrdinaryScreenWake];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v7 screenDidTurnOffAnimated:a3];
  [(NTKInfinityController *)self->_controller invalidateCurrentListing];
  [(NTKInfinityController *)self->_controller invalidatePreparedListing];
  [(NTKInfinityController *)self->_controller prepareListing];
  unsigned int v4 = [(NTKInfinityController *)self->_controller preparedListing];
  objc_super v5 = v4;
  if (v4)
  {
    double v6 = [v4 complicationColor];
    [(NTKInfinityFaceView *)self _updateComplicationWithColor:v6 animated:0];
  }
}

- (void)videoPlayerViewDidBeginPlayingQueuedVideo:(id)a3
{
  if ([(NTKInfinityFaceView *)self _shouldQueueKeepAlive])
  {
    unsigned int v4 = [(NTKInfinityController *)self->_controller nextListing];
    currentQueueListing = self->_currentQueueListing;
    self->_currentQueueListing = v4;

    id v7 = [(NTKInfinityFaceView *)self videoPlayerView];
    double v6 = [(NTKInfinityListing *)self->_currentQueueListing video];
    [v7 queueVideo:v6];
  }
}

- (void)videoPlayerViewDidBeginPlaying:(id)a3
{
  id v11 = a3;
  if (*((unsigned char *)self + 8))
  {
    *((unsigned char *)self + 8) &= ~1u;
    goto LABEL_5;
  }
  if ([(NTKInfinityFaceView *)self _curtainViewVisible]) {
LABEL_5:
  }
    [(NTKInfinityFaceView *)self _fadeFromCurtainViewWithDuration:0 completion:0.1];
  controller = self->_controller;
  objc_super v5 = [(NTKInfinityFaceView *)self currentListing];
  [(NTKInfinityController *)controller startedPlayingListing:v5];

  if ([(NTKInfinityFaceView *)self _shouldQueueKeepAlive])
  {
    double v6 = [(NTKInfinityController *)self->_controller nextQueueListing];
    currentQueueListing = self->_currentQueueListing;
    self->_currentQueueListing = v6;

    double v8 = [(NTKInfinityFaceView *)self videoPlayerView];
    double v9 = [(NTKInfinityListing *)self->_currentQueueListing video];
    [v8 queueVideo:v9];
  }
  double v10 = [(NTKInfinityController *)self->_controller currentComplicationColor];
  [(NTKInfinityFaceView *)self _updateComplicationWithColor:v10 animated:1];
}

- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3
{
  if (![(NTKInfinityController *)self->_controller controllerMode]
    || (char *)[(NTKInfinityController *)self->_controller controllerMode] == (char *)&dword_0 + 1)
  {
    unsigned int v4 = [(NTKInfinityController *)self->_controller currentListing];
    objc_super v5 = (char *)[v4 playback];

    if (v5)
    {
      if (v5 == (unsigned char *)&dword_0 + 1)
      {
        [(NTKInfinityFaceView *)self _fadeToCurtainViewWithDuration:0 completion:0.2];
      }
      else if (v5 == (unsigned char *)&dword_0 + 2)
      {
        [(NTKInfinityFaceView *)self _resetVideoForListing];
        [(NTKInfinityFaceView *)self _playQueuedUpVideo];
      }
    }
    else
    {
      [(NTKInfinityFaceView *)self _playNextVideo];
    }
  }
}

- (id)videoPlayerView
{
  v4.receiver = self;
  v4.super_class = (Class)NTKInfinityFaceView;
  objc_super v2 = [(NTKInfinityFaceView *)&v4 videoPlayerView];
  [v2 setPausedViewEnabled:0];

  return v2;
}

- (BOOL)_shouldQueueKeepAlive
{
  objc_super v2 = [(NTKInfinityFaceView *)self currentListing];
  BOOL v3 = [v2 type] == (char *)&dword_0 + 1 || objc_msgSend(v2, "type") == 0;

  return v3;
}

- (double)_rightSideMarginForDigitalTimeHeroPosition
{
  BOOL v3 = [(NTKInfinityFaceView *)self device];
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {

    return NTKDigitalTimeLabelStyleNarrowRightSideMargin;
  }
  objc_super v4 = [(NTKInfinityFaceView *)self device];
  objc_super v5 = (char *)[v4 deviceCategory];

  if (v5 == (unsigned char *)&dword_0 + 2) {
    return NTKDigitalTimeLabelStyleNarrowRightSideMargin;
  }
  id v7 = [(NTKInfinityFaceView *)self device];
  NTKDigitalTimeLabelStyleWideRightSideMargin();
  double v9 = v8;

  return v9;
}

- (double)_adjustmentForBottomTimeLayout
{
  objc_super v2 = [(NTKInfinityFaceView *)self device];
  if ([v2 sizeClass]) {
    double v3 = 113.5;
  }
  else {
    double v3 = 100.0;
  }

  return v3;
}

- (void)didAddSubview:(id)a3
{
  objc_super v4 = [(NTKInfinityFaceView *)self _curtainView];
  [(NTKInfinityFaceView *)self bringSubviewToFront:v4];

  [(NTKInfinityFaceView *)self bringSubviewToFront:self->_cornerView];
  id v5 = [(NTKInfinityFaceView *)self foregroundContainerView];
  [(NTKInfinityFaceView *)self bringSubviewToFront:v5];
}

- (void)_loadLayoutRules
{
  v3.receiver = self;
  v3.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v3 _loadLayoutRules];
  [(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory loadLayoutRulesForFaceView:self];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  id v9 = a5;
  id v10 = [(NTKFaceViewComplicationFactory *)faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:v9 faceView:self];
  [(NTKInfinityFaceView *)self _configureComplicationView:v10 forSlot:v9];

  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory configureComplicationView:v10 forSlot:v6 faceView:self];
  [v10 setSuppressesInternalColorOverrides:1];
  id v7 = [v6 isEqualToString:NTKComplicationSlotBottom];
  if (v7)
  {
    double v8 = +[UIColor colorWithWhite:0.0 alpha:0.7];
    [v10 setShadowColor:v8];
  }
  else
  {
    if (![v6 isEqualToString:NTKComplicationSlotTopRight]) {
      goto LABEL_6;
    }
    [v10 setShadowColor:0];
    id v9 = [(NTKInfinityFaceView *)self _editingComplicationColor];
    [v10 setForegroundColor:v9];

    [v10 setForegroundAlpha:1.0];
    [v10 setForegroundImageAlpha:1.0];
  }
  [v10 setUsesLegibility:v7];
LABEL_6:
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (void)_updateComplicationWithColor:(id)a3 animated:(BOOL)a4
{
  id v7 = (UIColor *)a3;
  if (v7 && self->_currentComplicationColor != v7)
  {
    objc_storeStrong((id *)&self->_currentComplicationColor, a3);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4DA8;
    v8[3] = &unk_C4F0;
    BOOL v9 = a4;
    v8[4] = self;
    [(NTKInfinityFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v8];
  }
}

- (id)_editingComplicationColor
{
  objc_super v3 = [(NTKInfinityController *)self->_controller currentStyleComplicationColor];
  if (([(NTKInfinityFaceView *)self editing] & 1) == 0)
  {
    objc_super v4 = [(NTKInfinityController *)self->_controller currentListing];

    if (v4)
    {
      uint64_t v5 = [(NTKInfinityController *)self->_controller currentComplicationColor];

      objc_super v3 = (void *)v5;
    }
  }

  return v3;
}

- (id)_viewForEditOption:(id)a3
{
  id v4 = [a3 style];

  return [(NTKInfinityFaceView *)self _posterImageViewForStyle:v4];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v19 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 12)
  {
    unint64_t v9 = [(NTKInfinityController *)self->_controller currentStyle];
    id v10 = [v8 style];
    [(NTKInfinityController *)self->_controller setStyle:v10];
    if ((id)v9 != v10 || [(NTKInfinityFaceView *)self editing])
    {
      id v11 = [(NTKInfinityFaceView *)self posterImageView];
      objc_super v12 = [(NTKInfinityController *)self->_controller posterImageForStyle:v10];
      [v11 setImage:v12];

      double v13 = [(NTKInfinityController *)self->_controller currentComplicationColor];
      [(NTKInfinityFaceView *)self _updateComplicationWithColor:v13 animated:0];
    }
    double v14 = [(NTKInfinityFaceView *)self posterImageView];
    [v14 removeFromSuperview];

    v15 = [(NTKInfinityFaceView *)self backgroundContainerView];
    v16 = [(NTKInfinityFaceView *)self posterImageView];
    [v15 addSubview:v16];

    v17 = [(NTKInfinityFaceView *)self backgroundContainerView];
    objc_super v18 = [(NTKInfinityFaceView *)self posterImageView];
    [v17 sendSubviewToBack:v18];

    [(NTKInfinityFaceView *)self setNeedsLayout];
  }
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v4 _prepareForEditing];
  objc_super v3 = [(NTKInfinityFaceView *)self _editingComplicationColor];
  [(NTKInfinityFaceView *)self _updateComplicationWithColor:v3 animated:1];
}

- (void)_cleanupAfterEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v4 _cleanupAfterEditing];
  [(NTKInfinityController *)self->_controller invalidateCurrentListing];
  objc_super v3 = [(NTKInfinityFaceView *)self _editingComplicationColor];
  [(NTKInfinityFaceView *)self _updateComplicationWithColor:v3 animated:1];
}

- (void)_applyDataMode
{
  v7.receiver = self;
  v7.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v7 _applyDataMode];
  if ([(NTKInfinityFaceView *)self dataMode] != self->_previousDataMode)
  {
    objc_super v3 = (char *)[(NTKInfinityFaceView *)self dataMode];
    if (v3 == (unsigned char *)&dword_4 + 1)
    {
      [(NTKInfinityFaceView *)self setShouldChangeVariantForScreenWake:0];
    }
    else if (v3 == (unsigned char *)&dword_0 + 1 && self->_previousDataMode == 3)
    {
      objc_super v4 = [(NTKInfinityFaceView *)self currentListing];

      if (v4)
      {
        uint64_t v5 = [(NTKInfinityFaceView *)self currentListing];
        id v6 = [v5 complicationColor];
        [(NTKInfinityFaceView *)self _updateComplicationWithColor:v6 animated:1];
      }
    }
    self->_previousDataMode = (int64_t)[(NTKInfinityFaceView *)self dataMode];
  }
}

- (void)setTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 customEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NTKInfinityFaceView;
  [(NTKInfinityFaceView *)&v20 setTransitionFraction:v12 fromOption:v13 toOption:a6 customEditMode:a7 slot:a3];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5484;
  v16[3] = &unk_C518;
  v16[4] = self;
  id v17 = v13;
  id v18 = v12;
  double v19 = a3;
  id v14 = v12;
  id v15 = v13;
  [(NTKInfinityFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v16];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (unint64_t)a4 > 1;
}

- (double)_timeLabelAlphaForEditMode:(int64_t)a3
{
  if (a3 == 12) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (a3 == 1) {
    return NTKEditModeDimmedAlpha;
  }
  return result;
}

- (BOOL)_shouldFadeToTransitionView
{
  return 1;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (id)_currentPosterImageView
{
  unint64_t v3 = [(NTKInfinityController *)self->_controller currentStyle];

  return [(NTKInfinityFaceView *)self _posterImageViewForStyle:v3];
}

- (id)_posterImageViewForStyle:(unint64_t)a3
{
  id v5 = objc_alloc((Class)UIImageView);
  [(NTKInfinityFaceView *)self bounds];
  id v6 = objc_msgSend(v5, "initWithFrame:");
  [v6 setContentMode:2];
  [v6 setClipsToBounds:1];
  objc_super v7 = [(NTKInfinityController *)self->_controller posterImageForStyle:a3];
  [v6 setImage:v7];

  return v6;
}

- (id)_posterImageView
{
  return [(NTKInfinityFaceView *)self _currentPosterImageView];
}

- (id)_onDeckPosterImageView
{
  return [(NTKInfinityFaceView *)self _currentPosterImageView];
}

- (void)_handleSingleTap:(id)a3
{
  id v4 = a3;
  [(NTKInfinityFaceView *)self faultInFaceContentSkippedDuringSwiping];
  if (([(NTKInfinityFaceView *)self shouldPause] & 1) == 0)
  {
    [v4 setEnabled:0];
    *((unsigned char *)self + 8) |= 1u;
    [(NTKInfinityController *)self->_controller prepareUserTapAction];
    id v5 = [(NTKInfinityController *)self->_controller nextListing];
    [(NTKInfinityFaceView *)self setCurrentListing:v5];

    [(NTKInfinityFaceView *)self _updateImageToBlur];
    id v6 = [(NTKInfinityFaceView *)self videoPlayerView];
    [v6 pause];

    if (![(NTKInfinityController *)self->_controller controllerMode])
    {
      objc_super v7 = [(NTKInfinityController *)self->_controller currentComplicationColor];
      [(NTKInfinityFaceView *)self _updateComplicationWithColor:v7 animated:0];
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_57F8;
    v8[3] = &unk_C540;
    v8[4] = self;
    [(NTKInfinityFaceView *)self _fadeToCurtainViewWithDuration:v8 completion:0.2];
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v5 = [a3 style];
  if ((unint64_t)v5 > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (uint64_t)*(&off_C560 + (void)v5);
  }

  return (id)_NTKImageNamed(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentComplicationColor, 0);
  objc_storeStrong((id *)&self->_currentQueueListing, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);

  objc_storeStrong((id *)&self->_cornerView, 0);
}

@end