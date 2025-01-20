@interface NTKNumeralsAnalogFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_needComplicationAnimationForChangeToHour:(int64_t)a3;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_timeViewBehindContentForEditMode:(int64_t)a3;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (CGRect)_keylineFrameForFullScreenEditingReducedForOutsideLabel;
- (CGRect)_keylineFrameForStyleEditing;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (NTKNumeralsAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_handsAlphaForEditMode:(int64_t)a3;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_secondHandAlphaForEditMode:(int64_t)a3;
- (id)_faceConfiguration;
- (id)_faceConfigurationWithPalette:(id)a3;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (int64_t)_complicationPlacementForCurrentHour;
- (int64_t)_complicationPlacementForHour:(int64_t)a3;
- (int64_t)_currentHour;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (int64_t)_styleIndexForStyle:(unint64_t)a3;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyFaceColorPalette:(id)a3 toComplicationView:(id)a4;
- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyStyle:(unint64_t)a3;
- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterStyleEditing;
- (void)_configureComplicationFactory:(id)a3;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForStyleEditing;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_displayLinkFired;
- (void)_enumerateComplicationViewsWithBlock:(id)a3;
- (void)_handleTimeChange;
- (void)_loadHoursManagerIfNecessary;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForHourChangeWithSecondsUntilChange:(double)a3;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_scrubToDate:(id)a3 animated:(BOOL)a4;
- (void)_unloadSnapshotContentViews;
- (void)_updateAreAllComplicationsOffState;
- (void)_updateComplicationAndHourNodePlacementsWithToHour:(int64_t)a3 duration:(double)a4;
- (void)_updateComplicationPositionWithAnimationProgress:(double)a3;
- (void)dealloc;
- (void)endScrubbingAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKNumeralsAnalogFaceView

- (NTKNumeralsAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKNumeralsAnalogFaceView;
  v9 = [(NTKNumeralsAnalogFaceView *)&v14 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = (NTKUtilityComplicationFactory *)[objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v10;

    [(NTKNumeralsAnalogFaceView *)v9 _configureComplicationFactory:v9->_complicationFactory];
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v9 selector:"_handleTimeChange" name:UIApplicationSignificantTimeChangeNotification object:0];
  }
  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if (self->_clockTimerToken)
  {
    v4 = +[CLKClockTimer sharedInstance];
    [v4 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v6 dealloc];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v7 layoutSubviews];
  [(NTKNumeralsAnalogFaceView *)self _updateComplicationAndHourNodePlacementsWithToHour:[(NTKNumeralsAnalogFaceView *)self _currentHour] duration:0.0];
  if (self->_stylePickerView)
  {
    long long v5 = 0u;
    long long v6 = 0u;
    long long v4 = 0u;
    v3 = [(NTKNumeralsAnalogFaceView *)self device];
    sub_54A8(v3, &v4);

    [(NTKEditOptionPickerView *)self->_stylePickerView frame];
    -[NTKEditOptionPickerView setFrame:](self->_stylePickerView, "setFrame:", 0.0, v4, *(double *)&v5);
  }
}

- (void)_applyFrozen
{
  v13.receiver = self;
  v13.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v13 _applyFrozen];
  unsigned __int8 v3 = [(NTKNumeralsAnalogFaceView *)self isFrozen];
  clockTimerToken = self->_clockTimerToken;
  if (v3)
  {
    if (clockTimerToken)
    {
      long long v5 = +[CLKClockTimer sharedInstance];
      [v5 stopUpdatesForToken:self->_clockTimerToken];

      long long v6 = self->_clockTimerToken;
      self->_clockTimerToken = 0;
    }
  }
  else if (!clockTimerToken)
  {
    objc_initWeak(&location, self);
    objc_super v7 = +[CLKClockTimer sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5B24;
    v10[3] = &unk_10518;
    objc_copyWeak(&v11, &location);
    id v8 = [v7 startUpdatesWithUpdateFrequency:3 withHandler:v10 identificationLog:&stru_10558];
    v9 = self->_clockTimerToken;
    self->_clockTimerToken = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_displayLinkFired
{
  if (([(NTKNumeralsAnalogFaceView *)self dataMode] == (char *)&dword_0 + 1
     || [(NTKNumeralsAnalogFaceView *)self dataMode] == (char *)&dword_4 + 1)
    && ![(NTKNumeralsAnalogFaceView *)self _isInTimeTravel])
  {
    unsigned __int8 v3 = [(NTKNumeralsAnalogFaceView *)self timeView];
    long long v4 = [v3 calendar];

    long long v5 = [(NTKNumeralsAnalogFaceView *)self _faceCurrentDate];
    uint64_t v10 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v7 = 0;
    [v4 getHour:&v10 minute:&v9 second:&v8 nanosecond:&v7 fromDate:v5];
    uint64_t v6 = v10 % 12;
    if (!(v10 % 12)) {
      uint64_t v6 = 12;
    }
    uint64_t v10 = v6;
    NTKHourMinuteSecondAnglesForTime();
    if (v9 == 59 && 0.0 >= 6.25700537 && *(double *)&qword_16B80 < 6.25700537) {
      [(NTKNumeralsAnalogFaceView *)self _prepareForHourChangeWithSecondsUntilChange:(double)(60 - v8) + (double)v7 / -1000000000.0];
    }
    qword_16B80 = 0;
  }
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_loadLayoutRules
{
  v12.receiver = self;
  v12.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v12 _loadLayoutRules];
  [(NTKNumeralsAnalogFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(NTKNumeralsAnalogFaceView *)self complicationLayoutforSlot:NTKComplicationSlot1];
  self->_utilitySlot = [(NTKNumeralsAnalogFaceView *)self _complicationPlacementForCurrentHour];
  [(NTKNumeralsAnalogFaceView *)self _updateAreAllComplicationsOffState];
  -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v11, self->_utilitySlot, v4, v6, v8, v10);
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  hourViewsManager = self->_hourViewsManager;
  BOOL v5 = [(NTKNumeralsAnalogFaceView *)self dataMode] == (char *)&dword_0 + 1;

  [(NTKNumeralsHourViewsManager *)hourViewsManager setAdjustsForStatusIndicator:v3 animated:v5];
}

- (void)_configureComplicationFactory:(id)a3
{
  id v9 = a3;
  [v9 setForegroundAlpha:1.0];
  [v9 setForegroundImageAlpha:1.0];
  double v4 = [(NTKNumeralsAnalogFaceView *)self device];
  BOOL v5 = (char *)[v4 deviceCategory];

  double v6 = [(NTKNumeralsAnalogFaceView *)self device];
  double v7 = (char *)[v6 sizeClass];

  if (v5 != (unsigned char *)&dword_0 + 1)
  {
    objc_msgSend(v9, "setNormalCircularPadding:", CGSizeZero.width, CGSizeZero.height);
    double v8 = 23.5;
    if (v7 != (unsigned char *)&dword_0 + 3) {
      double v8 = 21.0;
    }
    objc_msgSend(v9, "setScreenEdgeInsets:", v8, 4.5, v8, 4.5);
  }
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  complicationFactory = self->_complicationFactory;
  int64_t utilitySlot = self->_utilitySlot;
  id v10 = a5;
  id v11 = [(NTKUtilityComplicationFactory *)complicationFactory newViewForComplication:a3 family:a4 forSlot:utilitySlot];
  [(NTKNumeralsAnalogFaceView *)self _configureComplicationView:v11 forSlot:v10];

  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v8 = a3;
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    complicationFactory = self->_complicationFactory;
    id v6 = v8;
    [(NTKUtilityComplicationFactory *)complicationFactory foregroundAlphaForEditing:[(NTKNumeralsAnalogFaceView *)self editing]];
    objc_msgSend(v6, "setForegroundAlpha:");
    [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundImageAlphaForEditing:[(NTKNumeralsAnalogFaceView *)self editing]];
    objc_msgSend(v6, "setForegroundImageAlpha:");
    objc_msgSend(v6, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", self->_utilitySlot));
    [v6 setFontWeight:UIFontWeightSemibold];
  }
  double v7 = [(NTKNumeralsAnalogFaceView *)self faceColorPalette];
  [(NTKNumeralsAnalogFaceView *)self _applyFaceColorPalette:v7 toComplicationView:v8];
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKUtilityComplicationFactory *)self->_complicationFactory layoutOverrideForComplicationType:a3 inSlot:self->_utilitySlot];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NTKNumeralsAnalogFaceView;
  -[NTKNumeralsAnalogFaceView _configureForEditMode:](&v18, "_configureForEditMode:");
  [(NTKNumeralsAnalogFaceView *)self _applyForegroundAlphaForTransitionFraction:a3 fromEditMode:a3 toEditMode:0.0];
  [(NTKNumeralsHourViewsManager *)self->_hourViewsManager configureForEditMode:a3];
  if (a3 == 13) {
    [(NTKNumeralsAnalogFaceView *)self _configureForStyleEditing];
  }
  else {
    [(NTKNumeralsAnalogFaceView *)self _cleanupAfterStyleEditing];
  }
  [(NTKNumeralsAnalogFaceView *)self _secondHandAlphaForEditMode:a3];
  double v6 = v5;
  double v7 = [(NTKNumeralsAnalogFaceView *)self timeView];
  id v8 = [v7 secondHandView];
  [v8 setAlpha:v6];

  [(NTKNumeralsAnalogFaceView *)self _handsAlphaForEditMode:a3];
  double v10 = v9;
  id v11 = [(NTKNumeralsAnalogFaceView *)self timeView];
  objc_super v12 = [v11 minuteHandView];
  [v12 setAlpha:v10];

  objc_super v13 = [(NTKNumeralsAnalogFaceView *)self timeView];
  objc_super v14 = [v13 hourHandView];
  [v14 setAlpha:v10];

  if (a3 == 1)
  {
    v15 = [(NTKNumeralsAnalogFaceView *)self complicationContainerView];
    long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v17[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v17[1] = v16;
    v17[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v15 setTransform:v17];
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v24.receiver = self;
  v24.super_class = (Class)NTKNumeralsAnalogFaceView;
  -[NTKNumeralsAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v24, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKNumeralsAnalogFaceView *)self _applyForegroundAlphaForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
  if (a5 != 13) {
    [(NTKNumeralsAnalogFaceView *)self _cleanupAfterStyleEditing];
  }
  hourViewsManager = self->_hourViewsManager;
  double v10 = [(NTKNumeralsAnalogFaceView *)self _faceConfiguration];
  [(NTKNumeralsHourViewsManager *)hourViewsManager applyTransitionFraction:a4 fromEditMode:a5 toEditMode:v10 faceConfiguration:a3];

  [(NTKNumeralsAnalogFaceView *)self _secondHandAlphaForEditMode:a4];
  [(NTKNumeralsAnalogFaceView *)self _secondHandAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  objc_super v13 = [(NTKNumeralsAnalogFaceView *)self timeView];
  objc_super v14 = [v13 secondHandView];
  [v14 setAlpha:v12];

  [(NTKNumeralsAnalogFaceView *)self _handsAlphaForEditMode:a4];
  [(NTKNumeralsAnalogFaceView *)self _handsAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v16 = v15;
  v17 = [(NTKNumeralsAnalogFaceView *)self timeView];
  objc_super v18 = [v17 minuteHandView];
  [v18 setAlpha:v16];

  v19 = [(NTKNumeralsAnalogFaceView *)self timeView];
  v20 = [v19 hourHandView];
  [v20 setAlpha:v16];

  if (a5 == 1 && fabs(a3 + -1.0) < 0.00000011920929 || a4 == 1 && fabs(a3) < 0.00000011920929)
  {
    v21 = [(NTKNumeralsAnalogFaceView *)self complicationContainerView];
    long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v23[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v23[1] = v22;
    v23[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v21 setTransform:v23];
  }
}

- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKUtilityComplicationFactory foregroundAlphaForTransitionFraction:fromEditMode:toEditMode:](self->_complicationFactory, "foregroundAlphaForTransitionFraction:fromEditMode:toEditMode:");
  uint64_t v10 = v9;
  [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundImageAlphaForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_6530;
  v12[3] = &unk_10578;
  v12[4] = v10;
  v12[5] = v11;
  [(NTKNumeralsAnalogFaceView *)self _enumerateComplicationViewsWithBlock:v12];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 10)
  {
    uint64_t v10 = [(NTKNumeralsAnalogFaceView *)self device];
    uint64_t v11 = [(NTKNumeralsAnalogFaceView *)self faceColorPalette];
    double v12 = +[NTKFaceColorScheme colorSchemeForDevice:v10 withFaceColorPalette:v11 units:25];

    hourViewsManager = self->_hourViewsManager;
    objc_super v14 = [(NTKNumeralsAnalogFaceView *)self _faceConfiguration];
    [(NTKNumeralsHourViewsManager *)hourViewsManager applyFaceColorFromFaceConfiguration:v14];

    double v15 = [v12 foregroundColor];
    double v16 = [(NTKNumeralsAnalogFaceView *)self timeView];
    [v16 applySecondHandColor:v15];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_674C;
    _OWORD v17[3] = &unk_105A0;
    v17[4] = self;
    [(NTKNumeralsAnalogFaceView *)self _enumerateComplicationViewsWithBlock:v17];
  }
  else if (a4 == 13)
  {
    -[NTKNumeralsAnalogFaceView _applyStyle:](self, "_applyStyle:", [v8 style]);
    [(NTKNumeralsAnalogFaceView *)self _updateComplicationAndHourNodePlacementsWithToHour:[(NTKNumeralsAnalogFaceView *)self _currentHour] duration:0.0];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 == 10)
  {
    id v36 = v12;
    double v15 = [(NTKNumeralsAnalogFaceView *)self device];
    double v16 = [(NTKNumeralsAnalogFaceView *)self interpolatedColorPalette];
    v17 = [v16 fromPalette];
    objc_super v18 = +[NTKFaceColorScheme colorSchemeForDevice:v15 withFaceColorPalette:v17 units:25];
    [(NTKNumeralsAnalogFaceView *)self device];
    v19 = id v34 = v14;
    v20 = [(NTKNumeralsAnalogFaceView *)self interpolatedColorPalette];
    [v20 toPalette];
    v21 = id v35 = v13;
    long long v22 = +[NTKFaceColorScheme colorSchemeForDevice:v19 withFaceColorPalette:v21 units:25];
    v23 = +[NTKFaceColorScheme interpolationFrom:v18 to:v22 fraction:a3];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_6AAC;
    v37[3] = &unk_105A0;
    id v38 = v23;
    id v24 = v23;
    [(NTKNumeralsAnalogFaceView *)self _enumerateComplicationViewsWithBlock:v37];
    v25 = [(NTKNumeralsAnalogFaceView *)self timeView];
    v26 = [v24 foregroundColor];
    [v25 applySecondHandColor:v26];

    hourViewsManager = self->_hourViewsManager;
    v28 = [(NTKNumeralsAnalogFaceView *)self interpolatedColorPalette];
    v29 = [v28 fromPalette];
    v30 = [(NTKNumeralsAnalogFaceView *)self interpolatedColorPalette];
    v31 = [v30 toPalette];
    v32 = [(NTKNumeralsAnalogFaceView *)self _faceConfiguration];
    v33 = hourViewsManager;
    id v12 = v36;
    [(NTKNumeralsHourViewsManager *)v33 applyTransitionFraction:v29 fromFaceColorPalette:v31 toFaceColorPalette:v32 faceConfiguration:a3];

    id v14 = v34;
    id v13 = v35;
  }
  else if (a6 == 13)
  {
    -[NTKEditOptionPickerView setTransitionFraction:fromIndex:toIndex:](self->_stylePickerView, "setTransitionFraction:fromIndex:toIndex:", -[NTKNumeralsAnalogFaceView _styleIndexForStyle:](self, "_styleIndexForStyle:", [v12 style]), -[NTKNumeralsAnalogFaceView _styleIndexForStyle:](self, "_styleIndexForStyle:", objc_msgSend(v13, "style")), a3);
  }
}

- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v15 _applyTransitionFraction:a4 fromComplication:a5 toComplication:v10 slot:a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_6C14;
  v12[3] = &unk_105C8;
  id v13 = v10;
  id v14 = self;
  id v11 = v10;
  [(NTKNumeralsAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v12];
}

- (void)_configureForStyleEditing
{
  if (!self->_stylePickerView)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    BOOL v3 = [(NTKNumeralsAnalogFaceView *)self device];
    sub_54A8(v3, &v21);

    double v4 = [(NTKNumeralsAnalogFaceView *)self device];
    double v5 = +[NTKNumeralsAnalogStyleEditOption availableOrderedValuesForDevice:v4];

    id v6 = objc_alloc((Class)NTKEditOptionPickerView);
    double v7 = +[NSNumber numberWithUnsignedInteger:self->_selectedStyle];
    id v8 = (NTKEditOptionPickerView *)[v6 initWithOptions:v5 selectedOption:v7];
    stylePickerView = self->_stylePickerView;
    self->_stylePickerView = v8;

    objc_initWeak(&location, self);
    id v10 = self->_stylePickerView;
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_6E94;
    objc_super v15 = &unk_105F0;
    objc_copyWeak(&v16, &location);
    long long v17 = v21;
    long long v18 = v22;
    long long v19 = v23;
    [(NTKEditOptionPickerView *)v10 setOptionToViewMapper:&v12];
    -[NTKEditOptionPickerView setNumberOfSides:](self->_stylePickerView, "setNumberOfSides:", SDWORD2(v22), v12, v13, v14, v15);
    [(NTKEditOptionPickerView *)self->_stylePickerView setActive:1];
    [(NTKEditOptionPickerView *)self->_stylePickerView setClipsToBounds:1];
    id v11 = [(NTKNumeralsAnalogFaceView *)self contentView];
    [v11 addSubview:self->_stylePickerView];

    [(NTKNumeralsAnalogFaceView *)self setNeedsLayout];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)_cleanupAfterStyleEditing
{
  stylePickerView = self->_stylePickerView;
  if (stylePickerView)
  {
    [(NTKEditOptionPickerView *)stylePickerView removeFromSuperview];
    double v4 = self->_stylePickerView;
    self->_stylePickerView = 0;
  }
}

- (void)_applyStyle:(unint64_t)a3
{
  if (self->_selectedStyle != a3)
  {
    self->_selectedStyle = a3;
    hourViewsManager = self->_hourViewsManager;
    if (hourViewsManager)
    {
      [(NTKNumeralsHourViewsManager *)hourViewsManager removeHourViews];
      double v5 = self->_hourViewsManager;
      self->_hourViewsManager = 0;

      [(NTKNumeralsAnalogFaceView *)self _loadHoursManagerIfNecessary];
    }
  }
}

- (void)_loadHoursManagerIfNecessary
{
  if (!self->_hourViewsManager)
  {
    BOOL v3 = [NTKNumeralsHourViewsManager alloc];
    double v4 = [(NTKNumeralsAnalogFaceView *)self _faceConfiguration];
    double v5 = [(NTKNumeralsAnalogFaceView *)self device];
    id v6 = [(NTKNumeralsHourViewsManager *)v3 initWithStyleFromFaceConfiguration:v4 forDevice:v5];
    hourViewsManager = self->_hourViewsManager;
    self->_hourViewsManager = v6;

    id v8 = self->_hourViewsManager;
    int64_t v9 = [(NTKNumeralsAnalogFaceView *)self _currentHour];
    int64_t utilitySlot = self->_utilitySlot;
    id v11 = [(NTKNumeralsAnalogFaceView *)self _faceConfiguration];
    [(NTKNumeralsHourViewsManager *)v8 updateVisibleHour:v9 targetUtilitySlot:utilitySlot faceConfiguration:v11 animationProgress:[(NTKNumeralsAnalogFaceView *)self toEditMode] forEditMode:1.0];

    if ([(NTKNumeralsAnalogFaceView *)self editing])
    {
      id v12 = [(NTKNumeralsAnalogFaceView *)self fromEditMode];
      id v13 = [(NTKNumeralsAnalogFaceView *)self toEditMode];
      id v14 = self->_hourViewsManager;
      if (v12 == v13)
      {
        [(NTKNumeralsHourViewsManager *)v14 configureForEditMode:[(NTKNumeralsAnalogFaceView *)self toEditMode]];
      }
      else
      {
        [(NTKNumeralsAnalogFaceView *)self editModeTransitionFraction];
        double v16 = v15;
        id v17 = [(NTKNumeralsAnalogFaceView *)self fromEditMode];
        id v18 = [(NTKNumeralsAnalogFaceView *)self toEditMode];
        long long v19 = [(NTKNumeralsAnalogFaceView *)self _faceConfiguration];
        [(NTKNumeralsHourViewsManager *)v14 applyTransitionFraction:v17 fromEditMode:v18 toEditMode:v19 faceConfiguration:v16];
      }
    }
    v20 = self->_hourViewsManager;
    id v21 = [(NTKNumeralsAnalogFaceView *)self contentView];
    [(NTKNumeralsHourViewsManager *)v20 addHourViewsToSuperview:v21];
  }
}

- (void)_loadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v5 _loadSnapshotContentViews];
  [(NTKNumeralsAnalogFaceView *)self _loadHoursManagerIfNecessary];
  BOOL v3 = [(NTKNumeralsAnalogFaceView *)self contentView];
  double v4 = +[UIColor blackColor];
  [v3 setBackgroundColor:v4];
}

- (void)_unloadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v5 _unloadSnapshotContentViews];
  BOOL v3 = [(NTKNumeralsAnalogFaceView *)self contentView];
  [v3 setBackgroundColor:0];

  [(NTKNumeralsHourViewsManager *)self->_hourViewsManager removeHourViews];
  hourViewsManager = self->_hourViewsManager;
  self->_hourViewsManager = 0;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 13)
  {
    NTKKeylineCornerRadiusSmall();
    double v4 = NTKKeylineViewWithContinuousCurveCornerRadius();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKNumeralsAnalogFaceView;
    double v4 = [(NTKNumeralsAnalogFaceView *)&v6 _keylineViewForCustomEditMode:a3 slot:a4];
  }

  return v4;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 13)
  {
    [(NTKNumeralsAnalogFaceView *)self _keylineFrameForStyleEditing];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKNumeralsAnalogFaceView;
    [(NTKNumeralsAnalogFaceView *)&v8 _relativeKeylineFrameForCustomEditMode:a3 slot:a4];
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 13) {
    return 140;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)NTKNumeralsAnalogFaceView;
  return [(NTKNumeralsAnalogFaceView *)&v7 _keylineLabelAlignmentForCustomEditMode:a3 slot:a4];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10 || a3 == 13;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)NTKNumeralsAnalogFaceView;
  -[NTKNumeralsAnalogFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v19, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    [(NTKNumeralsHourViewsManager *)self->_hourViewsManager applyBreathingFraction:10 forCustomEditMode:a3];
    NTKLargeElementScaleForBreathingFraction();
    CGFloat v11 = v10;
    id v12 = [(NTKNumeralsAnalogFaceView *)self foregroundContainerView];
    CGAffineTransformMakeScale(&v17, v11, v11);
    [v12 setTransform:&v17];

    id v13 = [(NTKNumeralsAnalogFaceView *)self complicationContainerView];
    CGAffineTransformMakeScale(&v16, v11, v11);
    [v13 setTransform:&v16];

    id v14 = [(NTKNumeralsAnalogFaceView *)self timeView];
    double v15 = [v14 secondHandView];
    [v15 setScale:v11];
  }
  else if (a4 == 13)
  {
    NTKLargeElementScaleForBreathingFraction();
    stylePickerView = self->_stylePickerView;
    CGAffineTransformMakeScale(&v18, v9, v9);
    [(NTKEditOptionPickerView *)stylePickerView setTransform:&v18];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v23.receiver = self;
  v23.super_class = (Class)NTKNumeralsAnalogFaceView;
  -[NTKNumeralsAnalogFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v23, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  NTKScaleForRubberBandingFraction();
  CGFloat v9 = v8;
  NTKAlphaForRubberBandingFraction();
  double v11 = v10;
  if (a4 == 13)
  {
    stylePickerView = self->_stylePickerView;
    CGAffineTransformMakeScale(&v21, v9, v9);
    [(NTKEditOptionPickerView *)stylePickerView setTransform:&v21];
    [(NTKEditOptionPickerView *)self->_stylePickerView setAlpha:v11];
  }
  else
  {
    if (a4 == 10)
    {
      [(NTKNumeralsHourViewsManager *)self->_hourViewsManager applyRubberBandingFraction:10 forCustomEditMode:a3];
      double v15 = [(NTKNumeralsAnalogFaceView *)self foregroundContainerView];
      CGAffineTransformMakeScale(&v20, v9, v9);
      [v15 setTransform:&v20];

      CGAffineTransform v16 = [(NTKNumeralsAnalogFaceView *)self foregroundContainerView];
      [v16 setAlpha:v11];

      CGAffineTransform v17 = [(NTKNumeralsAnalogFaceView *)self timeView];
      CGAffineTransform v18 = [v17 secondHandView];
      [v18 setScale:v9];

      id v13 = [(NTKNumeralsAnalogFaceView *)self timeView];
      objc_super v19 = [v13 secondHandView];
      [v19 setAlpha:v11];
    }
    else
    {
      if (a4) {
        return;
      }
      id v12 = [(NTKNumeralsAnalogFaceView *)self timeView];
      CGAffineTransformMakeScale(&v22, v9, v9);
      [v12 setTransform:&v22];

      id v13 = [(NTKNumeralsAnalogFaceView *)self timeView];
      [v13 setAlpha:v11];
    }
  }
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  id v5 = a3;
  double v6 = [(NTKNumeralsAnalogFaceView *)self delegate];
  id v7 = [v6 faceViewComplicationIsEmptyForSlot:v5];

  v20.receiver = self;
  v20.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v20 _keylineFrameForComplicationSlot:v5 selected:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  [(NTKUtilityComplicationFactory *)self->_complicationFactory keylineCornerRadiusForSlot:self->_utilitySlot];
  return result;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return a4 == 13;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 13) {
    return &off_114D0;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!qword_16B88)
  {
    uint64_t v10 = objc_opt_new();
    double v11 = (void *)qword_16B88;
    qword_16B88 = v10;
  }
  if (a4 == 13)
  {
    id v12 = v8;
    double v13 = [v9 objectForKeyedSubscript:&off_110B8];
    double v14 = +[NSString stringWithFormat:@"%@-%@", v12, v13];
    double v15 = [(id)qword_16B88 objectForKey:v14];
    if (!v15)
    {
      id v16 = [v12 style];
      if ((unint64_t)v16 > 8) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = (uint64_t)*(&off_10760 + (void)v16);
      }
      v29 = +[NSString stringWithFormat:@"Swatch-Numerals-%@", v17];
      double v18 = [(NTKNumeralsAnalogFaceView *)self faceColorPalette];
      id v19 = [v18 copy];

      id v20 = objc_alloc((Class)NTKFaceColorPaletteConfiguration);
      CGAffineTransform v21 = [v13 pigmentEditOption];
      id v22 = [v20 initWithPigmentEditOption:v21];
      [v19 setConfiguration:v22];

      objc_super v23 = [(NTKNumeralsAnalogFaceView *)self device];
      id v24 = +[NTKFaceColorScheme colorSchemeForDevice:v23 withFaceColorPalette:v19 units:1];
      v25 = [v24 foregroundColor];

      v26 = [v25 colorWithAlphaComponent:1.0];

      v27 = +[NTKNumeralsAnalogFaceBundle imageWithName:v29];
      double v15 = [v27 _flatImageWithColor:v26];

      [(id)qword_16B88 setObject:v15 forKey:v14];
    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)NTKNumeralsAnalogFaceView;
    double v15 = [(NTKNumeralsAnalogFaceView *)&v30 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v15;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NTKNumeralsAnalogFaceView;
  -[NTKNumeralsAnalogFaceView setOverrideDate:duration:](&v6, "setOverrideDate:duration:", a3);
  [(NTKNumeralsAnalogFaceView *)self _updateComplicationAndHourNodePlacementsWithToHour:[(NTKNumeralsAnalogFaceView *)self _currentHour] duration:a4];
}

- (void)_scrubToDate:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v5 _scrubToDate:a3 animated:a4];
  [(NTKNumeralsAnalogFaceView *)self _updateComplicationAndHourNodePlacementsWithToHour:[(NTKNumeralsAnalogFaceView *)self _currentHour] duration:0.0];
}

- (void)endScrubbingAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v4 endScrubbingAnimated:a3];
  [(NTKNumeralsAnalogFaceView *)self _updateComplicationAndHourNodePlacementsWithToHour:[(NTKNumeralsAnalogFaceView *)self _currentHour] duration:0.5];
}

- (void)_applyDataMode
{
  v4.receiver = self;
  v4.super_class = (Class)NTKNumeralsAnalogFaceView;
  [(NTKNumeralsAnalogFaceView *)&v4 _applyDataMode];
  unint64_t v3 = (unint64_t)[(NTKNumeralsAnalogFaceView *)self dataMode];
  if (v3 <= 5 && ((1 << v3) & 0x32) != 0) {
    [(NTKNumeralsAnalogFaceView *)self _updateComplicationAndHourNodePlacementsWithToHour:[(NTKNumeralsAnalogFaceView *)self _currentHour] duration:0.0];
  }
}

- (void)_handleTimeChange
{
  int64_t v3 = [(NTKNumeralsAnalogFaceView *)self _currentHour];

  [(NTKNumeralsAnalogFaceView *)self _updateComplicationAndHourNodePlacementsWithToHour:v3 duration:0.0];
}

- (CGRect)_keylineFrameForStyleEditing
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  v2 = [(NTKNumeralsAnalogFaceView *)self device];
  sub_54A8(v2, &v7);

  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v5 = *(double *)&v8;
  double v6 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v6;
  return result;
}

- (CGRect)_keylineFrameForFullScreenEditingReducedForOutsideLabel
{
  [(NTKNumeralsAnalogFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  memset(v14, 0, sizeof(v14));
  long long v9 = [(NTKNumeralsAnalogFaceView *)self device];
  sub_54A8(v9, v14);

  double v10 = *(double *)v14;
  double v11 = v8 - *(double *)v14;
  double v12 = v4;
  double v13 = v6;
  result.size.height = v11;
  result.size.width = v13;
  result.origin.y = v10;
  result.origin.x = v12;
  return result;
}

- (void)_enumerateComplicationViewsWithBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7E5C;
  v5[3] = &unk_10618;
  id v6 = a3;
  id v4 = v6;
  [(NTKNumeralsAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (void)_updateAreAllComplicationsOffState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7FA4;
  v4[3] = &unk_10640;
  v4[4] = &v5;
  [(NTKNumeralsAnalogFaceView *)self _enumerateComplicationViewsWithBlock:v4];
  int v3 = *((unsigned __int8 *)v6 + 24);
  if (self->_areAllComplicationsOff != v3)
  {
    self->_areAllComplicationsOff = v3;
    self->_complicationPositionNeedsUpdate = 1;
  }
  _Block_object_dispose(&v5, 8);
}

- (BOOL)_needComplicationAnimationForChangeToHour:(int64_t)a3
{
  if ([(NTKNumeralsAnalogFaceView *)self timeScrubbing]) {
    return 0;
  }
  if ([(NTKNumeralsAnalogFaceView *)self _complicationPlacementForHour:a3] == self->_utilitySlot) {
    return self->_complicationPositionNeedsUpdate;
  }
  return 1;
}

- (void)_updateComplicationAndHourNodePlacementsWithToHour:(int64_t)a3 duration:(double)a4
{
  if ([(NTKNumeralsAnalogFaceView *)self _isInTimeTravel]) {
    int64_t utilitySlot = (void *)self->_utilitySlot;
  }
  else {
    int64_t utilitySlot = [(NTKNumeralsAnalogFaceView *)self _complicationPlacementForHour:a3];
  }
  [(NTKNumeralsAnalogFaceView *)self _updateAreAllComplicationsOffState];
  uint64_t v7 = [NTKNumeralsAnalogFaceConfiguration alloc];
  char v8 = [(NTKNumeralsAnalogFaceView *)self faceColorPalette];
  BOOL areAllComplicationsOff = self->_areAllComplicationsOff;
  unint64_t selectedStyle = self->_selectedStyle;
  double v11 = [(NTKNumeralsAnalogFaceView *)self device];
  double v12 = [(NTKNumeralsAnalogFaceConfiguration *)v7 initWithFaceColorPalette:v8 colorSchemeUnits:25 areAllComplicationsOff:areAllComplicationsOff utilitySlot:utilitySlot selectedStyle:selectedStyle forDevice:v11];

  unsigned __int8 v13 = [(NTKNumeralsHourViewsManager *)self->_hourViewsManager needHourAnimationForChangeToHour:a3 toFaceConfiguration:v12];
  unsigned int v14 = [(NTKNumeralsAnalogFaceView *)self _needComplicationAnimationForChangeToHour:a3];
  char v15 = v14;
  if ((v13 & 1) != 0 || v14)
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_82D0;
    v22[3] = &unk_10668;
    objc_copyWeak(v23, &location);
    char v24 = v15;
    unsigned __int8 v25 = v13;
    v23[1] = (id)a3;
    v23[2] = utilitySlot;
    id v16 = objc_retainBlock(v22);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_8398;
    v18[3] = &unk_10690;
    objc_copyWeak(v19, &location);
    char v20 = v15;
    unsigned __int8 v21 = v13;
    v19[1] = (id)a3;
    v19[2] = utilitySlot;
    uint64_t v17 = objc_retainBlock(v18);
    ((void (*)(void *, double))v16[2])(v16, 1.0);
    ((void (*)(void *, uint64_t))v17[2])(v17, 1);

    objc_destroyWeak(v19);
    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
}

- (void)_updateComplicationPositionWithAnimationProgress:(double)a3
{
  int64_t v5 = [(NTKNumeralsAnalogFaceView *)self _complicationPlacementForCurrentHour];
  if (a3 >= 0.5 && (self->_utilitySlot != v5 || self->_complicationPositionNeedsUpdate))
  {
    [(NTKNumeralsAnalogFaceView *)self _loadLayoutRules];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_85CC;
    v10[3] = &unk_106B8;
    void v10[4] = self;
    [(NTKNumeralsAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v10];
    id v6 = [(NTKNumeralsAnalogFaceView *)self foregroundContainerView];
    [v6 setNeedsLayout];

    uint64_t v7 = [(NTKNumeralsAnalogFaceView *)self delegate];
    [v7 faceViewWantsComplicationKeylineFramesReloaded];

    self->_complicationPositionNeedsUpdate = 0;
  }
  double v8 = 1.0 - a3 * 2.0;
  if (a3 >= 0.5) {
    double v8 = a3 * 2.0 + -1.0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_8680;
  v9[3] = &unk_106D8;
  *(double *)&v9[4] = v8;
  [(NTKNumeralsAnalogFaceView *)self _enumerateComplicationViewsWithBlock:v9];
}

- (int64_t)_complicationPlacementForHour:(int64_t)a3
{
  id v4 = [(NTKNumeralsAnalogFaceView *)self device];
  int64_t v5 = +[NTKNumeralsAnalogElementsPlacement complicationPlacementForHour:a3 forDevice:v4];

  return v5;
}

- (int64_t)_complicationPlacementForCurrentHour
{
  int64_t v3 = [(NTKNumeralsAnalogFaceView *)self _currentHour];

  return [(NTKNumeralsAnalogFaceView *)self _complicationPlacementForHour:v3];
}

- (int64_t)_currentHour
{
  v2 = [(NTKNumeralsAnalogFaceView *)self currentDisplayDate];
  int64_t v3 = NTKDateHourIn12HourTime();

  return v3;
}

- (void)_applyFaceColorPalette:(id)a3 toComplicationView:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView]) {
    [v5 applyFaceColorPalette:v6 units:25];
  }
}

- (int64_t)_styleIndexForStyle:(unint64_t)a3
{
  id v4 = [(NTKNumeralsAnalogFaceView *)self device];
  int64_t v5 = +[NTKNumeralsAnalogStyleEditOption indexForNumeralsStyle:a3 forDevice:v4];

  return v5;
}

- (id)_faceConfiguration
{
  int64_t v3 = [(NTKNumeralsAnalogFaceView *)self faceColorPalette];
  id v4 = [(NTKNumeralsAnalogFaceView *)self _faceConfigurationWithPalette:v3];

  return v4;
}

- (id)_faceConfigurationWithPalette:(id)a3
{
  id v4 = a3;
  int64_t v5 = [NTKNumeralsAnalogFaceConfiguration alloc];
  BOOL areAllComplicationsOff = self->_areAllComplicationsOff;
  int64_t utilitySlot = self->_utilitySlot;
  unint64_t selectedStyle = self->_selectedStyle;
  long long v9 = [(NTKNumeralsAnalogFaceView *)self device];
  double v10 = [(NTKNumeralsAnalogFaceConfiguration *)v5 initWithFaceColorPalette:v4 colorSchemeUnits:25 areAllComplicationsOff:areAllComplicationsOff utilitySlot:utilitySlot selectedStyle:selectedStyle forDevice:v9];

  return v10;
}

- (double)_secondHandAlphaForEditMode:(int64_t)a3
{
  if (a3 == 13) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (a3 == 1) {
    return NTKEditModeDimmedAlpha;
  }
  return result;
}

- (double)_handsAlphaForEditMode:(int64_t)a3
{
  double result = 1.0;
  if ((unint64_t)a3 <= 0xD && ((1 << a3) & 0x2402) != 0) {
    return NTKEditModeDimmedAlpha;
  }
  return result;
}

- (BOOL)_timeViewBehindContentForEditMode:(int64_t)a3
{
  return a3 == 13;
}

- (void)_prepareForHourChangeWithSecondsUntilChange:(double)a3
{
  int64_t v5 = [(NTKNumeralsAnalogFaceView *)self currentDisplayDate];
  id v6 = [v5 dateByAddingTimeInterval:a3];

  [(NTKNumeralsAnalogFaceView *)self _updateComplicationAndHourNodePlacementsWithToHour:NTKDateHourIn12HourTime() duration:a3 + a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_hourViewsManager, 0);
  objc_storeStrong((id *)&self->_stylePickerView, 0);

  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end