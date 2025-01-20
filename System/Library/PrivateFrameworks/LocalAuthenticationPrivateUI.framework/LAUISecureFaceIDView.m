@interface LAUISecureFaceIDView
+ (id)_transitionDictForFullFlow;
+ (id)_transitionDictForProtectedAppsFlow;
- (BOOL)_canTransitionViewToState:(int64_t)a3;
- (BOOL)_transitionViewToState:(int64_t)a3;
- (CASecureFlipBookLayer)secureFlipBookLayer;
- (LAUISecureFaceIDView)init;
- (LAUISecureFaceIDView)initWithType:(int64_t)a3;
- (NSNumber)remainingMinDisplayTimeInterval;
- (id)_caStateNameForState:(int64_t)a3;
- (id)_descriptionOfState:(int64_t)a3;
- (id)_flipbookFromLAUISecureFaceIDViewType:(int64_t)a3;
- (id)_shortNameForState:(int64_t)a3;
- (id)_transitionDict;
- (id)description;
- (int64_t)_nextStateForUnwantedTransitionFrom:(int64_t)a3 to:(int64_t)a4;
- (int64_t)_nextStateOnShortestPathFrom:(int64_t)a3 to:(int64_t)a4;
- (int64_t)state;
- (void)_disableDisplayLink;
- (void)_enableDisplayLink;
- (void)_setupView;
- (void)_tick;
- (void)_tickWithInterval:(double)a3 frequency:(int)a4;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setState:(int64_t)a3;
@end

@implementation LAUISecureFaceIDView

- (LAUISecureFaceIDView)init
{
  return [(LAUISecureFaceIDView *)self initWithType:0];
}

- (LAUISecureFaceIDView)initWithType:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __37__LAUISecureFaceIDView_initWithType___block_invoke;
  v21 = &__block_descriptor_40_e36__CGRect__CGPoint_dd__CGSize_dd__8__0l;
  int64_t v22 = a3;
  if (!a3)
  {
    double v4 = 78.0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    double v4 = 36.0;
LABEL_5:
    double v5 = v4;
    goto LABEL_7;
  }
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
LABEL_7:
  v17.receiver = self;
  v17.super_class = (Class)LAUISecureFaceIDView;
  v6 = -[LAUISecureFaceIDView initWithFrame:](&v17, sel_initWithFrame_, 0.0, 0.0, v4, v5);
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(LAUISecureFaceIDView *)v6 _flipbookFromLAUISecureFaceIDViewType:a3];
    secureFlipBookLayer = v7->_secureFlipBookLayer;
    v7->_secureFlipBookLayer = (CASecureFlipBookLayer *)v8;

    v10 = LACLogFaceIDUI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(CASecureFlipBookLayer *)v7->_secureFlipBookLayer states];
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_impl(&dword_214463000, v10, OS_LOG_TYPE_DEFAULT, "States: %@", buf, 0xCu);
    }
    v12 = v7->_secureFlipBookLayer;
    if (!v12)
    {
      v15 = 0;
      goto LABEL_16;
    }
    -[CASecureFlipBookLayer setFrame:](v12, "setFrame:", 0.0, 0.0, v4, v5);
    v7->_type = a3;
    v7->_nextStateOnPathToDesiredState = 0x7FFFFFFFFFFFFFFFLL;
    v7->_desiredState = 0x7FFFFFFFFFFFFFFFLL;
    v7->_state = 0x7FFFFFFFFFFFFFFFLL;
    [(LAUISecureFaceIDView *)v7 _setupView];
  }
  v13 = LACLogFaceIDUI();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(CASecureFlipBookLayer *)v7->_secureFlipBookLayer currentState];
    *(_DWORD *)buf = 138412546;
    v24 = v7;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_214463000, v13, OS_LOG_TYPE_DEFAULT, "Created %@, currentState: %@", buf, 0x16u);
  }
  v15 = v7;
LABEL_16:

  return v15;
}

double __37__LAUISecureFaceIDView_initWithType___block_invoke()
{
  return 0.0;
}

- (void)dealloc
{
  [(LAUISecureFaceIDView *)self _disableDisplayLink];
  v3.receiver = self;
  v3.super_class = (Class)LAUISecureFaceIDView;
  [(LAUISecureFaceIDView *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  objc_super v3 = [(LAUISecureFaceIDView *)self window];

  timeAppeared = self->_timeAppeared;
  if (v3)
  {
    if (!timeAppeared)
    {
      double v5 = [MEMORY[0x263EFF910] now];
      v6 = self->_timeAppeared;
      self->_timeAppeared = v5;
    }
    [(LAUISecureFaceIDView *)self _enableDisplayLink];
  }
  else
  {
    self->_timeAppeared = 0;

    [(LAUISecureFaceIDView *)self _disableDisplayLink];
  }
}

- (void)didMoveToSuperview
{
  objc_super v3 = [(LAUISecureFaceIDView *)self superview];

  if (v3)
  {
    double v4 = [(LAUISecureFaceIDView *)self window];

    if (v4)
    {
      [(LAUISecureFaceIDView *)self _enableDisplayLink];
    }
  }
  else
  {
    [(LAUISecureFaceIDView *)self _disableDisplayLink];
  }
}

- (id)description
{
  objc_super v3 = [(LAUISecureFaceIDView *)self _descriptionOfState:self->_state];
  if (self->_state != self->_desiredState)
  {
    double v4 = -[LAUISecureFaceIDView _descriptionOfState:](self, "_descriptionOfState:");
    int64_t nextStateOnPathToDesiredState = self->_nextStateOnPathToDesiredState;
    if (self->_desiredState != nextStateOnPathToDesiredState && nextStateOnPathToDesiredState != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = NSString;
      uint64_t v8 = -[LAUISecureFaceIDView _descriptionOfState:](self, "_descriptionOfState:");
      uint64_t v9 = [v7 stringWithFormat:@"%@ (via %@)", v4, v8];

      double v4 = (void *)v9;
    }
    uint64_t v10 = [NSString stringWithFormat:@"%@ -> %@", v3, v4];

    objc_super v3 = (void *)v10;
  }
  v11 = NSString;
  uint64_t v12 = objc_opt_class();
  v13 = [(CASecureFlipBookLayer *)self->_secureFlipBookLayer currentState];
  v14 = [v11 stringWithFormat:@"<%@ %p; flipBookState: '%@', state: '%@'>", v12, self, v13, v3];

  return v14;
}

- (id)_descriptionOfState:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v3 = 0;
  }
  else
  {
    double v5 = NSString;
    v6 = -[LAUISecureFaceIDView _shortNameForState:](self, "_shortNameForState:");
    objc_super v3 = [v5 stringWithFormat:@"%@(%d)", v6, a3];
  }
  return v3;
}

- (void)_enableDisplayLink
{
  if (!self->_displayLink)
  {
    objc_super v3 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__tick];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    double v5 = self->_displayLink;
    id v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x263EFF588]];
  }
}

- (void)_disableDisplayLink
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    double v4 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_tick
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    double v4 = displayLink;
    [(CADisplayLink *)v4 targetTimestamp];
    double v6 = v5;
    [(CADisplayLink *)v4 timestamp];
    double v8 = v6 - v7;
    [(CADisplayLink *)v4 duration];
    double v10 = v9;

    [(LAUISecureFaceIDView *)self _tickWithInterval:(int)(1.0 / v10) frequency:v8];
  }
}

- (void)_tickWithInterval:(double)a3 frequency:(int)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v6 = _tickWithInterval_frequency__counter++;
  int v7 = v6 % a4;
  if (!(v6 % a4))
  {
    double v8 = LACLogFaceIDUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[LAUISecureFaceIDView _tickWithInterval:frequency:]((uint64_t)self, v8, a3);
    }
  }
  [(CASecureFlipBookLayer *)self->_secureFlipBookLayer tick:a3];
  p_desiredState = &self->_desiredState;
  if (self->_state != self->_desiredState)
  {
    p_int64_t nextStateOnPathToDesiredState = &self->_nextStateOnPathToDesiredState;
    if ([(LAUISecureFaceIDView *)self _canTransitionViewToState:self->_nextStateOnPathToDesiredState])
    {
      v11 = LACLogFaceIDUI();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(LAUISecureFaceIDView *)self _descriptionOfState:*p_nextStateOnPathToDesiredState];
        int v17 = 138543618;
        uint64_t v18 = self;
        __int16 v19 = 2114;
        v20 = v12;
        _os_log_impl(&dword_214463000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ now can transition to %{public}@", (uint8_t *)&v17, 0x16u);
      }
      [(LAUISecureFaceIDView *)self _transitionViewToState:*p_nextStateOnPathToDesiredState];
      *p_int64_t nextStateOnPathToDesiredState = 0x7FFFFFFFFFFFFFFFLL;
      if (![(LAUISecureFaceIDView *)self _canTransitionViewToState:*p_desiredState])
      {
        if (v7) {
          return;
        }
        goto LABEL_21;
      }
    }
    else if (v7)
    {
      if (![(LAUISecureFaceIDView *)self _canTransitionViewToState:*p_desiredState]) {
        return;
      }
    }
    else
    {
      v13 = LACLogFaceIDUI();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[LAUISecureFaceIDView _tickWithInterval:frequency:]();
      }

      if (![(LAUISecureFaceIDView *)self _canTransitionViewToState:*p_desiredState])
      {
LABEL_21:
        v16 = LACLogFaceIDUI();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[LAUISecureFaceIDView _tickWithInterval:frequency:]();
        }

        return;
      }
    }
    v14 = LACLogFaceIDUI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(LAUISecureFaceIDView *)self _descriptionOfState:*p_desiredState];
      int v17 = 138543618;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      v20 = v15;
      _os_log_impl(&dword_214463000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ now can transition to %{public}@", (uint8_t *)&v17, 0x16u);
    }
    [(LAUISecureFaceIDView *)self _transitionViewToState:*p_desiredState];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_desiredState = a3;
    -[LAUISecureFaceIDView _transitionViewToState:](self, "_transitionViewToState:");
  }
}

- (BOOL)_canTransitionViewToState:(int64_t)a3
{
  secureFlipBookLayer = self->_secureFlipBookLayer;
  double v4 = [(LAUISecureFaceIDView *)self _caStateNameForState:a3];
  LOBYTE(secureFlipBookLayer) = [(CASecureFlipBookLayer *)secureFlipBookLayer canTransitionToState:v4];

  return (char)secureFlipBookLayer;
}

- (BOOL)_transitionViewToState:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v5 = [(CASecureFlipBookLayer *)self->_secureFlipBookLayer currentState];
  int v6 = [(LAUISecureFaceIDView *)self _caStateNameForState:a3];
  char v7 = [(CASecureFlipBookLayer *)self->_secureFlipBookLayer canTransitionToState:v6];
  int64_t state = self->_state;
  int64_t desiredState = self->_desiredState;
  if (v7)
  {
    int64_t v10 = [(LAUISecureFaceIDView *)self _nextStateForUnwantedTransitionFrom:state to:desiredState];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = (uint64_t)v6;
      int64_t v12 = a3;
    }
    else
    {
      int64_t v12 = v10;
      uint64_t v11 = [(LAUISecureFaceIDView *)self _caStateNameForState:v10];
      v15 = LACLogFaceIDUI();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138544130;
        __int16 v19 = self;
        __int16 v20 = 2112;
        uint64_t v21 = v5;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v6;
        __int16 v24 = 2112;
        uint64_t v25 = v11;
        _os_log_impl(&dword_214463000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ does not want to transition from '%@' to '%@' directly, will transition to '%@' first", (uint8_t *)&v18, 0x2Au);
      }

      self->_int64_t nextStateOnPathToDesiredState = v12;
    }
    if (([(CASecureFlipBookLayer *)self->_secureFlipBookLayer transitionToState:v11] & 1) == 0)
    {
      v16 = LACLogFaceIDUI();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138543874;
        __int16 v19 = self;
        __int16 v20 = 2112;
        uint64_t v21 = v5;
        __int16 v22 = 2112;
        uint64_t v23 = v11;
        _os_log_error_impl(&dword_214463000, v16, OS_LOG_TYPE_ERROR, "%{public}@ couldn't transition from '%@' to '%@'", (uint8_t *)&v18, 0x20u);
      }
    }
    self->_int64_t state = v12;
    v13 = LACLogFaceIDUI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543874;
      __int16 v19 = self;
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_214463000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully transitioned from %@ to %@", (uint8_t *)&v18, 0x20u);
    }
    int v6 = (void *)v11;
  }
  else
  {
    self->_int64_t nextStateOnPathToDesiredState = [(LAUISecureFaceIDView *)self _nextStateOnShortestPathFrom:state to:desiredState];
    v13 = LACLogFaceIDUI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(LAUISecureFaceIDView *)self _caStateNameForState:self->_nextStateOnPathToDesiredState];
      int v18 = 138544130;
      __int16 v19 = self;
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = (uint64_t)v6;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v14;
      _os_log_impl(&dword_214463000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ can't transition from '%@' to '%@', must transition to '%@' first", (uint8_t *)&v18, 0x2Au);
    }
  }

  return v7;
}

- (int64_t)_nextStateForUnwantedTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  if (a4 == 4 && a3 == 2) {
    return 3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_nextStateOnShortestPathFrom:(int64_t)a3 to:(int64_t)a4
{
  BOOL v4 = a4 == 1 && a3 == 2;
  int64_t v5 = 3;
  if (!v4) {
    int64_t v5 = a4;
  }
  if (a4 == 3 && a3 == 1) {
    return 2;
  }
  else {
    return v5;
  }
}

- (NSNumber)remainingMinDisplayTimeInterval
{
  if (self->_timeAppeared)
  {
    objc_super v3 = [MEMORY[0x263F52468] sharedInstance];
    BOOL v4 = [v3 valueForFlagSecureUIMinDisplayTime];
    [v4 doubleValue];
    double v6 = v5;

    [(NSDate *)self->_timeAppeared timeIntervalSinceNow];
    double v8 = fmax(v6, 1.1) + v7;
    if (v8 < 0.0) {
      double v8 = 0.0;
    }
    double v9 = [NSNumber numberWithDouble:v8];
  }
  else
  {
    double v9 = 0;
  }
  return (NSNumber *)v9;
}

- (void)_setupView
{
  v12[2] = *MEMORY[0x263EF8340];
  [(LAUISecureFaceIDView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  int64_t type = self->_type;
  if (type)
  {
    if (type != 1)
    {
      double v4 = *MEMORY[0x263F001B0];
      double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
      goto LABEL_7;
    }
    double v4 = 36.0;
  }
  else
  {
    double v4 = 78.0;
  }
  double v5 = v4;
LABEL_7:
  double v6 = (void *)MEMORY[0x263F08938];
  double v7 = [(LAUISecureFaceIDView *)self widthAnchor];
  double v8 = [v7 constraintEqualToConstant:v4];
  v12[0] = v8;
  double v9 = [(LAUISecureFaceIDView *)self heightAnchor];
  int64_t v10 = [v9 constraintEqualToConstant:v5];
  v12[1] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  [v6 activateConstraints:v11];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)LAUISecureFaceIDView;
  [(LAUISecureFaceIDView *)&v7 layoutSubviews];
  objc_super v3 = [(LAUISecureFaceIDView *)self layer];
  double v4 = [v3 sublayers];
  char v5 = [v4 containsObject:self->_secureFlipBookLayer];

  if ((v5 & 1) == 0)
  {
    double v6 = [(LAUISecureFaceIDView *)self layer];
    [v6 addSublayer:self->_secureFlipBookLayer];
  }
}

- (id)_flipbookFromLAUISecureFaceIDViewType:(int64_t)a3
{
  *(void *)&v21[5] = *MEMORY[0x263EF8340];
  if (_flipbookFromLAUISecureFaceIDViewType__onceToken != -1) {
    dispatch_once(&_flipbookFromLAUISecureFaceIDViewType__onceToken, &__block_literal_global_4);
  }
  double v4 = CASecureFlipBookLayerBaseNameFromLAUISecureFaceIDViewType(a3);
  char v5 = [NSString stringWithFormat:@"%@-%dx", v4, _flipbookFromLAUISecureFaceIDViewType__scale];
  uint64_t v6 = [MEMORY[0x263F15878] secureFlipBookWithType:v5];
  if (v6)
  {
    objc_super v7 = (void *)v6;
    double v8 = LACLogFaceIDUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v21[0] = _flipbookFromLAUISecureFaceIDViewType__scale;
      LOWORD(v21[1]) = 2112;
      *(void *)((char *)&v21[1] + 2) = v5;
      double v9 = "Found flipbook for %dx scale: %@";
      int64_t v10 = v8;
      uint32_t v11 = 18;
LABEL_9:
      _os_log_impl(&dword_214463000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  uint64_t v12 = [MEMORY[0x263F15878] secureFlipBookWithType:v4];
  if (v12)
  {
    objc_super v7 = (void *)v12;
    double v8 = LACLogFaceIDUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v21 = v4;
      double v9 = "Found flipbook: %@";
      int64_t v10 = v8;
      uint32_t v11 = 12;
      goto LABEL_9;
    }
LABEL_10:

    id v13 = v7;
    goto LABEL_11;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__LAUISecureFaceIDView__flipbookFromLAUISecureFaceIDViewType___block_invoke_30;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a3;
  v15 = __62__LAUISecureFaceIDView__flipbookFromLAUISecureFaceIDViewType___block_invoke_30((uint64_t)v19);
  id v13 = [MEMORY[0x263F15878] secureFlipBookWithType:v15];
  v16 = LACLogFaceIDUI();
  int v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v21 = v15;
      _os_log_impl(&dword_214463000, v17, OS_LOG_TYPE_DEFAULT, "Using engineering flipbook: %@", buf, 0xCu);
    }

    id v18 = v13;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[LAUISecureFaceIDView _flipbookFromLAUISecureFaceIDViewType:](v17);
    }
  }
LABEL_11:

  return v13;
}

void __62__LAUISecureFaceIDView__flipbookFromLAUISecureFaceIDViewType___block_invoke()
{
  id v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  _flipbookFromLAUISecureFaceIDViewType__scale = llround(v0);
}

__CFString *__62__LAUISecureFaceIDView__flipbookFromLAUISecureFaceIDViewType___block_invoke_30(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 == 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"faceid-36-%dx", _flipbookFromLAUISecureFaceIDViewType__scale);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v1)
  {
    v2 = 0;
  }
  else
  {
    v2 = @"FaceID";
  }
  return v2;
}

- (id)_transitionDict
{
  if (self->_type == 1
    && ([MEMORY[0x263F52548] sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 isDynamicIslandAvailable],
        v2,
        v3))
  {
    double v4 = [(id)objc_opt_class() _transitionDictForProtectedAppsFlow];
  }
  else
  {
    double v4 = [(id)objc_opt_class() _transitionDictForFullFlow];
  }
  return v4;
}

+ (id)_transitionDictForFullFlow
{
  if (_transitionDictForFullFlow_onceToken != -1) {
    dispatch_once(&_transitionDictForFullFlow_onceToken, &__block_literal_global_62);
  }
  v2 = (void *)_transitionDictForFullFlow_result;
  return v2;
}

void __50__LAUISecureFaceIDView__transitionDictForFullFlow__block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C534220;
  v2[1] = &unk_26C534238;
  v3[0] = @"Empty State";
  v3[1] = @"Idle State";
  v2[2] = &unk_26C534250;
  v2[3] = &unk_26C534268;
  v3[2] = @"Acquiring State";
  v3[3] = @"Verifying State";
  v2[4] = &unk_26C534280;
  v2[5] = &unk_26C534298;
  v3[4] = @"Matched State";
  v3[5] = @"Processing State";
  v2[6] = &unk_26C5342B0;
  v3[6] = @"Finished State";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  uint64_t v1 = (void *)_transitionDictForFullFlow_result;
  _transitionDictForFullFlow_result = v0;
}

+ (id)_transitionDictForProtectedAppsFlow
{
  if (_transitionDictForProtectedAppsFlow_onceToken != -1) {
    dispatch_once(&_transitionDictForProtectedAppsFlow_onceToken, &__block_literal_global_99);
  }
  v2 = (void *)_transitionDictForProtectedAppsFlow_result;
  return v2;
}

void __59__LAUISecureFaceIDView__transitionDictForProtectedAppsFlow__block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26C534220;
  v2[1] = &unk_26C534238;
  v3[0] = @"empty State";
  v3[1] = @"face State";
  v2[2] = &unk_26C534250;
  v2[3] = &unk_26C534268;
  v3[2] = @"faceid State";
  v3[3] = @"faceid State";
  v2[4] = &unk_26C534280;
  v2[5] = &unk_26C534298;
  v3[4] = @"checkmark State";
  v3[5] = @"checkmark State";
  v2[6] = &unk_26C5342B0;
  v3[6] = @"checkmark State";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  uint64_t v1 = (void *)_transitionDictForProtectedAppsFlow_result;
  _transitionDictForProtectedAppsFlow_result = v0;
}

- (id)_caStateNameForState:(int64_t)a3
{
  double v4 = [(LAUISecureFaceIDView *)self _transitionDict];
  char v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    double v8 = LACLogFaceIDUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LAUISecureFaceIDView _caStateNameForState:](a3, v8);
    }
  }
  return v6;
}

- (id)_shortNameForState:(int64_t)a3
{
  int v3 = [(LAUISecureFaceIDView *)self _caStateNameForState:a3];
  double v4 = [v3 stringByReplacingOccurrencesOfString:@" State" withString:&stru_26C52FC58];

  return v4;
}

- (CASecureFlipBookLayer)secureFlipBookLayer
{
  return self->_secureFlipBookLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureFlipBookLayer, 0);
  objc_storeStrong((id *)&self->_timeAppeared, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)_tickWithInterval:frequency:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_214463000, v0, v1, "%{public}@ can't transition to _desiredState: %d");
}

- (void)_tickWithInterval:frequency:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_214463000, v0, v1, "%{public}@ can't transition to _nextStateOnPathToDesiredState: %d");
}

- (void)_tickWithInterval:(double)a3 frequency:.cold.3(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_214463000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ tick:%.3f", (uint8_t *)&v3, 0x16u);
}

- (void)_flipbookFromLAUISecureFaceIDViewType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_214463000, log, OS_LOG_TYPE_FAULT, "Failed to create CASecureFlipBookLayer", v1, 2u);
}

- (void)_caStateNameForState:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214463000, a2, OS_LOG_TYPE_ERROR, "Invalid LAUISecureFaceIDViewState: %d", (uint8_t *)v2, 8u);
}

@end