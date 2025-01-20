@interface SRBigButtonView
- (BOOL)suppressVibrantBackground;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRBigButtonView)initWithFrame:(CGRect)a3;
- (SiriUIContentButton)button;
- (UIEdgeInsets)edgeInsets;
- (void)layoutSubviews;
- (void)viewInsetsInConversationView:(UIEdgeInsets)a3;
@end

@implementation SRBigButtonView

- (SRBigButtonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SRBigButtonView;
  v3 = -[SRBigButtonView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SiriUIContentButton buttonWithMediumWeightFont];
    button = v3->_button;
    v3->_button = (SiriUIContentButton *)v4;

    *(_OWORD *)&v3->_edgeInsets.top = 0u;
    *(_OWORD *)&v3->_edgeInsets.bottom = 0u;
    [(SRBigButtonView *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SRBigButtonView;
  [(SRBigButtonView *)&v13 layoutSubviews];
  [(SRBigButtonView *)self bounds];
  double top = self->_edgeInsets.top;
  if (top == 0.0)
  {
    *(CGRect *)&double v9 = CGRectInset(*(CGRect *)&v3, 16.0, 16.0);
  }
  else
  {
    double left = self->_edgeInsets.left;
    double v9 = v3 + left;
    double v10 = v4 + top;
    double v11 = v5 - (left + self->_edgeInsets.right);
    double v12 = v6 - (top + self->_edgeInsets.bottom);
  }
  -[SiriUIContentButton setFrame:](self->_button, "setFrame:", v9, v10, v11, v12);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = [(SRBigButtonView *)self traitCollection];
  if ([v5 isAmbientPresented]) {
    double v6 = 64.0;
  }
  else {
    double v6 = 79.0;
  }

  double top = self->_edgeInsets.top;
  if (top != 0.0) {
    double v6 = v6 - (top + self->_edgeInsets.bottom);
  }
  double v8 = width;
  double v9 = v6;
  result.height = v9;
  result.CGFloat width = v8;
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

- (SiriUIContentButton)button
{
  return self->_button;
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
}

@end