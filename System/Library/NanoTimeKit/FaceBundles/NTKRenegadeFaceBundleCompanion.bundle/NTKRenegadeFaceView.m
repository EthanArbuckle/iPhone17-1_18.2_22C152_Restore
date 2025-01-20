@interface NTKRenegadeFaceView
- (BOOL)_areComplicationsEnabled;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_usesSimplifiedZoom;
- (CGRect)_dateComplicationFrame;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKRenegadeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationsAlphaForEditMode:(int64_t)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (id)_bottomComplicationFont;
- (id)_dateComplicationFont;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_snapshotConfiguration;
- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4;
- (unint64_t)textLayoutStyleForSlot:(int64_t)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyComplicationStyleToView:(id)a3 forComplication:(id)a4 slot:(id)a5;
- (void)_applyComplicationStyleToView:(id)a3 forSlot:(id)a4;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPaletteFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4;
- (void)_cleanupAfterZoom;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForSnapshotting;
- (void)_removeViews;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationsEnabled;
- (void)layoutSubviews;
@end

@implementation NTKRenegadeFaceView

- (NTKRenegadeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKRenegadeFaceView;
  v9 = [(NTKRenegadeFaceView *)&v16 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    uint64_t v10 = +[NTKRenegadeColorPalette paletteForColor:0 flipped:0];
    palette = v9->_palette;
    v9->_palette = (NTKRenegadeColorPalette *)v10;

    id v12 = [objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    [v12 setDelegate:v9];
    [v12 setFaceView:v9];
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = (NTKUtilityComplicationFactory *)v12;
    id v14 = v12;

    [(NTKRenegadeFaceView *)v9 setComplicationFactory:v14];
  }

  return v9;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKRenegadeFaceView *)self _setupViews];
  [(NTKRenegadeFaceView *)self _updateComplicationsEnabled];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKRenegadeFaceView *)self _removeViews];
}

- (void)_setupViews
{
  quiltTimeView = self->_quiltTimeView;
  if (quiltTimeView) {
    [(NTKRenegadeTimeView *)quiltTimeView removeFromSuperview];
  }
  v4 = [NTKRenegadeTimeView alloc];
  v5 = [(NTKRenegadeFaceView *)self device];
  v6 = [(NTKRenegadeTimeView *)v4 initWithDevice:v5];

  v7 = [(NTKRenegadeFaceView *)self _snapshotConfiguration];
  [(NTKRenegadeTimeView *)v6 setConfiguration:v7];

  -[NTKRenegadeTimeView setComplicationsEdgeInsets:](v6, "setComplicationsEdgeInsets:", self->_complicationsEdgeInsets.top, self->_complicationsEdgeInsets.left, self->_complicationsEdgeInsets.bottom, self->_complicationsEdgeInsets.right);
  [(NTKRenegadeTimeView *)v6 setPalette:self->_palette];
  [(NTKRenegadeTimeView *)v6 setNeedsLayout];
  [(NTKRenegadeTimeView *)v6 layoutIfNeeded];
  id v23 = [(NTKRenegadeFaceView *)self contentView];
  [v23 addSubview:v6];
  [(NTKRenegadeFaceView *)self setTimeView:v6];
  id v8 = self->_quiltTimeView;
  self->_quiltTimeView = v6;
  v9 = v6;

  id v10 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  v11 = [(NTKRenegadeFaceView *)self device];
  [v11 screenBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(NTKRenegadeFaceView *)self device];
  v21 = (NTKRoundedCornerOverlayView *)objc_msgSend(v10, "initWithFrame:forDeviceCornerRadius:", v20, v13, v15, v17, v19);
  cornerOverlay = self->_cornerOverlay;
  self->_cornerOverlay = v21;

  [(NTKRenegadeFaceView *)self addSubview:self->_cornerOverlay];
  [(NTKRenegadeFaceView *)self bringSubviewToFront:self->_cornerOverlay];
}

- (void)_removeViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v4 _unloadSnapshotContentViews];
  [(NTKRenegadeTimeView *)self->_quiltTimeView removeFromSuperview];
  quiltTimeView = self->_quiltTimeView;
  self->_quiltTimeView = 0;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v12 layoutSubviews];
  objc_super v3 = [(NTKRenegadeFaceView *)self device];
  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[NTKRenegadeTimeView ntk_setBoundsAndPositionFromFrame:](self->_quiltTimeView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
}

- (id)_dateComplicationFont
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  v2 = [(NTKRenegadeFaceView *)self device];
  sub_508C(v2, (uint64_t)v5);

  double v3 = *(double *)v5;

  return +[CLKFont systemFontOfSize:v3 weight:UIFontWeightBold];
}

- (id)_bottomComplicationFont
{
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  v2 = [(NTKRenegadeFaceView *)self device];
  sub_508C(v2, (uint64_t)v6);

  double v3 = +[CLKFont systemFontOfSize:*((double *)v6 + 1) weight:UIFontWeightSemibold];
  double v4 = [v3 CLKFontWithAlternativePunctuation];

  return v4;
}

- (CGRect)_dateComplicationFrame
{
  double v3 = [(NTKRenegadeFaceView *)self device];
  sub_508C(v3, (uint64_t)&v21);

  double v4 = [(NTKRenegadeFaceView *)self _dateComplicationFont];
  [v4 ascender];
  [v4 descender];
  double v5 = [(NTKRenegadeFaceView *)self device];
  CLKRoundForDevice();
  double v7 = v6;

  double v8 = [(NTKRenegadeFaceView *)self device];
  CLKRoundForDevice();
  double v10 = v9;

  double v11 = [(NTKRenegadeFaceView *)self device];
  CLKRoundForDevice();
  double v13 = v12;

  [(NTKRenegadeFaceView *)self bounds];
  double v14 = [(NTKRenegadeFaceView *)self device];
  CLKRoundForDevice();
  double v16 = v15;

  double v17 = v16;
  double v18 = v13;
  double v19 = v10;
  double v20 = v7;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v14 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 10)
  {
    id v9 = [v8 color];
    double v10 = +[NTKRenegadeColorPalette paletteForColor:v9 flipped:0];
    self->_color = (unint64_t)v9;
    palette = self->_palette;
    self->_palette = v10;
    double v12 = v10;

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_54C8;
    v13[3] = &unk_10550;
    v13[4] = self;
    [(NTKRenegadeFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v13];
    [(NTKRenegadeTimeView *)self->_quiltTimeView setPalette:v12];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v16 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  if (a6 == 10)
  {
    objc_super v14 = +[NTKRenegadeColorPalette paletteForColor:flipped:](NTKRenegadeColorPalette, "paletteForColor:flipped:", [v12 color], 0);
    double v15 = +[NTKRenegadeColorPalette paletteForColor:flipped:](NTKRenegadeColorPalette, "paletteForColor:flipped:", [v13 color], 0);
    [(NTKRenegadeFaceView *)self _applyPaletteFraction:v14 fromPalette:v15 toPalette:a3];
  }
}

- (void)_applyPaletteFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(NTKRenegadeTimeView *)self->_quiltTimeView applyTransitionFraction:v8 fromPalette:v9 toPalette:a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5730;
  v12[3] = &unk_10578;
  id v13 = v8;
  id v14 = v9;
  double v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(NTKRenegadeFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v12];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKRenegadeFaceView;
  -[NTKRenegadeFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v11, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v9, v7, v7);
    CGAffineTransformTranslate(&v10, &v9, 0.0, 1.0);
    CGAffineTransform v8 = v10;
    [(NTKRenegadeFaceView *)self setTransform:&v8];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKRenegadeFaceView;
  -[NTKRenegadeFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v9, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKScaleForRubberBandingFraction();
    CGAffineTransformMakeScale(&v8, v7, v7);
    [(NTKRenegadeFaceView *)self setTransform:&v8];
    NTKAlphaForRubberBandingFraction();
    -[NTKRenegadeFaceView setAlpha:](self, "setAlpha:");
  }
}

- (double)_complicationsAlphaForEditMode:(int64_t)a3
{
  double result = 1.0;
  if (a3 != 1)
  {
    unsigned int v6 = [(NTKRenegadeFaceView *)self _areComplicationsEnabled];
    double result = 0.0;
    if (v6) {
      return 1.0;
    }
  }
  return result;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return 0;
}

- (void)_applyDataMode
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v5 _applyDataMode];
  uint64_t v3 = (char *)[(NTKRenegadeFaceView *)self dataMode];
  if ((unint64_t)(v3 - 1) < 2) {
    goto LABEL_4;
  }
  if (v3 == (unsigned char *)&dword_0 + 3)
  {
    [(NTKRenegadeTimeView *)self->_quiltTimeView setPaused:1];
    if (([(NTKRenegadeFaceView *)self editing] & 1) == 0)
    {
      uint64_t v4 = [(NTKRenegadeFaceView *)self _snapshotConfiguration];
      [(NTKRenegadeTimeView *)self->_quiltTimeView setConfiguration:v4];
    }
  }
  else if (v3 == (unsigned char *)&dword_4 + 1)
  {
LABEL_4:
    [(NTKRenegadeTimeView *)self->_quiltTimeView setPaused:1];
  }
  [(NTKRenegadeFaceView *)self _updateComplicationsEnabled];
}

- (void)_cleanupAfterZoom
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v3 _cleanupAfterZoom];
  if ([(NTKRenegadeFaceView *)self dataMode] == (char *)&dword_0 + 1) {
    [(NTKRenegadeTimeView *)self->_quiltTimeView setPaused:0];
  }
}

- (void)_prepareForSnapshotting
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v3 _prepareForSnapshotting];
  [(NTKRenegadeFaceView *)self _updateComplicationsEnabled];
  [(NTKRenegadeFaceView *)self _loadLayoutRules];
}

- (id)_snapshotConfiguration
{
  [(NTKRenegadeFaceView *)self _areComplicationsEnabled];
  [(NTKRenegadeFaceView *)self bounds];

  return +[NTKRenegadeBackgroundConfiguration snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:](NTKRenegadeBackgroundConfiguration, "snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:");
}

- (void)_updateComplicationsEnabled
{
  objc_super v3 = self->_quiltTimeView;
  [(NTKRenegadeTimeView *)v3 setComplicationsEnabled:[(NTKRenegadeFaceView *)self _areComplicationsEnabled]];
  id v4 = [(NTKRenegadeFaceView *)self _snapshotConfiguration];
  [(NTKRenegadeTimeView *)v3 setConfiguration:v4];
}

- (BOOL)_areComplicationsEnabled
{
  uint64_t v3 = [(NTKRenegadeFaceView *)self delegate];
  unsigned __int8 v4 = [(id)v3 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotDate];

  objc_super v5 = [(NTKRenegadeFaceView *)self delegate];
  LOBYTE(v3) = [v5 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotBottom];

  return v4 & v3 ^ 1;
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (void)_loadLayoutRules
{
  v54.receiver = self;
  v54.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v54 _loadLayoutRules];
  uint64_t v3 = [(NTKRenegadeFaceView *)self complicationLayoutforSlot:NTKComplicationSlotDate];
  [(NTKRenegadeFaceView *)self _dateComplicationFrame];
  double v5 = v4;
  CGFloat v43 = v6;
  CGFloat v44 = v4;
  double v8 = v7;
  double v9 = v6;
  double v11 = v10;
  id v12 = [(NTKRenegadeFaceView *)self device];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v12, 3, 3, v5, v8, v9, v11);
  v48 = _NSConcreteStackBlock;
  uint64_t v49 = 3221225472;
  v50 = sub_6034;
  v51 = &unk_105A0;
  id v52 = v3;
  id v53 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v53;
  id v14 = v3;
  NTKEnumerateComplicationStates();

  uint64_t v15 = NTKComplicationSlotBottom;
  [v12 screenBounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(NTKRenegadeFaceView *)self complicationLayoutforSlot:v15];
  CGFloat v40 = v17;
  CGFloat v41 = v19;
  -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v24, 9, v17, v19, v21, v23);
  sub_508C(v12, (uint64_t)v47);
  v45 = v24;
  v46 = v12;
  id v25 = v12;
  id v26 = v24;
  NTKEnumerateComplicationStates();
  double left = UIEdgeInsetsZero.left;
  double right = UIEdgeInsetsZero.right;
  v55.size.width = v43;
  v55.origin.x = v44;
  v55.origin.y = v8;
  v55.size.height = v11;
  double MaxY = CGRectGetMaxY(v55);
  v29 = [v26 defaultLayoutRuleForState:0];
  [v29 referenceFrame];
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  v56.origin.x = v40;
  v56.origin.y = v41;
  v56.size.width = v21;
  v56.size.height = v23;
  double Height = CGRectGetHeight(v56);
  v57.origin.x = v31;
  v57.origin.y = v33;
  v57.size.width = v35;
  v57.size.height = v37;
  CGFloat v39 = Height - CGRectGetMinY(v57);

  -[NTKRenegadeTimeView setComplicationsEdgeInsets:](self->_quiltTimeView, "setComplicationsEdgeInsets:", MaxY, left, v39, right);
  self->_complicationsEdgeInsets.top = MaxY;
  self->_complicationsEdgeInsets.double left = left;
  self->_complicationsEdgeInsets.bottom = v39;
  self->_complicationsEdgeInsets.double right = right;
  [(NTKRenegadeFaceView *)self _updateComplicationsEnabled];
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKRenegadeFaceView;
  [(NTKRenegadeFaceView *)&v8 _keylineFrameForComplicationSlot:a3 selected:a4];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NTKRenegadeFaceView;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(NTKRenegadeFaceView *)&v12 _newLegacyViewForComplication:v9 family:a4 slot:v8];
  -[NTKRenegadeFaceView _applyComplicationStyleToView:forComplication:slot:](self, "_applyComplicationStyleToView:forComplication:slot:", v10, v9, v8, v12.receiver, v12.super_class);

  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKRenegadeFaceView;
  id v6 = a4;
  id v7 = a3;
  [(NTKRenegadeFaceView *)&v8 _configureComplicationView:v7 forSlot:v6];
  -[NTKRenegadeFaceView _applyComplicationStyleToView:forSlot:](self, "_applyComplicationStyleToView:forSlot:", v7, v6, v8.receiver, v8.super_class);
}

- (void)_applyComplicationStyleToView:(id)a3 forSlot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(NTKRenegadeFaceView *)self delegate];
  id v9 = [v8 faceViewComplicationForSlot:NTKComplicationSlotBottom];

  [(NTKRenegadeFaceView *)self _applyComplicationStyleToView:v7 forComplication:v9 slot:v6];
}

- (void)_applyComplicationStyleToView:(id)a3 forComplication:(id)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v11 = v8;
    if ([v10 isEqualToString:NTKComplicationSlotDate])
    {
      objc_super v12 = [(NTKRenegadeFaceView *)self _dateComplicationFont];
      [v11 setFontWeight:UIFontWeightBold];
      [v12 pointSize];
      objc_msgSend(v11, "setFontSize:");
      id v13 = [(NTKRenegadeColorPalette *)self->_palette dateComplicationLabelColor];
      [v11 setAccentColor:v13];
      [v11 setForegroundColor:v13];
    }
    else
    {
      if (![v10 isEqualToString:NTKComplicationSlotBottom])
      {
LABEL_7:
        [v11 setForegroundAlpha:1.0];
        [v11 setForegroundImageAlpha:1.0];
        [v11 setUseBlockyHighlightCorners:1];

        goto LABEL_8;
      }
      objc_super v12 = [(NTKRenegadeFaceView *)self _bottomComplicationFont];
      [v11 setFontWeight:UIFontWeightSemibold];
      [v12 pointSize];
      objc_msgSend(v11, "setFontSize:");
      id v13 = [(NTKRenegadeColorPalette *)self->_palette bottomComplicationLabelColor];
      [v11 setAccentColor:v13];
      [v11 setForegroundColor:v13];
      [v11 setPlacement:4];
    }

    goto LABEL_7;
  }
LABEL_8:
  if ([v10 isEqualToString:NTKComplicationSlotBottom])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 complicationType] == (char *)&dword_10 + 2)
    {
      id v14 = v8;
      uint64_t v15 = [v14 imageView];
      CGAffineTransformMakeScale(&v19, 1.15, 1.15);
      CGAffineTransform v18 = v19;
      [v15 setTransform:&v18];
      [v15 setAlpha:1.0];
      double v16 = [v14 label];

      double v17 = [v16 textColor];
      [v15 setTintColor:v17];
    }
  }
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NTKRenegadeFaceView;
  id v6 = a4;
  id v7 = a3;
  [(NTKRenegadeFaceView *)&v10 _cleanupAfterTransitionComplicationSlot:v7 selectedComplication:v6];
  [(NTKRenegadeFaceView *)self _updateComplicationsEnabled];
  id v8 = [(NTKRenegadeFaceView *)self normalComplicationDisplayWrapperForSlot:v7];
  id v9 = [v8 display];
  [(NTKRenegadeFaceView *)self _applyComplicationStyleToView:v9 forComplication:v6 slot:v7];
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  return 0;
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  return [(NTKRenegadeFaceView *)self _defaultKeylineViewForComplicationSlot:a3];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [a3 color];

  return +[NTKRenegadeColorPalette swatchImageForColor:size:](NTKRenegadeColorPalette, "swatchImageForColor:size:", v6, width, height);
}

- (BOOL)_usesSimplifiedZoom
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerOverlay, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_quiltTimeView, 0);

  objc_storeStrong((id *)&self->_palette, 0);
}

@end