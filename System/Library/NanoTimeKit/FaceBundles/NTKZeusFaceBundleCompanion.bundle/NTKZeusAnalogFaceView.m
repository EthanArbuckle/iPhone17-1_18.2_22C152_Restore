@interface NTKZeusAnalogFaceView
+ (id)_supportedComplicationSlots;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_wantsStatusBarIconShadow;
- (CGRect)_frameForComplicationDisplayWrapper:(id)a3 inSlot:(id)a4;
- (CGRect)_lowerComplicationFrameForStyle:(unint64_t)a3;
- (CGRect)_upperComplicationFrameForStyle:(unint64_t)a3;
- (NTKZeusAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_backgroundAlphaForEditMode:(int64_t)a3;
- (double)_handAlphaForEditing:(BOOL)a3;
- (double)_lowerComplicationVerticalOffsetForStyle:(unint64_t)a3;
- (double)_numbersAlphaForEditMode:(int64_t)a3;
- (double)_secondHandAlphaForDensity:(unint64_t)a3 isEditing:(BOOL)a4;
- (double)_verticalPaddingForStatusBar;
- (id)_blancNumeralsColorForEditMode:(int64_t)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_numeralsCompositingFilterForPalette:(id)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)complicationColorForBlancEditMode:(int64_t)a3;
- (id)createFaceColorPalette;
- (id)palette;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPaletteToNumerals:(id)a3;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_numeralsPaletteTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)_setStatusBarIconShadowNeeded:(BOOL)a3;
- (void)_unloadSnapshotContentViews;
- (void)_updateDateComplicationPositionIfNecessary;
- (void)nominalAnimationEndForHandView:(id)a3;
- (void)nominalAnimationStart:(id)a3 forHandView:(id)a4;
- (void)overrideAnimationApplier:(double)a3 zRotation:(double)a4 forHandView:(id)a5;
- (void)overrideZRotation:(double)a3 forHandView:(id)a4;
@end

@implementation NTKZeusAnalogFaceView

- (NTKZeusAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKZeusAnalogFaceView;
  v5 = [(NTKZeusAnalogFaceView *)&v14 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(NTKZeusAnalogFaceView *)v5 device];
    v8 = (char *)[v7 deviceCategory];

    v9 = [(NTKZeusAnalogFaceView *)v6 device];
    unsigned __int8 v10 = [v9 isExplorer];

    if ((v10 & 1) != 0 || v8 != (unsigned char *)&dword_0 + 1) {
      v6->_isHandsVisibleInColorEditing = 1;
    }
    CGPoint origin = CGRectNull.origin;
    CGSize size = CGRectNull.size;
    v6->_upperComplicationOverrideFrame.CGPoint origin = CGRectNull.origin;
    v6->_upperComplicationOverrideFrame.CGSize size = size;
    v6->_lowerComplicationOverrideFrame.CGPoint origin = origin;
    v6->_lowerComplicationOverrideFrame.CGSize size = size;
  }
  return v6;
}

- (id)createFaceColorPalette
{
  v2 = objc_alloc_init(NTKZeusAnalogColorPalette);

  return v2;
}

- (id)palette
{
  return [(NTKZeusAnalogFaceView *)self faceColorPalette];
}

- (void)_configureTimeView:(id)a3
{
}

- (void)_loadSnapshotContentViews
{
  v59.receiver = self;
  v59.super_class = (Class)NTKZeusAnalogFaceView;
  [(NTKZeusAnalogFaceView *)&v59 _loadSnapshotContentViews];
  double v58 = 0.0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  v3 = [(NTKZeusAnalogFaceView *)self device];
  sub_F7E8(v3, (uint64_t)&v54);

  if (!self->_backgroundView)
  {
    v4 = [NTKZeusAnalogBackgroundView alloc];
    v5 = [(NTKZeusAnalogFaceView *)self device];
    v6 = [(NTKZeusAnalogBackgroundView *)v4 initWithDevice:v5];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v6;

    v8 = [(NTKZeusAnalogFaceView *)self contentView];
    [v8 insertSubview:self->_backgroundView atIndex:0];
  }
  if (!self->_numeralsView)
  {
    [(NTKZeusAnalogFaceView *)self bounds];
    [(NTKZeusAnalogFaceView *)self bounds];
    v9 = [NTKZeusAnalogNumeralsView alloc];
    unsigned __int8 v10 = [(NTKZeusAnalogFaceView *)self device];
    v11 = [(NTKZeusAnalogFaceView *)self palette];
    v12 = [(NTKZeusAnalogNumeralsView *)v9 initWithDevice:v10 palette:v11 style:self->_style density:self->_density];
    numeralsView = self->_numeralsView;
    self->_numeralsView = v12;

    objc_super v14 = sub_F920();
    v15 = [(NTKZeusAnalogNumeralsView *)self->_numeralsView layer];
    [v15 setActions:v14];

    v16 = [(NTKZeusAnalogFaceView *)self contentView];
    [v16 addSubview:self->_numeralsView];

    v17 = [NTKZeusAnalogNumeralsView alloc];
    v18 = [(NTKZeusAnalogFaceView *)self device];
    v19 = [(NTKZeusAnalogFaceView *)self palette];
    v20 = [(NTKZeusAnalogNumeralsView *)v17 initWithDevice:v18 palette:v19 style:self->_style density:self->_density];
    numeralsTransitionView = self->_numeralsTransitionView;
    self->_numeralsTransitionView = v20;

    v22 = sub_F920();
    v23 = [(NTKZeusAnalogNumeralsView *)self->_numeralsTransitionView layer];
    [v23 setActions:v22];

    [(NTKZeusAnalogNumeralsView *)self->_numeralsTransitionView setAlpha:0.0];
    v24 = [(NTKZeusAnalogFaceView *)self contentView];
    [v24 addSubview:self->_numeralsTransitionView];
  }
  if (!self->_logoUpperView)
  {
    v25 = (UIImageView *)objc_opt_new();
    logoUpperView = self->_logoUpperView;
    self->_logoUpperView = v25;

    v27 = +[NTKZeusAnalogFaceBundle imageWithName:@"ZeusAnalogLogo1"];
    [(UIImageView *)self->_logoUpperView setImage:v27];

    [(NTKZeusAnalogFaceView *)self bounds];
    double v28 = *((double *)&v55 + 1);
    double v30 = (v29 - *((double *)&v55 + 1)) * 0.5;
    [(NTKZeusAnalogFaceView *)self bounds];
    -[UIImageView setFrame:](self->_logoUpperView, "setFrame:", v30, *((double *)&v57 + 1) + v31 * 0.5 - *(double *)&v56, v28);
    v32 = [(NTKZeusAnalogFaceView *)self contentView];
    [v32 addSubview:self->_logoUpperView];
  }
  if (!self->_logoLowerView)
  {
    v33 = (UIImageView *)objc_opt_new();
    logoLowerView = self->_logoLowerView;
    self->_logoLowerView = v33;

    v35 = +[NTKZeusAnalogFaceBundle imageWithName:@"ZeusAnalogLogo2"];
    [(UIImageView *)self->_logoLowerView setImage:v35];

    [(NTKZeusAnalogFaceView *)self bounds];
    double v36 = *((double *)&v56 + 1);
    double v38 = (v37 - *((double *)&v56 + 1)) * 0.5;
    [(UIImageView *)self->_logoUpperView frame];
    -[UIImageView setFrame:](self->_logoLowerView, "setFrame:", v38, CGRectGetMaxY(v60) + v58, v36, *(double *)&v57);
    v39 = [(NTKZeusAnalogFaceView *)self contentView];
    [v39 addSubview:self->_logoLowerView];
  }
  if (!self->_cornerView)
  {
    id v40 = objc_alloc((Class)NTKRoundedCornerOverlayView);
    [(NTKZeusAnalogFaceView *)self bounds];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    v49 = [(NTKZeusAnalogFaceView *)self device];
    v50 = (UIView *)objc_msgSend(v40, "initWithFrame:forDeviceCornerRadius:", v49, v42, v44, v46, v48);
    cornerView = self->_cornerView;
    self->_cornerView = v50;

    v52 = self->_cornerView;
    v53 = [(NTKZeusAnalogFaceView *)self contentView];
    [(NTKZeusAnalogFaceView *)self insertSubview:v52 aboveSubview:v53];
  }
}

- (void)_unloadSnapshotContentViews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKZeusAnalogFaceView;
  [(NTKZeusAnalogFaceView *)&v8 _unloadSnapshotContentViews];
  [(NTKZeusAnalogBackgroundView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(UIView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;

  [(NTKZeusAnalogNumeralsView *)self->_numeralsView removeFromSuperview];
  numeralsView = self->_numeralsView;
  self->_numeralsView = 0;

  [(UIImageView *)self->_logoUpperView removeFromSuperview];
  logoUpperView = self->_logoUpperView;
  self->_logoUpperView = 0;

  [(UIImageView *)self->_logoLowerView removeFromSuperview];
  logoLowerView = self->_logoLowerView;
  self->_logoLowerView = 0;
}

- (BOOL)_needsForegroundContainerView
{
  return 0;
}

- (id)_numeralsCompositingFilterForPalette:(id)a3
{
  if (((unint64_t)[a3 bleed] & 0xFFFFFFFFFFFFFFFELL) == 4) {
    id v3 = kCAFilterMultiplyBlendMode;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_applyPaletteToNumerals:(id)a3
{
  id v4 = a3;
  v5 = [(NTKZeusAnalogFaceView *)self _numeralsCompositingFilterForPalette:v4];
  numeralsView = self->_numeralsView;
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(NTKZeusAnalogNumeralsView *)numeralsView setTransform:v9];
  objc_super v8 = [(NTKZeusAnalogNumeralsView *)self->_numeralsView layer];
  [v8 setCompositingFilter:v5];

  [(NTKZeusAnalogNumeralsView *)self->_numeralsView setAlpha:1.0];
  [(NTKZeusAnalogNumeralsView *)self->_numeralsView setPalette:v4];

  [(NTKZeusAnalogNumeralsView *)self->_numeralsView setDensity:self->_density];
  [(NTKZeusAnalogNumeralsView *)self->_numeralsView setStyle:self->_style];
  [(NTKZeusAnalogNumeralsView *)self->_numeralsView setStatusIndicatorVisible:self->_showingStatus];
  [(NTKZeusAnalogNumeralsView *)self->_numeralsTransitionView setAlpha:0.0];
}

- (void)_numeralsPaletteTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  unsigned __int8 v10 = [(NTKZeusAnalogFaceView *)self _numeralsCompositingFilterForPalette:v9];
  v11 = [(NTKZeusAnalogFaceView *)self _numeralsCompositingFilterForPalette:v8];
  if (a3 >= 0.5) {
    id v12 = v8;
  }
  else {
    id v12 = v9;
  }
  if (a3 >= 0.5) {
    v13 = v11;
  }
  else {
    v13 = v10;
  }
  [(NTKZeusAnalogNumeralsView *)self->_numeralsView setPalette:v12];

  objc_super v14 = [(NTKZeusAnalogNumeralsView *)self->_numeralsView layer];
  [v14 setCompositingFilter:v13];

  CLKMapFractionIntoRange();
  CGFloat v16 = v15;
  CLKCompressFraction();
  if (a3 >= 0.5)
  {
    -[NTKZeusAnalogNumeralsView setAlpha:](self->_numeralsView, "setAlpha:");
    CGAffineTransformMakeScale(&v21, v16, v16);
    numeralsView = self->_numeralsView;
    CGAffineTransform v20 = v21;
    v19 = &v20;
  }
  else
  {
    [(NTKZeusAnalogNumeralsView *)self->_numeralsView setAlpha:1.0 - v17];
    CGAffineTransformMakeScale(&v23, v16, v16);
    numeralsView = self->_numeralsView;
    CGAffineTransform v22 = v23;
    v19 = &v22;
  }
  -[NTKZeusAnalogNumeralsView setTransform:](numeralsView, "setTransform:", v19, *(_OWORD *)&v20.a, *(_OWORD *)&v20.c, *(_OWORD *)&v20.tx);
}

- (double)_lowerComplicationVerticalOffsetForStyle:(unint64_t)a3
{
  id v4 = [(NTKZeusAnalogFaceView *)self device];
  sub_F7E8(v4, (uint64_t)v7);
  double v5 = *(double *)&v7[a3 + 9];

  return v5;
}

- (CGRect)_lowerComplicationFrameForStyle:(unint64_t)a3
{
  [(NTKZeusAnalogFaceView *)self _lowerComplicationVerticalOffsetForStyle:a3];
  double v5 = v4;
  [(NTKZeusAnalogFaceView *)self bounds];
  double v7 = v6 * 0.5;
  [(NTKZeusAnalogFaceView *)self bounds];
  double v9 = v5 + v8 * 0.5;
  unsigned __int8 v10 = [(NTKZeusAnalogFaceView *)self device];
  sub_F7E8(v10, (uint64_t)v17);
  double v11 = v18;
  double v12 = v19;

  double v13 = v7 - v11 * 0.5;
  double v14 = v9 - v12 * 0.5;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_upperComplicationFrameForStyle:(unint64_t)a3
{
  double v4 = [(NTKZeusAnalogFaceView *)self device];
  [(NTKZeusAnalogFaceView *)self bounds];
  double v5 = [(NTKZeusAnalogFaceView *)self device];
  sub_F7E8(v5, (uint64_t)v18);

  CLKSizeCenteredAboutPointForDevice();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_loadLayoutRules
{
  id v3 = [(NTKZeusAnalogFaceView *)self device];
  double v4 = [(NTKZeusAnalogFaceView *)self optionForCustomEditMode:13 slot:0];
  -[NTKZeusAnalogFaceView _lowerComplicationFrameForStyle:](self, "_lowerComplicationFrameForStyle:", [v4 style]);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[NTKZeusAnalogFaceView _upperComplicationFrameForStyle:](self, "_upperComplicationFrameForStyle:", [v4 style]);
  double v13 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v3, 1, 1);
  double v14 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v3, 3, 3, v6, v8, v10, v12);
  double v15 = [(NTKZeusAnalogFaceView *)self complicationLayoutforSlot:NTKComplicationSlotTop];
  [(NTKZeusAnalogFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottom];
  CGAffineTransform v20 = v15;
  v22 = CGAffineTransform v21 = v13;
  CGAffineTransform v23 = v14;
  id v16 = v14;
  id v17 = v22;
  id v18 = v13;
  id v19 = v15;
  NTKEnumerateComplicationStates();
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = NTKComplicationSlotBottom;
  if (([v8 isEqualToString:NTKComplicationSlotBottom] & 1) != 0
    || [v8 isEqualToString:NTKComplicationSlotTop])
  {
    if ([v8 isEqualToString:v9])
    {
      double v10 = [NTKZeusComplicationBackgroundView alloc];
      double v11 = [(NTKZeusAnalogFaceView *)self device];
      double v12 = [(NTKZeusComplicationBackgroundView *)v10 initWithDevice:v11];
    }
    else
    {
      double v12 = 0;
    }
    double v13 = +[NTKZeusComplicationView viewForComplicationType:backgroundView:](NTKZeusComplicationView, "viewForComplicationType:backgroundView:", [v7 complicationType], v12);
    if (![v13 conformsToProtocol:&OBJC_PROTOCOL___NTKZeudleComplicationDisplay]) {
      goto LABEL_14;
    }
    id v14 = v13;
    double v15 = [(NTKZeusAnalogFaceView *)self optionForCustomEditMode:13 slot:0];
    objc_msgSend(v14, "setStyle:", objc_msgSend(v15, "style"));
    id v16 = [(NTKZeusAnalogFaceView *)self palette];
    id v17 = [v16 pigmentEditOption];
    id v18 = [v17 identifier];
    CGAffineTransform v22 = v15;
    if ([v18 isEqual:ntk_zeus_blanc])
    {
      unsigned int v19 = [(NTKZeusAnalogFaceView *)self editing];

      if (v19)
      {
        CGAffineTransform v20 = [(NTKZeusAnalogFaceView *)self palette];
        [v14 blancEditModeApplyPalette:v20];
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
    }
    CGAffineTransform v20 = [(NTKZeusAnalogFaceView *)self palette];
    [v14 applyPalette:v20];
    goto LABEL_13;
  }
  double v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  BOOL v6 = a4 == 13 || a4 == 11;
  if ([a3 isEqualToString:NTKComplicationSlotTop] && a4 == 1) {
    return 1;
  }
  return v6;
}

- (void)_updateDateComplicationPositionIfNecessary
{
  [(NTKZeusAnalogFaceView *)self _loadLayoutRules];
  id v3 = [(NTKZeusAnalogFaceView *)self delegate];
  [v3 faceViewWantsComplicationKeylineFramesReloaded];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

+ (id)_supportedComplicationSlots
{
  v4[0] = NTKComplicationSlotBottom;
  v4[1] = NTKComplicationSlotTop;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (CGRect)_frameForComplicationDisplayWrapper:(id)a3 inSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:NTKComplicationSlotTop]
    && (p_upperComplicationOverrideFrame = &self->_upperComplicationOverrideFrame,
        !CGRectIsNull(self->_upperComplicationOverrideFrame))
    || [v7 isEqualToString:NTKComplicationSlotBottom]
    && (p_upperComplicationOverrideFrame = &self->_lowerComplicationOverrideFrame,
        !CGRectIsNull(self->_lowerComplicationOverrideFrame)))
  {
    CGFloat x = p_upperComplicationOverrideFrame->origin.x;
    CGFloat y = p_upperComplicationOverrideFrame->origin.y;
    CGFloat width = p_upperComplicationOverrideFrame->size.width;
    CGFloat height = p_upperComplicationOverrideFrame->size.height;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)NTKZeusAnalogFaceView;
    [(NTKZeusAnalogFaceView *)&v21 _frameForComplicationDisplayWrapper:v6 inSlot:v7];
    CGFloat x = v9;
    CGFloat y = v11;
    CGFloat width = v13;
    CGFloat height = v15;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v65.receiver = self;
  v65.super_class = (Class)NTKZeusAnalogFaceView;
  [(NTKZeusAnalogFaceView *)&v65 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  double v9 = [(NTKZeusAnalogFaceView *)self timeView];
  switch(a4)
  {
    case 10:
      double v15 = [(NTKZeusAnalogFaceView *)self palette];
      [(NTKZeusAnalogFaceView *)self _applyPaletteToNumerals:v15];

      logoUpperView = self->_logoUpperView;
      double v17 = [(NTKZeusAnalogFaceView *)self palette];
      double v18 = [v17 bottomComplication];
      [(UIImageView *)logoUpperView setTintColor:v18];

      logoLowerView = self->_logoLowerView;
      double v20 = [(NTKZeusAnalogFaceView *)self palette];
      objc_super v21 = [v20 bottomComplication];
      [(UIImageView *)logoLowerView setTintColor:v21];

      CGAffineTransform v22 = [(NTKZeusAnalogFaceView *)self palette];
      -[NTKZeusAnalogFaceView _setStatusBarIconShadowNeeded:](self, "_setStatusBarIconShadowNeeded:", [v22 wantsStatusBarIconShadow]);

      backgroundView = self->_backgroundView;
      v24 = [(NTKZeusAnalogFaceView *)self palette];
      [(NTKZeusAnalogBackgroundView *)backgroundView applyPalette:v24];

      v25 = [v9 secondHandView];
      v26 = [(NTKZeusAnalogFaceView *)self palette];
      v27 = [v26 secondHand];
      [v25 setColor:v27];

      densitCGFloat y = self->_density;
      double v29 = [v9 secondHandView];
      [(NTKZeusAnalogFaceView *)self _secondHandAlphaForDensity:density isEditing:0];
      double v31 = v30;
      v32 = [(NTKZeusAnalogFaceView *)self palette];
      v33 = [v32 secondHandAlpha];
      [v33 floatValue];
      [v29 setAlpha:v31 * v34];

      v35 = [v9 hourHandView];
      double v36 = [(NTKZeusAnalogFaceView *)self palette];
      double v37 = [v36 hourHand];
      [v35 setColor:v37];

      double v38 = [v9 minuteHandView];
      v39 = [(NTKZeusAnalogFaceView *)self palette];
      id v40 = [v39 minuteHand];
      [v38 setColor:v40];

      double v41 = [(NTKZeusAnalogFaceView *)self palette];
      double v42 = [v41 handInlay];
      [v9 setInlayColor:v42];

      if (self->_isHandsVisibleInColorEditing
        && [(NTKZeusAnalogFaceView *)self fromEditMode] == (char *)&dword_8 + 2)
      {
        [v9 setAlpha:1.0];
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      double v43 = +[NTKZeusAnalogFaceView _supportedComplicationSlots];
      id v44 = [v43 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v62;
        do
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(void *)v62 != v46) {
              objc_enumerationMutation(v43);
            }
            double v48 = [(NTKZeusAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:*(void *)(*((void *)&v61 + 1) + 8 * i)];
            v49 = [v48 display];
            v50 = [(NTKZeusAnalogFaceView *)self palette];
            [v49 applyPalette:v50];
          }
          id v45 = [v43 countByEnumeratingWithState:&v61 objects:v66 count:16];
        }
        while (v45);
      }

      break;
    case 11:
      self->_densitCGFloat y = (unint64_t)[v8 density];
      v51 = [v9 secondHandView];
      [(NTKZeusAnalogFaceView *)self _secondHandAlphaForDensity:self->_density isEditing:self->_isEditing];
      double v53 = v52;
      long long v54 = [(NTKZeusAnalogFaceView *)self palette];
      long long v55 = [v54 secondHandAlpha];
      [v55 floatValue];
      [v51 setAlpha:v53 * v56];

      unint64_t v57 = self->_density;
      double v58 = [(NTKZeusAnalogFaceView *)self palette];
      [v58 setDensity:v57];

      objc_super v59 = [(NTKZeusAnalogFaceView *)self palette];
      CGRect v60 = [v59 handInlay];
      [v9 setInlayColor:v60];

      [(NTKZeusAnalogNumeralsView *)self->_numeralsView setDensity:self->_density];
      break;
    case 13:
      id v10 = [v8 style];
      self->_style = (unint64_t)v10;
      double v11 = [(NTKZeusAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBottom];
      double v12 = [v11 display];
      [v12 setStyle:v10];

      CGPoint origin = CGRectNull.origin;
      CGSize size = CGRectNull.size;
      self->_upperComplicationOverrideFrame.CGPoint origin = CGRectNull.origin;
      self->_upperComplicationOverrideFrame.CGSize size = size;
      self->_lowerComplicationOverrideFrame.CGPoint origin = origin;
      self->_lowerComplicationOverrideFrame.CGSize size = size;
      [(NTKZeusAnalogFaceView *)self invalidateComplicationLayout];
      [(NTKZeusAnalogNumeralsView *)self->_numeralsView setStyle:self->_style];
      break;
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusAnalogFaceView;
  -[NTKZeusAnalogFaceView _configureForEditMode:](&v13, "_configureForEditMode:");
  self->_isEditing = a3 != 0;
  if (!a3)
  {
    densitCGFloat y = self->_density;
    id v6 = [(NTKZeusAnalogFaceView *)self timeView];
    id v7 = [v6 secondHandView];
    [(NTKZeusAnalogFaceView *)self _secondHandAlphaForDensity:density isEditing:self->_isEditing];
    double v9 = v8;
    id v10 = [(NTKZeusAnalogFaceView *)self palette];
    double v11 = [v10 secondHandAlpha];
    [v11 floatValue];
    [v7 setAlpha:v9 * v12];
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v52.receiver = self;
  v52.super_class = (Class)NTKZeusAnalogFaceView;
  -[NTKZeusAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v52, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  densitCGFloat y = self->_density;
  [(NTKZeusAnalogFaceView *)self _secondHandAlphaForDensity:density isEditing:a4 != 0];
  [(NTKZeusAnalogFaceView *)self _secondHandAlphaForDensity:density isEditing:a5 != 0];
  [(NTKZeusAnalogFaceView *)self _handAlphaForEditing:a4 != 0];
  [(NTKZeusAnalogFaceView *)self _handAlphaForEditing:a5 != 0];
  [(NTKZeusAnalogFaceView *)self _handAlphaForEditing:a4 != 0];
  [(NTKZeusAnalogFaceView *)self _handAlphaForEditing:a5 != 0];
  id v10 = [(NTKZeusAnalogFaceView *)self palette];
  [v10 isNoir];

  double v11 = [(NTKZeusAnalogFaceView *)self timeView];
  [(NTKZeusAnalogFaceView *)self _secondHandAlphaForDensity:density isEditing:0];
  double v13 = v12;
  id v14 = [v11 secondHandView];
  CLKInterpolateBetweenFloatsClipped();
  double v16 = v13 * v15;
  double v17 = [(NTKZeusAnalogFaceView *)self palette];
  double v18 = [v17 secondHandAlpha];
  [v18 floatValue];
  [v14 setAlpha:v16 * v19];

  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v11, "setAlpha:");
  numeralsView = self->_numeralsView;
  CLKInterpolateBetweenFloatsClipped();
  -[NTKZeusAnalogNumeralsView setAlpha:](numeralsView, "setAlpha:");
  objc_super v21 = [(NTKZeusAnalogFaceView *)self palette];
  CGAffineTransform v22 = [v21 pigmentEditOption];
  CGAffineTransform v23 = [v22 identifier];
  unsigned int v24 = [v23 isEqual:ntk_zeus_blanc];

  if (v24)
  {
    v25 = self->_numeralsView;
    v26 = [(NTKZeusAnalogFaceView *)self _blancNumeralsColorForEditMode:a4];
    v27 = [(NTKZeusAnalogFaceView *)self _blancNumeralsColorForEditMode:a5];
    double v28 = NTKInterpolateBetweenColors();
    [(NTKZeusAnalogNumeralsView *)v25 setTintColor:v28];

    logoUpperView = self->_logoUpperView;
    double v30 = [(NTKZeusAnalogFaceView *)self _blancNumeralsColorForEditMode:a4];
    double v31 = [(NTKZeusAnalogFaceView *)self _blancNumeralsColorForEditMode:a5];
    v32 = NTKInterpolateBetweenColors();
    [(UIImageView *)logoUpperView setTintColor:v32];

    logoLowerView = self->_logoLowerView;
    float v34 = [(NTKZeusAnalogFaceView *)self _blancNumeralsColorForEditMode:a4];
    v35 = [(NTKZeusAnalogFaceView *)self _blancNumeralsColorForEditMode:a5];
    double v36 = NTKInterpolateBetweenColors();
    [(UIImageView *)logoLowerView setTintColor:v36];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    double v37 = +[NTKZeusAnalogFaceView _supportedComplicationSlots];
    id v38 = [v37 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v49;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(v37);
          }
          double v42 = [(NTKZeusAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          double v43 = [v42 display];

          [v43 applyTransitionFraction:a4 fromMode:a5 toMode:a3];
        }
        id v39 = [v37 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v39);
    }
  }
  id v44 = [(NTKZeusAnalogFaceView *)self contentView];
  [(NTKZeusAnalogFaceView *)self _numbersAlphaForEditMode:a4];
  [(NTKZeusAnalogFaceView *)self _numbersAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v44, "setAlpha:");

  backgroundView = self->_backgroundView;
  [(NTKZeusAnalogFaceView *)self _backgroundAlphaForEditMode:a4];
  [(NTKZeusAnalogFaceView *)self _backgroundAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKZeusAnalogBackgroundView setAlpha:](backgroundView, "setAlpha:");
  if (a3 > 0.5)
  {
    CGPoint origin = CGRectNull.origin;
    CGSize size = CGRectNull.size;
    self->_upperComplicationOverrideFrame.CGPoint origin = CGRectNull.origin;
    self->_upperComplicationOverrideFrame.CGSize size = size;
    self->_lowerComplicationOverrideFrame.CGPoint origin = origin;
    self->_lowerComplicationOverrideFrame.CGSize size = size;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v118.receiver = self;
  v118.super_class = (Class)NTKZeusAnalogFaceView;
  [(NTKZeusAnalogFaceView *)&v118 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  switch(a6)
  {
    case 10:
      v25 = [(NTKZeusAnalogFaceView *)self palette];
      id v26 = [v25 copy];

      id v109 = v12;
      v27 = [v12 pigmentEditOption];
      [v26 setPigmentEditOption:v27];

      double v28 = [(NTKZeusAnalogFaceView *)self palette];
      id v29 = [v28 copy];

      id v108 = v13;
      double v30 = [v13 pigmentEditOption];
      [v29 setPigmentEditOption:v30];

      -[NTKZeusAnalogFaceView _setStatusBarIconShadowNeeded:](self, "_setStatusBarIconShadowNeeded:", [v29 wantsStatusBarIconShadow] | objc_msgSend(v26, "wantsStatusBarIconShadow"));
      [(NTKZeusAnalogBackgroundView *)self->_backgroundView applyTransitionFraction:v26 fromPalette:v29 toPalette:a3];
      [(NTKZeusAnalogFaceView *)self _numeralsPaletteTransitionFraction:v26 fromPalette:v29 toPalette:a3];
      logoUpperView = self->_logoUpperView;
      v32 = [v26 bottomComplication];
      v33 = [v29 bottomComplication];
      float v34 = NTKInterpolateBetweenColors();
      [(UIImageView *)logoUpperView setTintColor:v34];

      logoLowerView = self->_logoLowerView;
      double v36 = [v26 bottomComplication];
      double v37 = [v29 bottomComplication];
      id v38 = NTKInterpolateBetweenColors();
      [(UIImageView *)logoLowerView setTintColor:v38];

      [v26 isNoir];
      [v29 isNoir];
      double v39 = NTKEditModeDimmedAlpha;
      CLKInterpolateBetweenFloatsClipped();
      if (v39 <= v40) {
        double v40 = pow((v40 - v39) / 0.8, 3.0) * 0.8 + 0.2;
      }
      [(NTKZeusAnalogNumeralsView *)self->_numeralsView setAlpha:v40];
      double v41 = [(NTKZeusAnalogFaceView *)self timeView];
      double v42 = [v41 secondHandView];
      double v43 = [v26 secondHand];
      id v44 = [v29 secondHand];
      id v45 = NTKInterpolateBetweenColors();
      [v42 setColor:v45];

      [(NTKZeusAnalogFaceView *)self _secondHandAlphaForDensity:self->_density isEditing:0];
      double v47 = v46;
      long long v48 = [v41 secondHandView];
      long long v49 = [v26 secondHandAlpha];
      [v49 floatValue];
      long long v50 = [v29 secondHandAlpha];
      [v50 floatValue];
      CLKInterpolateBetweenFloatsClipped();
      [v48 setAlpha:v47 * v51];

      objc_super v52 = [v41 hourHandView];
      double v53 = [v26 hourHand];
      long long v54 = [v29 hourHand];
      long long v55 = NTKInterpolateBetweenColors();
      [v52 setColor:v55];

      float v56 = [v41 minuteHandView];
      unint64_t v57 = [v26 minuteHand];
      double v58 = [v29 minuteHand];
      objc_super v59 = NTKInterpolateBetweenColors();
      [v56 setColor:v59];

      CGRect v60 = [v26 handInlay];
      long long v61 = [v29 handInlay];
      long long v62 = NTKInterpolateBetweenColors();

      v107 = v41;
      [v41 setInlayColor:v62];
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v63 = +[NTKZeusAnalogFaceView _supportedComplicationSlots];
      id v64 = [v63 countByEnumeratingWithState:&v110 objects:v119 count:16];
      if (v64)
      {
        id v65 = v64;
        uint64_t v66 = *(void *)v111;
        do
        {
          for (i = 0; i != v65; i = (char *)i + 1)
          {
            if (*(void *)v111 != v66) {
              objc_enumerationMutation(v63);
            }
            v68 = [(NTKZeusAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:*(void *)(*((void *)&v110 + 1) + 8 * i)];
            v69 = [v68 display];

            [v69 applyTransitionFraction:v26 fromPalette:v29 toPalette:a3];
          }
          id v65 = [v63 countByEnumeratingWithState:&v110 objects:v119 count:16];
        }
        while (v65);
      }

      id v13 = v108;
      id v12 = v109;
      break;
    case 11:
      id v70 = [v12 density];
      id v71 = [v13 density];
      if (a3 >= 0.5)
      {
        CGFloat v75 = (1.0 - (a3 * 2.0 + -1.0)) * -0.1 + 1.0;
        -[NTKZeusAnalogNumeralsView setAlpha:](self->_numeralsView, "setAlpha:");
        numeralsView = self->_numeralsView;
        CGAffineTransformMakeScale(&v114, v75, v75);
        [(NTKZeusAnalogNumeralsView *)numeralsView setTransform:&v114];
        v73 = self->_numeralsView;
        id v74 = v71;
      }
      else
      {
        [(NTKZeusAnalogNumeralsView *)self->_numeralsView setAlpha:1.0 - (a3 + a3)];
        v72 = self->_numeralsView;
        CGAffineTransformMakeScale(&v115, (a3 + a3) * -0.1 + 1.0, (a3 + a3) * -0.1 + 1.0);
        [(NTKZeusAnalogNumeralsView *)v72 setTransform:&v115];
        v73 = self->_numeralsView;
        id v74 = v70;
      }
      [(NTKZeusAnalogNumeralsView *)v73 setDensity:v74];
      v77 = [(NTKZeusAnalogFaceView *)self palette];
      v78 = [v77 pigmentEditOption];
      v79 = [v78 identifier];
      unsigned int v80 = [v79 isEqual:ntk_zeus_blanc];

      if (v80)
      {
        v81 = self->_numeralsView;
        v82 = [(NTKZeusAnalogFaceView *)self palette];
        v83 = [v82 editMode];
        [(NTKZeusAnalogNumeralsView *)v81 setTintColor:v83];
      }
      v84 = [(NTKZeusAnalogFaceView *)self timeView];
      v85 = [(NTKZeusAnalogFaceView *)self palette];
      v86 = [v85 handInlayForDensity:v70];
      v87 = [(NTKZeusAnalogFaceView *)self palette];
      v88 = [v87 handInlayForDensity:v71];
      v89 = NTKInterpolateBetweenColors();

      [v84 setInlayColor:v89];
      break;
    case 13:
      id v14 = [v12 style];
      id v15 = [v13 style];
      if (a3 >= 0.5)
      {
        CGFloat v90 = (1.0 - (a3 * 2.0 + -1.0)) * -0.1 + 1.0;
        -[NTKZeusAnalogNumeralsView setAlpha:](self->_numeralsView, "setAlpha:");
        v91 = self->_numeralsView;
        CGAffineTransformMakeScale(&v116, v90, v90);
        [(NTKZeusAnalogNumeralsView *)v91 setTransform:&v116];
        [(NTKZeusAnalogNumeralsView *)self->_numeralsView setStyle:v15];
        v92 = [(NTKZeusAnalogFaceView *)self palette];
        v93 = [v92 pigmentEditOption];
        v94 = [v93 identifier];
        unsigned int v95 = [v94 isEqual:ntk_zeus_blanc];

        id v21 = v15;
        if (v95)
        {
          v96 = self->_numeralsView;
          CGAffineTransform v23 = [(NTKZeusAnalogFaceView *)self palette];
          unsigned int v24 = [v23 editMode];
          [(NTKZeusAnalogNumeralsView *)v96 setTintColor:v24];
          id v21 = v15;
          goto LABEL_25;
        }
      }
      else
      {
        [(NTKZeusAnalogNumeralsView *)self->_numeralsView setAlpha:1.0 - (a3 + a3)];
        double v16 = self->_numeralsView;
        CGAffineTransformMakeScale(&v117, (a3 + a3) * -0.1 + 1.0, (a3 + a3) * -0.1 + 1.0);
        [(NTKZeusAnalogNumeralsView *)v16 setTransform:&v117];
        [(NTKZeusAnalogNumeralsView *)self->_numeralsView setStyle:v14];
        double v17 = [(NTKZeusAnalogFaceView *)self palette];
        double v18 = [v17 pigmentEditOption];
        float v19 = [v18 identifier];
        unsigned int v20 = [v19 isEqual:ntk_zeus_blanc];

        id v21 = v14;
        if (v20)
        {
          CGAffineTransform v22 = self->_numeralsView;
          CGAffineTransform v23 = [(NTKZeusAnalogFaceView *)self palette];
          unsigned int v24 = [v23 editMode];
          [(NTKZeusAnalogNumeralsView *)v22 setTintColor:v24];
          id v21 = v14;
LABEL_25:
        }
      }
      v97 = [(NTKZeusAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBottom];
      v98 = [v97 display];
      [v98 setStyle:v21];

      [(NTKZeusAnalogFaceView *)self _upperComplicationFrameForStyle:v14];
      [(NTKZeusAnalogFaceView *)self _upperComplicationFrameForStyle:v15];
      CLKInterpolateBetweenRects();
      self->_upperComplicationOverrideFrame.origin.CGFloat x = v99;
      self->_upperComplicationOverrideFrame.origin.CGFloat y = v100;
      self->_upperComplicationOverrideFrame.size.CGFloat width = v101;
      self->_upperComplicationOverrideFrame.size.CGFloat height = v102;
      -[NTKZeusAnalogFaceView _lowerComplicationFrameForStyle:](self, "_lowerComplicationFrameForStyle:", v14, *(void *)&a3);
      [(NTKZeusAnalogFaceView *)self _lowerComplicationFrameForStyle:v15];
      CLKInterpolateBetweenRects();
      self->_lowerComplicationOverrideFrame.origin.CGFloat x = v103;
      self->_lowerComplicationOverrideFrame.origin.CGFloat y = v104;
      self->_lowerComplicationOverrideFrame.size.CGFloat width = v105;
      self->_lowerComplicationOverrideFrame.size.CGFloat height = v106;
      [(NTKZeusAnalogFaceView *)self layoutComplicationViews];
      break;
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKZeusAnalogFaceView;
  -[NTKZeusAnalogFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v14, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 13 || a4 == 11)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v13, 0, sizeof(v13));
    CGAffineTransformMakeScale(&v13, v7, v7);
    double v8 = [(NTKZeusAnalogFaceView *)self contentView];
    CGAffineTransform v12 = v13;
    [v8 setTransform:&v12];

    cornerView = self->_cornerView;
    CGAffineTransform v12 = v13;
    [(UIView *)cornerView setTransform:&v12];
  }
  if (self->_isHandsVisibleInColorEditing
    && [(NTKZeusAnalogFaceView *)self fromEditMode] == (char *)&dword_8 + 2)
  {
    id v10 = [(NTKZeusAnalogFaceView *)self palette];
    unsigned __int8 v11 = [v10 isNoir];

    if ((v11 & 1) == 0) {
      [(NTKZeusAnalogNumeralsView *)self->_numeralsView setAlpha:NTKEditModeDimmedAlpha];
    }
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKZeusAnalogFaceView;
  -[NTKZeusAnalogFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v16, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 != 1)
  {
    NTKScaleForRubberBandingFraction();
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformMakeScale(&v15, v7, v7);
    NTKAlphaForRubberBandingFraction();
    double v9 = v8;
    id v10 = [(NTKZeusAnalogFaceView *)self contentView];
    [v10 setAlpha:v9];

    unsigned __int8 v11 = [(NTKZeusAnalogFaceView *)self contentView];
    CGAffineTransform v14 = v15;
    [v11 setTransform:&v14];

    cornerView = self->_cornerView;
    CGAffineTransform v14 = v15;
    [(UIView *)cornerView setTransform:&v14];
    if (a4 == 10 && self->_isHandsVisibleInColorEditing)
    {
      CGAffineTransform v13 = [(NTKZeusAnalogFaceView *)self timeView];
      CGAffineTransform v14 = v15;
      [v13 setTransform:&v14];
      [v13 setAlpha:v9];
    }
  }
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (double)_secondHandAlphaForDensity:(unint64_t)a3 isEditing:(BOOL)a4
{
  double result = 0.0;
  if (a3 == 3) {
    return 1.0;
  }
  return result;
}

- (double)_handAlphaForEditing:(BOOL)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (double)_numbersAlphaForEditMode:(int64_t)a3
{
  double result = 0.95;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (id)_blancNumeralsColorForEditMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 0xD && ((1 << a3) & 0x2802) != 0)
  {
    double v4 = [(NTKZeusAnalogFaceView *)self palette];
    double v5 = [v4 editMode];
  }
  else
  {
    double v4 = [(NTKZeusAnalogFaceView *)self palette];
    double v5 = [v4 dial];
  }
  id v6 = v5;
  id v7 = v5;
  if ((unint64_t)a3 > 0xD || ((1 << a3) & 0x2802) == 0)
  {

LABEL_11:
    return v7;
  }

  if (((1 << a3) & 0x2802) != 0) {
    goto LABEL_11;
  }
  return v7;
}

- (id)complicationColorForBlancEditMode:(int64_t)a3
{
  double v4 = [(NTKZeusAnalogFaceView *)self palette];
  double v5 = v4;
  if (a3 == 1) {
    [v4 editMode];
  }
  else {
  id v6 = [v4 bottomComplication];
  }

  return v6;
}

- (double)_backgroundAlphaForEditMode:(int64_t)a3
{
  BOOL v4 = a3 == 11 || a3 == 13 || a3 == 1;
  double result = NTKEditModeDimmedAlpha;
  if (!v4) {
    return 1.0;
  }
  return result;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  BOOL v4 = &off_3FAB0;
  if (a3 != 13) {
    BOOL v4 = 0;
  }
  if (a3 == 11) {
    return &off_3FA98;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!qword_4CC00)
  {
    uint64_t v10 = objc_opt_new();
    unsigned __int8 v11 = (void *)qword_4CC00;
    qword_4CC00 = v10;
  }
  CGAffineTransform v12 = [v9 objectForKeyedSubscript:&off_3F230];
  CGAffineTransform v13 = [(NTKZeusAnalogFaceView *)self palette];
  CGAffineTransform v14 = [(NTKZeusAnalogFaceView *)self palette];
  CGAffineTransform v15 = [v12 pigmentEditOption];
  [v14 setPigmentEditOption:v15];

  if (a4 == 13)
  {
    id v39 = v8;
    double v40 = [v13 configuration];
    double v41 = [v40 uniqueId];
    double v42 = +[NSString stringWithFormat:@"%@-%@", v39, v41];

    id v21 = [(id)qword_4CC00 objectForKey:v42];
    if (!v21)
    {
      id v21 = objc_msgSend(v13, "typefaceSwatchImageForStyle:", objc_msgSend(v39, "style"));
      [(id)qword_4CC00 setObject:v21 forKey:v42];
    }
  }
  else if (a4 == 11)
  {
    id v44 = v8;
    id v16 = v8;
    double v17 = [v9 objectForKeyedSubscript:&off_3F218];
    double v18 = [v13 configuration];
    float v19 = [v18 uniqueId];
    unsigned int v20 = +[NSString stringWithFormat:@"%@-%@-%@", v16, v17, v19];

    id v21 = [(id)qword_4CC00 objectForKey:v20];
    if (!v21)
    {
      CGAffineTransform v22 = [NTKZeusAnalogFaceView alloc];
      CGAffineTransform v23 = [(NTKZeusAnalogFaceView *)self device];
      unsigned int v24 = [(NTKZeusAnalogFaceView *)v22 initWithFaceStyle:14 forDevice:v23 clientIdentifier:0];

      v25 = [(NTKZeusAnalogFaceView *)self device];
      [v25 screenBounds];
      -[NTKZeusAnalogFaceView setFrame:](v24, "setFrame:");

      [(NTKZeusAnalogFaceView *)v24 _loadSnapshotContentViews];
      [(NTKZeusAnalogFaceView *)v24 setOption:v16 forCustomEditMode:11 slot:0];
      [(NTKZeusAnalogFaceView *)v24 setOption:v17 forCustomEditMode:13 slot:0];
      [(NTKZeusAnalogFaceView *)v24 setOption:v12 forCustomEditMode:10 slot:0];
      id v26 = NTKIdealizedDate();
      [(NTKZeusAnalogFaceView *)v24 setOverrideDate:v26 duration:0.0];

      v27 = +[NTKZeusComplicationView viewForComplicationType:11];
      [v27 applyPalette:v13];
      [v27 setPhaseNumber:90 hemisphere:0];
      [(NTKZeusAnalogFaceView *)v24 addSubview:v27];
      double v28 = [(NTKZeusAnalogFaceView *)self device];
      sub_F7E8(v28, (uint64_t)v49);
      double v29 = v50;

      [(NTKZeusAnalogFaceView *)self bounds];
      double v31 = v30 * 0.5;
      [(NTKZeusAnalogFaceView *)self bounds];
      objc_msgSend(v27, "setCenter:", v31, v29 + v32 * 0.5);
      id v33 = objc_alloc((Class)UIGraphicsImageRenderer);
      [(NTKZeusAnalogFaceView *)v24 bounds];
      id v36 = objc_msgSend(v33, "initWithSize:", v34, v35);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_125A4;
      v46[3] = &unk_3CE70;
      double v47 = v24;
      id v48 = v27;
      id v37 = v27;
      id v38 = v24;
      id v21 = [v36 imageWithActions:v46];
      [(id)qword_4CC00 setObject:v21 forKey:v20];
    }
    id v8 = v44;
  }
  else
  {
    v45.receiver = self;
    v45.super_class = (Class)NTKZeusAnalogFaceView;
    id v21 = [(NTKZeusAnalogFaceView *)&v45 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v21;
}

- (double)_verticalPaddingForStatusBar
{
  v2 = [(NTKZeusAnalogFaceView *)self device];
  CLKValueForDeviceMetrics();
  double v4 = v3;

  return v4;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_isStatusBarIconShadowNeeded;
}

- (void)_setStatusBarIconShadowNeeded:(BOOL)a3
{
  if (self->_isStatusBarIconShadowNeeded != a3)
  {
    self->_isStatusBarIconShadowNeeded = a3;
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_12764;
    v3[3] = &unk_3CC78;
    objc_copyWeak(&v4, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)nominalAnimationStart:(id)a3 forHandView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NTKZeusAnalogFaceView *)self timeView];
  id v8 = [v7 minuteHandView];

  if (v8 == v6)
  {
    backgroundView = self->_backgroundView;
    [v6 zRotation];
    -[NTKZeusAnalogBackgroundView applyRotation:](backgroundView, "applyRotation:");
    [(NTKZeusAnalogBackgroundView *)self->_backgroundView applyAnimation:v10];
  }
}

- (void)nominalAnimationEndForHandView:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKZeusAnalogFaceView *)self timeView];
  id v6 = [v5 minuteHandView];

  if (v6 == v4)
  {
    backgroundView = self->_backgroundView;
    [(NTKZeusAnalogBackgroundView *)backgroundView cancelAnimation];
  }
}

- (void)overrideZRotation:(double)a3 forHandView:(id)a4
{
  id v6 = a4;
  id v7 = [(NTKZeusAnalogFaceView *)self timeView];
  id v8 = [v7 minuteHandView];

  if (v8 == v6)
  {
    backgroundView = self->_backgroundView;
    [(NTKZeusAnalogBackgroundView *)backgroundView applyRotation:a3];
  }
}

- (void)overrideAnimationApplier:(double)a3 zRotation:(double)a4 forHandView:(id)a5
{
  id v7 = a5;
  id v8 = [(NTKZeusAnalogFaceView *)self timeView];
  id v9 = [v8 minuteHandView];

  if (v9 == v7)
  {
    backgroundView = self->_backgroundView;
    [(NTKZeusAnalogBackgroundView *)backgroundView applyRotation:a4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_logoLowerView, 0);
  objc_storeStrong((id *)&self->_logoUpperView, 0);
  objc_storeStrong((id *)&self->_numeralsTransitionView, 0);
  objc_storeStrong((id *)&self->_numeralsView, 0);

  objc_storeStrong((id *)&self->_cornerView, 0);
}

@end