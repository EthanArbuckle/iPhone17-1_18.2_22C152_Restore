@interface HUSwitchCell
- (BOOL)isDisabled;
- (BOOL)isOn;
- (HFItem)item;
- (HUSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUSwitchCellDelegate)delegate;
- (NSString)description;
- (void)_toggleOn:(id)a3;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)setOn:(BOOL)a3 animated:(BOOL)a4;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUSwitchCell

- (HUSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUSwitchCell;
  v4 = [(HUSwitchCell *)&v8 initWithStyle:3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F42E78]);
    [(HUSwitchCell *)v4 setAccessoryView:v5];

    v6 = [(HUSwitchCell *)v4 _switch];
    [v6 addTarget:v4 action:sel__toggleOn_ forControlEvents:4096];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUSwitchCell;
  [(HUSwitchCell *)&v3 prepareForReuse];
  [(HUSwitchCell *)self setDisabled:0];
  [(HUSwitchCell *)self setSelectionStyle:0];
}

- (BOOL)isOn
{
  v2 = [(HUSwitchCell *)self _switch];
  char v3 = [v2 isOn];

  return v3;
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUSwitchCell *)self isOn] != a3)
  {
    id v5 = [(HUSwitchCell *)self _switch];
    [v5 setOn:v3];
  }
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(HUSwitchCell *)self isOn] != a3)
  {
    id v7 = [(HUSwitchCell *)self _switch];
    [v7 setOn:v5 animated:v4];
  }
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(HUSwitchCell *)self updateUIWithAnimation:0];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HUSwitchCell *)self item];
  v6 = [v5 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  objc_super v8 = [(HUSwitchCell *)self textLabel];
  [v8 setText:v7];

  if ([(HUSwitchCell *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  v9 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v10 = [(HUSwitchCell *)self textLabel];
  [v10 setTextColor:v9];

  v11 = [(HUSwitchCell *)self textLabel];
  [v11 setNumberOfLines:0];

  if ([(HUSwitchCell *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  v12 = [MEMORY[0x1E4F428B8] labelColor];
  }
  [(HUSwitchCell *)self setTextColor:v12];

  v13 = [(HUSwitchCell *)self item];
  v14 = [v13 latestResults];
  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
  [(HUSwitchCell *)self setAccessibilityIdentifier:v15];

  v16 = [(HUSwitchCell *)self item];
  v17 = [v16 latestResults];
  uint64_t v18 = *MEMORY[0x1E4F68980];
  v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

  if (v19)
  {
    v20 = [(HUSwitchCell *)self item];
    v21 = [v20 latestResults];
    v22 = [v21 objectForKeyedSubscript:v18];
    v23 = [(HUSwitchCell *)self detailTextLabel];
    [v23 setText:v22];

    v24 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v25 = [(HUSwitchCell *)self detailTextLabel];
    [v25 setTextColor:v24];

    v26 = [(HUSwitchCell *)self detailTextLabel];
    [v26 setNumberOfLines:0];
  }
  else
  {
    v26 = [(HUSwitchCell *)self detailTextLabel];
    [v26 setText:0];
  }

  v27 = [(HUSwitchCell *)self item];
  v28 = [v27 latestResults];
  id v35 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  if (v35)
  {
    uint64_t v29 = [v35 integerValue];
    if (v29 == 2)
    {
      uint64_t v30 = 1;
    }
    else
    {
      if (v29 != 1) {
        goto LABEL_16;
      }
      uint64_t v30 = 0;
    }
    [(HUSwitchCell *)self setOn:v30 animated:v3];
  }
LABEL_16:
  uint64_t v31 = [(HUSwitchCell *)self isDisabled] ^ 1;
  v32 = [(HUSwitchCell *)self _switch];
  [v32 setUserInteractionEnabled:v31];

  uint64_t v33 = [(HUSwitchCell *)self isDisabled] ^ 1;
  v34 = [(HUSwitchCell *)self _switch];
  [v34 setEnabled:v33];

  [(HUSwitchCell *)self setUserInteractionEnabled:[(HUSwitchCell *)self isDisabled] ^ 1];
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  BOOL v4 = [(HUSwitchCell *)self textLabel];
  BOOL v5 = [v4 text];
  [v3 appendString:v5 withName:@"text"];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (void)_toggleOn:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(HUSwitchCell *)self isOn];
    v6 = @"off";
    if (v5) {
      v6 = @"on";
    }
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "User tapped switch cell: %@ to turn %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(HUSwitchCell *)self delegate];
  objc_msgSend(v7, "switchCell:didTurnOn:", self, -[HUSwitchCell isOn](self, "isOn"));
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUSwitchCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSwitchCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_item, 0);
}

@end