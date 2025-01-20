@interface FIUIDeepBreathingFlowerView
- (CGPoint)_originalRingCenterForWindType:(int64_t)a3;
- (FIUIDeepBreathingFlowerView)initWithFrame:(CGRect)a3 congratulationsText:(id)a4;
- (FIUIDeepBreathingFlowerView)initWithFrame:(CGRect)a3 petalColor:(int64_t)a4 congratulationsText:(id)a5;
- (double)_curveEaseInValue:(double)a3;
- (double)_petalCountForMinutesRemaining:(double)a3;
- (float)_interpolateWithKeyFrames:(id)a3 keyValues:(id)a4 value:(float)a5;
- (id)_currentPetalRing;
- (id)_petalRingWithNumberOfShaderPetals:(int64_t)a3 showBlurTrails:(BOOL)a4;
- (void)_createCongratulationsLabelIfNeeded;
- (void)_ppt_setPetalCountOverride:(int64_t)a3;
- (void)_preloadPetalRings;
- (void)_setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4;
- (void)_setState:(int64_t)a3;
- (void)_setWindFraction:(double)a3 smallRadius:(double)a4 largeRadius:(double)a5 windType:(int64_t)a6 showBlurTrails:(BOOL)a7;
- (void)_updateForBreathWithPetalCount:(int64_t)a3 petalRadius:(double)a4 inhaleDuration:(double)a5 exhaleDuration:(double)a6 timeInCurrentBreath:(double)a7 showBlurTrails:(BOOL)a8 shouldSpin:(BOOL)a9;
- (void)_updateForCongratulationsWithTimeInState:(double)a3 fractionComplete:(double)a4;
- (void)_updateForGuidingWithTimeInState:(double)a3;
- (void)_updateForOnRampWithTimeInState:(double)a3;
- (void)_updateForShrinkToOnRampWithFractionComplete:(double)a3;
- (void)_updateForUnwindToCompletedWithFractionComplete:(double)a3;
- (void)_updateForWindToConfigurationWithFractionComplete:(double)a3;
- (void)_updatePetalsInRange:(_NSRange)a3 radius:(double)a4 radialDistance:(double)a5 angleOffset:(double)a6 clockwise:(BOOL)a7 alpha:(float)a8;
- (void)_updateShaderForNumberOfPetals:(int64_t)a3 showBlurTrails:(BOOL)a4;
- (void)petalRingViewDisplayLinkDidFire:(id)a3;
- (void)setNumberOfConfigurationPetals:(double)a3;
- (void)setWelcomeWindFraction:(double)a3;
- (void)startGuidingAtDate:(id)a3 breathsPerMinute:(double)a4;
- (void)startOnRampAtDate:(id)a3 sessionDuration:(double)a4;
- (void)transitionToCompletedWithDuration:(double)a3;
- (void)transitionToConfigurationAnimated:(BOOL)a3;
- (void)transitionToCongratulations;
@end

@implementation FIUIDeepBreathingFlowerView

- (FIUIDeepBreathingFlowerView)initWithFrame:(CGRect)a3 petalColor:(int64_t)a4 congratulationsText:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FIUIDeepBreathingFlowerView;
  v13 = -[FIUIDeepBreathingFlowerView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_petalColor = a4;
    v15 = [(FIUIDeepBreathingFlowerView *)v13 layer];
    [v15 setAllowsGroupOpacity:0];

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    petalRingsByNumberOfPetals = v14->_petalRingsByNumberOfPetals;
    v14->_petalRingsByNumberOfPetals = (NSMutableDictionary *)v16;

    [(FIUIDeepBreathingFlowerView *)v14 _preloadPetalRings];
    objc_storeStrong((id *)&v14->_congratulationsText, a5);
  }

  return v14;
}

- (FIUIDeepBreathingFlowerView)initWithFrame:(CGRect)a3 congratulationsText:(id)a4
{
  return -[FIUIDeepBreathingFlowerView initWithFrame:petalColor:congratulationsText:](self, "initWithFrame:petalColor:congratulationsText:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    self->_stateStartTime = CFAbsoluteTimeGetCurrent();
  }
}

- (id)_currentPetalRing
{
  return self->_currentPetalRing;
}

- (void)_preloadPetalRings
{
  if (FIUIDeepBreathingShouldOptimizePetalCount())
  {
    id v3 = [(FIUIDeepBreathingFlowerView *)self _petalRingWithNumberOfShaderPetals:6 showBlurTrails:0];
    id v4 = [(FIUIDeepBreathingFlowerView *)self _petalRingWithNumberOfShaderPetals:10 showBlurTrails:0];
    for (uint64_t i = 1; i != 6; ++i)
    {
      if (((uint64_t)FIUIDeepBreathingPetalCountForMinutesRemaining((double)i) & 1) == 0) {
        id v6 = -[FIUIDeepBreathingFlowerView _petalRingWithNumberOfShaderPetals:showBlurTrails:](self, "_petalRingWithNumberOfShaderPetals:showBlurTrails:");
      }
    }
  }
  [(FIUIDeepBreathingFlowerView *)self _updateShaderForNumberOfPetals:10 showBlurTrails:0];
  [(FIUIDeepBreathingFlowerView *)self _setNumberOfVisiblePetals:10 showBlurTrails:0];
}

- (id)_petalRingWithNumberOfShaderPetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = 100;
  if (!a4) {
    uint64_t v7 = 0;
  }
  v8 = [NSNumber numberWithInteger:v7 + a3];
  v9 = [(NSMutableDictionary *)self->_petalRingsByNumberOfPetals objectForKeyedSubscript:v8];
  if (!v9)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x263F098F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSNumber;
      id v12 = v10;
      v13 = [v11 numberWithInteger:a3];
      v14 = [NSNumber numberWithBool:v4];
      int v27 = 138412546;
      v28 = v13;
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_21E433000, v12, OS_LOG_TYPE_DEFAULT, "creating petal ring with %@ petals (blur trails = %@)", (uint8_t *)&v27, 0x16u);
    }
    v15 = [FIUIBreathingPetalRingMetalView alloc];
    [(FIUIDeepBreathingFlowerView *)self bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    int64_t petalColor = self->_petalColor;
    if (_defaultMetalDevice_onceToken != -1) {
      dispatch_once(&_defaultMetalDevice_onceToken, &__block_literal_global_408);
    }
    v9 = -[FIUIBreathingPetalRingMetalView initWithFrame:petalColor:numberOfPetals:showBlurTrails:device:](v15, "initWithFrame:petalColor:numberOfPetals:showBlurTrails:device:", petalColor, a3, v4, _defaultMetalDevice_metalDevice, v17, v19, v21, v23);
    if (FIUIDeepBreathingShouldOptimizePetalCount())
    {
      LODWORD(v25) = 30.0;
      [(FIUIBreathingPetalRingMetalView *)v9 setPreferredFramesPerSecond:v25];
    }
    [(FIUIBreathingPetalRingMetalView *)v9 setPetalRingDelegate:self];
    [(NSMutableDictionary *)self->_petalRingsByNumberOfPetals setObject:v9 forKeyedSubscript:v8];
  }

  return v9;
}

- (void)_setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  v17[3] = *MEMORY[0x263EF8340];
  if (self->_numberOfVisiblePetals != a3 || self->_showBlurTrails != a4)
  {
    self->_numberOfVisiblePetals = a3;
    self->_showBlurTrails = a4;
    BOOL v15 = a4;
    if (a4)
    {
      v5 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
      trailAlphaKeyFrames = self->_trailAlphaKeyFrames;
      self->_trailAlphaKeyFrames = v5;

      uint64_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
      trailAlphaKeyValues = self->_trailAlphaKeyValues;
      self->_trailAlphaKeyValues = v7;

      if (self->_numberOfVisiblePetals >= 1)
      {
        int64_t v9 = 0;
        do
        {
          v10 = self->_trailAlphaKeyFrames;
          v17[0] = &unk_26CF75208;
          v11 = objc_msgSend(NSNumber, "numberWithDouble:", (double)FIUIRandomInteger(59, 95) / 306.0);
          v17[1] = v11;
          id v12 = objc_msgSend(NSNumber, "numberWithDouble:", (double)FIUIRandomInteger(154, 267) / 306.0);
          v17[2] = v12;
          v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
          [(NSMutableArray *)v10 addObject:v13];

          [(NSMutableArray *)self->_trailAlphaKeyValues addObject:&unk_26CF746B0];
          ++v9;
        }
        while (v9 < self->_numberOfVisiblePetals);
      }
    }
    v14 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
    [v14 setNumberOfVisiblePetals:a3 showBlurTrails:v15];
  }
}

- (void)_updateShaderForNumberOfPetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  int ShouldOptimizePetalCount = FIUIDeepBreathingShouldOptimizePetalCount();
  int64_t v8 = 6;
  if (a3 > 6) {
    int64_t v8 = a3;
  }
  uint64_t v9 = (v8 & 1) + v8;
  if (ShouldOptimizePetalCount) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 10;
  }
  uint64_t v11 = ShouldOptimizePetalCount ^ 1 | v4;
  if ([(FIUIBreathingPetalRingViewDrawable *)self->_currentPetalRing numberOfPetals] != v10
    || v11 != [(FIUIBreathingPetalRingViewDrawable *)self->_currentPetalRing showBlurTrails])
  {
    _HKInitializeLogging();
    id v12 = (void *)*MEMORY[0x263F098F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSNumber;
      v14 = v12;
      BOOL v15 = [v13 numberWithInteger:a3];
      double v16 = [NSNumber numberWithBool:v11];
      int v23 = 138412546;
      v24 = v15;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_21E433000, v14, OS_LOG_TYPE_DEFAULT, "update to shader with %@ petals, showBlurTrails = %@", (uint8_t *)&v23, 0x16u);
    }
    double v17 = [(FIUIDeepBreathingFlowerView *)self _petalRingWithNumberOfShaderPetals:v10 showBlurTrails:v11];
    currentPetalRing = self->_currentPetalRing;
    self->_currentPetalRing = v17;
    double v19 = v17;
    double v20 = currentPetalRing;

    double v21 = [(FIUIBreathingPetalRingViewDrawable *)self->_currentPetalRing view];
    [(FIUIDeepBreathingFlowerView *)self insertSubview:v21 atIndex:0];

    [(FIUIBreathingPetalRingViewDrawable *)self->_currentPetalRing importDataFromPetalRing:v20];
    double v22 = [(FIUIBreathingPetalRingViewDrawable *)v20 view];

    [v22 removeFromSuperview];
  }
}

- (void)petalRingViewDisplayLinkDidFire:(id)a3
{
  double v4 = (CFAbsoluteTimeGetCurrent() - self->_stateStartTime) / (self->_stateEndTime - self->_stateStartTime);
  BOOL v5 = v4 >= 1.0;
  int64_t state = self->_state;
  BOOL v8 = state == 8 || state == 3;
  BOOL v9 = v5 && v8;
  if (v5 && v8) {
    double v4 = 1.0;
  }
  switch(state)
  {
    case 3:
      [(FIUIDeepBreathingFlowerView *)self _updateForShrinkToOnRampWithFractionComplete:v4];
      if (v9) {
        goto LABEL_20;
      }
      return;
    case 4:
      -[FIUIDeepBreathingFlowerView _updateForOnRampWithTimeInState:](self, "_updateForOnRampWithTimeInState:");
      if (v9) {
        goto LABEL_20;
      }
      return;
    case 5:
      -[FIUIDeepBreathingFlowerView _updateForGuidingWithTimeInState:](self, "_updateForGuidingWithTimeInState:");
      if (v9) {
        goto LABEL_20;
      }
      return;
    case 6:
      -[FIUIDeepBreathingFlowerView _updateForCongratulationsWithTimeInState:fractionComplete:](self, "_updateForCongratulationsWithTimeInState:fractionComplete:");
      if (v9) {
        goto LABEL_20;
      }
      return;
    case 7:
      [(FIUIDeepBreathingFlowerView *)self _updateForUnwindToCompletedWithFractionComplete:v4];
      goto LABEL_19;
    case 8:
      [(FIUIDeepBreathingFlowerView *)self _updateForWindToConfigurationWithFractionComplete:v4];
      if (!v9) {
        return;
      }
      goto LABEL_20;
    default:
LABEL_19:
      if (v9)
      {
LABEL_20:
        int64_t v10 = self->_state;
        if (v10 == 8) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 4 * (v10 == 3);
        }
        [(FIUIDeepBreathingFlowerView *)self _setState:v11];
      }
      return;
  }
}

- (void)setWelcomeWindFraction:(double)a3
{
  if (self->_state != 1) {
    [(FIUIDeepBreathingFlowerView *)self _setState:1];
  }
  if (a3 >= 2.22044605e-16)
  {
    double v7 = 38.75;
    double v6 = 16.0;
    BOOL v8 = self;
    double v5 = a3;
  }
  else
  {
    double v5 = 0.0;
    double v6 = 16.0;
    double v7 = 16.0;
    BOOL v8 = self;
  }
  [(FIUIDeepBreathingFlowerView *)v8 _setWindFraction:1 smallRadius:0 largeRadius:v5 windType:v6 showBlurTrails:v7];
}

- (void)transitionToConfigurationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
  LODWORD(v6) = 1078530011;
  [v5 setGradientRotationAngle:v6];

  double v7 = [(FIUIDeepBreathingFlowerView *)self superview];
  BOOL v8 = [(FIUIDeepBreathingFlowerView *)self superview];
  [v8 center];
  double v10 = v9;
  double v12 = v11;
  v13 = [(FIUIDeepBreathingFlowerView *)self superview];
  v14 = [v13 superview];
  objc_msgSend(v7, "convertPoint:fromView:", v14, v10, v12);
  double v16 = v15;

  [(FIUIDeepBreathingFlowerView *)self center];
  self->_centerVerticalOffsetBeforeTransitionToConfiguration = v16 - v17;
  if (v3)
  {
    [(FIUIDeepBreathingFlowerView *)self _setState:8];
    self->_stateEndTime = self->_stateStartTime + 0.5;
  }
  else
  {
    double v18 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
    [(FIUIDeepBreathingFlowerView *)self bounds];
    objc_msgSend(v18, "setRingCenter:", FIUIMidpointOfBounds(v19, v20, v21));

    [(FIUIDeepBreathingFlowerView *)self _setState:2];
  }
  congratulationsLabel = self->_congratulationsLabel;
  [(UILabel *)congratulationsLabel setAlpha:0.0];
}

- (void)setNumberOfConfigurationPetals:(double)a3
{
  long double v4 = FIUIRoundToNearest(a3, 0.01);
  [(FIUIDeepBreathingFlowerView *)self _updateShaderForNumberOfPetals:10 showBlurTrails:0];
  double v5 = ceil(v4);
  [(FIUIDeepBreathingFlowerView *)self _setNumberOfVisiblePetals:(uint64_t)fmin(v5, 10.0) showBlurTrails:0];
  if (self->_numberOfVisiblePetals >= 1)
  {
    double v6 = v5 + -1.0;
    double v7 = fmod(v4, 1.0);
    int64_t v8 = 0;
    do
    {
      double v9 = FIUIDeepBreathingPetalCenter(v8, 1, v4, 38.75, -0.523598776);
      double v11 = v10;
      double v12 = 1.0;
      if (v6 == (double)v8)
      {
        if (FIUIIsEqual(v4, (double)self->_numberOfVisiblePetals)) {
          double v12 = 1.0;
        }
        else {
          double v12 = v7;
        }
      }
      v13 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
      *(float *)&double v14 = v12;
      LODWORD(v15) = 1109065728;
      objc_msgSend(v13, "setPetalAtIndex:center:radius:alpha:", v8, v9, v11, v15, v14);

      ++v8;
    }
    while (v8 < self->_numberOfVisiblePetals);
  }
  id v17 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
  LODWORD(v16) = 1117454336;
  [v17 setRingRadius:v16];
}

- (void)startOnRampAtDate:(id)a3 sessionDuration:(double)a4
{
  self->_sessionDuration = a4;
  [a3 timeIntervalSinceReferenceDate];
  self->_stateEndTime = v5;
  [(FIUIDeepBreathingFlowerView *)self _createCongratulationsLabelIfNeeded];
  [(FIUIDeepBreathingFlowerView *)self _setState:3];
}

- (void)_updateForShrinkToOnRampWithFractionComplete:(double)a3
{
  LODWORD(v3) = 1.0;
  -[FIUIDeepBreathingFlowerView _updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:](self, "_updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:", 0, self->_numberOfVisiblePetals, 1, a3 * -26.25 + 38.75, a3 * -38.75 + 38.75, -0.523598776, v3);
}

- (void)_updateForOnRampWithTimeInState:(double)a3
{
  double v5 = (double)FIUIDeepBreathingOnRampNumberOfBreaths();
  double v6 = fmin(fmax(a3, 0.0), FIUIDeepBreathingOnRampFullBreathDuration() * v5);
  [(FIUIDeepBreathingFlowerView *)self _petalCountForMinutesRemaining:ceil(self->_sessionDuration / 60.0)];
  uint64_t v8 = (uint64_t)v7;
  double v9 = FIUIDeepBreathingOnRampInhaleDuration();
  double v10 = FIUIDeepBreathingOnRampExhaleDuration();
  double v11 = v6 - floor(v6 / (v9 + v10)) * (v9 + v10);
  [(FIUIDeepBreathingFlowerView *)self _updateForBreathWithPetalCount:v8 petalRadius:0 inhaleDuration:1 exhaleDuration:16.0 timeInCurrentBreath:v9 showBlurTrails:v10 shouldSpin:v11];
}

- (void)startGuidingAtDate:(id)a3 breathsPerMinute:(double)a4
{
  self->_breathsPerMinute = a4;
  [(FIUIDeepBreathingFlowerView *)self _setState:5];
}

- (void)_updateForGuidingWithTimeInState:(double)a3
{
  double sessionDuration = self->_sessionDuration;
  double v5 = fmin(fmax(a3, 0.0), sessionDuration);
  [(FIUIDeepBreathingFlowerView *)self _petalCountForMinutesRemaining:ceil((sessionDuration - v5) / 60.0)];
  uint64_t v7 = (uint64_t)v6;
  double v8 = FIUIDeepBreathingInhaleDuration(self->_breathsPerMinute);
  double v9 = FIUIDeepBreathingExhaleDuration(self->_breathsPerMinute);
  BOOL v10 = v5 - floor(v5 / (v8 + v9)) * (v8 + v9) > v8;
  -[FIUIDeepBreathingFlowerView _updateForBreathWithPetalCount:petalRadius:inhaleDuration:exhaleDuration:timeInCurrentBreath:showBlurTrails:shouldSpin:](self, "_updateForBreathWithPetalCount:petalRadius:inhaleDuration:exhaleDuration:timeInCurrentBreath:showBlurTrails:shouldSpin:", v7, v10, 1, 38.75, v8, v9);
}

- (void)transitionToCongratulations
{
  self->_stateEndTime = self->_stateStartTime + 2.0;
}

- (void)_updateForCongratulationsWithTimeInState:(double)a3 fractionComplete:(double)a4
{
  double v5 = fmin(fmax(a3, 0.0), self->_stateEndTime - self->_stateStartTime);
  [(UILabel *)self->_congratulationsLabel setAlpha:a4];
  double v6 = self->_stateEndTime - self->_stateStartTime;
  [(FIUIDeepBreathingFlowerView *)self _updateForBreathWithPetalCount:6 petalRadius:0 inhaleDuration:0 exhaleDuration:24.0 timeInCurrentBreath:v6 showBlurTrails:0.0 shouldSpin:v5];
}

- (void)_createCongratulationsLabelIfNeeded
{
  if (!self->_congratulationsLabel)
  {
    [(FIUIDeepBreathingFlowerView *)self frame];
    double v4 = v3;
    double v6 = v5;
    double v9 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v3, v5);
    congratulationsLabel = self->_congratulationsLabel;
    self->_congratulationsLabel = v9;

    double v11 = self->_congratulationsLabel;
    double v12 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v11 setBackgroundColor:v12];

    v13 = self->_congratulationsLabel;
    double v14 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
    [(UILabel *)v13 setFont:v14];

    double v15 = self->_congratulationsLabel;
    double v16 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)self->_congratulationsLabel setTextAlignment:1];
    [(UILabel *)self->_congratulationsLabel setText:self->_congratulationsText];
    [(UILabel *)self->_congratulationsLabel setNumberOfLines:0];
    [(UILabel *)self->_congratulationsLabel setAlpha:0.0];
    [(FIUIDeepBreathingFlowerView *)self addSubview:self->_congratulationsLabel];
    [(UILabel *)self->_congratulationsLabel sizeToFit];
    [(UILabel *)self->_congratulationsLabel frame];
    double v18 = v17;
    [(UILabel *)self->_congratulationsLabel _lastLineBaseline];
    -[UILabel setFrame:](self->_congratulationsLabel, "setFrame:", 0.0, v6 + -20.0 - v19, v4, v18);
    double v20 = self->_congratulationsLabel;
    [(UILabel *)v20 _setLastLineBaselineFrameOriginY:v6 + -19.5];
  }
}

- (void)transitionToCompletedWithDuration:(double)a3
{
  self->_stateEndTime = self->_stateStartTime + a3;
}

- (CGPoint)_originalRingCenterForWindType:(int64_t)a3
{
  [(FIUIDeepBreathingFlowerView *)self bounds];
  double Height = CGRectGetHeight(v16);
  [(FIUIDeepBreathingFlowerView *)self bounds];
  double Width = CGRectGetWidth(v17);
  if (a3)
  {
    if (a3 == 1)
    {
      [(FIUIDeepBreathingFlowerView *)self bounds];
      double v10 = FIUIMidpointOfBounds(v11, v12, v13);
      double v8 = Height + -7.0 + -55.0;
      goto LABEL_11;
    }
    if (a3 != 2)
    {
      double v10 = *MEMORY[0x263F00148];
      double v8 = *(double *)(MEMORY[0x263F00148] + 8);
      goto LABEL_11;
    }
    double v7 = self->_centerVerticalOffsetBeforeTransitionToConfiguration + -14.0;
  }
  else
  {
    double v7 = -14.0;
  }
  double v8 = Height + v7 + -40.0;
  BOOL IsRightToLeft = FIUILocaleIsRightToLeft();
  double v10 = Width + -44.0;
  if (!IsRightToLeft) {
    double v10 = 44.0;
  }
LABEL_11:
  double v14 = v8;
  result.double y = v14;
  result.double x = v10;
  return result;
}

- (void)_updateForUnwindToCompletedWithFractionComplete:(double)a3
{
  [(UILabel *)self->_congratulationsLabel setAlpha:fmin(fmax(a3 * -2.0 + 1.0, 0.0), 1.0)];
  [(FIUIDeepBreathingFlowerView *)self _setWindFraction:0 smallRadius:1 largeRadius:1.0 - a3 windType:8.0 showBlurTrails:24.0];
}

- (void)_updateForWindToConfigurationWithFractionComplete:(double)a3
{
}

- (double)_curveEaseInValue:(double)a3
{
  double v3 = a3;
  if (_curveEaseInValue__onceToken != -1) {
    dispatch_once(&_curveEaseInValue__onceToken, &__block_literal_global_1);
  }
  *(float *)&a3 = v3;
  [(id)_curveEaseInValue____timingFunction _solveForInput:a3];
  return v4;
}

uint64_t __49__FIUIDeepBreathingFlowerView__curveEaseInValue___block_invoke()
{
  _curveEaseInValue____timingFunction = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
  return MEMORY[0x270F9A758]();
}

- (void)_setWindFraction:(double)a3 smallRadius:(double)a4 largeRadius:(double)a5 windType:(int64_t)a6 showBlurTrails:(BOOL)a7
{
  BOOL v7 = a7;
  double v12 = fmin(fmax(a3, 0.0), 1.0);
  [(FIUIDeepBreathingFlowerView *)self _curveEaseInValue:v12];
  double v14 = v13;
  if (a6)
  {
    double v15 = v13 * -2.0943951 + 1.57079633;
    [(FIUIDeepBreathingFlowerView *)self _curveEaseInValue:v12];
    double v17 = v16;
    if ((unint64_t)a6 <= 2)
    {
      uint64_t v18 = FIUIDeepBreathingSessionMinutesDefault();
      uint64_t v19 = (uint64_t)FIUIDeepBreathingPetalCountForMinutesRemaining((double)v18);
      goto LABEL_9;
    }
  }
  else
  {
    double v15 = v12 * -2.0943951 + 1.57079633;
    if (v12 <= 1.0 - 0.33) {
      double v12 = v12 / (1.0 - 0.33);
    }
    else {
      double v12 = 1.0;
    }
    [(FIUIDeepBreathingFlowerView *)self _curveEaseInValue:v12];
    double v17 = v20;
  }
  uint64_t v19 = 6;
LABEL_9:
  double v21 = a4 + v14 * (a5 - a4);
  float v22 = v21;
  [(FIUIDeepBreathingFlowerView *)self _updateShaderForNumberOfPetals:v19 showBlurTrails:0];
  [(FIUIDeepBreathingFlowerView *)self _setNumberOfVisiblePetals:v19 showBlurTrails:v7];
  [(FIUIDeepBreathingFlowerView *)self _originalRingCenterForWindType:a6];
  double v24 = v23;
  double v26 = v25;
  [(FIUIDeepBreathingFlowerView *)self bounds];
  double v30 = FIUIMidpointOfBounds(v27, v28, v29);
  if (a6 == 2) {
    double v32 = v12;
  }
  else {
    double v32 = v17;
  }
  double v33 = v24 + v32 * (v30 - v24);
  double v34 = v26 + v17 * (v31 - v26);
  v35 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
  objc_msgSend(v35, "setRingCenter:", v33, v34);

  LODWORD(v36) = 1.0;
  -[FIUIDeepBreathingFlowerView _updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:](self, "_updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:", 0, self->_numberOfVisiblePetals, 1, v22, v21, v15, v36);
  id v38 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
  double v37 = v21 + v22;
  *(float *)&double v37 = v37;
  [v38 setRingRadius:v37];
}

- (double)_petalCountForMinutesRemaining:(double)a3
{
  if (self->_petalCountOverride == 0.0) {
    return FIUIDeepBreathingPetalCountForMinutesRemaining(a3);
  }
  else {
    return self->_petalCountOverride;
  }
}

- (void)_updateForBreathWithPetalCount:(int64_t)a3 petalRadius:(double)a4 inhaleDuration:(double)a5 exhaleDuration:(double)a6 timeInCurrentBreath:(double)a7 showBlurTrails:(BOOL)a8 shouldSpin:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  double v17 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
  [(FIUIDeepBreathingFlowerView *)self bounds];
  objc_msgSend(v17, "setRingCenter:", FIUIMidpointOfBounds(v18, v19, v20));

  [(FIUIDeepBreathingFlowerView *)self _updateShaderForNumberOfPetals:a3 showBlurTrails:1];
  [(FIUIDeepBreathingFlowerView *)self _setNumberOfVisiblePetals:a3 showBlurTrails:v10];
  if (a7 <= a5)
  {
    double v21 = 1.0;
    if (a5 + -0.5 >= a7) {
      double v21 = (a5 + -0.5) * (a7 / (a5 + -0.5) * (a7 / (a5 + -0.5) * (a7 / (a5 + -0.5) * -2.0 + 3.0))) / (a5 + -0.5);
    }
  }
  else
  {
    double v21 = 0.0;
    if (a6 + -0.5 + a5 >= a7) {
      double v21 = 1.0
    }
          - (a6 + -0.5)
          * ((a7 - a5)
           / (a6 + -0.5)
           * ((a7 - a5)
            / (a6 + -0.5)
            * ((a7 - a5) / (a6 + -0.5) * -2.0 + 3.0)))
          / (a6 + -0.5);
  }
  double v22 = v21 * 0.5 + 0.5;
  double v23 = v21 * 1.57079633;
  if (!v9) {
    double v23 = -0.523598776;
  }
  double v24 = v21 * a4 + 0.0 + v21 * (a4 + -12.5) + 12.5;
  double v53 = v23;
  -[FIUIDeepBreathingFlowerView _updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:](self, "_updatePetalsInRange:radius:radialDistance:angleOffset:clockwise:alpha:", 0, self->_numberOfVisiblePetals, 0);
  if (v10)
  {
    double v54 = v21;
    if (_BlurrinessKeyFrames_onceToken != -1) {
      dispatch_once(&_BlurrinessKeyFrames_onceToken, &__block_literal_global_410);
    }
    uint64_t v25 = _BlurrinessKeyValues_onceToken;
    id v26 = (id)_BlurrinessKeyFrames___blurrinessKeyFrames;
    if (v25 != -1) {
      dispatch_once(&_BlurrinessKeyValues_onceToken, &__block_literal_global_417);
    }
    double v52 = 1.0 - v21;
    float v27 = 1.0 - v21;
    float v56 = _InterpolateWithKeyFrames(v26, (void *)_BlurrinessKeyValues___blurrinessKeyValues, v27);

    if (self->_numberOfVisiblePetals >= 1)
    {
      double v50 = a5;
      double v51 = a7;
      int64_t v28 = 0;
      double v29 = v22 * (a4 + -12.5) + 12.5;
      double v55 = v22 * a4 + 0.0;
      double v30 = v55 + v29 + v56 * 0.05;
      float v31 = v29;
      do
      {
        double v32 = -[NSMutableArray objectAtIndexedSubscript:](self->_trailAlphaKeyFrames, "objectAtIndexedSubscript:", v28, *(void *)&v50, *(void *)&v51);
        double v33 = [(NSMutableArray *)self->_trailAlphaKeyValues objectAtIndexedSubscript:v28];
        float v34 = _InterpolateWithKeyFrames(v32, v33, v27);

        if (v24 < v30 && v34 > 0.05) {
          double v24 = v30;
        }
        float v36 = v27;
        double v37 = FIUIDeepBreathingPetalCenter(v28, 0, (double)self->_numberOfVisiblePetals, v55, v53);
        double v39 = v38;
        v40 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
        double v41 = v37;
        float v27 = v36;
        *(float *)&double v42 = v31;
        *(float *)&double v43 = v56;
        *(float *)&double v44 = v34;
        objc_msgSend(v40, "setBlurTrailAtIndex:center:radius:blurriness:alpha:", v28, v41, v39, v42, v43, v44);

        ++v28;
      }
      while (v28 < self->_numberOfVisiblePetals);
      a5 = v50;
      a7 = v51;
    }
    double v21 = v54;
    double v45 = v52;
  }
  else
  {
    double v45 = 1.0 - v21;
  }
  v46 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
  *(float *)&double v47 = v24;
  [v46 setRingRadius:v47];

  if (a7 >= a5) {
    double v48 = v45 * 3.14159265 + 3.14159265;
  }
  else {
    double v48 = v21 * 3.14159265;
  }
  id v57 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
  *(float *)&double v49 = v48;
  [v57 setGradientRotationAngle:v49];
}

- (void)_updatePetalsInRange:(_NSRange)a3 radius:(double)a4 radialDistance:(double)a5 angleOffset:(double)a6 clockwise:(BOOL)a7 alpha:(float)a8
{
  if (a3.location < a3.location + a3.length)
  {
    BOOL v12 = a7;
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    do
    {
      double v17 = FIUIDeepBreathingPetalCenter(location, v12, (double)self->_numberOfVisiblePetals, a5, a6);
      double v19 = v18;
      double v20 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
      float v16 = a4;
      *(float *)&double v21 = v16;
      *(float *)&double v22 = a8;
      objc_msgSend(v20, "setPetalAtIndex:center:radius:alpha:", location, v17, v19, v21, v22);

      ++location;
      --length;
    }
    while (length);
  }
  id v24 = [(FIUIDeepBreathingFlowerView *)self _currentPetalRing];
  double v23 = a4 + a5;
  *(float *)&double v23 = a4 + a5;
  [v24 setRingRadius:v23];
}

- (float)_interpolateWithKeyFrames:(id)a3 keyValues:(id)a4 value:(float)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = 0;
  while (1)
  {
    unint64_t v10 = v9;
    if (v9 >= [v7 count] - 1) {
      break;
    }
    ++v9;
    double v11 = [v7 objectAtIndexedSubscript:v10 + 1];
    [v11 floatValue];
    float v13 = v12;

    if (v13 > a5 || v10 == [v7 count] - 2)
    {
      double v14 = [v7 objectAtIndexedSubscript:v10];
      [v14 floatValue];
      float v16 = v15;

      double v17 = [v8 objectAtIndexedSubscript:v10];
      [v17 floatValue];
      double v19 = v18;
      double v20 = [v8 objectAtIndexedSubscript:v9];
      [v20 floatValue];
      float v22 = v19 + (float)((float)(a5 - v16) / (float)(v13 - v16)) * (v21 - v19);

      goto LABEL_7;
    }
  }
  float v22 = 0.0;
LABEL_7:

  return v22;
}

- (void)_ppt_setPetalCountOverride:(int64_t)a3
{
  self->_petalCountOverride = (double)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailAlphaKeyValues, 0);
  objc_storeStrong((id *)&self->_trailAlphaKeyFrames, 0);
  objc_storeStrong((id *)&self->_congratulationsText, 0);
  objc_storeStrong((id *)&self->_congratulationsLabel, 0);
  objc_storeStrong((id *)&self->_currentPetalRing, 0);
  objc_storeStrong((id *)&self->_petalRingsByNumberOfPetals, 0);
}

@end