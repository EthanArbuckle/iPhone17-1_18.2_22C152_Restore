@interface NTKCaliforniaFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_wantsStatusBarIconShadow;
- (BOOL)isCircularDialWithBezel;
- (NTKCaliforniaContentView)californiaContentView;
- (NTKCaliforniaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKRoundedCornerOverlayView)cornerView;
- (UIView)backgroundView;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_dialAlphaForEditMode:(int64_t)a3;
- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)_timeAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (double)bezelComplicationTextWidthInRadians;
- (double)californiaContentViewScale;
- (double)circleDiameter;
- (id)_simpleTextComplicationColorForEditMode:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)backgroundColorForDial:(unint64_t)a3 palette:(id)a4;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (id)utilityBezelComplicationView;
- (unint64_t)dial;
- (unint64_t)style;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyComplicationColorTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6;
- (void)_applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadSnapshotContentViews;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_removeBackgroundView;
- (void)_removeCaliforniaContentView;
- (void)_removeViews;
- (void)_reorderSwitcherSnapshotView;
- (void)_setupBackgroundView;
- (void)_setupCaliforniaContentView;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationCenterOffsetForStyle:(unint64_t)a3;
- (void)_updateDialBezelComplicationColor:(id)a3;
- (void)_updateDialTicksForBezelText;
- (void)_updateSimpleTextLabelColor:(id)a3;
- (void)_updateSubDialRichComplicationsColor:(id)a3 alternateColor:(id)a4;
- (void)applyColorOnAnalogHands;
- (void)applyTransitionToCircularDialWithBezelFraction:(double)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)sensitiveUIStateChanged;
- (void)setBackgroundView:(id)a3;
- (void)setCaliforniaContentView:(id)a3;
- (void)setCircularMaskForCircularDialFraction:(double)a3 circleDiameter:(double)a4;
- (void)setCornerView:(id)a3;
- (void)setDial:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)updateCircularMask;
- (void)updateWithPalette:(id)a3;
@end

@implementation NTKCaliforniaFaceView

- (NTKCaliforniaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)NTKCaliforniaFaceView;
  v9 = [(NTKCaliforniaFaceView *)&v34 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    id v10 = objc_alloc_init((Class)NTKCompositeComplicationFactory);
    id v11 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    v12 = [(NTKCaliforniaFaceView *)v9 device];
    sub_C540(v12, (uint64_t)v32);
    id v13 = [v11 initWithFaceView:v9 dialDiameter:v8 device:v33];

    [v13 setUsesNarrowTopSlots:1];
    [v13 setAlpha:v9 faceView:1.0];
    v35[0] = NTKComplicationSlotTopLeft;
    v35[1] = NTKComplicationSlotTopRight;
    v35[2] = NTKComplicationSlotBottomLeft;
    v35[3] = NTKComplicationSlotBottomRight;
    v14 = +[NSArray arrayWithObjects:v35 count:4];
    [v10 registerFactory:v13 forSlots:v14];

    id v15 = [objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    [v15 setFaceView:v9];
    v16 = [(NTKCaliforniaFaceView *)v9 device];
    sub_C540(v16, (uint64_t)v30);
    [v15 setDialDiameter:v31];

    [v10 registerFactory:v15 forSlot:NTKComplicationSlotBezel];
    id v17 = objc_alloc((Class)NTKFullscreenSubdialComplicationFactory);
    v18 = [(NTKCaliforniaFaceView *)v9 device];
    id v19 = [v17 initForDevice:v18];

    [v19 setFaceView:v9];
    v20 = [(NTKCaliforniaFaceView *)v9 device];
    sub_C540(v20, (uint64_t)v27);
    objc_msgSend(v19, "setCircularComplicationDistanceFromCenter:", v28, v29);

    [v19 setAlpha:v9 faceView:1.0];
    [v10 registerFactory:v19 forSlot:NTKComplicationSlotSubdialBottom];
    id v21 = objc_alloc_init((Class)NTKSimpleTextFaceViewComplicationFactory);
    [v21 setFaceView:v9];
    v22 = [(NTKCaliforniaFaceView *)v9 device];
    sub_C540(v22, (uint64_t)v25);
    [v21 setVerticalCenterOffset:v26];

    [v10 registerFactory:v21 forSlot:NTKComplicationSlotSubdialTop];
    [(NTKCaliforniaFaceView *)v9 setComplicationFactory:v10];
    v23 = +[CLKSensitiveUIMonitor sharedMonitor];
    [v23 addSensitiveUIObserver:v9];
  }
  return v9;
}

- (void)dealloc
{
  v3 = +[CLKSensitiveUIMonitor sharedMonitor];
  [v3 removeSensitiveUIObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKCaliforniaFaceView;
  [(NTKCaliforniaFaceView *)&v4 dealloc];
}

- (id)createFaceColorPalette
{
  id v2 = objc_alloc_init((Class)NTKCaliforniaColorPalette);

  return v2;
}

- (id)colorPalette
{
  return [(NTKCaliforniaFaceView *)self faceColorPalette];
}

- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors
{
  return 1;
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (BOOL)_wantsStatusBarIconShadow
{
  if (!self->_dial) {
    return 0;
  }
  id v2 = [(NTKCaliforniaFaceView *)self colorPalette];
  unsigned __int8 v3 = [v2 isBlackBackground];

  return v3 ^ 1;
}

- (double)_verticalPaddingForStatusBar
{
  return 1.0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
}

- (void)_reorderSwitcherSnapshotView
{
  unsigned __int8 v3 = [(NTKCaliforniaFaceView *)self switcherSnapshotView];

  if (v3)
  {
    id v4 = [(NTKCaliforniaFaceView *)self switcherSnapshotView];
    [(NTKCaliforniaFaceView *)self bringSubviewToFront:v4];
  }
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCaliforniaFaceView;
  [(NTKCaliforniaFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKCaliforniaFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCaliforniaFaceView;
  [(NTKCaliforniaFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKCaliforniaFaceView *)self _removeViews];
}

- (void)_setupBackgroundView
{
  id v3 = objc_alloc((Class)UIView);
  [(NTKCaliforniaFaceView *)self bounds];
  id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  id v6 = [(NTKCaliforniaFaceView *)self contentView];
  [v6 addSubview:self->_backgroundView];
}

- (void)_setupCaliforniaContentView
{
  id v3 = [NTKCaliforniaContentView alloc];
  [(NTKCaliforniaFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  unint64_t dial = self->_dial;
  unint64_t style = self->_style;
  v14 = [(NTKCaliforniaFaceView *)self colorPalette];
  id v15 = [(NTKCaliforniaFaceView *)self device];
  v16 = -[NTKCaliforniaContentView initWithFrame:dial:style:colorPalette:device:](v3, "initWithFrame:dial:style:colorPalette:device:", dial, style, v14, v15, v5, v7, v9, v11);
  californiaContentView = self->_californiaContentView;
  self->_californiaContentView = v16;

  id v18 = [(NTKCaliforniaFaceView *)self contentView];
  [v18 addSubview:self->_californiaContentView];
}

- (void)_setupViews
{
  [(NTKCaliforniaFaceView *)self _setupBackgroundView];
  [(NTKCaliforniaFaceView *)self _setupCaliforniaContentView];
  id v3 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKCaliforniaFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NTKCaliforniaFaceView *)self device];
  id v13 = (NTKRoundedCornerOverlayView *)objc_msgSend(v3, "initWithFrame:forDeviceCornerRadius:", v12, v5, v7, v9, v11);
  cornerView = self->_cornerView;
  self->_cornerView = v13;

  id v15 = [(NTKCaliforniaFaceView *)self contentView];
  [v15 addSubview:self->_cornerView];

  [(NTKCaliforniaFaceView *)self applyColorOnAnalogHands];
  [(NTKCaliforniaFaceView *)self updateCircularMask];

  [(NTKCaliforniaFaceView *)self _updateDialTicksForBezelText];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCaliforniaFaceView;
  [(NTKCaliforniaFaceView *)&v6 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(NTKCaliforniaFaceView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](backgroundView, "ntk_setBoundsAndPositionFromFrame:");
  californiaContentView = self->_californiaContentView;
  [(NTKCaliforniaFaceView *)self bounds];
  -[NTKCaliforniaContentView ntk_setBoundsAndPositionFromFrame:](californiaContentView, "ntk_setBoundsAndPositionFromFrame:");
  cornerView = self->_cornerView;
  [(NTKCaliforniaFaceView *)self bounds];
  -[NTKRoundedCornerOverlayView ntk_setBoundsAndPositionFromFrame:](cornerView, "ntk_setBoundsAndPositionFromFrame:");
  if (([(NTKCaliforniaFaceView *)self editing] & 1) == 0 && !self->_dial) {
    [(NTKCaliforniaFaceView *)self updateCircularMask];
  }
}

- (void)_removeViews
{
  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;

  [(NTKCaliforniaFaceView *)self _removeCaliforniaContentView];

  [(NTKCaliforniaFaceView *)self _removeBackgroundView];
}

- (void)_removeBackgroundView
{
  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;
}

- (void)_removeCaliforniaContentView
{
  [(NTKCaliforniaContentView *)self->_californiaContentView removeFromSuperview];
  californiaContentView = self->_californiaContentView;
  self->_californiaContentView = 0;
}

- (void)applyColorOnAnalogHands
{
  id v3 = [(NTKCaliforniaFaceView *)self colorPalette];
  id v15 = [v3 clockHandsInlay];

  double v4 = [(NTKCaliforniaFaceView *)self colorPalette];
  double v5 = [v4 clockHands];

  objc_super v6 = [(NTKCaliforniaFaceView *)self timeView];
  double v7 = [v6 hourHandView];
  [v7 setInlayColor:v15];

  double v8 = [v6 minuteHandView];
  [v8 setInlayColor:v15];

  double v9 = [v6 hourHandView];
  [v9 setColor:v5];

  double v10 = [v6 minuteHandView];
  [v10 setColor:v5];

  double v11 = [(NTKCaliforniaFaceView *)self colorPalette];
  v12 = [v11 secondHand];
  id v13 = [v6 secondHandView];
  [v13 setColor:v12];

  v14 = [v6 secondHandView];
  [v14 setHandDotColor:v15];
}

- (void)updateWithPalette:(id)a3
{
  id v5 = [(NTKCaliforniaFaceView *)self backgroundColorForDial:self->_dial palette:a3];
  double v4 = [(NTKCaliforniaFaceView *)self backgroundView];
  [v4 setBackgroundColor:v5];
}

- (id)backgroundColorForDial:(unint64_t)a3 palette:(id)a4
{
  if (a3 == 1) {
    [a4 background];
  }
  else {
  double v4 = [a4 circularBackground];
  }

  return v4;
}

- (void)setDial:(unint64_t)a3
{
  self->_unint64_t dial = a3;
  if (a3)
  {
    californiaContentView = self->_californiaContentView;
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v12[1] = v5;
    v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(NTKCaliforniaContentView *)californiaContentView setTransform:v12];
  }
  else
  {
    [(NTKCaliforniaFaceView *)self californiaContentViewScale];
    CGAffineTransformMakeScale(&v14, v6, v6);
    double v7 = self->_californiaContentView;
    CGAffineTransform v13 = v14;
    [(NTKCaliforniaContentView *)v7 setTransform:&v13];
    [(NTKCaliforniaContentView *)self->_californiaContentView setBezelComplicationEnabled:[(NTKCaliforniaFaceView *)self isCircularDialWithBezel]];
  }
  [(NTKCaliforniaContentView *)self->_californiaContentView setDial:self->_dial];
  unint64_t dial = self->_dial;
  double v9 = [(NTKCaliforniaFaceView *)self colorPalette];
  double v10 = [(NTKCaliforniaFaceView *)self backgroundColorForDial:dial palette:v9];
  double v11 = [(NTKCaliforniaFaceView *)self backgroundView];
  [v11 setBackgroundColor:v10];

  [(NTKCaliforniaFaceView *)self updateCircularMask];
}

- (double)californiaContentViewScale
{
  unsigned int v2 = [(NTKCaliforniaFaceView *)self isCircularDialWithBezel];
  double result = 0.95;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v24 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 10:
      double v11 = [(NTKCaliforniaFaceView *)self colorPalette];
      [(NTKCaliforniaFaceView *)self updateWithPalette:v11];

      [(NTKCaliforniaFaceView *)self applyColorOnAnalogHands];
      v12 = [(NTKCaliforniaFaceView *)self colorPalette];
      [(NTKCaliforniaContentView *)self->_californiaContentView setColorPalette:v12];

      CGAffineTransform v13 = [(NTKCaliforniaFaceView *)self colorPalette];
      CGAffineTransform v14 = [v13 circularComplication];
      id v15 = [(NTKCaliforniaFaceView *)self colorPalette];
      v16 = [v15 circularComplicationSecondary];
      [(NTKCaliforniaFaceView *)self _updateSubDialRichComplicationsColor:v14 alternateColor:v16];

      id v17 = [(NTKCaliforniaFaceView *)self colorPalette];
      id v18 = [v17 cornerComplication];
      id v19 = [(NTKCaliforniaFaceView *)self colorPalette];
      v20 = [v19 cornerComplicationSecondary];
      [(NTKCaliforniaFaceView *)self updateRichCornerComplicationsInnerColor:v18 outerColor:v20];

      id v21 = [(NTKCaliforniaFaceView *)self _simpleTextComplicationColorForEditMode:10];
      [(NTKCaliforniaFaceView *)self _updateSimpleTextLabelColor:v21];

      double v9 = [(NTKCaliforniaFaceView *)self colorPalette];
      v22 = [v9 bezelComplication];
      [(NTKCaliforniaFaceView *)self _updateDialBezelComplicationColor:v22];

      break;
    case 15:
      double v9 = [(NTKCaliforniaFaceView *)self optionForCustomEditMode:15 slot:0];
      -[NTKCaliforniaFaceView setDial:](self, "setDial:", [v9 dialShape]);
      break;
    case 13:
      double v9 = [(NTKCaliforniaFaceView *)self optionForCustomEditMode:13 slot:0];
      if ([v9 style] == (id)-1) {
        id v10 = +[NTKCaliforniaStyleEditOption resolvedAutomaticStyleForCurrentLocale];
      }
      else {
        id v10 = [v9 style];
      }
      [(NTKCaliforniaFaceView *)self setStyle:v10];
      [(NTKCaliforniaFaceView *)self _updateComplicationCenterOffsetForStyle:self->_style];
      break;
    default:
      goto LABEL_11;
  }

LABEL_11:
  v23 = [(NTKCaliforniaFaceView *)self delegate];
  [v23 faceViewDidChangeWantsStatusBarIconShadow];
}

- (void)_updateSubDialRichComplicationsColor:(id)a3 alternateColor:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D360;
  v7[3] = &unk_18940;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKCaliforniaFaceView *)v8 enumerateComplicationDisplayWrappersWithBlock:v7];
}

- (void)_updateDialBezelComplicationColor:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D4E4;
  v5[3] = &unk_18968;
  id v6 = a3;
  id v4 = v6;
  [(NTKCaliforniaFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (void)updateCircularMask
{
  if (self->_dial) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  [(NTKCaliforniaFaceView *)self circleDiameter];

  [(NTKCaliforniaFaceView *)self setCircularMaskForCircularDialFraction:v3 circleDiameter:v4];
}

- (void)setCircularMaskForCircularDialFraction:(double)a3 circleDiameter:(double)a4
{
  [(NTKCaliforniaContentView *)self->_californiaContentView setBezelComplicationEnabled:[(NTKCaliforniaFaceView *)self isCircularDialWithBezel]];
  if ([(NTKCaliforniaFaceView *)self isCircularDialWithBezel])
  {
    [(NTKCaliforniaFaceView *)self californiaContentViewScale];
    CLKCompressFraction();
    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v19, v5, v5);
    californiaContentView = self->_californiaContentView;
    CGAffineTransform v18 = v19;
    [(NTKCaliforniaContentView *)californiaContentView setTransform:&v18];
  }
  CLKInterpolateBetweenFloatsClipped();
  double v8 = v7;
  double v9 = v7 * 0.5;
  [(NTKCaliforniaFaceView *)self bounds];
  double v11 = v10 * 0.5 - v9;
  [(NTKCaliforniaFaceView *)self bounds];
  CGAffineTransform v13 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11, v12 * 0.5 - v9, v8, v8);
  CGAffineTransform v14 = +[CAShapeLayer layer];
  id v15 = v13;
  objc_msgSend(v14, "setPath:", objc_msgSend(v15, "CGPath"));
  v16 = [(NTKCaliforniaFaceView *)self backgroundView];
  id v17 = [v16 layer];
  [v17 setMask:v14];
}

- (double)circleDiameter
{
  double v3 = [(NTKCaliforniaFaceView *)self device];
  sub_C540(v3, (uint64_t)&v7);

  unsigned int v4 = [(NTKCaliforniaFaceView *)self isCircularDialWithBezel];
  CGFloat v5 = (double *)&v7 + 1;
  if (v4) {
    CGFloat v5 = (double *)&v7;
  }
  return *v5;
}

- (BOOL)isCircularDialWithBezel
{
  double v3 = [(NTKCaliforniaFaceView *)self delegate];
  if (v3)
  {
    unsigned int v4 = [(NTKCaliforniaFaceView *)self delegate];
    unsigned int v5 = [v4 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotBezel] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_updateComplicationCenterOffsetForStyle:(unint64_t)a3
{
  uint64_t v12 = 0;
  long long v11 = 0u;
  memset(v10, 0, sizeof(v10));
  unsigned int v5 = [(NTKCaliforniaFaceView *)self device];
  sub_C540(v5, (uint64_t)v10);

  id v6 = (double *)&v11 + 1;
  if (a3 == 6) {
    id v6 = (double *)&v12;
  }
  double v7 = *v6;
  id v9 = [(NTKCaliforniaFaceView *)self complicationFactory];
  double v8 = [v9 factoryAtSlot:NTKComplicationSlotSubdialTop];
  [v8 verticalCenterOffset];
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    [v8 setVerticalCenterOffset:v7];
    [(NTKCaliforniaFaceView *)self invalidateComplicationLayout];
    [(NTKCaliforniaFaceView *)self layoutIfNeeded];
    [(NTKCaliforniaFaceView *)self layoutComplicationViews];
  }
}

- (void)setStyle:(unint64_t)a3
{
  unint64_t v3 = a3;
  self->_unint64_t style = a3;
  unsigned int v5 = [(NTKCaliforniaFaceView *)self device];
  if (NTKShowIndicScriptNumerals())
  {

    goto LABEL_7;
  }
  unint64_t style = self->_style;
  if (style - 7 >= 0xB)
  {

    if (style != 18) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  unint64_t v3 = 3;
LABEL_7:
  californiaContentView = self->_californiaContentView;

  [(NTKCaliforniaContentView *)californiaContentView setStyle:v3];
}

- (void)sensitiveUIStateChanged
{
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v18 = a4;
  id v12 = a5;
  id v13 = a7;
  switch(a6)
  {
    case 10:
      CGAffineTransform v14 = [(NTKCaliforniaFaceView *)self interpolatedColorPalette];
      id v15 = [v14 fromPalette];
      v16 = [(NTKCaliforniaFaceView *)self interpolatedColorPalette];
      id v17 = [v16 toPalette];
      [(NTKCaliforniaFaceView *)self _applyTransitionFraction:v15 fromColorPalette:v17 toColorPalette:a3];

      break;
    case 13:
      -[NTKCaliforniaFaceView _applyTransitionFraction:fromStyle:toStyle:](self, "_applyTransitionFraction:fromStyle:toStyle:", [v18 style], objc_msgSend(v12, "style"), a3);
      break;
    case 15:
      -[NTKCaliforniaFaceView _applyTransitionFraction:fromDial:toDial:](self, "_applyTransitionFraction:fromDial:toDial:", [v18 dialShape], objc_msgSend(v12, "dialShape"), a3);
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  if (a4 == a5)
  {
    [(NTKCaliforniaFaceView *)self setDial:a3];
  }
  else
  {
    double v8 = [(NTKCaliforniaFaceView *)self colorPalette];
    id v9 = [(NTKCaliforniaFaceView *)self backgroundColorForDial:a4 palette:v8];
    double v10 = [(NTKCaliforniaFaceView *)self colorPalette];
    long long v11 = [(NTKCaliforniaFaceView *)self backgroundColorForDial:a5 palette:v10];
    id v12 = NTKInterpolateBetweenColors();
    id v13 = [(NTKCaliforniaFaceView *)self backgroundView];
    [v13 setBackgroundColor:v12];

    CLKCompressFraction();
    double v15 = v14;
    CLKCompressFraction();
    uint64_t v17 = v16;
    [(NTKCaliforniaFaceView *)self circleDiameter];
    [(NTKCaliforniaFaceView *)self setCircularMaskForCircularDialFraction:v15 circleDiameter:v18];
    [(NTKCaliforniaContentView *)self->_californiaContentView applyTransitionFraction:a4 fromDial:a5 toDial:v15];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_DD74;
    v19[3] = &unk_18988;
    v19[4] = v17;
    *(double *)&v19[5] = v15;
    [(NTKCaliforniaFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v19];
    [(NTKCaliforniaContentView *)self->_californiaContentView setBezelComplicationEnabled:[(NTKCaliforniaFaceView *)self isCircularDialWithBezel]];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  unint64_t v6 = a4;
  if (a4 == -1) {
    unint64_t v6 = +[NTKCaliforniaStyleEditOption resolvedAutomaticStyleForCurrentLocale];
  }
  if (a5 == -1) {
    a5 = +[NTKCaliforniaStyleEditOption resolvedAutomaticStyleForCurrentLocale];
  }
  [(NTKCaliforniaContentView *)self->_californiaContentView applyTransitionFraction:v6 fromStyle:a5 toStyle:a3];
  CLKMapFractionIntoRange();
  if (a3 >= 0.5)
  {
    double v10 = v9;
    unint64_t v6 = a5;
  }
  else
  {
    double v10 = v9;
  }
  CLKMapFractionIntoRange();
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v11, v11);
  [(NTKCaliforniaFaceView *)self _updateComplicationCenterOffsetForStyle:v6];
  if (a5 == 6 && self->_dial == 1)
  {
    id v12 = [(NTKCaliforniaFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotSubdialTop];
    id v13 = [v12 display];

    [v13 setAlpha:v10];
    CGAffineTransform v14 = v15;
    [v13 setTransform:&v14];
  }
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NTKCaliforniaFaceView;
  [(NTKCaliforniaFaceView *)&v23 _configureComplicationView:v6 forSlot:v7];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v8 = v6;
    double v9 = [(NTKCaliforniaFaceView *)self colorPalette];
    double v10 = [v9 bezelComplication];
    [v8 setForegroundColor:v10];

    [v8 setFontWeight:UIFontWeightSemibold];
    [v8 setUseRoundedFontDesign:1];
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v7 isEqualToString:NTKComplicationSlotSubdialBottom])
  {
    id v8 = v6;
    CGFloat v11 = [(NTKCaliforniaFaceView *)self colorPalette];
    id v12 = [v11 circularComplication];
    [(NTKCaliforniaFaceView *)self setComplicationColor:v12];

    id v13 = [(NTKCaliforniaFaceView *)self complicationColor];
    [(NTKCaliforniaFaceView *)self setInterpolatedComplicationColor:v13];

    CGAffineTransform v14 = [(NTKCaliforniaFaceView *)self colorPalette];
    uint64_t v15 = [v14 circularComplicationSecondary];
LABEL_12:
    CGAffineTransform v19 = (void *)v15;
    [(NTKCaliforniaFaceView *)self setAlternateComplicationColor:v15];

    [v8 updateMonochromeColor];
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (([v7 isEqualToString:NTKComplicationSlotTopLeft] & 1) != 0
     || ([v7 isEqualToString:NTKComplicationSlotTopRight] & 1) != 0
     || ([v7 isEqualToString:NTKComplicationSlotBottomLeft] & 1) != 0
     || [v7 isEqualToString:NTKComplicationSlotBottomRight]))
  {
    id v8 = v6;
    uint64_t v16 = [(NTKCaliforniaFaceView *)self colorPalette];
    uint64_t v17 = [v16 cornerComplication];
    [(NTKCaliforniaFaceView *)self setComplicationColor:v17];

    double v18 = [(NTKCaliforniaFaceView *)self complicationColor];
    [(NTKCaliforniaFaceView *)self setInterpolatedComplicationColor:v18];

    CGAffineTransform v14 = [(NTKCaliforniaFaceView *)self colorPalette];
    uint64_t v15 = [v14 cornerComplicationSecondary];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v6;
    id v8 = [(NTKCaliforniaFaceView *)self _simpleTextComplicationColorForEditMode:[(NTKCaliforniaFaceView *)self editing]];
    id v21 = [v20 label];

    [v21 setTextColor:v8];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v6;
    id v8 = [(NTKCaliforniaFaceView *)self _simpleTextComplicationColorForEditMode:[(NTKCaliforniaFaceView *)self editing]];
    [v22 setTextColor:v8];

    goto LABEL_17;
  }
LABEL_18:
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v29 = a4;
  id v8 = a5;
  if ([v29 isEqual:v8])
  {
    [(NTKCaliforniaFaceView *)self updateWithPalette:v8];
  }
  else
  {
    double v9 = [(NTKCaliforniaFaceView *)self backgroundColorForDial:self->_dial palette:v29];
    double v10 = [(NTKCaliforniaFaceView *)self backgroundColorForDial:self->_dial palette:v8];
    CGFloat v11 = NTKInterpolateBetweenColors();
    id v12 = [(NTKCaliforniaFaceView *)self backgroundView];
    [v12 setBackgroundColor:v11];

    [(NTKCaliforniaContentView *)self->_californiaContentView applyTransitionFraction:v29 fromColorPalette:v8 toColorPalette:a3];
    id v13 = [v29 clockHandsInlay];
    CGAffineTransform v14 = [v8 clockHandsInlay];
    uint64_t v15 = NTKInterpolateBetweenColors();

    uint64_t v16 = [v29 clockHands];
    uint64_t v17 = [v8 clockHands];
    double v18 = NTKInterpolateBetweenColors();

    CGAffineTransform v19 = [v29 secondHand];
    id v20 = [v8 secondHand];
    id v21 = NTKInterpolateBetweenColors();

    id v22 = [(NTKCaliforniaFaceView *)self timeView];
    objc_super v23 = [v22 hourHandView];
    [v23 setInlayColor:v15];

    id v24 = [v22 minuteHandView];
    [v24 setInlayColor:v15];

    v25 = [v22 hourHandView];
    [v25 setColor:v18];

    double v26 = [v22 minuteHandView];
    [v26 setColor:v18];

    v27 = [v22 secondHandView];
    [v27 setColor:v21];

    double v28 = [v22 secondHandView];
    [v28 setHandDotColor:v15];

    [(NTKCaliforniaFaceView *)self _applyComplicationColorTransitionFraction:v29 fromColorPalette:v8 toColorPalette:a3];
  }
}

- (void)_applyComplicationColorTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = [v8 circularComplication];
  double v10 = [v7 circularComplication];
  CGFloat v11 = NTKInterpolateBetweenColors();
  id v12 = [v8 circularComplicationSecondary];
  id v13 = [v7 circularComplicationSecondary];
  CGAffineTransform v14 = NTKInterpolateBetweenColors();
  [(NTKCaliforniaFaceView *)self _updateSubDialRichComplicationsColor:v11 alternateColor:v14];

  uint64_t v15 = [v8 cornerComplication];
  uint64_t v16 = [v7 cornerComplication];
  uint64_t v17 = NTKInterpolateBetweenColors();
  double v18 = [v8 cornerComplicationSecondary];
  CGAffineTransform v19 = [v7 cornerComplicationSecondary];
  id v20 = NTKInterpolateBetweenColors();
  [(NTKCaliforniaFaceView *)self updateRichCornerComplicationsInnerColor:v17 outerColor:v20];

  id v21 = [v8 simpleTextComplication];
  id v22 = [v7 simpleTextComplication];
  objc_super v23 = NTKInterpolateBetweenColors();
  [(NTKCaliforniaFaceView *)self _updateSimpleTextLabelColor:v23];

  id v26 = [v8 bezelComplication];

  id v24 = [v7 bezelComplication];

  v25 = NTKInterpolateBetweenColors();
  [(NTKCaliforniaFaceView *)self _updateDialBezelComplicationColor:v25];
}

- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NTKCaliforniaFaceView;
  id v12 = a6;
  [(NTKCaliforniaFaceView *)&v17 _applyTransitionFraction:v10 fromComplication:v11 toComplication:v12 slot:a3];
  id v13 = (id)NTKComplicationSlotBezel;

  if (v13 == v12)
  {
    if (!objc_msgSend(v10, "complicationType", v17.receiver, v17.super_class)
      || (id v15 = [v11 complicationType], v14 = 1.0, !v15))
    {
      if (objc_msgSend(v10, "complicationType", v14) || objc_msgSend(v11, "complicationType"))
      {
        id v16 = [v11 complicationType];
        double v14 = 1.0 - a3;
        if (v16) {
          double v14 = a3;
        }
      }
      else
      {
        double v14 = 0.0;
      }
    }
    [(NTKCaliforniaFaceView *)self applyTransitionToCircularDialWithBezelFraction:v14];
  }
}

- (void)applyTransitionToCircularDialWithBezelFraction:(double)a3
{
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  unsigned int v5 = [(NTKCaliforniaFaceView *)self device];
  sub_C540(v5, (uint64_t)v11);

  CLKInterpolateBetweenFloatsClipped();
  [(NTKCaliforniaFaceView *)self setCircularMaskForCircularDialFraction:1.0 circleDiameter:v6];
  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v10, v7, v7);
  californiaContentView = self->_californiaContentView;
  CGAffineTransform v9 = v10;
  [(NTKCaliforniaContentView *)californiaContentView setTransform:&v9];
  [(NTKCaliforniaContentView *)self->_californiaContentView setBezelComplicationEnabled:a3 > 0.5];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKCaliforniaFaceView;
  -[NTKCaliforniaFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeScale(&v12, v7, v7);
    id v8 = [(NTKCaliforniaFaceView *)self contentView];
    CGAffineTransform v11 = v12;
    [v8 setTransform:&v11];

    CGAffineTransform v9 = [(NTKCaliforniaFaceView *)self timeView];
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];

    CGAffineTransform v10 = [(NTKCaliforniaFaceView *)self complicationContainerView];
    CGAffineTransform v11 = v12;
    [v10 setTransform:&v11];
  }
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotBezel])
  {
    double v5 = NTKLargeElementMinimumBreathingScale;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKCaliforniaFaceView;
    [(NTKCaliforniaFaceView *)&v8 _minimumBreathingScaleForComplicationSlot:v4];
    double v5 = v6;
  }

  return v5;
}

- (void)_configureForEditMode:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)NTKCaliforniaFaceView;
  -[NTKCaliforniaFaceView _configureForEditMode:](&v19, "_configureForEditMode:");
  [(NTKCaliforniaFaceView *)self _dialAlphaForEditMode:a3];
  double v6 = v5;
  CGFloat v7 = [(NTKCaliforniaFaceView *)self californiaContentView];
  [v7 setCircularBezelTickAlpha:v6];

  [(NTKCaliforniaFaceView *)self _contentAlphaForEditMode:a3];
  double v9 = v8;
  CGAffineTransform v10 = [(NTKCaliforniaFaceView *)self backgroundView];
  [v10 setAlpha:v9];

  [(NTKCaliforniaFaceView *)self _contentAlphaForEditMode:a3];
  double v12 = v11;
  objc_super v13 = [(NTKCaliforniaFaceView *)self californiaContentView];
  [v13 setAlpha:v12];

  [(NTKCaliforniaFaceView *)self _timeAlphaForEditMode:a3];
  double v15 = v14;
  id v16 = [(NTKCaliforniaFaceView *)self timeView];
  [v16 setAlpha:v15];

  [(NTKCaliforniaFaceView *)self _applyTransitionFraction:self->_dial fromDial:self->_dial toDial:1.0];
  [(NTKCaliforniaFaceView *)self _applyTransitionFraction:self->_style fromStyle:self->_style toStyle:1.0];
  objc_super v17 = [(NTKCaliforniaFaceView *)self colorPalette];
  double v18 = [(NTKCaliforniaFaceView *)self colorPalette];
  [(NTKCaliforniaFaceView *)self _applyTransitionFraction:v17 fromColorPalette:v18 toColorPalette:1.0];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v23.receiver = self;
  v23.super_class = (Class)NTKCaliforniaFaceView;
  -[NTKCaliforniaFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v23, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKCaliforniaFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKCaliforniaFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  CGAffineTransform v10 = [(NTKCaliforniaFaceView *)self backgroundView];
  [v10 setAlpha:v9];

  [(NTKCaliforniaFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKCaliforniaFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  objc_super v13 = [(NTKCaliforniaFaceView *)self californiaContentView];
  [v13 setAlpha:v12];

  [(NTKCaliforniaFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKCaliforniaFaceView *)self _timeAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v15 = v14;
  id v16 = [(NTKCaliforniaFaceView *)self timeView];
  [v16 setAlpha:v15];

  [(NTKCaliforniaFaceView *)self _dialAlphaForEditMode:a4];
  [(NTKCaliforniaFaceView *)self _dialAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v18 = v17;
  objc_super v19 = [(NTKCaliforniaFaceView *)self californiaContentView];
  [v19 setCircularBezelTickAlpha:v18];

  id v20 = [(NTKCaliforniaFaceView *)self _simpleTextComplicationColorForEditMode:a4];
  id v21 = [(NTKCaliforniaFaceView *)self _simpleTextComplicationColorForEditMode:a5];
  id v22 = NTKInterpolateBetweenColors();

  [(NTKCaliforniaFaceView *)self _updateSimpleTextLabelColor:v22];
}

- (void)_updateSimpleTextLabelColor:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_EFCC;
  v5[3] = &unk_18968;
  id v6 = a3;
  id v4 = v6;
  [(NTKCaliforniaFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (void)_cleanupAfterEditing
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCaliforniaFaceView;
  [(NTKCaliforniaFaceView *)&v5 _cleanupAfterEditing];
  BOOL v3 = [(NTKCaliforniaFaceView *)self isCircularDialWithBezel];
  if (v3) {
    [(NTKCaliforniaFaceView *)self _updateDialTicksForBezelText];
  }
  [(NTKCaliforniaContentView *)self->_californiaContentView setBezelComplicationEnabled:v3];
  id v4 = [(NTKCaliforniaFaceView *)self delegate];
  [v4 faceViewDidChangeWantsStatusBarIconShadow];
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCaliforniaFaceView;
  [(NTKCaliforniaFaceView *)&v5 _cleanupAfterTransitionComplicationSlot:a3 selectedComplication:a4];
  [(NTKCaliforniaFaceView *)self _updateDialTicksForBezelText];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (a4 & 0xFFFFFFFFFFFFFFFDLL) == 13;
}

- (id)_simpleTextComplicationColorForEditMode:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v3 = +[UIColor colorWithWhite:0.95 alpha:1.0];
  }
  else
  {
    id v4 = [(NTKCaliforniaFaceView *)self colorPalette];
    BOOL v3 = [v4 simpleTextComplication];
  }

  return v3;
}

- (double)_dialAlphaForEditMode:(int64_t)a3
{
  if (!a3) {
    return 1.0;
  }
  if (a3 == 1) {
    return 0.0;
  }
  return NTKEditModeDimmedAlpha;
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
  double result = 1.0;
  if (a3)
  {
    if (a3 != 10) {
      return NTKEditModeDimmedAlpha;
    }
  }
  return result;
}

- (void)_updateDialTicksForBezelText
{
  californiaContentView = self->_californiaContentView;
  [(NTKCaliforniaFaceView *)self bezelComplicationTextWidthInRadians];

  -[NTKCaliforniaContentView setTicksHiddenRange:](californiaContentView, "setTicksHiddenRange:");
}

- (double)bezelComplicationTextWidthInRadians
{
  unsigned int v2 = [(NTKCaliforniaFaceView *)self utilityBezelComplicationView];
  [v2 textWidthInRadians];
  double v4 = v3;

  return v4;
}

- (id)utilityBezelComplicationView
{
  unsigned int v2 = [(NTKCaliforniaFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBezel];
  double v3 = [v2 display];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityFlatComplicationView];

  if (v4)
  {
    objc_super v5 = [v2 display];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 13) {
    return NTKEditSpeedCustomEditModeDefault;
  }
  v5.receiver = self;
  v5.super_class = (Class)NTKCaliforniaFaceView;
  [(NTKCaliforniaFaceView *)&v5 _editSpeedForCustomEditMode:a3 slot:a4];
  return result;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  unsigned int v4 = &off_1B768;
  if (a3 != 15) {
    unsigned int v4 = 0;
  }
  if (a3 == 13) {
    return &off_1B750;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  CGAffineTransform v10 = v9;
  if ((a4 | 2) != 0xF)
  {
    v29.receiver = self;
    v29.super_class = (Class)NTKCaliforniaFaceView;
    double v15 = [(NTKCaliforniaFaceView *)&v29 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
    goto LABEL_13;
  }
  double v11 = [v9 objectForKeyedSubscript:&off_1AE28];
  uint64_t v12 = [v10 objectForKeyedSubscript:&off_1ADE0];
  objc_super v13 = (void *)v12;
  if (a4 == 13)
  {
    double v14 = v11;
    double v11 = v8;
    goto LABEL_7;
  }
  if (a4 == 15)
  {
    double v14 = (void *)v12;
    objc_super v13 = v8;
LABEL_7:
    id v16 = v8;
  }
  double v17 = [v10 objectForKeyedSubscript:&off_1ADF8];
  if (!qword_223D0)
  {
    uint64_t v18 = objc_opt_new();
    objc_super v19 = (void *)qword_223D0;
    qword_223D0 = v18;
  }
  id v20 = +[NSString stringWithFormat:@"%@-%@-%@", v11, v13, v17];
  double v15 = [(id)qword_223D0 objectForKey:v20];
  if (!v15)
  {
    id v21 = [NTKCaliforniaFaceView alloc];
    id v22 = [(NTKCaliforniaFaceView *)self device];
    objc_super v23 = [(NTKCaliforniaFaceView *)v21 initWithFaceStyle:39 forDevice:v22 clientIdentifier:0];

    [(NTKCaliforniaFaceView *)self frame];
    -[NTKCaliforniaFaceView setFrame:](v23, "setFrame:");
    [(NTKCaliforniaFaceView *)v23 _loadSnapshotContentViews];
    [(NTKCaliforniaFaceView *)v23 setOption:v13 forCustomEditMode:15 slot:0];
    [(NTKCaliforniaFaceView *)v23 setOption:v11 forCustomEditMode:13 slot:0];
    [(NTKCaliforniaFaceView *)v23 setOption:v17 forCustomEditMode:10 slot:0];
    id v24 = NTKIdealizedDate();
    [(NTKCaliforniaFaceView *)v23 setOverrideDate:v24 duration:0.0];

    [(NTKCaliforniaFaceView *)self frame];
    -[NTKCaliforniaFaceView setFrame:](v23, "setFrame:");
    [(NTKCaliforniaFaceView *)v23 bounds];
    v31.width = v25;
    v31.height = v26;
    UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
    v27 = [(NTKCaliforniaFaceView *)v23 layer];
    [v27 renderInContext:UIGraphicsGetCurrentContext()];

    double v15 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)qword_223D0 setObject:v15 forKey:v20];
  }
LABEL_13:

  return v15;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NTKCaliforniaContentView)californiaContentView
{
  return self->_californiaContentView;
}

- (void)setCaliforniaContentView:(id)a3
{
}

- (NTKRoundedCornerOverlayView)cornerView
{
  return self->_cornerView;
}

- (void)setCornerView:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)dial
{
  return self->_dial;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_californiaContentView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end