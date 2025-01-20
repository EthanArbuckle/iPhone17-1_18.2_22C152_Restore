@interface NTKPrideDigitalFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_supportsUnadornedSnapshot;
- (NTKPrideDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationsAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_timeAlphaForEditMode:(int64_t)a3;
- (id)_complicationDisplayWrapperForTouch:(id)a3;
- (id)_digitalTimeLabelStyle;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applySlow;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_loadBackgroundViews;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_unloadBackgroundViews;
- (void)_unloadSnapshotContentViews;
- (void)_updatePausedState;
- (void)dealloc;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)setActiveQuad:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation NTKPrideDigitalFaceView

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideDigitalFaceView;
  [(NTKPrideDigitalFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKPrideDigitalFaceView *)self _loadBackgroundViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideDigitalFaceView;
  [(NTKPrideDigitalFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKPrideDigitalFaceView *)self _unloadBackgroundViews];
}

- (id)_digitalTimeLabelStyle
{
  [(NTKPrideDigitalFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NTKPrideDigitalFaceView *)self device];
  NTKDigitalTimeLabelStyleWideRightSideMargin();
  double v13 = v12;
  v14 = [(NTKPrideDigitalFaceView *)self device];
  v15 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v14, v4, v6, v8, v10, v13);

  return v15;
}

- (void)_loadBackgroundViews
{
  double v3 = [(NTKPrideDigitalFaceView *)self _digitalTimeLabelStyle];
  timeLabelDefaultStyle = self->_timeLabelDefaultStyle;
  self->_timeLabelDefaultStyle = v3;

  double v5 = [(NTKPrideDigitalFaceView *)self timeView];
  timeLabel = self->_timeLabel;
  self->_timeLabel = v5;

  double v7 = self->_timeLabel;
  double v8 = +[UIColor colorWithWhite:0.0 alpha:0.5];
  [(NTKDigitalTimeLabel *)v7 setShadowColor:v8];

  [(NTKDigitalTimeLabel *)self->_timeLabel setStyle:self->_timeLabelDefaultStyle];
  [(NTKDigitalTimeLabel *)self->_timeLabel setUsesLegibility:1];
  double v9 = self->_timeLabel;
  double v10 = +[UIColor whiteColor];
  [(NTKDigitalTimeLabel *)v9 setTextColor:v10];

  [(NTKPrideDigitalFaceView *)self addSubview:self->_timeLabel];
  [(NTKPrideDigitalFaceView *)self setTimeView:self->_timeLabel];
  [(NTKDigitalTimeLabel *)self->_timeLabel setFrameUsingCurrentStyle];
  [(NTKPrideDigitalFaceView *)self addSubview:self->_bandsView];
  [(NTKPrideLinearQuad *)self->_activeQuad clearWaves];
  id v11 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKPrideDigitalFaceView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(NTKPrideDigitalFaceView *)self device];
  v21 = (NTKRoundedCornerOverlayView *)objc_msgSend(v11, "initWithFrame:forDeviceCornerRadius:", v20, v13, v15, v17, v19);
  cornerOverlay = self->_cornerOverlay;
  self->_cornerOverlay = v21;

  [(NTKPrideDigitalFaceView *)self addSubview:self->_cornerOverlay];
  [(NTKPrideDigitalFaceView *)self bringSubviewToFront:self->_cornerOverlay];
  [(NTKPrideDigitalFaceView *)self layoutSubviews];
  activeQuad = self->_activeQuad;

  [(NTKPrideSplinesQuad *)activeQuad forceRender];
}

- (void)_unloadBackgroundViews
{
  [(NTKDigitalTimeLabel *)self->_timeLabel removeFromSuperview];
  timeLabel = self->_timeLabel;
  self->_timeLabel = 0;

  [(CLKUIQuadView *)self->_bandsView removeFromSuperview];
  [(NTKRoundedCornerOverlayView *)self->_cornerOverlay removeFromSuperview];
  cornerOverlay = self->_cornerOverlay;
  self->_cornerOverlay = 0;
}

- (NTKPrideDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NTKPrideDigitalFaceView;
  double v9 = [(NTKPrideDigitalFaceView *)&v19 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    double v10 = (NTKFaceViewComplicationFactory *)[objc_alloc((Class)NTKDigitialUtilitarianFaceViewComplicationFactory) initForDevice:v8];
    layoutContentProvider = v9->_layoutContentProvider;
    v9->_layoutContentProvider = v10;

    uint64_t v12 = +[CLKUIQuadView quadViewWithFrame:@"PrDg", 0, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height identifier options colorSpace];
    bandsView = v9->_bandsView;
    v9->_bandsView = (CLKUIQuadView *)v12;

    double v14 = [[NTKPrideBetweenLinearQuad alloc] initWithDevice:v8 useXRsRGB:0];
    ribbonsQuad = v9->_ribbonsQuad;
    v9->_ribbonsQuad = v14;

    [(NTKPrideLinearQuad *)v9->_ribbonsQuad setFabricMode];
    [(NTKPrideLinearQuad *)v9->_ribbonsQuad clearWaves];
    double v16 = [[NTKPrideLinearQuad alloc] initWithDevice:v8 useXRsRGB:0];
    bandsQuad = v9->_bandsQuad;
    v9->_bandsQuad = v16;

    [(NTKPrideLinearQuad *)v9->_bandsQuad clearWaves];
    [(CLKUIQuadView *)v9->_bandsView addQuad:v9->_ribbonsQuad];
    [(CLKUIQuadView *)v9->_bandsView addQuad:v9->_bandsQuad];
    [(NTKPrideSplinesQuad *)v9->_ribbonsQuad setFadeMultiplier:0.0];
    [(NTKPrideSplinesQuad *)v9->_bandsQuad setFadeMultiplier:0.0];
    [(NTKPrideDigitalFaceView *)v9 layoutSubviews];
  }

  return v9;
}

- (void)dealloc
{
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKPrideDigitalFaceView;
  [(NTKPrideDigitalFaceView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideDigitalFaceView;
  [(NTKPrideDigitalFaceView *)&v3 layoutSubviews];
  [(NTKDigitalTimeLabel *)self->_timeLabel setFrameUsingCurrentStyle];
  [(NTKPrideDigitalFaceView *)self bounds];
  -[CLKUIQuadView setFrame:](self->_bandsView, "setFrame:");
  [(NTKPrideDigitalFaceView *)self sendSubviewToBack:self->_bandsView];
  [(CLKUIQuadView *)self->_bandsView layoutSubviews];
}

- (void)_loadLayoutRules
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideDigitalFaceView;
  [(NTKPrideDigitalFaceView *)&v3 _loadLayoutRules];
  [(NTKFaceViewComplicationFactory *)self->_layoutContentProvider loadLayoutRulesForFaceView:self];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  layoutContentProvider = self->_layoutContentProvider;
  id v9 = a5;
  id v10 = [(NTKFaceViewComplicationFactory *)layoutContentProvider newLegacyViewForComplication:a3 family:a4 slot:v9 faceView:self];
  [(NTKPrideDigitalFaceView *)self _configureComplicationView:v10 forSlot:v9];

  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(NTKFaceViewComplicationFactory *)self->_layoutContentProvider configureComplicationView:v10 forSlot:v6 faceView:self];
  [v10 setSuppressesInternalColorOverrides:1];
  id v7 = [v6 isEqualToString:NTKComplicationSlotBottom];
  if (v7)
  {
    id v8 = +[UIColor colorWithWhite:0.0 alpha:0.7];
    [v10 setShadowColor:v8];
  }
  else
  {
    if (![v6 isEqualToString:NTKComplicationSlotTopRight]) {
      goto LABEL_6;
    }
    [v10 setShadowColor:0];
    id v9 = +[UIColor whiteColor];
    [v10 setForegroundColor:v9];

    [v10 setForegroundAlpha:1.0];
    [v10 setForegroundImageAlpha:1.0];
  }
  [v10 setUsesLegibility:v7];
LABEL_6:
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 15)
  {
    id v10 = a5;
    [a4 style];
    [v10 style];

    ribbonsQuad = self->_ribbonsQuad;
    CLKInterpolateBetweenFloatsUnclipped();
    *(float *)&double v12 = v12;
    [(NTKPrideSplinesQuad *)ribbonsQuad setFadeMultiplier:v12];
    bandsQuad = self->_bandsQuad;
    CLKInterpolateBetweenFloatsUnclipped();
    *(float *)&double v14 = v14;
    [(NTKPrideSplinesQuad *)bandsQuad setFadeMultiplier:v14];
    double v15 = self->_bandsQuad;
    CLKInterpolateBetweenFloatsUnclipped();
    -[NTKPrideLinearQuad applyTransitionFromBandedToFabricWithFraction:](v15, "applyTransitionFromBandedToFabricWithFraction:");
    [(NTKPrideSplinesQuad *)self->_ribbonsQuad forceRenderOnce];
    [(NTKPrideSplinesQuad *)self->_bandsQuad forceRenderOnce];
    bandsView = self->_bandsView;
    [(CLKUIQuadView *)bandsView renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
  }
}

- (void)setActiveQuad:(id)a3
{
  objc_super v4 = (NTKPrideLinearQuad *)a3;
  [(NTKPrideSplinesQuad *)self->_activeQuad setEnableRecording:0];
  activeQuad = self->_activeQuad;
  self->_activeQuad = v4;
  id v6 = v4;

  [(NTKPrideSplinesQuad *)self->_activeQuad setEnableRecording:1];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 != 15) {
    return;
  }
  id v6 = (char *)[a3 style];
  if (v6)
  {
    if (v6 == (unsigned char *)&dword_0 + 2)
    {
      p_ribbonsQuad = &self->_ribbonsQuad;
      [(NTKPrideLinearQuad *)self->_ribbonsQuad setFabricMode];
      LODWORD(v10) = 1.0;
      [(NTKPrideSplinesQuad *)self->_ribbonsQuad setFadeMultiplier:v10];
      p_bandsQuad = &self->_bandsQuad;
      double v8 = 0.0;
      goto LABEL_10;
    }
    if (v6 != (unsigned char *)&dword_0 + 1) {
      return;
    }
    p_bandsQuad = &self->_bandsQuad;
    [(NTKPrideLinearQuad *)self->_bandsQuad setFabricMode];
  }
  else
  {
    p_bandsQuad = &self->_bandsQuad;
    [(NTKPrideLinearQuad *)self->_bandsQuad setBandedMode];
  }
  [(NTKPrideSplinesQuad *)self->_ribbonsQuad setFadeMultiplier:0.0];
  LODWORD(v8) = 1.0;
  p_ribbonsQuad = (NTKPrideBetweenLinearQuad **)p_bandsQuad;
LABEL_10:
  [(NTKPrideSplinesQuad *)*p_bandsQuad setFadeMultiplier:v8];
  id v11 = *p_ribbonsQuad;

  [(NTKPrideDigitalFaceView *)self setActiveQuad:v11];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKPrideDigitalFaceView;
  -[NTKPrideDigitalFaceView _configureForEditMode:](&v6, "_configureForEditMode:");
  double v5 = NTKEditModeDimmedAlpha;
  if (!a3) {
    double v5 = 1.0;
  }
  [(NTKDigitalTimeLabel *)self->_timeLabel setAlpha:v5];
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_timeAlphaForEditMode:(int64_t)a3
{
  if (a3 == 1) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (a3 == 15) {
    return NTKEditModeDimmedAlpha;
  }
  return result;
}

- (double)_complicationsAlphaForEditMode:(int64_t)a3
{
  if (!a3) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (a3 == 15) {
    return NTKEditModeDimmedAlpha;
  }
  return result;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NTKPrideDigitalFaceView;
  -[NTKPrideDigitalFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v18, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKPrideDigitalFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKPrideDigitalFaceView *)self _timeAlphaForEditMode:a5];
  [(NTKPrideDigitalFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKPrideDigitalFaceView *)self _contentAlphaForEditMode:a5];
  [(NTKPrideDigitalFaceView *)self _complicationsAlphaForEditMode:a4];
  float v10 = v9;
  [(NTKPrideDigitalFaceView *)self _complicationsAlphaForEditMode:a5];
  float v12 = v11;
  timeLabel = self->_timeLabel;
  CLKInterpolateBetweenFloatsClipped();
  -[NTKDigitalTimeLabel setAlpha:](timeLabel, "setAlpha:");
  bandsView = self->_bandsView;
  CLKInterpolateBetweenFloatsClipped();
  -[CLKUIQuadView setAlpha:](bandsView, "setAlpha:");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_CF8C;
  v15[3] = &unk_247E8;
  float v16 = v10;
  float v17 = v12;
  *(double *)&v15[4] = a3;
  [(NTKPrideDigitalFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v15];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (unint64_t)a4 > 1;
}

- (void)_finalizeForSnapshotting:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  [(NTKPrideLinearQuad *)self->_activeQuad clearWaves];
  if (![(NTKPrideSplinesQuad *)self->_activeQuad forceRender])
  {
    double v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1829C(v5);
    }
  }
  v4[2](v4);
}

- (BOOL)_supportsUnadornedSnapshot
{
  return 0;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return (int64_t)[(NTKFaceViewComplicationFactory *)self->_layoutContentProvider keylineStyleForComplicationSlot:a3];
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKFaceViewComplicationFactory *)self->_layoutContentProvider legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (void)_applySlow
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideDigitalFaceView;
  [(NTKPrideDigitalFaceView *)&v4 _applySlow];
  [(NTKPrideDigitalFaceView *)self _updatePausedState];
  int wasSlow = self->_wasSlow;
  if (wasSlow != [(NTKPrideDigitalFaceView *)self isSlow]) {
    [(NTKPrideSplinesQuad *)self->_activeQuad forceRender];
  }
  self->_int wasSlow = [(NTKPrideDigitalFaceView *)self isSlow];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  [(NTKPrideDigitalFaceView *)self _updatePausedState];
  if ((NTKIsDaemonOrFaceSnapshotService() & 1) == 0
    && [(NTKPrideDigitalFaceView *)self dataMode] == (char *)&dword_0 + 1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D1FC;
    block[3] = &unk_24810;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updatePausedState
{
  objc_super v3 = (char *)[(NTKPrideDigitalFaceView *)self dataMode];
  unsigned int v4 = [(NTKPrideDigitalFaceView *)self isFrozen];
  int v5 = NTKIsScreenOn();
  if (v3 == (unsigned char *)&dword_0 + 1) {
    uint64_t v6 = v4 | v5 ^ 1;
  }
  else {
    uint64_t v6 = 1;
  }
  bandsView = self->_bandsView;

  [(CLKUIQuadView *)bandsView setPaused:v6];
}

- (void)_applyDataMode
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideDigitalFaceView;
  [(NTKPrideDigitalFaceView *)&v4 _applyDataMode];
  objc_super v3 = (char *)[(NTKPrideDigitalFaceView *)self dataMode];
  if ((unint64_t)(v3 - 2) >= 4)
  {
    if ((unint64_t)v3 <= 1)
    {
      [(NTKPrideSplinesQuad *)self->_activeQuad setIgnoresStrumAndTap:0];
      [(NTKPrideDigitalFaceView *)self _updatePausedState];
    }
  }
  else
  {
    [(NTKPrideSplinesQuad *)self->_activeQuad setIgnoresStrumAndTap:1];
    [(NTKPrideLinearQuad *)self->_activeQuad clearWaves];
    [(NTKPrideDigitalFaceView *)self _updatePausedState];
    [(NTKPrideDigitalFaceView *)self renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
  }
}

- (id)_complicationDisplayWrapperForTouch:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = sub_D468;
  double v14 = sub_D478;
  id v15 = 0;
  [v4 locationInView:self];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_D480;
  v9[3] = &unk_24838;
  v9[6] = v5;
  v9[7] = v6;
  v9[4] = self;
  v9[5] = &v10;
  [(NTKPrideDigitalFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKPrideDigitalFaceView;
  id v6 = a4;
  [(NTKPrideDigitalFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  [(NTKPrideSplinesQuad *)self->_activeQuad forceRenderOnce];
  [(CLKUIQuadView *)self->_bandsView renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [v5 anyObject];
  objc_super v7 = [(NTKPrideDigitalFaceView *)self _complicationDisplayWrapperForTouch:v6];
  touchWrapper = self->_touchWrapper;
  self->_touchWrapper = v7;

  double v9 = self->_touchWrapper;
  if (v9)
  {
    uint64_t v10 = [(NTKComplicationDisplayWrapperView *)v9 display];
    [v10 setHighlighted:1];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[NTKPrideSplinesQuad handleSingleTap:](self->_activeQuad, "handleSingleTap:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v15), (void)v16);
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = [a3 anyObject];
  id obj = [(NTKPrideDigitalFaceView *)self _complicationDisplayWrapperForTouch:v5];

  id v6 = obj;
  p_touchWrapper = (id *)&self->_touchWrapper;
  id v8 = *p_touchWrapper;
  if (obj != *p_touchWrapper)
  {
    if (v8)
    {
      double v9 = [v8 display];
      [v9 setHighlighted:0];

      id v6 = obj;
    }
    if (v6)
    {
      uint64_t v10 = [v6 display];
      [v10 setHighlighted:1];
    }
    objc_storeStrong(p_touchWrapper, obj);
  }

  _objc_release_x1();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  touchWrapper = self->_touchWrapper;
  if (touchWrapper)
  {
    id v6 = [(NTKComplicationDisplayWrapperView *)touchWrapper display];
    [v6 setHighlighted:0];

    if ([(NTKComplicationDisplayWrapperView *)self->_touchWrapper tapEnabled]) {
      [(NTKComplicationDisplayWrapperView *)self->_touchWrapper performTap];
    }
    objc_super v7 = self->_touchWrapper;
    self->_touchWrapper = 0;
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  touchWrapper = self->_touchWrapper;
  if (touchWrapper)
  {
    id v6 = [(NTKComplicationDisplayWrapperView *)touchWrapper display];
    [v6 setHighlighted:0];

    objc_super v7 = self->_touchWrapper;
    self->_touchWrapper = 0;
  }
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = NTKFaceStyleDescription();
    id v8 = +[NTKPrideSwatchMappedImageCache keyForFaceStyle:v7 editOption:v6 mode:a4 selectedOptions:0];

    double v9 = +[NTKPrideSwatchMappedImageCache sharedCache];
    uint64_t v10 = [v9 imageForKey:v8];

    if (!v10)
    {
      id v11 = [NTKPrideDigitalFaceView alloc];
      id v12 = +[CLKDevice currentDevice];
      id v13 = [(NTKPrideDigitalFaceView *)v11 initWithFaceStyle:26 forDevice:v12 clientIdentifier:0];

      +[NTKEditOption sizeForSwatchStyle:3];
      double v15 = v14;
      double v17 = v16;
      long long v18 = +[UIScreen mainScreen];
      [v18 nativeScale];
      double v20 = v19;

      [v13 _applyOption:v6 forCustomEditMode:a4 slot:0];
      uint64_t v10 = objc_msgSend(v13[5], "snapshotWithSize:scale:apl:", 0, v15, v17, v20);
      v21 = +[NTKPrideSwatchMappedImageCache sharedCache];
      [v21 setImage:v10 forKey:v8];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerOverlay, 0);
  objc_storeStrong((id *)&self->_bandsView, 0);
  objc_storeStrong((id *)&self->_activeQuad, 0);
  objc_storeStrong((id *)&self->_ribbonsQuad, 0);
  objc_storeStrong((id *)&self->_bandsQuad, 0);
  objc_storeStrong((id *)&self->_layoutContentProvider, 0);
  objc_storeStrong((id *)&self->_timeLabelDefaultStyle, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);

  objc_storeStrong((id *)&self->_touchWrapper, 0);
}

@end