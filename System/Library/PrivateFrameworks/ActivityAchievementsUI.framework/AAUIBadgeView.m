@interface AAUIBadgeView
+ (double)badgeAspectRatio;
- (AAUIBadgeModelConfiguration)configuration;
- (AAUIBadgeViewDelegate)badgeDelegate;
- (AAUIBadgeViewDrawable)drawable;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPaused;
- (BOOL)magnetsEngaged;
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)verticalPanningDisabled;
- (NSNumber)overrideEarnedShader;
- (NSNumber)useMetal;
- (UIImage)backTextureImage;
- (double)_attenuatedSpinRate:(double)a3;
- (double)_attenuatedVelocity:(double)a3;
- (double)playFlipInAnimation;
- (double)playFlipOutAnimation;
- (double)timeSinceLastUpdate;
- (float)_normalizeAngle:(float)a3;
- (id)_defaultTweaks;
- (id)_unearnedShaderDefaultTweaks;
- (id)_valueForTweak:(id)a3;
- (id)drawable:(id)a3 valueForTweakableUniform:(id)a4;
- (id)initUsingEarnedShader:(BOOL)a3;
- (id)initUsingEarnedShader:(BOOL)a3 delegate:(id)a4;
- (id)shortenedBadgeBacksideStringProvider;
- (id)snapshot;
- (id)tweakableUniformsForDrawable:(id)a3;
- (id)updateBadgeModelForDrawable:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyImpulse:(double)a3;
- (void)_generateBackTextureImage;
- (void)_invalidateLastUpdateTime;
- (void)_longPressInternalOnly:(id)a3;
- (void)_panned:(id)a3;
- (void)_setBackTextureNeedsRegeneration;
- (void)_spin360Degrees;
- (void)_tapped:(id)a3;
- (void)cleanupAfterSnapshot;
- (void)resizeBadgeForCurrentViewSize;
- (void)setBackTextureImage:(id)a3;
- (void)setBadgeBacksideAttributedString:(id)a3;
- (void)setBadgeBacksideIcon:(id)a3;
- (void)setBadgeDelegate:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDrawable:(id)a3;
- (void)setFixedBadgeAngle:(double)a3;
- (void)setMagnetsEngaged:(BOOL)a3;
- (void)setOverrideEarnedShader:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setShortenedBadgeBacksideStringProvider:(id)a3;
- (void)setUseMetal:(id)a3;
- (void)setVerticalPanningDisabled:(BOOL)a3;
@end

@implementation AAUIBadgeView

- (id)snapshot
{
  v2 = [(AAUIBadgeView *)self drawable];
  v3 = [v2 snapshot];

  return v3;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIBadgeView *)self drawable];
  [v5 setConfiguration:v4];
}

- (void)resizeBadgeForCurrentViewSize
{
  id v2 = [(AAUIBadgeView *)self drawable];
  [v2 resizeBadgeForCurrentViewSize];
}

- (void)cleanupAfterSnapshot
{
  id v2 = [(AAUIBadgeView *)self drawable];
  [v2 cleanupAfterSnapshot];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AAUIBadgeView *)self isPaused];
  v6 = [(AAUIBadgeView *)self drawable];
  [v6 setPaused:v3];

  if (v5 && !v3)
  {
    [(AAUIBadgeView *)self _invalidateLastUpdateTime];
    [(AAUIBadgeView *)self setNeedsDisplay];
  }
}

- (AAUIBadgeViewDrawable)drawable
{
  return self->_drawable;
}

- (BOOL)isPaused
{
  id v2 = [(AAUIBadgeView *)self drawable];
  char v3 = [v2 isPaused];

  return v3;
}

- (id)initUsingEarnedShader:(BOOL)a3
{
  BOOL useEarnedShader = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)AAUIBadgeView;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[AAUIBadgeView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x263F001A8], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_magnetsEngaged = 1;
    v10 = [(AAUIBadgeView *)v8 overrideEarnedShader];

    if (v10)
    {
      v11 = [(AAUIBadgeView *)v9 overrideEarnedShader];
      v9->_BOOL useEarnedShader = [v11 BOOLValue];

      v12 = ACHLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(AAUIBadgeView *)v9 overrideEarnedShader];
        *(_DWORD *)buf = 138543362;
        v31 = v13;
        _os_log_impl(&dword_229290000, v12, OS_LOG_TYPE_DEFAULT, "Overriding earned shader value: %{public}@", buf, 0xCu);
      }
      BOOL useEarnedShader = v9->_useEarnedShader;
    }
    else
    {
      v9->_BOOL useEarnedShader = useEarnedShader;
    }
    if (useEarnedShader) {
      [(AAUIBadgeView *)v9 _defaultTweaks];
    }
    else {
    uint64_t v14 = [(AAUIBadgeView *)v9 _unearnedShaderDefaultTweaks];
    }
    tweakableUniforms = v9->_tweakableUniforms;
    v9->_tweakableUniforms = (NSDictionary *)v14;

    v16 = objc_alloc_init(AAUIBadge);
    badge = v9->_badge;
    v9->_badge = v16;

    if (!v9->_useEarnedShader) {
      [(AAUIBadge *)v9->_badge setMaxRotationY:1.48352986];
    }
    [(AAUIBadgeView *)v9 _invalidateLastUpdateTime];
    v18 = [[AAUIMetalBadgeView alloc] initUsingEarnedShader:v9->_useEarnedShader delegate:v9];
    drawable = v9->_drawable;
    v9->_drawable = v18;

    if (v9->_drawable)
    {
      [(AAUIBadgeView *)v9 setAutoresizingMask:18];
      v20 = [(AAUIBadgeViewDrawable *)v9->_drawable view];
      objc_msgSend(v20, "setFrame:", v4, v5, v6, v7);

      v21 = [(AAUIBadgeViewDrawable *)v9->_drawable view];
      [(AAUIBadgeView *)v9 addSubview:v21];
    }
    uint64_t v22 = [objc_alloc(MEMORY[0x263F82A00]) initWithTarget:v9 action:sel__panned_];
    spinRecognizer = v9->_spinRecognizer;
    v9->_spinRecognizer = (UIPanGestureRecognizer *)v22;

    [(UIPanGestureRecognizer *)v9->_spinRecognizer setDelegate:v9];
    [(AAUIBadgeView *)v9 addGestureRecognizer:v9->_spinRecognizer];
    uint64_t v24 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v9 action:sel__tapped_];
    tapRecognizer = v9->_tapRecognizer;
    v9->_tapRecognizer = (UITapGestureRecognizer *)v24;

    [(AAUIBadgeView *)v9 addGestureRecognizer:v9->_tapRecognizer];
    if ([MEMORY[0x263F0A980] isAppleInternalInstall])
    {
      uint64_t v26 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:v9 action:sel__longPressInternalOnly_];
      longPressRecognizer = v9->_longPressRecognizer;
      v9->_longPressRecognizer = (UILongPressGestureRecognizer *)v26;

      [(UILongPressGestureRecognizer *)v9->_longPressRecognizer setNumberOfTouchesRequired:2];
      [(AAUIBadgeView *)v9 addGestureRecognizer:v9->_longPressRecognizer];
    }
  }
  return v9;
}

- (NSNumber)overrideEarnedShader
{
  overrideEarnedShader = self->_overrideEarnedShader;
  if (!overrideEarnedShader)
  {
    double v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v5 = [v4 objectForKey:@"UseEarnedShader"];
    double v6 = self->_overrideEarnedShader;
    self->_overrideEarnedShader = v5;

    overrideEarnedShader = self->_overrideEarnedShader;
  }
  return overrideEarnedShader;
}

- (void)_invalidateLastUpdateTime
{
  self->_lastUpdateTime = NAN;
}

- (id)updateBadgeModelForDrawable:(id)a3
{
  id v4 = a3;
  if (self->_useEarnedShader)
  {
    double v5 = [(AAUIBadgeView *)self backTextureImage];

    if (!v5) {
      [(AAUIBadgeView *)self _generateBackTextureImage];
    }
  }
  [(AAUIBadgeView *)self timeSinceLastUpdate];
  double v7 = v6;
  [(AAUIBadge *)self->_badge rotationY];
  double v9 = v8;
  if (![(AAUIBadgeView *)self magnetsEngaged]) {
    [(ARUIAnimatableObject *)self->_badge update:v7];
  }
  BOOL v10 = [(AAUIBadgeView *)self magnetsEngaged];
  [(AAUIBadge *)self->_badge rotationY];
  if (v10)
  {
    *(float *)&double v11 = v11;
    [(AAUIBadgeView *)self _normalizeAngle:v11];
    float v13 = v12;
    uint64_t v14 = [(AAUIBadgeView *)self _valueForTweak:@"magneticForce"];
    [v14 doubleValue];
    double v16 = v15;

    v17 = [(AAUIBadgeView *)self _valueForTweak:@"velocityForce"];
    [v17 doubleValue];
    double v19 = v18;

    v20 = [(AAUIBadgeView *)self _valueForTweak:@"velocityForcePower"];
    [v20 doubleValue];
    long double v22 = v21;

    v23 = [(AAUIBadgeView *)self _valueForTweak:@"spinDrag"];
    [v23 doubleValue];
    double v41 = v24;

    v25 = [(AAUIBadgeView *)self _valueForTweak:@"unstickingForce"];
    [v25 doubleValue];
    double v27 = v26;

    double spinRate = self->_spinRate;
    if (spinRate >= 0.0) {
      double v29 = self->_spinRate;
    }
    else {
      double v29 = -spinRate;
    }
    long double v30 = v13;
    double v31 = v19 * pow(v29, v22);
    if (spinRate <= 0.0) {
      double v32 = -v31;
    }
    else {
      double v32 = v31;
    }
    long double v33 = v16 * cos(v30 * 2.0 + 1.57079633);
    long double v34 = v27 * (1.0 / pow(v29 + 1.0, 3.0));
    double v35 = v33 - v32 + sin(v30) * v34;
    double v36 = (1.0 - v41 * v7) * (spinRate + v35 * v7);
    self->_double spinRate = v36;
    [(AAUIBadge *)self->_badge setRotationY:(double)(v30 + v36 * v7)];
    double v37 = self->_spinRate;
    if (v37 < 0.0) {
      double v37 = -v37;
    }
    if (v37 < 0.01)
    {
      double v38 = -v35;
      if (v35 >= 0.0) {
        double v38 = v35;
      }
      if (v38 < 0.02) {
        [(AAUIBadgeView *)self setPaused:1];
      }
    }
  }
  else
  {
    self->_double spinRate = (v11 - v9) / v7;
  }
  self->_lastUpdateTime = CACurrentMediaTime();
  v39 = self->_badge;

  return v39;
}

- (id)_valueForTweak:(id)a3
{
  char v3 = [(NSDictionary *)self->_tweakableUniforms objectForKey:a3];
  id v4 = [v3 objectForKey:@"value"];

  return v4;
}

- (BOOL)magnetsEngaged
{
  return self->_magnetsEngaged;
}

- (double)timeSinceLastUpdate
{
  double v2 = 0.0;
  if (![(AAUIBadgeView *)self isPaused]) {
    return CACurrentMediaTime() - self->_lastUpdateTime;
  }
  return v2;
}

- (id)_unearnedShaderDefaultTweaks
{
  v13[8] = *MEMORY[0x263EF8340];
  v12[0] = @"springMass";
  double v2 = (void *)[&unk_26DD6F7C0 mutableCopy];
  v13[0] = v2;
  v12[1] = @"springStiffness";
  char v3 = (void *)[&unk_26DD6F7E8 mutableCopy];
  v13[1] = v3;
  v12[2] = @"springDamping";
  id v4 = (void *)[&unk_26DD6F810 mutableCopy];
  v13[2] = v4;
  v12[3] = @"spinDrag";
  double v5 = (void *)[&unk_26DD6F838 mutableCopy];
  v13[3] = v5;
  v12[4] = @"magneticForce";
  double v6 = (void *)[&unk_26DD6F860 mutableCopy];
  v13[4] = v6;
  v12[5] = @"velocityForce";
  double v7 = (void *)[&unk_26DD6F888 mutableCopy];
  v13[5] = v7;
  v12[6] = @"unstickingForce";
  double v8 = (void *)[&unk_26DD6F8B0 mutableCopy];
  v13[6] = v8;
  v12[7] = @"velocityForcePower";
  double v9 = (void *)[&unk_26DD6F8D8 mutableCopy];
  v13[7] = v9;
  BOOL v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:8];

  return v10;
}

- (float)_normalizeAngle:(float)a3
{
  float result = fmodf(a3, 6.2832);
  double v4 = result;
  if (result <= 3.14159265)
  {
    if (v4 < -3.14159265) {
      return v4 + 6.28318531;
    }
  }
  else
  {
    float v5 = 6.28318531 - v4;
    return -v5;
  }
  return result;
}

- (id)_defaultTweaks
{
  v13[8] = *MEMORY[0x263EF8340];
  v12[0] = @"springMass";
  double v2 = (void *)[&unk_26DD6F680 mutableCopy];
  v13[0] = v2;
  v12[1] = @"springStiffness";
  char v3 = (void *)[&unk_26DD6F6A8 mutableCopy];
  v13[1] = v3;
  v12[2] = @"springDamping";
  double v4 = (void *)[&unk_26DD6F6D0 mutableCopy];
  v13[2] = v4;
  v12[3] = @"spinDrag";
  float v5 = (void *)[&unk_26DD6F6F8 mutableCopy];
  v13[3] = v5;
  v12[4] = @"magneticForce";
  double v6 = (void *)[&unk_26DD6F720 mutableCopy];
  v13[4] = v6;
  v12[5] = @"velocityForce";
  double v7 = (void *)[&unk_26DD6F748 mutableCopy];
  v13[5] = v7;
  v12[6] = @"unstickingForce";
  double v8 = (void *)[&unk_26DD6F770 mutableCopy];
  v13[6] = v8;
  v12[7] = @"velocityForcePower";
  double v9 = (void *)[&unk_26DD6F798 mutableCopy];
  v13[7] = v9;
  BOOL v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:8];

  return v10;
}

+ (double)badgeAspectRatio
{
  return 0.938967136;
}

- (id)initUsingEarnedShader:(BOOL)a3 delegate:(id)a4
{
  return 0;
}

- (id)drawable:(id)a3 valueForTweakableUniform:(id)a4
{
  return [(AAUIBadgeView *)self _valueForTweak:a4];
}

- (id)tweakableUniformsForDrawable:(id)a3
{
  return self->_tweakableUniforms;
}

- (void)setBadgeBacksideAttributedString:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToAttributedString:self->_backsideAttributedString] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backsideAttributedString, a3);
    [(AAUIBadgeView *)self _setBackTextureNeedsRegeneration];
  }
}

- (void)setBadgeBacksideIcon:(id)a3
{
  id v5 = (UIImage *)a3;
  p_backAppleLogo = &self->_backAppleLogo;
  if (self->_backAppleLogo != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_backAppleLogo, a3);
    p_backAppleLogo = (UIImage **)[(AAUIBadgeView *)self _setBackTextureNeedsRegeneration];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_backAppleLogo, v5);
}

- (void)_setBackTextureNeedsRegeneration
{
  [(AAUIBadgeView *)self setBackTextureImage:0];
  [(AAUIBadgeView *)self setNeedsDisplay];
}

- (void)_generateBackTextureImage
{
  char v3 = [(AAUIBadgeView *)self configuration];
  uint64_t v4 = [v3 badgeShape];

  *(double *)&uint64_t v5 = 240.6;
  double v6 = 120.3;
  *(double *)&uint64_t v7 = 207.8;
  double v8 = 86.95;
  double v9 = 256.0;
  double v10 = 128.0;
  *(double *)&uint64_t v11 = 1.16;
  *(double *)&uint64_t v12 = 268.8;
  double v13 = 134.4;
  double v14 = 256.0;
  *(double *)&uint64_t v15 = 268.8;
  *(double *)&uint64_t v16 = 207.8;
  *(double *)&uint64_t v17 = 240.6;
  switch(v4)
  {
    case 0:
    case 5:
      *(double *)&uint64_t v11 = 1.20754717;
      double v14 = 212.0;
      goto LABEL_4;
    case 1:
LABEL_8:
      double v66 = *(double *)&v11;
      double v9 = *(double *)&v12;
      double v14 = *(double *)&v15;
      double v10 = v13;
      goto LABEL_14;
    case 2:
    case 4:
      *(double *)&uint64_t v11 = 1.16;
      double v14 = 278.0;
LABEL_4:
      double v9 = v14;
      goto LABEL_6;
    case 3:
LABEL_9:
      double v66 = *(double *)&v11;
      goto LABEL_14;
    case 6:
LABEL_10:
      double v66 = *(double *)&v11;
      double v9 = *(double *)&v7;
      double v14 = *(double *)&v16;
      double v10 = v8;
      goto LABEL_14;
    case 7:
LABEL_11:
      double v66 = *(double *)&v11;
      double v9 = *(double *)&v5;
      double v14 = *(double *)&v17;
      double v10 = v6;
      goto LABEL_14;
    default:
      double v9 = *MEMORY[0x263F001B0];
      double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
      *(double *)&uint64_t v11 = 0.0;
LABEL_6:
      double v10 = v14 * 0.5;
      double v13 = v14 * 0.5;
      *(double *)&uint64_t v12 = v9;
      *(double *)&uint64_t v15 = v14;
      double v8 = v14 * 0.5;
      *(double *)&uint64_t v7 = v9;
      *(double *)&uint64_t v16 = v14;
      double v6 = v14 * 0.5;
      *(double *)&uint64_t v5 = v9;
      *(double *)&uint64_t v17 = v14;
      switch(v4)
      {
        case 0:
        case 5:
          double v66 = *(double *)&v11;
          break;
        case 1:
          goto LABEL_8;
        case 2:
          double v66 = *(double *)&v11;
          double v10 = v10 + -26.0;
          break;
        case 3:
          goto LABEL_9;
        case 4:
          double v66 = *(double *)&v11;
          break;
        case 6:
          goto LABEL_10;
        case 7:
          goto LABEL_11;
        default:
          double v66 = *(double *)&v11;
          break;
      }
LABEL_14:
      v71.width = v9;
      v71.height = v14;
      UIGraphicsBeginImageContextWithOptions(v71, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      v72.origin.x = 0.0;
      v72.origin.y = 0.0;
      v72.size.width = v9;
      v72.size.height = v14;
      CGContextClearRect(CurrentContext, v72);
      double v19 = (void *)[(NSAttributedString *)self->_backsideAttributedString mutableCopy];
      if (!v19) {
        double v19 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:&stru_26DD6AF88];
      }
      v20 = [MEMORY[0x263F82B60] mainScreen];
      [v20 scale];
      double v22 = 2.0 / v21;

      double v23 = v9 + v22 * -2.0;
      if ([v19 length])
      {
        double v24 = [v19 attributesAtIndex:0 effectiveRange:0];
      }
      else
      {
        double v24 = (void *)MEMORY[0x263EFFA78];
      }
      v25 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"X\nX\nX" attributes:v24];
      [v25 size];
      if (v26 >= v10) {
        double v27 = v10;
      }
      else {
        double v27 = v26;
      }
      char v70 = 0;
      objc_msgSend(v19, "scaleFontAndKerningToFitSize:minimumFontSize:minimumKerning:stillDidntFit:", &v70, v23, v27, 10.0, 0.7);
      double v29 = v28;
      double v69 = v23;
      if (v70)
      {
        shortenedBadgeBacksideStringProvider = (void (**)(void))self->_shortenedBadgeBacksideStringProvider;
        if (shortenedBadgeBacksideStringProvider)
        {
          double v31 = shortenedBadgeBacksideStringProvider[2]();
          double v32 = v31;
          if (v31)
          {
            long double v33 = (void *)[v31 mutableCopy];

            objc_msgSend(v33, "scaleFontAndKerningToFitSize:minimumFontSize:minimumKerning:stillDidntFit:", 0, v23, v27, 10.0, 0.7);
            double v29 = v34;
            double v19 = v33;
          }
        }
      }
      switch(v4)
      {
        case 0:
        case 3:
        case 4:
        case 5:
          int v35 = 0;
          double v36 = 26.0;
          goto LABEL_34;
        case 1:
          int v35 = 0;
          double v36 = 21.0;
          goto LABEL_34;
        case 2:
          int v35 = 0;
          double v36 = 154.0;
          double v37 = 154.0;
          goto LABEL_35;
        case 6:
          int v35 = 1;
          double v36 = 32.0;
          goto LABEL_34;
        case 7:
          int v35 = 0;
          double v36 = 20.0;
          goto LABEL_34;
        default:
          int v35 = 0;
          double v36 = 0.0;
LABEL_34:
          double v37 = 0.0;
LABEL_35:
          double v38 = v22;
          uint64_t v39 = [v19 length];
          if (v39) {
            double v40 = v29;
          }
          else {
            double v40 = 0.0;
          }
          if (v39) {
            double v41 = v36;
          }
          else {
            double v41 = v37;
          }
          backAppleLogo = self->_backAppleLogo;
          double v68 = v41;
          if (backAppleLogo)
          {
            [(UIImage *)backAppleLogo size];
            double v44 = v66 * v43;
            double v46 = v66 * v45;
          }
          else
          {
            double v44 = *(double *)(MEMORY[0x263F001A8] + 16);
            double v46 = *(double *)(MEMORY[0x263F001A8] + 24);
          }
          UIRoundToViewScale();
          double v64 = v47;
          double v65 = v46;
          if (v35) {
            CGFloat v48 = v47;
          }
          else {
            CGFloat v48 = v38;
          }
          double v67 = v44;
          if (v35)
          {
            CGFloat v49 = v46;
          }
          else
          {
            double v44 = v69;
            CGFloat v49 = v40;
          }
          UIRoundToViewScale();
          double v51 = v50;
          v73.origin.x = v48;
          v73.origin.y = v51;
          v73.size.width = v44;
          v73.size.height = v49;
          double MaxY = CGRectGetMaxY(v73);
          double v53 = v38 - v51;
          double v54 = -0.0;
          if (v51 >= v38) {
            double v53 = 0.0;
          }
          else {
            double v54 = v38 - v51;
          }
          double v55 = v51 + v54;
          double v56 = v68 + MaxY - v53;
          if (v35) {
            double v57 = v56;
          }
          else {
            double v57 = v55;
          }
          if (v35) {
            double v58 = v55;
          }
          else {
            double v58 = v56;
          }
          v74.origin.x = v38;
          v74.origin.y = v57;
          v74.size.width = v69;
          v74.size.height = v40;
          if (!CGRectIsEmpty(v74)) {
            objc_msgSend(v19, "drawInRect:", v38, v57, v69, v40);
          }
          v59 = self->_backAppleLogo;
          if (v59) {
            -[UIImage drawInRect:blendMode:alpha:](v59, "drawInRect:blendMode:alpha:", 0, v64, v58, v67, v65, 0.75);
          }
          UIGraphicsGetImageFromCurrentImageContext();
          v60 = (UIImage *)objc_claimAutoreleasedReturnValue();
          backTextureImage = self->_backTextureImage;
          self->_backTextureImage = v60;

          UIGraphicsEndImageContext();
          v62 = self->_backTextureImage;
          v63 = [(AAUIBadgeView *)self drawable];
          [v63 setBackTextureImage:v62];

          return;
      }
  }
}

- (AAUIBadgeModelConfiguration)configuration
{
  double v2 = [(AAUIBadgeView *)self drawable];
  char v3 = [v2 configuration];

  return (AAUIBadgeModelConfiguration *)v3;
}

- (void)setFixedBadgeAngle:(double)a3
{
  [(AAUIBadgeView *)self setPaused:0];
  [(AAUIBadgeView *)self setMagnetsEngaged:1];
  self->_double spinRate = 0.0;
  [(AAUIBadge *)self->_badge removeAllAnimationsForBadgePropertyType:2];
  [(AAUIBadge *)self->_badge setRotationY:a3];
  [(AAUIBadgeView *)self setNeedsDisplay];
}

- (double)playFlipInAnimation
{
  [(AAUIBadgeView *)self setMagnetsEngaged:0];
  [(AAUIBadge *)self->_badge removeAllAnimationsForBadgePropertyType:2];
  [(AAUIBadge *)self->_badge setRotationY:0.0];
  char v3 = [MEMORY[0x263F15890] animation];
  uint64_t v4 = [(AAUIBadgeView *)self _valueForTweak:@"springMass"];
  [v4 floatValue];
  [v3 setMass:v5];

  double v6 = [(AAUIBadgeView *)self _valueForTweak:@"springStiffness"];
  [v6 floatValue];
  [v3 setStiffness:v7];

  double v8 = [(AAUIBadgeView *)self _valueForTweak:@"springDamping"];
  [v8 floatValue];
  [v3 setDamping:v9];

  [v3 durationForEpsilon:0.001];
  objc_msgSend(v3, "setDuration:");
  [(AAUIBadge *)self->_badge rotationY];
  double v11 = v10;
  [(AAUIBadge *)self->_badge rotationY];
  double v13 = v12;
  objc_initWeak(&location, self);
  double v14 = (void *)MEMORY[0x263F23948];
  [v3 duration];
  double v16 = v15;
  *(float *)&double v11 = v11 - fmod(v13 + 2.22044605e-16, 6.28318531) + 6.28318531;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __36__AAUIBadgeView_playFlipInAnimation__block_invoke;
  v25[3] = &unk_264860E98;
  id v17 = v3;
  id v26 = v17;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __36__AAUIBadgeView_playFlipInAnimation__block_invoke_2;
  v23[3] = &unk_264860D20;
  objc_copyWeak(&v24, &location);
  LODWORD(v18) = LODWORD(v11);
  double v19 = [v14 animationWithEndingFloatValue:v25 duration:v23 customTimingFunction:v18 completion:v16];
  [(AAUIBadge *)self->_badge addAnimation:v19 forBadgePropertyType:2];
  [v17 duration];
  double v21 = v20;

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v21;
}

uint64_t __36__AAUIBadgeView_playFlipInAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeFunction:");
}

void __36__AAUIBadgeView_playFlipInAnimation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMagnetsEngaged:1];
}

- (double)playFlipOutAnimation
{
  double spinRate = self->_spinRate;
  [(AAUIBadgeView *)self setPaused:0];
  [(AAUIBadgeView *)self setMagnetsEngaged:0];
  [(AAUIBadge *)self->_badge removeAllAnimationsForBadgePropertyType:2];
  [(AAUIBadge *)self->_badge rotationY];
  if (fabs(spinRate) > 1.35 && self->_useEarnedShader)
  {
    if (spinRate <= 0.0) {
      double v5 = v4 + -6.28318531 + fmod(-v4, 6.28318531);
    }
    else {
      double v5 = v4 + 6.28318531 - fmod(v4, 6.28318531);
    }
    double v7 = 0.7;
  }
  else
  {
    double v6 = round(v4 / 6.28318531);
    double v5 = (v6 + v6) * 3.14159265;
    double v7 = 0.14;
  }
  double v8 = [MEMORY[0x263F15890] animation];
  float v9 = [(AAUIBadgeView *)self _valueForTweak:@"springMass"];
  [v9 floatValue];
  [v8 setMass:v7 * v10];

  double v11 = [(AAUIBadgeView *)self _valueForTweak:@"springStiffness"];
  [v11 floatValue];
  [v8 setStiffness:v12];

  double v13 = [(AAUIBadgeView *)self _valueForTweak:@"springDamping"];
  [v13 floatValue];
  [v8 setDamping:v14 * 1.14];

  double v15 = -spinRate;
  if (spinRate >= 0.0) {
    double v15 = spinRate;
  }
  [v8 setInitialVelocity:v15 / 3.14159265];
  [v8 durationForEpsilon:0.035];
  objc_msgSend(v8, "setDuration:");
  objc_initWeak(&location, self);
  double v16 = (void *)MEMORY[0x263F23948];
  [v8 duration];
  double v18 = v17;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __37__AAUIBadgeView_playFlipOutAnimation__block_invoke;
  v28[3] = &unk_264860E98;
  id v20 = v8;
  id v29 = v20;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __37__AAUIBadgeView_playFlipOutAnimation__block_invoke_2;
  v26[3] = &unk_264860D20;
  objc_copyWeak(&v27, &location);
  float v19 = v5;
  *(float *)&double v21 = v19;
  double v22 = [v16 animationWithEndingFloatValue:v28 duration:v26 customTimingFunction:v21 completion:v18];
  [(AAUIBadge *)self->_badge addAnimation:v22 forBadgePropertyType:2];
  [v20 duration];
  double v24 = v23;

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v24;
}

uint64_t __37__AAUIBadgeView_playFlipOutAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeFunction:");
}

void __37__AAUIBadgeView_playFlipOutAnimation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMagnetsEngaged:1];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  long double v4 = (UIPanGestureRecognizer *)a3;
  if ([(AAUIBadgeView *)self verticalPanningDisabled] && self->_spinRecognizer == v4)
  {
    [(UIPanGestureRecognizer *)v4 velocityInView:self];
    BOOL v5 = fabs(v6) > fabs(v7);
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (double)_attenuatedSpinRate:(double)a3
{
  [(AAUIBadge *)self->_badge maxRotationY];
  if (v5 > 0.0)
  {
    [(AAUIBadge *)self->_badge rotationY];
    if (v6 >= 0.0) {
      double v7 = v6;
    }
    else {
      double v7 = -v6;
    }
    [(AAUIBadge *)self->_badge maxRotationY];
    if (v8 < 0.0) {
      double v8 = -v8;
    }
    double v9 = v7 - v8;
    if (v9 >= 0.0) {
      double v10 = v9;
    }
    else {
      double v10 = -v9;
    }
    [(AAUIBadge *)self->_badge maxRotationY];
    if (v11 < 0.0) {
      double v11 = -v11;
    }
    return v10 / v11 * a3;
  }
  return a3;
}

- (double)_attenuatedVelocity:(double)a3
{
  [(AAUIBadge *)self->_badge maxRotationY];
  double v5 = -1.0;
  if (a3 >= -1.0) {
    double v5 = a3;
  }
  if (a3 > 1.0) {
    double v5 = 1.0;
  }
  if (v4 <= 0.0) {
    return a3;
  }
  else {
    return v5;
  }
}

- (void)_panned:(id)a3
{
  id v19 = a3;
  double v4 = [v19 view];
  [v4 bounds];
  double v6 = v5;
  [(AAUIBadgeView *)self _attenuatedSpinRate:3.30693964];
  double v8 = v7;
  uint64_t v9 = [v19 state];
  switch(v9)
  {
    case 3:
      [(AAUIBadgeView *)self setMagnetsEngaged:1];
      double v10 = [v19 view];
      [v19 velocityInView:v10];
      [(AAUIBadgeView *)self _attenuatedVelocity:v11 / v6];
      double v13 = v12;

      double v14 = -(v8 * v13);
      if (v8 * v13 >= 0.0) {
        double v14 = v8 * v13;
      }
      if (v14 >= 2.22044605e-16) {
        double v8 = v8 * v13;
      }
      else {
        double v8 = 2.22044605e-16;
      }
      break;
    case 2:
      [(AAUIBadge *)self->_badge rotationY];
      double v16 = v15;
      [v19 translationInView:v4];
      [(AAUIBadge *)self->_badge setRotationY:v16 + v8 * v17 / v6];
      objc_msgSend(v19, "setTranslation:inView:", v4, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      break;
    case 1:
      [(AAUIBadgeView *)self setMagnetsEngaged:0];
      [(AAUIBadge *)self->_badge removeAllAnimationsForBadgePropertyType:2];
      double v8 = 0.0;
      break;
  }
  self->_double spinRate = v8;
  [(AAUIBadgeView *)self setPaused:0];
  double v18 = [(AAUIBadgeView *)self badgeDelegate];
  [v18 badgeViewDidSpin:self];
}

- (void)_longPressInternalOnly:(id)a3
{
  if ([a3 state] == 1)
  {
    [(AAUIBadgeView *)self _spin360Degrees];
  }
}

- (void)_spin360Degrees
{
  [(AAUIBadgeView *)self setPaused:0];
  [(AAUIBadgeView *)self setMagnetsEngaged:0];
  [(AAUIBadge *)self->_badge removeAllAnimationsForBadgePropertyType:2];
  [(AAUIBadge *)self->_badge setRotationY:0.0];
  [(AAUIBadge *)self->_badge rotationY];
  double v4 = v3;
  [(AAUIBadge *)self->_badge rotationY];
  long double v6 = v4 - fmod(v5 + 2.22044605e-16, 6.28318531) + 31.4159265;
  objc_initWeak(&location, self);
  double v7 = (void *)MEMORY[0x263F23948];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  double v12 = __32__AAUIBadgeView__spin360Degrees__block_invoke_2;
  double v13 = &unk_264860D20;
  objc_copyWeak(&v14, &location);
  *(float *)&long double v6 = v6;
  LODWORD(v8) = LODWORD(v6);
  uint64_t v9 = [v7 animationWithEndingFloatValue:&__block_literal_global_4 duration:&v10 customTimingFunction:v8 completion:10.0];
  -[AAUIBadge addAnimation:forBadgePropertyType:](self->_badge, "addAnimation:forBadgePropertyType:", v9, 2, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __32__AAUIBadgeView__spin360Degrees__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMagnetsEngaged:1];
}

- (void)_tapped:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  [(AAUIBadgeView *)self frame];
  double v7 = v5 + v6 * -0.5;
  [(AAUIBadgeView *)self frame];
  double v9 = sin(v7 / v8 + v7 / v8) * 12.0;
  [(AAUIBadgeView *)self _applyImpulse:v9];
}

- (void)_applyImpulse:(double)a3
{
  self->_double spinRate = self->_spinRate + a3;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (UIImage)backTextureImage
{
  return self->_backTextureImage;
}

- (void)setBackTextureImage:(id)a3
{
}

- (id)shortenedBadgeBacksideStringProvider
{
  return self->_shortenedBadgeBacksideStringProvider;
}

- (void)setShortenedBadgeBacksideStringProvider:(id)a3
{
}

- (BOOL)verticalPanningDisabled
{
  return self->_verticalPanningDisabled;
}

- (void)setVerticalPanningDisabled:(BOOL)a3
{
  self->_verticalPanningDisabled = a3;
}

- (AAUIBadgeViewDelegate)badgeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeDelegate);
  return (AAUIBadgeViewDelegate *)WeakRetained;
}

- (void)setBadgeDelegate:(id)a3
{
}

- (void)setDrawable:(id)a3
{
}

- (NSNumber)useMetal
{
  return self->_useMetal;
}

- (void)setUseMetal:(id)a3
{
}

- (void)setOverrideEarnedShader:(id)a3
{
}

- (void)setMagnetsEngaged:(BOOL)a3
{
  self->_magnetsEngaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideEarnedShader, 0);
  objc_storeStrong((id *)&self->_useMetal, 0);
  objc_storeStrong((id *)&self->_drawable, 0);
  objc_destroyWeak((id *)&self->_badgeDelegate);
  objc_storeStrong(&self->_shortenedBadgeBacksideStringProvider, 0);
  objc_storeStrong((id *)&self->_backTextureImage, 0);
  objc_storeStrong((id *)&self->_tweakableUniforms, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_spinRecognizer, 0);
  objc_storeStrong((id *)&self->_backsideAttributedString, 0);
  objc_storeStrong((id *)&self->_backAppleLogo, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

@end