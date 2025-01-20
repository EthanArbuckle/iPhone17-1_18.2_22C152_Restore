@interface HUButtonCell
- (BOOL)hideTitle;
- (BOOL)isDestructive;
- (BOOL)isDisabled;
- (BOOL)textColorFollowsTintColor;
- (HFItem)item;
- (HUButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (int64_t)textAlignment;
- (void)didMoveToSuperview;
- (void)prepareForReuse;
- (void)setDestructive:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHideTitle:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColorFollowsTintColor:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateTitle;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUButtonCell

- (HUButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUButtonCell;
  v4 = [(HUButtonCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HUButtonCell *)v4 setTextColorFollowsTintColor:1];
    [(HUButtonCell *)v5 setTextAlignment:4];
    [(HUButtonCell *)v5 setHideTitle:0];
    v6 = [(HUButtonCell *)v5 textLabel];
    [v6 setNumberOfLines:0];
  }
  return v5;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  id v4 = [(HUButtonCell *)self textLabel];
  [v4 setTextAlignment:a3];
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
  [(HUButtonCell *)self updateTitle];
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  self->_textColorFollowsTintColor = a3;
  [(HUButtonCell *)self updateTitle];
}

- (void)setHideTitle:(BOOL)a3
{
  self->_hideTitle = a3;
  BOOL v4 = [(HUButtonCell *)self hideTitle];
  id v5 = [(HUButtonCell *)self textLabel];
  [v5 setHidden:v4];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUButtonCell;
  [(HUButtonCell *)&v3 prepareForReuse];
  [(HUButtonCell *)self setDestructive:0];
  [(HUButtonCell *)self setTextColorFollowsTintColor:1];
  [(HUButtonCell *)self setTextAlignment:4];
  [(HUButtonCell *)self setHideTitle:0];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUButtonCell;
  [(HUButtonCell *)&v3 tintColorDidChange];
  [(HUButtonCell *)self updateTitle];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)HUButtonCell;
  [(HUButtonCell *)&v3 didMoveToSuperview];
  [(HUButtonCell *)self updateTitle];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v4 = [(HUButtonCell *)self item];
  id v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v7 = [(HUButtonCell *)self textLabel];
  [v7 setText:v6];

  objc_super v8 = [(HUButtonCell *)self item];
  v9 = [v8 latestResults];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
  [(HUButtonCell *)self setAccessibilityIdentifier:v10];

  [(HUButtonCell *)self updateTitle];
}

- (void)updateTitle
{
  id v9 = [MEMORY[0x1E4F428B8] labelColor];
  int64_t v3 = [(HUButtonCell *)self textAlignment];
  if ([(HUButtonCell *)self textColorFollowsTintColor])
  {
    uint64_t v4 = [(HUButtonCell *)self tintColor];

    id v9 = (id)v4;
  }
  if ([(HUButtonCell *)self isDestructive])
  {
    uint64_t v5 = [MEMORY[0x1E4F428B8] systemRedColor];

    int64_t v3 = 4;
    id v9 = (id)v5;
  }
  if ([(HUButtonCell *)self isDisabled])
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemGrayColor];

    id v9 = (id)v6;
  }
  v7 = [(HUButtonCell *)self textLabel];
  [v7 setTextColor:v9];

  objc_super v8 = [(HUButtonCell *)self textLabel];
  [v8 setTextAlignment:v3];
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

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)textColorFollowsTintColor
{
  return self->_textColorFollowsTintColor;
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (void).cxx_destruct
{
}

@end