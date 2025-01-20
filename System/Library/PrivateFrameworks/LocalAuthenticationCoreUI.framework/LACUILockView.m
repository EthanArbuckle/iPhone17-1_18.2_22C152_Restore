@interface LACUILockView
- (LACUILockView)init;
- (UIColor)color;
- (int64_t)state;
- (void)_setup;
- (void)setColor:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation LACUILockView

- (LACUILockView)init
{
  v16.receiver = self;
  v16.super_class = (Class)LACUILockView;
  v2 = -[LACUILockView initWithFrame:](&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 URLForResource:@"lock" withExtension:@"ca"];

    v5 = [[LACUIPackagedView alloc] initWithURL:v4 error:0];
    packagedView = v2->_packagedView;
    v2->_packagedView = v5;

    v7 = [(LACUIPackagedView *)v2->_packagedView layer];
    uint64_t v8 = LACUILayerFindSublayerWithName(v7, @"body");
    body = v2->_body;
    v2->_body = (CAShapeLayer *)v8;

    v10 = [(LACUIPackagedView *)v2->_packagedView layer];
    uint64_t v11 = LACUILayerFindSublayerWithName(v10, @"shackle");
    shackle = v2->_shackle;
    v2->_shackle = (CAShapeLayer *)v11;

    uint64_t v13 = [MEMORY[0x263F825C8] whiteColor];
    color = v2->_color;
    v2->_color = (UIColor *)v13;

    [(LACUILockView *)v2 _setup];
  }
  return v2;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  id v5 = a3;
  body = self->_body;
  id v7 = v5;
  -[CAShapeLayer setFillColor:](body, "setFillColor:", [v7 CGColor]);
  shackle = self->_shackle;
  id v9 = v7;
  -[CAShapeLayer setStrokeColor:](shackle, "setStrokeColor:", [v9 CGColor]);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  objc_initWeak(&location, self);
  packagedView = self->_packagedView;
  if ((unint64_t)a3 > 2) {
    v6 = @"Invalid";
  }
  else {
    v6 = off_2653BCB20[a3];
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__LACUILockView_setState___block_invoke;
  v7[3] = &unk_2653BCB00;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  [(LACUIPackagedView *)packagedView setStateNamed:v6 animated:1 completion:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __26__LACUILockView_setState___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(void *)(a1 + 40) == 2)
  {
    v3 = WeakRetained;
    [WeakRetained[53] setStateNamed:@"Locked" animated:0];
    WeakRetained = v3;
  }
}

- (void)_setup
{
  v17[4] = *MEMORY[0x263EF8340];
  [(LACUILockView *)self addSubview:self->_packagedView];
  [(LACUIPackagedView *)self->_packagedView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v13 = (void *)MEMORY[0x263F08938];
  objc_super v16 = [(LACUIPackagedView *)self->_packagedView leadingAnchor];
  v15 = [(LACUILockView *)self leadingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v17[0] = v14;
  v3 = [(LACUIPackagedView *)self->_packagedView trailingAnchor];
  v4 = [(LACUILockView *)self trailingAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];
  v17[1] = v5;
  v6 = [(LACUIPackagedView *)self->_packagedView topAnchor];
  id v7 = [(LACUILockView *)self topAnchor];
  uint64_t v8 = [v6 constraintEqualToAnchor:v7];
  v17[2] = v8;
  id v9 = [(LACUIPackagedView *)self->_packagedView bottomAnchor];
  v10 = [(LACUILockView *)self bottomAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  v17[3] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  [v13 activateConstraints:v12];
}

- (int64_t)state
{
  return self->_state;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_packagedView, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_shackle, 0);
}

@end