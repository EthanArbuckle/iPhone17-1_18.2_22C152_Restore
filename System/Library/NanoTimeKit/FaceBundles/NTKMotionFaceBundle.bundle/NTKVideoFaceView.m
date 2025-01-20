@interface NTKVideoFaceView
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_shouldDelayBeforePlayingNextVideo;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKVideoFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)_rightSideMarginForDigitalTimeHeroPosition;
- (double)_timeTravelYAdjustment;
- (double)keylineStyleForComplicationSlot:(id)a3;
- (id)_complicationForegroundColor;
- (id)_defaultListing;
- (id)_detachedComplicationDisplays;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_nextListing;
- (id)_onDeckPosterImageView;
- (id)_posterImageView;
- (id)_posterImageViewWithTheme:(unint64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_viewForEditOption:(id)a3;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_handleTapToPlayVideoGesture:(id)a3;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_performPreloadVideoTask;
- (void)_prepareForEditing;
- (void)_selectDefaultListing;
- (void)_unloadSnapshotContentViews;
- (void)_updatePaused;
- (void)dealloc;
- (void)videoPlayerViewDidBeginPlaying:(id)a3;
- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3;
@end

@implementation NTKVideoFaceView

- (NTKVideoFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)NTKVideoFaceView;
  v10 = [(NTKVideoFaceView *)&v25 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:v9];
  if (v10)
  {
    v11 = (NTKDigitialUtilitarianFaceViewComplicationFactory *)[objc_alloc((Class)NTKDigitialUtilitarianFaceViewComplicationFactory) initForDevice:v8];
    faceViewComplicationFactory = v10->_faceViewComplicationFactory;
    v10->_faceViewComplicationFactory = v11;

    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v10->_faceViewComplicationFactory setUsesLegibility:1 faceView:v10];
    v13 = v10->_faceViewComplicationFactory;
    v26[0] = NTKComplicationSlotTopRight;
    v26[1] = NTKComplicationSlotBottom;
    v26[2] = NTKComplicationSlotDate;
    v14 = +[NSArray arrayWithObjects:v26 count:3];
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v13 setSupportedComplicationSlots:v14];

    objc_initWeak(&location, v10);
    v15 = v10->_faceViewComplicationFactory;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_3D80;
    v22[3] = &unk_8308;
    objc_copyWeak(&v23, &location);
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v15 setForegroundColorProviderBlock:v22];
    v16 = v10->_faceViewComplicationFactory;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_3DCC;
    v20[3] = &unk_8330;
    objc_copyWeak(&v21, &location);
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v16 setTimeTravelYAdjustmentProviderBlock:v20];
    v17 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v10 action:"_handleTapToPlayVideoGesture:"];
    tapToPlayGesture = v10->_tapToPlayGesture;
    v10->_tapToPlayGesture = v17;

    [(UITapGestureRecognizer *)v10->_tapToPlayGesture setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v10->_tapToPlayGesture setDelegate:v10];
    [(UITapGestureRecognizer *)v10->_tapToPlayGesture setEnabled:0];
    [(NTKVideoFaceView *)v10 addGestureRecognizer:v10->_tapToPlayGesture];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(NTKVideoFaceView *)self device];
  v4 = +[NTKVideoListingFactory sharedInstanceForDevice:v3];
  [v4 discardAssets];

  v5.receiver = self;
  v5.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v5 dealloc];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
}

- (id)_detachedComplicationDisplays
{
  return [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory detachedComplicationDisplaysForFaceView:self];
}

- (void)_loadLayoutRules
{
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineCornerRadiusForComplicationSlot:a3 faceView:self];
  return result;
}

- (double)keylineStyleForComplicationSlot:(id)a3
{
  return (double)(uint64_t)[(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory fadesComplicationSlot:a3 inEditMode:a4 faceView:self];
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory minimumBreathingScaleForComplicationSlot:a3 faceView:self];
  return result;
}

- (void)_performPreloadVideoTask
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v3 _performPreloadVideoTask];
  if ((*((unsigned char *)self + 32) & 2) == 0)
  {
    *((unsigned char *)self + 32) |= 2u;
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:0 faceView:self];
  }
}

- (void)_loadSnapshotContentViews
{
  v2.receiver = self;
  v2.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v2 _loadSnapshotContentViews];
}

- (void)_unloadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v5 _unloadSnapshotContentViews];
  objc_super v3 = [(NTKVideoFaceView *)self device];
  v4 = +[NTKVideoListingFactory sharedInstanceForDevice:v3];
  [v4 discardAssets];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v24 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  if (a6 == 12)
  {
    id v14 = [v12 videoTheme];
    id v15 = [v13 videoTheme];
    v16 = [(NTKVideoFaceView *)self device];
    v17 = +[NTKVideoListingFactory sharedInstanceForDevice:v16];

    v18 = [v17 defaultListingWithTheme:v14];
    v19 = [v17 defaultListingWithTheme:v15];
    v20 = [v18 overlayColor];
    id v21 = [v19 overlayColor];
    NTKInterpolateBetweenColors();
    v22 = (UIColor *)objc_claimAutoreleasedReturnValue();
    editingComplicationColor = self->_editingComplicationColor;
    self->_editingComplicationColor = v22;

    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:0 faceView:self];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)NTKVideoFaceView;
  id v8 = a3;
  [(NTKVideoFaceView *)&v17 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  id v9 = objc_msgSend(v8, "videoTheme", v17.receiver, v17.super_class);

  self->_theme = (unint64_t)v9;
  v10 = [(NTKVideoFaceView *)self posterImageView];
  [v10 removeFromSuperview];
  v11 = [(NTKVideoFaceView *)self device];
  id v12 = +[NTKVideoListingFactory sharedInstanceForDevice:v11];
  id v13 = [v12 posterImageWithTheme:self->_theme];
  [v10 setImage:v13];

  id v14 = [(NTKVideoFaceView *)self contentView];
  [v14 addSubview:v10];

  id v15 = [(NTKVideoFaceView *)self contentView];
  [v15 sendSubviewToBack:v10];

  [(NTKVideoFaceView *)self setNeedsLayout];
  if (a4 == 12)
  {
    editingComplicationColor = self->_editingComplicationColor;
    self->_editingComplicationColor = 0;

    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:0 faceView:self];
  }
  if (([(NTKVideoFaceView *)self editing] & 1) == 0) {
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory cleanupAfterEditingForFaceView:self];
  }
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v3 _prepareForEditing];
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory prepareForEditingForFaceView:self];
}

- (void)_cleanupAfterEditing
{
  objc_super v3 = [(NTKVideoFaceView *)self currentListing];
  if (!v3) {
    id v4 = [(NTKVideoFaceView *)self _nextListing];
  }
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory cleanupAfterEditingForFaceView:self];
  editingComplicationColor = self->_editingComplicationColor;
  self->_editingComplicationColor = 0;

  v6.receiver = self;
  v6.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v6 _cleanupAfterEditing];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  if ((id)NTKComplicationSlotDate == a3)
  {
    id v10 = a3;
    v11 = [(NTKVideoFaceView *)self delegate];
    id v12 = [v11 faceViewComplicationIsEmptyForSlot:v10];

    -[NTKVideoFaceView _keylineFrameForComplicationSlot:selected:](&v22, "_keylineFrameForComplicationSlot:selected:", v10, v12, v21.receiver, v21.super_class, self, NTKVideoFaceView);
  }
  else
  {
    -[NTKVideoFaceView _keylineFrameForComplicationSlot:selected:](&v21, "_keylineFrameForComplicationSlot:selected:", a3, a4, self, NTKVideoFaceView, v22.receiver, v22.super_class);
  }
  double v13 = v6;
  double v14 = v7;
  double v15 = v8;
  double v16 = v9;

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v5 = [a3 videoTheme];
  if ((unint64_t)v5 > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (uint64_t)*(&off_8378 + (void)v5);
  }

  return +[NTKMotionFaceBundle imageWithName:v6];
}

- (id)_viewForEditOption:(id)a3
{
  id v4 = [a3 videoTheme];

  return [(NTKVideoFaceView *)self _posterImageViewWithTheme:v4];
}

- (double)_rightSideMarginForDigitalTimeHeroPosition
{
  objc_super v3 = [(NTKVideoFaceView *)self device];
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {

    return NTKDigitalTimeLabelStyleNarrowRightSideMargin;
  }
  id v4 = [(NTKVideoFaceView *)self device];
  id v5 = (char *)[v4 deviceCategory];

  if (v5 == (unsigned char *)&dword_0 + 2) {
    return NTKDigitalTimeLabelStyleNarrowRightSideMargin;
  }
  double v7 = [(NTKVideoFaceView *)self device];
  NTKDigitalTimeLabelStyleWideRightSideMargin();
  double v9 = v8;

  return v9;
}

- (double)_timeTravelYAdjustment
{
  objc_super v2 = [(NTKVideoFaceView *)self device];
  if ([v2 sizeClass]) {
    double v3 = 16.5;
  }
  else {
    double v3 = 15.5;
  }

  return v3;
}

- (id)_complicationForegroundColor
{
  double v3 = +[UIColor whiteColor];
  if ([(NTKVideoFaceView *)self editing])
  {
    editingComplicationColor = self->_editingComplicationColor;
    if (editingComplicationColor)
    {
      id v5 = editingComplicationColor;
LABEL_10:
      id v8 = v3;
      double v3 = v5;
      goto LABEL_11;
    }
  }
  if ((*((unsigned char *)self + 32) & 4) != 0)
  {
    id v5 = +[UIColor grayColor];
    goto LABEL_10;
  }
  if (*((unsigned char *)self + 32))
  {
    double v7 = [(NTKVideoFaceView *)self _defaultListing];
  }
  else
  {
    if (([(NTKVideoFaceView *)self editing] & 1) != 0
      || ([(NTKVideoFaceView *)self currentListing],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      v11 = [(NTKVideoFaceView *)self device];
      id v8 = +[NTKVideoListingFactory sharedInstanceForDevice:v11];

      id v12 = [v8 defaultListingWithTheme:self->_theme];
      uint64_t v13 = [v12 overlayColor];

      double v3 = (void *)v13;
      goto LABEL_11;
    }
    double v7 = [(NTKVideoFaceView *)self currentListing];
  }
  id v10 = v7;
  id v8 = [v7 overlayColor];

  if (v8)
  {
    id v8 = v8;

    double v3 = v8;
  }
LABEL_11:

  return v3;
}

- (void)_updatePaused
{
  v5.receiver = self;
  v5.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v5 _updatePaused];
  tapToPlayGesture = self->_tapToPlayGesture;
  if ([(NTKVideoFaceView *)self isContentUnloadedForFaceSwiping]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [(NTKVideoFaceView *)self shouldPause] ^ 1;
  }
  [(UITapGestureRecognizer *)tapToPlayGesture setEnabled:v4];
}

- (id)_posterImageViewWithTheme:(unint64_t)a3
{
  id v5 = objc_alloc((Class)UIImageView);
  [(NTKVideoFaceView *)self bounds];
  id v6 = objc_msgSend(v5, "initWithFrame:");
  [v6 setContentMode:2];
  [v6 setClipsToBounds:1];
  double v7 = [(NTKVideoFaceView *)self device];
  id v8 = +[NTKVideoListingFactory sharedInstanceForDevice:v7];
  double v9 = [v8 posterImageWithTheme:a3];
  [v6 setImage:v9];

  return v6;
}

- (id)_posterImageView
{
  return [(NTKVideoFaceView *)self _posterImageViewWithTheme:self->_theme];
}

- (id)_onDeckPosterImageView
{
  return [(NTKVideoFaceView *)self _posterImageViewWithTheme:self->_theme];
}

- (void)_selectDefaultListing
{
  *((unsigned char *)self + 32) |= 1u;
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:0 faceView:self];
}

- (id)_defaultListing
{
  double v3 = [(NTKVideoFaceView *)self device];
  uint64_t v4 = +[NTKVideoListingFactory sharedInstanceForDevice:v3];

  id v5 = [v4 defaultListingWithTheme:self->_theme];

  return v5;
}

- (id)_nextListing
{
  double v3 = [(NTKVideoFaceView *)self device];
  uint64_t v4 = +[NTKVideoListingFactory sharedInstanceForDevice:v3];

  id v5 = [(NTKVideoFaceView *)self currentListing];
  if (!v5 || (char v6 = *((unsigned char *)self + 32), v5, (v6 & 1) != 0))
  {
    *((unsigned char *)self + 32) &= ~1u;
    id v12 = [(NTKVideoFaceView *)self _defaultListing];
    uint64_t v13 = objc_msgSend(v4, "anyListingWithTheme:variant:tag:", self->_theme, objc_msgSend(v12, "variant"), 4);
    id v8 = v13;
    if (v13)
    {
      id v8 = v13;

      id v12 = v8;
    }
  }
  else
  {
    double v7 = (int *)[v4 behaviorForTheme:self->_theme];
    id v8 = [(NTKVideoFaceView *)self currentListing];
    if ([(NTKVideoFaceView *)self shouldChangeVariantForScreenWake])
    {
      double v9 = objc_msgSend(v4, "anyListingWithTheme:notMatchingVariant:matchingTag:", self->_theme, objc_msgSend(v8, "variant"), 4);
      id v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        objc_msgSend(v4, "anyListingWithTheme:notMatchingVariant:matchingTag:", self->_theme, objc_msgSend(v8, "variant"), 2);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v12 = v11;
    }
    else
    {
      unint64_t theme = self->_theme;
      id v15 = [v8 variant];
      if (v7 == &dword_4) {
        objc_msgSend(v4, "anyListingWithTheme:variant:tag:notMatchingClip:", theme, v15, 2, objc_msgSend(v8, "clip"));
      }
      else {
      id v12 = [v4 anyListingWithTheme:theme notMatchingVariant:v15 matchingTag:2];
      }
    }
  }

  [(NTKVideoFaceView *)self setShouldChangeVariantForScreenWake:0];

  return v12;
}

- (void)_handleTapToPlayVideoGesture:(id)a3
{
  id v4 = a3;
  if (([(NTKVideoFaceView *)self timeScrubbing] & 1) == 0)
  {
    [(NTKVideoFaceView *)self faultInFaceContentSkippedDuringSwiping];
    if (([(NTKVideoFaceView *)self shouldPause] & 1) == 0)
    {
      [(NTKVideoFaceView *)self _cancelDelayedPlayback];
      id v5 = [(NTKVideoFaceView *)self device];
      char v6 = +[NTKVideoListingFactory sharedInstanceForDevice:v5];

      double v7 = [(NTKVideoFaceView *)self currentListing];
      id v8 = objc_msgSend(v6, "anyListingWithTheme:notMatchingVariant:matchingTag:", self->_theme, objc_msgSend(v7, "variant"), 4);
      if (v8
        || (objc_msgSend(v6, "anyListingWithTheme:notMatchingVariant:matchingTag:", self->_theme, objc_msgSend(v7, "variant"), 2), (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(NTKVideoFaceView *)self setCurrentListing:v8];
        [(NTKVideoFaceView *)self _updateImageToBlur];
        double v9 = [(NTKVideoFaceView *)self videoPlayerView];
        [v9 pause];

        [(UITapGestureRecognizer *)self->_tapToPlayGesture setEnabled:0];
        objc_initWeak(&location, self);
        id v10 = _NSConcreteStackBlock;
        uint64_t v11 = 3221225472;
        id v12 = sub_4ED0;
        uint64_t v13 = &unk_8358;
        objc_copyWeak(&v14, &location);
        [(NTKVideoFaceView *)self _fadeToCurtainViewWithDuration:&v10 completion:0.5];
        *((unsigned char *)self + 32) |= 4u;
        -[NTKDigitialUtilitarianFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self->_faceViewComplicationFactory, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, self, v10, v11, v12, v13);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (BOOL)_shouldDelayBeforePlayingNextVideo
{
  return 0;
}

- (void)videoPlayerViewDidBeginPlaying:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKVideoFaceView;
  [(NTKVideoFaceView *)&v4 videoPlayerViewDidBeginPlaying:a3];
  [(NTKVideoFaceView *)self _hideCurtainView];
  [(UITapGestureRecognizer *)self->_tapToPlayGesture setEnabled:1];
  if ((*((unsigned char *)self + 32) & 2) != 0)
  {
    *((unsigned char *)self + 32) &= ~2u;
  }
  else
  {
    *((unsigned char *)self + 32) &= ~4u;
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:1 faceView:self];
  }
}

- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3
{
  kdebug_trace();
  objc_super v4 = [(NTKVideoFaceView *)self device];
  id v5 = +[NTKVideoListingFactory sharedInstanceForDevice:v4];

  if ((char *)[v5 behaviorForTheme:self->_theme] - 3 <= (unsigned char *)&dword_0 + 1)
  {
    [(NTKVideoFaceView *)self _cancelDelayedPlayback];
    if ([(NTKVideoFaceView *)self _shouldDelayBeforePlayingNextVideo]) {
      [(NTKVideoFaceView *)self _playNextVideoAfterDelay:(double)arc4random_uniform(0x28u) / 10.0 + 1.0];
    }
    else {
      [(NTKVideoFaceView *)self _playNextVideo];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingComplicationColor, 0);
  objc_storeStrong((id *)&self->_tapToPlayGesture, 0);

  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
}

@end