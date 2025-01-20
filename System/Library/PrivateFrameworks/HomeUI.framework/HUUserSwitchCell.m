@interface HUUserSwitchCell
- (BOOL)isDisabled;
- (BOOL)isLoading;
- (BOOL)isOn;
- (BOOL)overrideDefaultContentConfiguration;
- (HUUserSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUUserSwitchCellDelegate)delegate;
- (UIActivityIndicatorView)activityIndicator;
- (UISwitch)switchView;
- (id)configurationState;
- (id)defaultContentConfiguration;
- (void)_toggleOn:(id)a3;
- (void)prepareForReuse;
- (void)setActivityIndicator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setOn:(BOOL)a3;
- (void)setOn:(BOOL)a3 animated:(BOOL)a4;
- (void)setOverrideDefaultContentConfiguration:(BOOL)a3;
- (void)setSwitchView:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUUserSwitchCell

- (HUUserSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HUUserSwitchCell;
  v4 = [(HUAvatarTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4F42E78]);
    switchView = v4->_switchView;
    v4->_switchView = v5;

    v7 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E4F42708]);
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = v7;

    v4->_overrideDefaultContentConfiguration = 1;
    v9 = [(HUUserSwitchCell *)v4 switchView];
    [(HUUserSwitchCell *)v4 setAccessoryView:v9];

    v10 = [(HUUserSwitchCell *)v4 switchView];
    [v10 addTarget:v4 action:sel__toggleOn_ forControlEvents:4096];
  }
  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HUUserSwitchCell;
  [(HUAvatarTableViewCell *)&v5 prepareForReuse];
  v3 = [(HUUserSwitchCell *)self defaultContentConfiguration];
  [(HUAvatarTableViewCell *)self setContentConfiguration:v3];

  [(HUUserSwitchCell *)self setDisabled:0];
  v4 = [(HUUserSwitchCell *)self switchView];
  [(HUUserSwitchCell *)self setAccessoryView:v4];

  [(HUUserSwitchCell *)self setNeedsLayout];
}

- (id)defaultContentConfiguration
{
  if ([(HUUserSwitchCell *)self overrideDefaultContentConfiguration])
  {
    v3 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
    v4 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    objc_super v5 = [v3 secondaryTextProperties];
    [v5 setFont:v4];

    [v3 setTextToSecondaryTextVerticalPadding:4.0];
    [v3 setTextToSecondaryTextHorizontalPadding:4.0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUUserSwitchCell;
    v3 = [(HUUserSwitchCell *)&v7 defaultContentConfiguration];
  }

  return v3;
}

- (id)configurationState
{
  v5.receiver = self;
  v5.super_class = (Class)HUUserSwitchCell;
  v3 = [(HUUserSwitchCell *)&v5 configurationState];
  objc_msgSend(v3, "setDisabled:", -[HUUserSwitchCell isDisabled](self, "isDisabled"));

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  BOOL v4 = !a3;
  objc_super v5 = [(HUUserSwitchCell *)self switchView];
  [v5 setUserInteractionEnabled:v4];

  v6 = [(HUUserSwitchCell *)self switchView];
  [v6 setEnabled:v4];

  [(HUUserSwitchCell *)self setNeedsUpdateConfiguration];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  id v6 = [(HUAvatarTableViewCell *)self contentConfiguration];
  objc_super v5 = [v6 updatedConfigurationForState:v4];

  [(HUAvatarTableViewCell *)self setContentConfiguration:v5];
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (a3)
    {
      id v4 = [(HUUserSwitchCell *)self activityIndicator];
      [(HUUserSwitchCell *)self setAccessoryView:v4];

      id v6 = [(HUUserSwitchCell *)self activityIndicator];
      [v6 startAnimating];
    }
    else
    {
      objc_super v5 = [(HUUserSwitchCell *)self switchView];
      [(HUUserSwitchCell *)self setAccessoryView:v5];

      id v6 = [(HUUserSwitchCell *)self activityIndicator];
      [v6 stopAnimating];
    }
  }
}

- (BOOL)isOn
{
  v2 = [(HUUserSwitchCell *)self switchView];
  char v3 = [v2 isOn];

  return v3;
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUUserSwitchCell *)self isOn] != a3)
  {
    id v5 = [(HUUserSwitchCell *)self switchView];
    [v5 setOn:v3];
  }
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(HUUserSwitchCell *)self isOn] != a3)
  {
    id v7 = [(HUUserSwitchCell *)self switchView];
    [v7 setOn:v5 animated:v4];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUUserSwitchCell;
  -[HUAvatarTableViewCell updateUIWithAnimation:](&v14, sel_updateUIWithAnimation_);
  BOOL v5 = [(HUAvatarTableViewCell *)self item];
  id v6 = [v5 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  if (v7)
  {
    uint64_t v8 = [v7 integerValue];
    if (v8 == 2)
    {
      uint64_t v9 = 1;
      goto LABEL_6;
    }
    if (v8 == 1)
    {
      uint64_t v9 = 0;
LABEL_6:
      [(HUUserSwitchCell *)self setOn:v9 animated:v3];
    }
  }
  uint64_t v10 = [(HUUserSwitchCell *)self isDisabled] ^ 1;
  v11 = [(HUUserSwitchCell *)self switchView];
  [v11 setUserInteractionEnabled:v10];

  uint64_t v12 = [(HUUserSwitchCell *)self isDisabled] ^ 1;
  v13 = [(HUUserSwitchCell *)self switchView];
  [v13 setEnabled:v12];
}

- (void)_toggleOn:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(HUUserSwitchCell *)self isOn];
    id v6 = @"off";
    if (v5) {
      id v6 = @"on";
    }
    int v8 = 138412546;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "User tapped switch cell: %@ to turn %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(HUUserSwitchCell *)self delegate];
  objc_msgSend(v7, "userSwitchCell:didTurnOn:", self, -[HUUserSwitchCell isOn](self, "isOn"));
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (HUUserSwitchCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUUserSwitchCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)overrideDefaultContentConfiguration
{
  return self->_overrideDefaultContentConfiguration;
}

- (void)setOverrideDefaultContentConfiguration:(BOOL)a3
{
  self->_overrideDefaultContentConfiguration = a3;
}

- (UISwitch)switchView
{
  return self->_switchView;
}

- (void)setSwitchView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_switchView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end