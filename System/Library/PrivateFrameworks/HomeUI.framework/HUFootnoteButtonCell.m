@interface HUFootnoteButtonCell
- (BOOL)isDisabled;
- (HFItem)item;
- (HUFootnoteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)titleButton;
- (void)_updateTextColor;
- (void)didMoveToSuperview;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setItem:(id)a3;
- (void)setTitleButton:(id)a3;
- (void)tintColorDidChange;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUFootnoteButtonCell

- (HUFootnoteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v32.receiver = self;
  v32.super_class = (Class)HUFootnoteButtonCell;
  v4 = [(HUFootnoteButtonCell *)&v32 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUFootnoteButtonCell *)v4 setBackgroundColor:v5];

    v6 = [MEMORY[0x1E4F428B8] clearColor];
    v7 = [(HUFootnoteButtonCell *)v4 contentView];
    [v7 setBackgroundColor:v6];

    uint64_t v8 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    titleButton = v4->_titleButton;
    v4->_titleButton = (UIButton *)v8;

    [(UIButton *)v4->_titleButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    v11 = [(UIButton *)v4->_titleButton titleLabel];
    [v11 setFont:v10];

    v12 = [(UIButton *)v4->_titleButton titleLabel];
    [v12 setTextAlignment:1];

    [(UIButton *)v4->_titleButton setUserInteractionEnabled:0];
    v13 = [(HUFootnoteButtonCell *)v4 contentView];
    [v13 addSubview:v4->_titleButton];

    v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = [(UIButton *)v4->_titleButton leadingAnchor];
    v16 = [(HUFootnoteButtonCell *)v4 contentView];
    v17 = [v16 leadingAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    [v14 addObject:v18];

    v19 = [(UIButton *)v4->_titleButton trailingAnchor];
    v20 = [(HUFootnoteButtonCell *)v4 contentView];
    v21 = [v20 trailingAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    [v14 addObject:v22];

    v23 = [(UIButton *)v4->_titleButton topAnchor];
    v24 = [(HUFootnoteButtonCell *)v4 contentView];
    v25 = [v24 topAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v14 addObject:v26];

    v27 = [(UIButton *)v4->_titleButton bottomAnchor];
    v28 = [(HUFootnoteButtonCell *)v4 contentView];
    v29 = [v28 bottomAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    [v14 addObject:v30];

    [MEMORY[0x1E4F28DC8] activateConstraints:v14];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUFootnoteButtonCell;
  [(HUFootnoteButtonCell *)&v3 prepareForReuse];
  [(HUFootnoteButtonCell *)self setItem:0];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUFootnoteButtonCell;
  [(HUFootnoteButtonCell *)&v3 tintColorDidChange];
  [(HUFootnoteButtonCell *)self _updateTextColor];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)HUFootnoteButtonCell;
  [(HUFootnoteButtonCell *)&v3 didMoveToSuperview];
  [(HUFootnoteButtonCell *)self _updateTextColor];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUFootnoteButtonCell;
  [(HUFootnoteButtonCell *)&v7 setHighlighted:a3 animated:a4];
  v6 = [(HUFootnoteButtonCell *)self titleButton];
  [v6 setHighlighted:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v4 = [(HUFootnoteButtonCell *)self item];
  id v7 = [v4 latestResults];

  v5 = [(HUFootnoteButtonCell *)self titleButton];
  v6 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v5 setTitle:v6 forState:0];

  [(HUFootnoteButtonCell *)self _updateTextColor];
  [(HUFootnoteButtonCell *)self setSelectionStyle:0];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  [(HUFootnoteButtonCell *)self _updateTextColor];
}

- (void)_updateTextColor
{
  id v6 = [(HUFootnoteButtonCell *)self tintColor];
  if ([(HUFootnoteButtonCell *)self isDisabled])
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] systemGrayColor];

    id v6 = (id)v3;
  }
  BOOL v4 = [(HUFootnoteButtonCell *)self titleButton];
  v5 = [v4 titleLabel];
  [v5 setTextColor:v6];
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

- (UIButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleButton, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end