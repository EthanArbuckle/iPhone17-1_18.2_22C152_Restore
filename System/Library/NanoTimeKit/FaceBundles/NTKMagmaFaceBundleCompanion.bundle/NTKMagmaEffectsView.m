@interface NTKMagmaEffectsView
- (BOOL)editing;
- (BOOL)isFrozen;
- (BOOL)paused;
- (CLKUIQuadView)quadView;
- (NTKMagmaEffectsView)initWithFrame:(CGRect)a3 device:(id)a4;
- (id)_buttonColor;
- (void)_addEffect:(id)a3;
- (void)_loadBackgroundIfNeeded;
- (void)_loadSwoosh;
- (void)_setupQuadView;
- (void)_tapAtPoint:(CGPoint)a3;
- (void)_triggerDanceAnimation;
- (void)_triggerTimeChangeAnimation;
- (void)_updatePaused;
- (void)applyCrownIdle:(BOOL)a3;
- (void)applyCrownOffset:(double)a3;
- (void)applyDeviceMotion:(id)a3;
- (void)buttonHighlightedChanged:(BOOL)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)magmaRendererPrepareForFrameWithTime:(double)a3;
- (void)resetDistortion;
- (void)setColorPalette:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPaused:(BOOL)a3;
- (void)setTimeOffset:(double)a3;
- (void)timeFormatterTextDidChange:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)wakeFromTritiumWithTapAt:(CGPoint)a3;
@end

@implementation NTKMagmaEffectsView

- (NTKMagmaEffectsView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKMagmaEffectsView;
  v11 = -[NTKMagmaEffectsView initWithFrame:](&v22, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    v12->_distortionMultiplier = 1.0;
    v12->_lastTapTime = 0.0;
    [(NTKMagmaEffectsView *)v12 _setupQuadView];
    v13 = objc_alloc_init(NTKMagmaMotionEffect);
    motionEffect = v12->_motionEffect;
    v12->_motionEffect = v13;

    v15 = objc_alloc_init(NTKMagmaCrownEffect);
    crownEffect = v12->_crownEffect;
    v12->_crownEffect = v15;

    uint64_t v17 = objc_opt_new();
    effects = v12->_effects;
    v12->_effects = (NSMutableArray *)v17;

    [(NTKMagmaEffectsView *)v12 _addEffect:v12->_motionEffect];
    [(NTKMagmaEffectsView *)v12 _addEffect:v12->_crownEffect];
    v19 = (CLKTimeFormatter *)[objc_alloc((Class)CLKTimeFormatter) initWithForcesLatinNumbers:1];
    timeFormatter = v12->_timeFormatter;
    v12->_timeFormatter = v19;

    [(CLKTimeFormatter *)v12->_timeFormatter setIncludeSeparatorInTimeSubstringFromSeparatorText:0];
    [(CLKTimeFormatter *)v12->_timeFormatter addObserver:v12];
  }

  return v12;
}

- (void)dealloc
{
  [(CLKTimeFormatter *)self->_timeFormatter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)NTKMagmaEffectsView;
  [(NTKMagmaEffectsView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)NTKMagmaEffectsView;
  [(NTKMagmaEffectsView *)&v2 layoutSubviews];
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  [(NTKMagmaEffectsView *)self _updatePaused];
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(NTKMagmaQuad *)self->_quad setRunPhysics:!a3];
  }
}

- (void)_updatePaused
{
  BOOL v3 = !self->_paused;
  -[CLKUIQuadView setPaused:](self->_quadView, "setPaused:");

  [(NTKMagmaEffectsView *)self setUserInteractionEnabled:v3];
}

- (void)_setupQuadView
{
  [(NTKMagmaEffectsView *)self bounds];
  +[CLKUIQuadView quadViewWithFrame:identifier:](CLKUIQuadView, "quadViewWithFrame:identifier:", @"Mgma");
  BOOL v3 = (CLKUIQuadView *)objc_claimAutoreleasedReturnValue();
  quadView = self->_quadView;
  self->_quadView = v3;

  v5 = [NTKMagmaQuad alloc];
  [(CLKDevice *)self->_device screenScale];
  v6 = -[NTKMagmaQuad initWithScale:](v5, "initWithScale:");
  quad = self->_quad;
  self->_quad = v6;

  [(CLKUIQuadView *)self->_quadView addQuad:self->_quad];
  [(NTKMagmaQuad *)self->_quad setRunPhysics:0];
  [(NTKMagmaQuad *)self->_quad setDelegate:self];
  [(NTKMagmaEffectsView *)self _loadSwoosh];
  v8 = self->_quadView;

  [(NTKMagmaEffectsView *)self addSubview:v8];
}

- (void)resetDistortion
{
}

- (void)magmaRendererPrepareForFrameWithTime:(double)a3
{
  if (self->_buttonHighlightAnimating)
  {
    double v5 = (a3 - self->_buttonHighlightLastChange) / 0.15;
    if (v5 > 1.0) {
      double v5 = 1.0;
    }
    self->_buttonHighlightFraction = 1.0 - v5;
    if (fabs(v5 + -1.0) < 0.00000011920929)
    {
      self->_buttonHighlightFraction = 0.0;
      self->_buttonHighlightAnimating = 0;
    }
    quad = self->_quad;
    v7 = [(NTKMagmaEffectsView *)self _buttonColor];
    [(NTKMagmaQuad *)quad setLogoColor:v7];
  }
  obj = self->_effects;
  objc_sync_enter(obj);
  id v8 = [(NSMutableArray *)self->_effects copy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v13 applyForTime:self->_quad quad:a3];
        if ([v13 isComplete])
        {
          [(NSMutableArray *)self->_effects removeObject:v13];
          v14 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [(id)objc_opt_class() description];
            *(_DWORD *)buf = 138412290;
            objc_super v22 = v15;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Magma effect %@ completed", buf, 0xCu);
          }
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }

  objc_sync_exit(obj);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
}

- (void)setTimeOffset:(double)a3
{
  self->_shouldSkipTimeFormatterTextChange = a3 > 0.0;
  -[CLKTimeFormatter setTimeOffset:](self->_timeFormatter, "setTimeOffset:");
}

- (void)timeFormatterTextDidChange:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_shouldSkipTimeFormatterTextChange)
  {
    self->_shouldSkipTimeFormatterTextChange = 0;
  }
  else
  {
    v6 = [v4 timeSubstringToSeparatorText];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%02ld", [v6 integerValue]);

    id v8 = [v5 timeSubstringFromSeparatorText];
    if (![v7 isEqual:self->_displayedUpperLabelText]
      || ([v8 isEqual:self->_displayedLowerLabelText] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedUpperLabelText, v7);
      objc_storeStrong((id *)&self->_displayedLowerLabelText, v8);
      sub_4444(self->_device, &v28);
      double v9 = *((double *)&v28 + 1);
      sub_4444(self->_device, &v26);
      double v10 = v9 - v27;
      long long v24 = 0u;
      long long v25 = 0u;
      sub_4444(self->_device, v23);
      +[NTKMagmaTimeRenderer renderTimeWithHour:v7 minute:v8 fontSize:v23[0] lineSpacing:v10];
      [(NTKMagmaEffectsView *)self bounds];
      [(id)v24 size];
      [(NTKMagmaEffectsView *)self bounds];
      sub_4444(self->_device, &v22);
      CLKPointRoundForDevice();
      double v12 = v11;
      double v14 = v13;
      quad = self->_quad;
      [(id)v24 size];
      -[NTKMagmaQuad setScreenBoundRect:](quad, "setScreenBoundRect:", v12, v14, v16, v17);
      [(NTKMagmaQuad *)self->_quad updateTimeTextureWithImage:v24 tritiumImage:v12 origin:v14];
      if (self->_showingOverrideTime)
      {
        BOOL v18 = 1;
      }
      else
      {
        long long v19 = [v5 overrideDate];
        BOOL v18 = v19 != 0;
      }
      if (!self->_inTritium)
      {
        char v20 = self->_paused || v18;
        if ((v20 & 1) == 0) {
          [(NTKMagmaEffectsView *)self _triggerTimeChangeAnimation];
        }
      }
    }
    v21 = [v5 overrideDate];
    self->_showingOverrideTime = v21 != 0;
  }
}

- (void)_addEffect:(id)a3
{
  id v4 = a3;
  double v5 = self->_effects;
  objc_sync_enter(v5);
  [(NSMutableArray *)self->_effects addObject:v4];
  v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(id)objc_opt_class() description];
    int v8 = 138412290;
    double v9 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Magma effect %@ started", (uint8_t *)&v8, 0xCu);
  }
  objc_sync_exit(v5);
}

- (void)_triggerTimeChangeAnimation
{
  BOOL v3 = [[NTKMagmaTimeChangeEffect alloc] initWithStart:CACurrentMediaTime() duration:0.5 magnitude:11.5 radius:0.3];
  [(NTKMagmaEffectsView *)self _addEffect:v3];
}

- (void)_triggerDanceAnimation
{
  BOOL v3 = [[NTKMagmaTritiumOffEffect alloc] initWithStart:CACurrentMediaTime() duration:0.4 magnitude:1.25 radius:0.3 speed:0.5];
  [(NTKMagmaEffectsView *)self _addEffect:v3];
}

- (void)applyDeviceMotion:(id)a3
{
  id v4 = a3;
  v42 = v4;
  if (v4)
  {
    [v4 rotationRate];
    float64_t v40 = v6;
    float64_t v41 = v5;
    double v8 = v7;
    [v42 userAcceleration];
    double v38 = v10;
    float64_t v39 = v9;
    double TuningWithDefault = NTKMagmaGetTuningWithDefault(@"MagmaSpinMax", 1.0);
    double v12 = NTKMagmaGetTuningWithDefault(@"MagmaSpinMultiplier", 1.3);
    double v13 = NTKMagmaGetTuningWithDefault(@"MagmaSpinNoise", 1.3);
    double v14 = v8 * v12;
    if (v8 * v12 < -TuningWithDefault) {
      double v14 = -TuningWithDefault;
    }
    if (v14 >= TuningWithDefault) {
      double v15 = TuningWithDefault;
    }
    else {
      double v15 = v14;
    }
    double v16 = NTKMagmaGetTuningWithDefault(@"MagmaLateralMax", 2.0);
    double v36 = NTKMagmaGetTuningWithDefault(@"MagmaLateralMultiplier", 1.0);
    double v17 = NTKMagmaGetTuningWithDefault(@"MagmaLateralNoise", 1.0);
    v18.f64[0] = v40;
    v18.f64[1] = v41;
    float32x2_t v19 = vcvt_f32_f64(vmulq_n_f64(vnegq_f64(v18), v36));
    float v20 = sqrtf(vaddv_f32(vmul_f32(v19, v19)));
    if (v20 > 0.0)
    {
      float v21 = fmin(v16 / v20, 1.0);
      float32x2_t v19 = vmul_n_f32(v19, v21);
    }
    double v22 = -v15;
    double v23 = NTKMagmaGetTuningWithDefault(@"MagmaLinearMax", 2.0);
    double v37 = NTKMagmaGetTuningWithDefault(@"MagmaLinearMultiplier", 1.0);
    double v24 = NTKMagmaGetTuningWithDefault(@"MagmaLinearNoise", 1.0);
    v25.f64[0] = v39;
    v26.f64[0] = v39;
    v26.f64[1] = -v38;
    float32x2_t v27 = vcvt_f32_f64(vmulq_n_f64(v26, v37));
    float v28 = sqrtf(vaddv_f32(vmul_f32(v27, v27)));
    if (v28 > 0.0)
    {
      float v29 = fmin(v23 / v28, 1.0);
      float32x2_t v27 = vmul_n_f32(v27, v29);
    }
    v30.f64[0] = v41;
    v30.f64[1] = v40;
    *(float32x2_t *)&v30.f64[0] = vcvt_f32_f64(v30);
    v25.f64[1] = v38;
    float32x2_t v31 = vcvt_f32_f64(v25);
    double v32 = v13 * v22
        + sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v30.f64[0], *(float32x2_t *)&v30.f64[0]))) * v17
        + sqrtf(vaddv_f32(vmul_f32(v31, v31))) * v24;
    [(NTKMagmaMotionEffect *)self->_motionEffect setLinear:COERCE_DOUBLE(vadd_f32(v19, v27))];
    *(float *)&double v33 = v22;
    [(NTKMagmaMotionEffect *)self->_motionEffect setSpin:v33];
    motionEffect = self->_motionEffect;
    *(float *)&double v35 = v32;
  }
  else
  {
    [(NTKMagmaMotionEffect *)self->_motionEffect setLinear:0.0];
    [(NTKMagmaMotionEffect *)self->_motionEffect setSpin:0.0];
    motionEffect = self->_motionEffect;
    double v35 = 0.0;
  }
  [(NTKMagmaMotionEffect *)motionEffect setNoise:v35];
}

- (void)applyCrownOffset:(double)a3
{
  *(float *)&a3 = a3;
  [(NTKMagmaCrownEffect *)self->_crownEffect setOffset:a3];
}

- (void)applyCrownIdle:(BOOL)a3
{
}

- (void)_loadSwoosh
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  sub_4444(self->_device, &v19);
  BOOL v3 = +[NTKMagmaFaceBundle imageWithName:@"victory-logo"];
  double v4 = *((double *)&v21 + 1);
  double v5 = *(double *)&v21;
  [(CLKDevice *)self->_device screenScale];
  double v7 = v5 * v6;
  size_t v8 = (unint64_t)(v5 * v6);
  [(CLKDevice *)self->_device screenScale];
  double v10 = v4 * v9;
  size_t v11 = (unint64_t)(v4 * v9);
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  double v13 = CGBitmapContextCreate(0, v8, v11, 8uLL, v8, DeviceGray, 7u);
  id v18 = v3;
  double v14 = (CGImage *)[v18 CGImage];
  v23.origin.double x = 0.0;
  v23.origin.double y = 0.0;
  v23.size.double width = (double)(unint64_t)v7;
  v23.size.double height = (double)(unint64_t)v10;
  CGContextDrawImage(v13, v23, v14);
  Image = CGBitmapContextCreateImage(v13);
  [(CLKDevice *)self->_device screenScale];
  double v16 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, 0);
  CGImageRelease(Image);
  CGColorSpaceRelease(DeviceGray);
  CGContextRelease(v13);
  [(NTKMagmaEffectsView *)self bounds];
  CGFloat v17 = CGRectGetMidX(v24) - v5 * 0.5;
  [(NTKMagmaEffectsView *)self bounds];
  -[NTKMagmaQuad updateLogoTextureWithImage:origin:](self->_quad, "updateLogoTextureWithImage:origin:", v16, v17, CGRectGetHeight(v25) * 0.5 + *((double *)&v20 + 1) - v4);
}

- (void)_loadBackgroundIfNeeded
{
  if (![(NTKMagmaColorPalette *)self->_palette isSpecialColor]) {
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  palette = self->_palette;
  if ((isKindOfClass & 1) == 0)
  {
    if ([(NTKMagmaColorPalette *)palette isRainbowColor]) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  double v35 = palette;
  double v5 = [(NTKMagmaColorPalette *)v35 fromPalette];
  double v6 = [(NTKMagmaColorPalette *)v35 toPalette];
  if (([v6 isTritium] & 1) == 0)
  {
    id v7 = [v5 backgroundStyle];
    if (v7 == [v6 backgroundStyle])
    {
      [(NTKMagmaColorPalette *)v35 transitionFraction];
      if (v8 < 0.5)
      {
        unsigned int v9 = [v5 isRainbowColor];

        if (!v9) {
          goto LABEL_15;
        }
LABEL_9:
        if (self->_rainbowIsLoaded) {
          return;
        }
        int v10 = 1;
        goto LABEL_16;
      }
      unsigned __int8 v11 = [v6 isRainbowColor];

      if (v11) {
        goto LABEL_9;
      }
LABEL_15:
      int v10 = 0;
LABEL_16:
      [(CLKDevice *)self->_device screenBounds];
      double v13 = v12;
      double v15 = v14;
      [(CLKDevice *)self->_device screenScale];
      double v17 = v16;
      size_t v18 = (unint64_t)(v13 * v16);
      size_t v19 = (unint64_t)(v15 * v16);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      long long v21 = CGBitmapContextCreate(0, v18, v19, 8uLL, 4 * v18, DeviceRGB, 0x4001u);
      if (v10)
      {
        NTKImageNamed();
        CGFloat v22 = (double)v19;
        id v23 = objc_claimAutoreleasedReturnValue();
        CGRect v24 = (CGImage *)[v23 CGImage];
        v40.origin.double x = 0.0;
        v40.origin.double y = 0.0;
        v40.size.double width = (double)v18;
        v40.size.double height = v22;
        CGContextDrawImage(v21, v40, v24);
        self->_rainbowIsLoaded = 1;
      }
      else
      {
        CGRect v25 = +[CAGradientLayer layer];
        v37[0] = @"frame";
        float64x2_t v26 = +[NSNull null];
        v38[0] = v26;
        v37[1] = @"contentsScale";
        float32x2_t v27 = +[NSNull null];
        v38[1] = v27;
        v37[2] = @"colors";
        float v28 = +[NSNull null];
        v38[2] = v28;
        float v29 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
        [v25 setActions:v29];

        [(NTKMagmaEffectsView *)self bounds];
        objc_msgSend(v25, "setFrame:");
        [v25 setContentsScale:v17];
        id v30 = [(NTKMagmaColorPalette *)self->_palette maskedBackgroundStart];
        v36[0] = [v30 CGColor];
        id v31 = [(NTKMagmaColorPalette *)self->_palette maskedBackgroundEnd];
        v36[1] = [v31 CGColor];
        double v32 = +[NSArray arrayWithObjects:v36 count:2];
        [v25 setColors:v32];

        CGContextTranslateCTM(v21, 0.0, (double)v19);
        CGContextScaleCTM(v21, v17, -v17);
        [v25 renderInContext:v21];
        self->_rainbowIsLoaded = 0;
      }
      Image = CGBitmapContextCreateImage(v21);
      v34 = +[UIImage imageWithCGImage:Image scale:0 orientation:v17];
      CGImageRelease(Image);
      CGColorSpaceRelease(DeviceRGB);
      CGContextRelease(v21);
      [(NTKMagmaQuad *)self->_quad updateBackgroundTextureWithImage:v34];

      return;
    }
  }
}

- (id)_buttonColor
{
  BOOL v3 = [(NTKMagmaColorPalette *)self->_palette swoosh];
  double v4 = [v3 colorWithAlphaComponent:0.6];

  double v5 = [(NTKMagmaColorPalette *)self->_palette swoosh];
  double v6 = NTKInterpolateBetweenColors();

  return v6;
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v23 = a3;
  [(NTKMagmaEffectsView *)self _loadBackgroundIfNeeded];
  double v5 = [v23 backgroundTextureAlpha];
  [v5 doubleValue];
  double v7 = v6;

  double v8 = [v23 backgroundMask];
  [v8 doubleValue];
  double v10 = v9;

  quad = self->_quad;
  double v12 = [v23 digitsOutline];
  [(NTKMagmaQuad *)quad setTimeOutlineColor:v12];

  double v13 = self->_quad;
  double v14 = [v23 digits];
  [(NTKMagmaQuad *)v13 setTimeFillColor:v14];

  *(float *)&double v15 = v7;
  [(NTKMagmaQuad *)self->_quad setBackgroundTextureAlpha:v15];
  double v16 = self->_quad;
  double v17 = [v23 backgroundStart];
  [(NTKMagmaQuad *)v16 setBackgroundTopColor:v17];

  size_t v18 = self->_quad;
  size_t v19 = [v23 backgroundEnd];
  [(NTKMagmaQuad *)v18 setBackgroundBottomColor:v19];

  long long v20 = self->_quad;
  long long v21 = [(NTKMagmaEffectsView *)self _buttonColor];
  [(NTKMagmaQuad *)v20 setLogoColor:v21];

  *(float *)&double v22 = v10;
  [(NTKMagmaQuad *)self->_quad setMaskingFraction:v22];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) locationInView:self];
        -[NTKMagmaEffectsView _tapAtPoint:](self, "_tapAtPoint:");
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_tapAtPoint:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  CFTimeInterval v4 = CACurrentMediaTime();
  if (v4 - self->_lastTapTime >= 0.1)
  {
    self->_lastTapTime = v4;
    double TuningWithDefault = NTKMagmaGetTuningWithDefault(@"MagmaTouchMultiplier", -138.0);
    double v9 = NTKMagmaGetTuningWithDefault(@"MagmaTouchSize", 0.35);
    v8.f64[0] = x;
    v8.f64[1] = y;
    double v6 = COERCE_DOUBLE(vcvt_f32_f64(v8));
    quad = self->_quad;
    *(float *)v8.f64 = TuningWithDefault;
    *(float *)&double v9 = v9;
    if (TuningWithDefault <= 0.0)
    {
      [(NTKMagmaQuad *)quad applyQuadraticRepuslorWithOrigin:v6 magnitude:v8.f64[0] radius:v9];
    }
    else
    {
      [(NTKMagmaQuad *)quad applyUniformRepuslorWithOrigin:v6 magnitude:v8.f64[0] radius:v9];
    }
  }
}

- (void)buttonHighlightedChanged:(BOOL)a3
{
  self->_buttonHighlighted = a3;
  if (a3)
  {
    BOOL v4 = 0;
    double v5 = 1.0;
    double v6 = &OBJC_IVAR___NTKMagmaEffectsView__buttonHighlightFraction;
  }
  else
  {
    BOOL v4 = 1;
    double v6 = &OBJC_IVAR___NTKMagmaEffectsView__buttonHighlightLastChange;
    double v5 = CACurrentMediaTime();
  }
  *(double *)((char *)&self->super.super.super.isa + *v6) = v5;
  self->_buttonHighlightAnimating = v4;
  quad = self->_quad;
  id v8 = [(NTKMagmaEffectsView *)self _buttonColor];
  [(NTKMagmaQuad *)quad setLogoColor:v8];
}

- (void)wakeFromTritiumWithTapAt:(CGPoint)a3
{
  self->_tapToWake = 1;
}

- (BOOL)isFrozen
{
  return self->frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->frozen = a3;
}

- (CLKUIQuadView)quadView
{
  return self->_quadView;
}

- (BOOL)paused
{
  return self->_paused;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedLowerLabelText, 0);
  objc_storeStrong((id *)&self->_displayedUpperLabelText, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_crownEffect, 0);
  objc_storeStrong((id *)&self->_motionEffect, 0);
  objc_storeStrong((id *)&self->_effects, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_quadView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end