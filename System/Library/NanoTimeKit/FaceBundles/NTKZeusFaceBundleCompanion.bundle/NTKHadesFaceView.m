@interface NTKHadesFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_isFractionAtEnd:(double)a3;
- (BOOL)_wantsStatusBarIconShadow;
- (CLKClockTimerToken)hourToken;
- (NSMutableDictionary)logos;
- (NTKHadesFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKHadesHourView)hourView;
- (UIView)corners;
- (double)_timeAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (double)breathingFraction;
- (double)rubberbandingFraction;
- (id)_logoForRotation:(unint64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)palette;
- (unint64_t)rotation;
- (void)_applyBreathingAndRubberbanding;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyFraction:(double)a3 fromRotation:(id)a4 toRotation:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRotation:(id)a3;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_layoutLogo;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_removeListeners;
- (void)_removeViews;
- (void)_setupListeners;
- (void)_setupViews;
- (void)_startHourUpdate;
- (void)_stopHourUpdate;
- (void)_unloadSnapshotContentViews;
- (void)_updateContentColorsFromPalette:(id)a3;
- (void)_updateHour;
- (void)_updateHour:(unint64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBreathingFraction:(double)a3;
- (void)setCorners:(id)a3;
- (void)setHourToken:(id)a3;
- (void)setHourView:(id)a3;
- (void)setLogos:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setRotation:(unint64_t)a3;
- (void)setRubberbandingFraction:(double)a3;
@end

@implementation NTKHadesFaceView

- (NTKHadesFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKHadesFaceView;
  return [(NTKHadesFaceView *)&v6 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
}

- (void)dealloc
{
  if (self->_hourToken)
  {
    v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_hourToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v4 dealloc];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKHadesFaceView *)self _setupViews];
  [(NTKHadesFaceView *)self _setupListeners];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKHadesFaceView *)self _removeViews];
  [(NTKHadesFaceView *)self _removeListeners];
}

- (void)_setupViews
{
  objc_super v3 = [NTKHadesHourView alloc];
  objc_super v4 = [(NTKHadesFaceView *)self device];
  v5 = [(NTKHadesHourView *)v3 initWithDevice:v4];
  [(NTKHadesFaceView *)self setHourView:v5];

  objc_super v6 = [(NTKHadesFaceView *)self contentView];
  [v6 addSubview:self->_hourView];

  id v20 = [(NTKHadesFaceView *)self _logoForRotation:self->_rotation];
  v7 = [(NTKHadesFaceView *)self contentView];
  [v7 addSubview:v20];

  id v8 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKHadesFaceView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(NTKHadesFaceView *)self device];
  id v18 = objc_msgSend(v8, "initWithFrame:forDeviceCornerRadius:", v17, v10, v12, v14, v16);
  [(NTKHadesFaceView *)self setCorners:v18];

  v19 = [(NTKHadesFaceView *)self contentView];
  [v19 addSubview:self->_corners];
}

- (void)_setupListeners
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_updateHour" name:UIApplicationSignificantTimeChangeNotification object:0];

  [(NTKHadesFaceView *)self _startHourUpdate];
}

- (void)_removeViews
{
  [(NTKHadesHourView *)self->_hourView removeFromSuperview];
  [(NTKHadesFaceView *)self setHourView:0];
  [(NSMutableDictionary *)self->_logos enumerateKeysAndObjectsUsingBlock:&stru_3D0C8];
  [(NTKHadesFaceView *)self setLogos:0];
  [(UIView *)self->_corners removeFromSuperview];

  [(NTKHadesFaceView *)self setCorners:0];
}

- (void)_removeListeners
{
  [(NTKHadesFaceView *)self _stopHourUpdate];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];
}

- (void)_applyDataMode
{
  v5.receiver = self;
  v5.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v5 _applyDataMode];
  id v3 = (char *)[(NTKHadesFaceView *)self dataMode];
  if ((unint64_t)(v3 - 2) < 4 || v3 == 0)
  {
    [(NTKHadesFaceView *)self _stopHourUpdate];
  }
  else if (v3 == (unsigned char *)&dword_0 + 1)
  {
    [(NTKHadesFaceView *)self _startHourUpdate];
  }
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 1;
}

- (double)_verticalPaddingForStatusBar
{
  return 1.0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NTKHadesFaceView;
  -[NTKHadesFaceView setOverrideDate:duration:](&v6, "setOverrideDate:duration:", a4);
  if (a3) {
    [(NTKHadesFaceView *)self _stopHourUpdate];
  }
  else {
    [(NTKHadesFaceView *)self _startHourUpdate];
  }
}

- (void)_startHourUpdate
{
  if (!self->_hourToken)
  {
    objc_initWeak(&location, self);
    id v3 = +[CLKClockTimer sharedInstance];
    objc_super v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    v7 = sub_19E20;
    id v8 = &unk_3CFB8;
    objc_copyWeak(&v9, &location);
    objc_super v4 = [v3 startUpdatesWithUpdateFrequency:0 withHandler:&v5 identificationLog:&stru_3D0E8];
    -[NTKHadesFaceView setHourToken:](self, "setHourToken:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  [(NTKHadesFaceView *)self _updateHour];
}

- (void)_stopHourUpdate
{
  if (self->_hourToken)
  {
    id v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_hourToken];

    [(NTKHadesFaceView *)self setHourToken:0];
  }

  [(NTKHadesFaceView *)self _updateHour];
}

- (void)_updateHour
{
  id v3 = [(NTKHadesFaceView *)self currentDisplayDate];
  if (v3) {
    CLKClockTimerDateForDate();
  }
  else {
    CLKClockTimerDateForNow();
  }
  [(NTKHadesFaceView *)self _updateHour:v5];
}

- (id)_logoForRotation:(unint64_t)a3
{
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSMutableDictionary *)self->_logos objectForKeyedSubscript:v5];
  if (!v6)
  {
    v7 = @"HadesLogoStraight";
    if (a3 == 1) {
      v7 = @"HadesLogoTwisted";
    }
    id v8 = v7;
    id v9 = objc_alloc((Class)UIImageView);
    double v10 = +[NTKHadesFaceBundle imageWithName:v8];

    id v6 = [v9 initWithImage:v10];
    double v11 = +[UIColor whiteColor];
    [v6 setTintColor:v11];

    logos = self->_logos;
    if (!logos)
    {
      double v13 = (NSMutableDictionary *)objc_opt_new();
      double v14 = self->_logos;
      self->_logos = v13;

      logos = self->_logos;
    }
    [(NSMutableDictionary *)logos setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

- (void)_updateHour:(unint64_t)a3
{
}

- (void)_updateContentColorsFromPalette:(id)a3
{
  id v7 = a3;
  objc_super v4 = [v7 secondHand];
  uint64_t v5 = [(NTKHadesFaceView *)self timeView];
  id v6 = [v5 secondHandView];
  [v6 setColor:v4];

  [(NTKHadesHourView *)self->_hourView setPalette:v7];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v11 layoutSubviews];
  [(NTKHadesFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[NTKHadesHourView setFrame:](self->_hourView, "setFrame:");
  [(NTKHadesFaceView *)self _layoutLogo];
  -[UIView setFrame:](self->_corners, "setFrame:", v4, v6, v8, v10);
}

- (void)_layoutLogo
{
  [(NTKHadesFaceView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  objc_super v11 = [(NTKHadesFaceView *)self device];
  double v12 = sub_1A2FC(v11);
  uint64_t v14 = v13;

  logos = self->_logos;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1A3F4;
  v16[3] = &unk_3D110;
  v16[5] = v4;
  v16[6] = v6;
  v16[7] = v8;
  v16[8] = v10;
  v16[4] = self;
  *(double *)&v16[9] = v12;
  v16[10] = v14;
  [(NSMutableDictionary *)logos enumerateKeysAndObjectsUsingBlock:v16];
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v3 _prepareForEditing];
  [(NTKHadesHourView *)self->_hourView beginEditing];
}

- (void)_cleanupAfterEditing
{
  v9.receiver = self;
  v9.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v9 _cleanupAfterEditing];
  [(NTKHadesHourView *)self->_hourView endEditing];
  objc_super v3 = objc_opt_new();
  logos = self->_logos;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A65C;
  v7[3] = &unk_3D138;
  v7[4] = self;
  id v8 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)logos enumerateKeysAndObjectsUsingBlock:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1A6E4;
  v6[3] = &unk_3D160;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKHadesFaceView;
  -[NTKHadesFaceView _configureForEditMode:](&v8, "_configureForEditMode:");
  [(NTKHadesFaceView *)self _timeAlphaForEditMode:a3];
  double v6 = v5;
  uint64_t v7 = [(NTKHadesFaceView *)self timeView];
  [v7 setAlpha:v6];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKHadesFaceView;
  -[NTKHadesFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v11, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKHadesFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKHadesFaceView *)self _timeAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  uint64_t v10 = [(NTKHadesFaceView *)self timeView];
  [v10 setAlpha:v9];
}

- (double)_timeAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v10 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 10)
  {
    double v9 = [(NTKHadesFaceView *)self palette];
    [(NTKHadesFaceView *)self _updateContentColorsFromPalette:v9];
  }
  else if (a4 == 15)
  {
    [(NTKHadesFaceView *)self _applyRotation:v8];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NTKHadesFaceView;
  [(NTKHadesFaceView *)&v15 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  if (a6 == 10)
  {
    uint64_t v14 = [(NTKHadesFaceView *)self interpolatedColorPalette];
    [(NTKHadesFaceView *)self _updateContentColorsFromPalette:v14];
  }
  else if (a6 == 15)
  {
    [(NTKHadesFaceView *)self _applyFraction:v12 fromRotation:v13 toRotation:a3];
  }
}

- (void)_applyRotation:(id)a3
{
}

- (void)_applyFraction:(double)a3 fromRotation:(id)a4 toRotation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = v9;
  if (!v8)
  {
    id v8 = v9;
    a3 = 1.0;
  }
  id v11 = [v8 rotation];
  id v12 = [v10 rotation];
  [(NTKHadesHourView *)self->_hourView applyFraction:v11 fromRotation:v12 toRotation:a3];
  if (![(NTKHadesFaceView *)self _isFractionAtEnd:a3])
  {
    v21 = [(NTKHadesFaceView *)self _logoForRotation:v11];
    v22 = [(NTKHadesFaceView *)self _logoForRotation:v12];
    logos = self->_logos;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1AE80;
    v50[3] = &unk_3D138;
    id v16 = v21;
    id v51 = v16;
    id v20 = v22;
    id v52 = v20;
    [(NSMutableDictionary *)logos enumerateKeysAndObjectsUsingBlock:v50];
    v24 = [v16 superview];

    if (!v24)
    {
      v25 = [(NTKHadesFaceView *)self contentView];
      [v25 addSubview:v16];
    }
    v26 = [v20 superview];

    if (v26)
    {
      if (v24)
      {
LABEL_17:
        [v20 bounds];
        CGRectGetWidth(v56);
        [v16 bounds];
        CGRectGetWidth(v57);
        [v20 bounds];
        CGRectGetHeight(v58);
        [v16 bounds];
        CGRectGetHeight(v59);
        CLKInterpolateBetweenFloatsClipped();
        CGFloat v29 = v28;
        CLKInterpolateBetweenFloatsClipped();
        CGFloat v31 = v30;
        v32 = [(NTKHadesFaceView *)self device];
        double v48 = sub_1A2FC(v32);
        uint64_t v49 = v33;

        CLKInterpolateBetweenFloatsClipped();
        CGFloat v35 = v34;
        CLKInterpolateBetweenFloatsClipped();
        CGFloat v37 = v36;
        CLKInterpolateBetweenFloatsClipped();
        double v39 = v38;
        CLKInterpolateBetweenFloatsClipped();
        double v41 = v40;
        [v16 setAlpha:v39];
        CGAffineTransformMakeScale(&v46, v29, v29);
        CGAffineTransformTranslate(&v47, &v46, 0.0, v35);
        CGAffineTransform v45 = v47;
        [v16 setTransform:&v45];
        [v20 setAlpha:v41];
        CGAffineTransformMakeScale(&v43, v31, v31);
        CGAffineTransformTranslate(&v44, &v43, 0.0, v37);
        CGAffineTransform v42 = v44;
        [v20 setTransform:&v42];

        goto LABEL_18;
      }
    }
    else
    {
      v27 = [(NTKHadesFaceView *)self contentView];
      [v27 addSubview:v20];
    }
    [(NTKHadesFaceView *)self _layoutLogo];
    goto LABEL_17;
  }
  if (a3 == 0.0) {
    id v13 = v11;
  }
  else {
    id v13 = v12;
  }
  [(NTKHadesFaceView *)self setRotation:v13];
  uint64_t v14 = [(NTKHadesFaceView *)self _logoForRotation:self->_rotation];
  objc_super v15 = self->_logos;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1AE68;
  v54[3] = &unk_3D188;
  id v16 = v14;
  id v55 = v16;
  [(NSMutableDictionary *)v15 enumerateKeysAndObjectsUsingBlock:v54];
  v17 = [v16 superview];

  if (!v17)
  {
    id v18 = [(NTKHadesFaceView *)self contentView];
    [v18 addSubview:v16];

    [(NTKHadesFaceView *)self _layoutLogo];
  }
  [v16 setAlpha:1.0];
  long long v19 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v53[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v53[1] = v19;
  v53[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v16 setTransform:v53];
  id v20 = v55;
LABEL_18:
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKHadesFaceView;
  -[NTKHadesFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v8, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    self->_breathingFraction = a3;
    [(NTKHadesFaceView *)self _applyBreathingAndRubberbanding];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKHadesFaceView;
  -[NTKHadesFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v8, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    self->_rubberbandingFraction = a3;
    [(NTKHadesFaceView *)self _applyBreathingAndRubberbanding];
  }
}

- (void)_applyBreathingAndRubberbanding
{
  NTKLargeElementScaleForBreathingFraction();
  double v4 = v3;
  NTKScaleForRubberBandingFraction();
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeScale(&v9, v4 * v5, v4 * v5);
  double v6 = [(NTKHadesFaceView *)self contentView];
  CGAffineTransform v8 = v9;
  [v6 setTransform:&v8];

  uint64_t v7 = [(NTKHadesFaceView *)self timeView];
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

- (BOOL)_isFractionAtEnd:(double)a3
{
  return a3 == 1.0 || a3 == 0.0;
}

- (id)createFaceColorPalette
{
  v2 = objc_opt_new();

  return v2;
}

- (id)palette
{
  return [(NTKHadesFaceView *)self faceColorPalette];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &off_3FAF8;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  if (a4 == 15)
  {
    CGAffineTransform v9 = [a5 objectForKeyedSubscript:&off_3F428];
    if (!qword_4CEB0)
    {
      uint64_t v10 = objc_opt_new();
      id v11 = (void *)qword_4CEB0;
      qword_4CEB0 = v10;
    }
    id v12 = +[NSString stringWithFormat:@"%@-%@", v8, v9];
    id v13 = [(id)qword_4CEB0 objectForKey:v12];
    if (!v13)
    {
      uint64_t v14 = [(NTKHadesFaceView *)self palette];
      id v15 = [v14 copy];

      [v15 setPigmentEditOption:v9];
      id v13 = +[NTKHadesHourView imageForRotation:palette:hour:](NTKHadesHourView, "imageForRotation:palette:hour:", [v8 rotation], v15, 10);
      [(id)qword_4CEB0 setObject:v13 forKey:v12];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKHadesFaceView;
    id v13 = [(NTKHadesFaceView *)&v17 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v13;
}

- (NTKHadesHourView)hourView
{
  return self->_hourView;
}

- (void)setHourView:(id)a3
{
}

- (NSMutableDictionary)logos
{
  return self->_logos;
}

- (void)setLogos:(id)a3
{
}

- (UIView)corners
{
  return self->_corners;
}

- (void)setCorners:(id)a3
{
}

- (unint64_t)rotation
{
  return self->_rotation;
}

- (void)setRotation:(unint64_t)a3
{
  self->_rotation = a3;
}

- (CLKClockTimerToken)hourToken
{
  return self->_hourToken;
}

- (void)setHourToken:(id)a3
{
}

- (double)breathingFraction
{
  return self->_breathingFraction;
}

- (void)setBreathingFraction:(double)a3
{
  self->_breathingFraction = a3;
}

- (double)rubberbandingFraction
{
  return self->_rubberbandingFraction;
}

- (void)setRubberbandingFraction:(double)a3
{
  self->_rubberbandingFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourToken, 0);
  objc_storeStrong((id *)&self->_corners, 0);
  objc_storeStrong((id *)&self->_logos, 0);

  objc_storeStrong((id *)&self->_hourView, 0);
}

@end