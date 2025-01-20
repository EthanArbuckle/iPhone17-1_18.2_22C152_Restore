@interface CNAddressComponentSplitTextFieldCell
+ (Class)containerViewClass;
+ (id)cellIdentifier;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (CNAddressComponentSplitTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNRepeatingGradientSeparatorView)separator;
- (UITextField)textFieldLeft;
- (UITextField)textFieldRight;
- (id)newSeparatorView;
- (id)textAttributes;
- (id)textFields;
- (void)setSeparator:(id)a3;
- (void)setTextAttributes:(id)a3;
- (void)setTextFieldLeft:(id)a3;
- (void)setTextFieldRight:(id)a3;
- (void)setupTextFields;
@end

@implementation CNAddressComponentSplitTextFieldCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_textFieldRight, 0);

  objc_storeStrong((id *)&self->_textFieldLeft, 0);
}

- (void)setSeparator:(id)a3
{
}

- (CNRepeatingGradientSeparatorView)separator
{
  return self->_separator;
}

- (void)setTextFieldRight:(id)a3
{
}

- (UITextField)textFieldRight
{
  return self->_textFieldRight;
}

- (void)setTextFieldLeft:(id)a3
{
}

- (UITextField)textFieldLeft
{
  return self->_textFieldLeft;
}

- (id)textAttributes
{
  v2 = [(CNAddressComponentSplitTextFieldCell *)self textFieldLeft];
  v3 = objc_msgSend(v2, "ab_textAttributes");

  return v3;
}

- (void)setTextAttributes:(id)a3
{
  id v8 = a3;
  v4 = [(CNAddressComponentSplitTextFieldCell *)self textFieldLeft];
  objc_msgSend(v4, "ab_textAttributes");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    v6 = [(CNAddressComponentSplitTextFieldCell *)self textFieldLeft];
    objc_msgSend(v6, "setAb_textAttributes:", v8);

    v7 = [(CNAddressComponentSplitTextFieldCell *)self textFieldRight];
    objc_msgSend(v7, "setAb_textAttributes:", v8);
  }
}

- (id)textFields
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(CNAddressComponentSplitTextFieldCell *)self textFieldLeft];
  v7[0] = v3;
  v4 = [(CNAddressComponentSplitTextFieldCell *)self textFieldRight];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (void)setupTextFields
{
  id v3 = [(CNAddressComponentTextFieldCell *)self newTextField];
  [(CNAddressComponentSplitTextFieldCell *)self setTextFieldLeft:v3];

  v4 = [(NUITableViewContainerCell *)self containerView];
  id v5 = [(CNAddressComponentSplitTextFieldCell *)self textFieldLeft];
  [v4 addArrangedSubview:v5];

  id v6 = [(CNAddressComponentSplitTextFieldCell *)self newSeparatorView];
  [(CNAddressComponentSplitTextFieldCell *)self setSeparator:v6];

  v7 = [(NUITableViewContainerCell *)self containerView];
  id v8 = [(CNAddressComponentSplitTextFieldCell *)self separator];
  [v7 addArrangedSubview:v8];

  v9 = [(NUITableViewContainerCell *)self containerView];
  v10 = [(CNAddressComponentSplitTextFieldCell *)self separator];
  objc_msgSend(v9, "setMinimumSpacing:adjacentToView:", v10, 0.0, 0.0, 0.0, 8.0);

  id v11 = [(CNAddressComponentTextFieldCell *)self newTextField];
  [(CNAddressComponentSplitTextFieldCell *)self setTextFieldRight:v11];

  id v13 = [(NUITableViewContainerCell *)self containerView];
  v12 = [(CNAddressComponentSplitTextFieldCell *)self textFieldRight];
  [v13 addArrangedSubview:v12];
}

- (id)newSeparatorView
{
  id v3 = [CNRepeatingGradientSeparatorView alloc];
  v4 = -[CNRepeatingGradientSeparatorView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNAddressComponentSplitTextFieldCell *)self setSeparator:v4];

  id v5 = [(CNAddressComponentSplitTextFieldCell *)self separator];
  LODWORD(v6) = 1148846080;
  objc_msgSend(v5, "setLayoutSize:withContentPriority:", 0.5, 0.5, v6);

  [(CNAddressComponentSplitTextFieldCell *)self separator];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  id v13 = [(CNAddressComponentSplitTextFieldCell *)self separator];

  if (v13 == v12)
  {
    [v11 bounds];
    CGFloat height = v14;
    CGFloat y = 0.0;
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CNAddressComponentSplitTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNAddressComponentSplitTextFieldCell;
  v4 = [(CNAddressComponentTextFieldCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    double v6 = [(NUITableViewContainerCell *)v4 containerView];
    [v6 setAxis:0];
    [v6 setAlignment:3];
    [v6 setDistribution:0];
    [v6 setDelegate:v5];
  }
  return v5;
}

+ (id)cellIdentifier
{
  return @"CNAddressComponentSplitTextFieldCell";
}

+ (Class)containerViewClass
{
  return (Class)objc_opt_class();
}

@end