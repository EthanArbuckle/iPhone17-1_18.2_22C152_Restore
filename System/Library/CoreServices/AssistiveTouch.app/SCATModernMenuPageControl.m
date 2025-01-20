@interface SCATModernMenuPageControl
- (BOOL)scatIndicatesOwnFocus;
- (SCATModernMenuPageControl)initWithFrame:(CGRect)a3;
- (double)_highlightViewWidth;
- (int64_t)semanticContentAttribute;
- (void)didUpdateScatMenuItemStyle;
- (void)layoutSubviews;
@end

@implementation SCATModernMenuPageControl

- (SCATModernMenuPageControl)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SCATModernMenuPageControl;
  v3 = -[SCATModernMenuPageControl initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SCATModernMenuPageControl *)v3 setAllowsContinuousInteraction:0];
    v5 = -[SCATModernPageControlHighlightView initWithFrame:]([SCATModernPageControlHighlightView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    highlightView = v4->_highlightView;
    v4->_highlightView = v5;

    v7 = +[UIColor clearColor];
    [(SCATModernPageControlHighlightView *)v4->_highlightView setBackgroundColor:v7];

    [(SCATModernPageControlHighlightView *)v4->_highlightView setClipsToBounds:0];
    [(SCATModernMenuPageControl *)v4 setClipsToBounds:0];
    [(SCATModernMenuPageControl *)v4 addSubview:v4->_highlightView];
    [(SCATModernPageControlHighlightView *)v4->_highlightView setAlpha:0.0];
    [(SCATModernPageControlHighlightView *)v4->_highlightView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(SCATModernPageControlHighlightView *)v4->_highlightView centerXAnchor];
    v9 = [(SCATModernMenuPageControl *)v4 centerXAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    v11 = [(SCATModernPageControlHighlightView *)v4->_highlightView centerYAnchor];
    v12 = [(SCATModernMenuPageControl *)v4 centerYAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(SCATModernPageControlHighlightView *)v4->_highlightView heightAnchor];
    v15 = [v14 constraintEqualToConstant:15.0];
    [v15 setActive:1];

    v16 = [(SCATModernPageControlHighlightView *)v4->_highlightView widthAnchor];
    [(SCATModernMenuPageControl *)v4 _highlightViewWidth];
    v17 = objc_msgSend(v16, "constraintEqualToConstant:");
    [(SCATModernPageControlHighlightView *)v4->_highlightView setWidthConstraint:v17];

    v18 = [(SCATModernPageControlHighlightView *)v4->_highlightView widthConstraint];
    [v18 setActive:1];

    [(SCATModernMenuPageControl *)v4 didUpdateScatMenuItemStyle];
  }
  return v4;
}

- (double)_highlightViewWidth
{
  [(SCATModernMenuPageControl *)self intrinsicContentSize];
  return v2 + 8.0;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SCATModernMenuPageControl;
  [(SCATModernMenuPageControl *)&v6 layoutSubviews];
  [(SCATModernMenuPageControl *)self _highlightViewWidth];
  double v4 = v3;
  v5 = [(SCATModernPageControlHighlightView *)self->_highlightView widthConstraint];
  [v5 setConstant:v4];

  [(SCATModernPageControlHighlightView *)self->_highlightView layoutIfNeeded];
}

- (void)didUpdateScatMenuItemStyle
{
  [(SCATModernMenuPageControl *)self setNeedsDisplay];
  switch((unint64_t)[(SCATModernMenuPageControl *)self scatMenuItemStyle])
  {
    case 0uLL:
    case 4uLL:
      highlightView = self->_highlightView;
      double v4 = 0.0;
      goto LABEL_7;
    case 1uLL:
    case 3uLL:
      id v7 = +[SCATStyleProvider sharedStyleProvider];
      v5 = [v7 menuKnockoutColor];
      [(SCATModernMenuPageControl *)self setPageIndicatorTintColor:v5];

      objc_super v6 = [v7 menuKnockoutColor];
      [(SCATModernMenuPageControl *)self setCurrentPageIndicatorTintColor:v6];

      -[SCATModernMenuPageControl _setDrawsAsBackdropOverlayWithBlendMode:](self, "_setDrawsAsBackdropOverlayWithBlendMode:", [v7 menuKnockoutBorderOverlayBlendMode]);
      [v7 menuKnockoutBorderOpacity];
      -[SCATModernMenuPageControl setAlpha:](self, "setAlpha:");
      [(SCATModernPageControlHighlightView *)self->_highlightView setAlpha:0.0];

      break;
    case 2uLL:
      highlightView = self->_highlightView;
      double v4 = 1.0;
LABEL_7:
      [(SCATModernPageControlHighlightView *)highlightView setAlpha:v4];
      [(SCATModernMenuPageControl *)self setPageIndicatorTintColor:0];
      [(SCATModernMenuPageControl *)self setCurrentPageIndicatorTintColor:0];
      [(SCATModernMenuPageControl *)self _setDrawsAsBackdropOverlayWithBlendMode:0];
      break;
    default:
      return;
  }
}

- (int64_t)semanticContentAttribute
{
  double v2 = +[HNDAccessibilityManager sharedManager];
  if ([v2 applicationIsRTL]) {
    int64_t v3 = 4;
  }
  else {
    int64_t v3 = 3;
  }

  return v3;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (void).cxx_destruct
{
}

@end