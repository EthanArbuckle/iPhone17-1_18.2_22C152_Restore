@interface HUColoredButtonCell
- (BOOL)buttonColorFollowsTintColor;
- (BOOL)isDisabled;
- (HFItem)item;
- (HUColoredButton)button;
- (HUColoredButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUColoredButtonCellDelegate)delegate;
- (UIColor)buttonBackgroundColor;
- (void)buttonPressed:(id)a3;
- (void)prepareForReuse;
- (void)setButton:(id)a3;
- (void)setButtonBackgroundColor:(id)a3;
- (void)setButtonColorFollowsTintColor:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)tintColorDidChange;
- (void)updateButtonColor;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUColoredButtonCell

- (HUColoredButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v38.receiver = self;
  v38.super_class = (Class)HUColoredButtonCell;
  v4 = [(HUColoredButtonCell *)&v38 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F428B8] systemGrayColor];
    buttonBackgroundColor = v4->_buttonBackgroundColor;
    v4->_buttonBackgroundColor = (UIColor *)v5;

    v7 = [HUColoredButton alloc];
    uint64_t v8 = -[HUColoredButton initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    button = v4->_button;
    v4->_button = (HUColoredButton *)v8;

    [(HUColoredButton *)v4->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUColoredButton *)v4->_button setBackgroundColor:v4->_buttonBackgroundColor];
    [(HUColoredButton *)v4->_button addTarget:v4 action:sel_buttonPressed_ forControlEvents:64];
    v10 = [(HUColoredButtonCell *)v4 contentView];
    [v10 addSubview:v4->_button];

    v11 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUColoredButtonCell *)v4 setBackgroundColor:v11];

    v12 = [MEMORY[0x1E4F428B8] clearColor];
    v13 = [(HUColoredButtonCell *)v4 contentView];
    [v13 setBackgroundColor:v12];

    v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = [(HUColoredButton *)v4->_button leadingAnchor];
    v16 = [(HUColoredButtonCell *)v4 contentView];
    v17 = [v16 layoutMarginsGuide];
    v18 = [v17 leadingAnchor];
    v19 = [v15 constraintEqualToAnchor:v18];
    [v14 addObject:v19];

    v20 = [(HUColoredButton *)v4->_button trailingAnchor];
    v21 = [(HUColoredButtonCell *)v4 contentView];
    v22 = [v21 layoutMarginsGuide];
    v23 = [v22 trailingAnchor];
    v24 = [v20 constraintEqualToAnchor:v23];
    [v14 addObject:v24];

    v25 = [(HUColoredButton *)v4->_button topAnchor];
    v26 = [(HUColoredButtonCell *)v4 contentView];
    v27 = [v26 layoutMarginsGuide];
    v28 = [v27 topAnchor];
    v29 = [v25 constraintEqualToAnchor:v28 constant:8.0];
    [v14 addObject:v29];

    v30 = [(HUColoredButton *)v4->_button bottomAnchor];
    v31 = [(HUColoredButtonCell *)v4 contentView];
    v32 = [v31 layoutMarginsGuide];
    v33 = [v32 bottomAnchor];
    v34 = [v30 constraintEqualToAnchor:v33 constant:8.0];
    [v14 addObject:v34];

    v35 = [(HUColoredButton *)v4->_button heightAnchor];
    v36 = [v35 constraintEqualToConstant:56.0];
    [v14 addObject:v36];

    [MEMORY[0x1E4F28DC8] activateConstraints:v14];
  }
  return v4;
}

- (void)buttonPressed:(id)a3
{
  id v4 = [(HUColoredButtonCell *)self delegate];
  [v4 coloredButtonCellPressed:self];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUColoredButtonCell;
  [(HUColoredButtonCell *)&v3 tintColorDidChange];
  [(HUColoredButtonCell *)self updateButtonColor];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUColoredButtonCell;
  [(HUColoredButtonCell *)&v4 prepareForReuse];
  [(HUColoredButtonCell *)self setDisabled:0];
  [(HUColoredButtonCell *)self setItem:0];
  [(HUColoredButtonCell *)self setButtonColorFollowsTintColor:0];
  objc_super v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [(HUColoredButtonCell *)self setButtonBackgroundColor:v3];
}

- (void)setButtonColorFollowsTintColor:(BOOL)a3
{
  self->_buttonColorFollowsTintColor = a3;
  [(HUColoredButtonCell *)self updateButtonColor];
}

- (void)setButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonBackgroundColor, a3);

  [(HUColoredButtonCell *)self updateButtonColor];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  id v7 = [(HUColoredButtonCell *)self button];
  objc_super v4 = [(HUColoredButtonCell *)self item];
  uint64_t v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v7 setTitle:v6 forState:0];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  [(HUColoredButtonCell *)self updateButtonColor];
}

- (void)updateButtonColor
{
  if ([(HUColoredButtonCell *)self isDisabled])
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] _externalSystemMidGrayColor];
  }
  else
  {
    if ([(HUColoredButtonCell *)self buttonColorFollowsTintColor]) {
      [(HUColoredButtonCell *)self tintColor];
    }
    else {
    uint64_t v3 = [(HUColoredButtonCell *)self buttonBackgroundColor];
    }
  }
  id v5 = (id)v3;
  objc_super v4 = [(HUColoredButtonCell *)self button];
  [v4 setBackgroundColor:v5];
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

- (HUColoredButtonCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUColoredButtonCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)buttonColorFollowsTintColor
{
  return self->_buttonColorFollowsTintColor;
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (HUColoredButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_item, 0);
}

@end