@interface NTKCharacterFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (void)_prewarmForDevice:(id)a3;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_isAnalog;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_needsForegroundContainerView;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (CGRect)_tapToSpeakRect;
- (NTKCharacterFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_verticalPaddingForStatusBar;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_newScaleView;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (unint64_t)textLayoutStyleForSlot:(int64_t)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyDataModeFromOldDataMode:(int64_t)a3;
- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_faceTapped:(id)a3;
- (void)_loadContentViews;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_scrubToDate:(id)a3 animated:(BOOL)a4;
- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_unloadContentViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationViewsAlphasWithAnimation:(BOOL)a3;
- (void)layoutSubviews;
@end

@implementation NTKCharacterFaceView

- (NTKCharacterFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKCharacterFaceView;
  v9 = [(NTKCharacterFaceView *)&v15 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = (NTKUtilityComplicationFactory *)[objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v10;

    [(NTKUtilityComplicationFactory *)v9->_complicationFactory setDelegate:v9];
    [(NTKUtilityComplicationFactory *)v9->_complicationFactory setFaceView:v9];
    [(NTKCharacterFaceView *)v9 setComplicationFactory:v9->_complicationFactory];
    v9->_optionCharacter = 0;
    uint64_t v12 = +[UIColor redColor];
    optionClothingColor = v9->_optionClothingColor;
    v9->_optionClothingColor = (UIColor *)v12;

    v9->_optionClothingDesaturation = 0.0;
  }

  return v9;
}

- (id)createFaceColorPalette
{
  v2 = [[NTKCharacterColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)colorPalette
{
  return [(NTKCharacterFaceView *)self faceColorPalette];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCharacterFaceView;
  [(NTKCharacterFaceView *)&v4 layoutSubviews];
  if (*((unsigned char *)self + 56))
  {
    v3 = [(NTKCharacterFaceView *)self timeView];
    [(NTKCharacterFaceView *)self bounds];
    objc_msgSend(v3, "ntk_setBoundsAndPositionFromFrame:");
  }
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
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
  else if ([v3 isEqualToString:NTKComplicationSlotBottomCenter])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int64_t v4 = (id *)&NTKComplicationSlotTopLeft;
      goto LABEL_7;
    case 10:
      int64_t v4 = (id *)&NTKComplicationSlotBottomCenter;
LABEL_7:
      id v5 = *v4;
      return v5;
    case 2:
      int64_t v4 = (id *)&NTKComplicationSlotTopRight;
      goto LABEL_7;
  }
  id v5 = 0;
  return v5;
}

- (void)_loadLayoutRules
{
  [(NTKCharacterFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v22[0] = NTKComplicationSlotTopLeft;
  v22[1] = NTKComplicationSlotTopRight;
  v22[2] = NTKComplicationSlotBottomCenter;
  v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3, 0);
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
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
        v17 = [(NTKCharacterFaceView *)self complicationLayoutforSlot:v16];
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v17, [(NTKCharacterFaceView *)self _utilitySlotForSlot:v16], v4, v6, v8, v10);
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v13);
  }
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  complicationFactory = self->_complicationFactory;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NTKUtilityComplicationFactory *)complicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKCharacterFaceView *)self _utilitySlotForSlot:v9]];

  [(NTKCharacterFaceView *)self _configureComplicationView:v11 forSlot:v9];
  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(NTKUtilityComplicationFactory *)self->_complicationFactory configureComplicationView:v10 forSlot:v6];
  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    complicationFactory = self->_complicationFactory;
    id v8 = v10;
    [(NTKUtilityComplicationFactory *)complicationFactory foregroundAlphaForEditing:[(NTKCharacterFaceView *)self editing]];
    objc_msgSend(v8, "setForegroundAlpha:");
    [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundImageAlphaForEditing:[(NTKCharacterFaceView *)self editing]];
    objc_msgSend(v8, "setForegroundImageAlpha:");
    objc_msgSend(v8, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKCharacterFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v6)));
    id v9 = +[UIColor clearColor];
    [v8 setBackgroundColor:v9];
  }
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  double v3 = [(NTKCharacterFaceView *)self device];
  unint64_t v4 = [v3 deviceCategory] != (char *)&dword_0 + 1;

  return v4;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  id v16 = a8;
  if ((char *)[(NTKCharacterFaceView *)self _layoutStyleForSlot:"_layoutStyleForSlot:"] == (char *)&dword_0 + 1)
  {
    int64_t v14 = [(NTKCharacterFaceView *)self _utilitySlotForSlot:v16];
    objc_super v15 = [(NTKCharacterFaceView *)self device];
    +[NTKUtilityComplicationFactory curvedCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v14 forDevice:v15];
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  complicationFactory = self->_complicationFactory;
  int64_t v6 = [(NTKCharacterFaceView *)self _utilitySlotForSlot:a4];

  return (int64_t)[(NTKUtilityComplicationFactory *)complicationFactory layoutOverrideForComplicationType:a3 inSlot:v6];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKUtilityComplicationFactory *)self->_complicationFactory keylineViewForSlot:[(NTKCharacterFaceView *)self _utilitySlotForSlot:v4]];
  int64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKCharacterFaceView;
    id v7 = [(NTKCharacterFaceView *)&v10 _keylineViewForComplicationSlot:v4];
  }
  id v8 = v7;

  return v8;
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCharacterFaceView;
  [(NTKCharacterFaceView *)&v8 _keylineFrameForComplicationSlot:a3 selected:0];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  complicationFactory = self->_complicationFactory;
  int64_t v4 = [(NTKCharacterFaceView *)self _utilitySlotForSlot:a3];

  [(NTKUtilityComplicationFactory *)complicationFactory keylineCornerRadiusForSlot:v4];
  return result;
}

- (void)_configureForEditMode:(int64_t)a3
{
  [(NTKCharacterFaceView *)self _applyForegroundAlphaForTransitionFraction:a3 fromEditMode:a3 toEditMode:0.0];
  characterTimeView = self->_characterTimeView;

  [(NTKCharacterTimeView *)characterTimeView _configureForEditMode:a3];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKCharacterFaceView _applyForegroundAlphaForTransitionFraction:fromEditMode:toEditMode:](self, "_applyForegroundAlphaForTransitionFraction:fromEditMode:toEditMode:");
  characterTimeView = self->_characterTimeView;

  [(NTKCharacterTimeView *)characterTimeView _configureForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (unint64_t)a4 > 1;
}

- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  CLKInterpolateBetweenFloatsClipped();
  characterTimeView = self->_characterTimeView;

  -[NTKCharacterTimeView setAlpha:](characterTimeView, "setAlpha:");
}

- (id)_newScaleView
{
  id v3 = objc_alloc((Class)UIView);
  [(NTKCharacterFaceView *)self bounds];

  return objc_msgSend(v3, "initWithFrame:");
}

- (void)_loadContentViews
{
  id v3 = [NTKCharacterTimeView alloc];
  [(NTKCharacterFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(NTKCharacterFaceView *)self device];
  id v13 = -[NTKCharacterTimeView initWithFrame:forDevice:](v3, "initWithFrame:forDevice:", v12, v5, v7, v9, v11);
  characterTimeView = self->_characterTimeView;
  self->_characterTimeView = v13;

  [(NTKCharacterTimeView *)self->_characterTimeView setCharacter:self->_optionCharacter];
  [(NTKCharacterTimeView *)self->_characterTimeView setClothingColor:self->_optionClothingColor andDesaturation:self->_optionClothingDesaturation];
  objc_super v15 = [(NTKCharacterFaceView *)self _newScaleView];
  scaleView = self->_scaleView;
  self->_scaleView = v15;

  [(UIView *)self->_scaleView addSubview:self->_characterTimeView];
  [(NTKCharacterFaceView *)self insertSubview:self->_scaleView atIndex:0];
  [(NTKCharacterFaceView *)self setTimeView:self->_characterTimeView];
  [(NTKCharacterFaceView *)self setNeedsLayout];
  id v17 = [(NTKCharacterFaceView *)self dataMode];
  self->_prevDataMode = (int64_t)v17;

  [(NTKCharacterFaceView *)self _applyDataModeFromOldDataMode:v17];
}

- (void)_unloadContentViews
{
  [(NTKCharacterTimeView *)self->_characterTimeView removeFromSuperview];
  [(NTKCharacterFaceView *)self setTimeView:0];
  characterTimeView = self->_characterTimeView;
  self->_characterTimeView = 0;

  [(UIView *)self->_scaleView removeFromSuperview];
  scaleView = self->_scaleView;
  self->_scaleView = 0;
}

- (void)_loadSnapshotContentViews
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%p _loadSnapshotContentViews", (uint8_t *)&v6, 0xCu);
  }

  if ((*((unsigned char *)self + 56) & 1) == 0)
  {
    double v4 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_faceTapped:"];
    timeTapRecognizer = self->_timeTapRecognizer;
    self->_timeTapRecognizer = v4;

    [(UITapGestureRecognizer *)self->_timeTapRecognizer setDelegate:self];
    [(NTKCharacterFaceView *)self addGestureRecognizer:self->_timeTapRecognizer];
    [(NTKCharacterFaceView *)self _loadContentViews];
    *((unsigned char *)self + 56) |= 1u;
  }
}

- (void)_unloadSnapshotContentViews
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%p _unloadSnapshotContentViews", (uint8_t *)&v5, 0xCu);
  }

  if (*((unsigned char *)self + 56))
  {
    [(NTKCharacterFaceView *)self removeGestureRecognizer:self->_timeTapRecognizer];
    timeTapRecognizer = self->_timeTapRecognizer;
    self->_timeTapRecognizer = 0;

    [(NTKCharacterFaceView *)self _unloadContentViews];
    *((unsigned char *)self + 56) &= ~1u;
  }
}

+ (void)_prewarmForDevice:(id)a3
{
  id obj = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_262D0);
  id WeakRetained = objc_loadWeakRetained(&qword_262D8);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_262D8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_262E0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_262D8, obj);
  qword_262E0 = (uint64_t)[obj version];

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_262D0);
}

- (void)_applyDataModeFromOldDataMode:(int64_t)a3
{
  id v5 = (char *)[(NTKCharacterFaceView *)self dataMode];
  if (v5 == (unsigned char *)&dword_0 + 3)
  {
    characterTimeView = self->_characterTimeView;
    NTKIdealizedDate();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(NTKCharacterTimeView *)characterTimeView setOverrideDate:v9 animated:a3 == 1 enteringOrb:1];
  }
  else if (v5 == (unsigned char *)&dword_0 + 1)
  {
    [(NTKCharacterTimeView *)self->_characterTimeView setFrozen:0];
    if (a3 == 3)
    {
      id v6 = self->_characterTimeView;
      [(NTKCharacterTimeView *)v6 setOverrideDate:0 animated:1 enteringOrb:0];
    }
  }
  else
  {
    if (a3 == 3) {
      [(NTKCharacterTimeView *)self->_characterTimeView setOverrideDate:0 animated:0 enteringOrb:0];
    }
    id v8 = self->_characterTimeView;
    [(NTKCharacterTimeView *)v8 setFrozen:1];
  }
}

- (void)_applyDataMode
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    uint64_t v7 = self;
    __int16 v8 = 2048;
    id v9 = [(NTKCharacterFaceView *)self dataMode];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%p _applyDataMode = %ld", (uint8_t *)&v6, 0x16u);
  }

  if (*((unsigned char *)self + 56))
  {
    id prevDataMode = self->_prevDataMode;
    if (prevDataMode != [(NTKCharacterFaceView *)self dataMode])
    {
      int64_t v5 = self->_prevDataMode;
      self->_id prevDataMode = (int64_t)[(NTKCharacterFaceView *)self dataMode];
      [(NTKCharacterFaceView *)self _applyDataModeFromOldDataMode:v5];
    }
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (!a4)
  {
    uint64_t v18 = v8;
    uint64_t v19 = v7;
    uint64_t v20 = v5;
    uint64_t v21 = v6;
    NTKScaleForRubberBandingFraction();
    CGFloat v11 = v10;
    NTKAlphaForRubberBandingFraction();
    double v13 = v12;
    CGAffineTransformMakeScale(&v17, v11, v11);
    int64_t v14 = [(NTKCharacterFaceView *)self timeView];
    CGAffineTransform v16 = v17;
    [v14 setTransform:&v16];

    objc_super v15 = [(NTKCharacterFaceView *)self timeView];
    [v15 setAlpha:v13];
  }
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)NTKCharacterFaceView;
  [(NTKCharacterFaceView *)&v8 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  uint64_t v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%p _renderSynchronouslyWithImageQueueDiscard = %d", buf, 0x12u);
  }

  if ([(NTKCharacterFaceView *)self dataMode] != &dword_4) {
    [(NTKCharacterTimeView *)self->_characterTimeView renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  }
}

- (BOOL)_isAnalog
{
  return 1;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v22 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    double v10 = [(NTKCharacterFaceView *)self colorPalette];
    __int16 v11 = [v10 primaryColor];
    optionClothingColor = self->_optionClothingColor;
    self->_optionClothingColor = v11;

    double v13 = [(NTKCharacterFaceView *)self colorPalette];
    int64_t v14 = [v13 desaturation];
    [v14 floatValue];
    self->_optionClothingDesaturation = v15;

    characterTimeView = self->_characterTimeView;
    CGAffineTransform v17 = [(NTKCharacterFaceView *)self colorPalette];
    uint64_t v18 = [v17 primaryColor];
    uint64_t v19 = [(NTKCharacterFaceView *)self colorPalette];
    uint64_t v20 = [v19 desaturation];
    [v20 floatValue];
    [(NTKCharacterTimeView *)characterTimeView setClothingColor:v18 andDesaturation:v21];
  }
  else if (a4 == 12)
  {
    id v9 = [v22 character];
    self->_optionCharacter = (unint64_t)v9;
    [(NTKCharacterTimeView *)self->_characterTimeView setCharacter:v9];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v20 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 10)
  {
    int64_t v14 = [(NTKCharacterFaceView *)self interpolatedColorPalette];
    float v15 = [v14 primaryColor];

    CGAffineTransform v16 = [(NTKCharacterFaceView *)self interpolatedColorPalette];
    CGAffineTransform v17 = [v16 desaturation];
    [v17 floatValue];
    double v19 = v18;

    [(NTKCharacterTimeView *)self->_characterTimeView setClothingColor:v15 andDesaturation:v19];
  }
  else if (a6 == 12)
  {
    -[NTKCharacterTimeView applyCharacterTransition:fromCharacter:toCharacter:](self->_characterTimeView, "applyCharacterTransition:fromCharacter:toCharacter:", [v20 character], objc_msgSend(v12, "character"), a3);
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKCharacterFaceView;
  -[NTKCharacterFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v11, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 12 || a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, v7, v7);
    characterTimeView = self->_characterTimeView;
    CGAffineTransform v9 = v10;
    [(NTKCharacterTimeView *)characterTimeView setTransform:&v9];
  }
}

- (void)_prepareForEditing
{
}

- (void)_cleanupAfterEditing
{
}

- (void)_updateComplicationViewsAlphasWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_F3F4;
  v9[3] = &unk_1C918;
  v9[4] = self;
  uint64_t v5 = objc_retainBlock(v9);
  id v6 = v5;
  if (v3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_F4BC;
    v7[3] = &unk_1C940;
    v7[4] = self;
    id v8 = v5;
    +[UIView animateWithDuration:v7 animations:0.1];
  }
  else
  {
    [(NTKCharacterFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
  }
}

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  return 0;
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  BOOL v4 = [(NTKCharacterFaceView *)self _slotForUtilitySlot:a3];
  id v5 = [(NTKCharacterFaceView *)self layoutStyleForSlot:v4];

  return (unint64_t)v5;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  BOOL v4 = &off_1EB08;
  if (a3 != 10) {
    BOOL v4 = 0;
  }
  if (a3 == 12) {
    return &off_1EAF0;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!qword_262E8)
  {
    uint64_t v10 = objc_opt_new();
    objc_super v11 = (void *)qword_262E8;
    qword_262E8 = v10;
  }
  if (a4 == 12)
  {
    id v12 = v8;
    id v13 = [v9 objectForKeyedSubscript:&off_1E8E0];
    int64_t v14 = [v13 pigmentEditOption];

    float v15 = [(NTKCharacterFaceView *)self colorPalette];
    [v15 setPigmentEditOption:v14];

    CGAffineTransform v16 = +[NSString stringWithFormat:@"%@-%@", v12, v14];
    CGAffineTransform v17 = [(id)qword_262E8 objectForKey:v16];
    if (!v17)
    {
      float v18 = CLKLocaleNumberSystemPrefix();
      double v19 = [(NTKCharacterFaceView *)self colorPalette];
      unsigned int v20 = [v19 isVintageColor];

      id v36 = v12;
      float v21 = (char *)[v12 character];
      if (v20)
      {
        CFStringRef v22 = @"Minnie";
        if (v21 != (unsigned char *)&dword_0 + 1) {
          CFStringRef v22 = 0;
        }
        if (!v21) {
          CFStringRef v22 = @"Mickey";
        }
        v23 = +[NSString stringWithFormat:@"Swatch-Character-%@-Vintage-%@", v22, v18];
        CGAffineTransform v17 = +[NTKCharacterFaceBundle imageWithName:v23];
        [(id)qword_262E8 setObject:v17 forKey:v16];
      }
      else
      {
        if (v21)
        {
          v24 = v18;
          v25 = +[NSString stringWithFormat:@"Swatch-Character-Minnie-Background-%@", v18];
          v26 = +[NTKCharacterFaceBundle imageWithName:v25];

          v27 = +[NTKCharacterFaceBundle imageWithName:@"Swatch-Character-Minnie-Clothes"];
          v28 = [(NTKCharacterFaceView *)self colorPalette];
          v29 = [v28 primaryColor];
          v30 = [v27 _flatImageWithColor:v29];

          id v31 = objc_alloc((Class)UIGraphicsImageRenderer);
          [v26 size];
          id v32 = objc_msgSend(v31, "initWithSize:");
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_F8EC;
          v38[3] = &unk_1C968;
          id v39 = v26;
          id v40 = v30;
          id v33 = v30;
          id v34 = v26;
          CGAffineTransform v17 = [v32 imageWithActions:v38];

          float v18 = v24;
        }
        else
        {
          id v32 = +[NSString stringWithFormat:@"Swatch-Character-Mickey-Color-%@", v18];
          CGAffineTransform v17 = +[NTKCharacterFaceBundle imageWithName:v32];
        }

        [(id)qword_262E8 setObject:v17 forKey:v16];
      }

      id v12 = v36;
    }
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)NTKCharacterFaceView;
    CGAffineTransform v17 = [(NTKCharacterFaceView *)&v37 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v17;
}

- (double)_verticalPaddingForStatusBar
{
  v2 = [(NTKCharacterFaceView *)self device];
  if ([v2 sizeClass]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 1.5;
  }

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v4 = (UITapGestureRecognizer *)a3;
  BOOL v5 = 1;
  if (self->_timeTapRecognizer == v4)
  {
    if ([(NTKCharacterFaceView *)self dataMode] != (char *)&dword_0 + 1
      || ([(NTKCharacterFaceView *)self timeScrubbing] & 1) != 0
      || ([(UITapGestureRecognizer *)v4 locationInView:self],
          CGFloat v7 = v6,
          CGFloat v9 = v8,
          [(NTKCharacterFaceView *)self _tapToSpeakRect],
          v11.x = v7,
          v11.y = v9,
          !CGRectContainsPoint(v12, v11)))
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4 = objc_msgSend(a4, "view", a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_faceTapped:(id)a3
{
  [a3 locationInView:self];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [(NTKCharacterFaceView *)self _tapToSpeakRect];
  v10.x = v5;
  v10.y = v7;
  if (CGRectContainsPoint(v11, v10))
  {
    id v8 = [(NTKCharacterFaceView *)self currentDisplayDate];
    [(NTKCharacterFaceView *)self _legacyOutputTime:v8];
  }
}

- (CGRect)_tapToSpeakRect
{
  [(NTKCharacterFaceView *)self bounds];
  double v4 = (v3 - v2) * 0.5;
  double v5 = 0.0;
  double v6 = v2;
  result.size.height = v6;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v5;
  return result;
}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)_scrubToDate:(id)a3 animated:(BOOL)a4
{
}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionClothingColor, 0);
  objc_storeStrong((id *)&self->_timeTapRecognizer, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_destroyWeak((id *)&self->_handsView);
  objc_destroyWeak((id *)&self->_circleView);

  objc_storeStrong((id *)&self->_characterTimeView, 0);
}

@end