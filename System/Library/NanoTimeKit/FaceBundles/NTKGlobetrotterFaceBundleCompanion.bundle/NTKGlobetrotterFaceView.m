@interface NTKGlobetrotterFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (NTKGlobetrotterFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_dialViewAlphaForEditMode:(int64_t)a3;
- (double)_globetrotterCitySubviewsAlphaForEditMode:(int64_t)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (double)_timeViewContainerViewAlphaForEditMode:(int64_t)a3;
- (double)_timeViewScaleForEditMode:(int64_t)a3;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)globetrotterPalette;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadDialView;
- (void)_loadSnapshotContentViews;
- (void)_loadTimeView;
- (void)_loadUI;
- (void)_prepareForEditing;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_setNumerals:(unint64_t)a3;
- (void)_unloadDialView;
- (void)_unloadSnapshotContentViews;
- (void)_unloadTimeView;
- (void)_unloadUI;
- (void)_updateTimeZoneHourOffset;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)layoutSubviews;
- (void)sensitiveUIStateChanged;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKGlobetrotterFaceView

- (NTKGlobetrotterFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKGlobetrotterFaceView;
  v9 = [(NTKGlobetrotterFaceView *)&v15 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    double v10 = sub_4A18(v8);
    v9->_numberSystem = -1;
    id v11 = [objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory) initWithFaceView:v9 dialDiameter:v8 device:v10];
    [v11 setUsesNarrowTopSlots:1];
    [(NTKGlobetrotterFaceView *)v9 setComplicationFactory:v11];
    uint64_t v12 = +[NSTimeZone timeZoneWithAbbreviation:@"PST"];
    referenceTimeZone = v9->_referenceTimeZone;
    v9->_referenceTimeZone = (NSTimeZone *)v12;

    [(NTKGlobetrotterFaceView *)v9 _updateTimeZoneHourOffset];
  }

  return v9;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKGlobetrotterFaceView;
  id v6 = a3;
  [(NTKGlobetrotterFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKGlobetrotterDialView setOverrideDate:duration:](self->_globetrotterDialView, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKGlobetrotterFaceView;
  [(NTKGlobetrotterFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKGlobetrotterFaceView *)self _loadUI];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKGlobetrotterFaceView;
  [(NTKGlobetrotterFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKGlobetrotterFaceView *)self _unloadUI];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKGlobetrotterFaceView;
  id v6 = a4;
  [(NTKGlobetrotterFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[NTKGlobetrotterTimeView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_globetrotterTimeView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_applyDataMode
{
  v3.receiver = self;
  v3.super_class = (Class)NTKGlobetrotterFaceView;
  [(NTKGlobetrotterFaceView *)&v3 _applyDataMode];
  [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView applyDataMode:[(NTKGlobetrotterFaceView *)self dataMode]];
}

- (void)_loadUI
{
  [(NTKGlobetrotterFaceView *)self _loadDialView];

  [(NTKGlobetrotterFaceView *)self _loadTimeView];
}

- (void)_unloadUI
{
  [(NTKGlobetrotterFaceView *)self _unloadDialView];

  [(NTKGlobetrotterFaceView *)self _unloadTimeView];
}

- (void)_loadDialView
{
  objc_super v3 = [(NTKGlobetrotterFaceView *)self device];
  double v4 = sub_4A18(v3);

  v5 = [NTKGlobetrotterDialView alloc];
  int64_t timeZoneHourOffset = self->_timeZoneHourOffset;
  objc_super v7 = [(NTKGlobetrotterFaceView *)self device];
  id v8 = -[NTKGlobetrotterDialView initWithFrame:timeZoneHourOffset:device:](v5, "initWithFrame:timeZoneHourOffset:device:", timeZoneHourOffset, v7, 0.0, 0.0, v4, v4);
  globetrotterDialView = self->_globetrotterDialView;
  self->_globetrotterDialView = v8;

  [(NTKGlobetrotterDialView *)self->_globetrotterDialView setNumberSystem:self->_numberSystem];
  id v10 = [(NTKGlobetrotterFaceView *)self contentView];
  [v10 addSubview:self->_globetrotterDialView];
}

- (void)_unloadDialView
{
  [(NTKGlobetrotterDialView *)self->_globetrotterDialView removeFromSuperview];
  globetrotterDialView = self->_globetrotterDialView;
  self->_globetrotterDialView = 0;
}

- (void)_loadTimeView
{
  id v10 = [(NTKGlobetrotterFaceView *)self device];
  sub_4A18(v10);
  double v4 = v3;
  v5 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v4, v4);
  timeViewContainerView = self->_timeViewContainerView;
  self->_timeViewContainerView = v5;

  objc_super v7 = [(NTKGlobetrotterFaceView *)self contentView];
  [v7 addSubview:self->_timeViewContainerView];

  id v8 = -[NTKGlobetrotterTimeView initWithFrame:style:numberSystem:andDevice:timeZoneHourOffset:]([NTKGlobetrotterTimeView alloc], "initWithFrame:style:numberSystem:andDevice:timeZoneHourOffset:", 0, 0, v10, self->_timeZoneHourOffset, 0.0, 0.0, v4, v4);
  globetrotterTimeView = self->_globetrotterTimeView;
  self->_globetrotterTimeView = v8;

  [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView setNumberSystem:self->_numberSystem];
  [(UIView *)self->_timeViewContainerView addSubview:self->_globetrotterTimeView];
  [(NTKGlobetrotterFaceView *)self setTimeView:self->_globetrotterTimeView];
}

- (void)_unloadTimeView
{
  [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView removeFromSuperview];
  globetrotterTimeView = self->_globetrotterTimeView;
  self->_globetrotterTimeView = 0;

  [(UIView *)self->_timeViewContainerView removeFromSuperview];
  timeViewContainerView = self->_timeViewContainerView;
  self->_timeViewContainerView = 0;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKGlobetrotterFaceView;
  [(NTKGlobetrotterFaceView *)&v12 layoutSubviews];
  double v3 = [(NTKGlobetrotterFaceView *)self contentView];
  [v3 bounds];
  CLKRectGetCenter();
  double v5 = v4;
  double v7 = v6;

  [(UIView *)self->_timeViewContainerView bounds];
  CLKRectGetCenter();
  double v9 = v8;
  double v11 = v10;
  -[UIView setCenter:](self->_timeViewContainerView, "setCenter:", v5, v7);
  -[NTKGlobetrotterDialView setCenter:](self->_globetrotterDialView, "setCenter:", v5, v7);
  -[NTKGlobetrotterTimeView setCenter:](self->_globetrotterTimeView, "setCenter:", v9, v11);
}

- (void)_updateViewColorsWithPalette:(id)a3
{
  globetrotterDialView = self->_globetrotterDialView;
  id v5 = a3;
  [(NTKGlobetrotterDialView *)globetrotterDialView setPalette:v5];
  [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView setPalette:v5];
  id v7 = [v5 innerComplication];
  double v6 = [v5 outerComplication];

  [(NTKGlobetrotterFaceView *)self updateRichCornerComplicationsInnerColor:v7 outerColor:v6];
}

- (void)_updateTimeZoneHourOffset
{
  NTKIdealizedDate();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = +[NSTimeZone localTimeZone];
  NSInteger v4 = [(NSTimeZone *)self->_referenceTimeZone secondsFromGMTForDate:v6];
  int64_t v5 = ((uint64_t)[v3 secondsFromGMTForDate:v6] - v4) / 3600;
  self->_int64_t timeZoneHourOffset = v5;
  [(NTKGlobetrotterDialView *)self->_globetrotterDialView setTimeZoneHourOffset:v5];
  [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView setTimeZoneHourOffset:v5 animated:1];
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 19)
  {
    [(NTKGlobetrotterFaceView *)self _faceEditingScaleForEditMode:19 slot:v6];
    double v8 = [(NTKGlobetrotterDialView *)self->_globetrotterDialView hourMarkerDialView];
    [v8 frame];
    CGRectGetWidth(v14);
    double v9 = NTKKeylineViewWithCircle();
  }
  else
  {
    if (a3 == 15)
    {
      [(NTKGlobetrotterFaceView *)self _faceEditingScaleForEditMode:15 slot:v6];
      [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView bounds];
      CGRectGetWidth(v13);
      uint64_t v7 = NTKKeylineViewWithCircle();
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)NTKGlobetrotterFaceView;
      uint64_t v7 = [(NTKGlobetrotterFaceView *)&v11 _keylineViewForCustomEditMode:a3 slot:v6];
    }
    double v9 = (void *)v7;
  }

  return v9;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 19)
  {
    globetrotterDialView = self->_globetrotterDialView;
    objc_super v12 = [(NTKGlobetrotterDialView *)globetrotterDialView hourMarkerDialView];
    [v12 frame];
    -[NTKGlobetrotterDialView convertRect:toView:](globetrotterDialView, "convertRect:toView:", self);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    if (a3 == 15)
    {
      [(UIView *)self->_timeViewContainerView frame];
    }
    else
    {
      v25.receiver = self;
      v25.super_class = (Class)NTKGlobetrotterFaceView;
      [(NTKGlobetrotterFaceView *)&v25 _relativeKeylineFrameForCustomEditMode:a3 slot:v6];
    }
    double v14 = v7;
    double v16 = v8;
    double v18 = v9;
    double v20 = v10;
  }

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  id v7 = &stru_68 + 44;
  if (a3 != 15 && a3 != 19)
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKGlobetrotterFaceView;
    id v7 = [(NTKGlobetrotterFaceView *)&v9 _keylineLabelAlignmentForCustomEditMode:a3 slot:v6];
  }

  return (unint64_t)v7;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKGlobetrotterFaceView;
  [(NTKGlobetrotterFaceView *)&v11 _configureComplicationView:v6 forSlot:a4];
  id v7 = v6;
  double v8 = [(NTKGlobetrotterFaceView *)self globetrotterPalette];
  objc_super v9 = [v8 innerComplication];
  [(NTKGlobetrotterFaceView *)self setComplicationColor:v9];
  [(NTKGlobetrotterFaceView *)self setInterpolatedComplicationColor:v9];
  double v10 = [v8 outerComplication];
  [(NTKGlobetrotterFaceView *)self setAlternateComplicationColor:v10];

  [v7 updateMonochromeColor];
}

- (void)_prepareForEditing
{
  [(NTKGlobetrotterDialView *)self->_globetrotterDialView prepareForEditing];
  globetrotterTimeView = self->_globetrotterTimeView;

  [(NTKGlobetrotterTimeView *)globetrotterTimeView prepareForEditing];
}

- (void)_cleanupAfterEditing
{
  [(NTKGlobetrotterDialView *)self->_globetrotterDialView cleanupAfterEditing];
  globetrotterTimeView = self->_globetrotterTimeView;

  [(NTKGlobetrotterTimeView *)globetrotterTimeView cleanupAfterEditing];
}

- (void)_configureForEditMode:(int64_t)a3
{
  -[NTKGlobetrotterFaceView _timeViewScaleForEditMode:](self, "_timeViewScaleForEditMode:");
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, v5, v5);
  CGAffineTransform v15 = v16;
  [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView setTransform:&v15];
  [(NTKGlobetrotterFaceView *)self _timeViewContainerViewAlphaForEditMode:a3];
  -[UIView setAlpha:](self->_timeViewContainerView, "setAlpha:");
  [(NTKGlobetrotterFaceView *)self _dialViewAlphaForEditMode:a3];
  -[NTKGlobetrotterDialView setAlpha:](self->_globetrotterDialView, "setAlpha:");
  globetrotterDialView = self->_globetrotterDialView;
  [(NTKGlobetrotterFaceView *)self _globetrotterCitySubviewsAlphaForEditMode:a3];
  -[NTKGlobetrotterDialView setAlphaForNonHourMarkerSubviews:](globetrotterDialView, "setAlphaForNonHourMarkerSubviews:");
  [(NTKGlobetrotterFaceView *)self _complicationAlphaForEditMode:a3];
  double v8 = v7;
  objc_super v9 = [(NTKGlobetrotterFaceView *)self complicationContainerView];
  [v9 setAlpha:v8];

  id v10 = [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView style];
  [(NTKGlobetrotterFaceView *)self _timeViewAlphaForEditMode:a3];
  double v12 = v11;
  globetrotterTimeView = self->_globetrotterTimeView;
  if (v10) {
    [(NTKGlobetrotterTimeView *)globetrotterTimeView digitalTimeLabel];
  }
  else {
  double v14 = [(NTKGlobetrotterTimeView *)globetrotterTimeView analogHandsView];
  }
  [v14 setAlpha:v12];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKGlobetrotterFaceView _timeViewScaleForEditMode:](self, "_timeViewScaleForEditMode:");
  [(NTKGlobetrotterFaceView *)self _timeViewScaleForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v8, v8);
  CGAffineTransform v17 = v18;
  [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView setTransform:&v17];
  [(NTKGlobetrotterFaceView *)self _timeViewContainerViewAlphaForEditMode:a4];
  [(NTKGlobetrotterFaceView *)self _timeViewContainerViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](self->_timeViewContainerView, "setAlpha:");
  [(NTKGlobetrotterFaceView *)self _dialViewAlphaForEditMode:a4];
  [(NTKGlobetrotterFaceView *)self _dialViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKGlobetrotterDialView setAlpha:](self->_globetrotterDialView, "setAlpha:");
  [(NTKGlobetrotterFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKGlobetrotterFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v10 = v9;
  double v11 = [(NTKGlobetrotterFaceView *)self complicationContainerView];
  [v11 setAlpha:v10];

  [(NTKGlobetrotterFaceView *)self _globetrotterCitySubviewsAlphaForEditMode:a4];
  [(NTKGlobetrotterFaceView *)self _globetrotterCitySubviewsAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKGlobetrotterDialView setAlphaForNonHourMarkerSubviews:](self->_globetrotterDialView, "setAlphaForNonHourMarkerSubviews:");
  id v12 = [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView style];
  [(NTKGlobetrotterFaceView *)self _timeViewAlphaForEditMode:a4];
  [(NTKGlobetrotterFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v14 = v13;
  globetrotterTimeView = self->_globetrotterTimeView;
  if (v12) {
    [(NTKGlobetrotterTimeView *)globetrotterTimeView digitalTimeLabel];
  }
  else {
  CGAffineTransform v16 = [(NTKGlobetrotterTimeView *)globetrotterTimeView analogHandsView];
  }
  [v16 setAlpha:v14];
}

- (double)_timeViewScaleForEditMode:(int64_t)a3
{
  double v3 = 1.0;
  if (a3 == 15)
  {
    NSInteger v4 = [(NTKGlobetrotterFaceView *)self device];
    sub_4A18(v4);
    double v3 = v5;
  }
  return v3;
}

- (double)_dialViewAlphaForEditMode:(int64_t)a3
{
  BOOL v3 = a3 == 1 || a3 == 15;
  double result = NTKEditModeDimmedAlpha;
  if (!v3) {
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

- (double)_globetrotterCitySubviewsAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 19) {
    return 1.0;
  }
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 10) {
    return 1.0;
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 10:
      double v9 = [(NTKGlobetrotterFaceView *)self globetrotterPalette];
      [(NTKGlobetrotterFaceView *)self _updateViewColorsWithPalette:v9];

      break;
    case 19:
      -[NTKGlobetrotterFaceView _setNumerals:](self, "_setNumerals:", [v10 numeralOption]);
      break;
    case 15:
      -[NTKGlobetrotterTimeView setStyle:](self->_globetrotterTimeView, "setStyle:", [v10 style]);
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
      double v14 = [(NTKGlobetrotterFaceView *)self interpolatedColorPalette];
      [(NTKGlobetrotterFaceView *)self _updateViewColorsWithPalette:v14];

      break;
    case 19:
      [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView applyTransitionFraction:v15 fromNumeralOption:v12 toNumeralOption:a3];
      [(NTKGlobetrotterDialView *)self->_globetrotterDialView applyTransitionFraction:v15 fromNumeralOption:v12 toNumeralOption:a3];
      break;
    case 15:
      -[NTKGlobetrotterTimeView applyTransitionFraction:fromStyle:toStyle:](self->_globetrotterTimeView, "applyTransitionFraction:fromStyle:toStyle:", [v15 style], objc_msgSend(v12, "style"), a3);
      break;
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKLargeElementScaleForBreathingFraction();
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeScale(&v20, v7, v7);
  switch(a4)
  {
    case 10:
      CGAffineTransform v15 = v20;
      id v8 = [(NTKGlobetrotterFaceView *)self contentView];
      CGAffineTransform v14 = v15;
      [v8 setTransform:&v14];

      CGAffineTransform v13 = v20;
      double v9 = [(NTKGlobetrotterFaceView *)self complicationContainerView];
      id v10 = v9;
      CGAffineTransform v12 = v13;
      double v11 = &v12;
LABEL_7:
      objc_msgSend(v9, "setTransform:", v11, *(_OWORD *)&v12.a, *(_OWORD *)&v12.c, *(_OWORD *)&v12.tx);

      return;
    case 19:
      CGAffineTransform v18 = v20;
      [(UIView *)self->_timeViewContainerView setTransform:&v18];
      CGAffineTransform v17 = v20;
      double v9 = [(NTKGlobetrotterDialView *)self->_globetrotterDialView hourMarkerDialView];
      id v10 = v9;
      CGAffineTransform v16 = v17;
      double v11 = &v16;
      goto LABEL_7;
    case 15:
      CGAffineTransform v19 = v20;
      [(UIView *)self->_timeViewContainerView setTransform:&v19];
      break;
  }
}

- (void)_setNumerals:(unint64_t)a3
{
  unint64_t v4 = CLKLocaleNumberSystemFromNumeralOption();
  if (self->_numberSystem != v4)
  {
    unint64_t v5 = v4;
    self->_numberSystem = v4;
    id v6 = [(NTKGlobetrotterFaceView *)self device];
    int v7 = NTKShowIndicScriptNumerals();

    if (v7)
    {
      [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView setNumberSystem:v5];
      globetrotterDialView = self->_globetrotterDialView;
      [(NTKGlobetrotterDialView *)globetrotterDialView setNumberSystem:v5];
    }
  }
}

- (void)sensitiveUIStateChanged
{
  unint64_t numberSystem = self->_numberSystem;
  unint64_t v4 = [(NTKGlobetrotterFaceView *)self device];
  int v5 = NTKShowIndicScriptNumerals();

  if (v5) {
    uint64_t v6 = numberSystem;
  }
  else {
    uint64_t v6 = -1;
  }
  [(NTKGlobetrotterFaceView *)self _loadUI];
  [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView setNumberSystem:v6];
  globetrotterDialView = self->_globetrotterDialView;

  [(NTKGlobetrotterDialView *)globetrotterDialView setNumberSystem:v6];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKScaleForRubberBandingFraction();
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeScale(&v20, v7, v7);
  switch(a4)
  {
    case 10:
      CGAffineTransform v15 = v20;
      id v8 = [(NTKGlobetrotterFaceView *)self contentView];
      CGAffineTransform v14 = v15;
      [v8 setTransform:&v14];

      CGAffineTransform v13 = v20;
      double v9 = [(NTKGlobetrotterFaceView *)self complicationContainerView];
      id v10 = v9;
      CGAffineTransform v12 = v13;
      double v11 = &v12;
LABEL_7:
      objc_msgSend(v9, "setTransform:", v11, *(_OWORD *)&v12.a, *(_OWORD *)&v12.c, *(_OWORD *)&v12.tx);

      return;
    case 19:
      CGAffineTransform v18 = v20;
      [(UIView *)self->_timeViewContainerView setTransform:&v18];
      CGAffineTransform v17 = v20;
      double v9 = [(NTKGlobetrotterDialView *)self->_globetrotterDialView hourMarkerDialView];
      id v10 = v9;
      CGAffineTransform v16 = v17;
      double v11 = &v16;
      goto LABEL_7;
    case 15:
      CGAffineTransform v19 = v20;
      [(UIView *)self->_timeViewContainerView setTransform:&v19];
      break;
  }
}

- (id)createFaceColorPalette
{
  v2 = [[NTKGlobetrotterFaceColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)globetrotterPalette
{
  return [(NTKGlobetrotterFaceView *)self faceColorPalette];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &off_11138;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 19)
  {
    id v10 = [(NTKGlobetrotterTimeView *)self->_globetrotterTimeView _digitalLabelFont];
    double v11 = [(NTKGlobetrotterFaceView *)self device];
    CGAffineTransform v15 = [v8 swatchImageWithFont:v10 device:v11 baseline:0.0];
LABEL_9:

    goto LABEL_11;
  }
  if (a4 == 15)
  {
    if (qword_161C8 != -1) {
      dispatch_once(&qword_161C8, &stru_104C0);
    }
    id v10 = v8;
    double v11 = [v9 objectForKeyedSubscript:&off_114C8];
    CGAffineTransform v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 style]);
    CGAffineTransform v13 = [v11 identifier];
    CGAffineTransform v14 = +[NSString stringWithFormat:@"%@-%@", v12, v13];

    CGAffineTransform v15 = [(id)qword_161C0 objectForKey:v14];
    if (!v15)
    {
      CGAffineTransform v16 = [NTKGlobetrotterFaceView alloc];
      CGAffineTransform v17 = [(NTKGlobetrotterFaceView *)self device];
      CGAffineTransform v18 = [(NTKGlobetrotterFaceView *)v16 initWithFaceStyle:44 forDevice:v17 clientIdentifier:0];

      [(NTKGlobetrotterFaceView *)self frame];
      objc_msgSend(v18, "setFrame:");
      [v18 _loadSnapshotContentViews];
      [v18 setOption:v10 forCustomEditMode:15 slot:0];
      [v18 setOption:v11 forCustomEditMode:10 slot:0];
      CGAffineTransform v19 = NTKIdealizedDate();
      [v18 setOverrideDate:v19 duration:0.0];

      CGAffineTransform v20 = [v18 timeView];
      [v20 bounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      v35.width = v26;
      v35.height = v28;
      UIGraphicsBeginImageContextWithOptions(v35, 0, 0.0);
      v29 = [v18[1] globeSnapshotImage];
      objc_msgSend(v29, "drawInRect:", v22, v24, v26, v28);

      v30 = [v18 timeView];
      v31 = [v30 layer];
      [v31 renderInContext:UIGraphicsGetCurrentContext()];

      CGAffineTransform v15 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [(id)qword_161C0 setObject:v15 forKey:v14];
    }
    goto LABEL_9;
  }
  v33.receiver = self;
  v33.super_class = (Class)NTKGlobetrotterFaceView;
  CGAffineTransform v15 = [(NTKGlobetrotterFaceView *)&v33 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
LABEL_11:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceTimeZone, 0);
  objc_storeStrong((id *)&self->_timeViewContainerView, 0);
  objc_storeStrong((id *)&self->_globetrotterDialView, 0);

  objc_storeStrong((id *)&self->_globetrotterTimeView, 0);
}

@end