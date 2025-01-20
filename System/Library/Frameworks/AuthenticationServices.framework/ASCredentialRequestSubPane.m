@interface ASCredentialRequestSubPane
- (ASCredentialRequestSubPane)initWithView:(id)a3;
- (UIView)view;
- (double)customSpacingAfter;
- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5;
- (void)setCustomSpacingAfter:(double)a3;
@end

@implementation ASCredentialRequestSubPane

- (ASCredentialRequestSubPane)initWithView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestSubPane;
  v6 = [(ASCredentialRequestSubPane *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_view, a3);
    v8 = v7;
  }

  return v7;
}

- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5
{
  objc_msgSend(a3, "addArrangedSubview:", self->_view, a5);

  [(ASCredentialRequestSubPane *)self setCustomSpacingAfter:a4];
}

- (void)setCustomSpacingAfter:(double)a3
{
  if (self->_customSpacingAfter != a3)
  {
    self->_customSpacingAfter = a3;
    id v5 = [(UIView *)self->_view superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 setCustomSpacing:self->_view afterView:a3];
    }
  }
}

- (UIView)view
{
  return self->_view;
}

- (double)customSpacingAfter
{
  return self->_customSpacingAfter;
}

- (void).cxx_destruct
{
}

@end