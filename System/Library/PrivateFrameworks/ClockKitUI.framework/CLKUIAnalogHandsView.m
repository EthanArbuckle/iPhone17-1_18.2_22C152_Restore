@interface CLKUIAnalogHandsView
+ (Class)handViewClass;
+ (double)hourHandAngleForDate:(id)a3;
+ (double)minuteHandAngleForDate:(id)a3;
- (BOOL)_canRunTimeAnimation;
- (BOOL)isFrozen;
- (BOOL)isSecondHandDisabled;
- (BOOL)useDirectionalShadows;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKDevice)device;
- (CLKUIAnalogHandsViewDelegate)delegate;
- (CLKUIHandView)hourHandView;
- (CLKUIHandView)minuteHandView;
- (CLKUIHandView)secondHandView;
- (NSCalendar)calendar;
- (NSTimeZone)timeZone;
- (UIColor)inlayColor;
- (UIView)directionalShadowContainerView;
- (UIView)minuteHandDot;
- (UIView)secondHandDot;
- (double)_timeAnimationFramesPerSecondForDevice:(id)a3;
- (double)minuteHandDotDiameter;
- (double)secondHandDotDiameter;
- (id)createHourHandView;
- (id)createMinuteHandView;
- (id)createSecondHandView;
- (id)displayTime;
- (id)hourHandConfiguration;
- (id)initForDevice:(id)a3;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
- (void)_enumerateHandViews:(id)a3;
- (void)_enumerateHourHandViewsWithBlock:(id)a3;
- (void)_enumerateMinuteHandViewsWithBlock:(id)a3;
- (void)_enumerateSecondHandViewsWithBlock:(id)a3;
- (void)_enumerateShadowViews:(id)a3;
- (void)_significantTimeChanged;
- (void)_startNewTimeAnimation;
- (void)_stopTimeAnimation;
- (void)applyHourMinuteHandsStrokeColor:(id)a3 fillColor:(id)a4;
- (void)applySecondHandColor:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutHandViews;
- (void)layoutShadowViews;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHourHandView:(id)a3;
- (void)setInlayColor:(id)a3;
- (void)setMinuteHandDotDiameter:(double)a3;
- (void)setMinuteHandView:(id)a3;
- (void)setSecondHandDisabled:(BOOL)a3;
- (void)setSecondHandDotDiameter:(double)a3;
- (void)setSecondHandView:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setUseDirectionalShadows:(BOOL)a3;
@end

@implementation CLKUIAnalogHandsView

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CLKUIAnalogHandsView;
  v6 = -[CLKUIAnalogHandsView initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v8;

    v7->_useDirectionalShadows = [(CLKUIAnalogHandsView *)v7 useDirectionalShadows];
    uint64_t v10 = [(CLKUIAnalogHandsView *)v7 createHourHandView];
    hourHandView = v7->_hourHandView;
    v7->_hourHandView = (CLKUIHandView *)v10;

    uint64_t v12 = [(CLKUIAnalogHandsView *)v7 createMinuteHandView];
    minuteHandView = v7->_minuteHandView;
    v7->_minuteHandView = (CLKUIHandView *)v12;

    uint64_t v14 = [(CLKUIAnalogHandsView *)v7 createSecondHandView];
    secondHandView = v7->_secondHandView;
    v7->_secondHandView = (CLKUIHandView *)v14;

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __38__CLKUIAnalogHandsView_initForDevice___block_invoke;
    v39[3] = &unk_1E697C0B0;
    v16 = v7;
    v40 = v16;
    [(CLKUIAnalogHandsView *)v16 _enumerateHandViews:v39];
    if (v7->_useDirectionalShadows)
    {
      uint64_t v17 = objc_opt_new();
      directionalShadowContainerView = v16->_directionalShadowContainerView;
      v16->_directionalShadowContainerView = (UIView *)v17;

      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __38__CLKUIAnalogHandsView_initForDevice___block_invoke_2;
      v37 = &unk_1E697C0D8;
      v19 = v16;
      v38 = v19;
      [(CLKUIAnalogHandsView *)v19 _enumerateShadowViews:&v34];
      -[CLKUIAnalogHandsView addSubview:](v19, "addSubview:", v16->_directionalShadowContainerView, v34, v35, v36, v37);
      [(CLKUIAnalogHandsView *)v19 layoutShadowViews];
    }
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v16 selector:sel__significantTimeChanged name:*MEMORY[0x1E4FB2708] object:0];

    [(CLKUIAnalogHandsView *)v16 setUserInteractionEnabled:0];
    id v21 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_4);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
    if (WeakRetained)
    {
      v23 = WeakRetained;
      id v24 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
      if (v24 == v21)
      {
        uint64_t v25 = [v21 version];
        uint64_t v26 = _LayoutConstants___previousCLKDeviceVersion_4;

        if (v25 == v26)
        {
LABEL_9:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_4);
          uint64_t v29 = _LayoutConstants___constants_0;
          uint64_t v30 = _LayoutConstants___constants_1;

          *(void *)&v16->_secondHandDotDiameter = v30;
          *(void *)&v16->_minuteHandDotDiameter = v29;
          id v31 = [(CLKUIAnalogHandsView *)v16 minuteHandDot];
          id v32 = [(CLKUIAnalogHandsView *)v16 secondHandDot];

          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    id v27 = objc_storeWeak(&_LayoutConstants___cachedDevice_4, v21);
    _LayoutConstants___previousCLKDeviceVersion_4 = [v21 version];

    ___LayoutConstants_block_invoke_4(v28, v21);
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

void __38__CLKUIAnalogHandsView_initForDevice___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 addSubview:v3];
  [v3 setNeedsLayout];
}

uint64_t __38__CLKUIAnalogHandsView_initForDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) addSubview:a2];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];

  v4.receiver = self;
  v4.super_class = (Class)CLKUIAnalogHandsView;
  [(CLKUIAnalogHandsView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUIAnalogHandsView;
  [(CLKUIAnalogHandsView *)&v3 layoutSubviews];
  [(CLKUIAnalogHandsView *)self layoutHandViews];
  [(CLKUIAnalogHandsView *)self layoutShadowViews];
}

- (void)layoutHandViews
{
  [(CLKUIAnalogHandsView *)self bounds];
  double v4 = v3 * 0.5;
  [(CLKUIAnalogHandsView *)self bounds];
  v6[1] = 3221225472;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[2] = __39__CLKUIAnalogHandsView_layoutHandViews__block_invoke;
  v6[3] = &unk_1E697C100;
  v6[4] = self;
  *(double *)&v6[5] = v4;
  *(double *)&v6[6] = v5 * 0.5;
  [(CLKUIAnalogHandsView *)self _enumerateHandViews:v6];
}

void __39__CLKUIAnalogHandsView_layoutHandViews__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = [v5 superview];
  double v4 = *(void **)(a1 + 32);

  if (v3 == v4) {
    objc_msgSend(v5, "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

- (void)layoutShadowViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = self->_hourHandView;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(CLKUIAnalogHandsView *)self subviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isMemberOfClass:objc_opt_class()])
        {
          uint64_t v10 = v9;

          double v3 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(CLKUIAnalogHandsView *)self insertSubview:self->_directionalShadowContainerView belowSubview:v3];
  [(CLKUIAnalogHandsView *)self _enumerateHandViews:&__block_literal_global_10];
}

void __41__CLKUIAnalogHandsView_layoutShadowViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 directionalShadowOffset];
  double v4 = v3;
  double v6 = v5;
  [v2 center];
  double v8 = v4 + v7;
  double v10 = v6 + v9;
  id v11 = [v2 shadowView];

  objc_msgSend(v11, "setCenter:", v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  MEMORY[0x1F40D5FB8](self->_device, a2, (__n128)a3, *(__n128 *)&a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CLKUIAnalogHandsView;
  [(CLKUIAnalogHandsView *)&v4 didMoveToWindow];
  double v3 = [(CLKUIAnalogHandsView *)self window];

  if (v3) {
    [(CLKUIAnalogHandsView *)self _startNewTimeAnimation];
  }
}

- (void)_enumerateHandViews:(id)a3
{
  id v4 = a3;
  [(CLKUIAnalogHandsView *)self _enumerateHourHandViewsWithBlock:v4];
  [(CLKUIAnalogHandsView *)self _enumerateMinuteHandViewsWithBlock:v4];
  if (!self->_secondHandDisabled) {
    [(CLKUIAnalogHandsView *)self _enumerateSecondHandViewsWithBlock:v4];
  }
}

- (void)_enumerateShadowViews:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CLKUIAnalogHandsView__enumerateShadowViews___block_invoke;
  v6[3] = &unk_1E697C148;
  id v7 = v4;
  id v5 = v4;
  [(CLKUIAnalogHandsView *)self _enumerateHandViews:v6];
}

void __46__CLKUIAnalogHandsView__enumerateShadowViews___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = [v6 shadowView];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [v6 shadowView];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (id)hourHandConfiguration
{
  return +[CLKUIAnalogHandConfiguration defaultHourConfigurationForDevice:self->_device];
}

- (id)minuteHandConfiguration
{
  return +[CLKUIAnalogHandConfiguration defaultMinuteConfigurationForDevice:self->_device];
}

- (id)secondHandConfiguration
{
  return +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:self->_device];
}

+ (Class)handViewClass
{
  return (Class)objc_opt_class();
}

- (id)createHourHandView
{
  double v3 = [(CLKUIAnalogHandsView *)self hourHandConfiguration];
  uint64_t v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "handViewClass")), "initWithConfiguration:forDevice:maskedShadow:", v3, self->_device, 0);
  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setColor:v5];

  [v4 anchorPointFromConfiguration];
  double v7 = v6;
  double v9 = v8;
  double v10 = [v4 layer];
  objc_msgSend(v10, "setAnchorPoint:", v7, v9);

  return v4;
}

- (id)createMinuteHandView
{
  double v3 = [(CLKUIAnalogHandsView *)self minuteHandConfiguration];
  uint64_t v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "handViewClass")), "initWithConfiguration:forDevice:maskedShadow:", v3, self->_device, 1);
  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setColor:v5];

  [v4 anchorPointFromConfiguration];
  double v7 = v6;
  double v9 = v8;
  double v10 = [v4 layer];
  objc_msgSend(v10, "setAnchorPoint:", v7, v9);

  return v4;
}

- (id)createSecondHandView
{
  double v3 = [(CLKUIAnalogHandsView *)self secondHandConfiguration];
  uint64_t v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "handViewClass")), "initWithConfiguration:forDevice:maskedShadow:", v3, self->_device, 0);
  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setColor:v5];

  [v4 anchorPointFromConfiguration];
  double v7 = v6;
  double v9 = v8;
  double v10 = [v4 layer];
  objc_msgSend(v10, "setAnchorPoint:", v7, v9);

  return v4;
}

- (BOOL)useDirectionalShadows
{
  return 1;
}

- (double)_timeAnimationFramesPerSecondForDevice:(id)a3
{
  return (double)CLKUIAnalogHandsDefaultPreferredFramesPerSecondForDevice();
}

- (void)_startNewTimeAnimation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([(CLKUIAnalogHandsView *)self _canRunTimeAnimation])
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v35 = 0;
    double v3 = [(CLKUIAnalogHandsView *)self displayTime];
    CLKHourMinuteSecondAnglesForTime();

    uint64_t v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation"];
    LODWORD(v5) = 2139095040;
    [v4 setRepeatCount:v5];
    double v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v4 setTimingFunction:v6];

    [(CLKUIAnalogHandsView *)self _timeAnimationFramesPerSecondForDevice:self->_device];
    double v8 = v7;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke;
    aBlock[3] = &unk_1E697C170;
    uint64_t v33 = 0x401921FB54442D18;
    double v9 = 1.0 / v7;
    id v10 = v4;
    double v34 = v9;
    id v31 = v10;
    id v32 = self;
    id v11 = _Block_copy(aBlock);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_2;
    v27[3] = &unk_1E697C198;
    id v12 = v11;
    id v28 = v12;
    uint64_t v29 = v37;
    [(CLKUIAnalogHandsView *)self _enumerateHourHandViewsWithBlock:v27];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_3;
    v24[3] = &unk_1E697C198;
    id v13 = v12;
    id v25 = v13;
    uint64_t v26 = v36;
    [(CLKUIAnalogHandsView *)self _enumerateMinuteHandViewsWithBlock:v24];
    if (!self->_secondHandDisabled)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_4;
      v21[3] = &unk_1E697C198;
      id v22 = v13;
      uint64_t v23 = v35;
      [(CLKUIAnalogHandsView *)self _enumerateSecondHandViewsWithBlock:v21];
    }
    long long v14 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__startNewTimeAnimation selector:0 userInfo:0 repeats:10.0];
    animationUpdateTimer = self->_animationUpdateTimer;
    self->_animationUpdateTimer = v14;

    kdebug_trace();
    uint64_t v16 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = [(NSCalendar *)self->_calendar timeZone];
      v20 = [v19 name];
      *(_DWORD *)buf = 138412802;
      v39 = v18;
      __int16 v40 = 2048;
      double v41 = v8;
      __int16 v42 = 2112;
      v43 = v20;
      _os_log_impl(&dword_1D3174000, v16, OS_LOG_TYPE_DEFAULT, "%@ started new time animation at %.0fFPS (for the second hand) for timezone: %@", buf, 0x20u);
    }
  }
}

void __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, double a5)
{
  double v7 = a4;
  if (a4 < 0.0) {
    double v7 = *(double *)(a1 + 48) + a4;
  }
  id v9 = a2;
  [v9 setZRotation:v7];
  id v10 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v10 setByValue:v11];

  [*(id *)(a1 + 32) setDuration:a5];
  [*(id *)(a1 + 32) setFrameInterval:*(double *)(a1 + 56) * a5 / 60.0];
  [*(id *)(a1 + 32) setDiscretizesTime:a3];
  id v12 = [v9 layer];
  [v12 addAnimation:*(void *)(a1 + 32) forKey:@"time"];

  id v13 = [v9 shadowView];
  long long v14 = [v13 layer];
  [v14 addAnimation:*(void *)(a1 + 32) forKey:@"time"];

  id v16 = [*(id *)(a1 + 40) delegate];
  v15 = (void *)[*(id *)(a1 + 32) copy];
  [v16 nominalAnimationStart:v15 forHandView:v9];
}

uint64_t __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, 1, *(double *)(a1 + 40), 43200.0);
}

uint64_t __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, 1, *(double *)(a1 + 40), 3600.0);
}

uint64_t __46__CLKUIAnalogHandsView__startNewTimeAnimation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, 0, *(double *)(a1 + 40), 60.0);
}

- (void)_stopTimeAnimation
{
  if (self->_animationUpdateTimer)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__CLKUIAnalogHandsView__stopTimeAnimation__block_invoke;
    v4[3] = &unk_1E697C0B0;
    v4[4] = self;
    [(CLKUIAnalogHandsView *)self _enumerateHandViews:v4];
    [(CLKUIAnalogHandsView *)self _enumerateShadowViews:&__block_literal_global_27];
    [(NSTimer *)self->_animationUpdateTimer invalidate];
    animationUpdateTimer = self->_animationUpdateTimer;
    self->_animationUpdateTimer = 0;

    kdebug_trace();
  }
}

void __42__CLKUIAnalogHandsView__stopTimeAnimation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 layer];
  double v5 = [v4 animationForKey:@"time"];

  if (v5)
  {
    double v6 = [v4 presentationLayer];
    double v7 = v6;
    if (v6)
    {
      [v6 transform];
      [v4 setTransform:&v9];
    }
    [v4 removeAnimationForKey:@"time"];
  }
  double v8 = [*(id *)(a1 + 32) delegate];
  [v8 nominalAnimationEndForHandView:v3];
}

void __42__CLKUIAnalogHandsView__stopTimeAnimation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 layer];
  id v2 = [v3 animationForKey:@"time"];

  if (v2) {
    [v3 removeAnimationForKey:@"time"];
  }
}

- (BOOL)_canRunTimeAnimation
{
  if (self->_frozen) {
    return 0;
  }
  id v3 = [(CLKUIAnalogHandsView *)self window];
  BOOL v2 = v3 != 0;

  return v2;
}

- (void)setFrozen:(BOOL)a3
{
  if (self->_frozen != a3)
  {
    self->_frozen = a3;
    if (a3) {
      [(CLKUIAnalogHandsView *)self _stopTimeAnimation];
    }
    else {
      [(CLKUIAnalogHandsView *)self _startNewTimeAnimation];
    }
  }
}

- (void)setSecondHandDisabled:(BOOL)a3
{
  if (self->_secondHandDisabled != a3)
  {
    self->_secondHandDisabled = a3;
    -[CLKUIHandView setHidden:](self->_secondHandView, "setHidden:");
  }
}

- (void)applyHourMinuteHandsStrokeColor:(id)a3 fillColor:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  double v7 = [(CLKUIAnalogHandsView *)self minuteHandView];
  [v7 setColor:v6];

  double v8 = [(CLKUIAnalogHandsView *)self hourHandView];
  [v8 setColor:v6];

  [(CLKUIAnalogHandsView *)self setInlayColor:v9];
}

- (void)applySecondHandColor:(id)a3
{
}

- (void)setInlayColor:(id)a3
{
  objc_storeStrong((id *)&self->_inlayColor, a3);
  id v5 = a3;
  [(CLKUIHandView *)self->_hourHandView setInlayColor:v5];
  [(CLKUIHandView *)self->_minuteHandView setInlayColor:v5];
  id v6 = [(CLKUIAnalogHandsView *)self minuteHandView];
  [v6 setHandDotColor:v5];
}

- (void)setUseDirectionalShadows:(BOOL)a3
{
  if (self->_useDirectionalShadows != a3)
  {
    self->_useDirectionalShadows = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke;
    v5[3] = &__block_descriptor_33_e23_v16__0__CLKUIHandView_8l;
    BOOL v6 = a3;
    [(CLKUIAnalogHandsView *)self _enumerateHandViews:v5];
    if (self->_useDirectionalShadows)
    {
      [(CLKUIAnalogHandsView *)self _enumerateShadowViews:&__block_literal_global_29];
    }
    else
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke_3;
      v4[3] = &unk_1E697C0D8;
      v4[4] = self;
      [(CLKUIAnalogHandsView *)self _enumerateShadowViews:v4];
      [(CLKUIAnalogHandsView *)self layoutShadowViews];
    }
  }
}

uint64_t __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDropShadowsHidden:*(unsigned char *)(a1 + 32) == 0];
}

uint64_t __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

uint64_t __49__CLKUIAnalogHandsView_setUseDirectionalShadows___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) addSubview:a2];
}

- (id)displayTime
{
  return (id)[MEMORY[0x1E4F196B0] now];
}

- (UIView)directionalShadowContainerView
{
  return self->_directionalShadowContainerView;
}

- (void)setTimeZone:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(NSTimeZone *)self->_timeZone isEqualToTimeZone:v5])
  {
    BOOL v6 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      id v9 = [(NSCalendar *)self->_calendar timeZone];
      id v10 = [v9 name];
      int v16 = 138412546;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D3174000, v6, OS_LOG_TYPE_DEFAULT, "%@ received manual timezone update with current timezone: %@", (uint8_t *)&v16, 0x16u);
    }
    objc_storeStrong((id *)&self->_timeZone, a3);
    [(NSCalendar *)self->_calendar setTimeZone:v5];
    id v11 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      long long v14 = [(NSCalendar *)self->_calendar timeZone];
      v15 = [v14 name];
      int v16 = 138412546;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1D3174000, v11, OS_LOG_TYPE_DEFAULT, "%@ did set new timezone after manual timezone update to: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)_enumerateSecondHandViewsWithBlock:(id)a3
{
}

- (void)_enumerateMinuteHandViewsWithBlock:(id)a3
{
}

- (void)_enumerateHourHandViewsWithBlock:(id)a3
{
}

- (UIView)secondHandDot
{
  id v3 = [(CLKUIHandView *)self->_secondHandView handDotView];

  if (!v3)
  {
    secondHandView = self->_secondHandView;
    [(CLKUIAnalogHandsView *)self secondHandDotDiameter];
    -[CLKUIHandView setupHandDotViewWithDiameter:](secondHandView, "setupHandDotViewWithDiameter:");
  }
  id v5 = self->_secondHandView;
  return [(CLKUIHandView *)v5 handDotView];
}

- (void)setSecondHandDotDiameter:(double)a3
{
  if (self->_secondHandDotDiameter != a3)
  {
    self->_secondHandDotDiameter = a3;
    secondHandView = self->_secondHandView;
    [(CLKUIAnalogHandsView *)self secondHandDotDiameter];
    -[CLKUIHandView setupHandDotViewWithDiameter:](secondHandView, "setupHandDotViewWithDiameter:");
  }
}

- (UIView)minuteHandDot
{
  id v3 = [(CLKUIHandView *)self->_minuteHandView handDotView];

  if (!v3)
  {
    minuteHandView = self->_minuteHandView;
    [(CLKUIAnalogHandsView *)self minuteHandDotDiameter];
    -[CLKUIHandView setupHandDotViewWithDiameter:](minuteHandView, "setupHandDotViewWithDiameter:");
    [(CLKUIHandView *)self->_minuteHandView setHandDotColor:self->_inlayColor];
  }
  id v5 = self->_minuteHandView;
  return [(CLKUIHandView *)v5 handDotView];
}

- (void)setMinuteHandDotDiameter:(double)a3
{
  if (self->_minuteHandDotDiameter != a3)
  {
    self->_minuteHandDotDiameter = a3;
    minuteHandView = self->_minuteHandView;
    [(CLKUIAnalogHandsView *)self minuteHandDotDiameter];
    -[CLKUIHandView setupHandDotViewWithDiameter:](minuteHandView, "setupHandDotViewWithDiameter:");
  }
}

- (void)_significantTimeChanged
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  uint64_t v4 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    double v7 = [(NSCalendar *)self->_calendar timeZone];
    double v8 = [v7 name];
    int v14 = 138412546;
    v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1D3174000, v4, OS_LOG_TYPE_DEFAULT, "%@ received significant time change with current timezone: %@", (uint8_t *)&v14, 0x16u);
  }
  if (!self->_timeZone) {
    [(NSCalendar *)self->_calendar setTimeZone:v3];
  }
  id v9 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = [(NSCalendar *)self->_calendar timeZone];
    id v13 = [v12 name];
    int v14 = 138412546;
    v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1D3174000, v9, OS_LOG_TYPE_DEFAULT, "%@ did set new timezone after significant time change to: %@", (uint8_t *)&v14, 0x16u);
  }
}

+ (double)hourHandAngleForDate:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  BOOL v6 = [v5 components:224 fromDate:v4];

  [v6 hour];
  [v6 minute];
  CLKNormalizeAngle();
  double v8 = v7;

  return v8;
}

+ (double)minuteHandAngleForDate:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  BOOL v6 = [v5 components:224 fromDate:v4];

  uint64_t v7 = [v6 minute];
  double v8 = ((double)[v6 second] / 60.0 + (double)v7) * 6.0;

  return v8;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)isSecondHandDisabled
{
  return self->_secondHandDisabled;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (CLKUIHandView)hourHandView
{
  return self->_hourHandView;
}

- (void)setHourHandView:(id)a3
{
}

- (CLKUIHandView)minuteHandView
{
  return self->_minuteHandView;
}

- (void)setMinuteHandView:(id)a3
{
}

- (CLKUIHandView)secondHandView
{
  return self->_secondHandView;
}

- (void)setSecondHandView:(id)a3
{
}

- (double)secondHandDotDiameter
{
  return self->_secondHandDotDiameter;
}

- (double)minuteHandDotDiameter
{
  return self->_minuteHandDotDiameter;
}

- (UIColor)inlayColor
{
  return self->_inlayColor;
}

- (CLKUIAnalogHandsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLKUIAnalogHandsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inlayColor, 0);
  objc_storeStrong((id *)&self->_secondHandView, 0);
  objc_storeStrong((id *)&self->_minuteHandView, 0);
  objc_storeStrong((id *)&self->_hourHandView, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_directionalShadowContainerView, 0);
  objc_storeStrong((id *)&self->_animationUpdateTimer, 0);
}

@end