@interface NTKProteusContentView
+ (double)_backgroundFraction:(id)a3;
+ (double)_rainbowFraction:(id)a3;
- (CGPoint)_scaleForBackgroundFraction:(double)a3;
- (CLKDevice)device;
- (NTKProteusContentView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 backgroundStyle:(unint64_t)a5 colorPalette:(id)a6 device:(id)a7;
- (double)_backgroundFraction;
- (double)_rainbowFraction;
- (double)notchFraction;
- (id)_digitLayersForStyle:(unint64_t)a3;
- (id)_fontLoader;
- (id)_fontWithWeight:(double)a3 style:(unint64_t)a4 usesNotch:(BOOL)a5;
- (id)createProteusDigitAtIndex:(unint64_t)a3 style:(unint64_t)a4;
- (unint64_t)style;
- (void)_activate:(BOOL)a3 digitLayersForStyle:(unint64_t)a4;
- (void)_applyRainbowFraction:(double)a3 backgroundFraction:(double)a4;
- (void)_setLabelAlpha:(double)a3 forLabels:(id)a4;
- (void)_updateColorPalette;
- (void)_updateScale:(CGPoint)a3 forLabels:(id)a4;
- (void)_updateScaleBackgroundFraction:(double)a3;
- (void)_updateScaleTransitionFraction:(double)a3 forLabels:(id)a4;
- (void)_updateScaleTritiumFraction:(double)a3;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)applyTransitionTritiumOnWithFraction:(double)a3;
- (void)layoutSubviews;
- (void)motionCompleted;
- (void)setColorPalette:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDigitWeight:(double)a3 forDigit:(unint64_t)a4;
- (void)setGradientMaskRotation:(double)a3;
- (void)setNotchFraction:(double)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKProteusContentView

- (NTKProteusContentView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 backgroundStyle:(unint64_t)a5 colorPalette:(id)a6 device:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a6;
  id v16 = a7;
  v47.receiver = self;
  v47.super_class = (Class)NTKProteusContentView;
  v17 = -[NTKProteusContentView initWithFrame:](&v47, "initWithFrame:", x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_device, a7);
    uint64_t v19 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_10D20, &off_10D20, &off_10D20, &off_10D20, &off_10D20, &off_10D20, &off_10D20, &off_10D20, &off_10D20, &off_10D20, &off_10D20, 0);
    digitWeights = v18->_digitWeights;
    v18->_digitWeights = (NSMutableArray *)v19;

    v21 = (UIView *)objc_alloc_init((Class)UIView);
    digitsMaskView = v18->_digitsMaskView;
    v18->_digitsMaskView = v21;

    v23 = (UIView *)objc_alloc_init((Class)UIView);
    digitsSoftMaskView = v18->_digitsSoftMaskView;
    v18->_digitsSoftMaskView = v23;

    v25 = (UIView *)objc_alloc_init((Class)UIView);
    digitsSharpMaskView = v18->_digitsSharpMaskView;
    v18->_digitsSharpMaskView = v25;

    [(UIView *)v18->_digitsMaskView addSubview:v18->_digitsSoftMaskView];
    [(UIView *)v18->_digitsMaskView addSubview:v18->_digitsSharpMaskView];
    uint64_t v27 = NTKImageNamed();
    rainbowGradientBackgroundImage = v18->_rainbowGradientBackgroundImage;
    v18->_rainbowGradientBackgroundImage = (UIImage *)v27;

    uint64_t v29 = +[NTKProteusFaceBundle imageWithName:@"Pride Gradient_626x626"];
    rainbowGradientMaskImage = v18->_rainbowGradientMaskImage;
    v18->_rainbowGradientMaskImage = (UIImage *)v29;

    v31 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v18->_rainbowGradientMaskImage];
    gradientMaskView = v18->_gradientMaskView;
    v18->_gradientMaskView = v31;

    [(UIView *)v18->_gradientMaskView setContentMode:4];
    v33 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v18->_rainbowGradientBackgroundImage];
    gradientBackgroundView = v18->_gradientBackgroundView;
    v18->_gradientBackgroundView = v33;

    [(UIView *)v18->_gradientBackgroundView setContentMode:0];
    id v35 = objc_alloc((Class)UIView);
    [(NTKProteusContentView *)v18 bounds];
    v36 = (UIView *)objc_msgSend(v35, "initWithFrame:");
    colorBackgroundView = v18->_colorBackgroundView;
    v18->_colorBackgroundView = v36;

    v38 = v18->_colorBackgroundView;
    v39 = +[UIColor purpleColor];
    [(UIView *)v38 setBackgroundColor:v39];

    v40 = (UIView *)objc_alloc_init((Class)UIView);
    colorMaskView = v18->_colorMaskView;
    v18->_colorMaskView = v40;

    v42 = (UIView *)objc_alloc_init((Class)UIView);
    digitsView = v18->_digitsView;
    v18->_digitsView = v42;

    [(UIView *)v18->_digitsView addSubview:v18->_gradientMaskView];
    [(UIView *)v18->_digitsView addSubview:v18->_colorMaskView];
    [(UIView *)v18->_digitsView setMaskView:v18->_digitsMaskView];
    [(NTKProteusContentView *)v18 addSubview:v18->_gradientBackgroundView];
    [(NTKProteusContentView *)v18 addSubview:v18->_colorBackgroundView];
    [(NTKProteusContentView *)v18 addSubview:v18->_digitsView];
    double v44 = 1.0;
    if (a5 != 1) {
      double v44 = 0.0;
    }
    [(NTKProteusContentView *)v18 _applyRainbowFraction:0.0 backgroundFraction:v44];
    [(NTKProteusContentView *)v18 setColorPalette:v15];
    v18->_style = 2;
    [(NTKProteusContentView *)v18 setStyle:a4];
    v45 = +[UIColor clearColor];
    [(NTKProteusContentView *)v18 setBackgroundColor:v45];
  }
  return v18;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKProteusContentView;
  [(NTKProteusContentView *)&v3 layoutSubviews];
  [(NTKProteusContentView *)self bounds];
  -[UIView setBounds:](self->_gradientMaskView, "setBounds:");
  [(NTKProteusContentView *)self center];
  -[UIView setCenter:](self->_gradientMaskView, "setCenter:");
  [(NTKProteusContentView *)self bounds];
  -[UIView setBounds:](self->_gradientBackgroundView, "setBounds:");
  [(NTKProteusContentView *)self center];
  -[UIView setCenter:](self->_gradientBackgroundView, "setCenter:");
  [(NTKProteusContentView *)self bounds];
  -[UIView setBounds:](self->_colorBackgroundView, "setBounds:");
  [(NTKProteusContentView *)self center];
  -[UIView setCenter:](self->_colorBackgroundView, "setCenter:");
  [(NTKProteusContentView *)self bounds];
  -[UIView setBounds:](self->_colorMaskView, "setBounds:");
  [(NTKProteusContentView *)self center];
  -[UIView setCenter:](self->_colorMaskView, "setCenter:");
}

- (void)_activate:(BOOL)a3 digitLayersForStyle:(unint64_t)a4
{
  BOOL v5 = a3;
  v7 = &OBJC_IVAR___NTKProteusContentView__roundedHourDigits;
  if (a4 != 1)
  {
    BOOL v8 = a3;
    if (a4) {
      goto LABEL_5;
    }
    v7 = &OBJC_IVAR___NTKProteusContentView__regularHourDigits;
  }
  BOOL v8 = *(Class *)((char *)&self->super.super.super.isa + *v7) != 0;
LABEL_5:
  if (v8 != a3)
  {
    v9 = _NTKLoggingObjectForDomain();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v25 = a4;
        __int16 v26 = 2048;
        uint64_t v27 = self;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Proteus content-Activating font style %lu [%p]", buf, 0x16u);
      }

      v11 = [(NTKProteusContentView *)self _fontLoader];
      [v11 cacheFonts:1 ofType:a4 != 0 forClient:self];

      id v12 = [(NTKProteusContentView *)self _digitLayersForStyle:a4];
      BOOL v13 = a4 == 1;
      if (a4 <= 1)
      {
        if (a4 == 1) {
          v20 = &OBJC_IVAR___NTKProteusContentView__digitsSoftMaskView;
        }
        else {
          v20 = &OBJC_IVAR___NTKProteusContentView__digitsSharpMaskView;
        }
        v21 = &OBJC_IVAR___NTKProteusContentView__regularHourDigits;
        if (v13) {
          v21 = &OBJC_IVAR___NTKProteusContentView__roundedHourDigits;
        }
        objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v21), v12);
        id v14 = *(id *)((char *)&self->super.super.super.isa + *v20);
      }
      else
      {
        id v14 = 0;
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_8E40;
      v22[3] = &unk_104E8;
      id v23 = v14;
      id v19 = v14;
      [v12 enumerateObjectsUsingBlock:v22];
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v25 = a4;
        __int16 v26 = 2048;
        uint64_t v27 = self;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Proteus content-Deactivating font style %lu [%p]", buf, 0x16u);
      }

      id v15 = &OBJC_IVAR___NTKProteusContentView__regularHourDigits;
      BOOL v16 = a4 != 0;
      if (a4 == 1) {
        id v15 = &OBJC_IVAR___NTKProteusContentView__roundedHourDigits;
      }
      uint64_t v17 = *v15;
      id v12 = *(id *)((char *)&self->super.super.super.isa + v17);
      v18 = *(Class *)((char *)&self->super.super.super.isa + v17);
      *(Class *)((char *)&self->super.super.super.isa + v17) = 0;

      [v12 enumerateObjectsUsingBlock:&stru_10528];
      id v19 = [(NTKProteusContentView *)self _fontLoader];
      [v19 cacheFonts:0 ofType:v16 forClient:self];
    }
  }
}

- (id)_digitLayersForStyle:(unint64_t)a3
{
  BOOL v5 = +[NSMutableArray arrayWithCapacity:12];
  [(NTKProteusContentView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  for (uint64_t i = 1; i != 13; ++i)
  {
    id v15 = [(NTKProteusContentView *)self createProteusDigitAtIndex:i style:a3];
    objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);
    [v5 addObject:v15];
  }

  return v5;
}

- (id)createProteusDigitAtIndex:(unint64_t)a3 style:(unint64_t)a4
{
  id v7 = objc_alloc_init((Class)UILabel);
  unint64_t v8 = a3 - 1;
  BOOL v10 = a3 == 1 || a3 == 12;
  double v11 = +[NSNumber numberWithUnsignedInteger:a3];
  double v12 = [v11 stringValue];
  [v7 setText:v12];

  double v13 = [(NSMutableArray *)self->_digitWeights objectAtIndexedSubscript:v8];
  [v13 floatValue];
  id v15 = [(NTKProteusContentView *)self _fontWithWeight:a4 style:v10 usesNotch:v14];
  [v7 setFont:v15];

  BOOL v16 = +[UIColor whiteColor];
  [v7 setTextColor:v16];

  return v7;
}

- (void)setDigitWeight:(double)a3 forDigit:(unint64_t)a4
{
  unint64_t v6 = a4 - 1;
  BOOL v8 = a4 == 1 || a4 == 12;
  regularHourDigits = self->_regularHourDigits;
  if (regularHourDigits)
  {
    BOOL v10 = [(NSArray *)regularHourDigits objectAtIndex:a4 - 1];
    double v11 = [(NTKProteusContentView *)self _fontWithWeight:0 style:v8 usesNotch:a3];
    [v10 setFont:v11];
  }
  roundedHourDigits = self->_roundedHourDigits;
  if (roundedHourDigits)
  {
    double v13 = [(NSArray *)roundedHourDigits objectAtIndex:v6];
    float v14 = [(NTKProteusContentView *)self _fontWithWeight:1 style:v8 usesNotch:a3];
    [v13 setFont:v14];
  }
  id v15 = +[NSNumber numberWithDouble:a3];
  [(NSMutableArray *)self->_digitWeights setObject:v15 atIndexedSubscript:v6];
}

- (id)_fontWithWeight:(double)a3 style:(unint64_t)a4 usesNotch:(BOOL)a5
{
  BOOL v5 = a5;
  double v9 = [(NTKProteusContentView *)self _fontLoader];
  BOOL v10 = v9;
  double notchFraction = 0.0;
  if (v5) {
    double notchFraction = self->_notchFraction;
  }
  double v12 = [v9 neptuneFont:a4 != 0 weight:a3 notch:notchFraction];

  return v12;
}

- (void)setGradientMaskRotation:(double)a3
{
  gradientMaskView = self->_gradientMaskView;
  CGAffineTransformMakeRotation(&v4, a3);
  [(UIView *)gradientMaskView setTransform:&v4];
}

- (id)_fontLoader
{
  p_fontLoader = &self->_fontLoader;
  CGAffineTransform v4 = self->_fontLoader;
  if (!v4)
  {
    BOOL v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      double v9 = self;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Proteus content-getting shared font loader [%p]", (uint8_t *)&v8, 0xCu);
    }

    [(NTKProteusContentView *)self frame];
    CGAffineTransform v4 = +[NTKProteusFontLoader sharedInstanceWithSize:v6];
    objc_storeStrong((id *)p_fontLoader, v4);
  }

  return v4;
}

- (void)_updateScaleTransitionFraction:(double)a3 forLabels:(id)a4
{
  id v5 = a4;
  [(NTKProteusContentView *)self _backgroundFraction];
  -[NTKProteusContentView _scaleForBackgroundFraction:](self, "_scaleForBackgroundFraction:");
  CLKInterpolateBetweenPoints();
  -[NTKProteusContentView _updateScale:forLabels:](self, "_updateScale:forLabels:", v5);
}

- (void)_updateScaleBackgroundFraction:(double)a3
{
  [(NTKProteusContentView *)self _scaleForBackgroundFraction:a3];
  double v5 = v4;
  double v7 = v6;
  -[NTKProteusContentView _updateScale:forLabels:](self, "_updateScale:forLabels:", self->_regularHourDigits);
  roundedHourDigits = self->_roundedHourDigits;

  -[NTKProteusContentView _updateScale:forLabels:](self, "_updateScale:forLabels:", roundedHourDigits, v5, v7);
}

- (void)_updateScaleTritiumFraction:(double)a3
{
  [(NTKProteusContentView *)self _backgroundFraction];
  -[NTKProteusContentView _scaleForBackgroundFraction:](self, "_scaleForBackgroundFraction:");
  double v4 = [(NTKProteusContentView *)self device];
  NTKEnableAODVibrancy();

  CLKInterpolateBetweenPoints();
  double v6 = v5;
  double v8 = v7;
  -[NTKProteusContentView _updateScale:forLabels:](self, "_updateScale:forLabels:", self->_regularHourDigits);
  roundedHourDigits = self->_roundedHourDigits;

  -[NTKProteusContentView _updateScale:forLabels:](self, "_updateScale:forLabels:", roundedHourDigits, v6, v8);
}

- (CGPoint)_scaleForBackgroundFraction:(double)a3
{
  double v3 = 1.0;
  double v4 = 1.0;
  if (a3 > 0.0)
  {
    [(NTKProteusContentView *)self bounds];
    double v6 = self->_device;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_16578);
    id WeakRetained = objc_loadWeakRetained(&qword_16580);
    if (WeakRetained)
    {
      double v8 = WeakRetained;
      double v9 = (CLKDevice *)objc_loadWeakRetained(&qword_16580);
      if (v9 == v6)
      {
        id v10 = [(CLKDevice *)v6 version];
        uint64_t v11 = qword_16588;

        if (v10 == (id)v11)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_16578);

          CLKInterpolateBetweenFloatsClipped();
          double v4 = v13;
          CLKInterpolateBetweenFloatsClipped();
          double v3 = v14;
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    id v12 = objc_storeWeak(&qword_16580, v6);
    qword_16588 = (uint64_t)[(CLKDevice *)v6 version];

    qword_16570 = 0x4010000000000000;
    goto LABEL_7;
  }
LABEL_8:
  double v15 = v4;
  result.double y = v3;
  result.double x = v15;
  return result;
}

- (void)_updateScale:(CGPoint)a3 forLabels:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  if (v6)
  {
    memset(&v10, 0, sizeof(v10));
    if (x == 0.0 && y == 0.0)
    {
      long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v10.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v10.c = v7;
      *(_OWORD *)&v10.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }
    else
    {
      CGAffineTransformMakeScale(&v10, x, y);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_9774;
    v8[3] = &unk_10548;
    CGAffineTransform v9 = v10;
    [v6 enumerateObjectsUsingBlock:v8];
  }
}

- (void)setStyle:(unint64_t)a3
{
  double v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    unint64_t v8 = a3;
    __int16 v9 = 2048;
    CGAffineTransform v10 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Proteus content-Setting style %lu [%p]", (uint8_t *)&v7, 0x16u);
  }

  if (self->_style != a3)
  {
    self->_style = a3;
    [(NTKProteusContentView *)self _activate:1 digitLayersForStyle:a3];
    if (a3) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
    [(NTKProteusContentView *)self _activate:0 digitLayersForStyle:a3 == 0];
    [(NTKProteusContentView *)self _setLabelAlpha:self->_regularHourDigits forLabels:v6];
    [(NTKProteusContentView *)self _setLabelAlpha:self->_roundedHourDigits forLabels:1.0 - v6];
    [(NTKProteusContentView *)self _backgroundFraction];
    -[NTKProteusContentView _updateScaleBackgroundFraction:](self, "_updateScaleBackgroundFraction:");
  }
}

- (void)_setLabelAlpha:(double)a3 forLabels:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9974;
  v4[3] = &unk_10568;
  *(double *)&v4[4] = a3;
  [a4 enumerateObjectsUsingBlock:v4];
}

- (double)_rainbowFraction
{
  double v3 = objc_opt_class();
  colorPalette = self->_colorPalette;

  [v3 _rainbowFraction:colorPalette];
  return result;
}

+ (double)_rainbowFraction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 configuration];
    double v5 = [v4 pigmentEditOption];
    if ([v5 isRainbowColor]) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    goto LABEL_7;
  }
  objc_opt_class();
  double v6 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    double v4 = [v7 fromPalette];
    double v5 = [v7 toPalette];
    [v4 isRainbowColor];
    [v5 isRainbowColor];
    [v7 transitionFraction];

    CLKInterpolateBetweenFloatsClipped();
    double v6 = v8;
LABEL_7:
  }
  return v6;
}

- (double)_backgroundFraction
{
  id v3 = objc_opt_class();
  colorPalette = self->_colorPalette;

  [v3 _backgroundFraction:colorPalette];
  return result;
}

+ (double)_backgroundFraction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 backgroundStyle] == (char *)&dword_0 + 1) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.0;
    }
  }
  else
  {
    objc_opt_class();
    double v4 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      double v6 = [v5 fromPalette];
      id v7 = [v5 toPalette];
      [v6 backgroundStyle];
      [v7 backgroundStyle];
      [v5 transitionFraction];

      CLKInterpolateBetweenFloatsClipped();
      double v4 = v8;
    }
  }

  return v4;
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);
  [(NTKProteusContentView *)self _rainbowFraction];
  double v5 = v4;
  [(NTKProteusContentView *)self _backgroundFraction];
  [(NTKProteusContentView *)self _applyRainbowFraction:v5 backgroundFraction:v6];
  [(NTKProteusContentView *)self _backgroundFraction];
  -[NTKProteusContentView _updateScaleBackgroundFraction:](self, "_updateScaleBackgroundFraction:");

  [(NTKProteusContentView *)self _updateColorPalette];
}

- (void)_updateColorPalette
{
  id v4 = [(NTKProteusColorPalette *)self->_colorPalette digitColor];
  id v3 = [(NTKProteusColorPalette *)self->_colorPalette background];
  [(UIView *)self->_colorBackgroundView setBackgroundColor:v3];

  [(UIView *)self->_colorMaskView setBackgroundColor:v4];
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (a5)
  {
    id v19 = self->_regularHourDigits;
    __int16 v9 = self->_roundedHourDigits;
    BOOL v10 = a3 < 1.0;
    BOOL v11 = a3 > 0.0;
  }
  else
  {
    id v19 = self->_roundedHourDigits;
    __int16 v9 = self->_regularHourDigits;
    BOOL v10 = a3 > 0.0;
    BOOL v11 = a3 < 1.0;
  }
  BOOL v12 = a4 == a5;
  if (a4 == a5) {
    uint64_t v13 = a4 == 1;
  }
  else {
    uint64_t v13 = v11;
  }
  if (v12) {
    uint64_t v14 = a4 == 0;
  }
  else {
    uint64_t v14 = v10;
  }
  [(NTKProteusContentView *)self _activate:v14 digitLayersForStyle:0];
  [(NTKProteusContentView *)self _activate:v13 digitLayersForStyle:1];
  CLKInterpolateBetweenFloatsClipped();
  double v16 = v15;
  CLKInterpolateBetweenFloatsClipped();
  double v18 = v17;
  -[NTKProteusContentView _setLabelAlpha:forLabels:](self, "_setLabelAlpha:forLabels:", v9);
  [(NTKProteusContentView *)self _updateScaleTransitionFraction:v9 forLabels:1.0 - v18];
  [(NTKProteusContentView *)self _setLabelAlpha:v19 forLabels:v16];
  [(NTKProteusContentView *)self _updateScaleTransitionFraction:v19 forLabels:1.0 - v16];
}

- (void)_applyRainbowFraction:(double)a3 backgroundFraction:(double)a4
{
  BOOL v7 = a3 == 0.0;
  BOOL v8 = a4 == 1.0 && a3 == 0.0;
  BOOL v9 = a4 == 0.0 || a3 == 0.0;
  BOOL v10 = a4 == 0.0 || a3 == 1.0;
  BOOL v11 = a4 == 0.0 && a3 == 1.0;
  gradientBackgroundView = self->_gradientBackgroundView;
  BOOL v13 = a4 == 1.0 && a3 == 1.0;
  BOOL v14 = a4 == 1.0 || a3 == 0.0;
  [(UIView *)gradientBackgroundView setHidden:v9];
  [(UIView *)self->_gradientBackgroundView setOpaque:v13];
  [(UIView *)self->_gradientBackgroundView setAlpha:a3 * a4];
  [(UIView *)self->_colorBackgroundView setHidden:v10];
  [(UIView *)self->_colorBackgroundView setOpaque:v8];
  [(UIView *)self->_colorBackgroundView setAlpha:(1.0 - a3) * a4];
  [(UIView *)self->_gradientMaskView setHidden:v14];
  [(UIView *)self->_gradientMaskView setOpaque:v11];
  double v15 = 1.0 - a4;
  [(UIView *)self->_gradientMaskView setAlpha:v15 * a3];
  [(UIView *)self->_colorMaskView setHidden:v11];
  [(UIView *)self->_colorMaskView setOpaque:v7];
  colorMaskView = self->_colorMaskView;

  [(UIView *)colorMaskView setAlpha:1.0 - a3 * v15];
}

- (void)applyTransitionTritiumOnWithFraction:(double)a3
{
  [(NTKProteusContentView *)self _backgroundFraction];
  [(NTKProteusContentView *)self _rainbowFraction];
  double v6 = v5;
  CLKInterpolateBetweenFloatsClipped();
  double v8 = v7;
  [(NTKProteusContentView *)self _updateScaleTritiumFraction:a3];
  [(NTKProteusContentView *)self _updateColorPalette];
  [(NTKProteusContentView *)self _applyRainbowFraction:v6 backgroundFraction:v8];
  if (a3 == 1.0)
  {
    [(NTKProteusContentView *)self motionCompleted];
  }
}

- (void)motionCompleted
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    double v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Proteus content-passivating [%p]", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(NTKProteusContentView *)self _fontLoader];
  [v4 clearStatusCache];
  [v4 clearMotionCache];
}

- (unint64_t)style
{
  return self->_style;
}

- (double)notchFraction
{
  return self->_notchFraction;
}

- (void)setNotchFraction:(double)a3
{
  self->_double notchFraction = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_fontLoader, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_colorMaskView, 0);
  objc_storeStrong((id *)&self->_gradientMaskView, 0);
  objc_storeStrong((id *)&self->_colorBackgroundView, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundView, 0);
  objc_storeStrong((id *)&self->_digitsView, 0);
  objc_storeStrong((id *)&self->_digitWeights, 0);
  objc_storeStrong((id *)&self->_roundedHourDigits, 0);
  objc_storeStrong((id *)&self->_regularHourDigits, 0);
  objc_storeStrong((id *)&self->_digitsSharpMaskView, 0);
  objc_storeStrong((id *)&self->_digitsSoftMaskView, 0);
  objc_storeStrong((id *)&self->_digitsMaskView, 0);
  objc_storeStrong((id *)&self->_rainbowGradientMaskImage, 0);

  objc_storeStrong((id *)&self->_rainbowGradientBackgroundImage, 0);
}

@end