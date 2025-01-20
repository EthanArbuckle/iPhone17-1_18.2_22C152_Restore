@interface NTKUtilityFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (id)_swatchImageFaceName;
- (NTKUtilityFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_dateComplicationAlphaForEditMode:(int64_t)a3;
- (double)_dateComplicationCenterOffsetForDensity:(unint64_t)a3;
- (double)_dateComplicationRightAlignmentForDensity:(unint64_t)a3;
- (double)_dialAlphaForEditMode:(int64_t)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_utilityComplicationSlots;
- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (unint64_t)textLayoutStyleForSlot:(int64_t)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_setTypeface:(unint64_t)a3;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateDateComplicationPositionFromDensity:(unint64_t)a3 toDensity:(unint64_t)a4 fraction:(double)a5;
- (void)_updateDateComplicationPositionIfNecessary;
- (void)dealloc;
- (void)sensitiveUIStateChanged;
@end

@implementation NTKUtilityFaceView

- (NTKUtilityFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKUtilityFaceView;
  v9 = [(NTKUtilityFaceView *)&v15 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    memset(v14, 0, sizeof(v14));
    sub_788C(v8, v14);
    v10 = (NTKUtilityComplicationFactory *)[objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    utilityComplicationFactory = v9->_utilityComplicationFactory;
    v9->_utilityComplicationFactory = v10;

    [(NTKUtilityComplicationFactory *)v9->_utilityComplicationFactory setFaceView:v9];
    [(NTKUtilityComplicationFactory *)v9->_utilityComplicationFactory setDelegate:v9];
    [(NTKUtilityComplicationFactory *)v9->_utilityComplicationFactory setIncludesDateComplicationLayoutRules:1];
    [(NTKUtilityComplicationFactory *)v9->_utilityComplicationFactory setDateKeylineMaxWidth:*(double *)&v14[0].receiver];
    [(NTKUtilityComplicationFactory *)v9->_utilityComplicationFactory setDateHorizontalCenterOffset:*(double *)&v14[0].super_class];
    [(NTKUtilityComplicationFactory *)v9->_utilityComplicationFactory setForegroundAlpha:0.83];
    [(NTKUtilityComplicationFactory *)v9->_utilityComplicationFactory setForegroundImageAlpha:1.0];
    [(NTKUtilityFaceView *)v9 setComplicationFactory:v9->_utilityComplicationFactory];
    v12 = +[CLKSensitiveUIMonitor sharedMonitor];
    [v12 addSensitiveUIObserver:v9];
  }
  return v9;
}

- (void)dealloc
{
  v3 = +[CLKSensitiveUIMonitor sharedMonitor];
  [v3 removeSensitiveUIObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityFaceView;
  [(NTKUtilityFaceView *)&v4 dealloc];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUtilityFaceView;
  [(NTKUtilityFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKUtilityFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityFaceView;
  [(NTKUtilityFaceView *)&v4 _unloadSnapshotContentViews];
  [(NTKUtilityFaceDialView *)self->_dialView removeFromSuperview];
  dialView = self->_dialView;
  self->_dialView = 0;
}

- (void)_setupViews
{
  v17.receiver = self;
  v17.super_class = (Class)NTKUtilityFaceView;
  [(NTKUtilityFaceView *)&v17 _loadSnapshotContentViews];
  if (!self->_dialView)
  {
    objc_super v3 = [NTKUtilityFaceDialView alloc];
    objc_super v4 = [(NTKUtilityFaceView *)self device];
    v5 = [(NTKUtilityFaceDialView *)v3 initWithDevice:v4];
    dialView = self->_dialView;
    self->_dialView = v5;

    [(NTKUtilityFaceDialView *)self->_dialView setStyle:0];
    v7 = [(NTKUtilityFaceView *)self contentView];
    [v7 addSubview:self->_dialView];
  }
  id v8 = +[UIColor blackColor];
  v9 = [(NTKUtilityFaceView *)self timeView];
  v10 = [v9 minuteHandView];
  [v10 setHandDotColor:v8];

  v11 = +[UIColor blackColor];
  v12 = [(NTKUtilityFaceView *)self timeView];
  v13 = [v12 secondHandView];
  [v13 setHandDotColor:v11];

  v14 = +[UIColor blackColor];
  objc_super v15 = [(NTKUtilityFaceView *)self timeView];
  v16 = [v15 hourHandView];
  [v16 setHandDotColor:v14];

  [(NTKUtilityFaceView *)self _updateDateComplicationPositionIfNecessary];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKUtilityFaceView;
  -[NTKUtilityFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v15, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKUtilityFaceView *)self _dialAlphaForEditMode:a4];
  [(NTKUtilityFaceView *)self _dialAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKUtilityFaceDialView setAlpha:](self->_dialView, "setAlpha:");
  [(NTKUtilityFaceView *)self _timeViewAlphaForEditMode:a4];
  [(NTKUtilityFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v10 = v9;
  v11 = [(NTKUtilityFaceView *)self timeView];
  [v11 setAlpha:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_7E58;
  v14[3] = &unk_10628;
  objc_super v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  *(double *)&v14[7] = a3;
  [(NTKUtilityFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v14];
  v12 = [(NTKUtilityFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotDate];
  v13 = [v12 display];

  [(NTKUtilityFaceView *)self _dateComplicationAlphaForEditMode:a4];
  [(NTKUtilityFaceView *)self _dateComplicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v13, "setAlpha:");
}

- (double)_dialAlphaForEditMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD) {
    return 0.3;
  }
  double result = 1.0;
  if (((1 << a3) & 0x2801) == 0) {
    return 0.3;
  }
  return result;
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
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

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (double)_dateComplicationAlphaForEditMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (((1 << a3) & 0x403) == 0) {
    return NTKEditModeDimmedAlpha;
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKUtilityFaceView;
  [(NTKUtilityFaceView *)&v20 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  switch(a4)
  {
    case 13:
      -[NTKUtilityFaceView _setTypeface:](self, "_setTypeface:", [v8 typeface]);
      break;
    case 11:
      id v18 = [v8 density];
      [(NTKUtilityFaceDialView *)self->_dialView setStyle:v18];
      self->_density = (unint64_t)v18;
      [(NTKUtilityFaceView *)self _updateDateComplicationPositionIfNecessary];
      [(NTKUtilityFaceView *)self layoutComplicationViews];
      break;
    case 10:
      double v9 = [(NTKUtilityFaceView *)self device];
      double v10 = [(NTKUtilityFaceView *)self faceColorPalette];
      v11 = +[NTKFaceColorScheme colorSchemeForDevice:v9 withFaceColorPalette:v10 units:392];

      v12 = [(NTKUtilityFaceView *)self timeView];
      v13 = [v11 accentColor];
      [v12 applySecondHandColor:v13];

      dialView = self->_dialView;
      objc_super v15 = [v11 tickColor];
      [(NTKUtilityFaceDialView *)dialView setTickColor:v15];

      v16 = [v11 accentColor];
      accentColor = self->_accentColor;
      self->_accentColor = v16;

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_8188;
      v19[3] = &unk_10650;
      v19[4] = self;
      [(NTKUtilityFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v19];

      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v31.receiver = self;
  v31.super_class = (Class)NTKUtilityFaceView;
  [(NTKUtilityFaceView *)&v31 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  switch(a6)
  {
    case 13:
      -[NTKUtilityFaceDialView transitionFromTypeface:toTypeface:withFraction:](self->_dialView, "transitionFromTypeface:toTypeface:withFraction:", [v12 typeface], objc_msgSend(v13, "typeface"), a3);
      break;
    case 11:
      id v26 = [v12 density];
      id v27 = [v13 density];
      [(NTKUtilityFaceDialView *)self->_dialView transitionFromStyle:v26 toStyle:v27 withFraction:a3];
      [(NTKUtilityFaceView *)self _updateDateComplicationPositionFromDensity:v26 toDensity:v27 fraction:a3];
      break;
    case 10:
      v28 = [(NTKUtilityFaceView *)self device];
      v29 = [(NTKUtilityFaceView *)self interpolatedColorPalette];
      v14 = [v29 fromPalette];
      objc_super v15 = +[NTKFaceColorScheme colorSchemeForDevice:v28 withFaceColorPalette:v14 units:392];
      v16 = [(NTKUtilityFaceView *)self device];
      objc_super v17 = [(NTKUtilityFaceView *)self interpolatedColorPalette];
      id v18 = [v17 toPalette];
      v19 = +[NTKFaceColorScheme colorSchemeForDevice:v16 withFaceColorPalette:v18 units:392];
      objc_super v20 = +[NTKFaceColorScheme interpolationFrom:v15 to:v19 fraction:a3];

      v21 = [v20 accentColor];
      accentColor = self->_accentColor;
      self->_accentColor = v21;

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_84E0;
      v30[3] = &unk_10650;
      v30[4] = self;
      [(NTKUtilityFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v30];
      dialView = self->_dialView;
      v24 = [v20 tickColor];
      [(NTKUtilityFaceDialView *)dialView setTickColor:v24];

      v25 = [(NTKUtilityFaceView *)self timeView];
      [v25 applySecondHandColor:self->_accentColor];

      break;
  }
}

- (void)_setTypeface:(unint64_t)a3
{
  unint64_t v3 = a3;
  self->_unint64_t typeface = a3;
  v5 = [(NTKUtilityFaceView *)self device];
  if (NTKShowIndicScriptNumerals())
  {

    goto LABEL_7;
  }
  unint64_t typeface = self->_typeface;
  if (typeface - 3 >= 0xB)
  {

    if (typeface != 14) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  unint64_t v3 = 0;
LABEL_7:
  dialView = self->_dialView;

  [(NTKUtilityFaceDialView *)dialView setTypeface:v3];
}

- (void)sensitiveUIStateChanged
{
}

- (id)_utilityComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomCenter;
  v4[3] = NTKComplicationSlotDate;
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

- (void)_loadLayoutRules
{
  [(NTKUtilityFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NTKUtilityFaceView *)self _utilityComplicationSlots];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
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
        objc_super v17 = [(NTKUtilityFaceView *)self complicationLayoutforSlot:v16];
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_utilityComplicationFactory, "configureComplicationLayout:forSlot:withBounds:", v17, [(NTKUtilityFaceView *)self _utilitySlotForSlot:v16], v4, v6, v8, v10);
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  utilityComplicationFactory = self->_utilityComplicationFactory;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NTKUtilityComplicationFactory *)utilityComplicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKUtilityFaceView *)self _utilitySlotForSlot:v9]];

  [(NTKUtilityFaceView *)self _configureComplicationView:v11 forSlot:v9];
  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKUtilityFaceView;
  [(NTKUtilityFaceView *)&v12 _configureComplicationView:v6 forSlot:v7];
  double v8 = [(NTKUtilityFaceView *)self faceColorPalette];
  id v9 = +[NTKPigmentEditOption pigmentNamed:ntk_special_multicolor];
  id v10 = [v8 copyWithOption:v9];

  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v11 = v6;
    [v11 applyFaceColorPalette:v10 units:1];
    [(NTKUtilityComplicationFactory *)self->_utilityComplicationFactory foregroundAlphaForEditing:[(NTKUtilityFaceView *)self editing]];
    objc_msgSend(v11, "setForegroundAlpha:");
    [(NTKUtilityComplicationFactory *)self->_utilityComplicationFactory foregroundImageAlphaForEditing:[(NTKUtilityFaceView *)self editing]];
    objc_msgSend(v11, "setForegroundImageAlpha:");
    [v11 setAccentColor:self->_accentColor];
    objc_msgSend(v11, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKUtilityFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v7)));
  }
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  if ([a3 isEqualToString:NTKComplicationSlotDate]) {
    return 0;
  }
  double v5 = [(NTKUtilityFaceView *)self device];
  unint64_t v4 = [v5 deviceCategory] != (char *)&dword_0 + 1;

  return v4;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  id v16 = a8;
  if ((char *)[(NTKUtilityFaceView *)self _layoutStyleForSlot:"_layoutStyleForSlot:"] == (char *)&dword_0 + 1)
  {
    int64_t v14 = [(NTKUtilityFaceView *)self _utilitySlotForSlot:v16];
    objc_super v15 = [(NTKUtilityFaceView *)self device];
    +[NTKUtilityComplicationFactory curvedCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v14 forDevice:v15];
  }
}

- (double)_dateComplicationRightAlignmentForDensity:(unint64_t)a3
{
  unint64_t v4 = [(NTKUtilityFaceView *)self device];
  sub_788C(v4, &v7);

  double v5 = (double *)&v8 + 1;
  if (a3) {
    double v5 = (double *)&v8;
  }
  return *v5;
}

- (double)_dateComplicationCenterOffsetForDensity:(unint64_t)a3
{
  unint64_t v4 = [(NTKUtilityFaceView *)self device];
  sub_788C(v4, &v7);

  double v5 = (double *)&v8 + 1;
  if (a3) {
    double v5 = (double *)&v8;
  }
  return *v5;
}

- (void)_updateDateComplicationPositionIfNecessary
{
  uint64_t v3 = NTKComplicationSlotDate;
  unint64_t v4 = [(NTKUtilityFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotDate];
  id v31 = [v4 display];

  if (v31)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [(NTKUtilityFaceView *)self complicationLayoutforSlot:v3];
      id v6 = [v5 defaultLayoutRuleForState:0];
      long long v7 = [v5 defaultLayoutRuleForState:1];
      long long v8 = [v5 defaultLayoutRuleForState:3];
      id v9 = [v5 defaultLayoutRuleForState:2];
      [v6 referenceFrame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      id v16 = v31;
      objc_super v17 = (int *)[v16 dateStyle];
      objc_msgSend(v16, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      double v19 = v18;

      [(NTKUtilityComplicationFactory *)self->_utilityComplicationFactory maxDateWidthLeavingRoomForKeylines];
      double v21 = v20;
      [(NTKUtilityFaceView *)self bounds];
      double Width = CGRectGetWidth(v33);
      [(NTKUtilityFaceView *)self _dateComplicationCenterOffsetForDensity:self->_density];
      double v24 = Width * 0.5 + v23 - v21 * 0.5;
      [(NTKUtilityFaceView *)self _dateComplicationRightAlignmentForDensity:self->_density];
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
      v30 = [(NTKUtilityFaceView *)self delegate];
      [v30 faceViewWantsComplicationKeylineFramesReloaded];
    }
  }
}

- (void)_updateDateComplicationPositionFromDensity:(unint64_t)a3 toDensity:(unint64_t)a4 fraction:(double)a5
{
  uint64_t v8 = NTKComplicationSlotDate;
  id v9 = [(NTKUtilityFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotDate];
  id v32 = [v9 display];

  if (v32)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v32;
      double v11 = [(NTKUtilityFaceView *)self complicationLayoutforSlot:v8];
      double v12 = (int *)[v10 dateStyle];
      objc_msgSend(v10, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      double v14 = v13;

      [(NTKUtilityComplicationFactory *)self->_utilityComplicationFactory maxDateWidthLeavingRoomForKeylines];
      double v16 = v15;
      [(NTKUtilityFaceView *)self bounds];
      double Width = CGRectGetWidth(v34);
      [(NTKUtilityFaceView *)self _dateComplicationCenterOffsetForDensity:a3];
      [(NTKUtilityFaceView *)self _dateComplicationRightAlignmentForDensity:a3];
      [(NTKUtilityFaceView *)self _dateComplicationCenterOffsetForDensity:a4];
      [(NTKUtilityFaceView *)self _dateComplicationRightAlignmentForDensity:a4];
      CLKInterpolateBetweenFloatsClipped();
      double v19 = v18;
      CLKInterpolateBetweenFloatsClipped();
      double v20 = Width * 0.5 + v19 - v16 * 0.5;
      double v22 = Width - v21 - v14;
      double v23 = [v11 defaultLayoutRuleForState:0];
      [v23 referenceFrame];
      if (v12 == &dword_4) {
        double v20 = v22;
      }
      double v24 = [(NTKUtilityFaceView *)self normalComplicationDisplayWrapperForSlot:v8];
      [v24 frame];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      id v31 = [(NTKUtilityFaceView *)self normalComplicationDisplayWrapperForSlot:v8];
      objc_msgSend(v31, "setFrame:", v20, v26, v28, v30);
    }
  }
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  unint64_t v4 = [(NTKUtilityFaceView *)self _slotForUtilitySlot:a3];
  id v5 = [(NTKUtilityFaceView *)self layoutStyleForSlot:v4];

  return (unint64_t)v5;
}

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  unint64_t v4 = [(NTKUtilityFaceView *)self device];
  sub_788C(v4, &v8);

  id v5 = (double *)&v9 + 1;
  if (a3 != 4) {
    id v5 = (double *)&v9;
  }
  double v6 = *v5;

  return +[CLKFont systemFontOfSize:v6];
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
    id v5 = *(id *)*(&off_106C0 + v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)_swatchImageFaceName
{
  return @"Utility";
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  int64_t v4 = &off_116C0;
  if (a3 != 11) {
    int64_t v4 = 0;
  }
  if (a3 == 13) {
    return &off_116A8;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(NTKUtilityFaceView *)self device];
  if (a4 == 11)
  {
    id v44 = v9;
    double v12 = [(NTKUtilityFaceView *)self optionForCustomEditMode:13 slot:0];
    id v41 = v8;
    double v11 = v8;
    id v8 = v12;
    goto LABEL_5;
  }
  if (a4 == 13)
  {
    id v44 = v9;
    double v11 = [(NTKUtilityFaceView *)self optionForCustomEditMode:11 slot:0];
    double v12 = v11;
    id v41 = v8;
LABEL_5:
    id v13 = [v11 density];
    id v14 = [v8 typeface];

    double v15 = +[NTKUtilityFaceDialFactory dialImageForDevice:v10];
    v43 = [v15 imageWithRenderingMode:2];

    v42 = +[NTKUtilityFaceDialFactory numbersImageForStyle:v13 typeface:v14 device:v10];
    id v16 = [objc_alloc((Class)UIImageView) initWithImage:v43];
    id v17 = [objc_alloc((Class)UIImageView) initWithImage:v42];
    id v18 = [objc_alloc((Class)NTKAnalogHandsView) initForDevice:v10];
    double v19 = NTKIdealizedDate();
    [v18 setOverrideDate:v19 duration:0.0];

    double v20 = +[UIColor blackColor];
    double v21 = [v18 minuteHandView];
    [v21 setHandDotColor:v20];

    double v22 = +[UIColor blackColor];
    double v23 = [v18 secondHandView];
    [v23 setHandDotColor:v22];

    double v24 = +[UIColor blackColor];
    double v25 = [v18 hourHandView];
    [v25 setHandDotColor:v24];

    double v26 = [(NTKUtilityFaceView *)self optionForCustomEditMode:10 slot:0];
    double v27 = [v26 pigmentEditOption];

    double v28 = [(NTKUtilityFaceView *)self faceColorPalette];
    id v29 = [v28 copy];

    id v30 = [objc_alloc((Class)NTKFaceColorPaletteConfiguration) initWithPigmentEditOption:v27];
    [v29 setConfiguration:v30];

    id v31 = +[NTKFaceColorScheme colorSchemeForDevice:v10 withFaceColorPalette:v29 units:392];
    id v32 = [v31 accentColor];
    [v18 applySecondHandColor:v32];

    CGRect v33 = [v31 tickColor];
    [v16 setTintColor:v33];

    id v34 = objc_alloc((Class)UIView);
    [v16 bounds];
    id v35 = objc_msgSend(v34, "initWithFrame:");
    [v35 addSubview:v16];
    [v35 addSubview:v17];
    [v35 addSubview:v18];
    [v35 center];
    objc_msgSend(v18, "setCenter:");
    id v36 = objc_alloc((Class)UIGraphicsImageRenderer);
    [v16 bounds];
    id v37 = objc_msgSend(v36, "initWithBounds:");
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_97A0;
    v46[3] = &unk_10678;
    id v47 = v35;
    id v38 = v35;
    v39 = [v37 imageWithActions:v46];

    id v9 = v44;
    id v8 = v41;
    goto LABEL_7;
  }
  v45.receiver = self;
  v45.super_class = (Class)NTKUtilityFaceView;
  v39 = [(NTKUtilityFaceView *)&v45 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
LABEL_7:

  return v39;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_utilityComplicationFactory, 0);

  objc_storeStrong((id *)&self->_dialView, 0);
}

@end