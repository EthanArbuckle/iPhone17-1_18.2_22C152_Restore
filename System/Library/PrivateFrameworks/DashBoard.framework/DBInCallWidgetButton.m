@interface DBInCallWidgetButton
- (DBInCallWidgetButton)initWithButtonType:(int64_t)a3;
- (DBInCallWidgetButtonRingView)ringView;
- (int64_t)inCallButtonType;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setRingView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setupConstraints;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBInCallWidgetButton

- (DBInCallWidgetButton)initWithButtonType:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)DBInCallWidgetButton;
  v4 = -[DBInCallWidgetButton initWithFrame:](&v15, sel_initWithFrame_, 0.0, 0.0, 40.0, 40.0);
  v5 = v4;
  if (v4)
  {
    v4->_inCallButtonType = a3;
    if (a3)
    {
      if (a3 != 1)
      {
        v6 = 0;
        goto LABEL_8;
      }
      v6 = [MEMORY[0x263F825C8] _carSystemTertiaryColor];
      uint64_t v7 = 22;
    }
    else
    {
      v6 = [MEMORY[0x263F825C8] externalSystemRedColor];
      uint64_t v7 = 2;
    }
    v8 = [MEMORY[0x263F827E8] tpImageForSymbolType:v7 textStyle:*MEMORY[0x263F83580] scale:3 isStaticSize:1];
    [(DBInCallWidgetButton *)v5 setImage:v8 forState:0];

LABEL_8:
    v9 = [DBInCallWidgetButtonRingView alloc];
    uint64_t v10 = -[DBInCallWidgetButtonRingView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    ringView = v5->_ringView;
    v5->_ringView = (DBInCallWidgetButtonRingView *)v10;

    [(DBInCallWidgetButtonRingView *)v5->_ringView setUserInteractionEnabled:0];
    [(DBInCallWidgetButtonRingView *)v5->_ringView setFillColor:v6];
    v12 = [MEMORY[0x263F825C8] clearColor];
    [(DBInCallWidgetButtonRingView *)v5->_ringView setBackgroundColor:v12];

    [(DBInCallWidgetButtonRingView *)v5->_ringView setOpaque:0];
    [(DBInCallWidgetButton *)v5 addSubview:v5->_ringView];
    v13 = [MEMORY[0x263F825C8] whiteColor];
    [(DBInCallWidgetButton *)v5 setTintColor:v13];

    [(DBInCallWidgetButton *)v5 setAdjustsImageWhenDisabled:1];
    [(DBInCallWidgetButton *)v5 setAdjustsImageWhenHighlighted:0];
    [(DBInCallWidgetButton *)v5 setupConstraints];
    [(DBInCallWidgetButton *)v5 layoutIfNeeded];
    [(DBInCallWidgetButton *)v5 sendSubviewToBack:v5->_ringView];
  }
  return v5;
}

- (void)setupConstraints
{
  v3 = [(DBInCallWidgetButton *)self ringView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v24 = (id)objc_opt_new();
  v4 = [(DBInCallWidgetButton *)self widthAnchor];
  v5 = [v4 constraintEqualToConstant:48.0];
  [v24 addObject:v5];

  v6 = [(DBInCallWidgetButton *)self heightAnchor];
  uint64_t v7 = [v6 constraintEqualToConstant:48.0];
  [v24 addObject:v7];

  v8 = [(DBInCallWidgetButton *)self ringView];
  v9 = [v8 leadingAnchor];
  uint64_t v10 = [(DBInCallWidgetButton *)self leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v24 addObject:v11];

  v12 = [(DBInCallWidgetButton *)self ringView];
  v13 = [v12 trailingAnchor];
  v14 = [(DBInCallWidgetButton *)self trailingAnchor];
  objc_super v15 = [v13 constraintEqualToAnchor:v14];
  [v24 addObject:v15];

  v16 = [(DBInCallWidgetButton *)self ringView];
  v17 = [v16 topAnchor];
  v18 = [(DBInCallWidgetButton *)self topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v24 addObject:v19];

  v20 = [(DBInCallWidgetButton *)self ringView];
  v21 = [v20 bottomAnchor];
  v22 = [(DBInCallWidgetButton *)self bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v24 addObject:v23];

  [MEMORY[0x263F08938] activateConstraints:v24];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a3;
  id v7 = [(DBInCallWidgetButton *)self ringView];
  v6 = [v5 nextFocusedItem];

  [v7 setFocusRingVisible:v6 == self];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_pressesContainSelect(v6)) {
    [(DBInCallWidgetButton *)self setHighlighted:1];
  }
  v8.receiver = self;
  v8.super_class = (Class)DBInCallWidgetButton;
  [(DBInCallWidgetButton *)&v8 pressesBegan:v6 withEvent:v7];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_pressesContainSelect(v6)) {
    [(DBInCallWidgetButton *)self setHighlighted:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)DBInCallWidgetButton;
  [(DBInCallWidgetButton *)&v8 pressesEnded:v6 withEvent:v7];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_pressesContainSelect(v6)) {
    [(DBInCallWidgetButton *)self setHighlighted:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)DBInCallWidgetButton;
  [(DBInCallWidgetButton *)&v8 pressesCancelled:v6 withEvent:v7];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBInCallWidgetButton;
  [(DBInCallWidgetButton *)&v5 traitCollectionDidChange:a3];
  v4 = [(DBInCallWidgetButton *)self ringView];
  [v4 setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DBInCallWidgetButton;
  -[DBInCallWidgetButton setHighlighted:](&v6, sel_setHighlighted_);
  objc_super v5 = [(DBInCallWidgetButton *)self ringView];
  [v5 setHighlighted:v3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DBInCallWidgetButton;
  -[DBInCallWidgetButton setSelected:](&v7, sel_setSelected_);
  objc_super v5 = [(DBInCallWidgetButton *)self ringView];
  [v5 setSelected:v3];

  if (v3) {
    [MEMORY[0x263F825C8] tableBackgroundColor];
  }
  else {
  objc_super v6 = [MEMORY[0x263F825C8] whiteColor];
  }
  [(DBInCallWidgetButton *)self setTintColor:v6];
}

- (int64_t)inCallButtonType
{
  return self->_inCallButtonType;
}

- (DBInCallWidgetButtonRingView)ringView
{
  return self->_ringView;
}

- (void)setRingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end