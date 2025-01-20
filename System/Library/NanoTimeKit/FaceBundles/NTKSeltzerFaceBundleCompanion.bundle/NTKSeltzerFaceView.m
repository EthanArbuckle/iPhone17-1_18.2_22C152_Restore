@interface NTKSeltzerFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (NTKSeltzerFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_backgroundImageViewAlphaForEditMode:(int64_t)a3;
- (double)_complicationsAlphaForEditMode:(int64_t)a3;
- (double)_dialViewAlphaForEditMode:(int64_t)a3;
- (double)_timeViewContainerViewAlphaForEditMode:(int64_t)a3;
- (double)_timeViewScaleForEditMode:(int64_t)a3;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_applyBreathingAndRubberBandingForEditMode:(int64_t)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadBackgroundView;
- (void)_loadCornerOverlayView;
- (void)_loadDialView;
- (void)_loadSnapshotContentViews;
- (void)_loadTimeView;
- (void)_loadUI;
- (void)_prepareForEditing;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_unloadBackgroundView;
- (void)_unloadCornerOverlayView;
- (void)_unloadDialView;
- (void)_unloadSnapshotContentViews;
- (void)_unloadTimeView;
- (void)_unloadUI;
- (void)_updateUI;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)layoutSubviews;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKSeltzerFaceView

- (NTKSeltzerFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKSeltzerFaceView;
  v9 = [(NTKSeltzerFaceView *)&v14 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    memset(v13, 0, sizeof(v13));
    sub_42A0(v8, v13);
    id v10 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    id v11 = [v10 initWithFaceView:v9 dialDiameter:v8 device:*(double *)&v13[0].receiver];
    [v11 setUsesNarrowTopSlots:1];
    [(NTKSeltzerFaceView *)v9 setComplicationFactory:v11];
  }
  return v9;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSeltzerFaceView;
  [(NTKSeltzerFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKSeltzerFaceView *)self _loadUI];
}

- (void)_unloadSnapshotContentViews
{
  [(NTKSeltzerFaceView *)self _unloadUI];
  v3.receiver = self;
  v3.super_class = (Class)NTKSeltzerFaceView;
  [(NTKSeltzerFaceView *)&v3 _unloadSnapshotContentViews];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKSeltzerFaceView;
  id v6 = a3;
  [(NTKSeltzerFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKSeltzerDialView setOverrideDate:duration:](self->_seltzerDialView, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)_applyDataMode
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSeltzerFaceView;
  [(NTKSeltzerFaceView *)&v6 _applyDataMode];
  objc_super v3 = (int *)[(NTKSeltzerFaceView *)self dataMode];
  v4 = v3;
  if (v3 == (int *)((char *)&dword_0 + 1))
  {
    uint64_t v5 = 1;
    goto LABEL_6;
  }
  if (v3 == &dword_4 || v3 == (int *)((char *)&dword_0 + 3))
  {
    uint64_t v5 = 0;
LABEL_6:
    [(NTKSeltzerDialView *)self->_seltzerDialView setUserInteractionEnabled:v5];
  }
  [(NTKSeltzerTimeView *)self->_seltzerTimeView applyDataMode:v4];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKSeltzerFaceView;
  id v6 = a4;
  [(NTKSeltzerFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[NTKSeltzerTimeView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_seltzerTimeView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_loadUI
{
  [(NTKSeltzerFaceView *)self _loadBackgroundView];
  [(NTKSeltzerFaceView *)self _loadCornerOverlayView];
  [(NTKSeltzerFaceView *)self _loadTimeView];

  [(NTKSeltzerFaceView *)self _loadDialView];
}

- (void)_unloadUI
{
  [(NTKSeltzerFaceView *)self _unloadDialView];
  [(NTKSeltzerFaceView *)self _unloadTimeView];
  [(NTKSeltzerFaceView *)self _unloadCornerOverlayView];

  [(NTKSeltzerFaceView *)self _unloadBackgroundView];
}

- (void)_loadBackgroundView
{
  id v6 = +[NTKSeltzerFaceBundle imageWithName:@"starfield"];
  objc_super v3 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = v3;

  uint64_t v5 = [(NTKSeltzerFaceView *)self contentView];
  [v5 addSubview:self->_backgroundImageView];
}

- (void)_unloadBackgroundView
{
  [(UIImageView *)self->_backgroundImageView removeFromSuperview];
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = 0;
}

- (void)_loadCornerOverlayView
{
  id v3 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  BOOL v4 = [(NTKSeltzerFaceView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(NTKSeltzerFaceView *)self device];
  objc_super v14 = (NTKRoundedCornerOverlayView *)objc_msgSend(v3, "initWithFrame:forDeviceCornerRadius:", v13, v6, v8, v10, v12);
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = v14;

  id v16 = [(NTKSeltzerFaceView *)self contentView];
  [v16 addSubview:self->_cornerOverlayView];
}

- (void)_unloadCornerOverlayView
{
  [(NTKRoundedCornerOverlayView *)self->_cornerOverlayView removeFromSuperview];
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = 0;
}

- (void)_loadTimeView
{
  id v9 = [(NTKSeltzerFaceView *)self device];
  sub_42A0(v9, &v10);
  double v3 = *((double *)&v10 + 1);
  BOOL v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v3, v3);
  timeViewContainerView = self->_timeViewContainerView;
  self->_timeViewContainerView = v4;

  double v6 = [(NTKSeltzerFaceView *)self contentView];
  [v6 addSubview:self->_timeViewContainerView];

  double v7 = -[NTKSeltzerTimeView initWithFrame:style:andDevice:]([NTKSeltzerTimeView alloc], "initWithFrame:style:andDevice:", 0, v9, 0.0, 0.0, v3, v3);
  seltzerTimeView = self->_seltzerTimeView;
  self->_seltzerTimeView = v7;

  [(UIView *)self->_timeViewContainerView addSubview:self->_seltzerTimeView];
  [(NTKSeltzerFaceView *)self setTimeView:self->_seltzerTimeView];
}

- (void)_unloadTimeView
{
  [(NTKSeltzerTimeView *)self->_seltzerTimeView removeFromSuperview];
  seltzerTimeView = self->_seltzerTimeView;
  self->_seltzerTimeView = 0;

  [(UIView *)self->_timeViewContainerView removeFromSuperview];
  timeViewContainerView = self->_timeViewContainerView;
  self->_timeViewContainerView = 0;
}

- (void)_loadDialView
{
  id v10 = [(NTKSeltzerFaceView *)self device];
  sub_42A0(v10, v11);
  double v3 = v11[0];
  BOOL v4 = [NTKSeltzerDialView alloc];
  unint64_t calendar = self->_calendar;
  double v6 = [(NTKSeltzerFaceView *)self colorPalette];
  double v7 = -[NTKSeltzerDialView initWithFrame:device:calendar:palette:](v4, "initWithFrame:device:calendar:palette:", v10, calendar, v6, 0.0, 0.0, v3, v3);
  seltzerDialView = self->_seltzerDialView;
  self->_seltzerDialView = v7;

  id v9 = [(NTKSeltzerFaceView *)self contentView];
  [v9 addSubview:self->_seltzerDialView];
}

- (void)_unloadDialView
{
  [(NTKSeltzerDialView *)self->_seltzerDialView removeFromSuperview];
  seltzerDialView = self->_seltzerDialView;
  self->_seltzerDialView = 0;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKSeltzerFaceView;
  [(NTKSeltzerFaceView *)&v12 layoutSubviews];
  double v3 = [(NTKSeltzerFaceView *)self contentView];
  [v3 bounds];
  CLKRectGetCenter();
  double v5 = v4;
  double v7 = v6;

  [(UIView *)self->_timeViewContainerView bounds];
  CLKRectGetCenter();
  double v9 = v8;
  double v11 = v10;
  -[UIImageView setCenter:](self->_backgroundImageView, "setCenter:", v5, v7);
  -[UIView setCenter:](self->_timeViewContainerView, "setCenter:", v5, v7);
  -[NTKSeltzerTimeView setCenter:](self->_seltzerTimeView, "setCenter:", v9, v11);
  -[NTKSeltzerDialView setCenter:](self->_seltzerDialView, "setCenter:", v5, v7);
}

- (void)_updateUI
{
  [(NTKSeltzerDialView *)self->_seltzerDialView updateDialUI];
  seltzerTimeView = self->_seltzerTimeView;

  [(NTKSeltzerTimeView *)seltzerTimeView updateSunLocation];
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    [(NTKSeltzerFaceView *)self _faceEditingScaleForEditMode:15 slot:a4];
    [(NTKSeltzerTimeView *)self->_seltzerTimeView bounds];
    CGRectGetWidth(v9);
    double v5 = NTKKeylineViewWithCircle();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKSeltzerFaceView;
    double v5 = [(NTKSeltzerFaceView *)&v7 _keylineViewForCustomEditMode:a3 slot:a4];
  }

  return v5;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    double v5 = [(NTKSeltzerFaceView *)self device];
    sub_42A0(v5, &v18);
    double v6 = *((double *)&v18 + 1);

    objc_super v7 = [(NTKSeltzerFaceView *)self contentView];
    [v7 bounds];
    CLKRectGetCenter();
    double v9 = v8;
    double v11 = v10;

    double v12 = v9 - v6 * 0.5;
    double v13 = v11 - v6 * 0.5;
    double v14 = v6;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKSeltzerFaceView;
    [(NTKSeltzerFaceView *)&v17 _relativeKeylineFrameForCustomEditMode:a3 slot:a4];
    double v6 = v15;
  }
  double v16 = v6;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15) {
    return 148;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)NTKSeltzerFaceView;
  return [(NTKSeltzerFaceView *)&v7 _keylineLabelAlignmentForCustomEditMode:a3 slot:a4];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKSeltzerFaceView;
  [(NTKSeltzerFaceView *)&v11 _configureComplicationView:v6 forSlot:a4];
  id v7 = v6;
  [v7 setFontStyle:1];
  uint64_t v8 = [(NTKSeltzerFaceView *)self colorPalette];
  uint64_t v9 = [v8 innerComplication];
  [(NTKSeltzerFaceView *)self setComplicationColor:v9];
  [(NTKSeltzerFaceView *)self setInterpolatedComplicationColor:v9];
  double v10 = [v8 outerComplication];
  [(NTKSeltzerFaceView *)self setAlternateComplicationColor:v10];

  [v7 updateMonochromeColor];
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSeltzerFaceView;
  [(NTKSeltzerFaceView *)&v4 _prepareForEditing];
  double v3 = [(NTKSeltzerFaceView *)self contentView];
  [v3 setClipsToBounds:1];
}

- (void)_cleanupAfterEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSeltzerFaceView;
  [(NTKSeltzerFaceView *)&v4 _cleanupAfterEditing];
  double v3 = [(NTKSeltzerFaceView *)self contentView];
  [v3 setClipsToBounds:0];
}

- (void)_configureForEditMode:(int64_t)a3
{
  -[NTKSeltzerFaceView _timeViewScaleForEditMode:](self, "_timeViewScaleForEditMode:");
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, v5, v5);
  CGAffineTransform v9 = v10;
  [(NTKSeltzerTimeView *)self->_seltzerTimeView setTransform:&v9];
  [(NTKSeltzerFaceView *)self _dialViewAlphaForEditMode:a3];
  -[NTKSeltzerDialView setAlpha:](self->_seltzerDialView, "setAlpha:");
  [(NTKSeltzerFaceView *)self _backgroundImageViewAlphaForEditMode:a3];
  -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
  [(NTKSeltzerFaceView *)self _timeViewContainerViewAlphaForEditMode:a3];
  -[UIView setAlpha:](self->_timeViewContainerView, "setAlpha:");
  [(NTKSeltzerFaceView *)self _complicationsAlphaForEditMode:a3];
  double v7 = v6;
  uint64_t v8 = [(NTKSeltzerFaceView *)self complicationContainerView];
  [v8 setAlpha:v7];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKSeltzerFaceView _timeViewScaleForEditMode:](self, "_timeViewScaleForEditMode:");
  [(NTKSeltzerFaceView *)self _timeViewScaleForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, v8, v8);
  CGAffineTransform v12 = v13;
  [(NTKSeltzerTimeView *)self->_seltzerTimeView setTransform:&v12];
  [(NTKSeltzerFaceView *)self _dialViewAlphaForEditMode:a4];
  [(NTKSeltzerFaceView *)self _dialViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKSeltzerDialView setAlpha:](self->_seltzerDialView, "setAlpha:");
  [(NTKSeltzerFaceView *)self _backgroundImageViewAlphaForEditMode:a4];
  [(NTKSeltzerFaceView *)self _backgroundImageViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
  [(NTKSeltzerFaceView *)self _timeViewContainerViewAlphaForEditMode:a4];
  [(NTKSeltzerFaceView *)self _timeViewContainerViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](self->_timeViewContainerView, "setAlpha:");
  [(NTKSeltzerFaceView *)self _complicationsAlphaForEditMode:a4];
  [(NTKSeltzerFaceView *)self _complicationsAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v10 = v9;
  objc_super v11 = [(NTKSeltzerFaceView *)self complicationContainerView];
  [v11 setAlpha:v10];
}

- (double)_timeViewScaleForEditMode:(int64_t)a3
{
  if (a3 == 10)
  {
    objc_super v4 = [(NTKSeltzerFaceView *)self device];
    sub_42A0(v4, &v7);
    CGFloat v5 = (double *)&v8;
    goto LABEL_5;
  }
  double v3 = 1.0;
  if (a3 == 15)
  {
    objc_super v4 = [(NTKSeltzerFaceView *)self device];
    sub_42A0(v4, &v9);
    CGFloat v5 = (double *)&v10;
LABEL_5:
    double v3 = *v5;
  }
  return v3;
}

- (double)_dialViewAlphaForEditMode:(int64_t)a3
{
  double result = 1.0;
  if (a3)
  {
    if (a3 != 12) {
      return NTKEditModeDimmedAlpha;
    }
  }
  return result;
}

- (double)_backgroundImageViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (double)_timeViewContainerViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_complicationsAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  self->_breathingFraction = a3;
  -[NTKSeltzerFaceView _applyBreathingAndRubberBandingForEditMode:](self, "_applyBreathingAndRubberBandingForEditMode:", a4, a5);
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  self->_rubberBandingFraction = a3;
  -[NTKSeltzerFaceView _applyBreathingAndRubberBandingForEditMode:](self, "_applyBreathingAndRubberBandingForEditMode:", a4, a5);
}

- (void)_applyBreathingAndRubberBandingForEditMode:(int64_t)a3
{
  NTKLargeElementScaleForBreathingFraction();
  double v6 = v5;
  NTKScaleForRubberBandingFraction();
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v6 * v7, v6 * v7);
  if (a3 == 10)
  {
LABEL_4:
    CGAffineTransform v14 = v15;
    uint64_t v8 = [(NTKSeltzerFaceView *)self contentView];
    CGAffineTransform v13 = v14;
    [v8 setTransform:&v13];

    CGAffineTransform v12 = v15;
    long long v9 = [(NTKSeltzerFaceView *)self complicationContainerView];
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];

    return;
  }
  if (a3 != 15)
  {
    if (a3 != 12) {
      return;
    }
    goto LABEL_4;
  }
  CGAffineTransform v10 = v15;
  [(UIView *)self->_timeViewContainerView setTransform:&v10];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 10:
      CGAffineTransform v10 = [(NTKSeltzerFaceView *)self colorPalette];
      [(NTKSeltzerFaceView *)self _updateViewColorsWithPalette:v10];

      break;
    case 15:
      -[NTKSeltzerTimeView setStyle:](self->_seltzerTimeView, "setStyle:", [v11 style]);
      break;
    case 12:
      id v9 = [v11 calendar];
      self->_unint64_t calendar = (unint64_t)v9;
      [(NTKSeltzerDialView *)self->_seltzerDialView setCalendar:v9];
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v15 = a4;
  id v12 = a5;
  id v13 = a7;
  switch(a6)
  {
    case 10:
      CGAffineTransform v14 = [(NTKSeltzerFaceView *)self interpolatedColorPalette];
      [(NTKSeltzerFaceView *)self _updateViewColorsWithPalette:v14];

      break;
    case 15:
      -[NTKSeltzerTimeView applyTransitionFraction:fromStyle:toStyle:](self->_seltzerTimeView, "applyTransitionFraction:fromStyle:toStyle:", [v15 style], objc_msgSend(v12, "style"), a3);
      break;
    case 12:
      -[NTKSeltzerDialView applyTransitionFraction:fromCalendar:toCalendar:](self->_seltzerDialView, "applyTransitionFraction:fromCalendar:toCalendar:", [v15 calendar], objc_msgSend(v12, "calendar"), a3);
      break;
  }
}

- (id)createFaceColorPalette
{
  v2 = [[NTKSeltzerColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)colorPalette
{
  return [(NTKSeltzerFaceView *)self faceColorPalette];
}

- (void)_updateViewColorsWithPalette:(id)a3
{
  seltzerTimeView = self->_seltzerTimeView;
  id v5 = a3;
  [(NTKSeltzerTimeView *)seltzerTimeView setPalette:v5];
  id v7 = [v5 innerComplication];
  double v6 = [v5 outerComplication];

  [(NTKSeltzerFaceView *)self updateRichCornerComplicationsInnerColor:v7 outerColor:v6];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    double v6 = &off_10B18;
  }
  else
  {
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKSeltzerFaceView;
    objc_msgSendSuper2(&v8, "_swatchForEditModeDependsOnOptions:forDevice:", a3, a4);
    double v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 15)
  {
    if (qword_15E38 != -1) {
      dispatch_once(&qword_15E38, &stru_10458);
    }
    id v10 = v8;
    id v11 = [v9 objectForKeyedSubscript:&off_10A38];
    id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 style]);
    id v13 = [v11 identifier];
    CGAffineTransform v14 = +[NSString stringWithFormat:@"%@-%@", v12, v13];

    id v15 = [(id)qword_15E30 objectForKey:v14];
    if (!v15)
    {
      double v16 = [NTKSeltzerFaceView alloc];
      objc_super v17 = [(NTKSeltzerFaceView *)self device];
      long long v18 = [(NTKSeltzerFaceView *)v16 initWithFaceStyle:44 forDevice:v17 clientIdentifier:0];

      [(NTKSeltzerFaceView *)self frame];
      -[NTKSeltzerFaceView setFrame:](v18, "setFrame:");
      [(NTKSeltzerFaceView *)v18 _loadSnapshotContentViews];
      [(NTKSeltzerFaceView *)v18 setOption:v10 forCustomEditMode:15 slot:0];
      [(NTKSeltzerFaceView *)v18 setOption:v11 forCustomEditMode:10 slot:0];
      v19 = NTKIdealizedDate();
      [(NTKSeltzerFaceView *)v18 setOverrideDate:v19 duration:0.0];

      memset(v47, 0, 32);
      long long v46 = 0u;
      v20 = [(NTKSeltzerFaceView *)self device];
      sub_42A0(v20, &v46);

      v21 = [(NTKSeltzerFaceView *)v18 timeView];
      [v21 bounds];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      id v30 = [v21 style];
      v31 = (CGFloat *)v47 + 1;
      if (!v30) {
        v31 = (CGFloat *)v47;
      }
      v49.origin.CGFloat x = v23;
      v49.origin.CGFloat y = v25;
      v49.size.CGFloat width = v27;
      v49.size.CGFloat height = v29;
      CGRect v50 = CGRectInset(v49, *v31, *v31);
      CGFloat x = v50.origin.x;
      CGFloat y = v50.origin.y;
      CGFloat width = v50.size.width;
      CGFloat height = v50.size.height;
      id v36 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithBounds:", v23, v25, v27, v29);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_5BD0;
      v40[3] = &unk_10480;
      id v41 = v21;
      CGFloat v42 = x;
      CGFloat v43 = y;
      CGFloat v44 = width;
      CGFloat v45 = height;
      id v37 = v21;
      id v15 = [v36 imageWithActions:v40];
      [(id)qword_15E30 setObject:v15 forKey:v14];
    }
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)NTKSeltzerFaceView;
    id v15 = [(NTKSeltzerFaceView *)&v39 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeViewContainerView, 0);
  objc_storeStrong((id *)&self->_seltzerDialView, 0);
  objc_storeStrong((id *)&self->_seltzerTimeView, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);

  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end