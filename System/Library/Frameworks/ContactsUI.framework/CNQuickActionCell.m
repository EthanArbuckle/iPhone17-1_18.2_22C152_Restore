@interface CNQuickActionCell
- (BOOL)showBackgroundPlatter;
- (BOOL)showTitle;
- (CNQuickActionButton)button;
- (CNQuickActionCell)initWithFrame:(CGRect)a3;
- (void)setButton:(id)a3;
- (void)setShowBackgroundPlatter:(BOOL)a3;
- (void)setShowTitle:(BOOL)a3;
@end

@implementation CNQuickActionCell

- (void).cxx_destruct
{
}

- (BOOL)showBackgroundPlatter
{
  return self->_showBackgroundPlatter;
}

- (void)setButton:(id)a3
{
}

- (CNQuickActionButton)button
{
  return self->_button;
}

- (BOOL)showTitle
{
  return self->_showTitle;
}

- (void)setShowBackgroundPlatter:(BOOL)a3
{
  if (self->_showBackgroundPlatter != a3)
  {
    BOOL v3 = a3;
    self->_showBackgroundPlatter = a3;
    id v4 = [(CNQuickActionCell *)self button];
    [v4 setShowBackgroundPlatter:v3];
  }
}

- (void)setShowTitle:(BOOL)a3
{
  if (self->_showTitle != a3)
  {
    BOOL v3 = a3;
    self->_showTitle = a3;
    id v4 = [(CNQuickActionCell *)self button];
    [v4 setShowTitle:v3];
  }
}

- (CNQuickActionCell)initWithFrame:(CGRect)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CNQuickActionCell;
  BOOL v3 = -[CNQuickActionCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = objc_alloc_init(CNQuickActionButton);
  [(CNQuickActionButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(CNQuickActionCell *)v3 contentView];
  [v5 addSubview:v4];

  [(CNQuickActionCell *)v3 setButton:v4];
  v13 = @"button";
  v6 = [(CNQuickActionCell *)v3 button];
  v14[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[button]|" options:0 metrics:0 views:v7];
  [v8 addObjectsFromArray:v9];

  v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[button]|" options:0 metrics:0 views:v7];
  [v8 addObjectsFromArray:v10];

  [MEMORY[0x1E4F28DC8] activateConstraints:v8];
  return v3;
}

@end