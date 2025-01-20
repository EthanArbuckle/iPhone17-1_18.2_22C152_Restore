@interface NTKWhistlerAnalogFaceView
+ (double)curvedRadiusForDevice:(id)a3 dark:(BOOL)a4;
- (BOOL)_isComplicationSlotInsideDial:(id)a3;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_wantsDimWithDesaturationFilterDuringComplicationEditing;
- (BOOL)viewShouldIgnoreTwoPieceImage:(id)a3;
- (NTKWhistlerAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_bezelCircularBackgroundFromComplication:(id)a3;
- (double)_bezelLabelCurvedRadiusForColor:(id)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_dialTextBackgroundAlphaForEditMode:(int64_t)a3;
- (double)_handAlphaForEditMode:(int64_t)a3;
- (double)_paddedBezelAngularWidth;
- (double)_verticalPaddingForStatusBar;
- (id)_additonalViewsToApplyDesaturationDuringComplicationEditing;
- (id)_bezelTextColorForEditMode:(int64_t)a3 colorPalette:(id)a4;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_platterTextColorForEditMode:(int64_t)a3 colorPalette:(id)a4;
- (id)_richComplicationViewForView:(id)a3;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_editMode;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (int64_t)_richComplicationViewThemeFromFaceColorPalette:(id)a3;
- (unint64_t)dateStyle;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyEnteringEditingWithTransitionFraction:(double)a3;
- (void)_applyExitingEditingWithTransitionFraction:(double)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 applyHandsTransition:(BOOL)a6;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_configureUIOnColorChange;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_reorderSwitcherSnapshotView;
- (void)_setupDialView;
- (void)_unloadSnapshotContentViews;
- (void)_updateDialTicksForBezelText;
- (void)bezelViewDidBecomeInteractive:(id)a3;
- (void)bezelViewDidEndInteractive:(id)a3;
- (void)complicationDisplayWrapperView:(id)a3 updateCustomDataAnimationFromEarlierView:(id)a4 laterView:(id)a5 isForward:(BOOL)a6 animationType:(unint64_t)a7 animationDuration:(double)a8 animationFraction:(float)a9;
- (void)setDateStyle:(unint64_t)a3;
@end

@implementation NTKWhistlerAnalogFaceView

- (NTKWhistlerAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NTKWhistlerAnalogFaceView;
  v9 = [(NTKWhistlerAnalogFaceView *)&v20 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    id v10 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    sub_4F38(v8);
    v12 = (NTKWhistlerAnalogFaceViewComplicationFactory *)[v10 initWithFaceView:v9 dialDiameter:v8 device:v11];
    faceViewComplicationFactory = v9->_faceViewComplicationFactory;
    v9->_faceViewComplicationFactory = v12;

    v14 = (NTKWhistlerAnalogColorPalette *)[objc_alloc((Class)NTKWhistlerAnalogColorPalette) initWithDevice:v8];
    colorPalette = v9->_colorPalette;
    v9->_colorPalette = v14;

    v16 = (NTKFaceColorPalette *)objc_alloc_init((Class)NTKFaceColorPalette);
    blackPalette = v9->_blackPalette;
    v9->_blackPalette = v16;

    v18 = +[NTKPigmentEditOption pigmentNamed:ntk_seasons_black];
    [(NTKFaceColorPalette *)v9->_blackPalette setPigmentEditOption:v18];
  }
  return v9;
}

+ (double)curvedRadiusForDevice:(id)a3 dark:(BOOL)a4
{
  BOOL v4 = a4;
  double result = sub_4F38(a3);
  if (v4) {
    return v6;
  }
  return result;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKWhistlerAnalogFaceView;
  [(NTKWhistlerAnalogFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKWhistlerAnalogFaceView *)self _setupDialView];
  [(NTKWhistlerAnalogFaceView *)self _configureUIOnColorChange];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWhistlerAnalogFaceView;
  [(NTKWhistlerAnalogFaceView *)&v4 _unloadSnapshotContentViews];
  [(NTKCircularAnalogDialView *)self->_dialView removeFromSuperview];
  dialView = self->_dialView;
  self->_dialView = 0;
}

- (void)_configureTimeView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWhistlerAnalogFaceView;
  [(NTKWhistlerAnalogFaceView *)&v4 _configureTimeView:a3];
  [(NTKWhistlerAnalogFaceView *)self _configureUIOnColorChange];
}

- (void)_loadLayoutRules
{
  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  id v5 = [(NTKWhistlerAnalogFaceView *)self device];
  sub_4F38(v5);
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)faceViewComplicationFactory loadLayoutRulesForFaceView:self dialDiameter:v4];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory configureComplicationView:v26 forSlot:v6 faceView:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v26;
    if ([v6 isEqualToString:NTKComplicationSlotBezel])
    {
      if ([(NTKWhistlerAnalogFaceView *)self monochromeRichComplicationsEnabled])
      {
        int64_t v8 = [(NTKWhistlerAnalogFaceView *)self _editMode];
        v9 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
        [(NTKWhistlerAnalogFaceView *)self _platterTextColorForEditMode:v8 colorPalette:v9];
      }
      else
      {
        colorPalette = self->_colorPalette;
        v9 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
        [(NTKWhistlerAnalogColorPalette *)colorPalette complicationForegroundColorPalette:v9];
      double v11 = };
      [v7 setForegroundColor:v11];
    }
    if (![(NTKWhistlerAnalogFaceView *)self monochromeRichComplicationsEnabled])goto LABEL_13; {
    v12 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
    }
    if ([v12 isWhiteColor])
    {
    }
    else
    {
      v13 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
      unsigned __int8 v14 = [v13 isBlackColor];

      if ((v14 & 1) == 0)
      {
        [v7 updateMonochromeColor];
        goto LABEL_13;
      }
    }
    [v7 transitionToMonochromeWithFraction:0.0];
LABEL_13:
    v15 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
    int64_t v16 = [(NTKWhistlerAnalogFaceView *)self _richComplicationViewThemeFromFaceColorPalette:v15];

    [v7 transitThemeFromTheme:v16 toTheme:v16 fraction:1.0];
  }
  if ([v26 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationBezelView])
  {
    id v17 = v26;
    int64_t v18 = [(NTKWhistlerAnalogFaceView *)self _editMode];
    v19 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
    objc_super v20 = [(NTKWhistlerAnalogFaceView *)self _bezelTextColorForEditMode:v18 colorPalette:v19];
    [v17 setBezelTextColor:v20];

    [v17 setBezelTextDelegate:self];
  }
  if ([v26 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationBezelView]) {
    [v26 setBezelTextRadius:self->_bezelLabelCurvedRadius];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v26;
    v22 = +[UIColor whiteColor];
    [v21 setForegroundColor:v22];

    v23 = CLKUIDefaultComplicationBackgroundColor();
    [v21 setPlatterColor:v23];

    [v21 setUseRoundedFontDesign:1];
  }
  if ([v26 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationCircularView])
  {
    id v24 = v26;
    v25 = +[UIColor blackColor];
    [v24 setPlatterColor:v25];
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (double)_verticalPaddingForStatusBar
{
  v2 = [(NTKWhistlerAnalogFaceView *)self device];
  sub_4F38(v2);
  double v4 = v3;

  return v4;
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineViewForComplicationSlot:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKWhistlerAnalogFaceView;
    id v7 = [(NTKWhistlerAnalogFaceView *)&v10 _keylineViewForComplicationSlot:v4];
  }
  int64_t v8 = v7;

  return v8;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (void)_prepareForEditing
{
  [(NTKWhistlerAnalogFaceView *)self _updateDialTicksForBezelText];
  [(NTKCircularAnalogDialView *)self->_dialView prepareForEdit];
  id v4 = [(NTKWhistlerAnalogFaceView *)self complicationContainerView];
  double v3 = [v4 layer];
  [v3 setAllowsGroupOpacity:1];
}

- (void)_cleanupAfterEditing
{
  [(NTKWhistlerAnalogFaceView *)self _updateDialTicksForBezelText];
  [(NTKCircularAnalogDialView *)self->_dialView cleanupAfterEdit];
  id v4 = [(NTKWhistlerAnalogFaceView *)self complicationContainerView];
  double v3 = [v4 layer];
  [v3 setAllowsGroupOpacity:0];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10)
  {
    id v7 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
    [(NTKWhistlerAnalogFaceView *)self updateWithColorPalette:v7];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 10)
  {
    objc_super v10 = [(NTKWhistlerAnalogFaceView *)self interpolatedColorPalette];
    id v13 = [v10 fromPalette];

    double v11 = [(NTKWhistlerAnalogFaceView *)self interpolatedColorPalette];
    v12 = [v11 toPalette];

    [(NTKWhistlerAnalogFaceView *)self _applyTransitionFraction:v13 fromColorPalette:v12 toColorPalette:a3];
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v9 = [(NTKWhistlerAnalogFaceView *)self timeView];
  [(NTKWhistlerAnalogFaceView *)self _handAlphaForEditMode:a4];
  [(NTKWhistlerAnalogFaceView *)self _handAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  objc_super v10 = [(NTKWhistlerAnalogFaceView *)self contentView];
  [(NTKWhistlerAnalogFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKWhistlerAnalogFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v10, "setAlpha:");

  double v11 = [(NTKWhistlerAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBezel];
  id v27 = [v11 display];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(NTKWhistlerAnalogFaceView *)self monochromeRichComplicationsEnabled])
    {
      id v12 = v27;
      id v13 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
      unsigned __int8 v14 = [(NTKWhistlerAnalogFaceView *)self _platterTextColorForEditMode:a4 colorPalette:v13];
      v15 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
      [(NTKWhistlerAnalogFaceView *)self _platterTextColorForEditMode:a5 colorPalette:v15];
    }
    else
    {
      colorPalette = self->_colorPalette;
      id v17 = v27;
      id v13 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
      unsigned __int8 v14 = [(NTKWhistlerAnalogColorPalette *)colorPalette complicationForegroundColorPalette:v13];
      int64_t v18 = self->_colorPalette;
      v15 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
      [(NTKWhistlerAnalogColorPalette *)v18 complicationForegroundColorPalette:v15];
    v19 = };
    objc_super v20 = NTKInterpolateBetweenColors();

    [v27 setForegroundColor:v20];
  }
  if ([v27 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationBezelView])
  {
    id v21 = v27;
    v22 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
    v23 = [(NTKWhistlerAnalogFaceView *)self _bezelTextColorForEditMode:a4 colorPalette:v22];
    id v24 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
    v25 = [(NTKWhistlerAnalogFaceView *)self _bezelTextColorForEditMode:a5 colorPalette:v24];
    id v26 = NTKInterpolateBetweenColors();

    [v21 setBezelTextColor:v26];
  }
  if (a4 || !a5)
  {
    if (a4 && !a5) {
      [(NTKWhistlerAnalogFaceView *)self _applyExitingEditingWithTransitionFraction:a3];
    }
  }
  else
  {
    [(NTKWhistlerAnalogFaceView *)self _applyEnteringEditingWithTransitionFraction:a3];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)NTKWhistlerAnalogFaceView;
  -[NTKWhistlerAnalogFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v19, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKScaleForRubberBandingFraction();
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeScale(&v18, v7, v7);
    int64_t v8 = [(NTKWhistlerAnalogFaceView *)self contentView];
    CGAffineTransform v17 = v18;
    [v8 setTransform:&v17];

    v9 = [(NTKWhistlerAnalogFaceView *)self timeView];
    CGAffineTransform v17 = v18;
    [v9 setTransform:&v17];

    objc_super v10 = [(NTKWhistlerAnalogFaceView *)self complicationContainerView];
    CGAffineTransform v17 = v18;
    [v10 setTransform:&v17];

    NTKAlphaForRubberBandingFraction();
    double v12 = v11;
    [(NTKWhistlerAnalogFaceView *)self _contentAlphaForEditMode:10];
    double v14 = v12 * v13;
    v15 = [(NTKWhistlerAnalogFaceView *)self contentView];
    [v15 setAlpha:v14];

    int64_t v16 = [(NTKWhistlerAnalogFaceView *)self complicationContainerView];
    [v16 setAlpha:v14];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKWhistlerAnalogFaceView;
  -[NTKWhistlerAnalogFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeScale(&v12, v7, v7);
    int64_t v8 = [(NTKWhistlerAnalogFaceView *)self contentView];
    CGAffineTransform v11 = v12;
    [v8 setTransform:&v11];

    v9 = [(NTKWhistlerAnalogFaceView *)self timeView];
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];

    objc_super v10 = [(NTKWhistlerAnalogFaceView *)self complicationContainerView];
    CGAffineTransform v11 = v12;
    [v10 setTransform:&v11];
  }
}

- (void)_applyEnteringEditingWithTransitionFraction:(double)a3
{
  dialView = self->_dialView;
  [(NTKWhistlerAnalogFaceView *)self _paddedBezelAngularWidth];

  -[NTKCircularAnalogDialView transitInvisibleTicksAlphaWithBezelTextWidthInRadius:invisbleTicksAlpha:](dialView, "transitInvisibleTicksAlphaWithBezelTextWidthInRadius:invisbleTicksAlpha:");
}

- (void)_applyExitingEditingWithTransitionFraction:(double)a3
{
  dialView = self->_dialView;
  [(NTKWhistlerAnalogFaceView *)self _paddedBezelAngularWidth];

  -[NTKCircularAnalogDialView transitInvisibleTicksAlphaWithBezelTextWidthInRadius:invisbleTicksAlpha:](dialView, "transitInvisibleTicksAlphaWithBezelTextWidthInRadius:invisbleTicksAlpha:");
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory complicationPickerStyleForSlot:a3];
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  CGFloat v7 = [(NTKWhistlerAnalogFaceView *)self _richComplicationViewForView:v6];
  if ([v7 family] == &dword_8) {
    a4 = CLKUIAssociatedNonAccentStyle();
  }
  v10.receiver = self;
  v10.super_class = (Class)NTKWhistlerAnalogFaceView;
  int64_t v8 = [(NTKWhistlerAnalogFaceView *)&v10 filtersForView:v6 style:a4];

  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8 = a3;
  v9 = [(NTKWhistlerAnalogFaceView *)self _richComplicationViewForView:v8];
  if ([v9 family] == &dword_8) {
    a4 = CLKUIAssociatedNonAccentStyle();
  }
  v12.receiver = self;
  v12.super_class = (Class)NTKWhistlerAnalogFaceView;
  objc_super v10 = [(NTKWhistlerAnalogFaceView *)&v12 filtersForView:v8 style:a4 fraction:a5];

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8 = a3;
  v9 = [(NTKWhistlerAnalogFaceView *)self _richComplicationViewForView:v8];
  if ([v9 family] == &dword_8) {
    a4 = CLKUIAssociatedNonAccentStyle();
  }
  v12.receiver = self;
  v12.super_class = (Class)NTKWhistlerAnalogFaceView;
  objc_super v10 = [(NTKWhistlerAnalogFaceView *)&v12 filterForView:v8 style:a4 fraction:a5];

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  CGFloat v7 = [(NTKWhistlerAnalogFaceView *)self _richComplicationViewForView:v6];
  if ([v7 family] == &dword_8) {
    a4 = CLKUIAssociatedNonAccentStyle();
  }
  v10.receiver = self;
  v10.super_class = (Class)NTKWhistlerAnalogFaceView;
  id v8 = [(NTKWhistlerAnalogFaceView *)&v10 filterForView:v6 style:a4];

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CGFloat v7 = [(NTKWhistlerAnalogFaceView *)self _richComplicationViewForView:v6];
  BOOL v8 = [v7 family] != &dword_8 && v4;
  v11.receiver = self;
  v11.super_class = (Class)NTKWhistlerAnalogFaceView;
  v9 = [(NTKWhistlerAnalogFaceView *)&v11 colorForView:v6 accented:v8];

  return v9;
}

- (BOOL)viewShouldIgnoreTwoPieceImage:(id)a3
{
  double v3 = [(NTKWhistlerAnalogFaceView *)self _richComplicationViewForView:a3];
  BOOL v4 = [v3 family] == &dword_8;

  return v4;
}

- (id)_richComplicationViewForView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
    }
    else
    {
      id v6 = [v4 superview];
      id v5 = [(NTKWhistlerAnalogFaceView *)self _richComplicationViewForView:v6];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_isComplicationSlotInsideDial:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:NTKComplicationSlot1] & 1) != 0
    || ([v3 isEqualToString:NTKComplicationSlot2] & 1) != 0
    || ([v3 isEqualToString:NTKComplicationSlot3] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:NTKComplicationSlotBezel];
  }

  return v4;
}

- (BOOL)_wantsDimWithDesaturationFilterDuringComplicationEditing
{
  v2 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
  unsigned __int8 v3 = [v2 isWhiteColor];

  return v3;
}

- (id)_additonalViewsToApplyDesaturationDuringComplicationEditing
{
  dialView = self->_dialView;
  v2 = +[NSArray arrayWithObjects:&dialView count:1];

  return v2;
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 applyHandsTransition:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  [(NTKCircularAnalogDialView *)self->_dialView applyColorTransitionFraction:v10 fromFaceColorPalette:v11 toFaceColorPalette:a3];
  id v51 = v11;
  if (v6)
  {
    uint64_t v12 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette handStrokeColorForColorPalette:v10];
    uint64_t v13 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette handStrokeColorForColorPalette:v11];
    uint64_t v14 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette handFillColorForColorPalette:v10];
    v15 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette handFillColorForColorPalette:v11];
    v48 = (void *)v13;
    v49 = (void *)v12;
    v47 = (void *)v14;
    if (([v10 isWhiteColor] & 1) != 0 || objc_msgSend(v11, "isWhiteColor"))
    {
      int64_t v16 = [(NTKWhistlerAnalogFaceView *)self timeView];
      [v16 applyHourMinuteHandsTransitionFraction:v12 fromStrokeColor:v14 fromFillColor:v13 toStrokeColor:v15 toFillColor:a3];
    }
    else
    {
      int64_t v16 = NTKInterpolateBetweenColors();
      CGAffineTransform v17 = NTKInterpolateBetweenColors();
      CGAffineTransform v18 = [(NTKWhistlerAnalogFaceView *)self timeView];
      [v18 applyHourMinuteHandsStrokeColor:v16 fillColor:v17];

      id v11 = v51;
    }

    objc_super v19 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette secondHandColorForColorPalette:v10];
    objc_super v20 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette secondHandColorForColorPalette:v11];
    id v21 = NTKInterpolateBetweenColors();
    v22 = [(NTKWhistlerAnalogFaceView *)self timeView];
    [v22 applySecondHandColor:v21];

    v23 = [(NTKWhistlerAnalogFaceView *)self timeView];
    id v24 = [v23 secondHandView];
    v25 = +[UIColor blackColor];
    [v24 setHandDotColor:v25];

    id v11 = v51;
  }
  uint64_t v26 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette complicationForegroundColorPalette:v10];
  id v27 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette complicationForegroundColorPalette:v11];
  v50 = (void *)v26;
  v28 = NTKInterpolateBetweenColors();
  [(NTKWhistlerAnalogFaceView *)self setInterpolatedComplicationColor:v28];
  if ([v10 isBlackColor]) {
    unsigned int v29 = 1;
  }
  else {
    unsigned int v29 = [v10 isWhiteColor];
  }
  if ([v11 isBlackColor]) {
    unsigned int v30 = 1;
  }
  else {
    unsigned int v30 = [v11 isWhiteColor];
  }
  [(NTKWhistlerAnalogFaceView *)self setComplicationColor:v28];
  if ([(NTKWhistlerAnalogFaceView *)self monochromeRichComplicationsEnabled])
  {
    double v31 = 0.0;
    if ((v29 & v30) == 0) {
      double v31 = a3;
    }
    v58[1] = 3221225472;
    v58[0] = _NSConcreteStackBlock;
    v58[2] = sub_6ABC;
    v58[3] = &unk_C320;
    v58[4] = self;
    char v59 = v29 ^ v30;
    if (!(v30 & (v29 ^ v30) ^ 1 | v29)) {
      double v31 = 1.0 - a3;
    }
    char v60 = v29 & v30;
    *(double *)&v58[5] = v31;
    [(NTKWhistlerAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v58];
  }
  v32 = [(NTKWhistlerAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBezel];
  v33 = [v32 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([(NTKWhistlerAnalogFaceView *)self monochromeRichComplicationsEnabled])
    {
      v35 = [(NTKWhistlerAnalogFaceView *)self _platterTextColorForEditMode:[(NTKWhistlerAnalogFaceView *)self _editMode] colorPalette:v10];
      [(NTKWhistlerAnalogFaceView *)self _platterTextColorForEditMode:[(NTKWhistlerAnalogFaceView *)self _editMode] colorPalette:v11];
    }
    else
    {
      v35 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette complicationForegroundColorPalette:v10];
      [(NTKWhistlerAnalogColorPalette *)self->_colorPalette complicationForegroundColorPalette:v11];
    v36 = };
    v37 = NTKInterpolateBetweenColors();
    v38 = [v32 display];
    [v38 setForegroundColor:v37];

    id v11 = v51;
  }
  [(NTKWhistlerAnalogFaceView *)self _bezelLabelCurvedRadiusForColor:v10];
  [(NTKWhistlerAnalogFaceView *)self _bezelLabelCurvedRadiusForColor:v11];
  CLKInterpolateBetweenFloatsClipped();
  self->_bezelLabelCurvedRadius = v39;
  v40 = [v32 display];
  unsigned int v41 = [v40 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationBezelView];

  if (v41)
  {
    v42 = [v32 display];
    v43 = [(NTKWhistlerAnalogFaceView *)self _bezelTextColorForEditMode:[(NTKWhistlerAnalogFaceView *)self _editMode] colorPalette:v10];
    v44 = [(NTKWhistlerAnalogFaceView *)self _bezelTextColorForEditMode:[(NTKWhistlerAnalogFaceView *)self _editMode] colorPalette:v11];
    v45 = NTKInterpolateBetweenColors();
    if (objc_opt_respondsToSelector())
    {
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_6B80;
      v55[3] = &unk_C348;
      id v56 = v45;
      v57 = self;
      [v42 updatePropertiesAsGroupWithHandler:v55];
    }
    else
    {
      [v42 setBezelTextColor:v45];
      [v42 setBezelTextRadius:self->_bezelLabelCurvedRadius];
    }

    id v11 = v51;
  }
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_6BE8;
  v52[3] = &unk_C370;
  v52[4] = self;
  id v53 = v10;
  double v54 = a3;
  id v46 = v10;
  [(NTKWhistlerAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v52];
}

- (void)_configureUIOnColorChange
{
  id v4 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
  unsigned __int8 v3 = [(NTKWhistlerAnalogFaceView *)self faceColorPalette];
  [(NTKWhistlerAnalogFaceView *)self _applyTransitionFraction:v4 fromColorPalette:v3 toColorPalette:0.0];
}

- (double)_handAlphaForEditMode:(int64_t)a3
{
  if (a3) {
    BOOL v3 = a3 == 10;
  }
  else {
    BOOL v3 = 1;
  }
  double result = 0.1;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  if (a3) {
    BOOL v3 = a3 == 10;
  }
  else {
    BOOL v3 = 1;
  }
  double result = 0.1;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (double)_dialTextBackgroundAlphaForEditMode:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 10) {
    return 1.0;
  }
  return result;
}

- (int64_t)_richComplicationViewThemeFromFaceColorPalette:(id)a3
{
  return [a3 isWhiteColor] ^ 1;
}

- (int64_t)_editMode
{
  [(NTKWhistlerAnalogFaceView *)self editModeTransitionFraction];
  if (v3 <= 0.5)
  {
    return (int64_t)[(NTKWhistlerAnalogFaceView *)self fromEditMode];
  }
  else
  {
    return (int64_t)[(NTKWhistlerAnalogFaceView *)self toEditMode];
  }
}

- (id)_bezelTextColorForEditMode:(int64_t)a3 colorPalette:(id)a4
{
  id v6 = a4;
  if (a3 == 10)
  {
    uint64_t v7 = +[UIColor clearColor];
  }
  else
  {
    if (a3 == 1) {
      +[UIColor whiteColor];
    }
    else {
    uint64_t v7 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette bezelTextColorForColorPalette:v6];
    }
  }
  BOOL v8 = (void *)v7;

  return v8;
}

- (id)_platterTextColorForEditMode:(int64_t)a3 colorPalette:(id)a4
{
  if (a3 == 1) {
    +[UIColor whiteColor];
  }
  else {
  id v4 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette platterTextColorForColorPalette:a4];
  }

  return v4;
}

- (double)_bezelCircularBackgroundFromComplication:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 complicationType];
  double result = 0.0;
  if (v3 > 0x2D || ((1 << v3) & 0x200000004012) == 0) {
    return 1.0;
  }
  return result;
}

- (double)_bezelLabelCurvedRadiusForColor:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKWhistlerAnalogFaceView *)self device];
  double v6 = sub_4F38(v5);
  double v8 = v7;

  LODWORD(v5) = [v4 isWhiteColor];
  if (v5) {
    return v6;
  }
  else {
    return v8;
  }
}

- (void)_updateDialTicksForBezelText
{
  if (([(NTKWhistlerAnalogFaceView *)self editing] & 1) == 0)
  {
    dialView = self->_dialView;
    [(NTKWhistlerAnalogFaceView *)self _paddedBezelAngularWidth];
    double v5 = v4;
    [(NTKWhistlerAnalogFaceView *)self _paddedBezelAngularWidth];
    [(NTKCircularAnalogDialView *)dialView transitTicksWithInitialBezelTextWidthInRadius:v5 finalBezelTextWidthInRadius:v6 fraction:1.0];
  }
}

- (double)_paddedBezelAngularWidth
{
  unint64_t v3 = [(NTKWhistlerAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBezel];
  double v4 = [v3 display];
  unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationBezelView];

  double v6 = 0.0;
  if (v5)
  {
    double v7 = [v3 display];
    [v7 bezelTextAngularWidth];
    double v6 = v8;
    if (v8 > 0.0)
    {
      v9 = [(NTKWhistlerAnalogFaceView *)self device];
      NTKWhistlerBezelCircularViewDefaultAngularWidthPadding();
      double v6 = v6 + v10;
    }
  }

  return v6;
}

- (void)complicationDisplayWrapperView:(id)a3 updateCustomDataAnimationFromEarlierView:(id)a4 laterView:(id)a5 isForward:(BOOL)a6 animationType:(unint64_t)a7 animationDuration:(double)a8 animationFraction:(float)a9
{
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v29.receiver = self;
  v29.super_class = (Class)NTKWhistlerAnalogFaceView;
  *(float *)&double v19 = a9;
  [(NTKWhistlerAnalogFaceView *)&v29 complicationDisplayWrapperView:v16 updateCustomDataAnimationFromEarlierView:v17 laterView:v18 isForward:v12 animationType:a7 animationDuration:a8 animationFraction:v19];
  if ([v16 family] == (char *)&dword_8 + 1)
  {
    objc_initWeak(&location, self);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_7248;
    uint64_t v26 = &unk_C398;
    objc_copyWeak(&v27, &location);
    objc_super v20 = objc_retainBlock(&v23);
    id v21 = objc_opt_class();
    *(float *)&double v22 = a9;
    objc_msgSend(v21, "updateCustomDataAnimationFromEarlierView:laterView:isForward:animationType:animationDuration:animationFraction:bezelTextUpdateHandler:", v17, v18, v12, a7, v20, a8, v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

- (void)bezelViewDidBecomeInteractive:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NTKWhistlerAnalogFaceView *)self timeView];
  double v6 = [v5 layer];
  [v6 setAllowsGroupOpacity:1];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_73D4;
  v8[3] = &unk_C3E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[UIView animateWithDuration:4 delay:v8 options:&stru_C428 animations:0.3 completion:0.0];
}

- (void)bezelViewDidEndInteractive:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_75D8;
  v4[3] = &unk_C490;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_7654;
  v3[3] = &unk_C4B8;
  v3[4] = self;
  +[UIView animateWithDuration:4 delay:v4 options:v3 animations:0.3 completion:0.0];
}

- (void)_reorderSwitcherSnapshotView
{
  unint64_t v3 = [(NTKWhistlerAnalogFaceView *)self switcherSnapshotView];

  if (v3)
  {
    id v4 = [(NTKWhistlerAnalogFaceView *)self switcherSnapshotView];
    [(NTKWhistlerAnalogFaceView *)self bringSubviewToFront:v4];
  }
}

- (void)_setupDialView
{
  id v17 = [(NTKWhistlerAnalogFaceView *)self contentView];
  unint64_t v3 = [(NTKWhistlerAnalogFaceView *)self device];
  sub_4F38(v3);

  [v17 bounds];
  id v4 = [(NTKWhistlerAnalogFaceView *)self device];
  CLKSizeCenteredInRectForDevice();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_alloc((Class)NTKCircularAnalogDialView);
  uint64_t v14 = [(NTKWhistlerAnalogFaceView *)self device];
  v15 = (NTKCircularAnalogDialView *)objc_msgSend(v13, "initWithFrame:forDevice:", v14, v6, v8, v10, v12);
  dialView = self->_dialView;
  self->_dialView = v15;

  [v17 addSubview:self->_dialView];
}

- (unint64_t)dateStyle
{
  return self->_dateStyle;
}

- (void)setDateStyle:(unint64_t)a3
{
  self->_dateStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blackPalette, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_dialView, 0);

  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
}

@end