@interface SRSpeechAlternativeCellView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)responseText;
- (SRSpeechAlternativeCellView)initWithTitle:(id)a3;
- (UIEdgeInsets)edgeInsets;
- (void)setResponseText:(id)a3;
- (void)updateConstraints;
@end

@implementation SRSpeechAlternativeCellView

- (SRSpeechAlternativeCellView)initWithTitle:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SRSpeechAlternativeCellView;
  v6 = [(SRSpeechAlternativeCellView *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_titleString, a3);
    v8 = (UIView *)objc_alloc_init((Class)UIView);
    containerView = v7->_containerView;
    v7->_containerView = v8;

    [(SRSpeechAlternativeCellView *)v7 addSubview:v7->_containerView];
    [(UIView *)v7->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v10 = +[SiriSharedUIContentLabel label];
    displayTextLabel = v7->_displayTextLabel;
    v7->_displayTextLabel = (UILabel *)v10;

    [(UILabel *)v7->_displayTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = v7->_displayTextLabel;
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
    [(UILabel *)v12 setFont:v13];

    [(UILabel *)v7->_displayTextLabel setAttributedText:v5];
    [(UILabel *)v7->_displayTextLabel setNumberOfLines:0];
    [(UIView *)v7->_containerView addSubview:v7->_displayTextLabel];
    [(SRSpeechAlternativeCellView *)v7 setNeedsUpdateConstraints];
  }

  return v7;
}

- (UIEdgeInsets)edgeInsets
{
  int IsRTL = SiriLanguageIsRTL();
  double v4 = SiriUIPlatterStyle[24];
  double v3 = SiriUIPlatterStyle[25];
  double v5 = SiriUIPlatterStyle[22];
  if (IsRTL) {
    double v6 = SiriUIPlatterStyle[23];
  }
  else {
    double v6 = SiriUIPlatterStyle[25];
  }
  if (!IsRTL) {
    double v3 = SiriUIPlatterStyle[23];
  }
  result.right = v6;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SRSpeechAlternativeCellView *)self bounds];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UILabel sizeThatFits:](self->_displayTextLabel, "sizeThatFits:", a3.width - (SiriUIPlatterStyle[23] + SiriUIPlatterStyle[25]), 1.79769313e308);
  double v5 = v4 + SiriUIPlatterStyle[22] + SiriUIPlatterStyle[24];
  double v6 = SiriUIPlatterStyle[26];
  if (v5 >= v6) {
    double v6 = v5;
  }
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)updateConstraints
{
  v13.receiver = self;
  v13.super_class = (Class)SRSpeechAlternativeCellView;
  [(SRSpeechAlternativeCellView *)&v13 updateConstraints];
  if (!self->_hasSetUpConstraints)
  {
    double v3 = _NSDictionaryOfVariableBindings(@"_containerView", self->_containerView, 0);
    double v4 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_containerView]|" options:0 metrics:0 views:v3];
    [(SRSpeechAlternativeCellView *)self addConstraints:v4];

    double v5 = _NSDictionaryOfVariableBindings(@"_containerView", self->_containerView, 0);
    double v6 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_containerView]|" options:0 metrics:0 views:v5];
    [(SRSpeechAlternativeCellView *)self addConstraints:v6];

    displayTextLabel = self->_displayTextLabel;
    if (displayTextLabel)
    {
      containerView = self->_containerView;
      v9 = _NSDictionaryOfVariableBindings(@"_displayTextLabel", displayTextLabel, 0);
      CGFloat v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_displayTextLabel]|" options:0 metrics:0 views:v9];
      [(UIView *)containerView addConstraints:v10];

      CGFloat v11 = self->_displayTextLabel;
      if (v11)
      {
        v12 = +[NSLayoutConstraint constraintWithItem:v11 attribute:10 relatedBy:0 toItem:self->_containerView attribute:10 multiplier:1.0 constant:0.0];
        [(SRSpeechAlternativeCellView *)self addConstraint:v12];
      }
    }
    self->_hasSetUpConstraints = 1;
  }
}

- (NSString)responseText
{
  return self->_responseText;
}

- (void)setResponseText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseText, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_displayTextLabel, 0);
}

@end