@interface NTKWhistlerDigitalFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_wantsStatusBarIconShadow;
- (NSArray)complicationPlaceholderViews;
- (NSArray)digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
- (NSCache)swatchesCache;
- (NTKFace)swatchesFace;
- (NTKFaceViewController)swatchesFaceViewController;
- (NTKGradientComposedView)composedView;
- (NTKInterpolatedColorPalette)editingComplicationsPalette;
- (NTKMonochromeModel)bottomFilterProvider;
- (NTKMonochromeModel)centerFilterProvider;
- (NTKMonochromeModel)topFilterProvider;
- (NTKWhistlerDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)_nonTimeLabelViewAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (double)monochromeFraction;
- (double)tintedFraction;
- (id)_defaultDateAccentColor;
- (id)_defaultDateTextColor;
- (id)_digitalTimeLabelFont;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_filterProviderForSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_paletteApplyingTritiumFractionToPalette:(id)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)complicationFamilyForSlot:(id)a3;
- (unint64_t)_timeLabelOptions;
- (unint64_t)backgroundStyle;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyColorsFromPalette:(id)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadLayoutRules;
- (void)_loadLayoutRulesForState:(int64_t)a3 withTopGap:(double)a4 largeModuleHeight:(double)a5;
- (void)_loadSnapshotContentViews;
- (void)_setNumerals:(unint64_t)a3;
- (void)_unloadSnapshotContentViews;
- (void)_updateLocale;
- (void)dealloc;
- (void)invalidateDigitalTimeLabelStyle;
- (void)loadComplicationPlaceholderViews;
- (void)rectangularViewDidBecomeInteractive:(id)a3;
- (void)rectangularViewDidEndInteractive:(id)a3;
- (void)sensitiveUIStateChanged;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setComposedView:(id)a3;
- (void)setDigitalTimeLabelFontScaleFactorForNumberSystemOverrides:(id)a3;
- (void)setEditingComplicationsPalette:(id)a3;
- (void)setMonochromeFraction:(double)a3;
- (void)setTintedFraction:(double)a3;
- (void)updateWithColorPalette:(id)a3;
@end

@implementation NTKWhistlerDigitalFaceView

- (NTKWhistlerDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (NTKMonochromeModel *)[objc_alloc((Class)NTKMonochromeModel) initWithDevice:v9];
  topFilterProvider = self->_topFilterProvider;
  self->_topFilterProvider = v10;

  v12 = (NTKMonochromeModel *)[objc_alloc((Class)NTKMonochromeModel) initWithDevice:v9];
  centerFilterProvider = self->_centerFilterProvider;
  self->_centerFilterProvider = v12;

  v14 = (NTKMonochromeModel *)[objc_alloc((Class)NTKMonochromeModel) initWithDevice:v9];
  bottomFilterProvider = self->_bottomFilterProvider;
  self->_bottomFilterProvider = v14;

  self->_numberSystem = -1;
  v19.receiver = self;
  v19.super_class = (Class)NTKWhistlerDigitalFaceView;
  v16 = [(NTKWhistlerDigitalFaceView *)&v19 initWithFaceStyle:a3 forDevice:v9 clientIdentifier:v8];

  v17 = +[CLKSensitiveUIMonitor sharedMonitor];
  [v17 addSensitiveUIObserver:v16];

  return v16;
}

- (id)createFaceColorPalette
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15788);
  id WeakRetained = objc_loadWeakRetained(&qword_15790);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = [(NTKWhistlerDigitalFaceView *)self device];
    id v6 = objc_loadWeakRetained(&qword_15790);
    if (v5 == v6)
    {
      v7 = [(NTKWhistlerDigitalFaceView *)self device];
      id v8 = [v7 version];
      uint64_t v9 = qword_15798;

      if (v8 == (id)v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v10 = [(NTKWhistlerDigitalFaceView *)self device];
  objc_storeWeak(&qword_15790, v10);

  id v11 = objc_loadWeakRetained(&qword_15790);
  qword_15798 = (uint64_t)[v11 version];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2D00;
  v15[3] = &unk_10560;
  v15[4] = self;
  v12 = [(NTKWhistlerDigitalFaceView *)self device];
  ((void (*)(void *, void *))sub_2D00)(v15, v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15788);
  id v13 = objc_alloc_init((Class)NTKGossamerColorPalette);
  objc_msgSend(v13, "setApproximateComplicationPositions:", *(double *)&qword_15770, *(double *)&qword_15778, *(double *)&qword_15780);
  [v13 setBackgroundStyle:self->_backgroundStyle];

  return v13;
}

- (id)_paletteApplyingTritiumFractionToPalette:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  double paletteTritiumFraction = self->_paletteTritiumFraction;
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

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];

  id v4 = +[CLKSensitiveUIMonitor sharedMonitor];
  [v4 removeSensitiveUIObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NTKWhistlerDigitalFaceView;
  [(NTKWhistlerDigitalFaceView *)&v5 dealloc];
}

- (NSArray)digitalTimeLabelFontScaleFactorForNumberSystemOverrides
{
  digitalTimeLabelFontScaleFactorForNumberSystemOverrides = self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
  if (!digitalTimeLabelFontScaleFactorForNumberSystemOverrides)
  {
    self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides = (NSArray *)&off_11760;

    digitalTimeLabelFontScaleFactorForNumberSystemOverrides = self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
  }

  return digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = [(NTKWhistlerDigitalFaceView *)self _digitalTimeLabelFont];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = [(NTKWhistlerDigitalFaceView *)self device];
  sub_30F4(v10, &v15);

  long long v11 = v16;
  v12 = [(NTKWhistlerDigitalFaceView *)self device];
  id v13 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, v9, v12, x, y, width, height, v11);

  return v13;
}

- (id)_digitalTimeLabelFont
{
  v3 = [(NTKWhistlerDigitalFaceView *)self device];
  sub_30F4(v3, v13);
  double v4 = *(double *)&v13[31];

  objc_super v5 = [(NTKWhistlerDigitalFaceView *)self device];
  int v6 = NTKShowIndicScriptNumerals();

  if (v6)
  {
    if (self->_numberSystem != -1)
    {
      id v7 = [(NTKWhistlerDigitalFaceView *)self digitalTimeLabelFontScaleFactorForNumberSystemOverrides];
      id v8 = [v7 objectAtIndexedSubscript:self->_numberSystem];
      [v8 doubleValue];

      uint64_t v9 = [(NTKWhistlerDigitalFaceView *)self device];
      CLKRoundForDevice();
      double v4 = v10;
    }
    long long v11 = +[NTKSFCompactFont numericRoundedFontOfSize:v4 weight:UIFontWeightRegular];
  }
  else
  {
    long long v11 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v4 design:UIFontWeightRegular];
  }

  return v11;
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_backgroundStyle != 0;
}

- (double)_verticalPaddingForStatusBar
{
  v8.receiver = self;
  v8.super_class = (Class)NTKWhistlerDigitalFaceView;
  [(NTKWhistlerDigitalFaceView *)&v8 _verticalPaddingForStatusBar];
  double v4 = v3;
  if (self->_backgroundStyle == 1)
  {
    objc_super v5 = [(NTKWhistlerDigitalFaceView *)self device];
    sub_30F4(v5, v7);
    double v4 = v4 + v7[41];
  }
  return v4;
}

- (void)_loadSnapshotContentViews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKWhistlerDigitalFaceView;
  [(NTKWhistlerDigitalFaceView *)&v8 _loadSnapshotContentViews];
  double v3 = [(NTKWhistlerDigitalFaceView *)self device];
  if (!self->_composedView && NTKShowGossamerUI())
  {
    double v4 = [(NTKWhistlerDigitalFaceView *)self rootContainerView];
    [v4 removeFromSuperview];
    objc_super v5 = (NTKGradientComposedView *)[objc_alloc((Class)NTKGradientComposedView) initWithDevice:v3];
    composedView = self->_composedView;
    self->_composedView = v5;

    [(NTKGradientComposedView *)self->_composedView setRootContainerView:v4];
    [(NTKWhistlerDigitalFaceView *)self addSubview:self->_composedView];
  }
  [(NTKWhistlerDigitalFaceView *)self _updateLocale];
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_updateLocale" name:NSCurrentLocaleDidChangeNotification object:0];
}

- (void)invalidateDigitalTimeLabelStyle
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWhistlerDigitalFaceView;
  [(NTKWhistlerDigitalFaceView *)&v4 invalidateDigitalTimeLabelStyle];
  double v3 = [(NTKWhistlerDigitalFaceView *)self timeView];
  [v3 setForcedNumberSystem:self->_numberSystem];
}

- (void)_unloadSnapshotContentViews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKWhistlerDigitalFaceView;
  [(NTKWhistlerDigitalFaceView *)&v8 _unloadSnapshotContentViews];
  composedView = self->_composedView;
  if (composedView)
  {
    [(NTKGradientComposedView *)composedView removeFromSuperview];
    objc_super v4 = self->_composedView;
    self->_composedView = 0;

    objc_super v5 = [(NTKWhistlerDigitalFaceView *)self rootContainerView];
    [v5 removeFromSuperview];
    int v6 = [(NTKWhistlerDigitalFaceView *)self timeView];
    [(NTKWhistlerDigitalFaceView *)self insertSubview:v5 aboveSubview:v6];
  }
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  if ([a5 isEqualToString:NTKComplicationSlotDate])
  {
    if ([v8 complicationType])
    {
      id v9 = objc_alloc((Class)NTKDateComplicationLabel);
      double v10 = [(NTKWhistlerDigitalFaceView *)self device];
      id v11 = [v9 initWithSizeStyle:1 accentType:1 forDevice:v10];

      v12 = [(NTKWhistlerDigitalFaceView *)self device];
      sub_30F4(v12, v27);
      id v13 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v28 design:UIFontWeightSemibold];

      [v11 setFont:v13];
      [v11 setTextAlignment:2];
      v14 = [(NTKWhistlerDigitalFaceView *)self device];
      int v15 = NTKShowGossamerUI();

      long long v16 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
      long long v17 = v16;
      if (v15)
      {
        long long v18 = [v16 dateLabelTextColor];
        long long v19 = [v17 dateLabelAccentColor];
      }
      else
      {
        unsigned int v22 = [v16 isMulticolor];

        if (v22)
        {
          long long v18 = [(NTKWhistlerDigitalFaceView *)self _defaultDateTextColor];
        }
        else
        {
          long long v23 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
          long long v18 = [v23 primaryColor];
        }
        long long v19 = [(NTKWhistlerDigitalFaceView *)self _defaultDateAccentColor];
      }
      [v11 setTextColor:v18];
      [v11 setAccentColor:v19];
      long long v24 = [(NTKWhistlerDigitalFaceView *)self device];
      sub_30F4(v24, v26);
      objc_msgSend(v11, "setTouchEdgeInsets:", v26[32], v26[33], v26[34], v26[35]);
    }
    else
    {
      id v11 = objc_alloc_init((Class)NTKUtilityComplicationView);
      long long v21 = [(NTKWhistlerDigitalFaceView *)self device];
      sub_30F4(v21, v29);
      [v11 setMinimumWidth:v30];

      [v11 setHidden:1];
    }
  }
  else
  {
    if (a4 == 10)
    {
      long long v20 = NTKRichComplicationCircularBaseView;
    }
    else
    {
      if (a4 != 11)
      {
        id v11 = 0;
        goto LABEL_17;
      }
      long long v20 = NTKRichComplicationRectangularBaseView;
    }
    objc_msgSend(v20, "viewWithLegacyComplicationType:", objc_msgSend(v8, "complicationType"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_17:

  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 setDelegate:self];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v12;
    [v5 transitThemeFromTheme:1 toTheme:1 fraction:1.0];
    int v6 = [(NTKWhistlerDigitalFaceView *)self device];
    int v7 = NTKShowGossamerUI();

    if (v7)
    {
      if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationCircularView])
      {
        id v8 = +[UIColor clearColor];
        [v5 setPlatterColor:v8];
      }
      if ([v5 conformsToProtocol:&OBJC_PROTOCOL___CDRichComplicationTintedPlatterColorOverridable])objc_msgSend(v5, "setTintedFraction:", self->_tintedFraction); {
      double monochromeFraction = self->_monochromeFraction;
      }
    }
    else
    {
      if (![(NTKWhistlerDigitalFaceView *)self monochromeRichComplicationsEnabled])
      {
LABEL_14:

        goto LABEL_15;
      }
      double v10 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
      unsigned __int8 v11 = [v10 isMulticolor];

      if ((v11 & 1) == 0)
      {
        [v5 updateMonochromeColor];
        goto LABEL_14;
      }
      double monochromeFraction = 0.0;
    }
    [v5 transitionToMonochromeWithFraction:monochromeFraction];
    goto LABEL_14;
  }
LABEL_15:
}

- (id)_filterProviderForSlot:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKWhistlerDigitalFaceView *)self device];
  int v6 = NTKShowGossamerUI();

  if (v6)
  {
    if ([v4 isEqualToString:NTKComplicationSlotTopLeft])
    {
      int v7 = &OBJC_IVAR___NTKWhistlerDigitalFaceView__topFilterProvider;
LABEL_10:
      self = *(NTKWhistlerDigitalFaceView **)&self->NTKDigitalFaceView_opaque[*v7];
      goto LABEL_11;
    }
    if ([v4 isEqualToString:NTKComplicationSlotCenter])
    {
      int v7 = &OBJC_IVAR___NTKWhistlerDigitalFaceView__centerFilterProvider;
      goto LABEL_10;
    }
    if (([v4 isEqualToString:NTKComplicationSlotBottomLeft] & 1) != 0
      || ([v4 isEqualToString:NTKComplicationSlotBottomCenter] & 1) != 0
      || [v4 isEqualToString:NTKComplicationSlotBottomRight])
    {
      int v7 = &OBJC_IVAR___NTKWhistlerDigitalFaceView__bottomFilterProvider;
      goto LABEL_10;
    }
  }
LABEL_11:
  id v8 = self;

  return v8;
}

- (void)_loadLayoutRules
{
}

- (void)_loadLayoutRulesForState:(int64_t)a3 withTopGap:(double)a4 largeModuleHeight:(double)a5
{
  [(NTKWhistlerDigitalFaceView *)self bounds];
  double v8 = v7;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v64 = 0u;
  id v9 = [(NTKWhistlerDigitalFaceView *)self device];
  sub_30F4(v9, &v64);

  double v60 = *((double *)&v76 + 1);
  double v61 = *(double *)&v76;
  double v10 = *(double *)&v78;
  double v58 = *((double *)&v77 + 1);
  double v59 = *(double *)&v77;
  double v11 = *((double *)&v64 + 1);
  double v51 = *(double *)&v65;
  double v52 = *(double *)&v64;
  double v12 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v12 = *((double *)&v65 + 1);
  }
  double v54 = v12;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v11 = *((double *)&v65 + 1);
  }
  double v57 = v11;
  long long v13 = v70;
  long long v14 = v72;
  double v15 = *((double *)&v78 + 1);
  double v16 = v8 - *(double *)&v78 - *(double *)&v70;
  long long v17 = v73;
  long long v18 = [(NTKWhistlerDigitalFaceView *)self device];
  long long v19 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v18, 3, 3, v16, *((double *)&v13 + 1), v10, v15, v14, v17);

  long long v20 = [(NTKWhistlerDigitalFaceView *)self complicationLayoutforSlot:NTKComplicationSlotDate];
  [v20 setDefaultLayoutRule:v19 forState:a3];

  double v21 = *((double *)&v68 + 1);
  double v22 = *((double *)&v66 + 1);
  double v23 = *(double *)&v67;
  long long v24 = [(NTKWhistlerDigitalFaceView *)self device];
  double v53 = v21;
  long long v25 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v24, 3, 3, v21, a4 - v54, v22, v23, v61, v60, v59, v58);

  long long v26 = [(NTKWhistlerDigitalFaceView *)self complicationLayoutforSlot:NTKComplicationSlotTopLeft];
  [v26 setDefaultLayoutRule:v25 forState:a3];

  long long v27 = v82;
  long long v28 = v83;
  long long v29 = [(NTKWhistlerDigitalFaceView *)self device];
  [v29 screenBounds];
  double v30 = *((double *)&v67 + 1);
  CGFloat v32 = (v31 - *((double *)&v67 + 1)) * 0.5;

  v85.origin.double x = v32;
  v85.origin.double y = a4 - v54;
  double v56 = v23;
  v85.size.double width = v22;
  v85.size.double height = v23;
  double v33 = v57 + CGRectGetMaxY(v85);
  v34 = [(NTKWhistlerDigitalFaceView *)self device];
  v35 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v34, 3, 3, v32, v33, v30, a5, v27, v28);

  if (a3 == 3)
  {
    CGAffineTransformMakeScale(&v63, 0.9, 0.9);
    CGAffineTransform v62 = v63;
    [v35 setEditingTransform:&v62];
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v36 = v51;
  }
  else {
    double v36 = v52;
  }
  v37 = [(NTKWhistlerDigitalFaceView *)self complicationLayoutforSlot:NTKComplicationSlotCenter];
  [v37 setDefaultLayoutRule:v35 forState:a3];

  v86.origin.double x = v53;
  v86.origin.double y = v33;
  v86.size.double width = v30;
  v86.size.double height = a5;
  CGFloat v38 = v57 + CGRectGetMaxY(v86);
  v39 = [(NTKWhistlerDigitalFaceView *)self device];
  v40 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v39, 3, 3, v53, v38, v22, v56, v61, v60, v59, v58);

  v41 = [(NTKWhistlerDigitalFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottomLeft];
  [v41 setDefaultLayoutRule:v40 forState:a3];

  v87.origin.double x = v53;
  v87.origin.double y = v38;
  v87.size.double width = v22;
  v87.size.double height = v56;
  CGFloat v42 = v36 + CGRectGetMaxX(v87);
  v43 = [(NTKWhistlerDigitalFaceView *)self device];
  v44 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v43, 3, 3, v42, v38, v22, v56, v61, v60, v59, v58);

  v45 = [(NTKWhistlerDigitalFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottomCenter];
  [v45 setDefaultLayoutRule:v44 forState:a3];

  v88.origin.double x = v42;
  v88.origin.double y = v38;
  v88.size.double width = v22;
  v88.size.double height = v56;
  double v46 = v36 + CGRectGetMaxX(v88);
  v47 = [(NTKWhistlerDigitalFaceView *)self device];
  v48 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v47, 3, 3, v46, v38, v22, v56, v61, v60, v59, v58);

  v49 = [(NTKWhistlerDigitalFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottomRight];
  [v49 setDefaultLayoutRule:v48 forState:a3];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v15 = a3;
  double v7 = [(NTKWhistlerDigitalFaceView *)self device];
  int v8 = NTKShowGossamerUI();

  if (v8)
  {
    id v9 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
    double v10 = v9;
    if (self->_complicationPlaceholderViews) {
      [v9 setIsSwatchPreview:1];
    }
    switch(a4)
    {
      case 10:
        [(NTKWhistlerDigitalFaceView *)self _applyColorsFromPalette:v10];
        break;
      case 19:
        -[NTKWhistlerDigitalFaceView _setNumerals:](self, "_setNumerals:", [v15 numeralOption]);
        break;
      case 17:
        id v11 = [v15 backgroundStyle];
        [v10 setBackgroundStyle:v11];
        [(NTKWhistlerDigitalFaceView *)self setBackgroundStyle:v11];
        [(NTKWhistlerDigitalFaceView *)self _applyColorsFromPalette:v10];
        double v12 = [(NTKWhistlerDigitalFaceView *)self delegate];
        [v12 faceViewWantsComplicationKeylineFramesReloaded];

        long long v13 = [(NTKWhistlerDigitalFaceView *)self delegate];
        [v13 faceViewDidChangeWantsStatusBarIconShadow];

        long long v14 = [(NTKWhistlerDigitalFaceView *)self delegate];
        [v14 faceViewDidChangePaddingForStatusBar];

        break;
    }
  }
  else
  {
    if (a4 == 19)
    {
      -[NTKWhistlerDigitalFaceView _setNumerals:](self, "_setNumerals:", [v15 numeralOption]);
      goto LABEL_15;
    }
    if (a4 != 10) {
      goto LABEL_15;
    }
    double v10 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
    [(NTKWhistlerDigitalFaceView *)self updateWithColorPalette:v10];
  }

LABEL_15:
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  long long v13 = [(NTKWhistlerDigitalFaceView *)self device];
  int v14 = NTKShowGossamerUI();

  if (v14)
  {
    id v15 = [(NTKWhistlerDigitalFaceView *)self interpolatedColorPalette];
    double v16 = [v15 fromPalette];
    long long v17 = [v15 toPalette];
    if (self->_complicationPlaceholderViews)
    {
      [v16 setIsSwatchPreview:1];
      [v17 setIsSwatchPreview:1];
    }
    switch(a6)
    {
      case 10:
        unint64_t v23 = [(NTKWhistlerDigitalFaceView *)self backgroundStyle];
        [v16 setBackgroundStyle:v23];
        [v17 setBackgroundStyle:v23];
        [(NTKWhistlerDigitalFaceView *)self _applyColorsFromPalette:v15];
        break;
      case 19:
        id v24 = [v11 numeralOption];
        id v25 = [v12 numeralOption];
        if (v24 == v25)
        {
          [(NTKWhistlerDigitalFaceView *)self _setNumerals:v24];
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
          memset(&v35, 0, sizeof(v35));
          CGAffineTransformMakeScale(&v35, v30, v30);
          [(NTKWhistlerDigitalFaceView *)self _setNumerals:v24];
          double v31 = [(NTKWhistlerDigitalFaceView *)self timeView];
          [v31 setAlpha:v27];

          CGAffineTransform v34 = v35;
          CGFloat v32 = [(NTKWhistlerDigitalFaceView *)self timeView];
          CGAffineTransform v33 = v34;
          [v32 setTransform:&v33];
        }
        break;
      case 17:
        id v18 = [v11 backgroundStyle];
        id v19 = [v12 backgroundStyle];
        long long v20 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
        double v21 = [v20 pigmentEditOption];

        [v16 setPigmentEditOption:v21];
        [v16 setBackgroundStyle:v18];
        [v17 setPigmentEditOption:v21];
        [v17 setBackgroundStyle:v19];
        [v15 setTransitionFraction:a3];
        [(NTKWhistlerDigitalFaceView *)self _applyColorsFromPalette:v15];

        break;
    }
    goto LABEL_17;
  }
  if (a6 == 10)
  {
    id v15 = [(NTKWhistlerDigitalFaceView *)self interpolatedColorPalette];
    double v16 = [v15 fromPalette];
    long long v17 = [(NTKWhistlerDigitalFaceView *)self interpolatedColorPalette];
    double v22 = [v17 toPalette];
    [(NTKWhistlerDigitalFaceView *)self _applyTransitionFraction:v16 fromColorPalette:v22 toColorPalette:a3];

LABEL_17:
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  editingComplicationsPalette = self->_editingComplicationsPalette;
  if (a3 == 1)
  {
    if (!editingComplicationsPalette)
    {
      int v6 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
      id v7 = [v6 copy];
      [v7 setIsEditingComplications:1];
      int v8 = (NTKInterpolatedColorPalette *)[objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v6 toPalette:v7];
      id v9 = self->_editingComplicationsPalette;
      self->_editingComplicationsPalette = v8;

      editingComplicationsPalette = self->_editingComplicationsPalette;
    }
    [(NTKInterpolatedColorPalette *)editingComplicationsPalette setTransitionFraction:1.0];
    [(NTKWhistlerDigitalFaceView *)self _applyColorsFromPalette:self->_editingComplicationsPalette];
  }
  else if (editingComplicationsPalette)
  {
    self->_editingComplicationsPalette = 0;

    double v10 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
    [(NTKWhistlerDigitalFaceView *)self _applyColorsFromPalette:v10];
  }
  [(NTKWhistlerDigitalFaceView *)self _nonTimeLabelViewAlphaForEditMode:a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_47D4;
  v12[3] = &unk_105A8;
  v12[4] = v11;
  [(NTKWhistlerDigitalFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v12];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  editingComplicationsPalette = self->_editingComplicationsPalette;
  if (a4 == 1 || a5 == 1)
  {
    if (!editingComplicationsPalette)
    {
      double v10 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
      id v11 = [v10 copy];
      [v11 setIsEditingComplications:1];
      id v12 = (NTKInterpolatedColorPalette *)[objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v10 toPalette:v11];
      long long v13 = self->_editingComplicationsPalette;
      self->_editingComplicationsPalette = v12;
    }
    CLKInterpolateBetweenFloatsClipped();
    -[NTKInterpolatedColorPalette setTransitionFraction:](self->_editingComplicationsPalette, "setTransitionFraction:");
    [(NTKWhistlerDigitalFaceView *)self _applyColorsFromPalette:self->_editingComplicationsPalette];
  }
  else if (editingComplicationsPalette)
  {
    self->_editingComplicationsPalette = 0;

    id v9 = [(NTKWhistlerDigitalFaceView *)self faceColorPalette];
    [(NTKWhistlerDigitalFaceView *)self _applyColorsFromPalette:v9];
  }
  if (a4 == 19 || a5 == 19)
  {
    -[NTKWhistlerDigitalFaceView _nonTimeLabelViewAlphaForEditMode:](self, "_nonTimeLabelViewAlphaForEditMode:", a4, a3);
    [(NTKWhistlerDigitalFaceView *)self _nonTimeLabelViewAlphaForEditMode:a5];
    CLKInterpolateBetweenFloatsClipped();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_49D4;
    v15[3] = &unk_105A8;
    v15[4] = v14;
    [(NTKWhistlerDigitalFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v15];
  }
}

- (void)_applyColorsFromPalette:(id)a3
{
  id v4 = a3;
  id v5 = [v4 scaleFactor];
  [v5 doubleValue];
  CGFloat v7 = v6;

  memset(&v50, 0, sizeof(v50));
  CGAffineTransformMakeScale(&v50, v7, v7);
  int v8 = [(NTKWhistlerDigitalFaceView *)self rootContainerView];
  CGAffineTransform v49 = v50;
  [v8 setTransform:&v49];

  [(NTKGradientComposedView *)self->_composedView applyGossamerColorPalette:v4];
  id v9 = [v4 dateLabelTextColor];
  double v10 = [v4 dateLabelAccentColor];
  id v11 = [(NTKWhistlerDigitalFaceView *)self timeView];
  id v12 = [v4 timeLabelColor];
  [v11 setTextColor:v12];

  long long v13 = [v4 foregroundColor];
  topFilterProvider = self->_topFilterProvider;
  id v15 = [v4 topAccentColor];
  [(NTKMonochromeModel *)topFilterProvider setAccentColor:v15];

  [(NTKMonochromeModel *)self->_topFilterProvider setNonAccentColor:v13];
  double v16 = self->_topFilterProvider;
  long long v17 = [v4 topApproximateBackgroundColor];
  [(NTKMonochromeModel *)v16 setBackgroundColor:v17];

  centerFilterProvider = self->_centerFilterProvider;
  id v19 = [v4 centerAccentColor];
  [(NTKMonochromeModel *)centerFilterProvider setAccentColor:v19];

  [(NTKMonochromeModel *)self->_centerFilterProvider setNonAccentColor:v13];
  long long v20 = self->_centerFilterProvider;
  double v21 = [v4 centerApproximateBackgroundColor];
  [(NTKMonochromeModel *)v20 setBackgroundColor:v21];

  bottomFilterProvider = self->_bottomFilterProvider;
  unint64_t v23 = [v4 bottomAccentColor];
  [(NTKMonochromeModel *)bottomFilterProvider setAccentColor:v23];

  [(NTKMonochromeModel *)self->_bottomFilterProvider setNonAccentColor:v13];
  id v24 = self->_bottomFilterProvider;
  id v25 = [v4 bottomApproximateBackgroundColor];
  [(NTKMonochromeModel *)v24 setBackgroundColor:v25];

  double v26 = [v4 monochromeFraction];
  [v26 doubleValue];
  self->_double monochromeFraction = v27;

  id v28 = [v4 tintedFraction];
  [v28 doubleValue];
  self->_double tintedFraction = v29;

  double monochromeFraction = self->_monochromeFraction;
  double tintedFraction = self->_tintedFraction;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_4E28;
  v44[3] = &unk_105D0;
  double v47 = tintedFraction;
  double v48 = monochromeFraction;
  id v32 = v9;
  id v45 = v32;
  id v33 = v10;
  id v46 = v33;
  [(NTKWhistlerDigitalFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v44];
  if (self->_complicationPlaceholderViews)
  {
    CGAffineTransform v34 = [v4 swatchComplicationPlaceholderColor];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    CGAffineTransform v35 = self->_complicationPlaceholderViews;
    id v36 = [(NSArray *)v35 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v41;
      do
      {
        v39 = 0;
        do
        {
          if (*(void *)v41 != v38) {
            objc_enumerationMutation(v35);
          }
          objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * (void)v39), "setBackgroundColor:", v34, (void)v40);
          v39 = (char *)v39 + 1;
        }
        while (v37 != v39);
        id v37 = [(NSArray *)v35 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v37);
    }
  }
}

- (double)_nonTimeLabelViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 19) {
    return 1.0;
  }
  return result;
}

- (void)loadComplicationPlaceholderViews
{
  if (!self->_complicationPlaceholderViews)
  {
    double v3 = [(NTKWhistlerDigitalFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotTopLeft];
    id v4 = [(NTKWhistlerDigitalFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBottomLeft];
    id v5 = [(NTKWhistlerDigitalFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBottomCenter];
    double v6 = [(NTKWhistlerDigitalFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBottomRight];
    [v4 bounds];
    double v8 = v7 * 0.5;
    [v4 frame];
    double MinX = CGRectGetMinX(v51);
    [v6 frame];
    double MaxX = CGRectGetMaxX(v52);
    [v5 frame];
    double v11 = CGRectGetMinX(v53);
    [v4 frame];
    double v12 = v11 - CGRectGetMaxX(v54);
    [v4 frame];
    double MinY = CGRectGetMinY(v55);
    [v3 frame];
    double v14 = MinY - CGRectGetMaxY(v56) + v12 * -2.0;
    [v3 frame];
    double v15 = v12 + CGRectGetMaxY(v57);
    id v16 = objc_alloc((Class)UIView);
    v44 = v3;
    [v3 frame];
    id v17 = objc_msgSend(v16, "initWithFrame:");
    id v18 = objc_alloc((Class)UIView);
    long long v43 = v4;
    [v4 frame];
    id v19 = objc_msgSend(v18, "initWithFrame:");
    id v20 = objc_alloc((Class)UIView);
    long long v42 = v5;
    [v5 frame];
    id v21 = objc_msgSend(v20, "initWithFrame:");
    id v22 = objc_alloc((Class)UIView);
    long long v41 = v6;
    [v6 frame];
    id v23 = objc_msgSend(v22, "initWithFrame:");
    id v24 = [v17 layer];
    [v24 setCornerRadius:v8];

    id v25 = [v19 layer];
    [v25 setCornerRadius:v8];

    double v26 = [v21 layer];
    [v26 setCornerRadius:v8];

    double v27 = [v23 layer];
    [v27 setCornerRadius:v8];

    id v28 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", MinX, v15, MaxX - MinX, v14);
    double v29 = [v28 layer];
    [v29 setCornerRadius:8.0];

    v39 = v19;
    long long v40 = v17;
    v50[0] = v17;
    v50[1] = v28;
    v50[2] = v19;
    v50[3] = v21;
    v50[4] = v23;
    CGFloat v30 = +[NSArray arrayWithObjects:v50 count:5];
    complicationPlaceholderViews = self->_complicationPlaceholderViews;
    self->_complicationPlaceholderViews = v30;

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v32 = self->_complicationPlaceholderViews;
    id v33 = [(NSArray *)v32 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v46;
      do
      {
        id v36 = 0;
        do
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v36);
          uint64_t v38 = [(NTKWhistlerDigitalFaceView *)self complicationContainerView];
          [v38 addSubview:v37];

          id v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        id v34 = [(NSArray *)v32 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v34);
    }
  }
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 primaryColor];
  double v11 = [v9 primaryColor];
  double v12 = NTKInterpolateBetweenColors();
  [(NTKWhistlerDigitalFaceView *)self setInterpolatedComplicationColor:v12];
  if (([v8 isMulticolor] & 1) != 0 || objc_msgSend(v9, "isMulticolor"))
  {
    if ([v9 isMulticolor] && !objc_msgSend(v8, "isMulticolor")) {
      a3 = 1.0 - a3;
    }
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
  }
  if ([v9 isMulticolor]) {
    double v14 = v10;
  }
  else {
    double v14 = v11;
  }
  [(NTKWhistlerDigitalFaceView *)self setComplicationColor:v14];
  if ([(NTKWhistlerDigitalFaceView *)self monochromeRichComplicationsEnabled])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5488;
    v15[3] = &unk_105F8;
    v15[4] = self;
    char v16 = v13;
    *(double *)&void v15[5] = a3;
    [(NTKWhistlerDigitalFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v15];
  }
}

- (void)_setNumerals:(unint64_t)a3
{
  unint64_t v4 = CLKLocaleNumberSystemFromNumeralOption();
  if (self->_numberSystem != v4)
  {
    unint64_t v5 = v4;
    self->_numberSystem = v4;
    double v6 = [(NTKWhistlerDigitalFaceView *)self device];
    int v7 = NTKShowIndicScriptNumerals();

    if (v7)
    {
      id v8 = [(NTKWhistlerDigitalFaceView *)self timeView];
      [v8 setForcedNumberSystem:v5];

      [(NTKWhistlerDigitalFaceView *)self invalidateDigitalTimeLabelStyle];
      [(NTKWhistlerDigitalFaceView *)self setNeedsLayout];
    }
  }
}

- (void)sensitiveUIStateChanged
{
  unint64_t numberSystem = self->_numberSystem;
  unint64_t v4 = [(NTKWhistlerDigitalFaceView *)self device];
  int v5 = NTKShowIndicScriptNumerals();

  if (v5) {
    uint64_t v6 = numberSystem;
  }
  else {
    uint64_t v6 = -1;
  }
  [(NTKWhistlerDigitalFaceView *)self invalidateDigitalTimeLabelStyle];
  int v7 = [(NTKWhistlerDigitalFaceView *)self timeView];
  [v7 setForcedNumberSystem:v6];

  [(NTKWhistlerDigitalFaceView *)self setNeedsLayout];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a5;
  if (a4 != 19)
  {
    NTKLargeElementScaleForBreathingFraction();
    CGFloat v9 = v8;
    double v10 = [(NTKWhistlerDigitalFaceView *)self device];
    int v11 = NTKShowGossamerUI();

    if (v11)
    {
      double v12 = [(NTKWhistlerDigitalFaceView *)self composedView];
      CGAffineTransformMakeScale(&v15, v9, v9);
      char v13 = &v15;
    }
    else
    {
      double v12 = [(NTKWhistlerDigitalFaceView *)self rootContainerView];
      CGAffineTransformMakeScale(&v14, v9, v9);
      char v13 = &v14;
    }
    [v12 setTransform:v13];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKScaleForRubberBandingFraction();
  CGFloat v7 = v6;
  NTKAlphaForRubberBandingFraction();
  double v9 = v8;
  double v10 = [(NTKWhistlerDigitalFaceView *)self device];
  int v11 = NTKShowGossamerUI();

  if (v11)
  {
    double v12 = [(NTKWhistlerDigitalFaceView *)self composedView];
    CGAffineTransformMakeScale(&v17, v7, v7);
    [v12 setTransform:&v17];

    char v13 = [(NTKWhistlerDigitalFaceView *)self composedView];
  }
  else
  {
    CGAffineTransform v14 = [(NTKWhistlerDigitalFaceView *)self rootContainerView];
    CGAffineTransformMakeScale(&v16, v7, v7);
    [v14 setTransform:&v16];

    char v13 = [(NTKWhistlerDigitalFaceView *)self rootContainerView];
  }
  CGAffineTransform v15 = v13;
  [v13 setAlpha:v9];
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:NTKComplicationSlotCenter] & 1) != 0
    || [v4 isEqualToString:NTKComplicationSlotDate])
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKWhistlerDigitalFaceView;
    id v5 = [(NTKWhistlerDigitalFaceView *)&v7 _keylineStyleForComplicationSlot:v4];
  }
  else
  {
    id v5 = &dword_0 + 1;
  }

  return (int64_t)v5;
}

- (int64_t)complicationFamilyForSlot:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:NTKComplicationSlotTopLeft] & 1) != 0
    || ([v3 isEqualToString:NTKComplicationSlotBottomLeft] & 1) != 0
    || ([v3 isEqualToString:NTKComplicationSlotBottomCenter] & 1) != 0)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = [v3 isEqualToString:NTKComplicationSlotBottomRight] ^ 1;
  }

  return v4;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:NTKComplicationSlotCenter] & 1) != 0
    || [v4 isEqualToString:NTKComplicationSlotDate])
  {
    int64_t v5 = [(NTKWhistlerDigitalFaceView *)self complicationFamilyForSlot:v4];
    double v6 = [(NTKWhistlerDigitalFaceView *)self device];
    +[NTKModuleView cornerRadiusForComplicationFamily:v5 forDevice:v6];
    double v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NTKWhistlerDigitalFaceView;
    [(NTKWhistlerDigitalFaceView *)&v11 _keylineCornerRadiusForComplicationSlot:v4];
    double v8 = v9;
  }

  return v8;
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  unsigned int v3 = [a3 isEqual:NTKComplicationSlotCenter];
  id v4 = (double *)&NTKLargeElementMinimumBreathingScale;
  if (!v3) {
    id v4 = (double *)&NTKSmallElementMinimumBreathingScale;
  }
  return *v4;
}

- (void)rectangularViewDidBecomeInteractive:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5C18;
  v4[3] = &unk_10648;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[UIView animateWithDuration:4 delay:v4 options:&stru_10688 animations:0.3 completion:0.0];
}

- (void)rectangularViewDidEndInteractive:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_5DC8;
  v3[3] = &unk_106F0;
  v3[4] = self;
  +[UIView animateWithDuration:4 delay:v3 options:&stru_10710 animations:0.3 completion:0.0];
}

- (void)_updateLocale
{
  id v3 = +[NSLocale currentLocale];
  int v4 = CLKLocaleIs24HourMode();
  if (self->_is24HourMode != v4)
  {
    self->_is24HourMode = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5EEC;
    block[3] = &unk_106F0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  [(NTKWhistlerDigitalFaceView *)self _handleLocaleDidChange];
}

- (void)updateWithColorPalette:(id)a3
{
}

- (id)_defaultDateTextColor
{
  return +[UIColor systemRedColor];
}

- (id)_defaultDateAccentColor
{
  return +[UIColor whiteColor];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 17) {
    return &off_11778;
  }
  else {
    return 0;
  }
}

- (NSCache)swatchesCache
{
  swatchesCache = self->_swatchesCache;
  if (!swatchesCache)
  {
    int v4 = (NSCache *)objc_opt_new();
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
    int v4 = [(NTKWhistlerDigitalFaceView *)self device];
    id v5 = +[NTKFace defaultFaceOfStyle:29 forDevice:v4];
    double v6 = self->_swatchesFace;
    self->_swatchesFace = v5;

    double v7 = self->_swatchesFace;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_606C;
    v9[3] = &unk_10738;
    v9[4] = self;
    [(NTKFace *)v7 enumerateComplicationSlotsWithBlock:v9];
    swatchesFace = self->_swatchesFace;
  }

  return swatchesFace;
}

- (NTKFaceViewController)swatchesFaceViewController
{
  swatchesFaceViewController = self->_swatchesFaceViewController;
  if (!swatchesFaceViewController)
  {
    int v4 = [(NTKWhistlerDigitalFaceView *)self swatchesFace];
    id v5 = (NTKFaceViewController *)[objc_alloc((Class)NTKFaceViewController) initWithFace:v4 configuration:&stru_10778];
    double v6 = self->_swatchesFaceViewController;
    self->_swatchesFaceViewController = v5;

    [(NTKFaceViewController *)self->_swatchesFaceViewController freeze];
    double v7 = [(NTKFaceViewController *)self->_swatchesFaceViewController view];
    [v7 setNeedsLayout];

    double v8 = [(NTKFaceViewController *)self->_swatchesFaceViewController view];
    [v8 layoutIfNeeded];

    double v9 = [(NTKFaceViewController *)self->_swatchesFaceViewController faceView];
    [v9 loadComplicationPlaceholderViews];
    [v9 populateFaceViewEditOptionsFromFace:v4 forced:1];

    swatchesFaceViewController = self->_swatchesFaceViewController;
  }

  return swatchesFaceViewController;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = v9;
  if (a4 == 19)
  {
    objc_super v11 = [(NTKWhistlerDigitalFaceView *)self _digitalTimeLabelFont];
    double v12 = [(NTKWhistlerDigitalFaceView *)self device];
    id v15 = [v8 swatchImageWithFont:v11 device:v12 baseline:0.0];
  }
  else
  {
    if (a4 != 17)
    {
      v24.receiver = self;
      v24.super_class = (Class)NTKWhistlerDigitalFaceView;
      id v15 = [(NTKWhistlerDigitalFaceView *)&v24 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
      goto LABEL_10;
    }
    objc_super v11 = [v9 objectForKeyedSubscript:&off_12138];
    double v12 = [(NTKWhistlerDigitalFaceView *)self swatchesCache];
    char v13 = +[NSString stringWithFormat:@"%@-%@", v8, v11];
    CGAffineTransform v14 = [v12 objectForKey:v13];
    if (v14)
    {
      id v15 = v14;
    }
    else
    {
      CGAffineTransform v16 = [(NTKWhistlerDigitalFaceView *)self swatchesFaceViewController];
      CGAffineTransform v17 = [v16 faceView];
      id v18 = [(NTKWhistlerDigitalFaceView *)self swatchesFace];
      [v18 selectOption:v11 forCustomEditMode:10 slot:0];
      [v18 selectOption:v8 forCustomEditMode:17 slot:0];
      [v17 bounds];
      v26.double width = v19;
      v26.double height = v20;
      UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
      id v21 = [v17 layer];
      [v21 renderInContext:UIGraphicsGetCurrentContext()];

      id v22 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [v12 setObject:v22 forKey:v13];
      id v15 = v22;
    }
  }

LABEL_10:

  return v15;
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
  return (NTKGradientComposedView *)objc_getProperty(self, a2, 64, 1);
}

- (void)setComposedView:(id)a3
{
}

- (NTKInterpolatedColorPalette)editingComplicationsPalette
{
  return (NTKInterpolatedColorPalette *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEditingComplicationsPalette:(id)a3
{
}

- (NTKMonochromeModel)topFilterProvider
{
  return self->_topFilterProvider;
}

- (NTKMonochromeModel)centerFilterProvider
{
  return self->_centerFilterProvider;
}

- (NTKMonochromeModel)bottomFilterProvider
{
  return self->_bottomFilterProvider;
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

- (NSArray)complicationPlaceholderViews
{
  return self->_complicationPlaceholderViews;
}

- (void)setDigitalTimeLabelFontScaleFactorForNumberSystemOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides, 0);
  objc_storeStrong((id *)&self->_complicationPlaceholderViews, 0);
  objc_storeStrong((id *)&self->_bottomFilterProvider, 0);
  objc_storeStrong((id *)&self->_centerFilterProvider, 0);
  objc_storeStrong((id *)&self->_topFilterProvider, 0);
  objc_storeStrong((id *)&self->_editingComplicationsPalette, 0);
  objc_storeStrong((id *)&self->_composedView, 0);
  objc_storeStrong((id *)&self->_swatchesFaceViewController, 0);
  objc_storeStrong((id *)&self->_swatchesFace, 0);

  objc_storeStrong((id *)&self->_swatchesCache, 0);
}

@end