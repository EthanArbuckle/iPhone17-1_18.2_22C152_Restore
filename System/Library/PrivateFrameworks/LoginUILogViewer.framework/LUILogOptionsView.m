@interface LUILogOptionsView
- (LUILogOptionsView)initWithFrame:(CGRect)a3;
- (UIButton)halfHourButton;
- (UIButton)hourButton;
- (UIButton)lastDayButton;
- (UIButton)streamButton;
- (UIButton)tenMinutesLogButton;
- (UIStackView)buttonStackView;
- (id)_createButtonStackView;
- (id)_createButtonWithTitle:(id)a3;
- (void)_setup;
- (void)layoutSubviews;
- (void)setButtonStackView:(id)a3;
- (void)setHalfHourButton:(id)a3;
- (void)setHourButton:(id)a3;
- (void)setLastDayButton:(id)a3;
- (void)setStreamButton:(id)a3;
- (void)setTenMinutesLogButton:(id)a3;
@end

@implementation LUILogOptionsView

- (LUILogOptionsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LUILogOptionsView;
  v3 = -[LUILogOptionsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LUILogOptionsView *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
  v3 = [(LUILogOptionsView *)self _createButtonStackView];
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v3;

  v5 = self->_buttonStackView;

  [(LUILogOptionsView *)self addSubview:v5];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)LUILogOptionsView;
  [(LUILogOptionsView *)&v14 layoutSubviews];
  v3 = [(LUILogOptionsView *)self buttonStackView];
  v4 = [v3 widthAnchor];
  v5 = [v4 constraintEqualToConstant:200.0];
  [v5 setActive:1];

  objc_super v6 = [(LUILogOptionsView *)self buttonStackView];
  v7 = [v6 heightAnchor];
  [(LUILogOptionsView *)self frame];
  v8 = [v7 constraintEqualToConstant:CGRectGetHeight(v15) + -100.0];
  [v8 setActive:1];

  [(LUILogOptionsView *)self center];
  double v10 = v9;
  double v12 = v11;
  v13 = [(LUILogOptionsView *)self buttonStackView];
  objc_msgSend(v13, "setCenter:", v10, v12);
}

- (id)_createButtonStackView
{
  v19[5] = *MEMORY[0x263EF8340];
  v3 = [(LUILogOptionsView *)self _createButtonWithTitle:@"Last 10 minutes' log"];
  tenMinutesLogButton = self->_tenMinutesLogButton;
  self->_tenMinutesLogButton = v3;

  v5 = [(LUILogOptionsView *)self _createButtonWithTitle:@"Last 30 minutes' log"];
  halfHourButton = self->_halfHourButton;
  self->_halfHourButton = v5;

  v7 = [(LUILogOptionsView *)self _createButtonWithTitle:@"Last 60 minutes' log"];
  hourButton = self->_hourButton;
  self->_hourButton = v7;

  double v9 = [(LUILogOptionsView *)self _createButtonWithTitle:@"Last days' log"];
  lastDayButton = self->_lastDayButton;
  self->_lastDayButton = v9;

  double v11 = [(LUILogOptionsView *)self _createButtonWithTitle:@"Stream log"];
  streamButton = self->_streamButton;
  self->_streamButton = v11;

  id v13 = objc_alloc(MEMORY[0x263F1C9B8]);
  objc_super v14 = self->_halfHourButton;
  v19[0] = self->_tenMinutesLogButton;
  v19[1] = v14;
  CGRect v15 = self->_lastDayButton;
  v19[2] = self->_hourButton;
  v19[3] = v15;
  v19[4] = self->_streamButton;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:5];
  v17 = (void *)[v13 initWithArrangedSubviews:v16];

  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17 setAxis:1];
  [v17 setDistribution:3];
  [v17 setAlignment:3];

  return v17;
}

- (id)_createButtonWithTitle:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F1C488];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithFrame:", 0.0, 0.0, 200.0, 50.0);
  [v5 setTitle:v4 forState:0];

  objc_super v6 = [MEMORY[0x263F1C550] whiteColor];
  [v5 setTintColor:v6];

  v7 = [MEMORY[0x263F1C550] whiteColor];
  [v5 setTitleColor:v7 forState:0];

  v8 = [MEMORY[0x263F1C550] grayColor];
  [v5 setTitleColor:v8 forState:2];

  double v9 = [v5 layer];
  [v9 setCornerRadius:5.0];

  id v10 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v11 = [v10 CGColor];
  double v12 = [v5 layer];
  [v12 setBorderColor:v11];

  id v13 = [v5 layer];
  [v13 setBorderWidth:1.5];

  objc_super v14 = [v5 widthAnchor];
  CGRect v15 = [v14 constraintEqualToConstant:200.0];
  [v15 setActive:1];

  v16 = [v5 heightAnchor];
  v17 = [v16 constraintEqualToConstant:50.0];
  [v17 setActive:1];

  return v5;
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (UIButton)tenMinutesLogButton
{
  return self->_tenMinutesLogButton;
}

- (void)setTenMinutesLogButton:(id)a3
{
}

- (UIButton)halfHourButton
{
  return self->_halfHourButton;
}

- (void)setHalfHourButton:(id)a3
{
}

- (UIButton)hourButton
{
  return self->_hourButton;
}

- (void)setHourButton:(id)a3
{
}

- (UIButton)lastDayButton
{
  return self->_lastDayButton;
}

- (void)setLastDayButton:(id)a3
{
}

- (UIButton)streamButton
{
  return self->_streamButton;
}

- (void)setStreamButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamButton, 0);
  objc_storeStrong((id *)&self->_lastDayButton, 0);
  objc_storeStrong((id *)&self->_hourButton, 0);
  objc_storeStrong((id *)&self->_halfHourButton, 0);
  objc_storeStrong((id *)&self->_tenMinutesLogButton, 0);

  objc_storeStrong((id *)&self->_buttonStackView, 0);
}

@end