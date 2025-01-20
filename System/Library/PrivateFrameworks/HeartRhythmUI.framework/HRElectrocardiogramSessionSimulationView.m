@interface HRElectrocardiogramSessionSimulationView
- (BOOL)isLargeDevice;
- (HRElectrocardiogramSessionScreenView)screenView;
- (HRElectrocardiogramSessionSimulationView)initWithFrame:(CGRect)a3;
- (HRElectrocardiogramSessionSimulationView)initWithFrame:(CGRect)a3 isLargeDevice:(BOOL)a4;
- (double)cornerRadius;
- (void)_setUpUI;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setTimeRemaining:(double)a3;
@end

@implementation HRElectrocardiogramSessionSimulationView

- (HRElectrocardiogramSessionSimulationView)initWithFrame:(CGRect)a3 isLargeDevice:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HRElectrocardiogramSessionSimulationView;
  v5 = -[HRElectrocardiogramSessionSimulationView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_isLargeDevice = v4;
    v7 = [[HRElectrocardiogramSessionScreenView alloc] initWithLargeDevice:v4];
    screenView = v6->_screenView;
    v6->_screenView = v7;

    [(HRElectrocardiogramSessionSimulationView *)v6 _setUpUI];
  }
  return v6;
}

- (HRElectrocardiogramSessionSimulationView)initWithFrame:(CGRect)a3
{
  return -[HRElectrocardiogramSessionSimulationView initWithFrame:isLargeDevice:](self, "initWithFrame:isLargeDevice:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setUpUI
{
  v3 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  [(HRElectrocardiogramSessionSimulationView *)self addSubview:v3];

  BOOL v4 = [MEMORY[0x263F1C550] clearColor];
  [(HRElectrocardiogramSessionSimulationView *)self setBackgroundColor:v4];

  id v5 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  [v5 setClipsToBounds:1];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)HRElectrocardiogramSessionSimulationView;
  [(HRElectrocardiogramSessionSimulationView *)&v23 layoutSubviews];
  [(HRElectrocardiogramSessionSimulationView *)self bounds];
  double MidX = CGRectGetMidX(v24);
  [(HRElectrocardiogramSessionSimulationView *)self bounds];
  double MidY = CGRectGetMidY(v25);
  id v5 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  objc_msgSend(v5, "setCenter:", MidX, MidY);

  v6 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v22[0] = *MEMORY[0x263F000D0];
  v22[1] = v7;
  v22[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v6 setTransform:v22];

  [(HRElectrocardiogramSessionSimulationView *)self bounds];
  double v9 = v8;
  objc_super v10 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  [v10 frame];
  double v12 = v9 / v11;

  [(HRElectrocardiogramSessionSimulationView *)self bounds];
  double v14 = v13;
  v15 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  [v15 frame];
  double v17 = v14 / v16;

  if (v12 >= v17) {
    CGFloat v18 = v17;
  }
  else {
    CGFloat v18 = v12;
  }
  CGAffineTransformMakeScale(&v21, v18, v18);
  v19 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  CGAffineTransform v20 = v21;
  [v19 setTransform:&v20];
}

- (double)cornerRadius
{
  v2 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  v3 = [v2 layer];
  [v3 cornerRadius];
  double v5 = v4;

  return v5;
}

- (void)setCornerRadius:(double)a3
{
  id v5 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  double v4 = [v5 layer];
  [v4 setCornerRadius:a3];
}

- (void)setTimeRemaining:(double)a3
{
  double v4 = (void *)MEMORY[0x263F08A30];
  id v5 = [NSNumber numberWithDouble:a3];
  v6 = [v4 localizedStringFromNumber:v5 numberStyle:1];
  long long v7 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  double v8 = [v7 countdownValueLabel];
  [v8 setText:v6];

  HRUIECGLocalizedString(@"SESSION_COUNTDOWN_SECONDS_UNIT");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = [(HRElectrocardiogramSessionSimulationView *)self screenView];
  objc_super v10 = [v9 countdownUnitLabel];
  [v10 setText:v11];
}

- (BOOL)isLargeDevice
{
  return self->_isLargeDevice;
}

- (HRElectrocardiogramSessionScreenView)screenView
{
  return self->_screenView;
}

- (void).cxx_destruct
{
}

@end