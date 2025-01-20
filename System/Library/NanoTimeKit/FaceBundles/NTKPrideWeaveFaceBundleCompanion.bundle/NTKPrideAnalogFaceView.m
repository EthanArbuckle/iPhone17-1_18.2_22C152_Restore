@interface NTKPrideAnalogFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_isActiveFace;
- (BOOL)_supportsUnadornedSnapshot;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKPrideAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKPrideCircularQuad)activeQuad;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_handAlphaForEditMode:(int64_t)a3;
- (float)complicationBrightness;
- (id)_complicationDisplayWrapperForTouch:(id)a3;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)adjustBrightnessOfColor:(id)a3 brightnessAmount:(double)a4;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applySlow;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_handleOrdinaryScreenWake;
- (void)_loadBackgroundViews;
- (void)_loadSnapshotContentViews;
- (void)_performWristRaiseAnimation;
- (void)_prepareWristRaiseAnimation;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_setupComplicationFactoryForDevice:(id)a3;
- (void)_unloadBackgroundViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationColors;
- (void)_updatePausedState;
- (void)dealloc;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)setActiveQuad:(id)a3;
- (void)setComplicationBrightness:(float)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation NTKPrideAnalogFaceView

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideAnalogFaceView;
  [(NTKPrideAnalogFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKPrideAnalogFaceView *)self _loadBackgroundViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideAnalogFaceView;
  [(NTKPrideAnalogFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKPrideAnalogFaceView *)self _unloadBackgroundViews];
}

- (void)_loadBackgroundViews
{
  objc_super v3 = [(NTKPrideAnalogFaceView *)self contentView];
  [v3 addSubview:self->_bandsView];

  [(NTKPrideCircularQuad *)self->_activeQuad clearWaves];
  [(NTKPrideSplinesQuad *)self->_activeQuad forceRender];

  [(NTKPrideAnalogFaceView *)self layoutSubviews];
}

- (void)_unloadBackgroundViews
{
}

- (BOOL)_wantsStatusBarIconShadow
{
  v2 = [(NTKPrideAnalogFaceView *)self optionForCustomEditMode:15 slot:0];
  BOOL v3 = [v2 style] == (char *)&dword_0 + 1;

  return v3;
}

- (void)_setupComplicationFactoryForDevice:(id)a3
{
  id v4 = a3;
  v5 = (NTKPrideAnalogFaceViewComplicationFactory *)[objc_alloc((Class)NTKPrideAnalogFaceViewComplicationFactory) initWithFaceView:self device:v4];

  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  self->_faceViewComplicationFactory = v5;

  v7 = self->_faceViewComplicationFactory;

  [(NTKPrideAnalogFaceView *)self setComplicationFactory:v7];
}

- (NTKPrideAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKPrideAnalogFaceView;
  v9 = [(NTKPrideAnalogFaceView *)&v18 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    [(NTKPrideAnalogFaceView *)v9 _setupComplicationFactoryForDevice:v8];
    v10->_useXR = 0;
    uint64_t v11 = +[CLKUIQuadView quadViewWithFrame:@"PrAn", 0, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height identifier options colorSpace];
    bandsView = v10->_bandsView;
    v10->_bandsView = (CLKUIQuadView *)v11;

    v13 = [(NTKPrideCircularQuad *)[NTKPrideBetweenCircularQuad alloc] initWithDevice:v8 useXRsRGB:v10->_useXR];
    ribbonsQuad = v10->_ribbonsQuad;
    v10->_ribbonsQuad = v13;

    [(NTKPrideCircularQuad *)v10->_ribbonsQuad clearWaves];
    [(NTKPrideSplinesQuad *)v10->_ribbonsQuad setFadeMultiplier:0.0];
    [(CLKUIQuadView *)v10->_bandsView addQuad:v10->_ribbonsQuad];
    v15 = [[NTKPrideCircularQuad alloc] initWithDevice:v8 useXRsRGB:v10->_useXR];
    bandsQuad = v10->_bandsQuad;
    v10->_bandsQuad = v15;

    [(NTKPrideCircularQuad *)v10->_bandsQuad clearWaves];
    [(NTKPrideSplinesQuad *)v10->_bandsQuad setFadeMultiplier:0.0];
    [(CLKUIQuadView *)v10->_bandsView addQuad:v10->_bandsQuad];
    v10->_complicationBrightness = 0.0;
    [(NTKPrideAnalogFaceView *)v10 setActiveQuad:v10->_bandsQuad];
    [(NTKPrideAnalogFaceView *)v10 layoutSubviews];
  }

  return v10;
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKPrideAnalogFaceView;
  [(NTKPrideAnalogFaceView *)&v4 dealloc];
}

- (void)setActiveQuad:(id)a3
{
  objc_super v4 = (NTKPrideCircularQuad *)a3;
  [(NTKPrideSplinesQuad *)self->_activeQuad setEnableRecording:0];
  activeQuad = self->_activeQuad;
  self->_activeQuad = v4;
  v6 = v4;

  [(NTKPrideSplinesQuad *)self->_activeQuad setEnableRecording:1];
}

- (BOOL)_isActiveFace
{
  BOOL v3 = (char *)[(NTKPrideAnalogFaceView *)self dataMode];
  if (v3 != (unsigned char *)&dword_0 + 1) {
    LOBYTE(v3) = [(NTKPrideAnalogFaceView *)self dataMode] == (char *)&dword_0 + 2;
  }
  return (char)v3;
}

- (void)_prepareWristRaiseAnimation
{
  if ([(NTKPrideAnalogFaceView *)self _isActiveFace])
  {
    [(NTKPrideCircularQuad *)self->_activeQuad prepareWristRaiseAnimation];
    [(NTKPrideAnalogFaceView *)self _updateComplicationColors];
  }
}

- (void)_performWristRaiseAnimation
{
  if ([(NTKPrideAnalogFaceView *)self _isActiveFace])
  {
    [(NTKPrideCircularQuad *)self->_activeQuad performWristRaiseAnimation];
    [(NTKPrideAnalogFaceView *)self _updateComplicationColors];
  }
}

- (void)_handleOrdinaryScreenWake
{
  if ([(NTKPrideAnalogFaceView *)self _isActiveFace])
  {
    [(NTKPrideCircularQuad *)self->_activeQuad handleOrdinaryScreenWake];
    [(NTKPrideAnalogFaceView *)self _updateComplicationColors];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideAnalogFaceView;
  [(NTKPrideAnalogFaceView *)&v4 layoutSubviews];
  [(NTKPrideAnalogFaceView *)self bounds];
  -[CLKUIQuadView setFrame:](self->_bandsView, "setFrame:");
  BOOL v3 = [(NTKPrideAnalogFaceView *)self contentView];
  [v3 sendSubviewToBack:self->_bandsView];

  [(CLKUIQuadView *)self->_bandsView layoutSubviews];
}

- (id)adjustBrightnessOfColor:(id)a3 brightnessAmount:(double)a4
{
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  [a3 getHue:&v10 saturation:&v9 brightness:&v8 alpha:&v7];
  CLKInterpolateBetweenFloatsUnclipped();
  double v8 = v4;
  v5 = +[UIColor colorWithHue:v10 saturation:v9 brightness:v4 alpha:v7];

  return v5;
}

- (void)_updateComplicationColors
{
  id v5 = [(NTKPrideCircularQuad *)self->_activeQuad splineColorAtIndex:0];
  BOOL v3 = [(NTKPrideAnalogFaceView *)self adjustBrightnessOfColor:v5 brightnessAmount:self->_complicationBrightness];
  double v4 = [(NTKPrideAnalogFaceView *)self adjustBrightnessOfColor:v3 brightnessAmount:-0.8];
  [(NTKPrideAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory setForegroundColor:v3 faceView:self];
  [(NTKPrideAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory setPlatterColor:v4 faceView:self];
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:NTKComplicationSlotTopLeft])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotTopRight])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotBottomCenter])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int64_t v4 = (id *)&NTKComplicationSlotTopLeft;
      goto LABEL_7;
    case 10:
      int64_t v4 = (id *)&NTKComplicationSlotBottomCenter;
LABEL_7:
      id v5 = *v4;
      return v5;
    case 2:
      int64_t v4 = (id *)&NTKComplicationSlotTopRight;
      goto LABEL_7;
  }
  id v5 = 0;
  return v5;
}

- (void)_finalizeForSnapshotting:(id)a3
{
  int64_t v4 = (void (**)(void))a3;
  [(NTKPrideCircularQuad *)self->_activeQuad clearWaves];
  if (![(NTKPrideSplinesQuad *)self->_activeQuad forceRender])
  {
    id v5 = _NTKLoggingObjectForDomain();
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
  return (int64_t)[(NTKPrideAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (void)_applySlow
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideAnalogFaceView;
  [(NTKPrideAnalogFaceView *)&v4 _applySlow];
  [(NTKPrideAnalogFaceView *)self _updatePausedState];
  int wasSlow = self->_wasSlow;
  if (wasSlow != [(NTKPrideAnalogFaceView *)self isSlow]) {
    [(NTKPrideSplinesQuad *)self->_activeQuad forceRender];
  }
  self->_int wasSlow = [(NTKPrideAnalogFaceView *)self isSlow];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  [(NTKPrideAnalogFaceView *)self _updatePausedState];
  if ((NTKIsDaemonOrFaceSnapshotService() & 1) == 0)
  {
    if ([(NTKPrideAnalogFaceView *)self _isActiveFace])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_15DB8;
      block[3] = &unk_24810;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_updatePausedState
{
  uint64_t v3 = (char *)[(NTKPrideAnalogFaceView *)self dataMode];
  unsigned int v4 = [(NTKPrideAnalogFaceView *)self isFrozen];
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
  v4.super_class = (Class)NTKPrideAnalogFaceView;
  [(NTKPrideAnalogFaceView *)&v4 _applyDataMode];
  unint64_t v3 = (unint64_t)[(NTKPrideAnalogFaceView *)self dataMode];
  if (v3 <= 5)
  {
    if (((1 << v3) & 0x34) != 0)
    {
      [(NTKPrideSplinesQuad *)self->_activeQuad setIgnoresStrumAndTap:1];
      [(NTKPrideCircularQuad *)self->_activeQuad clearWaves];
      [(NTKPrideAnalogFaceView *)self _updatePausedState];
    }
    else if (((1 << v3) & 3) != 0)
    {
      [(NTKPrideSplinesQuad *)self->_activeQuad setIgnoresStrumAndTap:0];
      [(NTKPrideAnalogFaceView *)self _updatePausedState];
      [(NTKPrideCircularQuad *)self->_activeQuad clearWaves];
    }
    else
    {
      [(NTKPrideSplinesQuad *)self->_activeQuad setIgnoresStrumAndTap:1];
      [(NTKPrideCircularQuad *)self->_activeQuad clearWaves];
      [(NTKPrideAnalogFaceView *)self _updatePausedState];
      [(NTKPrideCircularQuad *)self->_activeQuad setDefaultSplineColors];
      [(NTKPrideAnalogFaceView *)self _updateComplicationColors];
    }
  }
}

- (id)_complicationDisplayWrapperForTouch:(id)a3
{
  id v4 = a3;
  if ([(NTKPrideCircularQuad *)self->_activeQuad willConsumeTouch:v4])
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = sub_160C4;
    v14 = sub_160D4;
    id v15 = 0;
    [v4 locationInView:self];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_160DC;
    v9[3] = &unk_24838;
    v9[6] = v6;
    v9[7] = v7;
    v9[4] = self;
    v9[5] = &v10;
    [(NTKPrideAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v9];
    id v5 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v18 = a4;
  id v11 = a5;
  id v12 = a7;
  if (a6 == 12)
  {
    [v18 style];
    [v11 style];
    CLKInterpolateBetweenFloatsUnclipped();
    float v16 = v15;
    *(float *)&double v15 = v16;
    [(NTKPrideSplinesQuad *)self->_bandsQuad setFadeMultiplier:v15];
    *(float *)&double v17 = 1.0 - v16;
    [(NTKPrideSplinesQuad *)self->_ribbonsQuad setFadeMultiplier:v17];
  }
  else if (a6 == 15)
  {
    [v18 style];
    [v11 style];
    CLKInterpolateBetweenFloatsUnclipped();
    *(float *)&double v13 = v13;
    double v14 = *(float *)&v13;
    [(NTKPrideCircularQuad *)self->_bandsQuad applyTransitionFromDialToFullScreenWithFraction:*(float *)&v13];
    [(NTKPrideCircularQuad *)self->_ribbonsQuad applyTransitionFromDialToFullScreenWithFraction:v14];
  }
  [(NTKPrideSplinesQuad *)self->_ribbonsQuad forceRenderOnce];
  [(NTKPrideSplinesQuad *)self->_bandsQuad forceRenderOnce];
  [(CLKUIQuadView *)self->_bandsView renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  if (a4 == 12)
  {
    uint64_t v10 = (char *)[v15 style];
    if (v10)
    {
      if (v10 == (unsigned char *)&dword_0 + 2)
      {
        [(NTKPrideAnalogFaceView *)self setActiveQuad:self->_ribbonsQuad];
        LODWORD(v14) = 1.0;
        [(NTKPrideSplinesQuad *)self->_ribbonsQuad setFadeMultiplier:v14];
        bandsQuad = self->_bandsQuad;
        double v12 = 0.0;
        goto LABEL_13;
      }
      if (v10 != (unsigned char *)&dword_0 + 1) {
        goto LABEL_14;
      }
    }
    [(NTKPrideAnalogFaceView *)self setActiveQuad:self->_bandsQuad];
    [(NTKPrideSplinesQuad *)self->_ribbonsQuad setFadeMultiplier:0.0];
    bandsQuad = self->_bandsQuad;
    LODWORD(v12) = 1.0;
LABEL_13:
    [(NTKPrideSplinesQuad *)bandsQuad setFadeMultiplier:v12];
    goto LABEL_14;
  }
  if (a4 == 15)
  {
    double v9 = (char *)[v15 style];
    if (v9)
    {
      if (v9 == (unsigned char *)&dword_0 + 1)
      {
        [(NTKPrideCircularQuad *)self->_bandsQuad setFullscreenMode];
        [(NTKPrideCircularQuad *)self->_ribbonsQuad setFullscreenMode];
      }
    }
    else
    {
      [(NTKPrideCircularQuad *)self->_bandsQuad setDialMode];
      [(NTKPrideCircularQuad *)self->_ribbonsQuad setDialMode];
    }
    double v13 = [(NTKPrideAnalogFaceView *)self delegate];
    [v13 faceViewDidChangeWantsStatusBarIconShadow];
  }
LABEL_14:
  [(NTKPrideAnalogFaceView *)self _updateComplicationColors];
}

- (double)_handAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKPrideAnalogFaceView;
  -[NTKPrideAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v13, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  id v8 = [(NTKPrideAnalogFaceView *)self timeView];
  [(NTKPrideAnalogFaceView *)self _handAlphaForEditMode:a4];
  [(NTKPrideAnalogFaceView *)self _handAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  double v9 = [(NTKPrideAnalogFaceView *)self contentView];
  [(NTKPrideAnalogFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKPrideAnalogFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  uint64_t v10 = [(NTKPrideAnalogFaceView *)self contentView];
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v10 setTransform:v12];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NTKPrideAnalogFaceView;
  -[NTKPrideAnalogFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v10, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 15 || a4 == 12)
  {
    uint64_t v7 = [(NTKPrideAnalogFaceView *)self contentView];
    NTKAlphaForRubberBandingFraction();
    objc_msgSend(v7, "setAlpha:");
    NTKScaleForRubberBandingFraction();
    CGAffineTransformMakeScale(&v9, v8, v8);
    [v7 setTransform:&v9];
  }
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKPrideAnalogFaceView;
  id v6 = a4;
  [(NTKPrideAnalogFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  [(NTKPrideSplinesQuad *)self->_activeQuad forceRenderOnce];
  [(CLKUIQuadView *)self->_bandsView renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [v5 anyObject];
  objc_super v7 = [(NTKPrideAnalogFaceView *)self _complicationDisplayWrapperForTouch:v6];
  touchWrapper = self->_touchWrapper;
  self->_touchWrapper = v7;

  CGAffineTransform v9 = self->_touchWrapper;
  if (v9)
  {
    objc_super v10 = [(NTKComplicationDisplayWrapperView *)v9 display];
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
  id obj = [(NTKPrideAnalogFaceView *)self _complicationDisplayWrapperForTouch:v5];

  id v6 = obj;
  p_touchWrapper = (id *)&self->_touchWrapper;
  id v8 = *p_touchWrapper;
  if (obj != *p_touchWrapper)
  {
    if (v8)
    {
      CGAffineTransform v9 = [v8 display];
      [v9 setHighlighted:0];

      id v6 = obj;
    }
    if (v6)
    {
      objc_super v10 = [v6 display];
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
  BOOL v4 = &off_25B60;
  if (a3 != 15) {
    BOOL v4 = 0;
  }
  if (a3 == 12) {
    return &off_25B48;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = 0;
      goto LABEL_17;
    }
  }
  CGAffineTransform v9 = NTKFaceStyleDescription();
  objc_super v10 = +[NTKPrideSwatchMappedImageCache keyForFaceStyle:v9 editOption:v7 mode:a4 selectedOptions:v8];

  id v11 = +[NTKPrideSwatchMappedImageCache sharedCache];
  id v12 = [v11 imageForKey:v10];

  if (!v12)
  {
    id v13 = [NTKPrideAnalogFaceView alloc];
    uint64_t v14 = +[CLKDevice currentDevice];
    id v15 = [(NTKPrideAnalogFaceView *)v13 initWithFaceStyle:33 forDevice:v14 clientIdentifier:0];

    if (a4 == 15)
    {
      id v16 = v7;
      id v18 = [v8 objectForKeyedSubscript:&off_25960];
    }
    else
    {
      id v16 = 0;
      long long v17 = 0;
      if (a4 != 12) {
        goto LABEL_10;
      }
      id v16 = [v8 objectForKeyedSubscript:&off_25948];
      id v18 = v7;
    }
    long long v17 = v18;
LABEL_10:
    +[NTKEditOption sizeForSwatchStyle:3];
    double v20 = v19;
    double v22 = v21;
    v23 = +[UIScreen mainScreen];
    [v23 nativeScale];
    double v25 = v24;

    [v15 _applyOption:v16 forCustomEditMode:15 slot:0];
    [v15 _applyOption:v17 forCustomEditMode:12 slot:0];
    v26 = (char *)[v16 style];
    if (v26)
    {
      id v12 = 0;
      if (v26 != (unsigned char *)&dword_0 + 1)
      {
LABEL_15:
        v28 = +[NTKPrideSwatchMappedImageCache sharedCache];
        [v28 setImage:v12 forKey:v10];

        goto LABEL_16;
      }
      uint64_t v27 = objc_msgSend(v15[6], "snapshotWithSize:scale:apl:", 0, v20, v22, v25);
    }
    else
    {
      uint64_t v27 = [v15[6] snapshotWithScale:v25];
    }
    id v12 = (void *)v27;
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:

  return v12;
}

- (NTKPrideCircularQuad)activeQuad
{
  return self->_activeQuad;
}

- (float)complicationBrightness
{
  return self->_complicationBrightness;
}

- (void)setComplicationBrightness:(float)a3
{
  self->_complicationBrightness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeQuad, 0);
  objc_storeStrong((id *)&self->_ribbonsQuad, 0);
  objc_storeStrong((id *)&self->_bandsQuad, 0);
  objc_storeStrong((id *)&self->_bandsView, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);

  objc_storeStrong((id *)&self->_touchWrapper, 0);
}

@end