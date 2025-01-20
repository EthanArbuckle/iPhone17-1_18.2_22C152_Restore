@interface HROnboardingWristImageView
- (HROnboardingWristImageView)initWithImageStyle:(int64_t)a3;
- (UIImageView)wristWatchImageView;
- (UIView)wristWatchContentView;
- (id)_wristWatchContentViewForStyle:(int64_t)a3;
- (int64_t)watchImageStyle;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
- (void)setTimeRemaining:(double)a3;
- (void)setWristWatchContentView:(id)a3;
@end

@implementation HROnboardingWristImageView

- (HROnboardingWristImageView)initWithImageStyle:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HROnboardingWristImageView;
  v4 = -[HROnboardingWristImageView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_watchImageStyle = a3;
    id v6 = objc_alloc(MEMORY[0x263F1C6D0]);
    v7 = objc_msgSend(MEMORY[0x263F1C6B0], "hrui_ECGOnboardingWristImage");
    uint64_t v8 = [v6 initWithImage:v7];
    wristWatchImageView = v5->_wristWatchImageView;
    v5->_wristWatchImageView = (UIImageView *)v8;

    v10 = [(HROnboardingWristImageView *)v5 wristWatchImageView];
    [(HROnboardingWristImageView *)v5 addSubview:v10];

    v11 = [(HROnboardingWristImageView *)v5 wristWatchImageView];
    objc_msgSend(v11, "hk_alignConstraintsWithView:", v5);

    v12 = [(HROnboardingWristImageView *)v5 wristWatchImageView];
    v13 = [v12 image];
    [v13 size];
    -[UIView hrui_constraintAspectRatioFromSize:](v5, "hrui_constraintAspectRatioFromSize:");

    uint64_t v14 = [(HROnboardingWristImageView *)v5 _wristWatchContentViewForStyle:a3];
    wristWatchContentView = v5->_wristWatchContentView;
    v5->_wristWatchContentView = (UIView *)v14;

    [(HROnboardingWristImageView *)v5 addSubview:v5->_wristWatchContentView];
  }
  return v5;
}

- (id)_wristWatchContentViewForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    v7 = [HRElectrocardiogramSessionSimulationView alloc];
    id v6 = -[HRElectrocardiogramSessionSimulationView initWithFrame:isLargeDevice:](v7, "initWithFrame:isLargeDevice:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v5 = [MEMORY[0x263F1C550] blackColor];
    [(HRElectrocardiogramSessionSimulationView *)v6 setBackgroundColor:v5];
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (void *)MEMORY[0x263F1C6B0];
    v4 = HRHeartRhythmUIFrameworkBundle();
    v5 = [v3 imageNamed:@"ECG-Setup" inBundle:v4 compatibleWithTraitCollection:0];

    id v6 = (HRElectrocardiogramSessionSimulationView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v5];
LABEL_5:

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  return v6;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)HROnboardingWristImageView;
  [(HROnboardingWristImageView *)&v15 layoutSubviews];
  int v3 = objc_msgSend(MEMORY[0x263F1C920], "hrui_currentDeviceHasLargePhoneScreen");
  if (v3) {
    double v4 = 0.473;
  }
  else {
    double v4 = 0.475;
  }
  if (v3) {
    double v5 = 0.294;
  }
  else {
    double v5 = 0.324;
  }
  if (v3) {
    double v6 = 0.233;
  }
  else {
    double v6 = 0.232;
  }
  if (v3) {
    double v7 = 0.353;
  }
  else {
    double v7 = 0.338;
  }
  [(HROnboardingWristImageView *)self bounds];
  double v9 = v8 * v7;
  double v11 = v10 * v6;
  double v12 = v8 * v5;
  double v13 = v10 * v4;
  uint64_t v14 = [(HROnboardingWristImageView *)self wristWatchContentView];
  objc_msgSend(v14, "setFrame:", v9, v11, v12, v13);
}

- (void)setContentMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HROnboardingWristImageView;
  -[HROnboardingWristImageView setContentMode:](&v6, sel_setContentMode_);
  double v5 = [(HROnboardingWristImageView *)self wristWatchImageView];
  [v5 setContentMode:a3];
}

- (void)setTimeRemaining:(double)a3
{
  double v5 = [(HROnboardingWristImageView *)self wristWatchContentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(HROnboardingWristImageView *)self wristWatchContentView];
    [v7 setTimeRemaining:a3];
  }
}

- (int64_t)watchImageStyle
{
  return self->_watchImageStyle;
}

- (UIImageView)wristWatchImageView
{
  return self->_wristWatchImageView;
}

- (UIView)wristWatchContentView
{
  return self->_wristWatchContentView;
}

- (void)setWristWatchContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristWatchContentView, 0);
  objc_storeStrong((id *)&self->_wristWatchImageView, 0);
}

@end