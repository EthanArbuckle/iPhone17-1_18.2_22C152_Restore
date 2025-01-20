@interface CNQuickActionButton
- (BOOL)showBackgroundPlatter;
- (BOOL)showTitle;
- (CNQuickAction)action;
- (CNQuickActionButton)initWithFrame:(CGRect)a3;
- (CNQuickActionButtonDelegate)delegate;
- (NSArray)activatedConstraints;
- (UIButton)button;
- (UILabel)label;
- (void)onLongPress:(id)a3;
- (void)performAction;
- (void)setAction:(id)a3;
- (void)setActivatedConstraints:(id)a3;
- (void)setButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setShowBackgroundPlatter:(BOOL)a3;
- (void)setShowTitle:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation CNQuickActionButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setActivatedConstraints:(id)a3
{
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setLabel:(id)a3
{
}

- (void)setButton:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (CNQuickActionButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNQuickActionButtonDelegate *)WeakRetained;
}

- (BOOL)showBackgroundPlatter
{
  return self->_showBackgroundPlatter;
}

- (BOOL)showTitle
{
  return self->_showTitle;
}

- (CNQuickAction)action
{
  return self->_action;
}

- (UILabel)label
{
  label = self->_label;
  if (!label)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_label;
    self->_label = v5;

    [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)self->_label setFont:v7];

    [(UILabel *)self->_label setNumberOfLines:1];
    v8 = [(CNQuickActionButton *)self tintColor];
    [(UILabel *)self->_label setTextColor:v8];

    label = self->_label;
  }
  [(CNQuickActionButton *)self addSubview:label];
  v9 = [(CNQuickActionButton *)self action];
  v10 = [v9 titleForContext:0];
  [(UILabel *)self->_label setText:v10];

  [(UILabel *)self->_label sizeToFit];
  v11 = self->_label;

  return v11;
}

- (UIButton)button
{
  button = self->_button;
  if (!button)
  {
    objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithType:");
    id v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_button;
    self->_button = v4;

    [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    button = self->_button;
  }
  [(CNQuickActionButton *)self addSubview:button];
  v6 = self->_button;

  return v6;
}

- (void)onLongPress:(id)a3
{
  if ([a3 state] == 1)
  {
    id v4 = [(CNQuickActionButton *)self action];
    [v4 setIsLongPress:1];

    [(CNQuickActionButton *)self performAction];
    id v5 = [(CNQuickActionButton *)self action];
    [v5 setIsLongPress:0];
  }
}

- (void)performAction
{
  v3 = [(CNQuickActionButton *)self action];
  if (v3)
  {
    id v7 = v3;
    [v3 setSourceView:self];
    id v4 = [(CNQuickActionButton *)self delegate];
    id v5 = [(CNQuickActionButton *)self action];
    char v6 = [v4 quickActionButton:self performAction:v5];

    if ((v6 & 1) == 0) {
      [v7 perform];
    }
    [v7 setSourceView:0];
    v3 = v7;
  }
}

- (void)updateConstraints
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)CNQuickActionButton;
  [(CNQuickActionButton *)&v23 updateConstraints];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(CNQuickActionButton *)self activatedConstraints];
  [v3 deactivateConstraints:v4];

  id v5 = [MEMORY[0x1E4F1CA48] array];
  char v6 = (void *)MEMORY[0x1E4F1CA60];
  v24 = @"button";
  id v7 = [(CNQuickActionButton *)self button];
  v25[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v9 = [v6 dictionaryWithDictionary:v8];

  v10 = (void *)MEMORY[0x1E4F28DC8];
  v11 = [(CNQuickActionButton *)self button];
  v12 = [v10 constraintWithItem:v11 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:37.0];
  [v5 addObject:v12];

  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = [(CNQuickActionButton *)self button];
  v15 = [v13 constraintWithItem:v14 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:37.0];
  [v5 addObject:v15];

  if ([(CNQuickActionButton *)self showTitle])
  {
    v16 = [(CNQuickActionButton *)self label];
    [v9 setObject:v16 forKey:@"label"];

    v17 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[button]-[label]|" options:512 metrics:0 views:v9];
    [v5 addObjectsFromArray:v17];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(CNQuickActionButton *)self button];
    v20 = [v18 constraintWithItem:v19 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    [v5 addObject:v20];

    v21 = (void *)MEMORY[0x1E4F28DC8];
    v17 = [(CNQuickActionButton *)self button];
    v22 = [v21 constraintWithItem:v17 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v22];
  }
  [(CNQuickActionButton *)self setActivatedConstraints:v5];
  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
}

- (void)setShowBackgroundPlatter:(BOOL)a3
{
  if (self->_showBackgroundPlatter != a3)
  {
    self->_showBackgroundPlatter = a3;
    id v4 = +[CNContactStyle currentStyle];
    id v5 = [v4 transportBackgroundColor];
    char v6 = [(CNQuickActionButton *)self button];
    [v6 setBackgroundColor:v5];

    id v7 = [(CNQuickActionButton *)self button];
    v8 = [v7 _screen];
    [v8 scale];
    if (v9 == 0.0)
    {
      if (RoundToScale_onceToken != -1) {
        dispatch_once(&RoundToScale_onceToken, &__block_literal_global_33);
      }
      double v9 = *(double *)&RoundToScale___s;
    }
    double v10 = 19.0;
    if (v9 != 1.0) {
      double v10 = round(v9 * 18.5) / v9;
    }

    v11 = [(CNQuickActionButton *)self button];
    v12 = [v11 layer];
    [v12 setCornerRadius:v10];

    v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    double v15 = 1.0 / v14;
    v16 = [(CNQuickActionButton *)self button];
    v17 = [v16 layer];
    [v17 setBorderWidth:v15];

    id v22 = +[CNContactStyle currentStyle];
    id v18 = [v22 transportBorderColor];
    uint64_t v19 = [v18 CGColor];
    v20 = [(CNQuickActionButton *)self button];
    v21 = [v20 layer];
    [v21 setBorderColor:v19];
  }
}

- (void)setShowTitle:(BOOL)a3
{
  self->_showTitle = a3;
  [(CNQuickActionButton *)self setNeedsUpdateConstraints];
}

- (void)setAction:(id)a3
{
  id v7 = (CNQuickAction *)a3;
  if (self->_action != v7)
  {
    objc_storeStrong((id *)&self->_action, a3);
    id v5 = [(CNQuickAction *)v7 imageForContext:5];
    char v6 = [(CNQuickActionButton *)self button];
    [v6 setImage:v5 forState:0];
  }
}

- (CNQuickActionButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CNQuickActionButton;
  v3 = -[CNQuickActionButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = [(CNQuickActionButton *)v3 button];
  [v4 addTarget:v3 action:sel_performAction forControlEvents:64];

  id v5 = [(CNQuickActionButton *)v3 button];
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v3 action:sel_onLongPress_];
  [v5 addGestureRecognizer:v6];

  id v7 = [(CNQuickActionButton *)v3 button];
  v8 = [v7 imageView];
  [v8 setContentMode:1];

  double v9 = +[CNUIColorRepository quickActionButtonTintColor];
  double v10 = [(CNQuickActionButton *)v3 button];
  v11 = [v10 imageView];
  [v11 setTintColor:v9];

  return v3;
}

@end