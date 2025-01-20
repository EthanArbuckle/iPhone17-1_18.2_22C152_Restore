@interface NTKSpectrumZeusFaceView
+ (id)_supportedComplicationSlots;
- (NTKSpectrumZeusFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_handAlphaForEditMode:(int64_t)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_snapshotWithStyle:(unint64_t)a3 size:(CGSize)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)_cleanupAfterEditing;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_loadActiveViews;
- (void)_loadCommonViews;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_reorderSwitcherSnapshotView;
- (void)_setStyle:(unint64_t)a3;
- (void)_unloadActiveViews;
- (void)_unloadCommonViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateColor;
- (void)_updateDateComplicationPositionIfNecessary;
- (void)_updateFramerate;
- (void)_updateStyle;
- (void)dealloc;
- (void)setDataMode:(int64_t)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKSpectrumZeusFaceView

- (NTKSpectrumZeusFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKSpectrumZeusFaceView;
  v5 = [(NTKSpectrumZeusFaceView *)&v9 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    v6 = objc_alloc_init(NTKSpectrumZeusColorPalette);
    palette = v5->_palette;
    v5->_palette = v6;
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKSpectrumZeusFaceView;
  [(NTKSpectrumZeusFaceView *)&v2 dealloc];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSpectrumZeusFaceView;
  [(NTKSpectrumZeusFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKSpectrumZeusFaceView *)self _loadCommonViews];
  [(NTKSpectrumZeusFaceView *)self _loadActiveViews];
  [(NTKSpectrumConicQuad *)self->_conicActiveQuad setOpaque:1];
  [(NTKSpectrumZeusFaceView *)self _updateColor];
  [(NTKSpectrumZeusFaceView *)self _updateStyle];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSpectrumZeusFaceView;
  [(NTKSpectrumZeusFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKSpectrumZeusFaceView *)self _unloadCommonViews];
  [(NTKSpectrumZeusFaceView *)self _unloadActiveViews];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKSpectrumZeusFaceView;
  id v6 = a4;
  [(NTKSpectrumZeusFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_conicQuadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSpectrumZeusFaceView;
  [(NTKSpectrumZeusFaceView *)&v3 _applyFrozen];
  [(NTKSpectrumZeusFaceView *)self _updateFramerate];
}

- (void)setDataMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSpectrumZeusFaceView;
  [(NTKSpectrumZeusFaceView *)&v4 setDataMode:a3];
  [(NTKSpectrumZeusFaceView *)self _updateFramerate];
}

- (void)_prepareForEditing
{
  v2.receiver = self;
  v2.super_class = (Class)NTKSpectrumZeusFaceView;
  [(NTKSpectrumZeusFaceView *)&v2 _prepareForEditing];
}

- (void)_cleanupAfterEditing
{
  v2.receiver = self;
  v2.super_class = (Class)NTKSpectrumZeusFaceView;
  [(NTKSpectrumZeusFaceView *)&v2 _cleanupAfterEditing];
}

- (void)_updateFramerate
{
  if ([(NTKSpectrumZeusFaceView *)self editing])
  {
    uint64_t v3 = 0;
  }
  else
  {
    unint64_t v4 = (unint64_t)[(NTKSpectrumZeusFaceView *)self dataMode];
    unsigned __int8 v5 = [(NTKSpectrumZeusFaceView *)self isFrozen];
    BOOL v7 = v4 != 3 && (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    uint64_t v3 = (v5 & 1) != 0 || v7;
  }
  conicQuadView = self->_conicQuadView;

  [(CLKUIQuadView *)conicQuadView setPaused:v3];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKSpectrumZeusFaceView;
  id v6 = a3;
  [(NTKSpectrumZeusFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKSpectrumConicQuad setOverrideDate:duration:](self->_conicActiveQuad, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)_configureTimeView:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSpectrumZeusFaceView;
  [(NTKSpectrumZeusFaceView *)&v3 _configureTimeView:a3];
}

- (void)_loadLayoutRules
{
  objc_super v3 = [(NTKSpectrumZeusFaceView *)self device];
  double v14 = 0.0;
  long long v13 = 0u;
  memset(v12, 0, sizeof(v12));
  _LayoutConstants(v3, (uint64_t)v12);
  [(NTKSpectrumZeusFaceView *)self bounds];
  double v5 = v4 * 0.5;
  [(NTKSpectrumZeusFaceView *)self bounds];
  objc_super v7 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v3, 3, 3, v5 - *(double *)&v13 * 0.5, v14 + v6 * 0.5 - *((double *)&v13 + 1) * 0.5);
  v10 = [(NTKSpectrumZeusFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottom];
  v11 = v7;
  id v8 = v7;
  id v9 = v10;
  NTKEnumerateComplicationStates();
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  if ([a5 isEqualToString:NTKComplicationSlotBottom])
  {
    id v8 = [NTKZeusComplicationBackgroundView alloc];
    id v9 = [(NTKSpectrumZeusFaceView *)self device];
    v10 = [(NTKZeusComplicationBackgroundView *)v8 initWithDevice:v9];

    v11 = +[NTKZeusComplicationView viewForComplicationType:backgroundView:](NTKZeusComplicationView, "viewForComplicationType:backgroundView:", [v7 complicationType], v10);
    if ([v11 conformsToProtocol:&OBJC_PROTOCOL___NTKZeudleComplicationDisplay])
    {
      id v12 = v11;
      [v12 setStyle:1];
      [v12 setLegibilityEnabled:1];
      [v12 applyPalette:self->_palette];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_updateDateComplicationPositionIfNecessary
{
  [(NTKSpectrumZeusFaceView *)self _loadLayoutRules];
  id v3 = [(NTKSpectrumZeusFaceView *)self delegate];
  [v3 faceViewWantsComplicationKeylineFramesReloaded];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

+ (id)_supportedComplicationSlots
{
  uint64_t v4 = NTKComplicationSlotBottom;
  objc_super v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 15)
  {
    id v7 = [a3 style];
    [(NTKSpectrumZeusFaceView *)self _setStyle:v7];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 15)
  {
    id v11 = a5;
    id v12 = [a4 style];
    id v13 = [v11 style];

    [(NTKSpectrumZeusFaceView *)self _applyTransitionFraction:v12 fromStyle:v13 toStyle:a3];
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  id v8 = [(NTKSpectrumZeusFaceView *)self timeView];
  [(NTKSpectrumZeusFaceView *)self _handAlphaForEditMode:a4];
  [(NTKSpectrumZeusFaceView *)self _handAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  conicQuadView = self->_conicQuadView;
  [(NTKSpectrumZeusFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKSpectrumZeusFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[CLKUIQuadView setAlpha:](conicQuadView, "setAlpha:");
  id v10 = [(NTKSpectrumZeusFaceView *)self complicationContainerView];
  [(NTKSpectrumZeusFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKSpectrumZeusFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v10, "setAlpha:");
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 15) {
    return 1.0;
  }
  return result;
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)NTKSpectrumZeusFaceView;
  -[NTKSpectrumZeusFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v19, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 15)
  {
    NTKScaleForRubberBandingFraction();
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeScale(&v18, v7, v7);
    id v8 = [(NTKSpectrumZeusFaceView *)self contentView];
    CGAffineTransform v17 = v18;
    [v8 setTransform:&v17];

    id v9 = [(NTKSpectrumZeusFaceView *)self timeView];
    CGAffineTransform v17 = v18;
    [v9 setTransform:&v17];

    id v10 = [(NTKSpectrumZeusFaceView *)self dialComplicationContainerView];
    CGAffineTransform v17 = v18;
    [v10 setTransform:&v17];

    NTKAlphaForRubberBandingFraction();
    double v12 = v11;
    [(NTKSpectrumZeusFaceView *)self _contentAlphaForEditMode:15];
    double v14 = v12 * v13;
    v15 = [(NTKSpectrumZeusFaceView *)self contentView];
    [v15 setAlpha:v14];

    v16 = [(NTKSpectrumZeusFaceView *)self dialComplicationContainerView];
    [v16 setAlpha:v14];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKSpectrumZeusFaceView;
  -[NTKSpectrumZeusFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 15)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeScale(&v12, v7, v7);
    id v8 = [(NTKSpectrumZeusFaceView *)self contentView];
    CGAffineTransform v11 = v12;
    [v8 setTransform:&v11];

    id v9 = [(NTKSpectrumZeusFaceView *)self timeView];
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];

    id v10 = [(NTKSpectrumZeusFaceView *)self dialComplicationContainerView];
    CGAffineTransform v11 = v12;
    [v10 setTransform:&v11];
  }
}

- (void)_updateColor
{
  conicActiveQuad = self->_conicActiveQuad;
  uint64_t v4 = [(NTKSpectrumZeusColorPalette *)self->_palette backgroundColor];
  uint64_t v5 = [(NTKSpectrumZeusColorPalette *)self->_palette splitColor];
  [(NTKSpectrumConicQuad *)conicActiveQuad setFromColor:v4 toColor:v5];

  id v17 = [(NTKSpectrumZeusFaceView *)self timeView];
  double v6 = [(NTKSpectrumZeusColorPalette *)self->_palette handInlayColor];
  CGFloat v7 = [(NTKSpectrumZeusColorPalette *)self->_palette minuteHandDotColor];
  id v8 = [v17 minuteHandView];
  [v8 setInlayColor:v6];
  id v9 = [(NTKSpectrumZeusColorPalette *)self->_palette minuteHandColor];
  [v8 setColor:v9];

  id v10 = [v17 hourHandView];
  [v10 setInlayColor:v6];
  CGAffineTransform v11 = [(NTKSpectrumZeusColorPalette *)self->_palette hourHandColor];
  [v10 setColor:v11];

  logoView1 = self->_logoView1;
  objc_super v13 = [(NTKSpectrumZeusColorPalette *)self->_palette bottomComplication];
  [(UIImageView *)logoView1 setTintColor:v13];

  logoView2 = self->_logoView2;
  v15 = [(NTKSpectrumZeusColorPalette *)self->_palette bottomComplication];
  [(UIImageView *)logoView2 setTintColor:v15];

  v16 = [v17 minuteHandView];
  [v16 setHandDotColor:v7];
}

- (void)_updateStyle
{
  [(NTKSpectrumConicQuad *)self->_conicActiveQuad setStyle:self->_style];
  conicInactiveQuad = self->_conicInactiveQuad;
  unint64_t style = self->_style;

  [(NTKSpectrumConicQuad *)conicInactiveQuad setStyle:style];
}

- (void)_setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
  [(NTKSpectrumZeusFaceView *)self _updateStyle];
}

- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
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

- (void)_reorderSwitcherSnapshotView
{
  id v3 = [(NTKSpectrumZeusFaceView *)self switcherSnapshotView];

  if (v3)
  {
    id v4 = [(NTKSpectrumZeusFaceView *)self switcherSnapshotView];
    [(NTKSpectrumZeusFaceView *)self bringSubviewToFront:v4];
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!qword_4C968)
  {
    uint64_t v10 = objc_opt_new();
    CGAffineTransform v11 = (void *)qword_4C968;
    qword_4C968 = v10;
  }
  if (a4 == 15)
  {
    CGAffineTransform v12 = +[NSString stringWithFormat:@"%@", v8];
    objc_super v13 = [(id)qword_4C968 objectForKey:v12];
    if (!v13)
    {
      id v14 = v8;
      id v15 = [v14 style];
      id v16 = [v14 swatchStyle];

      +[NTKEditOption sizeForSwatchStyle:v16];
      objc_super v13 = -[NTKSpectrumZeusFaceView _snapshotWithStyle:size:](self, "_snapshotWithStyle:size:", v15);
      [(id)qword_4C968 setObject:v13 forKey:v12];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NTKSpectrumZeusFaceView;
    objc_super v13 = [(NTKSpectrumZeusFaceView *)&v18 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v13;
}

- (id)_snapshotWithStyle:(unint64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double y = CGPointZero.y;
  id v9 = +[CLKUIQuadView quadViewWithFrame:@"HmSb", CGPointZero.x, y, a4.width, a4.height identifier];
  uint64_t v10 = +[UIScreen mainScreen];
  [v10 scale];
  double v12 = v11;

  id v13 = [objc_alloc((Class)NTKSpectrumConicQuad) initWithRole:0 screenScale:v12];
  [v13 setOpaque:1];
  [v13 setStyle:a3];
  id v14 = [(NTKSpectrumZeusColorPalette *)self->_palette backgroundColor];
  id v15 = [(NTKSpectrumZeusColorPalette *)self->_palette splitColor];
  [v13 setFromColor:v14 toColor:v15];

  [v9 addQuad:v13];
  id v16 = objc_msgSend(v9, "snapshotInRect:scale:time:", CGPointZero.x, y, width, height, v12, 0.0);

  return v16;
}

- (void)_loadCommonViews
{
  uint64_t v33 = 0;
  memset(v32, 0, sizeof(v32));
  id v3 = [(NTKSpectrumZeusFaceView *)self device];
  _LayoutConstants(v3, (uint64_t)v32);

  id v31 = [(NTKSpectrumZeusFaceView *)self timeView];
  id v4 = [v31 secondHandView];
  [v4 setHidden:1];

  [(NTKSpectrumZeusFaceView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  +[CLKUIQuadView quadViewWithFrame:identifier:](CLKUIQuadView, "quadViewWithFrame:identifier:", @"HmSb");
  id v13 = (CLKUIQuadView *)objc_claimAutoreleasedReturnValue();
  conicQuadView = self->_conicQuadView;
  self->_conicQuadView = v13;

  id v15 = [(NTKSpectrumZeusFaceView *)self contentView];
  id v16 = [(NTKSpectrumZeusFaceView *)self device];
  id v17 = (UIView *)objc_msgSend(objc_alloc((Class)NTKRoundedCornerOverlayView), "initWithFrame:forDeviceCornerRadius:", v16, v6, v8, v10, v12);
  cornerView = self->_cornerView;
  self->_cornerView = v17;

  [v15 addSubview:self->_cornerView];
  [v15 addSubview:self->_conicQuadView];
  [v15 sendSubviewToBack:self->_conicQuadView];
  id v19 = objc_alloc((Class)UIImageView);
  v20 = +[NTKZeusSpectrumFaceBundle imageWithName:@"ZeusSpectrumLogo1"];
  v21 = [v20 imageWithRenderingMode:2];
  v22 = (UIImageView *)[v19 initWithImage:v21];
  logoView1 = self->_logoView1;
  self->_logoView1 = v22;

  v24 = self->_logoView1;
  CLKRectIntegralForDevice();
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](v24, "ntk_setBoundsAndPositionFromFrame:");
  id v25 = objc_alloc((Class)UIImageView);
  v26 = +[NTKZeusSpectrumFaceBundle imageWithName:@"ZeusSpectrumLogo2"];
  v27 = [v26 imageWithRenderingMode:2];
  v28 = (UIImageView *)[v25 initWithImage:v27];
  logoView2 = self->_logoView2;
  self->_logoView2 = v28;

  [(UIImageView *)self->_logoView1 frame];
  v30 = self->_logoView2;
  CLKRectIntegralForDevice();
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](v30, "ntk_setBoundsAndPositionFromFrame:");
  _NTKZeusApplyLegibilityToView(self->_logoView1);
  _NTKZeusApplyLegibilityToView(self->_logoView2);
  [v15 insertSubview:self->_logoView1 aboveSubview:self->_conicQuadView];
  [v15 insertSubview:self->_logoView2 aboveSubview:self->_conicQuadView];
}

- (void)_unloadCommonViews
{
  [(CLKUIQuadView *)self->_conicQuadView removeFromSuperview];
  conicQuadView = self->_conicQuadView;
  self->_conicQuadView = 0;
}

- (void)_loadActiveViews
{
  id v3 = objc_alloc((Class)NTKSpectrumConicQuad);
  id v4 = [(NTKSpectrumZeusFaceView *)self device];
  [v4 screenScale];
  double v5 = (NTKSpectrumConicQuad *)objc_msgSend(v3, "initWithRole:screenScale:", 0);
  conicActiveQuad = self->_conicActiveQuad;
  self->_conicActiveQuad = v5;

  conicQuadView = self->_conicQuadView;
  double v8 = self->_conicActiveQuad;

  [(CLKUIQuadView *)conicQuadView addQuad:v8];
}

- (void)_unloadActiveViews
{
  [(CLKUIQuadView *)self->_conicQuadView removeQuad:self->_conicActiveQuad];
  conicActiveQuad = self->_conicActiveQuad;
  self->_conicActiveQuad = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoView2, 0);
  objc_storeStrong((id *)&self->_logoView1, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_conicQuadView, 0);
  objc_storeStrong((id *)&self->_conicInactiveQuad, 0);

  objc_storeStrong((id *)&self->_conicActiveQuad, 0);
}

@end