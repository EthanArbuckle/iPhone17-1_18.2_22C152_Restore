@interface ACAssistantConfirmView
- (ACAssistantConfirmView)initWithFrame:(CGRect)a3;
- (BOOL)_showsConfirmButton;
- (BOOL)suppressVibrantBackground;
- (CGSize)sizeThatFits:(CGSize)result;
- (SiriUIContentButton)cancelButton;
- (SiriUIContentButton)confirmButton;
- (UIEdgeInsets)edgeInsets;
- (void)_hideConfirmButton;
- (void)_showConfirmButton;
- (void)layoutSubviews;
- (void)setCancelText:(id)a3;
- (void)setConfirmText:(id)a3;
- (void)viewInsetsInConversationView:(UIEdgeInsets)a3;
@end

@implementation ACAssistantConfirmView

- (ACAssistantConfirmView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ACAssistantConfirmView;
  v3 = -[ACAssistantConfirmView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SiriUIContentButton buttonWithLightWeightFont];
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (SiriUIContentButton *)v4;

    v6 = [(SiriUIContentButton *)v3->_cancelButton layer];
    [v6 setCornerRadius:9.0];

    [(SiriUIContentButton *)v3->_cancelButton setRole:0];
    [(ACAssistantConfirmView *)v3 addSubview:v3->_cancelButton];
    uint64_t v7 = +[SiriUIContentButton buttonWithMediumWeightFont];
    confirmButton = v3->_confirmButton;
    v3->_confirmButton = (SiriUIContentButton *)v7;

    v9 = [(SiriUIContentButton *)v3->_confirmButton layer];
    [v9 setCornerRadius:9.0];

    [(SiriUIContentButton *)v3->_confirmButton setRole:0];
    [(ACAssistantConfirmView *)v3 addSubview:v3->_confirmButton];
    *(_OWORD *)&v3->_edgeInsets.top = 0u;
    *(_OWORD *)&v3->_edgeInsets.bottom = 0u;
  }
  return v3;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)ACAssistantConfirmView;
  [(ACAssistantConfirmView *)&v17 layoutSubviews];
  [(ACAssistantConfirmView *)self bounds];
  double top = self->_edgeInsets.top;
  if (top == 0.0)
  {
    CGRect v18 = CGRectInset(*(CGRect *)&v3, 16.0, 16.0);
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
  }
  else
  {
    double left = self->_edgeInsets.left;
    double x = v3 + left;
    double y = v4 + top;
    double width = v5 - (left + self->_edgeInsets.right);
    double height = v6 - (top + self->_edgeInsets.bottom);
  }
  double v13 = width * 0.5;
  if ([(ACAssistantConfirmView *)self _showsConfirmButton])
  {
    double v14 = v13 + -8.0;
  }
  else
  {
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    double v14 = CGRectGetWidth(v19);
  }
  v15 = (int *)[(ACAssistantConfirmView *)self semanticContentAttribute];
  if (v15 == &dword_4) {
    double v16 = v13 + 16.0;
  }
  else {
    double v16 = x;
  }
  if (v15 != &dword_4) {
    double x = v13 + 16.0;
  }
  -[SiriUIContentButton setFrame:](self->_cancelButton, "setFrame:", v16, y, v14, height);
  -[SiriUIContentButton setFrame:](self->_confirmButton, "setFrame:", x, y, v14, height);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 72.0 - self->_edgeInsets.top;
  result.double height = v3;
  return result;
}

- (BOOL)suppressVibrantBackground
{
  return 1;
}

- (void)viewInsetsInConversationView:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void)setCancelText:(id)a3
{
  [(SiriUIContentButton *)self->_cancelButton setTitle:a3 forState:0];

  [(ACAssistantConfirmView *)self setNeedsLayout];
}

- (BOOL)_showsConfirmButton
{
  v2 = self;
  double v3 = [(SiriUIContentButton *)self->_confirmButton superview];
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (void)_showConfirmButton
{
  if (![(ACAssistantConfirmView *)self _showsConfirmButton])
  {
    [(ACAssistantConfirmView *)self addSubview:self->_confirmButton];
    verticalKeyline = self->_verticalKeyline;
    [(ACAssistantConfirmView *)self addSubview:verticalKeyline];
  }
}

- (void)_hideConfirmButton
{
  if ([(ACAssistantConfirmView *)self _showsConfirmButton])
  {
    [(SiriUIContentButton *)self->_confirmButton removeFromSuperview];
    verticalKeyline = self->_verticalKeyline;
    [(SiriUIKeyline *)verticalKeyline removeFromSuperview];
  }
}

- (void)setConfirmText:(id)a3
{
  [(SiriUIContentButton *)self->_confirmButton setTitle:a3 forState:0];
  double v4 = [(SiriUIContentButton *)self->_confirmButton titleForState:0];
  id v5 = [v4 length];

  if (v5)
  {
    [(ACAssistantConfirmView *)self _showConfirmButton];
  }
  else
  {
    [(ACAssistantConfirmView *)self _hideConfirmButton];
  }
}

- (SiriUIContentButton)cancelButton
{
  return self->_cancelButton;
}

- (SiriUIContentButton)confirmButton
{
  return self->_confirmButton;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);

  objc_storeStrong((id *)&self->_verticalKeyline, 0);
}

@end