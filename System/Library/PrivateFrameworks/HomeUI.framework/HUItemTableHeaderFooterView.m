@interface HUItemTableHeaderFooterView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)includeBottomSpacing;
- (HUItemTableHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (NSArray)constraints;
- (NSAttributedString)attributedMessage;
- (NSLayoutConstraint)bottomSpacingConstraint;
- (NSString)message;
- (UITextView)messageTextView;
- (double)_bottomSpacing;
- (unint64_t)numberOfLines;
- (void)setAttributedMessage:(id)a3;
- (void)setBottomSpacingConstraint:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setIncludeBottomSpacing:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setMessageTextView:(id)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)updateConstraints;
@end

@implementation HUItemTableHeaderFooterView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUItemTableHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HUItemTableHeaderFooterView;
  v3 = [(HUItemTableHeaderFooterView *)&v21 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = objc_opt_new();
    [(HUItemTableHeaderFooterView *)v3 setMessageTextView:v4];

    v5 = [(HUItemTableHeaderFooterView *)v3 messageTextView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(HUItemTableHeaderFooterView *)v3 messageTextView];
    [v6 setEditable:0];

    v7 = [(HUItemTableHeaderFooterView *)v3 messageTextView];
    [v7 _setInteractiveTextSelectionDisabled:1];

    v8 = [(HUItemTableHeaderFooterView *)v3 messageTextView];
    [v8 setScrollEnabled:0];

    double v9 = *MEMORY[0x1E4F437F8];
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    v13 = [(HUItemTableHeaderFooterView *)v3 messageTextView];
    objc_msgSend(v13, "setTextContainerInset:", v9, v10, v11, v12);

    v14 = [(HUItemTableHeaderFooterView *)v3 messageTextView];
    v15 = [v14 textContainer];
    [v15 setLineFragmentPadding:0.0];

    v16 = [MEMORY[0x1E4F428B8] clearColor];
    v17 = [(HUItemTableHeaderFooterView *)v3 messageTextView];
    [v17 setBackgroundColor:v16];

    v18 = [(HUItemTableHeaderFooterView *)v3 contentView];
    v19 = [(HUItemTableHeaderFooterView *)v3 messageTextView];
    [v18 addSubview:v19];

    v3->_includeBottomSpacing = 1;
  }
  return v3;
}

- (void)setAttributedMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableHeaderFooterView *)self messageTextView];
  [v5 setAttributedText:v4];
}

- (NSAttributedString)attributedMessage
{
  v2 = [(HUItemTableHeaderFooterView *)self messageTextView];
  v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableHeaderFooterView *)self messageTextView];
  [v5 setText:v4];
}

- (NSString)message
{
  v2 = [(HUItemTableHeaderFooterView *)self messageTextView];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  id v5 = [(HUItemTableHeaderFooterView *)self messageTextView];
  id v4 = [v5 textContainer];
  [v4 setMaximumNumberOfLines:a3];
}

- (unint64_t)numberOfLines
{
  v2 = [(HUItemTableHeaderFooterView *)self messageTextView];
  v3 = [v2 textContainer];
  unint64_t v4 = [v3 maximumNumberOfLines];

  return v4;
}

- (void)setIncludeBottomSpacing:(BOOL)a3
{
  self->_includeBottomSpacing = a3;
  [(HUItemTableHeaderFooterView *)self _bottomSpacing];
  double v5 = -v4;
  id v6 = [(HUItemTableHeaderFooterView *)self bottomSpacingConstraint];
  [v6 setConstant:v5];
}

- (double)_bottomSpacing
{
  BOOL v2 = [(HUItemTableHeaderFooterView *)self includeBottomSpacing];
  double result = 35.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (void)updateConstraints
{
  v3 = [(HUItemTableHeaderFooterView *)self constraints];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x1E4F28DC8];
    double v5 = [(HUItemTableHeaderFooterView *)self constraints];
    [v4 deactivateConstraints:v5];
  }
  id v6 = objc_opt_new();
  v7 = [(HUItemTableHeaderFooterView *)self messageTextView];
  v8 = [v7 leadingAnchor];
  double v9 = [(HUItemTableHeaderFooterView *)self contentView];
  double v10 = [v9 readableContentGuide];
  double v11 = [v10 leadingAnchor];
  double v12 = [v8 constraintEqualToAnchor:v11];
  [v6 addObject:v12];

  v13 = [(HUItemTableHeaderFooterView *)self messageTextView];
  v14 = [v13 trailingAnchor];
  v15 = [(HUItemTableHeaderFooterView *)self contentView];
  v16 = [v15 readableContentGuide];
  v17 = [v16 trailingAnchor];
  v18 = [v14 constraintEqualToAnchor:v17];
  [v6 addObject:v18];

  v19 = [(HUItemTableHeaderFooterView *)self messageTextView];
  v20 = [v19 firstBaselineAnchor];
  objc_super v21 = [(HUItemTableHeaderFooterView *)self contentView];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:46.0];
  [v6 addObject:v23];

  v24 = [(HUItemTableHeaderFooterView *)self messageTextView];
  v25 = [v24 lastBaselineAnchor];
  v26 = [(HUItemTableHeaderFooterView *)self contentView];
  v27 = [v26 bottomAnchor];
  [(HUItemTableHeaderFooterView *)self _bottomSpacing];
  v29 = [v25 constraintEqualToAnchor:v27 constant:-v28];
  [(HUItemTableHeaderFooterView *)self setBottomSpacingConstraint:v29];

  v30 = [(HUItemTableHeaderFooterView *)self bottomSpacingConstraint];
  [v6 addObject:v30];

  [MEMORY[0x1E4F28DC8] activateConstraints:v6];
  [(HUItemTableHeaderFooterView *)self setConstraints:v6];
  v31.receiver = self;
  v31.super_class = (Class)HUItemTableHeaderFooterView;
  [(HUItemTableHeaderFooterView *)&v31 updateConstraints];
}

- (UITextView)messageTextView
{
  return self->_messageTextView;
}

- (void)setMessageTextView:(id)a3
{
}

- (BOOL)includeBottomSpacing
{
  return self->_includeBottomSpacing;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSLayoutConstraint)bottomSpacingConstraint
{
  return self->_bottomSpacingConstraint;
}

- (void)setBottomSpacingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_messageTextView, 0);
}

@end