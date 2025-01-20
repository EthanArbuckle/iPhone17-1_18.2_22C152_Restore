@interface CPSButton
- (CPSButton)initWithFrame:(CGRect)a3;
- (CPSButtonDelegate)delegate;
- (NSUUID)identifier;
- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CPSButton

- (CPSButton)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSButton;
  v7 = -[CPSButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  if (v7) {
    [(CPUIButton *)v7 setCpui_delegate:v7];
  }
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v6 = +[CPSUtilities sharedInstance];
  [(CPSUtilities *)v6 setLastButtonPressInteractionModel:a4];

  v7 = [(CPSButton *)v10 delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v4 = [(CPSButton *)v10 delegate];
    [(CPSButtonDelegate *)v4 didSelectButton:v10];
  }
  objc_storeStrong(location, 0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CPSButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end