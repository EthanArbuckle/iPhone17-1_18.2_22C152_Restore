@interface CPUIBarButtonItem
- (CPUIBarButtonItem)initWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 type:(unint64_t)a6;
- (CPUIButtonDelegate)cpui_delegate;
- (UIColor)focusedBackgroundColor;
- (UIColor)focusedColor;
- (UIColor)normalBackgroundColor;
- (UIColor)normalColor;
- (UIFont)font;
- (id)_barButton;
- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4;
- (void)setCpui_delegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusedBackgroundColor:(id)a3;
- (void)setFocusedColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setImage:(id)a3;
- (void)setNormalBackgroundColor:(id)a3;
- (void)setNormalColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CPUIBarButtonItem

- (CPUIBarButtonItem)initWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 type:(unint64_t)a6
{
  v7 = +[CPUIBarButton buttonWithTitle:a3 image:a4 style:a5 type:a6];
  v8 = [(CPUIBarButtonItem *)self initWithCustomView:v7];
  if (v8)
  {
    [v7 sizeToFit];
    objc_msgSend(v7, "setCpui_delegate:", v8);
  }

  return v8;
}

- (id)_barButton
{
  objc_opt_class();
  id v3 = [(CPUIBarButtonItem *)self customView];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (UIFont)font
{
  v2 = [(CPUIBarButtonItem *)self _barButton];
  id v3 = [v2 buttonFont];

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUIBarButtonItem *)self _barButton];
  [v5 setButtonFont:v4];
}

- (UIColor)normalColor
{
  v2 = [(CPUIBarButtonItem *)self _barButton];
  id v3 = [v2 normalColor];

  return (UIColor *)v3;
}

- (void)setNormalColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUIBarButtonItem *)self _barButton];
  [v5 setNormalColor:v4];
}

- (UIColor)focusedColor
{
  v2 = [(CPUIBarButtonItem *)self _barButton];
  id v3 = [v2 focusedColor];

  return (UIColor *)v3;
}

- (void)setFocusedColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUIBarButtonItem *)self _barButton];
  [v5 setFocusedColor:v4];
}

- (UIColor)normalBackgroundColor
{
  v2 = [(CPUIBarButtonItem *)self _barButton];
  id v3 = [v2 normalBackgroundColor];

  return (UIColor *)v3;
}

- (void)setNormalBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUIBarButtonItem *)self _barButton];
  [v5 setNormalBackgroundColor:v4];
}

- (UIColor)focusedBackgroundColor
{
  v2 = [(CPUIBarButtonItem *)self _barButton];
  id v3 = [v2 focusedBackgroundColor];

  return (UIColor *)v3;
}

- (void)setFocusedBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUIBarButtonItem *)self _barButton];
  [v5 setFocusedBackgroundColor:v4];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CPUIBarButtonItem;
  -[CPUIBarButtonItem setEnabled:](&v6, sel_setEnabled_);
  id v5 = [(CPUIBarButtonItem *)self button];
  [v5 setEnabled:v3];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUIBarButtonItem *)self button];
  [v5 setTitle:v4 forState:0];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUIBarButtonItem *)self button];
  objc_super v6 = [(CPUIBarButtonItem *)self normalColor];
  v7 = [v4 _flatImageWithColor:v6];
  [v5 setImage:v7 forState:0];

  id v10 = [(CPUIBarButtonItem *)self button];
  v8 = [(CPUIBarButtonItem *)self focusedColor];
  v9 = [v4 _flatImageWithColor:v8];

  [v10 setImage:v9 forState:8];
}

- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4
{
  objc_super v6 = [(CPUIBarButtonItem *)self cpui_delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CPUIBarButtonItem *)self cpui_delegate];
    [v8 didSelectButton:self withInteractionModel:a4];
  }
}

- (CPUIButtonDelegate)cpui_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cpui_delegate);
  return (CPUIButtonDelegate *)WeakRetained;
}

- (void)setCpui_delegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end