@interface NTKExtraLargeRichFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_wantsStatusBarIconShadow;
- (NSCache)swatchesCache;
- (NTKFace)swatchesFace;
- (NTKFaceViewController)swatchesFaceViewController;
- (NTKGossamerColorPalette)lastAppliedColorPalette;
- (NTKGradientComposedView)composedView;
- (NTKInterpolatedColorPalette)editingComplicationsPalette;
- (UIView)complicationPlaceholderView;
- (double)_smallTimeAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (double)monochromeFraction;
- (double)tintedFraction;
- (id)_paletteApplyingTritiumFractionToPalette:(id)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (unint64_t)backgroundStyle;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyColorsFromLastAppliedColorPalette;
- (void)_applyColorsFromPalette:(id)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureSmallTimeLabelColors;
- (void)_loadSnapshotContentViews;
- (void)_noteComplicationVisibilityChanged;
- (void)_prepareSwatchImagesForSelectedOptions:(id)a3;
- (void)_unloadSnapshotContentViews;
- (void)loadComplicationPlaceholderViews;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setComposedView:(id)a3;
- (void)setEditingComplicationsPalette:(id)a3;
- (void)setLastAppliedColorPalette:(id)a3;
- (void)setMonochromeFraction:(double)a3;
- (void)setTintedFraction:(double)a3;
@end

@implementation NTKExtraLargeRichFaceView

- (id)createFaceColorPalette
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15F40);
  id WeakRetained = objc_loadWeakRetained(&qword_15F48);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = [(NTKExtraLargeRichFaceView *)self device];
    id v6 = objc_loadWeakRetained(&qword_15F48);
    if (v5 == v6)
    {
      v7 = [(NTKExtraLargeRichFaceView *)self device];
      id v8 = [v7 version];
      uint64_t v9 = qword_15F50;

      if (v8 == (id)v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v10 = [(NTKExtraLargeRichFaceView *)self device];
  objc_storeWeak(&qword_15F48, v10);

  id v11 = objc_loadWeakRetained(&qword_15F48);
  qword_15F50 = (uint64_t)[v11 version];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_844C;
  v15[3] = &unk_104B0;
  v15[4] = self;
  v12 = [(NTKExtraLargeRichFaceView *)self device];
  ((void (*)(void *, void *))sub_844C)(v15, v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15F40);
  id v13 = objc_alloc_init((Class)NTKGossamerColorPalette);
  [v13 setBackgroundStyle:self->_backgroundStyle];
  objc_msgSend(v13, "setApproximateComplicationPositions:", 0.0, 0.0, *(double *)&qword_15F38);

  return v13;
}

- (id)_paletteApplyingTritiumFractionToPalette:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  double paletteTritiumFraction = self->super._paletteTritiumFraction;
  if (paletteTritiumFraction == 1.0)
  {
    id v7 = [v4 tritiumPalette];
  }
  else if (paletteTritiumFraction == 0.0)
  {
    id v7 = v4;
  }
  else
  {
    objc_msgSend(v4, "tritiumPaletteWithProgress:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  return v8;
}

- (void)_loadSnapshotContentViews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKExtraLargeRichFaceView;
  [(NTKExtraLargeFaceView *)&v7 _loadSnapshotContentViews];
  v3 = [(NTKExtraLargeRichFaceView *)self device];
  if (!self->_composedView && NTKShowGossamerUI())
  {
    id v4 = [(NTKExtraLargeRichFaceView *)self rootContainerView];
    [v4 removeFromSuperview];
    id v5 = (NTKGradientComposedView *)[objc_alloc((Class)NTKGradientComposedView) initWithDevice:v3];
    composedView = self->_composedView;
    self->_composedView = v5;

    [(NTKGradientComposedView *)self->_composedView setRootContainerView:v4];
    [(NTKGradientComposedView *)self->_composedView setShowForegroundGradient:[(NTKExtraLargeFaceView *)self complicationIsVisible] ^ 1];
    [(NTKExtraLargeRichFaceView *)self addSubview:self->_composedView];
  }
}

- (void)_unloadSnapshotContentViews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKExtraLargeRichFaceView;
  [(NTKExtraLargeFaceView *)&v7 _unloadSnapshotContentViews];
  composedView = self->_composedView;
  if (composedView)
  {
    [(NTKGradientComposedView *)composedView removeFromSuperview];
    id v4 = self->_composedView;
    self->_composedView = 0;

    id v5 = [(NTKExtraLargeRichFaceView *)self rootContainerView];
    [v5 removeFromSuperview];
    id v6 = [(NTKExtraLargeRichFaceView *)self timeView];
    [(NTKExtraLargeRichFaceView *)self insertSubview:v5 aboveSubview:v6];
  }
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKExtraLargeRichFaceView *)self device];
  char v9 = NTKShowGossamerUI();

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v6;
      if ([v10 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationCircularView])
      {
        id v11 = +[UIColor clearColor];
        [v10 setPlatterColor:v11];
      }
      if ([v10 conformsToProtocol:&OBJC_PROTOCOL___CDRichComplicationTintedPlatterColorOverridable])objc_msgSend(v10, "setTintedFraction:", self->_tintedFraction); {
      [v10 transitionToMonochromeWithFraction:self->_monochromeFraction];
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NTKExtraLargeRichFaceView;
    [(NTKExtraLargeFaceView *)&v12 _configureComplicationView:v6 forSlot:v7];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(NTKExtraLargeRichFaceView *)self device];
  char v11 = NTKShowGossamerUI();

  if (v11)
  {
    objc_super v12 = [(NTKExtraLargeRichFaceView *)self faceColorPalette];
    id v13 = v12;
    if (self->_complicationPlaceholderView) {
      [v12 setIsSwatchPreview:1];
    }
    switch(a4)
    {
      case 10:
        [(NTKExtraLargeRichFaceView *)self _applyColorsFromPalette:v13];
        break;
      case 19:
        -[NTKExtraLargeFaceView _setNumerals:](self, "_setNumerals:", [v8 numeralOption]);
        break;
      case 17:
        id v14 = [v8 backgroundStyle];
        [v13 setBackgroundStyle:v14];
        [(NTKExtraLargeRichFaceView *)self setBackgroundStyle:v14];
        [(NTKExtraLargeRichFaceView *)self _applyColorsFromPalette:v13];
        v15 = [(NTKExtraLargeRichFaceView *)self delegate];
        [v15 faceViewWantsComplicationKeylineFramesReloaded];

        v16 = [(NTKExtraLargeRichFaceView *)self delegate];
        [v16 faceViewDidChangeWantsStatusBarIconShadow];

        v17 = [(NTKExtraLargeRichFaceView *)self delegate];
        [v17 faceViewDidChangePaddingForStatusBar];

        break;
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NTKExtraLargeRichFaceView;
    [(NTKExtraLargeFaceView *)&v18 _applyOption:v8 forCustomEditMode:a4 slot:v9];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = [(NTKExtraLargeRichFaceView *)self device];
  char v16 = NTKShowGossamerUI();

  if (v16)
  {
    v17 = [(NTKExtraLargeRichFaceView *)self interpolatedColorPalette];
    objc_super v18 = [v17 fromPalette];
    v19 = [v17 toPalette];
    if (self->_complicationPlaceholderView)
    {
      [v18 setIsSwatchPreview:1];
      [v19 setIsSwatchPreview:1];
    }
    switch(a6)
    {
      case 10:
        unint64_t v23 = [(NTKExtraLargeRichFaceView *)self backgroundStyle];
        [v18 setBackgroundStyle:v23];
        [v19 setBackgroundStyle:v23];
        [(NTKExtraLargeRichFaceView *)self _applyColorsFromPalette:v17];
        break;
      case 19:
        id v24 = [v12 numeralOption];
        id v25 = [v13 numeralOption];
        if (v24 == v25)
        {
          [(NTKExtraLargeFaceView *)self _setNumerals:v24];
        }
        else
        {
          if (a3 >= 0.5)
          {
            id v28 = v25;
            CLKMapFractionIntoRange();
            double v27 = v29;
            id v24 = v28;
          }
          else
          {
            CLKMapFractionIntoRange();
            double v27 = v26;
          }
          CLKMapFractionIntoRange();
          memset(&v40, 0, sizeof(v40));
          CGAffineTransformMakeScale(&v40, v30, v30);
          [(NTKExtraLargeFaceView *)self _setNumerals:v24];
          if ([(NTKExtraLargeFaceView *)self complicationIsVisible])
          {
            CGAffineTransform v39 = v40;
            v31 = [(NTKExtraLargeFaceView *)self smallTimeLabel];
            CGAffineTransform v38 = v39;
            [v31 setTransform:&v38];

            v32 = [(NTKExtraLargeFaceView *)self smallTimeLabel];
          }
          else
          {
            CGAffineTransform v37 = v40;
            v33 = [(NTKExtraLargeFaceView *)self largeTimeLabel];
            CGAffineTransform v36 = v37;
            [v33 setTransform:&v36];

            v32 = [(NTKExtraLargeFaceView *)self largeTimeLabel];
          }
          v34 = v32;
          [v32 setAlpha:v27];
        }
        break;
      case 17:
        id v20 = [v12 backgroundStyle];
        id v35 = [v13 backgroundStyle];
        v21 = [(NTKExtraLargeRichFaceView *)self faceColorPalette];
        v22 = [v21 pigmentEditOption];

        [v18 setPigmentEditOption:v22];
        [v18 setBackgroundStyle:v20];
        [v19 setPigmentEditOption:v22];
        [v19 setBackgroundStyle:v35];
        [v17 setTransitionFraction:a3];
        [(NTKExtraLargeRichFaceView *)self _applyColorsFromPalette:v17];

        break;
    }
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)NTKExtraLargeRichFaceView;
    [(NTKExtraLargeFaceView *)&v41 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:v14 slot:a3];
  }
}

- (void)_applyColorsFromLastAppliedColorPalette
{
  lastAppliedColorPalette = self->_lastAppliedColorPalette;
  if (!lastAppliedColorPalette)
  {
    id v4 = [(NTKExtraLargeRichFaceView *)self faceColorPalette];
    id v5 = self->_lastAppliedColorPalette;
    self->_lastAppliedColorPalette = v4;

    lastAppliedColorPalette = self->_lastAppliedColorPalette;
  }

  [(NTKExtraLargeRichFaceView *)self _applyColorsFromPalette:lastAppliedColorPalette];
}

- (void)_applyColorsFromPalette:(id)a3
{
  id v4 = a3;
  id v5 = [v4 scaleFactor];
  [v5 doubleValue];
  CGFloat v7 = v6;

  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v7, v7);
  id v8 = [(NTKExtraLargeRichFaceView *)self rootContainerView];
  CGAffineTransform v32 = v33;
  [v8 setTransform:&v32];

  [(NTKGradientComposedView *)self->_composedView applyGossamerColorPalette:v4];
  if ([(NTKGradientComposedView *)self->_composedView showForegroundGradient]
    && ([v4 foregroundGradientFraction],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 doubleValue],
        double v11 = v10,
        v9,
        v11 > 0.0))
  {
    uint64_t v12 = +[UIColor whiteColor];
  }
  else
  {
    uint64_t v12 = [v4 accentColor];
  }
  id v13 = (void *)v12;
  id v14 = [(NTKExtraLargeFaceView *)self largeTimeLabel];
  [v14 setTopColor:v13];

  v15 = [(NTKExtraLargeFaceView *)self largeTimeLabel];
  [v15 setBottomColor:v13];

  char v16 = [(NTKExtraLargeFaceView *)self smallTimeLabel];
  v17 = [v4 topAccentColor];
  [v16 setColor:v17];

  objc_super v18 = [v4 bottomAccentColor];
  [(NTKExtraLargeRichFaceView *)self setComplicationColor:v18];

  v19 = [v4 bottomAccentColor];
  [(NTKExtraLargeRichFaceView *)self setInterpolatedComplicationColor:v19];

  id v20 = [v4 foregroundColor];
  [(NTKExtraLargeRichFaceView *)self setAlternateComplicationColor:v20];

  v21 = [v4 bottomApproximateBackgroundColor];
  [(NTKExtraLargeRichFaceView *)self setComplicationBackgroundColor:v21];

  v22 = [v4 monochromeFraction];
  [v22 doubleValue];
  self->_double monochromeFraction = v23;

  id v24 = [v4 tintedFraction];
  [v24 doubleValue];
  self->_double tintedFraction = v25;

  double monochromeFraction = self->_monochromeFraction;
  double tintedFraction = self->_tintedFraction;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_9084;
  v31[3] = &unk_104D0;
  *(double *)&v31[4] = tintedFraction;
  *(double *)&v31[5] = monochromeFraction;
  [(NTKExtraLargeRichFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v31];
  complicationPlaceholderView = self->_complicationPlaceholderView;
  if (complicationPlaceholderView)
  {
    double v29 = [v4 swatchComplicationPlaceholderColor];
    [(UIView *)complicationPlaceholderView setBackgroundColor:v29];
  }
  lastAppliedColorPalette = self->_lastAppliedColorPalette;
  self->_lastAppliedColorPalette = (NTKGossamerColorPalette *)v4;
}

- (double)_smallTimeAlphaForEditMode:(int64_t)a3
{
  if (a3 == 17)
  {
    unsigned int v3 = [(NTKExtraLargeFaceView *)self complicationIsVisible];
    double result = 0.0;
    if (v3) {
      return 1.0;
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKExtraLargeRichFaceView;
    -[NTKExtraLargeFaceView _smallTimeAlphaForEditMode:](&v5, "_smallTimeAlphaForEditMode:");
  }
  return result;
}

- (void)_noteComplicationVisibilityChanged
{
  v3.receiver = self;
  v3.super_class = (Class)NTKExtraLargeRichFaceView;
  [(NTKExtraLargeFaceView *)&v3 _noteComplicationVisibilityChanged];
  [(NTKGradientComposedView *)self->_composedView setShowForegroundGradient:[(NTKExtraLargeFaceView *)self complicationIsVisible] ^ 1];
}

- (void)loadComplicationPlaceholderViews
{
  if (!self->_complicationPlaceholderView)
  {
    id v8 = [(NTKExtraLargeRichFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotCenter];
    [v8 frame];
    CGRect v11 = CGRectInset(v10, 4.0, 4.0);
    CGFloat v3 = v11.size.width * 0.5;
    id v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
    complicationPlaceholderView = self->_complicationPlaceholderView;
    self->_complicationPlaceholderView = v4;

    double v6 = [(UIView *)self->_complicationPlaceholderView layer];
    [v6 setCornerRadius:v3];

    CGFloat v7 = [(NTKExtraLargeRichFaceView *)self complicationContainerView];
    [v7 addSubview:self->_complicationPlaceholderView];
  }
}

- (void)_configureSmallTimeLabelColors
{
  id v5 = [(NTKExtraLargeRichFaceView *)self faceColorPalette];
  CGFloat v3 = [(NTKExtraLargeFaceView *)self smallTimeLabel];
  id v4 = [v5 primaryColor];
  [v3 setTextColor:v4];
}

- (void)_configureForEditMode:(int64_t)a3
{
  editingComplicationsPalette = self->_editingComplicationsPalette;
  if (a3 == 1)
  {
    if (!editingComplicationsPalette)
    {
      id v5 = [(NTKExtraLargeRichFaceView *)self faceColorPalette];
      id v6 = [v5 copy];
      [v6 setIsEditingComplications:1];
      CGFloat v7 = (NTKInterpolatedColorPalette *)[objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v5 toPalette:v6];
      id v8 = self->_editingComplicationsPalette;
      self->_editingComplicationsPalette = v7;

      editingComplicationsPalette = self->_editingComplicationsPalette;
    }
    [(NTKInterpolatedColorPalette *)editingComplicationsPalette setTransitionFraction:1.0];
    [(NTKGradientComposedView *)self->_composedView setShowForegroundGradient:0];
    id v9 = self->_editingComplicationsPalette;
    [(NTKExtraLargeRichFaceView *)self _applyColorsFromPalette:v9];
  }
  else if (editingComplicationsPalette)
  {
    self->_editingComplicationsPalette = 0;

    [(NTKGradientComposedView *)self->_composedView setShowForegroundGradient:[(NTKExtraLargeFaceView *)self complicationIsVisible] ^ 1];
    [(NTKExtraLargeRichFaceView *)self _applyColorsFromLastAppliedColorPalette];
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKExtraLargeRichFaceView;
  -[NTKExtraLargeFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v16, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  editingComplicationsPalette = self->_editingComplicationsPalette;
  if (a4 == 1 || a5 == 1)
  {
    if (!editingComplicationsPalette)
    {
      id v9 = [(NTKExtraLargeRichFaceView *)self faceColorPalette];
      id v10 = [v9 copy];
      [v10 setIsEditingComplications:1];
      CGRect v11 = (NTKInterpolatedColorPalette *)[objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v9 toPalette:v10];
      uint64_t v12 = self->_editingComplicationsPalette;
      self->_editingComplicationsPalette = v11;
    }
    CLKInterpolateBetweenFloatsClipped();
    double v14 = v13;
    if (v13 >= 0.5) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = [(NTKExtraLargeFaceView *)self complicationIsVisible] ^ 1;
    }
    [(NTKGradientComposedView *)self->_composedView setShowForegroundGradient:v15];
    [(NTKInterpolatedColorPalette *)self->_editingComplicationsPalette setTransitionFraction:v14];
    [(NTKExtraLargeRichFaceView *)self _applyColorsFromPalette:self->_editingComplicationsPalette];
  }
  else if (editingComplicationsPalette)
  {
    self->_editingComplicationsPalette = 0;

    [(NTKGradientComposedView *)self->_composedView setShowForegroundGradient:[(NTKExtraLargeFaceView *)self complicationIsVisible] ^ 1];
    [(NTKExtraLargeRichFaceView *)self _applyColorsFromLastAppliedColorPalette];
  }
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_backgroundStyle != 0;
}

- (double)_verticalPaddingForStatusBar
{
  v9.receiver = self;
  v9.super_class = (Class)NTKExtraLargeRichFaceView;
  [(NTKExtraLargeFaceView *)&v9 _verticalPaddingForStatusBar];
  double v4 = v3;
  if (self->_backgroundStyle == 1)
  {
    id v5 = [(NTKExtraLargeRichFaceView *)self device];
    sub_5F88(v5, (uint64_t)v7);
    double v4 = v4 + v8;
  }
  return v4;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKLargeElementScaleForBreathingFraction();
  CGFloat v7 = v6;
  double v8 = [(NTKExtraLargeRichFaceView *)self composedView];
  CGAffineTransformMakeScale(&v9, v7, v7);
  [v8 setTransform:&v9];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKScaleForRubberBandingFraction();
  CGFloat v7 = v6;
  NTKAlphaForRubberBandingFraction();
  double v9 = v8;
  id v10 = [(NTKExtraLargeRichFaceView *)self composedView];
  CGAffineTransformMakeScale(&v12, v7, v7);
  CGAffineTransformTranslate(&v13, &v12, 0.0, 1.0);
  [v10 setTransform:&v13];

  CGRect v11 = [(NTKExtraLargeRichFaceView *)self composedView];
  [v11 setAlpha:v9];
}

- (NSCache)swatchesCache
{
  swatchesCache = self->_swatchesCache;
  if (!swatchesCache)
  {
    double v4 = (NSCache *)objc_opt_new();
    id v5 = self->_swatchesCache;
    self->_swatchesCache = v4;

    swatchesCache = self->_swatchesCache;
  }

  return swatchesCache;
}

- (NTKFace)swatchesFace
{
  swatchesFace = self->_swatchesFace;
  if (!swatchesFace)
  {
    double v4 = [(NTKExtraLargeRichFaceView *)self device];
    id v5 = +[NTKFace defaultFaceOfStyle:212 forDevice:v4];
    double v6 = self->_swatchesFace;
    self->_swatchesFace = v5;

    CGFloat v7 = self->_swatchesFace;
    double v8 = +[NTKComplication nullComplication];
    [(NTKFace *)v7 setComplication:v8 forSlot:NTKComplicationSlotCenter];

    swatchesFace = self->_swatchesFace;
  }

  return swatchesFace;
}

- (NTKFaceViewController)swatchesFaceViewController
{
  swatchesFaceViewController = self->_swatchesFaceViewController;
  if (!swatchesFaceViewController)
  {
    double v4 = [(NTKExtraLargeRichFaceView *)self swatchesFace];
    id v5 = (NTKFaceViewController *)[objc_alloc((Class)NTKFaceViewController) initWithFace:v4 configuration:&stru_10510];
    double v6 = self->_swatchesFaceViewController;
    self->_swatchesFaceViewController = v5;

    [(NTKFaceViewController *)self->_swatchesFaceViewController freeze];
    CGFloat v7 = [(NTKFaceViewController *)self->_swatchesFaceViewController view];
    [v7 setNeedsLayout];

    double v8 = [(NTKFaceViewController *)self->_swatchesFaceViewController view];
    [v8 layoutIfNeeded];

    double v9 = [(NTKFaceViewController *)self->_swatchesFaceViewController faceView];
    id v10 = [(NTKExtraLargeRichFaceView *)self delegate];
    [v9 setDelegate:v10];

    [v9 _updateComplicationVisibility];
    [v9 _noteComplicationVisibilityChanged];
    [v9 loadComplicationPlaceholderViews];
    [v9 populateFaceViewEditOptionsFromFace:v4 forced:1];

    swatchesFaceViewController = self->_swatchesFaceViewController;
  }

  return swatchesFaceViewController;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 17) {
    return &off_10AF0;
  }
  else {
    return 0;
  }
}

- (void)_prepareSwatchImagesForSelectedOptions:(id)a3
{
  id v10 = a3;
  double v4 = [(NTKExtraLargeRichFaceView *)self device];
  id v5 = (char *)+[NTKFaceBackgroundStyleEditOption numberOfOptionsForDevice:v4];

  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      CGFloat v7 = [(NTKExtraLargeRichFaceView *)self device];
      double v8 = +[NTKFaceBackgroundStyleEditOption optionAtIndex:i forDevice:v7];

      id v9 = [(NTKExtraLargeRichFaceView *)self _swatchImageForEditOption:v8 mode:17 withSelectedOptions:v10];
    }
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 == 19)
  {
    id v20 = [(NTKExtraLargeFaceView *)self largeTimeLabel];
    v21 = [v20 _timeLabelFont];

    v22 = [(NTKExtraLargeRichFaceView *)self device];
    id v19 = [v8 swatchImageWithFont:v21 device:v22 baseline:0.0];
  }
  else if (a4 == 17)
  {
    CGRect v11 = [v9 objectForKeyedSubscript:&off_10840];
    CGAffineTransform v12 = [(NTKExtraLargeRichFaceView *)self delegate];
    CGAffineTransform v13 = [v12 faceViewComplicationForSlot:NTKComplicationSlotCenter];

    double v14 = +[NTKComplication nullComplication];
    id v15 = [v13 isEqual:v14];

    objc_super v16 = [(NTKExtraLargeRichFaceView *)self swatchesCache];
    v17 = +[NSString stringWithFormat:@"%@-%@-%i", v8, v11, v15 ^ 1];
    objc_super v18 = [v16 objectForKey:v17];
    if (v18)
    {
      id v19 = v18;
    }
    else
    {
      double v23 = [(NTKExtraLargeRichFaceView *)self swatchesFaceViewController];
      id v24 = [v23 faceView];
      [v24[19] setHidden:v15];
      [v24 _updateComplicationVisibility];
      double v25 = [(NTKExtraLargeRichFaceView *)self swatchesFace];
      [v25 selectOption:v11 forCustomEditMode:10 slot:0];
      [v25 selectOption:v8 forCustomEditMode:17 slot:0];
      [v24 bounds];
      v32.width = v26;
      v32.height = v27;
      UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
      [v24 bounds];
      objc_msgSend(v24, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
      id v28 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [v16 setObject:v28 forKey:v17];
      id v19 = v28;
    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)NTKExtraLargeRichFaceView;
    id v19 = [(NTKExtraLargeRichFaceView *)&v30 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v19;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (NTKGradientComposedView)composedView
{
  return (NTKGradientComposedView *)objc_getProperty(self, a2, 112, 1);
}

- (void)setComposedView:(id)a3
{
}

- (NTKInterpolatedColorPalette)editingComplicationsPalette
{
  return (NTKInterpolatedColorPalette *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEditingComplicationsPalette:(id)a3
{
}

- (NTKGossamerColorPalette)lastAppliedColorPalette
{
  return (NTKGossamerColorPalette *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastAppliedColorPalette:(id)a3
{
}

- (double)monochromeFraction
{
  return self->_monochromeFraction;
}

- (void)setMonochromeFraction:(double)a3
{
  self->_double monochromeFraction = a3;
}

- (double)tintedFraction
{
  return self->_tintedFraction;
}

- (void)setTintedFraction:(double)a3
{
  self->_double tintedFraction = a3;
}

- (UIView)complicationPlaceholderView
{
  return self->_complicationPlaceholderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationPlaceholderView, 0);
  objc_storeStrong((id *)&self->_lastAppliedColorPalette, 0);
  objc_storeStrong((id *)&self->_editingComplicationsPalette, 0);
  objc_storeStrong((id *)&self->_composedView, 0);
  objc_storeStrong((id *)&self->_swatchesFaceViewController, 0);
  objc_storeStrong((id *)&self->_swatchesFace, 0);

  objc_storeStrong((id *)&self->_swatchesCache, 0);
}

@end