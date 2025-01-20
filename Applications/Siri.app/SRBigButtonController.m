@interface SRBigButtonController
- (BOOL)usePlatterStyle;
- (UIEdgeInsets)defaultViewInsets;
- (double)desiredHeightForWidth:(double)a3;
- (id)snippet;
- (void)_bigButtonHit:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setAceObject:(id)a3;
@end

@implementation SRBigButtonController

- (void)dealloc
{
  v3 = [(SRBigButtonView *)self->_buttonView button];
  [v3 removeTarget:self action:"_bigButtonHit:" forControlEvents:64];

  v4.receiver = self;
  v4.super_class = (Class)SRBigButtonController;
  [(SRBigButtonController *)&v4 dealloc];
}

- (void)setAceObject:(id)a3
{
  objc_super v4 = (SAUIButton *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SRBigButtonController;
  [(SRBigButtonController *)&v6 setAceObject:v4];
  buttonObject = self->_buttonObject;
  self->_buttonObject = v4;
}

- (id)snippet
{
  return 0;
}

- (UIEdgeInsets)defaultViewInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)usePlatterStyle
{
  return 1;
}

- (void)loadView
{
  if (!self->_buttonView)
  {
    v3 = -[SRBigButtonView initWithFrame:]([SRBigButtonView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    buttonView = self->_buttonView;
    self->_buttonView = v3;

    v5 = [(SRBigButtonView *)self->_buttonView button];
    objc_super v6 = [(SAUIButton *)self->_buttonObject text];
    [v5 setTitle:v6 forState:0];

    v7 = [(SRBigButtonView *)self->_buttonView button];
    [v7 addTarget:self action:"_bigButtonHit:" forControlEvents:64];

    v8 = [(SRBigButtonView *)self->_buttonView button];
    v9 = [v8 layer];
    [v9 setCornerRadius:9.0];

    v10 = [(SRBigButtonView *)self->_buttonView button];
    [v10 setRole:0];

    v11 = self->_buttonView;
    [(SRBigButtonController *)self setView:v11];
  }
}

- (double)desiredHeightForWidth:(double)a3
{
  objc_super v4 = [(SRBigButtonController *)self view];
  [v4 sizeThatFits:a3];
  double v6 = v5;

  return v6;
}

- (void)_bigButtonHit:(id)a3
{
  id v5 = [(SRBigButtonController *)self delegate];
  objc_super v4 = [(SAUIButton *)self->_buttonObject commands];
  [v5 siriViewController:self performAceCommands:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonObject, 0);

  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end