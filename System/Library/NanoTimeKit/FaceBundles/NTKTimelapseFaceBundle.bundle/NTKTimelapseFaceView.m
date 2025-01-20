@interface NTKTimelapseFaceView
- (BOOL)_shouldFadeToTransitionView;
- (BOOL)_timeLabelUsesLegibility;
- (NTKTimelapseFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_newBottomGradientViewWithColor:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_newTopGradientViewWithColor:(id)a3;
- (id)_nextListing;
- (id)_onDeckPosterImageView;
- (id)_onDeckPosterImageViewWithTheme:(unint64_t)a3;
- (id)_posterImageView;
- (id)_posterImageViewWithTheme:(unint64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_viewForEditOption:(id)a3;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (int64_t)swatchImageContentMode;
- (void)_applyComplicationContentSpecificAttributesAnimated:(BOOL)a3;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyScrubbingForegroundColor:(id)a3 shadowColor:(id)a4;
- (void)_configureComplicationFactory;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_endScrubbingAnimationFromUIViewAnimateWithDuration;
- (void)_handleOrdinaryScreenWake;
- (void)_handleTapToPlayVideoGesture:(id)a3;
- (void)_handleWristRaiseScreenWake;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_performPreloadVideoTask;
- (void)_playQueuedUpVideo;
- (void)_prepareForEditing;
- (void)_resetVideoForListing;
- (void)_setDateAttributes:(id)a3 animated:(BOOL)a4;
- (void)_startScrubbingAnimationFromUIViewAnimateWithDuration;
- (void)_unloadSnapshotContentViews;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setShouldShowUnsnapshotableContent:(BOOL)a3;
- (void)videoPlayerViewDidBeginPlaying:(id)a3;
@end

@implementation NTKTimelapseFaceView

- (NTKTimelapseFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKTimelapseFaceView;
  v9 = [(NTKTimelapseFaceView *)&v16 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = (NTKUtilityComplicationFactory *)[objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v10;

    [(NTKTimelapseFaceView *)v9 _configureComplicationFactory];
    v12 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:"_handleTapToPlayVideoGesture:"];
    tapToPlayGesture = v9->_tapToPlayGesture;
    v9->_tapToPlayGesture = v12;

    [(UITapGestureRecognizer *)v9->_tapToPlayGesture setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v9->_tapToPlayGesture setDelegate:v9];
    [(UITapGestureRecognizer *)v9->_tapToPlayGesture setEnabled:0];
    [(NTKTimelapseFaceView *)v9 addGestureRecognizer:v9->_tapToPlayGesture];
    v14 = [(NTKTimelapseFaceView *)v9 device];
    v9->_deviceSizeClass = (unint64_t)[v14 sizeClass];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(NTKTimelapseFaceView *)self device];
  v4 = +[NTKTimelapseListingFactory sharedInstanceForDevice:v3];
  [v4 discardAssets];

  v5.receiver = self;
  v5.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v5 dealloc];
}

- (BOOL)_timeLabelUsesLegibility
{
  return 1;
}

- (void)_prepareForEditing
{
  v15.receiver = self;
  v15.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v15 _prepareForEditing];
  if (*(_OWORD *)&self->_topGradientView != 0)
  {
    v3 = self->_topGradientView;
    v4 = self->_bottomGradientView;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_5844;
    v12[3] = &unk_103A0;
    v13 = v3;
    v14 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_5888;
    v9[3] = &unk_103C8;
    v10 = v13;
    v11 = v14;
    objc_super v5 = v14;
    v6 = v13;
    +[UIView animateWithDuration:v12 animations:v9 completion:0.25];
    topGradientView = self->_topGradientView;
    self->_topGradientView = 0;

    bottomGradientView = self->_bottomGradientView;
    self->_bottomGradientView = 0;
  }
}

- (void)setShouldShowUnsnapshotableContent:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v6 setShouldShowUnsnapshotableContent:!a3];
  v5.receiver = self;
  v5.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v5 setShouldShowUnsnapshotableContent:v3];
}

- (void)_loadSnapshotContentViews
{
  v19.receiver = self;
  v19.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v19 _loadSnapshotContentViews];
  id v3 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKTimelapseFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NTKTimelapseFaceView *)self device];
  v13 = (UIView *)objc_msgSend(v3, "initWithFrame:forDeviceCornerRadius:", v12, v5, v7, v9, v11);
  cornerView = self->_cornerView;
  self->_cornerView = v13;

  objc_super v15 = self->_cornerView;
  objc_super v16 = [(NTKTimelapseFaceView *)self contentView];
  [(NTKTimelapseFaceView *)self insertSubview:v15 above:v16];

  v17 = [(NTKTimelapseFaceView *)self _nextListing];
  v18 = [v17 photoAnalysis];
  [(NTKTimelapseFaceView *)self _setDateAttributes:v18 animated:0];
}

- (void)_unloadSnapshotContentViews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v8 _unloadSnapshotContentViews];
  [(UIView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;

  [(UIView *)self->_topGradientView removeFromSuperview];
  topGradientView = self->_topGradientView;
  self->_topGradientView = 0;

  [(UIView *)self->_bottomGradientView removeFromSuperview];
  bottomGradientView = self->_bottomGradientView;
  self->_bottomGradientView = 0;

  double v6 = [(NTKTimelapseFaceView *)self device];
  double v7 = +[NTKTimelapseListingFactory sharedInstanceForDevice:v6];
  [v7 discardAssets];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v12 layoutSubviews];
  id v3 = [(NTKTimelapseFaceView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_cornerView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
}

- (void)_loadLayoutRules
{
  v26.receiver = self;
  v26.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v26 _loadLayoutRules];
  [(NTKTimelapseFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(NTKTimelapseFaceView *)self _shouldAdjustLayoutForTimeTravel])
  {
    [(NTKTimelapseFaceView *)self _timeTravelYAdjustment];
    CLKAlterRect();
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v27[0] = NTKComplicationSlotTopRight;
  v27[1] = NTKComplicationSlotBottom;
  objc_super v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2, 0);
  id v16 = [v15 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v21 = [(NTKTimelapseFaceView *)self complicationLayoutforSlot:v20];
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v21, [(NTKTimelapseFaceView *)self _utilitySlotForSlot:v20], v4, v6, v8, v10);
      }
      id v17 = [v15 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v17);
  }
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:NTKComplicationSlotTopRight])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqual:NTKComplicationSlotBottom])
  {
    int64_t v4 = 9;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (void)_configureComplicationFactory
{
  [(NTKUtilityComplicationFactory *)self->_complicationFactory setForegroundAlpha:1.0];
  complicationFactory = self->_complicationFactory;

  [(NTKUtilityComplicationFactory *)complicationFactory setForegroundImageAlpha:1.0];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [v9 setFontWeight:UIFontWeightSemibold];
  [v9 setForegroundColor:self->_foregroundColor];
  [v9 setShadowColor:self->_shadowColor];
  if ([v6 isEqualToString:NTKComplicationSlotBottom]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = *((unsigned char *)self + 80) & 1;
  }
  [v9 setUsesLegibility:v7];
  [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundAlphaForEditing:[(NTKTimelapseFaceView *)self editing]];
  objc_msgSend(v9, "setForegroundAlpha:");
  [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundImageAlphaForEditing:[(NTKTimelapseFaceView *)self editing]];
  objc_msgSend(v9, "setForegroundImageAlpha:");
  objc_msgSend(v9, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKTimelapseFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v6)));
  [v9 setSuppressesInternalColorOverrides:1];
  double v8 = +[UIColor clearColor];
  [v9 setBackgroundColor:v8];
}

- (void)_applyComplicationContentSpecificAttributesAnimated:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_6068;
  v3[3] = &unk_103F0;
  BOOL v4 = a3;
  v3[4] = self;
  [(NTKTimelapseFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v3];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v22.receiver = self;
  v22.super_class = (Class)NTKTimelapseFaceView;
  id v8 = a3;
  [(NTKTimelapseFaceView *)&v22 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  unint64_t theme = self->_theme;
  id v10 = objc_msgSend(v8, "timelapseTheme", v22.receiver, v22.super_class);

  self->_unint64_t theme = (unint64_t)v10;
  if (([(NTKTimelapseFaceView *)self editing] & 1) == 0)
  {
    double v11 = [(NTKTimelapseFaceView *)self _nextListing];
    double v12 = [v11 photoAnalysis];
    [(NTKTimelapseFaceView *)self _setDateAttributes:v12 animated:0];
  }
  if (theme != self->_theme || [(NTKTimelapseFaceView *)self editing])
  {
    double v13 = [(NTKTimelapseFaceView *)self posterImageView];
    double v14 = [(NTKTimelapseFaceView *)self device];
    objc_super v15 = +[NTKTimelapseListingFactory sharedInstanceForDevice:v14];
    id v16 = [v15 posterImageWithTheme:self->_theme];
    [v13 setImage:v16];
  }
  id v17 = [(NTKTimelapseFaceView *)self posterImageView];
  [v17 removeFromSuperview];

  uint64_t v18 = [(NTKTimelapseFaceView *)self backgroundContainerView];
  objc_super v19 = [(NTKTimelapseFaceView *)self posterImageView];
  [v18 addSubview:v19];

  uint64_t v20 = [(NTKTimelapseFaceView *)self backgroundContainerView];
  v21 = [(NTKTimelapseFaceView *)self posterImageView];
  [v20 sendSubviewToBack:v21];

  [(NTKTimelapseFaceView *)self setNeedsLayout];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v5 _configureForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  complicationFactory = self->_complicationFactory;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NTKUtilityComplicationFactory *)complicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKTimelapseFaceView *)self _utilitySlotForSlot:v9]];

  [(NTKTimelapseFaceView *)self _configureComplicationView:v11 forSlot:v9];
  return v11;
}

- (int64_t)swatchImageContentMode
{
  return 2;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  objc_super v5 = [a3 resourceBaseName];
  id v6 = NTKImageNamedFromAssetsBundle();

  return v6;
}

- (void)_handleWristRaiseScreenWake
{
  v2.receiver = self;
  v2.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v2 _handleWristRaiseScreenWake];
}

- (void)_handleOrdinaryScreenWake
{
  v2.receiver = self;
  v2.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v2 _handleOrdinaryScreenWake];
}

- (void)_performPreloadVideoTask
{
  v5.receiver = self;
  v5.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v5 _performPreloadVideoTask];
  if ((*((unsigned char *)self + 80) & 2) == 0)
  {
    *((unsigned char *)self + 80) |= 2u;
    id v3 = [(NTKTimelapseFaceView *)self currentListing];
    BOOL v4 = [v3 photoAnalysis];
    [(NTKTimelapseFaceView *)self _setDateAttributes:v4 animated:0];
  }
}

- (id)_viewForEditOption:(id)a3
{
  id v4 = [a3 timelapseTheme];

  return [(NTKTimelapseFaceView *)self _posterImageViewWithTheme:v4];
}

- (BOOL)_shouldFadeToTransitionView
{
  return 1;
}

- (void)videoPlayerViewDidBeginPlaying:(id)a3
{
  id v4 = [(NTKTimelapseFaceView *)self currentListing];
  objc_super v5 = v4;
  if ((*((unsigned char *)self + 80) & 2) != 0)
  {
    *((unsigned char *)self + 80) &= ~2u;
  }
  else
  {
    id v6 = [v4 photoAnalysis];
    [(NTKTimelapseFaceView *)self _setDateAttributes:v6 animated:1];
  }
  if ([(NTKTimelapseFaceView *)self _curtainViewVisible])
  {
    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeScale(&v16, 0.95, 0.95);
    CGAffineTransform v15 = v16;
    uint64_t v7 = [(NTKTimelapseFaceView *)self videoPlayerView];
    CGAffineTransform v14 = v15;
    [v7 setTransform:&v14];

    CGAffineTransform v13 = v16;
    [(UIView *)self->_topGradientView setTransform:&v13];
    CGAffineTransform v12 = v16;
    [(UIView *)self->_bottomGradientView setTransform:&v12];
    CGAffineTransform v11 = v16;
    [(UIView *)self->_cornerView setTransform:&v11];
    id v8 = [(NTKTimelapseFaceView *)self videoPlayerView];
    [v8 setAlpha:0.0];

    [(UIView *)self->_topGradientView setAlpha:0.0];
    [(UIView *)self->_bottomGradientView setAlpha:0.0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_6898;
    v10[3] = &unk_10418;
    v10[4] = self;
    +[UIView animateWithDuration:0x20000 delay:v10 options:0 animations:0.8 completion:0.0];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_6910;
    v9[3] = &unk_10418;
    void v9[4] = self;
    +[UIView animateWithDuration:0 delay:v9 options:0 animations:0.25 completion:0.1];
  }
  [(NTKTimelapseFaceView *)self _hideCurtainView];
  [(UITapGestureRecognizer *)self->_tapToPlayGesture setEnabled:1];
}

- (void)_handleTapToPlayVideoGesture:(id)a3
{
  id v4 = a3;
  if (([(NTKTimelapseFaceView *)self timeScrubbing] & 1) == 0)
  {
    [(NTKTimelapseFaceView *)self faultInFaceContentSkippedDuringSwiping];
    if (([(NTKTimelapseFaceView *)self shouldPause] & 1) == 0
      && [v4 state] == (char *)&dword_0 + 3)
    {
      [(NTKTimelapseFaceView *)self _cancelDelayedPlayback];
      objc_super v5 = [(NTKTimelapseFaceView *)self videoPlayerView];
      [v5 pause];

      [(UITapGestureRecognizer *)self->_tapToPlayGesture setEnabled:0];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_6AFC;
      v6[3] = &unk_10418;
      v6[4] = self;
      [(NTKTimelapseFaceView *)self _fadeToCurtainViewWithDuration:v6 completion:0.3];
    }
  }
}

- (id)_newTopGradientViewWithColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = NTKImageNamed();
  id v6 = [(NTKTimelapseFaceView *)self device];
  [v6 screenBounds];
  double v8 = v7;
  [v5 size];
  double v10 = v9;

  id v11 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v8, v10);
  CGAffineTransform v12 = [v11 layer];
  id v13 = v4;
  id v14 = [v13 CGColor];

  [v12 setContentsMultiplyColor:v14];
  CGAffineTransform v15 = [v11 layer];
  id v16 = v5;
  objc_msgSend(v15, "setContents:", objc_msgSend(v16, "CGImage"));

  id v17 = [(NTKTimelapseFaceView *)self _curtainView];
  uint64_t v18 = [(NTKTimelapseFaceView *)self contentView];
  objc_super v19 = v18;
  if (v17) {
    [v18 insertSubview:v11 belowSubview:v17];
  }
  else {
    [v18 addSubview:v11];
  }

  return v11;
}

- (id)_newBottomGradientViewWithColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NTKTimelapseFaceBundle imageWithName:@"TimelapseGradient"];
  id v6 = [(NTKTimelapseFaceView *)self device];
  [v6 screenBounds];
  double v8 = v7;
  double v10 = v9;

  [v5 size];
  double v12 = v10 - v11;
  [v5 size];
  id v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, v12, v8, v13);
  CGAffineTransform v15 = [v14 layer];
  id v16 = v4;
  id v17 = [v16 CGColor];

  [v15 setContentsMultiplyColor:v17];
  uint64_t v18 = [v14 layer];
  id v19 = v5;
  objc_msgSend(v18, "setContents:", objc_msgSend(v19, "CGImage"));

  uint64_t v20 = self->_topGradientView;
  v21 = [(NTKTimelapseFaceView *)self _curtainView];
  if (v20)
  {
    objc_super v22 = [(NTKTimelapseFaceView *)self contentView];
    long long v23 = v22;
    id v24 = v14;
    long long v25 = v20;
  }
  else
  {
    objc_super v22 = [(NTKTimelapseFaceView *)self contentView];
    long long v23 = v22;
    id v24 = v14;
    if (!v21)
    {
      [v22 addSubview:v14];
      goto LABEL_6;
    }
    long long v25 = v21;
  }
  [v22 insertSubview:v24 belowSubview:v25];
LABEL_6:

  return v14;
}

- (void)_setDateAttributes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    goto LABEL_18;
  }
  double v7 = +[UIColor whiteColor];
  if ([v6 isComplexBackground])
  {
    [v6 bgHue];
    double v9 = v8;
    [v6 bgSaturation];
    double v11 = v10;
    [v6 bgBrightness];
    double v13 = +[UIColor colorWithHue:v9 saturation:v11 brightness:v12 alpha:0.7];
LABEL_8:
    char v22 = 1;
LABEL_9:
    [v6 bgHue];
    double v24 = v23;
    [v6 bgSaturation];
    double v26 = v25;
    [v6 bgBrightness];
    v21 = +[UIColor colorWithHue:v24 saturation:v26 brightness:v27 alpha:0.9];
    goto LABEL_10;
  }
  if (([v6 isColoredText] & 1) == 0)
  {
    double v13 = 0;
    goto LABEL_8;
  }
  [v6 textHue];
  double v15 = v14;
  [v6 textSaturation];
  double v17 = v16;
  [v6 textBrightness];
  uint64_t v19 = +[UIColor colorWithHue:v15 saturation:v17 brightness:v18 alpha:1.0];

  [v6 bgHue];
  v21 = +[UIColor colorWithHue:v20 saturation:0.15 brightness:1.0 alpha:0.9];
  char v22 = 0;
  double v13 = 0;
  double v7 = (void *)v19;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_10:
  [v6 shadowHue];
  double v29 = v28;
  [v6 shadowSaturation];
  double v31 = v30;
  [v6 shadowBrightness];
  v33 = +[UIColor colorWithHue:v29 saturation:v31 brightness:v32 alpha:1.0];
  objc_storeStrong((id *)&self->_shadowColor, v33);
  objc_storeStrong((id *)&self->_foregroundColor, v7);
  *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xFE | v22;
  v34 = [(NTKTimelapseFaceView *)self timeView];
  [(UIView *)self->_topGradientView removeFromSuperview];
  topGradientView = self->_topGradientView;
  self->_topGradientView = 0;

  [(UIView *)self->_bottomGradientView removeFromSuperview];
  bottomGradientView = self->_bottomGradientView;
  self->_bottomGradientView = 0;

  if (v13)
  {
    v37 = [(NTKTimelapseFaceView *)self _newTopGradientViewWithColor:v13];
    v38 = self->_topGradientView;
    self->_topGradientView = v37;
  }
  if (v21)
  {
    v39 = [(NTKTimelapseFaceView *)self _newBottomGradientViewWithColor:v21];
    v40 = self->_bottomGradientView;
    self->_bottomGradientView = v39;
  }
  if (v4)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_722C;
    v41[3] = &unk_10440;
    id v42 = v34;
    id v43 = v7;
    id v44 = v33;
    +[UIView transitionWithView:v42 duration:5242880 options:v41 animations:0 completion:0.8];
  }
  else
  {
    [v34 setColor:v7];
    [v34 setShadowColor:v33];
  }
  [(NTKTimelapseFaceView *)self _applyComplicationContentSpecificAttributesAnimated:v4];
  [(NTKTimelapseFaceView *)self setNeedsLayout];

LABEL_18:
}

- (void)_applyDataMode
{
  v3.receiver = self;
  v3.super_class = (Class)NTKTimelapseFaceView;
  [(NTKTimelapseFaceView *)&v3 _applyDataMode];
  [(UITapGestureRecognizer *)self->_tapToPlayGesture setEnabled:[(NTKTimelapseFaceView *)self dataMode] == (char *)&dword_0 + 1];
}

- (id)_posterImageViewWithTheme:(unint64_t)a3
{
  id v5 = objc_alloc((Class)UIImageView);
  [(NTKTimelapseFaceView *)self bounds];
  id v6 = objc_msgSend(v5, "initWithFrame:");
  [v6 setContentMode:2];
  [v6 setClipsToBounds:1];
  double v7 = [(NTKTimelapseFaceView *)self device];
  float v8 = +[NTKTimelapseListingFactory sharedInstanceForDevice:v7];
  double v9 = [v8 posterImageWithTheme:a3];
  [v6 setImage:v9];

  return v6;
}

- (id)_posterImageView
{
  return [(NTKTimelapseFaceView *)self _posterImageViewWithTheme:self->_theme];
}

- (id)_onDeckPosterImageViewWithTheme:(unint64_t)a3
{
  id v5 = objc_alloc((Class)UIImageView);
  [(NTKTimelapseFaceView *)self bounds];
  id v6 = objc_msgSend(v5, "initWithFrame:");
  [v6 setContentMode:2];
  [v6 setClipsToBounds:1];
  double v7 = +[NTKLocationManager sharedLocationManager];
  float v8 = [v7 anyLocation];
  [v8 coordinate];
  double v10 = v9;
  double v12 = v11;

  double v13 = +[NTKDate faceDate];
  float v14 = [(NTKTimelapseFaceView *)self device];
  double v15 = +[NTKTimelapseListingFactory sharedInstanceForDevice:v14];
  float v16 = objc_msgSend(v15, "heroImageWithTheme:date:location:", a3, v13, v10, v12);
  [v6 setImage:v16];

  double v17 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    float v18 = [v6 image];
    uint64_t v19 = [v18 description];
    int v21 = 136316419;
    char v22 = "-[NTKTimelapseFaceView _onDeckPosterImageViewWithTheme:]";
    __int16 v23 = 2112;
    double v24 = v19;
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    __int16 v27 = 2112;
    float v28 = v13;
    __int16 v29 = 2049;
    double v30 = v10;
    __int16 v31 = 2049;
    double v32 = v12;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%s creating NTKTimelapseListingFactory with image:%@ theme:%lu date:%@ latitude:%{private}f longitude:%{private}f", (uint8_t *)&v21, 0x3Eu);
  }

  return v6;
}

- (id)_onDeckPosterImageView
{
  return [(NTKTimelapseFaceView *)self _onDeckPosterImageViewWithTheme:self->_theme];
}

- (void)_resetVideoForListing
{
  objc_super v2 = [(NTKTimelapseFaceView *)self videoPlayerView];
  long long v3 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v2 seekToTime:&v3];
}

- (id)_nextListing
{
  [(NTKTimelapseFaceView *)self setShouldChangeVariantForScreenWake:0];
  long long v3 = +[NTKLocationManager sharedLocationManager];
  BOOL v4 = [v3 anyLocation];
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;

  double v9 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t theme = self->_theme;
    double v11 = +[NTKDate faceDate];
    int v18 = 136316163;
    uint64_t v19 = "-[NTKTimelapseFaceView _nextListing]";
    __int16 v20 = 2048;
    unint64_t v21 = theme;
    __int16 v22 = 2112;
    __int16 v23 = v11;
    __int16 v24 = 2049;
    double v25 = v6;
    __int16 v26 = 2049;
    double v27 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%s creating NTKTimelapseListingFactory with theme:%lu date:%@ latitude:%{private}f longitude:%{private}f", (uint8_t *)&v18, 0x34u);
  }
  double v12 = [(NTKTimelapseFaceView *)self device];
  double v13 = +[NTKTimelapseListingFactory sharedInstanceForDevice:v12];
  unint64_t v14 = self->_theme;
  double v15 = +[NTKDate faceDate];
  float v16 = objc_msgSend(v13, "listingWithTheme:date:location:", v14, v15, v6, v8);

  return v16;
}

- (void)_playQueuedUpVideo
{
  long long v3 = [(NTKTimelapseFaceView *)self _nextListing];
  BOOL v4 = [(NTKTimelapseFaceView *)self currentListing];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  double v5 = [(NTKTimelapseFaceView *)self currentListing];
  unsigned int v6 = [v3 isSimilarTo:v5];

  if (!v6)
  {
LABEL_5:
    double v9 = self;
    double v7 = &selRef__playNextVideo;
    double v8 = &v9;
    goto LABEL_6;
  }
  double v10 = self;
  double v7 = &selRef__playQueuedUpVideo;
  double v8 = &v10;
LABEL_6:
  v8[1] = (NTKTimelapseFaceView *)NTKTimelapseFaceView;
  objc_msgSendSuper2((objc_super *)v8, *v7, v9);
}

- (void)_applyScrubbingForegroundColor:(id)a3 shadowColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NTKTimelapseFaceView *)self timeView];
  [v8 setColor:v6];
  [v8 setShadowColor:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_79E4;
  v11[3] = &unk_10468;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NTKTimelapseFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v11];
}

- (void)_startScrubbingAnimationFromUIViewAnimateWithDuration
{
  id v4 = +[UIColor whiteColor];
  long long v3 = +[UIColor clearColor];
  [(NTKTimelapseFaceView *)self _applyScrubbingForegroundColor:v4 shadowColor:v3];
}

- (void)_endScrubbingAnimationFromUIViewAnimateWithDuration
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomGradientView, 0);
  objc_storeStrong((id *)&self->_topGradientView, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_tapToPlayGesture, 0);

  objc_storeStrong((id *)&self->_cornerView, 0);
}

@end