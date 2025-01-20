@interface _UIOverlayWelcomeView
- (UIButton)dismissButton;
- (UILabel)label;
- (UIView)containerView;
- (UIVisualEffectView)backdropView;
- (_UIOverlayWelcomeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation _UIOverlayWelcomeView

- (_UIOverlayWelcomeView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)_UIOverlayWelcomeView;
  v3 = -[_UIOverlayWelcomeView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIVisualEffectView);
    v5 = +[UIBlurEffect effectWithStyle:2];
    v6 = (UIVisualEffectView *)[v4 initWithEffect:v5];
    backdropView = v3->_backdropView;
    v3->_backdropView = v6;

    [(_UIOverlayWelcomeView *)v3 addSubview:v3->_backdropView];
    id v8 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v12 = (UIView *)objc_msgSend(v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    containerView = v3->_containerView;
    v3->_containerView = v12;

    [(_UIOverlayWelcomeView *)v3 addSubview:v3->_containerView];
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v3->_label;
    v3->_label = v14;

    [(UILabel *)v3->_label setText:@"Welcome to the overlay!"];
    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
    [(UILabel *)v3->_label setFont:v16];

    v17 = +[UIColor whiteColor];
    [(UILabel *)v3->_label setTextColor:v17];

    [(UILabel *)v3->_label setTextAlignment:1];
    [(UIView *)v3->_containerView addSubview:v3->_label];
    v18 = +[UIButtonConfiguration filledButtonConfiguration];
    [v18 setTitle:@"Dismiss Overlay"];
    uint64_t v19 = +[UIButton buttonWithConfiguration:v18 primaryAction:0];
    dismissButton = v3->_dismissButton;
    v3->_dismissButton = (UIButton *)v19;

    [(UIView *)v3->_containerView addSubview:v3->_dismissButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)_UIOverlayWelcomeView;
  [(_UIOverlayWelcomeView *)&v29 layoutSubviews];
  [(_UIOverlayWelcomeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIVisualEffectView setFrame:](self->_backdropView, "setFrame:");
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v4, v6);
  -[UILabel setFrame:](self->_label, "setFrame:", CGPointZero.x, CGPointZero.y, v7, v8);
  [(UILabel *)self->_label frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  -[UIButton sizeThatFits:](self->_dismissButton, "sizeThatFits:", v4, v6);
  double v18 = v17;
  double v20 = v19;
  [(UILabel *)self->_label frame];
  -[UIButton setFrame:](self->_dismissButton, "setFrame:", 0.0, CGRectGetMaxY(v30) + 30.0, v18, v20);
  [(UIButton *)self->_dismissButton frame];
  v33.origin.double x = v21;
  v33.origin.double y = v22;
  v33.size.double width = v23;
  v33.size.double height = v24;
  v31.origin.double x = v10;
  v31.origin.double y = v12;
  v31.size.double width = v14;
  v31.size.double height = v16;
  CGRect v32 = CGRectUnion(v31, v33);
  double x = v32.origin.x;
  double y = v32.origin.y;
  double width = v32.size.width;
  double height = v32.size.height;
  [(UILabel *)self->_label frame];
  UIRectCenteredXInRect();
  -[UILabel setFrame:](self->_label, "setFrame:");
  [(UIButton *)self->_dismissButton frame];
  UIRectCenteredXInRect();
  -[UIButton setFrame:](self->_dismissButton, "setFrame:");
  -[UIView setFrame:](self->_containerView, "setFrame:", x, y, width, height);
  [(UIView *)self->_containerView frame];
  UIRectCenteredRect();
  -[UIView setFrame:](self->_containerView, "setFrame:");
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end