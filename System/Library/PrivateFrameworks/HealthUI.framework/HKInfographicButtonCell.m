@interface HKInfographicButtonCell
- (UIButton)button;
- (UIButtonConfiguration)configuration;
- (id)buttonTapHandler;
- (void)_constrainButton;
- (void)_didTapButton;
- (void)setButton:(id)a3;
- (void)setButtonTapHandler:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 buttonTapHandler:(id)a4;
- (void)updateAutomationIdentifiersWith:(id)a3;
@end

@implementation HKInfographicButtonCell

- (void)setConfiguration:(id)a3 buttonTapHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (UIButtonConfiguration *)[v6 copy];
  configuration = self->_configuration;
  self->_configuration = v8;

  -[UIButtonConfiguration setContentInsets:](self->_configuration, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  v10 = (void *)[v7 copy];
  id buttonTapHandler = self->_buttonTapHandler;
  self->_id buttonTapHandler = v10;

  button = self->_button;
  if (button)
  {
    [(UIButton *)button setConfiguration:v6];
  }
  else
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __61__HKInfographicButtonCell_setConfiguration_buttonTapHandler___block_invoke;
    v20 = &unk_1E6D522F8;
    objc_copyWeak(&v21, &location);
    v14 = [v13 actionWithHandler:&v17];
    objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", self->_configuration, v14, v17, v18, v19, v20);
    v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v16 = self->_button;
    self->_button = v15;

    [(HKInfographicButtonCell *)self _constrainButton];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __61__HKInfographicButtonCell_setConfiguration_buttonTapHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapButton];
}

- (void)_constrainButton
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v3 = [(HKInfographicButtonCell *)self contentView];
  [v3 addSubview:self->_button];

  [(UIButton *)self->_button setContentHorizontalAlignment:4];
  uint64_t v17 = (void *)MEMORY[0x1E4F28DC8];
  v24 = [(UIButton *)self->_button topAnchor];
  v25 = [(HKInfographicButtonCell *)self contentView];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:5.0];
  v26[0] = v22;
  v20 = [(UIButton *)self->_button leadingAnchor];
  id v21 = [(HKInfographicButtonCell *)self contentView];
  v19 = [v21 layoutMarginsGuide];
  uint64_t v18 = [v19 leadingAnchor];
  v16 = [v20 constraintEqualToAnchor:v18];
  v26[1] = v16;
  v14 = [(UIButton *)self->_button trailingAnchor];
  v15 = [(HKInfographicButtonCell *)self contentView];
  v13 = [v15 layoutMarginsGuide];
  v4 = [v13 trailingAnchor];
  v5 = [v14 constraintEqualToAnchor:v4];
  v26[2] = v5;
  id v6 = [(UIButton *)self->_button bottomAnchor];
  id v7 = [(HKInfographicButtonCell *)self contentView];
  v8 = [v7 layoutMarginsGuide];
  v9 = [v8 bottomAnchor];
  v10 = [v6 constraintEqualToAnchor:v9];
  v26[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v17 activateConstraints:v11];

  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(HKInfographicButtonCell *)self contentView];
  objc_msgSend(v12, "setDirectionalLayoutMargins:", 7.0, 7.0, 18.0, 7.0);
}

- (void)_didTapButton
{
  id buttonTapHandler = (void (**)(void))self->_buttonTapHandler;
  if (buttonTapHandler) {
    buttonTapHandler[2]();
  }
}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    v13[1] = @"InfographicButtonItem";
    v13[2] = @"Cell";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    id v7 = HKUIJoinStringsForAutomationIdentifier(v6);
    [(HKInfographicButtonCell *)self setAccessibilityIdentifier:v7];

    v12[0] = v5;
    v12[1] = @"InfographicButtonItem";
    v12[2] = @"Button";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    v9 = HKUIJoinStringsForAutomationIdentifier(v8);
    v10 = [(HKInfographicButtonCell *)self button];
    [v10 setAccessibilityIdentifier:v9];
  }
  else
  {
    [(HKInfographicButtonCell *)self setAccessibilityIdentifier:0];
    v11 = [(HKInfographicButtonCell *)self button];
    [v11 setAccessibilityIdentifier:0];
  }
}

- (UIButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)buttonTapHandler
{
  return self->_buttonTapHandler;
}

- (void)setButtonTapHandler:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_buttonTapHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end