@interface MTLumaDodgePillView
+ (BOOL)supportsBackgroundLuminanceObserving;
+ (CGSize)suggestedSizeForContentWidth:(double)a3 withSettings:(id)a4;
+ (Class)layerClass;
+ (void)initialize;
- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)suggestedSizeForContentWidth:(double)a3;
- (MTLumaDodgePillBackgroundLuminanceObserver)backgroundLumninanceObserver;
- (MTLumaDodgePillView)initWithFrame:(CGRect)a3 settings:(id)a4;
- (MTLumaDodgePillView)initWithFrame:(CGRect)a3 settings:(id)a4 graphicsQuality:(int64_t)a5;
- (NSString)description;
- (double)suggestedEdgeSpacing;
- (int64_t)backgroundLuminance;
- (int64_t)backgroundLuminanceBias;
- (int64_t)style;
- (unint64_t)_dodgeMode;
- (void)_updateLumaTracking;
- (void)_updateModeConfiguration;
- (void)_updatePowerAnalysisOverrideSettings;
- (void)_updateStyle;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4;
- (void)bounce;
- (void)dealloc;
- (void)layoutSubviews;
- (void)resetBackgroundLuminanceHysteresis;
- (void)setBackgroundLuminanceBias:(int64_t)a3;
- (void)setBackgroundLumninanceObserver:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation MTLumaDodgePillView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (int64_t)style
{
  return (uint64_t)(*((unsigned __int8 *)self + 460) << 28) >> 28;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2156C1000, a2, OS_LOG_TYPE_DEBUG, "pill=%p dealloc'ed", (uint8_t *)&v2, 0xCu);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MTLumaDodgePillView;
  [(MTLumaDodgePillView *)&v4 layoutSubviews];
  lowQualityEffectView = self->_lowQualityEffectView;
  [(MTLumaDodgePillView *)self bounds];
  -[_MTLumaDodgePillLowQualityEffectView setFrame:](lowQualityEffectView, "setFrame:");
}

- (CGSize)suggestedSizeForContentWidth:(double)a3
{
  v5 = objc_opt_class();
  settings = self->_settings;

  [v5 suggestedSizeForContentWidth:settings withSettings:a3];
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bounceAnimationKeys, 0);
  objc_storeStrong((id *)&self->_lowQualityEffectView, 0);
  objc_destroyWeak((id *)&self->_backgroundLumninanceObserver);
  objc_storeStrong((id *)&self->_domainSettings, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)setStyle:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssertMain();
  if ((uint64_t)(*((unsigned __int8 *)self + 460) << 28) >> 28 != a3)
  {
    v5 = (void *)MTLogLuma;
    if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = (uint64_t)(*((unsigned __int8 *)self + 460) << 28) >> 28;
      double v7 = v5;
      double v8 = NSStringFromMTLumaDodgePillStyle(v6);
      v9 = NSStringFromMTLumaDodgePillStyle(a3);
      int v10 = 134218498;
      v11 = self;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_2156C1000, v7, OS_LOG_TYPE_INFO, "pill=%p changing style from %{public}@ to %{public}@", (uint8_t *)&v10, 0x20u);
    }
    *((unsigned char *)self + 460) = *((unsigned char *)self + 460) & 0xF0 | a3 & 0xF;
    [(MTLumaDodgePillView *)self _updateStyle];
  }
}

- (void)_updateModeConfiguration
{
  v39[4] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(MTLumaDodgePillView *)self _dodgeMode];
  if (v3 == 2)
  {
    v18 = [(MTLumaDodgePillView *)self layer];
    [v18 setFilters:0];

    v19 = [(MTLumaDodgePillView *)self layer];
    [v19 setContents:0];

    v20 = [(MTLumaDodgePillView *)self layer];
    [v20 setContentsMultiplyColor:0];

    v21 = [(MTLumaDodgePillView *)self layer];
    [v21 setEnabled:1];

    v22 = [(MTLumaDodgePillView *)self layer];
    [v22 setScale:0.5];

    v23 = [_MTLumaDodgePillLowQualityEffectView alloc];
    [(MTLumaDodgePillView *)self bounds];
    v24 = -[_MTLumaDodgePillLowQualityEffectView initWithFrame:](v23, "initWithFrame:");
    lowQualityEffectView = self->_lowQualityEffectView;
    self->_lowQualityEffectView = v24;

    v26 = self->_lowQualityEffectView;
    v27 = [MEMORY[0x263F1C550] colorWithWhite:0.5 alpha:1.0];
    [(_MTLumaDodgePillLowQualityEffectView *)v26 setBackgroundColor:v27];

    v9 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
    [v9 setName:@"colorMatrix"];
    v28 = [(_MTLumaDodgePillLowQualityEffectView *)self->_lowQualityEffectView layer];
    v38 = v9;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
    [v28 setFilters:v29];

    [(MTLumaDodgePillView *)self addSubview:self->_lowQualityEffectView];
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    objc_super v4 = [(MTLumaDodgePillView *)self layer];
    [v4 setContents:0];

    v5 = [(MTLumaDodgePillView *)self layer];
    [v5 setContentsMultiplyColor:0];

    unint64_t v6 = [(MTLumaDodgePillView *)self layer];
    [v6 setScale:1.0];

    double v7 = [(MTLumaDodgePillView *)self layer];
    [v7 setEnabled:1];

    [(_MTLumaDodgePillLowQualityEffectView *)self->_lowQualityEffectView removeFromSuperview];
    double v8 = self->_lowQualityEffectView;
    self->_lowQualityEffectView = 0;

    v9 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BD8]];
    [v9 setName:@"homeAffordanceBase"];
    int v10 = (void *)MEMORY[0x263F1C6B0];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v10 imageNamed:@"lumaDodgePillMap" inBundle:v11];
    objc_msgSend(v9, "setValue:forKey:", objc_msgSend(v12, "CGImage"), @"inputColorMap");

    v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v13 setName:@"gaussianBlur"];
    [v13 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdges"];
    __int16 v14 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B10]];
    [v14 setName:@"colorBrightness"];
    v15 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
    [v15 setName:@"colorSaturate"];
    uint64_t v16 = [(MTLumaDodgePillView *)self layer];
    v39[0] = v9;
    v39[1] = v13;
    v39[2] = v14;
    v39[3] = v15;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
    [v16 setFilters:v17];

LABEL_5:
    return;
  }
  v30 = [(MTLumaDodgePillView *)self layer];
  [v30 setScale:1.0];

  v31 = [(MTLumaDodgePillView *)self layer];
  [v31 setFilters:0];

  [(_MTLumaDodgePillLowQualityEffectView *)self->_lowQualityEffectView removeFromSuperview];
  v32 = self->_lowQualityEffectView;
  self->_lowQualityEffectView = 0;

  v33 = [(MTLumaDodgePillView *)self layer];
  [v33 setEnabled:0];

  v41.width = 1.0;
  v41.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v41, 1, 1.0);
  v34 = [MEMORY[0x263F1C550] whiteColor];
  [v34 setFill];

  v42.origin.x = 0.0;
  v42.origin.y = 0.0;
  v42.size.width = 1.0;
  v42.size.height = 1.0;
  UIRectFill(v42);
  v35 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v36 = [(MTLumaDodgePillView *)self layer];
  id v37 = v35;
  objc_msgSend(v36, "setContents:", objc_msgSend(v37, "CGImage"));
}

- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3
{
  id v4 = a3;
  if (__supportedAnimationPropertyKey(v4))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTLumaDodgePillView;
    BOOL v5 = [(MTLumaDodgePillView *)&v7 _shouldAnimatePropertyAdditivelyWithKey:v4];
  }

  return v5;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (__supportedAnimationPropertyKey(v4))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTLumaDodgePillView;
    BOOL v5 = [(MTLumaDodgePillView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

+ (CGSize)suggestedSizeForContentWidth:(double)a3 withSettings:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 _referenceBounds];
  double v8 = v7;
  double v10 = v9;

  if (v8 <= v10) {
    double v11 = v8;
  }
  else {
    double v11 = v10;
  }
  if (BSFloatLessThanOrEqualToFloat())
  {
    [v5 minWidth];
  }
  else
  {
    if (v8 < v10) {
      double v8 = v10;
    }
    if (!BSFloatGreaterThanOrEqualToFloat())
    {
      [v5 minWidth];
      double v15 = v14;
      [v5 maxWidth];
      double v13 = v15 + (a3 - v11) * ((v16 - v15) / (v8 - v11));
      goto LABEL_12;
    }
    [v5 maxWidth];
  }
  double v13 = v12;
LABEL_12:
  [v5 height];
  double v18 = v17;

  double v19 = v13;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (MTLumaDodgePillView)initWithFrame:(CGRect)a3 settings:(id)a4 graphicsQuality:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  if (!v13)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MTLumaDodgePillView.m", 99, @"Invalid parameter not satisfying: %@", @"settings != nil" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)MTLumaDodgePillView;
  double v14 = -[MTPillView initWithFrame:settings:](&v22, sel_initWithFrame_settings_, v13, x, y, width, height);
  uint64_t v15 = (uint64_t)v14;
  if (v14)
  {
    *((unsigned char *)v14 + 460) &= 0xF0u;
    if (a5) {
      char v16 = 8;
    }
    else {
      char v16 = 4;
    }
    *((unsigned char *)v14 + 461) = *((unsigned char *)v14 + 461) & 0xF3 | v16;
    objc_storeStrong((id *)&v14->_settings, a4);
    uint64_t v17 = +[MTLumaDodgePillDomain rootSettings];
    double v18 = *(void **)(v15 + 416);
    *(void *)(v15 + 416) = v17;

    [*(id *)(v15 + 416) addKeyObserver:v15];
    *(unsigned char *)(v15 + 463) = [*(id *)(v15 + 416) disableLumaTracking];
    *(unsigned char *)(v15 + 461) = *(unsigned char *)(v15 + 461) & 0xCF | (16
                                                          * ([*(id *)(v15 + 416) overrideDodgeMode] & 3));
    [(id)v15 _updateModeConfiguration];
    [(id)v15 _updateStyle];
    [(id)v15 _updateLumaTracking];
    double v19 = MTLogLuma;
    if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_DEBUG)) {
      -[MTLumaDodgePillView initWithFrame:settings:graphicsQuality:](v15, v19);
    }
  }

  return (MTLumaDodgePillView *)v15;
}

- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssertMain();
  unint64_t v6 = MTLogLuma;
  if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_DEBUG)) {
    -[MTLumaDodgePillView backdropLayer:didChangeLuma:]((uint64_t)self, v6, a4);
  }
  int v7 = *((unsigned __int8 *)self + 460);
  BOOL lumaIsValid = self->_lumaIsValid;
  self->_double luma = a4;
  double v9 = [(MTLumaDodgePillView *)self layer];
  int v10 = [v9 tracksLuma];

  if (!v10)
  {
    double v14 = MTLogLuma;
    if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v29 = 134218240;
      *(void *)&v29[4] = self;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = a4;
      _os_log_impl(&dword_2156C1000, v14, OS_LOG_TYPE_INFO, "pill=%p unexpected luma change (%.2f) - reporting unknown", v29, 0x16u);
    }
    int v11 = *((unsigned char *)self + 460) & 0x8F;
    goto LABEL_13;
  }
  self->_BOOL lumaIsValid = 1;
  [(MTLumaDodgePillSettings *)self->_settings brightLumaThreshold];
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    int v11 = *((unsigned __int8 *)self + 460);
    if ((v11 & 0x70) == 0x20) {
      goto LABEL_14;
    }
    double v12 = MTLogLuma;
    if (!os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    *(_DWORD *)v29 = 134218240;
    *(void *)&v29[4] = self;
    *(_WORD *)&v29[12] = 2048;
    *(double *)&v29[14] = a4;
    id v13 = "pill=%p responding to light luma change (%.2f)";
    goto LABEL_8;
  }
  [(MTLumaDodgePillSettings *)self->_settings darkLumaThreshold];
  int v19 = BSFloatLessThanOrEqualToFloat();
  int v11 = *((unsigned __int8 *)self + 460);
  if (v19)
  {
    if ((v11 & 0x70) != 0x10)
    {
      double v12 = MTLogLuma;
      if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v29 = 134218240;
        *(void *)&v29[4] = self;
        *(_WORD *)&v29[12] = 2048;
        *(double *)&v29[14] = a4;
        double v20 = "pill=%p responding to dark luma change (%.2f)";
LABEL_27:
        _os_log_impl(&dword_2156C1000, v12, OS_LOG_TYPE_INFO, v20, v29, 0x16u);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
  }
  else if ((v11 & 0x70) == 0)
  {
    if ((*((_WORD *)self + 230) & 0x380) != 0)
    {
      v21 = (void *)MTLogLuma;
      if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
      {
        unint64_t v22 = (uint64_t)(__int16)(*((_WORD *)self + 230) << 6) >> 13;
        v23 = v21;
        v24 = NSStringFromMTLumaDodgePillBackgroundLuminance(v22);
        *(_DWORD *)v29 = 134218498;
        *(void *)&v29[4] = self;
        *(_WORD *)&v29[12] = 2048;
        *(double *)&v29[14] = a4;
        *(_WORD *)&v29[22] = 2114;
        v30 = v24;
        _os_log_impl(&dword_2156C1000, v23, OS_LOG_TYPE_INFO, "pill=%p ambiguous initial luma (%.2f) - biased %{public}@", v29, 0x20u);
      }
      int v11 = (*((unsigned __int16 *)self + 230) >> 3) & 0x70 | *((unsigned char *)self + 460) & 0x8F;
      goto LABEL_13;
    }
    int v26 = *((unsigned __int8 *)self + 460);
    if ((v26 & 0xF) == 4)
    {
      double v12 = MTLogLuma;
      if (!os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO)) {
        goto LABEL_28;
      }
      *(_DWORD *)v29 = 134218240;
      *(void *)&v29[4] = self;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = a4;
      double v20 = "pill=%p ambiguous initial luma (%.2f) - assuming dark since current style is white";
      goto LABEL_27;
    }
    if (v26 << 28 >> 28 == 3)
    {
      double v12 = MTLogLuma;
      if (!os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      *(_DWORD *)v29 = 134218240;
      *(void *)&v29[4] = self;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = a4;
      id v13 = "pill=%p ambiguous initial luma (%.2f) - assuming light since current style is black";
LABEL_8:
      _os_log_impl(&dword_2156C1000, v12, OS_LOG_TYPE_INFO, v13, v29, 0x16u);
LABEL_9:
      int v11 = *((unsigned char *)self + 460) & 0x8F | 0x20;
LABEL_13:
      *((unsigned char *)self + 460) = v11;
      goto LABEL_14;
    }
    [(MTLumaDodgePillSettings *)self->_settings initialLumaThreshold];
    int v27 = BSFloatGreaterThanOrEqualToFloat();
    double v12 = MTLogLuma;
    BOOL v28 = os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO);
    if (v27)
    {
      if (!v28) {
        goto LABEL_9;
      }
      *(_DWORD *)v29 = 134218240;
      *(void *)&v29[4] = self;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = a4;
      id v13 = "pill=%p ambiguous initial luma (%.2f) - defaulting light";
      goto LABEL_8;
    }
    if (v28)
    {
      *(_DWORD *)v29 = 134218240;
      *(void *)&v29[4] = self;
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = a4;
      double v20 = "pill=%p ambiguous initial luma (%.2f) - defaulting dark";
      goto LABEL_27;
    }
LABEL_28:
    int v11 = *((unsigned char *)self + 460) & 0x8F | 0x10;
    goto LABEL_13;
  }
LABEL_14:
  if (((v11 ^ v7) & 0x70) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundLumninanceObserver);
    [WeakRetained lumaDodgePillDidDetectBackgroundLuminanceChange:self];
  }
  if ([(MTLumaDodgePillView *)self _dodgeMode] == 2
    && (!BSFloatEqualToFloat() || self->_lumaIsValid != lumaIsValid))
  {
    lowQualityEffectView = self->_lowQualityEffectView;
    if (self->_lumaIsValid) {
      double luma = self->_luma;
    }
    else {
      double luma = 0.5;
    }
    v25 = [MEMORY[0x263F1C550] colorWithWhite:luma alpha:1.0];
    [(_MTLumaDodgePillLowQualityEffectView *)lowQualityEffectView setBackgroundColor:v25];
  }
}

- (void)_updateLumaTracking
{
  unint64_t v3 = [(MTLumaDodgePillView *)self _dodgeMode];
  unint64_t v4 = v3;
  if (!self->_disableLumaTracking
    && (v3 == 2
     || (id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundLumninanceObserver),
         WeakRetained,
         WeakRetained)))
  {
    id v8 = [(MTLumaDodgePillView *)self layer];
    [v8 setTracksLuma:1];
  }
  else
  {
    id v5 = [(MTLumaDodgePillView *)self layer];
    [v5 setTracksLuma:0];

    self->_BOOL lumaIsValid = 0;
    *((unsigned char *)self + 460) &= 0x8Fu;
    if (v4 != 2) {
      return;
    }
    lowQualityEffectView = self->_lowQualityEffectView;
    id v8 = [MEMORY[0x263F1C550] colorWithWhite:0.5 alpha:1.0];
    -[_MTLumaDodgePillLowQualityEffectView setBackgroundColor:](lowQualityEffectView, "setBackgroundColor:");
  }
}

- (void)_updateStyle
{
  unint64_t v3 = [(MTLumaDodgePillView *)self _dodgeMode];
  if (v3 == 2)
  {
    int v5 = *((unsigned __int8 *)self + 460);
    if ((v5 & 0xF) == 4)
    {
      *(_OWORD *)v33 = xmmword_2156D2BE0;
      long long v32 = xmmword_2156D2C30;
      long long v31 = xmmword_2156D2C40;
      long long v6 = xmmword_2156D2C50;
    }
    else
    {
      if (v5 << 28 >> 28 != 3)
      {
        long long v31 = *(_OWORD *)(MEMORY[0x263F15720] + 32);
        long long v32 = *(_OWORD *)(MEMORY[0x263F15720] + 48);
        *(_OWORD *)v33 = *(_OWORD *)(MEMORY[0x263F15720] + 64);
        [(_MTLumaDodgePillLowQualityEffectView *)self->_lowQualityEffectView layer];
        goto LABEL_15;
      }
      *(_OWORD *)v33 = xmmword_2156D2BE0;
      long long v32 = xmmword_2156D2BF0;
      long long v31 = xmmword_2156D2C00;
      long long v6 = xmmword_2156D2C10;
    }
    [(_MTLumaDodgePillLowQualityEffectView *)self->_lowQualityEffectView layer];
    int v11 = LABEL_15:;
    v35[0] = v29;
    v35[1] = v30;
    v35[2] = v31;
    v35[3] = v32;
    v35[4] = *(_OWORD *)v33;
    double v12 = [MEMORY[0x263F08D40] valueWithBytes:v35 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
    [v11 setValue:v12 forKeyPath:@"filters.colorMatrix.inputColorMatrix"];

    return;
  }
  if (v3 == 1)
  {
    switch(*((unsigned __int8 *)self + 460) << 28 >> 28)
    {
      case 1:
        uint64_t v4 = [(MTLumaDodgePillSettings *)self->_settings thinSettings];
        break;
      case 2:
        uint64_t v4 = [(MTLumaDodgePillSettings *)self->_settings graySettings];
        break;
      case 3:
        uint64_t v4 = [(MTLumaDodgePillSettings *)self->_settings blackSettings];
        break;
      case 4:
        uint64_t v4 = [(MTLumaDodgePillSettings *)self->_settings whiteSettings];
        break;
      default:
        uint64_t v4 = [(MTLumaDodgePillSettings *)self->_settings noneSettings];
        break;
    }
    v34 = (void *)v4;
    id v13 = [(MTLumaDodgePillView *)self layer];
    double v14 = NSNumber;
    [(MTLumaDodgePillSettings *)self->_settings colorAddWhiteness];
    double v16 = v15;
    [v34 colorAddOpacity];
    double v18 = [v14 numberWithDouble:v16 * v17];
    [v13 setValue:v18 forKeyPath:@"filters.homeAffordanceBase.inputAddWhite"];

    int v19 = NSNumber;
    [v34 lumaMapPlusColorOpacity];
    double v20 = objc_msgSend(v19, "numberWithDouble:");
    [v13 setValue:v20 forKeyPath:@"filters.homeAffordanceBase.inputAmount"];

    v21 = NSNumber;
    [v34 overlayBlendOpacity];
    unint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
    [v13 setValue:v22 forKeyPath:@"filters.homeAffordanceBase.inputOverlayOpacity"];

    v23 = NSNumber;
    [v34 blur];
    v24 = objc_msgSend(v23, "numberWithDouble:");
    [v13 setValue:v24 forKeyPath:@"filters.gaussianBlur.inputRadius"];

    v25 = NSNumber;
    [v34 brightness];
    int v26 = objc_msgSend(v25, "numberWithDouble:");
    [v13 setValue:v26 forKeyPath:@"filters.colorBrightness.inputAmount"];

    int v27 = NSNumber;
    [v34 saturation];
    BOOL v28 = objc_msgSend(v27, "numberWithDouble:");
    [v13 setValue:v28 forKeyPath:@"filters.colorSaturate.inputAmount"];
  }
  else
  {
    uint64_t v7 = ((uint64_t)(*((unsigned __int8 *)self + 460) << 28) >> 28) - 1;
    if (((*((unsigned __int8 *)self + 460) << 28 >> 28) - 1) > 3u)
    {
      double v9 = 0.0;
      double v8 = 0.5;
    }
    else
    {
      double v8 = dbl_2156D2C80[v7];
      double v9 = dbl_2156D2CA0[(int)v7];
    }
    v34 = [(MTLumaDodgePillView *)self layer];
    id v10 = [MEMORY[0x263F1C550] colorWithWhite:v8 alpha:v9];
    objc_msgSend(v34, "setContentsMultiplyColor:", objc_msgSend(v10, "CGColor"));
  }
}

- (unint64_t)_dodgeMode
{
  unsigned int v2 = (*((unsigned __int8 *)self + 461) >> 4) & 3;
  if (!v2) {
    return (*((unsigned __int8 *)self + 461) >> 2) & 3;
  }
  return v2;
}

- (void)setBackgroundLumninanceObserver:(id)a3
{
  id obj = a3;
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundLumninanceObserver);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)&self->_backgroundLumninanceObserver, obj);
  }
  [(MTLumaDodgePillView *)self _updateLumaTracking];
}

- (int64_t)backgroundLuminance
{
  return (uint64_t)(char)(2 * *((unsigned char *)self + 460)) >> 5;
}

- (void)setBackgroundLuminanceBias:(int64_t)a3
{
  char v3 = a3;
  BSDispatchQueueAssertMain();
  *((_WORD *)self + 230) = *((_WORD *)self + 230) & 0xFC7F | ((v3 & 7) << 7);
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    MTRegisterMaterialKitLogging();
  }
}

- (MTLumaDodgePillView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  return -[MTLumaDodgePillView initWithFrame:settings:graphicsQuality:](self, "initWithFrame:settings:graphicsQuality:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updatePowerAnalysisOverrideSettings
{
  self->_disableLumaTracking = [(MTLumaDodgePillSettings *)self->_domainSettings disableLumaTracking];
  unint64_t v3 = ((unint64_t)*((unsigned __int8 *)self + 461) >> 4) & 3;
  char v4 = [(MTLumaDodgePillSettings *)self->_domainSettings overrideDodgeMode];
  *((unsigned char *)self + 461) = (16 * (v4 & 3)) | *((unsigned char *)self + 461) & 0xCF;
  if ((v4 & 3) != v3)
  {
    [(MTLumaDodgePillView *)self _updateModeConfiguration];
    [(MTLumaDodgePillView *)self _updateStyle];
  }

  [(MTLumaDodgePillView *)self _updateLumaTracking];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(MTLumaDodgePillSettings *)self->_settings maxWidth];
  double v6 = v5;
  [(MTLumaDodgePillSettings *)self->_settings minWidth];
  if (v7 < width) {
    double v7 = width;
  }
  if (v6 <= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  [(MTLumaDodgePillSettings *)self->_settings height];
  double v10 = v9;
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(MTLumaDodgePillView *)self frame];
  double v5 = NSStringFromCGRect(v11);
  double v6 = NSStringFromMTLumaDodgePillStyle((uint64_t)(*((unsigned __int8 *)self + 460) << 28) >> 28);
  double v7 = NSStringFromMTLumaDodgePillBackgroundLuminance((uint64_t)(char)(2 * *((unsigned char *)self + 460)) >> 5);
  double v8 = [v3 stringWithFormat:@"<%@:%p frame=%@ style=%@ backgroundLuminance=%@>", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssertMain();
  unsigned int bounceAnimationsInFlight = self->_bounceAnimationsInFlight;
  if (bounceAnimationsInFlight < 2)
  {
    self->_unsigned int bounceAnimationsInFlight = 0;
    double v6 = [(MTLumaDodgePillView *)self layer];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v7 = self->_bounceAnimationKeys;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v6, "removeAnimationForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    bounceAnimationKeys = self->_bounceAnimationKeys;
    self->_bounceAnimationKeys = 0;
  }
  else
  {
    self->_unsigned int bounceAnimationsInFlight = bounceAnimationsInFlight - 1;
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_domainSettings == a3) {
    BSDispatchMain();
  }
}

uint64_t __51__MTLumaDodgePillView_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePowerAnalysisOverrideSettings];
}

+ (BOOL)supportsBackgroundLuminanceObserving
{
  return 1;
}

- (void)resetBackgroundLuminanceHysteresis
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssertMain();
  unint64_t v3 = MTLogLuma;
  if (os_log_type_enabled((os_log_t)MTLogLuma, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    double v6 = self;
    _os_log_impl(&dword_2156C1000, v3, OS_LOG_TYPE_INFO, "pill=%p resetting luma hysteresis by request", (uint8_t *)&v5, 0xCu);
  }
  *((unsigned char *)self + 460) &= 0x8Fu;
  if (self->_lumaIsValid)
  {
    uint64_t v4 = [(MTLumaDodgePillView *)self layer];
    [(MTLumaDodgePillView *)self backdropLayer:v4 didChangeLuma:self->_luma];
  }
}

- (void)bounce
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = ++bounce___unique;
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"bounce-%u.up", bounce___unique);
  id v15 = (id)[v4 copy];

  int v5 = [MEMORY[0x263F15890] animationWithKeyPath:@"position.y"];
  [v5 setAdditive:1];
  [v5 setMass:1.0];
  [v5 setStiffness:300.0];
  [v5 setDamping:13.0];
  [v5 setFromValue:&unk_26C647F00];
  [v5 setToValue:&unk_26C647F10];
  uint64_t v6 = *MEMORY[0x263F15AB0];
  [v5 setFillMode:*MEMORY[0x263F15AB0]];
  [v5 setRemovedOnCompletion:0];
  [v5 setDelegate:self];
  [v5 settlingDuration];
  objc_msgSend(v5, "setDuration:");
  uint64_t v7 = *MEMORY[0x263F15980];
  [v5 setBeginTimeMode:*MEMORY[0x263F15980]];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"bounce-%u.dn", v3);
  uint64_t v9 = (void *)[v8 copy];

  uint64_t v10 = [MEMORY[0x263F15890] animationWithKeyPath:@"position.y"];
  [v10 setAdditive:1];
  [v10 setMass:1.0];
  [v10 setStiffness:300.0];
  [v10 setDamping:13.0];
  [v10 setFromValue:&unk_26C647F00];
  [v10 setToValue:&unk_26C647F20];
  [v10 setFillMode:v6];
  [v10 setRemovedOnCompletion:0];
  [v10 setDelegate:self];
  [v10 settlingDuration];
  objc_msgSend(v10, "setDuration:");
  [v10 setBeginTime:0.2];
  [v10 setBeginTimeMode:v7];
  self->_bounceAnimationsInFlight += 2;
  bounceAnimationKeys = self->_bounceAnimationKeys;
  if (!bounceAnimationKeys)
  {
    double v12 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    long long v13 = self->_bounceAnimationKeys;
    self->_bounceAnimationKeys = v12;

    bounceAnimationKeys = self->_bounceAnimationKeys;
  }
  [(NSMutableArray *)bounceAnimationKeys addObject:v15];
  [(NSMutableArray *)self->_bounceAnimationKeys addObject:v9];
  long long v14 = [(MTLumaDodgePillView *)self layer];
  [v14 addAnimation:v5 forKey:v15];
  [v14 addAnimation:v10 forKey:v9];
}

- (double)suggestedEdgeSpacing
{
  [(MTLumaDodgePillSettings *)self->_settings edgeSpacing];
  return result;
}

- (MTLumaDodgePillBackgroundLuminanceObserver)backgroundLumninanceObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundLumninanceObserver);

  return (MTLumaDodgePillBackgroundLuminanceObserver *)WeakRetained;
}

- (int64_t)backgroundLuminanceBias
{
  return (uint64_t)(__int16)(*((_WORD *)self + 230) << 6) >> 13;
}

- (void)initWithFrame:(uint64_t)a1 settings:(NSObject *)a2 graphicsQuality:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2156C1000, a2, OS_LOG_TYPE_DEBUG, "pill=%p initialized", (uint8_t *)&v2, 0xCu);
}

- (void)backdropLayer:(double)a3 didChangeLuma:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_2156C1000, a2, OS_LOG_TYPE_DEBUG, "pill=%p luma change (%.2f)", (uint8_t *)&v3, 0x16u);
}

@end