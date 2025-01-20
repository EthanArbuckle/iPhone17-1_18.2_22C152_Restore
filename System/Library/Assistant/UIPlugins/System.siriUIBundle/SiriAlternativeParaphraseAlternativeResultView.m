@interface SiriAlternativeParaphraseAlternativeResultView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)commands;
- (NSString)responseText;
- (SiriAlternativeParaphraseAlternativeResultView)initWithAlternativeResult:(id)a3;
- (UIEdgeInsets)edgeInsets;
- (void)setCommands:(id)a3;
- (void)setResponseText:(id)a3;
- (void)updateConstraints;
@end

@implementation SiriAlternativeParaphraseAlternativeResultView

- (SiriAlternativeParaphraseAlternativeResultView)initWithAlternativeResult:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SiriAlternativeParaphraseAlternativeResultView;
  v5 = [(SiriAlternativeParaphraseAlternativeResultView *)&v25 init];
  if (v5)
  {
    v6 = [v4 command];

    if (v6)
    {
      v7 = [v4 command];
      v26 = v7;
      v8 = +[NSArray arrayWithObjects:&v26 count:1];
      [(SiriAlternativeParaphraseAlternativeResultView *)v5 setCommands:v8];
    }
    else
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_DC24((uint64_t)v4, v9);
      }
      [(SiriAlternativeParaphraseAlternativeResultView *)v5 setCommands:&__NSArray0__struct];
    }
    v10 = [v4 displayText];
    v11 = +[NSCharacterSet punctuationCharacterSet];
    v12 = [v10 stringByTrimmingCharactersInSet:v11];
    [(SiriAlternativeParaphraseAlternativeResultView *)v5 setResponseText:v12];

    v13 = (UIView *)objc_alloc_init((Class)UIView);
    containerView = v5->_containerView;
    v5->_containerView = v13;

    [(SiriAlternativeParaphraseAlternativeResultView *)v5 addSubview:v5->_containerView];
    [(UIView *)v5->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [v4 displayText];

    if (v15)
    {
      uint64_t v16 = +[SiriSharedUIContentLabel label];
      displayTextLabel = v5->_displayTextLabel;
      v5->_displayTextLabel = (UILabel *)v16;

      [(UILabel *)v5->_displayTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v18 = v5->_displayTextLabel;
      v19 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [(UILabel *)v18 setFont:v19];

      v20 = v5->_displayTextLabel;
      v21 = [v4 displayText];
      [(UILabel *)v20 setText:v21];

      v22 = v5->_displayTextLabel;
      v23 = +[UIColor siriui_textColor];
      [(UILabel *)v22 setTextColor:v23];

      [(UIView *)v5->_containerView addSubview:v5->_displayTextLabel];
    }
    [(SiriAlternativeParaphraseAlternativeResultView *)v5 setNeedsUpdateConstraints];
  }

  return v5;
}

- (UIEdgeInsets)edgeInsets
{
  double v2 = SiriUIPlatterStyle[32];
  double v3 = SiriUIPlatterStyle[34];
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UILabel sizeThatFits:](self->_displayTextLabel, "sizeThatFits:", a3.width, 1.79769313e308);
  double v5 = v4 + 24.0;
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
  v13.super_class = (Class)SiriAlternativeParaphraseAlternativeResultView;
  [(SiriAlternativeParaphraseAlternativeResultView *)&v13 updateConstraints];
  if (!self->_hasSetUpConstraints)
  {
    double v3 = _NSDictionaryOfVariableBindings(@"_containerView", self->_containerView, 0);
    double v4 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_containerView]|" options:0 metrics:0 views:v3];
    [(SiriAlternativeParaphraseAlternativeResultView *)self addConstraints:v4];

    double v5 = _NSDictionaryOfVariableBindings(@"_containerView", self->_containerView, 0);
    double v6 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_containerView]|" options:0 metrics:0 views:v5];
    [(SiriAlternativeParaphraseAlternativeResultView *)self addConstraints:v6];

    displayTextLabel = self->_displayTextLabel;
    if (displayTextLabel)
    {
      containerView = self->_containerView;
      v9 = _NSDictionaryOfVariableBindings(@"_displayTextLabel", displayTextLabel, 0);
      v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_displayTextLabel]|" options:0 metrics:0 views:v9];
      [(UIView *)containerView addConstraints:v10];

      v11 = self->_displayTextLabel;
      if (v11)
      {
        v12 = +[NSLayoutConstraint constraintWithItem:v11 attribute:10 relatedBy:0 toItem:self->_containerView attribute:10 multiplier:1.0 constant:0.0];
        [(SiriAlternativeParaphraseAlternativeResultView *)self addConstraint:v12];
      }
    }
    self->_hasSetUpConstraints = 1;
  }
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
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
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_displayTextLabel, 0);
}

@end