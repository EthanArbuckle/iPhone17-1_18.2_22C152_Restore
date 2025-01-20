@interface HUIconSwitchCell
- (BOOL)isOn;
- (HUIconSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUIconSwitchCellDelegate)delegate;
- (UISwitch)switchView;
- (void)_toggleOn:(id)a3;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)setOn:(BOOL)a3 animated:(BOOL)a4;
- (void)setSwitchView:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUIconSwitchCell

- (HUIconSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HUIconSwitchCell;
  v4 = [(HUTitleDescriptionCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4F42E78]);
    switchView = v4->_switchView;
    v4->_switchView = v5;

    v7 = [(HUIconSwitchCell *)v4 switchView];
    [(HUIconSwitchCell *)v4 setAccessoryView:v7];

    v8 = [(HUIconSwitchCell *)v4 switchView];
    [v8 addTarget:v4 action:sel__toggleOn_ forControlEvents:4096];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUIconSwitchCell;
  [(HUTitleDescriptionCell *)&v4 prepareForReuse];
  [(HUTitleDescriptionCell *)self setDisabled:0];
  v3 = [(HUIconSwitchCell *)self switchView];
  [(HUIconSwitchCell *)self setAccessoryView:v3];

  [(HUIconSwitchCell *)self setNeedsLayout];
}

- (BOOL)isOn
{
  v2 = [(HUIconSwitchCell *)self switchView];
  char v3 = [v2 isOn];

  return v3;
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUIconSwitchCell *)self isOn] != a3)
  {
    id v5 = [(HUIconSwitchCell *)self switchView];
    [v5 setOn:v3];
  }
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(HUIconSwitchCell *)self isOn] != a3)
  {
    id v7 = [(HUIconSwitchCell *)self switchView];
    [v7 setOn:v5 animated:v4];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUIconSwitchCell;
  -[HUTitleDescriptionCell updateUIWithAnimation:](&v16, sel_updateUIWithAnimation_);
  BOOL v5 = [(HUIconCell *)self item];
  v6 = [v5 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = [v7 integerValue];
  if (v8 == 2)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if (v8 != 1) {
      goto LABEL_7;
    }
    uint64_t v9 = 0;
  }
  [(HUIconSwitchCell *)self setOn:v9 animated:v3];
LABEL_7:
  if ([(HUIconCell *)self isDisabled])
  {
    uint64_t v10 = 0;
  }
  else
  {
    v11 = [(HUIconCell *)self item];
    v12 = [v11 latestResults];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    uint64_t v10 = [v13 BOOLValue] ^ 1;
  }
  v14 = [(HUIconSwitchCell *)self switchView];
  [v14 setUserInteractionEnabled:v10];

  v15 = [(HUIconSwitchCell *)self switchView];
  [v15 setEnabled:v10];
}

- (void)_toggleOn:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(HUIconSwitchCell *)self isOn];
    v6 = @"off";
    if (v5) {
      v6 = @"on";
    }
    int v8 = 138412546;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "User tapped switch cell: %@ to turn %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(HUIconSwitchCell *)self delegate];
  objc_msgSend(v7, "switchCell:didTurnOn:", self, -[HUIconSwitchCell isOn](self, "isOn"));
}

- (HUIconSwitchCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUIconSwitchCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISwitch)switchView
{
  return self->_switchView;
}

- (void)setSwitchView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end