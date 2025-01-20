@interface NTKExtraLargeFaceView
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors;
- (BOOL)complicationIsVisible;
- (NSArray)smallTimeLabelFontScaleFactorForNumberSystemOverrides;
- (NTKDigitalTimeLabel)smallTimeLabel;
- (NTKExtraLargeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKExtraLargeTimeView)largeTimeLabel;
- (NTKFaceColorScheme)colorScheme;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_smallTimeAlphaForEditMode:(int64_t)a3;
- (double)_statusBarOffsetForComplication;
- (double)_statusBarOffsetForComplicationBackground;
- (double)_statusBarOffsetForSmallTime;
- (double)_verticalPaddingForStatusBar;
- (id)_complicationView;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_richComplicationSecondaryColor;
- (id)_smallTimeLabelFont;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyColor:(id)a3 toRichComplicationView:(id)a4 withFraction:(double)a5 isMonochrome:(BOOL)a6;
- (void)_applyComplicationTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)_applyDataMode;
- (void)_applyFaceColorToRichComplicationView:(id)a3;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureLargeTimeLabelColors;
- (void)_configureSmallTimeLabelColors;
- (void)_configureSmallTimeLabelStyle;
- (void)_createTimeViews;
- (void)_initLargeTimeLabelIfNecessary;
- (void)_initSmallTimeLabelIfNecessary;
- (void)_layoutForegroundContainerView;
- (void)_layoutSmallTimeLabel;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_noteComplicationVisibilityChanged;
- (void)_performWristRaiseAnimation;
- (void)_prepareForEditing;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_prepareWristRaiseAnimation;
- (void)_removeTimeViews;
- (void)_setNumerals:(unint64_t)a3;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationVisibility;
- (void)dealloc;
- (void)layoutSubviews;
- (void)sensitiveUIStateChanged;
- (void)setColorScheme:(id)a3;
- (void)setComplicationIsVisible:(BOOL)a3;
- (void)setLargeTimeLabel:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setSmallTimeLabel:(id)a3;
- (void)setSmallTimeLabelFontScaleFactorForNumberSystemOverrides:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKExtraLargeFaceView

- (NTKExtraLargeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKExtraLargeFaceView;
  v5 = [(NTKExtraLargeFaceView *)&v9 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  v6 = v5;
  if (v5)
  {
    v5->_numberSystem = -1;
    v7 = +[CLKSensitiveUIMonitor sharedMonitor];
    [v7 addSensitiveUIObserver:v6];
  }
  return v6;
}

- (NSArray)smallTimeLabelFontScaleFactorForNumberSystemOverrides
{
  smallTimeLabelFontScaleFactorForNumberSystemOverrides = self->_smallTimeLabelFontScaleFactorForNumberSystemOverrides;
  if (!smallTimeLabelFontScaleFactorForNumberSystemOverrides)
  {
    self->_smallTimeLabelFontScaleFactorForNumberSystemOverrides = (NSArray *)&off_10AD8;

    smallTimeLabelFontScaleFactorForNumberSystemOverrides = self->_smallTimeLabelFontScaleFactorForNumberSystemOverrides;
  }

  return smallTimeLabelFontScaleFactorForNumberSystemOverrides;
}

- (void)dealloc
{
  v3 = +[CLKSensitiveUIMonitor sharedMonitor];
  [v3 removeSensitiveUIObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKExtraLargeFaceView;
  [(NTKExtraLargeFaceView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  if (self->_snapshotContentViewsLoaded) {
    [(NTKExtraLargeFaceView *)self _updateComplicationVisibility];
  }
  [(NTKExtraLargeFaceView *)self _layoutForegroundContainerView];
  v3.receiver = self;
  v3.super_class = (Class)NTKExtraLargeFaceView;
  [(NTKExtraLargeFaceView *)&v3 layoutSubviews];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKExtraLargeFaceView;
  id v4 = a3;
  [(NTKExtraLargeFaceView *)&v8 traitCollectionDidChange:v4];
  v5 = [(NTKExtraLargeFaceView *)self traitCollection];
  id v6 = [v5 legibilityWeight];
  id v7 = [v4 legibilityWeight];

  if (v6 != v7)
  {
    [(NTKExtraLargeFaceView *)self _configureSmallTimeLabelStyle];
    [(NTKExtraLargeFaceView *)self setNeedsLayout];
  }
}

- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors
{
  return 1;
}

- (void)_loadSnapshotContentViews
{
  self->_snapshotContentViewsLoaded = 1;
}

- (void)_unloadSnapshotContentViews
{
  self->_snapshotContentViewsLoaded = 0;
}

- (double)_statusBarOffsetForSmallTime
{
  if (!self->_viewsOffsetForStatusBar) {
    return 0.0;
  }
  v2 = [(NTKExtraLargeFaceView *)self device];
  sub_5F88(v2, (uint64_t)v5);
  double v3 = v6;

  return v3;
}

- (double)_statusBarOffsetForComplication
{
  if (!self->_viewsOffsetForStatusBar) {
    return 0.0;
  }
  v2 = [(NTKExtraLargeFaceView *)self device];
  sub_5F88(v2, (uint64_t)v5);
  double v3 = v6;

  return v3;
}

- (double)_statusBarOffsetForComplicationBackground
{
  if (!self->_viewsOffsetForStatusBar) {
    return 0.0;
  }
  v2 = [(NTKExtraLargeFaceView *)self device];
  sub_5F88(v2, (uint64_t)v5);
  double v3 = v6;

  return v3;
}

- (void)_loadLayoutRules
{
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v3 = [(NTKExtraLargeFaceView *)self device];
  sub_5F88(v3, (uint64_t)&v23);

  long long v4 = v24;
  double v21 = *((double *)&v24 + 1);
  [(NTKExtraLargeFaceView *)self _statusBarOffsetForComplicationBackground];
  double v6 = *((double *)&v4 + 1) + v5;
  double v7 = *((double *)&v25 + 1);
  double v20 = *((double *)&v25 + 1);
  [(NTKExtraLargeFaceView *)self _statusBarOffsetForComplicationBackground];
  double v9 = v7 - v8;
  double v10 = *(double *)&v25;
  v11 = [(NTKExtraLargeFaceView *)self device];
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v11, 3, 3, *(double *)&v4, v6, v10, v9, UIEdgeInsetsZero.top, left, bottom, right);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = NTKComplicationSlotCenter;
  v16 = [(NTKExtraLargeFaceView *)self complicationLayoutforSlot:NTKComplicationSlotCenter];
  [v16 setDefaultLayoutRule:v22 forState:0];

  v17 = [(NTKExtraLargeFaceView *)self device];
  v18 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v17, 3, 3, *(double *)&v4, v21, v10, v20, UIEdgeInsetsZero.top, left, bottom, right);

  v19 = [(NTKExtraLargeFaceView *)self complicationLayoutforSlot:v15];
  [v19 setDefaultLayoutRule:v18 forState:1];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v7 = a5;
  double v8 = +[NTKComplicationModuleView smallModuleViewForComplicationType:](NTKComplicationModuleView, "smallModuleViewForComplicationType:", [a3 complicationType]);
  [(NTKExtraLargeFaceView *)self _configureComplicationView:v8 forSlot:v7];

  return v8;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v8;
    double v6 = [(NTKExtraLargeFaceView *)self device];
    sub_5F88(v6, (uint64_t)v9);
    [v5 setContentHeight:v10];

    [v5 setIsXL:1];
    id v7 = [(NTKExtraLargeFaceView *)self faceColorPalette];
    [v5 applyFaceColorPalette:v7 units:71];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NTKExtraLargeFaceView *)self _applyFaceColorToRichComplicationView:v8];
      [(NTKExtraLargeFaceView *)self _updateComplicationVisibility];
    }
  }
}

- (void)_applyFaceColorToRichComplicationView:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKExtraLargeFaceView *)self faceColorPalette];
  uint64_t v6 = [v5 isMulticolor] ^ 1;

  id v8 = [(NTKExtraLargeFaceView *)self faceColorPalette];
  id v7 = [v8 primaryColor];
  [(NTKExtraLargeFaceView *)self _applyColor:v7 toRichComplicationView:v4 withFraction:v6 isMonochrome:0.0];
}

- (void)_applyColor:(id)a3 toRichComplicationView:(id)a4 withFraction:(double)a5 isMonochrome:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  id v13 = [(NTKExtraLargeFaceView *)self _richComplicationSecondaryColor];
  [(NTKExtraLargeFaceView *)self setComplicationColor:v11];

  v12 = [(NTKExtraLargeFaceView *)self complicationColor];
  [(NTKExtraLargeFaceView *)self setInterpolatedComplicationColor:v12];

  [(NTKExtraLargeFaceView *)self setAlternateComplicationColor:v13];
  if (v6) {
    [v10 updateMonochromeColor];
  }
  else {
    [v10 transitionToMonochromeWithFraction:a5];
  }
}

- (id)_richComplicationSecondaryColor
{
  return +[UIColor whiteColor];
}

- (void)_layoutForegroundContainerView
{
  [(NTKExtraLargeFaceView *)self layoutComplicationViews];
  id v10 = [(NTKExtraLargeFaceView *)self _complicationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v10;
    [(NTKExtraLargeFaceView *)self _statusBarOffsetForComplication];
    double v5 = v4;
    [(NTKExtraLargeFaceView *)self _statusBarOffsetForComplicationBackground];
    [v3 setContentHeightOffset:v5 + v6 * -0.5];
  }
  id v7 = [(NTKExtraLargeFaceView *)self _complicationView];
  [v7 setNeedsLayout];

  largeTimeLabel = self->_largeTimeLabel;
  double v9 = [(NTKExtraLargeFaceView *)self rootContainerView];
  [v9 bounds];
  -[NTKExtraLargeTimeView ntk_setBoundsAndPositionFromFrame:](largeTimeLabel, "ntk_setBoundsAndPositionFromFrame:");

  [(NTKExtraLargeFaceView *)self _layoutSmallTimeLabel];
}

- (void)_layoutSmallTimeLabel
{
  smallTimeLabel = self->_smallTimeLabel;
  if (smallTimeLabel)
  {
    [(NTKDigitalTimeLabel *)smallTimeLabel setFrameUsingCurrentStyle];
    [(NTKDigitalTimeLabel *)self->_smallTimeLabel bounds];
    double v5 = v4;
    id v13 = [(NTKDigitalTimeLabel *)self->_smallTimeLabel font];
    double v6 = [(NTKExtraLargeFaceView *)self device];
    sub_5F88(v6, (uint64_t)v14);
    double v7 = v15;
    [v13 ascender];
    double v9 = v7 - v8;
    [(NTKExtraLargeFaceView *)self _statusBarOffsetForSmallTime];
    double v11 = v9 + v10;

    [(NTKExtraLargeFaceView *)self bounds];
    -[NTKDigitalTimeLabel setCenter:](self->_smallTimeLabel, "setCenter:", v12 * 0.5, v5 * 0.5 + v11);
  }
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKExtraLargeFaceView;
  [(NTKExtraLargeFaceView *)&v3 _applyFrozen];
  [(NTKExtraLargeFaceView *)self _initSmallTimeLabelIfNecessary];
  [(NTKExtraLargeFaceView *)self _initLargeTimeLabelIfNecessary];
  [(NTKDigitalTimeLabel *)self->_smallTimeLabel setFrozen:[(NTKExtraLargeFaceView *)self isFrozen]];
  [(NTKExtraLargeTimeView *)self->_largeTimeLabel setFrozen:[(NTKExtraLargeFaceView *)self isFrozen]];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKExtraLargeFaceView;
  id v6 = a3;
  [(NTKExtraLargeFaceView *)&v7 setOverrideDate:v6 duration:a4];
  [(NTKExtraLargeFaceView *)self _initSmallTimeLabelIfNecessary];
  [(NTKExtraLargeFaceView *)self _initLargeTimeLabelIfNecessary];
  [(NTKDigitalTimeLabel *)self->_smallTimeLabel setOverrideDate:v6 duration:a4];
  [(NTKExtraLargeTimeView *)self->_largeTimeLabel setOverrideDate:v6 duration:a4];
}

- (void)_applyDataMode
{
  v2.receiver = self;
  v2.super_class = (Class)NTKExtraLargeFaceView;
  [(NTKExtraLargeFaceView *)&v2 _applyDataMode];
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL viewsOffsetForStatusBar = self->_viewsOffsetForStatusBar;
  self->_BOOL viewsOffsetForStatusBar = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6AA8;
  v8[3] = &unk_10460;
  v8[4] = self;
  id v6 = objc_retainBlock(v8);
  if (viewsOffsetForStatusBar == v3
    || (objc_super v7 = (char *)[(NTKExtraLargeFaceView *)self dataMode],
        [(NTKExtraLargeTimeView *)self->_largeTimeLabel setStatusBarVisible:v3 animated:v7 == (unsigned char *)&dword_0 + 1], v7 != (unsigned char *)&dword_0 + 1))
  {
    ((void (*)(void *))v6[2])(v6);
  }
  else
  {
    +[UIView animateWithDuration:v6 animations:0.3];
  }
}

- (double)_verticalPaddingForStatusBar
{
  return 0.0;
}

- (void)_prepareWristRaiseAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKExtraLargeFaceView;
  [(NTKExtraLargeFaceView *)&v3 _prepareWristRaiseAnimation];
  [(NTKExtraLargeTimeView *)self->_largeTimeLabel prepareWristRaiseAnimation];
}

- (void)_performWristRaiseAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKExtraLargeFaceView;
  [(NTKExtraLargeFaceView *)&v3 _performWristRaiseAnimation];
  [(NTKExtraLargeTimeView *)self->_largeTimeLabel performWristRaiseAnimation];
}

- (void)_prepareForEditing
{
  self->_isEditing = 1;
  v5.receiver = self;
  v5.super_class = (Class)NTKExtraLargeFaceView;
  [(NTKExtraLargeFaceView *)&v5 _prepareForEditing];
  [(NTKExtraLargeFaceView *)self _initSmallTimeLabelIfNecessary];
  [(NTKExtraLargeFaceView *)self _initLargeTimeLabelIfNecessary];
  objc_super v3 = [(NTKExtraLargeFaceView *)self rootContainerView];
  double v4 = v3;
  if (self->_complicationIsVisible)
  {
    [v3 addSubview:self->_largeTimeLabel];
    [(NTKExtraLargeTimeView *)self->_largeTimeLabel setHidden:1];
  }
  else
  {
    [v3 addSubview:self->_smallTimeLabel];
    [(NTKDigitalTimeLabel *)self->_smallTimeLabel setAlpha:0.0];
  }
  [v4 bringSubviewToFront:self->_smallTimeLabel];
}

- (void)_cleanupAfterEditing
{
  self->_isEditing = 0;
  v7.receiver = self;
  v7.super_class = (Class)NTKExtraLargeFaceView;
  [(NTKExtraLargeFaceView *)&v7 _cleanupAfterEditing];
  [(NTKExtraLargeFaceView *)self _updateComplicationVisibility];
  if (self->_complicationIsVisible) {
    objc_super v3 = &OBJC_IVAR___NTKExtraLargeFaceView__largeTimeLabel;
  }
  else {
    objc_super v3 = &OBJC_IVAR___NTKExtraLargeFaceView__smallTimeLabel;
  }
  if (self->_complicationIsVisible) {
    double v4 = &OBJC_IVAR___NTKExtraLargeFaceView__smallTimeLabel;
  }
  else {
    double v4 = &OBJC_IVAR___NTKExtraLargeFaceView__largeTimeLabel;
  }
  uint64_t v5 = *v3;
  [*(id *)&self->NTKFaceView_opaque[v5] removeFromSuperview];
  id v6 = *(void **)&self->NTKFaceView_opaque[v5];
  *(void *)&self->NTKFaceView_opaque[v5] = 0;

  [*(id *)&self->NTKFaceView_opaque[*v4] setAlpha:1.0];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKExtraLargeFaceView;
  -[NTKExtraLargeFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v13, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  if (a4 != a5)
  {
    if (a4 == 1 || (double v9 = -1.0, a5 == 1))
    {
      +[NTKFaceViewController _complicationPickerAlphaForTransitionFraction:a3];
      double v9 = v10;
      [(NTKExtraLargeFaceView *)self _updateComplicationVisibility];
    }
    [(NTKExtraLargeFaceView *)self _smallTimeAlphaForEditMode:a4];
    [(NTKExtraLargeFaceView *)self _smallTimeAlphaForEditMode:a5];
    CLKInterpolateBetweenFloatsClipped();
    -[NTKDigitalTimeLabel setAlpha:](self->_smallTimeLabel, "setAlpha:");
    if (a5) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = a4 == 1;
    }
    double v12 = -v9;
    if (v11) {
      double v12 = v9;
    }
    [(NTKExtraLargeTimeView *)self->_largeTimeLabel setAlpha:v12];
  }
}

- (void)_noteComplicationVisibilityChanged
{
  id v4 = [(NTKExtraLargeFaceView *)self rootContainerView];
  if (self->_complicationIsVisible)
  {
    [(NTKExtraLargeFaceView *)self _initSmallTimeLabelIfNecessary];
    [v4 addSubview:self->_smallTimeLabel];
  }
  else
  {
    [(NTKExtraLargeFaceView *)self _initLargeTimeLabelIfNecessary];
    [v4 addSubview:self->_largeTimeLabel];
  }
  [(NTKExtraLargeTimeView *)self->_largeTimeLabel setHidden:self->_complicationIsVisible];
  BOOL v3 = !self->_complicationIsVisible && !self->_isEditing;
  [(NTKDigitalTimeLabel *)self->_smallTimeLabel setHidden:v3];
}

- (double)_smallTimeAlphaForEditMode:(int64_t)a3
{
  double result = 1.0;
  if (a3 <= 9)
  {
    if (a3)
    {
      if (a3 == 1) {
        return NTKEditModeDimmedAlpha;
      }
      return result;
    }
LABEL_7:
    LOBYTE(result) = self->_complicationIsVisible;
    return (double)*(unint64_t *)&result;
  }
  if (a3 == 10 || a3 == 19) {
    goto LABEL_7;
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v6 = [(NTKExtraLargeFaceView *)self faceColorPalette];
  objc_super v7 = [v6 primaryColor];
  [(NTKExtraLargeFaceView *)self setInterpolatedComplicationColor:v7];

  uint64_t v8 = [(NTKExtraLargeFaceView *)self device];
  double v9 = [(NTKExtraLargeFaceView *)self faceColorPalette];
  double v10 = +[NTKFaceColorScheme colorSchemeForDevice:v8 withFaceColorPalette:v9 units:1];
  colorScheme = self->_colorScheme;
  self->_colorScheme = v10;

  [(NTKExtraLargeFaceView *)self _configureLargeTimeLabelColors];
  [(NTKExtraLargeFaceView *)self _configureSmallTimeLabelColors];
  double v12 = [(NTKExtraLargeFaceView *)self _complicationView];
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();

  id v15 = [(NTKExtraLargeFaceView *)self _complicationView];
  if (v8)
  {
    objc_super v13 = [(NTKExtraLargeFaceView *)self faceColorPalette];
    [v15 applyFaceColorPalette:v13 units:71];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    id v15 = [(NTKExtraLargeFaceView *)self _complicationView];
    -[NTKExtraLargeFaceView _applyFaceColorToRichComplicationView:](self, "_applyFaceColorToRichComplicationView:");
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_7428;
  v38[3] = &unk_10488;
  v38[4] = self;
  double v9 = objc_retainBlock(v38);
  double v10 = [(NTKExtraLargeFaceView *)self interpolatedColorPalette];
  BOOL v11 = [v10 fromPalette];
  uint64_t v12 = ((void (*)(void *, void *, void))v9[2])(v9, v11, 0);

  objc_super v13 = [(NTKExtraLargeFaceView *)self interpolatedColorPalette];
  v14 = [v13 toPalette];
  id v15 = ((void (*)(void *, void *, void))v9[2])(v9, v14, 0);

  CLKCompressFraction();
  double v17 = v16;
  v37 = +[NTKFaceColorScheme interpolationFrom:to:fraction:brightenUnits:](NTKFaceColorScheme, "interpolationFrom:to:fraction:brightenUnits:", v12, v15, 1);
  largeTimeLabel = self->_largeTimeLabel;
  v19 = [v37 foregroundColor];
  [(NTKExtraLargeTimeView *)largeTimeLabel setTopColor:v19];

  CLKCompressFraction();
  double v20 = (void *)v12;
  v36 = (void *)v12;
  double v21 = +[NTKFaceColorScheme interpolationFrom:to:fraction:brightenUnits:](NTKFaceColorScheme, "interpolationFrom:to:fraction:brightenUnits:", v12, v15, 1);
  id v22 = self->_largeTimeLabel;
  long long v23 = [v21 foregroundColor];
  [(NTKExtraLargeTimeView *)v22 setBottomColor:v23];

  long long v24 = [v20 faceColorPalette];
  long long v25 = [v15 faceColorPalette];
  [(NTKExtraLargeFaceView *)self _applyComplicationTransitionFraction:v24 fromColorPalette:v25 toColorPalette:a3];

  long long v26 = +[UIColor whiteColor];
  long long v27 = [(NTKExtraLargeFaceView *)self interpolatedColorPalette];
  long long v28 = [v27 fromPalette];
  uint64_t v29 = ((void (*)(void *, void *, void *))v9[2])(v9, v28, v26);

  v30 = [(NTKExtraLargeFaceView *)self interpolatedColorPalette];
  v31 = [v30 toPalette];
  v32 = ((void (*)(void *, void *, void *))v9[2])(v9, v31, v26);

  v33 = +[NTKFaceColorScheme interpolationFrom:v29 to:v32 fraction:1 brightenUnits:v17];
  smallTimeLabel = self->_smallTimeLabel;
  v35 = [v33 foregroundColor];
  [(NTKDigitalTimeLabel *)smallTimeLabel setTextColor:v35];
}

- (void)_applyComplicationTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v19 = a4;
  id v8 = a5;
  double v9 = [(NTKExtraLargeFaceView *)self _complicationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    CLKCompressFraction();
    objc_msgSend(v10, "applyTransitionFraction:fromFaceColorPalette:toFaceColorPalette:units:brightenedUnits:", v19, v8, 71, 1);
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v19 isEqual:v8] & 1) == 0)
  {
    id v11 = v9;
    uint64_t v12 = [v19 primaryColor];
    objc_super v13 = [v8 primaryColor];
    v14 = NTKInterpolateBetweenColors();
    if (([v19 isMulticolor] & 1) != 0 || objc_msgSend(v8, "isMulticolor"))
    {
      unsigned int v15 = [v8 isMulticolor];
      uint64_t v16 = 0;
      if (v15) {
        double v17 = v12;
      }
      else {
        double v17 = v13;
      }
      if (v15) {
        a3 = 1.0 - a3;
      }
    }
    else
    {
      uint64_t v16 = 1;
      double v17 = v14;
    }
    id v18 = v17;
    [(NTKExtraLargeFaceView *)self _applyColor:v18 toRichComplicationView:v11 withFraction:v16 isMonochrome:a3];

    goto LABEL_15;
  }
LABEL_16:
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  BOOL v3 = [(NTKExtraLargeFaceView *)self device];
  sub_5F88(v3, (uint64_t)v6);
  double v4 = v7;

  return v4;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKLargeElementScaleForBreathingFraction();
  CGFloat v7 = v6;
  id v8 = [(NTKExtraLargeFaceView *)self rootContainerView];
  CGAffineTransformMakeScale(&v9, v7, v7);
  [v8 setTransform:&v9];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKScaleForRubberBandingFraction();
  CGFloat v7 = v6;
  NTKAlphaForRubberBandingFraction();
  double v9 = v8;
  id v10 = [(NTKExtraLargeFaceView *)self rootContainerView];
  CGAffineTransformMakeScale(&v12, v7, v7);
  CGAffineTransformTranslate(&v13, &v12, 0.0, 1.0);
  [v10 setTransform:&v13];

  id v11 = [(NTKExtraLargeFaceView *)self rootContainerView];
  [v11 setAlpha:v9];
}

- (id)_complicationView
{
  objc_super v2 = [(NTKExtraLargeFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotCenter];
  BOOL v3 = [v2 display];

  return v3;
}

- (void)_configureSmallTimeLabelStyle
{
  id v14 = [(NTKExtraLargeFaceView *)self _smallTimeLabelFont];
  [(NTKExtraLargeFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(NTKExtraLargeFaceView *)self device];
  +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:font:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:font:forDevice:", 0, v14, v11, v4, v6, v8, v10, 0.0);
  CGAffineTransform v12 = (NTKDigitalTimeLabelStyle *)objc_claimAutoreleasedReturnValue();
  smallTimeLabelStyle = self->_smallTimeLabelStyle;
  self->_smallTimeLabelStyle = v12;

  [(NTKDigitalTimeLabel *)self->_smallTimeLabel setStyle:self->_smallTimeLabelStyle];
}

- (id)_smallTimeLabelFont
{
  double v3 = [(NTKExtraLargeFaceView *)self device];
  sub_5F88(v3, (uint64_t)v13);
  double v4 = v14;

  double v5 = [(NTKExtraLargeFaceView *)self device];
  int v6 = NTKShowIndicScriptNumerals();

  if (v6)
  {
    if (self->_numberSystem != -1)
    {
      double v7 = [(NTKExtraLargeFaceView *)self smallTimeLabelFontScaleFactorForNumberSystemOverrides];
      double v8 = [v7 objectAtIndexedSubscript:self->_numberSystem];
      [v8 doubleValue];

      double v9 = [(NTKExtraLargeFaceView *)self device];
      CLKRoundForDevice();
      double v4 = v10;
    }
    id v11 = +[NTKSFCompactFont numericSoftFontOfSize:v4 weight:UIFontWeightSemibold];
  }
  else
  {
    id v11 = +[CLKFont compactSoftFontOfSize:v4 weight:UIFontWeightSemibold];
  }

  return v11;
}

- (void)_configureSmallTimeLabelColors
{
  unsigned int v3 = [(NTKFaceColorScheme *)self->_colorScheme containsOverrideFaceColor];
  smallTimeLabel = self->_smallTimeLabel;
  if (v3) {
    +[UIColor whiteColor];
  }
  else {
  id v5 = [(NTKFaceColorScheme *)self->_colorScheme foregroundColor];
  }
  [(NTKDigitalTimeLabel *)smallTimeLabel setTextColor:v5];
}

- (void)_configureLargeTimeLabelColors
{
  largeTimeLabel = self->_largeTimeLabel;
  double v4 = [(NTKFaceColorScheme *)self->_colorScheme foregroundColor];
  [(NTKExtraLargeTimeView *)largeTimeLabel setTopColor:v4];

  id v5 = self->_largeTimeLabel;
  id v6 = [(NTKFaceColorScheme *)self->_colorScheme foregroundColor];
  [(NTKExtraLargeTimeView *)v5 setBottomColor:v6];
}

- (void)_updateComplicationVisibility
{
  BOOL complicationIsVisible = self->_complicationIsVisible;
  double v4 = [(NTKExtraLargeFaceView *)self delegate];
  self->_BOOL complicationIsVisible = [v4 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotCenter] ^ 1;

  if (self->_complicationIsVisible != complicationIsVisible)
  {
    [(NTKExtraLargeFaceView *)self _noteComplicationVisibilityChanged];
  }
}

- (void)_applyShowContentForUnadornedSnapshot
{
  [(NTKExtraLargeTimeView *)self->_largeTimeLabel setHidden:[(NTKExtraLargeFaceView *)self showContentForUnadornedSnapshot]];
  smallTimeLabel = self->_smallTimeLabel;
  id v4 = [(NTKExtraLargeFaceView *)self showContentForUnadornedSnapshot];

  [(NTKDigitalTimeLabel *)smallTimeLabel setHidden:v4];
}

- (void)_initSmallTimeLabelIfNecessary
{
  if (!self->_smallTimeLabel)
  {
    unsigned int v3 = [(NTKExtraLargeFaceView *)self device];
    id v4 = +[NTKDigitalTimeLabel labelWithOptions:9 forDevice:v3];
    smallTimeLabel = self->_smallTimeLabel;
    self->_smallTimeLabel = v4;

    [(NTKDigitalTimeLabel *)self->_smallTimeLabel setForcedNumberSystem:self->_numberSystem];
    [(NTKExtraLargeFaceView *)self _configureSmallTimeLabelStyle];
    [(NTKExtraLargeFaceView *)self _configureSmallTimeLabelColors];
  }
}

- (void)_initLargeTimeLabelIfNecessary
{
  if (!self->_largeTimeLabel)
  {
    id v3 = objc_alloc((Class)NTKExtraLargeTimeView);
    id v4 = [(NTKExtraLargeFaceView *)self device];
    id v5 = (NTKExtraLargeTimeView *)objc_msgSend(v3, "initWithFrame:forDevice:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    largeTimeLabel = self->_largeTimeLabel;
    self->_largeTimeLabel = v5;

    [(NTKExtraLargeTimeView *)self->_largeTimeLabel setForcedNumberSystem:self->_numberSystem];
    [(NTKExtraLargeFaceView *)self _configureLargeTimeLabelColors];
  }
}

- (void)_createTimeViews
{
  if (self->_complicationIsVisible)
  {
    [(NTKExtraLargeFaceView *)self _initSmallTimeLabelIfNecessary];
    id v3 = &OBJC_IVAR___NTKExtraLargeFaceView__smallTimeLabel;
  }
  else
  {
    [(NTKExtraLargeFaceView *)self _initLargeTimeLabelIfNecessary];
    id v3 = &OBJC_IVAR___NTKExtraLargeFaceView__largeTimeLabel;
  }
  id v5 = *(id *)&self->NTKFaceView_opaque[*v3];
  [(NTKExtraLargeFaceView *)self setTimeView:v5];
  id v4 = [(NTKExtraLargeFaceView *)self rootContainerView];
  [v4 addSubview:v5];
}

- (void)_removeTimeViews
{
  [(NTKExtraLargeTimeView *)self->_largeTimeLabel removeFromSuperview];
  largeTimeLabel = self->_largeTimeLabel;
  self->_largeTimeLabel = 0;

  [(NTKDigitalTimeLabel *)self->_smallTimeLabel removeFromSuperview];
  smallTimeLabel = self->_smallTimeLabel;
  self->_smallTimeLabel = 0;
}

- (void)_setNumerals:(unint64_t)a3
{
  unint64_t v4 = CLKLocaleNumberSystemFromNumeralOption();
  if (self->_numberSystem != v4)
  {
    unint64_t v5 = v4;
    self->_numberSystem = v4;
    id v6 = [(NTKExtraLargeFaceView *)self device];
    int v7 = NTKShowIndicScriptNumerals();

    if (v7)
    {
      double v8 = [(NTKExtraLargeFaceView *)self largeTimeLabel];
      [v8 setForcedNumberSystem:v5];

      double v9 = [(NTKExtraLargeFaceView *)self smallTimeLabel];
      [v9 setForcedNumberSystem:v5];

      [(NTKExtraLargeFaceView *)self _configureSmallTimeLabelStyle];
      [(NTKExtraLargeFaceView *)self setNeedsLayout];
    }
  }
}

- (void)sensitiveUIStateChanged
{
  unint64_t numberSystem = self->_numberSystem;
  unint64_t v4 = [(NTKExtraLargeFaceView *)self device];
  int v5 = NTKShowIndicScriptNumerals();

  if (v5) {
    uint64_t v6 = numberSystem;
  }
  else {
    uint64_t v6 = -1;
  }
  int v7 = [(NTKExtraLargeFaceView *)self largeTimeLabel];
  [v7 setForcedNumberSystem:v6];

  id v8 = [(NTKExtraLargeFaceView *)self smallTimeLabel];
  [v8 setForcedNumberSystem:v6];
}

- (NTKFaceColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (NTKExtraLargeTimeView)largeTimeLabel
{
  return self->_largeTimeLabel;
}

- (void)setLargeTimeLabel:(id)a3
{
}

- (NTKDigitalTimeLabel)smallTimeLabel
{
  return self->_smallTimeLabel;
}

- (void)setSmallTimeLabel:(id)a3
{
}

- (BOOL)complicationIsVisible
{
  return self->_complicationIsVisible;
}

- (void)setComplicationIsVisible:(BOOL)a3
{
  self->_BOOL complicationIsVisible = a3;
}

- (void)setSmallTimeLabelFontScaleFactorForNumberSystemOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallTimeLabelFontScaleFactorForNumberSystemOverrides, 0);
  objc_storeStrong((id *)&self->_smallTimeLabel, 0);
  objc_storeStrong((id *)&self->_largeTimeLabel, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);

  objc_storeStrong((id *)&self->_smallTimeLabelStyle, 0);
}

@end