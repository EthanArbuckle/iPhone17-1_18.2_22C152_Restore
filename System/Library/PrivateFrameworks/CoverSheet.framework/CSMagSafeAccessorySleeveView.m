@interface CSMagSafeAccessorySleeveView
- (BCBatteryDevice)batteryDevice;
- (BOOL)charging;
- (CALayer)backgroundColorLayer;
- (CGRect)_chargingViewFrame;
- (CGRect)visibleWindowFrame;
- (CSBatteryChargingView)batteryChargingView;
- (CSMagSafeAccessorySleeveView)initWithFrame:(CGRect)a3;
- (SBFLockScreenDateView)dateView;
- (SBFLockScreenDateView)secondaryDateView;
- (UIImageView)chargingBoltImageView;
- (double)animationDurationBeforeDismissal;
- (id)_batteryChargingViewWithChargingInfo:(id)a3;
- (void)_dismissAnimation;
- (void)_presentAnimation;
- (void)_runAnimationWithType:(unint64_t)a3;
- (void)layoutSubviews;
- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4;
- (void)setBackgroundColorLayer:(id)a3;
- (void)setBatteryChargingView:(id)a3;
- (void)setBatteryDevice:(id)a3;
- (void)setCharging:(BOOL)a3;
- (void)setChargingBoltImageView:(id)a3;
- (void)setDateView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setSecondaryDateView:(id)a3;
- (void)setVisibleWindowFrame:(CGRect)a3;
- (void)transitionChargingViewVisible:(BOOL)a3 chargingInfo:(id)a4;
- (void)updateDateViews;
@end

@implementation CSMagSafeAccessorySleeveView

- (CSMagSafeAccessorySleeveView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CSMagSafeAccessorySleeveView;
  v7 = -[CSMagSafeAccessoryView initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v9 = [(CSMagSafeAccessorySleeveView *)v7 layer];
    [v9 setAllowsGroupBlending:0];

    uint64_t v10 = objc_opt_new();
    backgroundColorLayer = v8->_backgroundColorLayer;
    v8->_backgroundColorLayer = (CALayer *)v10;

    -[CALayer setFrame:](v8->_backgroundColorLayer, "setFrame:", x, y, width, height);
    [(CALayer *)v8->_backgroundColorLayer setOpacity:0.0];
    [(CALayer *)v8->_backgroundColorLayer setAllowsGroupOpacity:1];
    [(CALayer *)v8->_backgroundColorLayer setAllowsGroupBlending:1];
    v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"bolt.fill"];
    v13 = [MEMORY[0x1E4F428B8] whiteColor];
    v14 = [v12 _flatImageWithColor:v13];

    v15 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:1 scale:32.0];
    v16 = [v14 imageWithRenderingMode:2];

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v16];
    chargingBoltImageView = v8->_chargingBoltImageView;
    v8->_chargingBoltImageView = (UIImageView *)v17;

    [(UIImageView *)v8->_chargingBoltImageView setPreferredSymbolConfiguration:v15];
    v8->_charging = 0;
  }
  return v8;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CSMagSafeAccessorySleeveView;
  [(CSMagSafeAccessoryView *)&v21 layoutSubviews];
  [(CSMagSafeAccessorySleeveView *)self updateDateViews];
  v3 = [(CSMagSafeAccessorySleeveView *)self superview];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (self->_charging)
  {
    [(UIImageView *)self->_chargingBoltImageView sizeToFit];
    [(UIImageView *)self->_chargingBoltImageView frame];
    -[UIImageView setFrame:](self->_chargingBoltImageView, "setFrame:", self->_visibleWindowFrame.origin.x + 15.0, self->_visibleWindowFrame.origin.y + (self->_visibleWindowFrame.size.height - v12) * 0.5);
    v13 = CSMagSafePowerStatusForBatteryState([(BCBatteryDevice *)self->_batteryDevice isLowPowerModeActive], [(BCBatteryDevice *)self->_batteryDevice isCharging], (double)[(BCBatteryDevice *)self->_batteryDevice percentCharge]);
    v14 = CSRingColorForPowerStatus(v13);
    [(UIImageView *)self->_chargingBoltImageView setTintColor:v14];
  }
  -[CALayer setBounds:](self->_backgroundColorLayer, "setBounds:", v5, v7, v9, v11);
  backgroundColorLayer = self->_backgroundColorLayer;
  v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2B8]];
  [(CALayer *)backgroundColorLayer setCompositingFilter:v16];

  uint64_t v17 = self->_backgroundColorLayer;
  [(CALayer *)v17 bounds];
  [(CSMagSafeAccessorySleeveView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](v17, "setPosition:");
  v18 = [(CSMagSafeAccessorySleeveView *)self layer];
  v19 = self->_backgroundColorLayer;
  objc_super v20 = [(SBFLockScreenDateView *)self->_dateView layer];
  [v18 insertSublayer:v19 below:v20];
}

- (void)updateDateViews
{
  [MEMORY[0x1E4F5E4D0] tightFrameForElements:1];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double MidY = CGRectGetMidY(self->_visibleWindowFrame);
  v27.origin.double x = v4;
  v27.origin.double y = v6;
  v27.size.double width = v8;
  v27.size.double height = v10;
  double v12 = MidY - CGRectGetMidY(v27);
  [(CSMagSafeAccessorySleeveView *)self bounds];
  double v16 = v13;
  double v17 = v14;
  double v18 = v15;
  double v20 = v12 + v19;
  dateView = self->_dateView;
  if (dateView)
  {
    -[SBFLockScreenDateView setFrame:](dateView, "setFrame:", v13, v20, v14, v15);
    [(SBFLockScreenDateView *)self->_dateView setSubtitleHidden:1];
  }
  secondaryDateView = self->_secondaryDateView;
  if (secondaryDateView)
  {
    -[SBFLockScreenDateView setFrame:](secondaryDateView, "setFrame:", v16, v20, v17, v18);
    [(SBFLockScreenDateView *)self->_secondaryDateView setSubtitleHidden:1];
    v23 = self->_secondaryDateView;
    v24 = [(CSMagSafeAccessoryView *)self legibilitySettings];
    [(SBFLockScreenDateView *)v23 setLegibilitySettings:v24];

    id v25 = [(SBFLockScreenDateView *)self->_secondaryDateView layer];
    [v25 setOpacity:0.0];
  }
}

- (void)setVisibleWindowFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_visibleWindowFrame = &self->_visibleWindowFrame;
  if (!CGRectEqualToRect(self->_visibleWindowFrame, a3))
  {
    p_visibleWindowFrame->origin.CGFloat x = x;
    p_visibleWindowFrame->origin.CGFloat y = y;
    p_visibleWindowFrame->size.CGFloat width = width;
    p_visibleWindowFrame->size.CGFloat height = height;
    [(CSMagSafeAccessorySleeveView *)self setNeedsLayout];
  }
}

- (void)setDateView:(id)a3
{
  double v5 = (SBFLockScreenDateView *)a3;
  dateView = self->_dateView;
  if (dateView != v5)
  {
    double v7 = v5;
    if (dateView) {
      [(SBFLockScreenDateView *)dateView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_dateView, a3);
    [(CSMagSafeAccessorySleeveView *)self addSubview:self->_dateView];
    dateView = (SBFLockScreenDateView *)[(CSMagSafeAccessorySleeveView *)self setNeedsLayout];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](dateView, v5);
}

- (void)setCharging:(BOOL)a3
{
  if (self->_charging != a3)
  {
    self->_charging = a3;
    batteryChargingView = self->_batteryChargingView;
    uint64_t v5 = objc_opt_class();
    CGFloat v6 = batteryChargingView;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        double v7 = v6;
      }
      else {
        double v7 = 0;
      }
    }
    else
    {
      double v7 = 0;
    }
    CGFloat v8 = v7;

    [(CSBatteryChargingView *)v8 updateForInternalBatteryDevice:self->_batteryDevice];
    if (self->_charging) {
      [(CSMagSafeAccessorySleeveView *)self addSubview:self->_chargingBoltImageView];
    }
    else {
      [(UIImageView *)self->_chargingBoltImageView removeFromSuperview];
    }
    [(CSMagSafeAccessorySleeveView *)self setNeedsLayout];
  }
}

- (void)transitionChargingViewVisible:(BOOL)a3 chargingInfo:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  if (v4)
  {
    dateView = self->_dateView;
    if (dateView)
    {
      [(SBFLockScreenDateView *)dateView setHidden:1];
      [(SBFLockScreenDateView *)self->_secondaryDateView setHidden:1];
    }
    [(UIImageView *)self->_chargingBoltImageView setHidden:1];
    double v7 = [v13 internalBatteryDevice];
    batteryDevice = self->_batteryDevice;
    self->_batteryDevice = v7;

    double v9 = [(CSMagSafeAccessorySleeveView *)self _batteryChargingViewWithChargingInfo:v13];
    [(CSMagSafeAccessorySleeveView *)self addSubview:v9];
  }
  else
  {
    batteryChargingView = self->_batteryChargingView;
    if (batteryChargingView)
    {
      [(CSBatteryChargingView *)batteryChargingView removeFromSuperview];
      double v11 = self->_batteryChargingView;
      self->_batteryChargingView = 0;
    }
    double v12 = self->_dateView;
    if (v12)
    {
      [(SBFLockScreenDateView *)v12 setHidden:0];
      [(SBFLockScreenDateView *)self->_secondaryDateView setHidden:0];
    }
    [(UIImageView *)self->_chargingBoltImageView setHidden:0];
    double v9 = self->_batteryDevice;
    self->_batteryDevice = 0;
  }

  [(CSMagSafeAccessorySleeveView *)self setNeedsLayout];
}

- (CGRect)_chargingViewFrame
{
  double width = self->_visibleWindowFrame.size.width;
  double height = self->_visibleWindowFrame.size.height;
  double v4 = self->_visibleWindowFrame.origin.x + (width - width) * 0.5;
  double v5 = height / 3.0;
  double v6 = self->_visibleWindowFrame.origin.y + (height - height / 3.0) * 0.5;
  result.size.double height = v5;
  result.size.double width = width;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v4;
  return result;
}

- (id)_batteryChargingViewWithChargingInfo:(id)a3
{
  batteryChargingView = self->_batteryChargingView;
  if (!batteryChargingView)
  {
    id v5 = a3;
    if ([v5 isChargingWithInternalWirelessAccessory])
    {
      double v6 = +[CSMagSafeAccessoryConfiguration staticViewConfiguration];
      double v7 = +[CSBatteryChargingView batteryChargingRingViewWithConfiguration:v6];
      CGFloat v8 = self->_batteryChargingView;
      self->_batteryChargingView = v7;
    }
    else
    {
      +[CSBatteryChargingView horizontalBatteryChargingViewForBatterySize:includeBoltImage:](CSBatteryChargingView, "horizontalBatteryChargingViewForBatterySize:includeBoltImage:", 1, 50.0, 20.0);
      double v9 = (CSBatteryChargingView *)objc_claimAutoreleasedReturnValue();
      double v6 = self->_batteryChargingView;
      self->_batteryChargingView = v9;
    }

    CGFloat v10 = self->_batteryChargingView;
    [(CSMagSafeAccessorySleeveView *)self _chargingViewFrame];
    -[CSBatteryChargingView setFrame:](v10, "setFrame:");
    [(CSBatteryChargingView *)self->_batteryChargingView setBatteryVisible:1];
    double v11 = self->_batteryChargingView;
    double v12 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
    [(CSBatteryChargingView *)v11 setLegibilitySettings:v12];

    [(CSBatteryChargingView *)self->_batteryChargingView setAutoresizingMask:18];
    id v13 = [v5 internalBatteryDevice];

    uint64_t v14 = [v13 percentCharge];
    double v15 = [MEMORY[0x1E4F4F9C8] localizedBatteryDetailTextForBatteryLevel:(double)v14];
    [(CSBatteryChargingView *)self->_batteryChargingView setPrimaryBatteryText:v15 forBattery:v13];

    batteryChargingView = self->_batteryChargingView;
  }

  return batteryChargingView;
}

- (void)setLegibilitySettings:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CSMagSafeAccessorySleeveView;
  id v4 = a3;
  [(CSMagSafeAccessoryView *)&v8 setLegibilitySettings:v4];
  backgroundColorLayer = self->_backgroundColorLayer;
  double v6 = objc_msgSend(v4, "secondaryColor", v8.receiver, v8.super_class);

  id v7 = v6;
  -[CALayer setBackgroundColor:](backgroundColorLayer, "setBackgroundColor:", [v7 CGColor]);
}

- (void)setSecondaryDateView:(id)a3
{
  id v5 = (SBFLockScreenDateView *)a3;
  secondaryDateView = self->_secondaryDateView;
  if (secondaryDateView != v5)
  {
    id v7 = v5;
    if (secondaryDateView) {
      [(SBFLockScreenDateView *)secondaryDateView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_secondaryDateView, a3);
    [(CSMagSafeAccessorySleeveView *)self addSubview:self->_secondaryDateView];
    secondaryDateView = (SBFLockScreenDateView *)[(CSMagSafeAccessorySleeveView *)self setNeedsLayout];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](secondaryDateView, v5);
}

- (void)_presentAnimation
{
  v15[2] = *MEMORY[0x1E4F143B8];
  double v3 = CACurrentMediaTime();
  id v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v4 setBeginTime:v3 + 0.0];
  [v4 setKeyTimes:&unk_1F306BA58];
  [v4 setValues:&unk_1F306BA70];
  [v4 setDuration:1.44];
  [v4 setRemovedOnCompletion:0];
  uint64_t v5 = *MEMORY[0x1E4F39FA8];
  [v4 setFillMode:*MEMORY[0x1E4F39FA8]];
  double v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  v15[0] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3A4A0];
  objc_super v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  v15[1] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v4 setTimingFunctions:v9];

  [(CALayer *)self->_backgroundColorLayer addAnimation:v4 forKey:@"opacity"];
  double v10 = v3 + 0.34;
  [v4 setBeginTime:v10];
  [v4 setKeyTimes:&unk_1F306BA88];
  [v4 setValues:&unk_1F306BAA0];
  [v4 setDuration:0.88];
  double v11 = [(SBFLockScreenDateView *)self->_secondaryDateView layer];
  [v11 addAnimation:v4 forKey:@"opacity"];

  double v12 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v12 setBeginTime:v10];
  [v12 setKeyTimes:&unk_1F306BAB8];
  [v12 setValues:&unk_1F306BAD0];
  [v12 setRemovedOnCompletion:0];
  [v12 setFillMode:v5];
  [v12 setDuration:0.88];
  id v13 = [MEMORY[0x1E4F39C10] functionWithName:v7];
  [v4 setTimingFunction:v13];

  uint64_t v14 = [(SBFLockScreenDateView *)self->_dateView layer];
  [v14 addAnimation:v12 forKey:@"opacity"];
}

- (void)_dismissAnimation
{
  id v7 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v7 setKeyTimes:&unk_1F306BAE8];
  [v7 setValues:&unk_1F306BB00];
  [v7 setDuration:0.44];
  [v7 setRemovedOnCompletion:0];
  [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
  double v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v7 setTimingFunction:v3];

  [(CALayer *)self->_backgroundColorLayer addAnimation:v7 forKey:@"opacity"];
  id v4 = [(SBFLockScreenDateView *)self->_secondaryDateView layer];
  [v4 addAnimation:v7 forKey:@"fadeOut"];

  uint64_t v5 = (void *)[v7 copy];
  [v5 setValues:&unk_1F306BB18];
  double v6 = [(SBFLockScreenDateView *)self->_dateView layer];
  [v6 addAnimation:v5 forKey:@"fadeIn"];
}

- (void)_runAnimationWithType:(unint64_t)a3
{
  if (a3 == 1)
  {
    [(CSMagSafeAccessorySleeveView *)self _dismissAnimation];
  }
  else if (!a3)
  {
    [(CSMagSafeAccessorySleeveView *)self _presentAnimation];
  }
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  [MEMORY[0x1E4F39CF8] begin];
  id v7 = (void *)MEMORY[0x1E4F39CF8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CSMagSafeAccessorySleeveView_performAnimation_completionHandler___block_invoke;
  v9[3] = &unk_1E6AD8B78;
  id v10 = v6;
  id v8 = v6;
  [v7 setCompletionBlock:v9];
  [(CSMagSafeAccessorySleeveView *)self _runAnimationWithType:a3];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __67__CSMagSafeAccessorySleeveView_performAnimation_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (double)animationDurationBeforeDismissal
{
  return 4.8;
}

- (SBFLockScreenDateView)dateView
{
  return self->_dateView;
}

- (SBFLockScreenDateView)secondaryDateView
{
  return self->_secondaryDateView;
}

- (CGRect)visibleWindowFrame
{
  double x = self->_visibleWindowFrame.origin.x;
  double y = self->_visibleWindowFrame.origin.y;
  double width = self->_visibleWindowFrame.size.width;
  double height = self->_visibleWindowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)charging
{
  return self->_charging;
}

- (CALayer)backgroundColorLayer
{
  return self->_backgroundColorLayer;
}

- (void)setBackgroundColorLayer:(id)a3
{
}

- (CSBatteryChargingView)batteryChargingView
{
  return self->_batteryChargingView;
}

- (void)setBatteryChargingView:(id)a3
{
}

- (UIImageView)chargingBoltImageView
{
  return self->_chargingBoltImageView;
}

- (void)setChargingBoltImageView:(id)a3
{
}

- (BCBatteryDevice)batteryDevice
{
  return self->_batteryDevice;
}

- (void)setBatteryDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDevice, 0);
  objc_storeStrong((id *)&self->_chargingBoltImageView, 0);
  objc_storeStrong((id *)&self->_batteryChargingView, 0);
  objc_storeStrong((id *)&self->_backgroundColorLayer, 0);
  objc_storeStrong((id *)&self->_secondaryDateView, 0);

  objc_storeStrong((id *)&self->_dateView, 0);
}

@end