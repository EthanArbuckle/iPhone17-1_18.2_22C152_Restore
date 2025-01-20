@interface NTKSimpleFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (id)_swatchImageFaceName;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_isShowingStatus;
- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (NTKSimpleFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (UIColor)accentColor;
- (double)_backgroundAlphaForEditMode:(int64_t)a3;
- (double)_dateComplicationCenterOffset;
- (double)_dateComplicationRightAlignment;
- (double)_handsAlphaForEditMode:(int64_t)a3;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_secondHandAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (double)alphaForDimmedState;
- (id)_createTickReplicatorForTick:(id)a3 radius:(double)a4 count:(unint64_t)a5 skip:(unint64_t)a6;
- (id)_createTickWithSize:(CGSize)a3 rounded:(BOOL)a4;
- (id)_createTicksAndReplicators:(id *)a3 forDensity:(unint64_t)a4;
- (id)_createTicksViewForDensityIfNeeded:(unint64_t)a3;
- (id)_dateComplicationFontForStyle:(unint64_t)a3;
- (id)_faceColorSchemeForFaceColorPalette:(id)a3;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_keylineViewForDensityEditing;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_ticksViewAtIndex:(unint64_t)a3;
- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (unint64_t)textLayoutStyleForSlot:(int64_t)a3;
- (void)_addDetailedMinutesToView:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationFactory:(id)a3;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_createBackgroundViewIfNeeded;
- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)_handleBoldTextPreferenceChange;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_removeComplicationOverlapHiding;
- (void)_setDensity:(unint64_t)a3;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationOverlapHiding;
- (void)_updateDateComplicationPositionIfNecessary;
- (void)cleanupAfterEditing;
- (void)layoutSubviews;
@end

@implementation NTKSimpleFaceView

- (BOOL)_isShowingStatus
{
  return self->_showingStatus;
}

- (id)_ticksViewAtIndex:(unint64_t)a3
{
  return self->_ticksViews[a3];
}

- (NTKSimpleFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKSimpleFaceView;
  v9 = [(NTKSimpleFaceView *)&v15 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v9->_ticksLargeLightness = 1.0;
    v9->_ticksSmallLightness = 1.0;
    v11 = (NTKUtilityComplicationFactory *)[objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    complicationFactory = v10->_complicationFactory;
    v10->_complicationFactory = v11;

    [(NTKUtilityComplicationFactory *)v10->_complicationFactory setDelegate:v10];
    [(NTKUtilityComplicationFactory *)v10->_complicationFactory setFaceView:v10];
    [(NTKSimpleFaceView *)v10 _configureComplicationFactory:v10->_complicationFactory];
    [(NTKSimpleFaceView *)v10 setComplicationFactory:v10->_complicationFactory];
    v10->_showingStatus = 0;
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v10 selector:"_handleBoldTextPreferenceChange" name:UIAccessibilityBoldTextStatusDidChangeNotification object:0];
  }
  return v10;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)NTKSimpleFaceView;
  [(NTKSimpleFaceView *)&v21 layoutSubviews];
  [(NTKSimpleFaceView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_backgroundView, "ntk_setBoundsAndPositionFromFrame:");
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  CGRectGetWidth(v22);
  v11 = [(NTKSimpleFaceView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = [(NTKSimpleFaceView *)self timeView];
  objc_msgSend(v20, "ntk_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);

  [(NTKSimpleFaceView *)self _updateDateComplicationPositionIfNecessary];
  [(NTKSimpleFaceView *)self _updateComplicationOverlapHiding];
}

- (void)_loadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSimpleFaceView;
  [(NTKSimpleFaceView *)&v6 _loadSnapshotContentViews];
  [(NTKSimpleFaceView *)self _createBackgroundViewIfNeeded];
  id v3 = [(NTKSimpleFaceView *)self _createTicksViewForDensityIfNeeded:self->_density];
  [(NTKSimpleFaceView *)self _updateComplicationOverlapHiding];
  CGFloat v4 = [(NTKSimpleFaceView *)self contentView];
  [v4 addSubview:self->_backgroundView];
  double v5 = +[UIColor blackColor];
  [v4 setBackgroundColor:v5];
}

- (void)_unloadSnapshotContentViews
{
  v9.receiver = self;
  v9.super_class = (Class)NTKSimpleFaceView;
  [(NTKSimpleFaceView *)&v9 _unloadSnapshotContentViews];
  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  uint64_t v4 = 0;
  ticksViews = self->_ticksViews;
  do
  {
    [(NTKSimpleFaceViewTicksView *)ticksViews[v4] removeFromSuperview];
    objc_super v6 = ticksViews[v4];
    ticksViews[v4] = 0;

    ++v4;
  }
  while (v4 != 4);
  double v7 = [(NTKSimpleFaceView *)self contentView];
  CGFloat v8 = +[UIColor clearColor];
  [v7 setBackgroundColor:v8];
}

- (double)_verticalPaddingForStatusBar
{
  v2 = [(NTKSimpleFaceView *)self device];
  if ([v2 sizeClass]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 1.5;
  }

  return v3;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSimpleFaceView;
  -[NTKSimpleFaceView _prepareForStatusChange:](&v5, "_prepareForStatusChange:");
  self->_showingStatus = a3;
  [(NTKSimpleFaceView *)self _updateComplicationOverlapHiding];
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:NTKComplicationSlotTopLeft])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotTopRight])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotBottomLeft])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotBottomRight])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotBottomCenter])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotDate])
  {
    int64_t v4 = 12;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  int64_t v4 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 0xB && ((0xA0Fu >> v4))
  {
    id v5 = *(id *)*(&off_C430 + v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  complicationFactory = self->_complicationFactory;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NTKUtilityComplicationFactory *)complicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKSimpleFaceView *)self _utilitySlotForSlot:v9]];

  [(NTKSimpleFaceView *)self _configureComplicationView:v11 forSlot:v9];
  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(NTKUtilityComplicationFactory *)self->_complicationFactory configureComplicationView:v9 forSlot:v6];
  if ([v9 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    complicationFactory = self->_complicationFactory;
    id v8 = v9;
    [(NTKUtilityComplicationFactory *)complicationFactory foregroundAlphaForEditing:[(NTKSimpleFaceView *)self editing]];
    objc_msgSend(v8, "setForegroundAlpha:");
    [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundImageAlphaForEditing:[(NTKSimpleFaceView *)self editing]];
    objc_msgSend(v8, "setForegroundImageAlpha:");
    [v8 setAccentColor:self->_accentColor];
    objc_msgSend(v8, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKSimpleFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v6)));
  }
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  if ([a3 isEqualToString:NTKComplicationSlotDate]) {
    return 0;
  }
  id v5 = [(NTKSimpleFaceView *)self device];
  unint64_t v4 = [v5 deviceCategory] != (char *)&dword_0 + 1;

  return v4;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  id v16 = a8;
  if ((char *)[(NTKSimpleFaceView *)self _layoutStyleForSlot:"_layoutStyleForSlot:"] == (char *)&dword_0 + 1)
  {
    int64_t v14 = [(NTKSimpleFaceView *)self _utilitySlotForSlot:v16];
    double v15 = [(NTKSimpleFaceView *)self device];
    +[NTKUtilityComplicationFactory curvedCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v14 forDevice:v15];
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  complicationFactory = self->_complicationFactory;
  int64_t v6 = [(NTKSimpleFaceView *)self _utilitySlotForSlot:a4];

  return (int64_t)[(NTKUtilityComplicationFactory *)complicationFactory layoutOverrideForComplicationType:a3 inSlot:v6];
}

- (void)_loadLayoutRules
{
  [(NTKSimpleFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v23[0] = NTKComplicationSlotTopLeft;
  v23[1] = NTKComplicationSlotTopRight;
  v23[2] = NTKComplicationSlotBottomLeft;
  v23[3] = NTKComplicationSlotBottomRight;
  v23[4] = NTKComplicationSlotDate;
  +[NSArray arrayWithObjects:v23 count:5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v17 = -[NTKSimpleFaceView complicationLayoutforSlot:](self, "complicationLayoutforSlot:", v16, (void)v18);
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v17, [(NTKSimpleFaceView *)self _utilitySlotForSlot:v16], v4, v6, v8, v10);
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (id)_faceColorSchemeForFaceColorPalette:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKSimpleFaceView *)self device];
  double v6 = +[NTKFaceColorScheme colorSchemeForDevice:v5 withFaceColorPalette:v4 units:392];

  return v6;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = v9;
  if (a4 == 11)
  {
    id v28 = [v8 density];
    [(NTKSimpleFaceView *)self _setDensity:v28];
    v29 = 0;
    long long v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v36 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v32 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    do
    {
      if (v28 == v29)
      {
        v30 = [(NTKSimpleFaceView *)self _createTicksViewForDensityIfNeeded:v28];
        double v31 = 1.0;
      }
      else
      {
        v30 = self->_ticksViews[(void)v29];
        double v31 = 0.0;
      }
      -[NTKSimpleFaceViewTicksView setAlpha:](v30, "setAlpha:", v31, (void)v32);
      v37[0] = v36;
      v37[1] = v34;
      v37[2] = v32;
      [(NTKSimpleFaceViewTicksView *)v30 setTransform:v37];

      v29 = (char *)v29 + 1;
    }
    while (v29 != &dword_4);
  }
  else if (a4 == 10)
  {
    id v33 = v9;
    id v35 = v8;
    id v11 = [(NTKSimpleFaceView *)self faceColorPalette];
    id v12 = [(NTKSimpleFaceView *)self _faceColorSchemeForFaceColorPalette:v11];

    id v13 = [(NTKSimpleFaceView *)self timeView];
    uint64_t v14 = [v12 accentColor];
    [v13 applySecondHandColor:v14];

    double v15 = [v12 tickColor];
    ticksSmallColor = self->_ticksSmallColor;
    self->_ticksSmallColor = v15;

    double v17 = [v12 alternativeTickColor];
    ticksLargeColor = self->_ticksLargeColor;
    self->_ticksLargeColor = v17;

    for (uint64_t i = 0; i != 4; ++i)
    {
      if (i == self->_density)
      {
        long long v20 = [(NTKSimpleFaceView *)self _createTicksViewForDensityIfNeeded:i];
      }
      else
      {
        long long v20 = self->_ticksViews[i];
      }
      long long v21 = v20;
      CGRect v22 = [(NTKSimpleFaceViewTicksView *)v20 smallTick];
      NTKColorByPremultiplyingAlpha();
      id v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBackgroundColor:", objc_msgSend(v23, "CGColor"));

      v24 = [(NTKSimpleFaceViewTicksView *)v21 largeTick];
      NTKColorByPremultiplyingAlpha();
      id v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));
    }
    v26 = [v12 accentColor];
    accentColor = self->_accentColor;
    self->_accentColor = v26;

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_2A68;
    v38[3] = &unk_C3A0;
    v38[4] = self;
    [(NTKSimpleFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v38];

    id v8 = v35;
    double v10 = v33;
  }
}

- (void)cleanupAfterEditing
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSimpleFaceView;
  [(NTKSimpleFaceView *)&v5 cleanupAfterEditing];
  for (uint64_t i = 0; i != 4; ++i)
  {
    if (i != self->_density)
    {
      [(NTKSimpleFaceViewTicksView *)self->_ticksViews[i] removeFromSuperview];
      id v4 = self->_ticksViews[i];
      self->_ticksViews[i] = 0;
    }
  }
  [(NTKSimpleFaceView *)self _updateDateComplicationPositionIfNecessary];
}

- (void)_setDensity:(unint64_t)a3
{
  if (self->_density != a3)
  {
    self->_density = a3;
    [(NTKSimpleFaceView *)self _updateDateComplicationPositionIfNecessary];
    [(NTKSimpleFaceView *)self layoutComplicationViews];
  }
}

- (void)_handleBoldTextPreferenceChange
{
  uint64_t v3 = 0;
  ticksViews = self->_ticksViews;
  do
  {
    [(NTKSimpleFaceViewTicksView *)ticksViews[v3] removeFromSuperview];
    objc_super v5 = ticksViews[v3];
    ticksViews[v3] = 0;

    ++v3;
  }
  while (v3 != 4);
  id v6 = [(NTKSimpleFaceView *)self _createTicksViewForDensityIfNeeded:self->_density];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v41.receiver = self;
  v41.super_class = (Class)NTKSimpleFaceView;
  [(NTKSimpleFaceView *)&v41 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  if (a6 == 11)
  {
    id v30 = [v12 density];
    id v31 = [v13 density];
    long long v32 = 0;
    do
    {
      if (v30 == v32 || v31 == v32)
      {
        if (v31 == v32) {
          double v35 = a3;
        }
        else {
          double v35 = 1.0 - a3;
        }
        if (v30 == v31) {
          double v34 = 1.0;
        }
        else {
          double v34 = v35;
        }
        -[NTKSimpleFaceView _createTicksViewForDensityIfNeeded:](self, "_createTicksViewForDensityIfNeeded:", v32, v35);
        id v33 = (NTKSimpleFaceViewTicksView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = self->_ticksViews[(void)v32];
        double v34 = 0.0;
      }
      CGFloat v36 = v34 * v34 * (v34 * -2.0 + 3.0) * 0.2 + 0.8;
      -[NTKSimpleFaceViewTicksView setAlpha:](v33, "setAlpha:");
      CGAffineTransformMakeScale(&v38, v36, v36);
      [(NTKSimpleFaceViewTicksView *)v33 setTransform:&v38];

      long long v32 = (char *)v32 + 1;
    }
    while (v32 != &dword_4);
  }
  else if (a6 == 10)
  {
    uint64_t v14 = [(NTKSimpleFaceView *)self interpolatedColorPalette];
    double v15 = [v14 fromPalette];
    uint64_t v16 = [(NTKSimpleFaceView *)self _faceColorSchemeForFaceColorPalette:v15];
    double v17 = [(NTKSimpleFaceView *)self interpolatedColorPalette];
    long long v18 = [v17 toPalette];
    long long v19 = [(NTKSimpleFaceView *)self _faceColorSchemeForFaceColorPalette:v18];
    long long v20 = +[NTKFaceColorScheme interpolationFrom:v16 to:v19 fraction:a3];

    v37 = [v20 tickColor];
    long long v21 = [v20 alternativeTickColor];
    CGRect v22 = [v20 accentColor];
    id v23 = [(NTKSimpleFaceView *)self _createTicksViewForDensityIfNeeded:self->_density];
    v24 = [v23 smallTick];
    NTKColorByPremultiplyingAlpha();
    id v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

    v26 = [v23 largeTick];
    NTKColorByPremultiplyingAlpha();
    id v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

    id v28 = [(NTKSimpleFaceView *)self timeView];
    [v28 applySecondHandColor:v22];

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_300C;
    v39[3] = &unk_C3A0;
    id v40 = v22;
    id v29 = v22;
    [(NTKSimpleFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v39];
  }
}

- (void)_prepareForEditing
{
}

- (void)_configureForEditMode:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKSimpleFaceView;
  -[NTKSimpleFaceView _configureForEditMode:](&v14, "_configureForEditMode:");
  [(NTKSimpleFaceView *)self _handsAlphaForEditMode:a3];
  double v6 = v5;
  [(NTKSimpleFaceView *)self _secondHandAlphaForEditMode:a3];
  double v8 = v7;
  id v9 = [(NTKSimpleFaceView *)self timeView];
  double v10 = [v9 minuteHandView];
  [v10 setAlpha:v6];

  id v11 = [v9 hourHandView];
  [v11 setAlpha:v6];

  id v12 = [v9 secondHandView];
  [v12 setAlpha:v8];

  backgroundView = self->_backgroundView;
  [(NTKSimpleFaceView *)self _backgroundAlphaForEditMode:a3];
  -[UIView setAlpha:](backgroundView, "setAlpha:");
  [(NTKSimpleFaceView *)self _applyForegroundAlphaForTransitionFraction:a3 fromEditMode:a3 toEditMode:0.0];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKSimpleFaceView _handsAlphaForEditMode:](self, "_handsAlphaForEditMode:");
  [(NTKSimpleFaceView *)self _handsAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v10 = v9;
  [(NTKSimpleFaceView *)self _secondHandAlphaForEditMode:a4];
  [(NTKSimpleFaceView *)self _secondHandAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  id v16 = [(NTKSimpleFaceView *)self timeView];
  id v13 = [v16 minuteHandView];
  [v13 setAlpha:v10];

  objc_super v14 = [v16 hourHandView];
  [v14 setAlpha:v10];

  double v15 = [v16 secondHandView];
  [v15 setAlpha:v12];

  [(NTKSimpleFaceView *)self _backgroundAlphaForEditMode:a4];
  [(NTKSimpleFaceView *)self _backgroundAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:");
  [(NTKSimpleFaceView *)self _applyForegroundAlphaForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
}

- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKUtilityComplicationFactory foregroundAlphaForTransitionFraction:fromEditMode:toEditMode:](self->_complicationFactory, "foregroundAlphaForTransitionFraction:fromEditMode:toEditMode:");
  uint64_t v10 = v9;
  [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundImageAlphaForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_33B4;
  v12[3] = &unk_C3C0;
  v12[4] = v10;
  v12[5] = v11;
  [(NTKSimpleFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v12];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKSimpleFaceView;
  -[NTKSimpleFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v14, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    double v10 = v9;
    uint64_t v11 = [(NTKSimpleFaceView *)self timeView];
    double v12 = [v11 secondHandView];
    [v12 setScale:v10];
  }
  else if (a4 == 11)
  {
    NTKLargeElementScaleForBreathingFraction();
    backgroundView = self->_backgroundView;
    CGAffineTransformMakeScale(&v13, v8, v8);
    [(UIView *)backgroundView setTransform:&v13];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NTKSimpleFaceView;
  -[NTKSimpleFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v18, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKAlphaForRubberBandingFraction();
    double v10 = v9;
    uint64_t v11 = [(NTKSimpleFaceView *)self timeView];
    double v12 = [v11 secondHandView];
    [v12 setAlpha:v10];

    NTKScaleForRubberBandingFraction();
    double v14 = v13;
    double v15 = [(NTKSimpleFaceView *)self timeView];
    id v16 = [v15 secondHandView];
    [v16 setScale:v14];
  }
  else if (a4 == 11)
  {
    NTKScaleForRubberBandingFraction();
    backgroundView = self->_backgroundView;
    CGAffineTransformMakeScale(&v17, v8, v8);
    [(UIView *)backgroundView setTransform:&v17];
    NTKAlphaForRubberBandingFraction();
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:");
  }
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 11)
  {
    id v4 = [(NTKSimpleFaceView *)self _keylineViewForDensityEditing];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKSimpleFaceView;
    id v4 = [(NTKSimpleFaceView *)&v6 _keylineViewForCustomEditMode:a3 slot:a4];
  }

  return v4;
}

- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 11)
  {
    id v4 = [(NTKSimpleFaceView *)self device];
    [v4 screenBounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)NTKSimpleFaceView;
    [(NTKSimpleFaceView *)&v21 _relativeKeylineFrameForCustomEditMode:a3 slot:a4];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:NTKComplicationSlotDate]) {
    NTKKeylineCornerRadiusSmall();
  }
  else {
    [(NTKUtilityComplicationFactory *)self->_complicationFactory keylineCornerRadiusForSlot:[(NTKSimpleFaceView *)self _utilitySlotForSlot:v4]];
  }
  double v6 = v5;

  return v6;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (a4 & 0xFFFFFFFFFFFFFFFELL) == 10;
}

+ (id)_swatchImageFaceName
{
  return @"Simple";
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 11) {
    return &off_CAC0;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  double v9 = v8;
  if (a4 == 11)
  {
    id v10 = v8;
    double v11 = [a5 objectForKeyedSubscript:&off_C888];
    double v12 = [(id)objc_opt_class() _swatchImageFaceName];
    if (!qword_12170)
    {
      uint64_t v13 = objc_opt_new();
      double v14 = (void *)qword_12170;
      qword_12170 = v13;
    }
    double v15 = +[NSString stringWithFormat:@"%@-%@-%@", v12, v10, v11];
    double v16 = [(id)qword_12170 objectForKey:v15];
    if (!v16)
    {
      id v17 = [v10 density];
      v51 = v15;
      if ((unint64_t)v17 > 3) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = (uint64_t)*(&off_C490 + (void)v17);
      }
      v54 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v12);
      double v19 = [(NTKSimpleFaceView *)self faceColorPalette];
      id v20 = [v19 copy];

      if ([v11 conformsToProtocol:&OBJC_PROTOCOL___NTKPigmentEditOptionConvertible])
      {
        id v21 = objc_alloc((Class)NTKFaceColorPaletteConfiguration);
        CGRect v22 = [v11 pigmentEditOption];
        id v23 = [v21 initWithPigmentEditOption:v22];
        [v20 setConfiguration:v23];
      }
      v24 = [(NTKSimpleFaceView *)self device];
      id v25 = +[NTKFaceColorScheme colorSchemeForDevice:v24 withFaceColorPalette:v20 units:392];

      v53 = CLKLocaleNumberSystemPrefix();
      if ([v12 isEqualToString:@"Utility"])
      {
        CFStringRef v26 = @"Swatch-Utility-Face-SmallTicks";
        id v27 = v54;
      }
      else
      {
        id v27 = v54;
        CFStringRef v26 = [v54 stringByAppendingString:@"-SmallTicks"];
      }
      v49 = (__CFString *)v26;
      id v28 = NTKImageNamed();
      id v29 = [v25 tickColor];
      v48 = [v28 _flatImageWithColor:v29];

      id v30 = [v27 stringByAppendingString:@"-LargeTicks"];
      id v52 = v10;
      v50 = v20;
      if ([v12 isEqualToString:@"Utility"] && objc_msgSend(v10, "density")
        || [v10 density] == (char *)&dword_0 + 3)
      {
        uint64_t v31 = [v30 stringByAppendingFormat:@"-%@", v53];

        id v30 = (void *)v31;
      }
      v47 = v30;
      long long v32 = NTKImageNamed();
      id v33 = [v25 alternativeTickColor];
      double v34 = [v32 _flatImageWithColor:v33];

      double v35 = NTKImageNamed();
      v46 = [(NTKSimpleFaceView *)self _swatchColorForColorOption:v11];
      CGFloat v36 = NTKImageNamed();
      v37 = [v36 _flatImageWithColor:v46];

      id v38 = objc_alloc((Class)UIGraphicsImageRenderer);
      [v35 size];
      v45 = v25;
      id v39 = objc_msgSend(v38, "initWithSize:");
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_3CDC;
      v56[3] = &unk_C3E8;
      id v57 = v48;
      id v58 = v34;
      id v59 = v35;
      id v60 = v37;
      id v40 = v37;
      id v41 = v35;
      id v42 = v34;
      id v43 = v48;
      double v16 = [v39 imageWithActions:v56];
      double v15 = v51;
      [(id)qword_12170 setObject:v16 forKey:v51];

      id v10 = v52;
    }
  }
  else
  {
    v55.receiver = self;
    v55.super_class = (Class)NTKSimpleFaceView;
    double v16 = [(NTKSimpleFaceView *)&v55 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v16;
}

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  return [(NTKSimpleFaceView *)self _dateComplicationFontForStyle:a3];
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  id v4 = [(NTKSimpleFaceView *)self _slotForUtilitySlot:a3];
  id v5 = [(NTKSimpleFaceView *)self layoutStyleForSlot:v4];

  return (unint64_t)v5;
}

- (double)alphaForDimmedState
{
  return 0.333333333;
}

- (void)_configureComplicationFactory:(id)a3
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  id v5 = a3;
  id v4 = [(NTKSimpleFaceView *)self device];
  sub_3E94(v4, (uint64_t)v6);

  [v5 setDateKeylineMaxWidth:*((double *)&v7 + 1)];
  [v5 setDateHorizontalCenterOffset:*(double *)&v8];
}

- (void)_createBackgroundViewIfNeeded
{
  if (!self->_backgroundView)
  {
    id v3 = objc_alloc((Class)UIView);
    [(NTKSimpleFaceView *)self bounds];
    self->_backgroundView = (UIView *)objc_msgSend(v3, "initWithFrame:");
    _objc_release_x1();
  }
}

- (void)_addDetailedMinutesToView:(id)a3
{
  id v19 = a3;
  id v4 = [(NTKSimpleFaceView *)self device];
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  memset(v20, 0, sizeof(v20));
  sub_3E94(v4, (uint64_t)v20);
  +[NTKAnalogUtilities dialDiameterForDevice:v4];
  double v6 = v5 * 0.5 + *((double *)&v21 + 1);
  long long v7 = +[CLKFont systemFontOfSize:*(double *)&v22];
  [v19 center];
  double v17 = v9;
  double v18 = v8;
  uint64_t v10 = 0;
  double height = CGSizeZero.height;
  do
  {
    uint64_t v12 = dword_BDE0[v10];
    uint64_t v13 = objc_opt_new();
    double v14 = +[NSString localizedStringWithFormat:@"%02d", v12];
    [v13 setText:v14];

    [v13 setFont:v7];
    double v15 = +[UIColor whiteColor];
    [v13 setTextColor:v15];

    objc_msgSend(v13, "sizeThatFits:", CGSizeZero.width, height);
    [v7 lineHeight];
    CLKPixelAlignRectForDevice();
    objc_msgSend(v13, "setBounds:");
    __double2 v16 = __sincos_stret((double)(int)v12 * -6.28318531 / 60.0 + 1.57079633);
    objc_msgSend(v13, "setCenter:", v18 + round(v6 * v16.__cosval), v17 - round(v6 * v16.__sinval));
    [v19 addSubview:v13];
    if ((int)v12 > 34)
    {
      if (v12 == 35)
      {
        objc_msgSend(v19, "setDigit_35:", v13);
      }
      else if (v12 == 55)
      {
        objc_msgSend(v19, "setDigit_55:", v13);
      }
    }
    else if (v12 == 5)
    {
      objc_msgSend(v19, "setDigit_05:", v13);
    }
    else if (v12 == 25)
    {
      objc_msgSend(v19, "setDigit_25:", v13);
    }
    ++v10;
  }
  while (v10 != 8);
}

- (id)_createTicksViewForDensityIfNeeded:(unint64_t)a3
{
  double v5 = (id *)&self->_ticksViews[a3];
  double v6 = (NTKSimpleFaceViewTicksView *)*v5;
  if (!v6)
  {
    long long v7 = [NTKSimpleFaceViewTicksView alloc];
    [(NTKSimpleFaceView *)self bounds];
    double v6 = -[NTKSimpleFaceViewTicksView initWithFrame:](v7, "initWithFrame:");
    objc_storeStrong(v5, v6);
    [(NTKSimpleFaceView *)self _createBackgroundViewIfNeeded];
    [(UIView *)self->_backgroundView addSubview:v6];
    double v8 = 0.0;
    if (self->_density == a3) {
      double v8 = 1.0;
    }
    [(NTKSimpleFaceViewTicksView *)v6 setAlpha:v8];
    [(UIView *)self->_backgroundView center];
    double v10 = v9;
    double v12 = v11;
    id v38 = 0;
    id v33 = [(NTKSimpleFaceView *)self _createTicksAndReplicators:&v38 forDensity:a3];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v32 = v38;
    uint64_t v13 = [v32 allValues];
    id v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          double v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v19 = +[UIColor colorWithWhite:0.7 alpha:1.0];
          objc_msgSend(v18, "setContentsMultiplyColor:", objc_msgSend(v19, "CGColor"));

          objc_msgSend(v18, "setPosition:", v10, v12);
          id v20 = [(NTKSimpleFaceViewTicksView *)v6 layer];
          [v20 addSublayer:v18];
        }
        id v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v15);
    }

    long long v21 = [v32 objectForKeyedSubscript:&off_C8A0];
    [(NTKSimpleFaceViewTicksView *)v6 setPills:v21];

    if (a3 == 3) {
      [(NTKSimpleFaceView *)self _addDetailedMinutesToView:v6];
    }
    long long v22 = [v33 objectForKeyedSubscript:&off_C8B8];
    [(NTKSimpleFaceViewTicksView *)v6 setSmallTick:v22];

    long long v23 = [v33 objectForKeyedSubscript:&off_C8D0];
    [(NTKSimpleFaceViewTicksView *)v6 setLargeTick:v23];

    long long v24 = [v33 objectForKeyedSubscript:&off_C8A0];
    [(NTKSimpleFaceViewTicksView *)v6 setPillTick:v24];

    uint64_t v25 = [(NTKSimpleFaceViewTicksView *)v6 smallTick];
    NTKColorByPremultiplyingAlpha();
    id v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

    id v27 = [(NTKSimpleFaceViewTicksView *)v6 largeTick];
    NTKColorByPremultiplyingAlpha();
    id v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", objc_msgSend(v28, "CGColor"));

    id v29 = [(NTKSimpleFaceViewTicksView *)v6 pillTick];
    id v30 = +[UIColor colorWithWhite:0.7 alpha:1.0];
    objc_msgSend(v29, "setBackgroundColor:", objc_msgSend(v30, "CGColor"));
  }

  return v6;
}

- (id)_createTickWithSize:(CGSize)a3 rounded:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  long long v7 = +[CALayer layer];
  objc_msgSend(v7, "setBounds:", CGPointZero.x, CGPointZero.y, width, height);
  id v8 = +[UIColor whiteColor];
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.0);
  double v9 = width * 0.5;
  if (!v4) {
    double v9 = 0.0;
  }
  [v7 setCornerRadius:v9];

  return v7;
}

- (id)_createTicksAndReplicators:(id *)a3 forDensity:(unint64_t)a4
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v7 = [(NTKSimpleFaceView *)self device];
  sub_3E94(v7, (uint64_t)&v27);

  id v8 = [(NTKSimpleFaceView *)self device];
  +[NTKAnalogUtilities dialDiameterForDevice:v8];
  double v10 = v9;

  if (a4 == 1)
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    char v11 = 1;
    uint64_t v12 = 60;
  }
  else
  {
    if (a4 == 3)
    {
      char v11 = 0;
      uint64_t v12 = 240;
      uint64_t v13 = 20;
    }
    else
    {
      if (a4 != 2)
      {
        uint64_t v16 = 0;
        *a3 = 0;
        goto LABEL_12;
      }
      char v11 = 0;
      uint64_t v12 = 120;
      uint64_t v13 = 10;
    }
    uint64_t v14 = 12;
  }
  double v15 = v10 * 0.5;
  uint64_t v16 = objc_opt_new();
  double v17 = objc_opt_new();
  double v18 = *((double *)&v28 + 1);
  id v19 = -[NTKSimpleFaceView _createTickWithSize:rounded:](self, "_createTickWithSize:rounded:", 0, 1.0, *((double *)&v28 + 1));
  id v20 = [(NTKSimpleFaceView *)self _createTickReplicatorForTick:v19 radius:v12 count:v13 skip:v15];
  [v16 setObject:v19 forKeyedSubscript:&off_C8B8];
  [v17 setObject:v20 forKeyedSubscript:&off_C8B8];

  if ((v11 & 1) == 0)
  {
    long long v21 = -[NTKSimpleFaceView _createTickWithSize:rounded:](self, "_createTickWithSize:rounded:", 1, *((double *)&v29 + 1), *(double *)&v30);
    long long v22 = [(NTKSimpleFaceView *)self _createTickReplicatorForTick:v21 radius:v14 count:0 skip:*(double *)&v29];
    [v16 setObject:v21 forKeyedSubscript:&off_C8A0];
    [v17 setObject:v22 forKeyedSubscript:&off_C8A0];

    long long v23 = -[NTKSimpleFaceView _createTickWithSize:rounded:](self, "_createTickWithSize:rounded:", 0, 1.0, v18);
    long long v24 = [(NTKSimpleFaceView *)self _createTickReplicatorForTick:v23 radius:v14 count:0 skip:v15];
    [v16 setObject:v23 forKeyedSubscript:&off_C8D0];
    [v17 setObject:v24 forKeyedSubscript:&off_C8D0];
  }
  id v25 = v17;
  *a3 = v25;

LABEL_12:

  return v16;
}

- (id)_createTickReplicatorForTick:(id)a3 radius:(double)a4 count:(unint64_t)a5 skip:(unint64_t)a6
{
  double v8 = a4 + a4;
  double v9 = 6.28318531 / (double)a5;
  if (a6)
  {
    long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v23.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v23.c = v11;
    *(_OWORD *)&v23.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGFloat v12 = (double)a6 * 6.28318531 / (double)a5;
    *(_OWORD *)&v22.a = *(_OWORD *)&v23.a;
    *(_OWORD *)&v22.c = v11;
    *(_OWORD *)&v22.tx = *(_OWORD *)&v23.tx;
    id v13 = a3;
    CGAffineTransformTranslate(&v23, &v22, 0.0, a4);
    CGAffineTransform v21 = v23;
    CGAffineTransformRotate(&v22, &v21, v9);
    CGAffineTransform v23 = v22;
    CGAffineTransform v21 = v22;
    CGAffineTransformTranslate(&v22, &v21, 0.0, -a4);
    CGAffineTransform v23 = v22;
    [v13 setAffineTransform:&v22];
    objc_msgSend(v13, "setPosition:", a4, 0.0);
    uint64_t v14 = +[CAReplicatorLayer layer];
    objc_msgSend(v14, "setBounds:", 0.0, 0.0, v8, v8);
    objc_msgSend(v14, "setPosition:", a4, a4);
    CATransform3DMakeRotation(&v20, v9, 0.0, 0.0, 1.0);
    [v14 setInstanceTransform:&v20];
    [v14 setInstanceCount:a6 - 1];
    [v14 addSublayer:v13];

    double v15 = +[CAReplicatorLayer layer];
    objc_msgSend(v15, "setBounds:", 0.0, 0.0, v8, v8);
    CATransform3DMakeRotation(&v19, v12, 0.0, 0.0, 1.0);
    [v15 setInstanceTransform:&v19];
    [v15 setInstanceCount:a5 / a6];
    [v15 addSublayer:v14];
  }
  else
  {
    id v16 = a3;
    objc_msgSend(v16, "setPosition:", a4, 0.0);
    double v15 = +[CAReplicatorLayer layer];
    objc_msgSend(v15, "setBounds:", 0.0, 0.0, v8, v8);
    objc_msgSend(v15, "setPosition:", a4, a4);
    CATransform3DMakeRotation(&v18, v9, 0.0, 0.0, 1.0);
    [v15 setInstanceTransform:&v18];
    [v15 setInstanceCount:a5];
    [v15 addSublayer:v16];
  }

  return v15;
}

- (void)_removeComplicationOverlapHiding
{
  id v3 = [(NTKSimpleFaceView *)self device];
  BOOL v4 = (char *)[v3 deviceCategory];

  if (v4 != (unsigned char *)&dword_0 + 1)
  {
    uint64_t v5 = 0;
    ticksViews = self->_ticksViews;
    do
    {
      long long v7 = ticksViews[v5];
      double v8 = [(NTKSimpleFaceViewTicksView *)v7 digit];
      [v8 setHidden:0];

      double v9 = [(NTKSimpleFaceViewTicksView *)v7 digit];
      [v9 setHidden:0];

      double v10 = [(NTKSimpleFaceViewTicksView *)v7 digit];
      [v10 setHidden:0];

      long long v11 = [(NTKSimpleFaceViewTicksView *)v7 digit];

      [v11 setHidden:0];
      ++v5;
    }
    while (v5 != 4);
  }
}

- (void)_updateComplicationOverlapHiding
{
  id v3 = [(NTKSimpleFaceView *)self device];
  BOOL v4 = (char *)[v3 deviceCategory];

  if (v4 != (unsigned char *)&dword_0 + 1)
  {
    id v16 = [(NTKSimpleFaceView *)self delegate];
    uint64_t v5 = 0;
    ticksViews = self->_ticksViews;
    uint64_t v7 = NTKComplicationSlotTopRight;
    uint64_t v8 = NTKComplicationSlotBottomRight;
    uint64_t v9 = NTKComplicationSlotBottomLeft;
    uint64_t v10 = NTKComplicationSlotTopLeft;
    do
    {
      long long v11 = ticksViews[v5];
      CGFloat v12 = [(NTKSimpleFaceViewTicksView *)v11 digit];
      objc_msgSend(v12, "setHidden:", objc_msgSend(v16, "faceViewComplicationIsEmptyForSlot:", v7) ^ 1);

      id v13 = [(NTKSimpleFaceViewTicksView *)v11 digit];
      objc_msgSend(v13, "setHidden:", objc_msgSend(v16, "faceViewComplicationIsEmptyForSlot:", v8) ^ 1);

      uint64_t v14 = [(NTKSimpleFaceViewTicksView *)v11 digit];
      objc_msgSend(v14, "setHidden:", objc_msgSend(v16, "faceViewComplicationIsEmptyForSlot:", v9) ^ 1);

      double v15 = [(NTKSimpleFaceViewTicksView *)v11 digit];

      objc_msgSend(v15, "setHidden:", objc_msgSend(v16, "faceViewComplicationIsEmptyForSlot:", v10) ^ 1);
      ++v5;
    }
    while (v5 != 4);
  }
}

- (id)_keylineViewForDensityEditing
{
  return (id)_NTKKeylineViewWithFullScreenContinuousCurves(self, a2);
}

- (id)_dateComplicationFontForStyle:(unint64_t)a3
{
  BOOL v4 = [(NTKSimpleFaceView *)self device];
  id v5 = [v4 sizeClass];

  double v6 = 11.0;
  if (!v5) {
    double v6 = 10.0;
  }
  double v7 = 17.0;
  if (!v5) {
    double v7 = 15.0;
  }
  if (a3 == 4) {
    double v6 = v7;
  }
  uint64_t v8 = +[CLKFont systemFontOfSize:v6];

  return v8;
}

- (double)_secondHandAlphaForEditMode:(int64_t)a3
{
  if (a3 == 1) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (a3 == 11) {
    return 0.0;
  }
  return result;
}

- (double)_handsAlphaForEditMode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      return NTKEditModeDimmedAlpha;
    case 11:
      return 0.0;
    case 10:
      return NTKEditModeDimmedAlpha;
  }
  return 1.0;
}

- (double)_backgroundAlphaForEditMode:(int64_t)a3
{
  if (a3 == 1) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (a3 == 10) {
    return NTKEditModeDimmedAlpha + NTKEditModeDimmedAlpha;
  }
  return result;
}

- (void)_updateDateComplicationPositionIfNecessary
{
  uint64_t v3 = NTKComplicationSlotDate;
  BOOL v4 = [(NTKSimpleFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotDate];
  id v31 = [v4 display];

  if (v31)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(NTKSimpleFaceView *)self complicationLayoutforSlot:v3];
      double v6 = [v5 defaultLayoutRuleForState:0];
      double v7 = [v5 defaultLayoutRuleForState:1];
      uint64_t v8 = [v5 defaultLayoutRuleForState:3];
      uint64_t v9 = [v5 defaultLayoutRuleForState:2];
      [v6 referenceFrame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      id v16 = v31;
      double v17 = (int *)[v16 dateStyle];
      self->_dateStyle = (unint64_t)v17;
      objc_msgSend(v16, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      double v19 = v18;

      [(NTKUtilityComplicationFactory *)self->_complicationFactory maxDateWidthLeavingRoomForKeylines];
      double v21 = v20;
      [(NTKSimpleFaceView *)self bounds];
      double Width = CGRectGetWidth(v33);
      [(NTKSimpleFaceView *)self _dateComplicationCenterOffset];
      double v24 = Width * 0.5 + v23 - v21 * 0.5;
      [(NTKSimpleFaceView *)self _dateComplicationRightAlignment];
      double v26 = v25;
      objc_msgSend(v8, "setReferenceFrame:", v24, v11, v13, v15);
      objc_msgSend(v9, "setReferenceFrame:", v24, v11, v13, v15);
      BOOL v27 = v17 == &dword_4;
      BOOL v28 = v17 != &dword_4;
      if (v27) {
        double v29 = Width - v26 - v19;
      }
      else {
        double v29 = v24;
      }
      objc_msgSend(v6, "setReferenceFrame:", v29, v11, v13, v15);
      [v6 setHorizontalLayout:v28];
      objc_msgSend(v7, "setReferenceFrame:", v29, v11, v13, v15);
      [v7 setHorizontalLayout:v28];
      long long v30 = [(NTKSimpleFaceView *)self delegate];
      [v30 faceViewWantsComplicationKeylineFramesReloaded];
    }
  }
}

- (double)_dateComplicationRightAlignment
{
  uint64_t v3 = [(NTKSimpleFaceView *)self device];
  sub_3E94(v3, (uint64_t)&v6);

  if (self->_density >= 2) {
    BOOL v4 = (double *)&v7 + 1;
  }
  else {
    BOOL v4 = (double *)&v8;
  }
  return *v4;
}

- (double)_dateComplicationCenterOffset
{
  uint64_t v3 = [(NTKSimpleFaceView *)self device];
  sub_3E94(v3, (uint64_t)&v6);

  if (self->_density >= 2) {
    BOOL v4 = (double *)&v7 + 1;
  }
  else {
    BOOL v4 = (double *)&v8;
  }
  return *v4;
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentColor, 0);
  for (uint64_t i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_ticksViews[i], 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_ticksLargeColor, 0);
  objc_storeStrong((id *)&self->_ticksSmallColor, 0);

  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end