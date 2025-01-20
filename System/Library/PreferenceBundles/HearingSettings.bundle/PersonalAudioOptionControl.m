@interface PersonalAudioOptionControl
- (CGSize)intrinsicContentSize;
- (NSMutableArray)constraints;
- (PAEnrollmentNode)leftNode;
- (PAEnrollmentNode)rightNode;
- (PAEnrollmentNode)selectedNode;
- (PersonalAudioOptionControl)init;
- (PersonalAudioOptionControlDelegate)delegate;
- (UILabel)leftLabel;
- (UILabel)rightLabel;
- (UITapGestureRecognizer)tapRecognizer;
- (UIView)separator;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)selectItem:(unint64_t)a3;
- (void)setConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeftLabel:(id)a3;
- (void)setLeftNode:(id)a3;
- (void)setRightLabel:(id)a3;
- (void)setRightNode:(id)a3;
- (void)setSelectedNode:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)updateLayoutWithSelectedItem:(unint64_t)a3;
- (void)updateWithLeftNode:(id)a3 andRightNode:(id)a4;
@end

@implementation PersonalAudioOptionControl

- (PersonalAudioOptionControl)init
{
  v18.receiver = self;
  v18.super_class = (Class)PersonalAudioOptionControl;
  v2 = [(PersonalAudioOptionControl *)&v18 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    leftLabel = v2->_leftLabel;
    v2->_leftLabel = v3;

    [(UILabel *)v2->_leftLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v2->_leftLabel setTextAlignment:1];
    v5 = v2->_leftLabel;
    v6 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleHeadline maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
    [(UILabel *)v5 setFont:v6];

    [(UILabel *)v2->_leftLabel setNumberOfLines:0];
    UIAccessibilityTraits v7 = UIAccessibilityTraitButton;
    [(UILabel *)v2->_leftLabel setAccessibilityTraits:UIAccessibilityTraitButton];
    [(PersonalAudioOptionControl *)v2 addSubview:v2->_leftLabel];
    v8 = (UIView *)objc_alloc_init((Class)UIView);
    separator = v2->_separator;
    v2->_separator = v8;

    [(UIView *)v2->_separator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PersonalAudioOptionControl *)v2 addSubview:v2->_separator];
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    rightLabel = v2->_rightLabel;
    v2->_rightLabel = v10;

    [(UILabel *)v2->_rightLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v2->_rightLabel setTextAlignment:1];
    v12 = v2->_rightLabel;
    v13 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleHeadline maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
    [(UILabel *)v12 setFont:v13];

    [(UILabel *)v2->_rightLabel setNumberOfLines:0];
    [(UILabel *)v2->_rightLabel setAccessibilityTraits:v7];
    [(PersonalAudioOptionControl *)v2 addSubview:v2->_rightLabel];
    uint64_t v14 = +[NSMutableArray array];
    constraints = v2->_constraints;
    v2->_constraints = (NSMutableArray *)v14;

    [(PersonalAudioOptionControl *)v2 updateLayoutWithSelectedItem:0];
    id v16 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v2 action:"_handleTapGestureRecognizer:"];
    [v16 setDelegate:v2];
    [(PersonalAudioOptionControl *)v2 addGestureRecognizer:v16];
    [(PersonalAudioOptionControl *)v2 setTapRecognizer:v16];
  }
  return v2;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = v4;
  v10 = v4;
  if (!v4 || (v6 = (char *)[v4 state], v5 = v10, v6 == (unsigned char *)&dword_0 + 3))
  {
    leftLabel = self->_leftLabel;
    [v5 locationInView:leftLabel];
    if (-[UILabel pointInside:withEvent:](leftLabel, "pointInside:withEvent:", 0))
    {
      uint64_t v8 = 1;
    }
    else
    {
      rightLabel = self->_rightLabel;
      [v10 locationInView:rightLabel];
      if (!-[UILabel pointInside:withEvent:](rightLabel, "pointInside:withEvent:", 0)) {
        goto LABEL_8;
      }
      uint64_t v8 = 2;
    }
    [(PersonalAudioOptionControl *)self selectItem:v8];
  }
LABEL_8:

  _objc_release_x1();
}

- (void)updateLayoutWithSelectedItem:(unint64_t)a3
{
  v5 = [(UILabel *)self->_leftLabel layer];
  [v5 setMasksToBounds:0];

  v6 = [(UILabel *)self->_leftLabel layer];
  if (a3 == 1) {
    +[UIColor systemBlueColor];
  }
  else {
  UIAccessibilityTraits v7 = +[UIColor secondarySystemFillColor];
  }
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  leftLabel = self->_leftLabel;
  if (a3 == 1) {
    +[UIColor systemWhiteColor];
  }
  else {
  v9 = +[UIColor systemBlueColor];
  }
  [(UILabel *)leftLabel setTextColor:v9];

  UIAccessibilityTraits v10 = UIAccessibilityTraitButton;
  UIAccessibilityTraits v11 = UIAccessibilityTraitSelected;
  if (a3 == 1) {
    UIAccessibilityTraits v12 = UIAccessibilityTraitSelected;
  }
  else {
    UIAccessibilityTraits v12 = 0;
  }
  [(UILabel *)self->_leftLabel setAccessibilityTraits:v12 | UIAccessibilityTraitButton];
  v13 = [(UILabel *)self->_rightLabel layer];
  [v13 setMasksToBounds:0];

  uint64_t v14 = [(UILabel *)self->_rightLabel layer];
  if (a3 == 2) {
    +[UIColor systemBlueColor];
  }
  else {
  v15 = +[UIColor secondarySystemFillColor];
  }
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

  rightLabel = self->_rightLabel;
  if (a3 == 2)
  {
    v17 = +[UIColor systemWhiteColor];
    [(UILabel *)rightLabel setTextColor:v17];
  }
  else
  {
    v17 = +[UIColor systemBlueColor];
    [(UILabel *)rightLabel setTextColor:v17];
    UIAccessibilityTraits v11 = 0;
  }

  [(UILabel *)self->_rightLabel setAccessibilityTraits:v11 | v10];
  [(PersonalAudioOptionControl *)self removeConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  -[UILabel sizeThatFits:](self->_leftLabel, "sizeThatFits:", 1.79769313e308, 50.0);
  double v19 = v18;
  -[UILabel sizeThatFits:](self->_rightLabel, "sizeThatFits:", 1.79769313e308, 50.0);
  if (v19 > 125.0 || v20 > 125.0)
  {
    self->_verticalLayout = 1;
    constraints = self->_constraints;
    v43 = _NSDictionaryOfVariableBindings(@"_leftLabel", self->_leftLabel, 0);
    v44 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_leftLabel]|" options:0 metrics:0 views:v43];
    [(NSMutableArray *)constraints addObjectsFromArray:v44];

    v45 = self->_constraints;
    v46 = _NSDictionaryOfVariableBindings(@"_rightLabel", self->_rightLabel, 0);
    v47 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_rightLabel]|" options:0 metrics:0 views:v46];
    [(NSMutableArray *)v45 addObjectsFromArray:v47];

    v48 = self->_constraints;
    v49 = _NSDictionaryOfVariableBindings(@"_leftLabel, _rightLabel", self->_leftLabel, self->_rightLabel, 0);
    v50 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_leftLabel]-[_rightLabel]-|", 0, 0, v49);
    [(NSMutableArray *)v48 addObjectsFromArray:v50];

    v51 = [(UILabel *)self->_leftLabel layer];
    [v51 setMaskedCorners:15];

    v39 = [(UILabel *)self->_rightLabel layer];
    v40 = v39;
    uint64_t v41 = 15;
  }
  else
  {
    self->_verticalLayout = 0;
    v21 = self->_constraints;
    v22 = +[NSString stringWithFormat:@"V:|[_leftLabel(%lf)]|", 0x4049000000000000];
    v23 = _NSDictionaryOfVariableBindings(@"_leftLabel", self->_leftLabel, 0);
    v24 = +[NSLayoutConstraint constraintsWithVisualFormat:v22 options:0 metrics:0 views:v23];
    [(NSMutableArray *)v21 addObjectsFromArray:v24];

    v25 = self->_constraints;
    v26 = +[NSString stringWithFormat:@"V:|[_separator(%lf)]|", 0x4049000000000000];
    v27 = _NSDictionaryOfVariableBindings(@"_separator", self->_separator, 0);
    v28 = +[NSLayoutConstraint constraintsWithVisualFormat:v26 options:0 metrics:0 views:v27];
    [(NSMutableArray *)v25 addObjectsFromArray:v28];

    v29 = self->_constraints;
    v30 = +[NSString stringWithFormat:@"V:|[_rightLabel(%lf)]|", 0x4049000000000000];
    v31 = _NSDictionaryOfVariableBindings(@"_rightLabel", self->_rightLabel, 0);
    v32 = +[NSLayoutConstraint constraintsWithVisualFormat:v30 options:0 metrics:0 views:v31];
    [(NSMutableArray *)v29 addObjectsFromArray:v32];

    v33 = self->_constraints;
    v34 = _NSDictionaryOfVariableBindings(@"_leftLabel, _separator, _rightLabel", self->_leftLabel, self->_separator, self->_rightLabel, 0);
    v35 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(25.0)-[_leftLabel][_separator(2.0)][_rightLabel]-(25.0)-|", 0, 0, v34);
    [(NSMutableArray *)v33 addObjectsFromArray:v35];

    id v36 = [UIApp userInterfaceLayoutDirection];
    v37 = [(UILabel *)self->_leftLabel layer];
    v38 = v37;
    if (v36)
    {
      [v37 setMaskedCorners:10];

      v39 = [(UILabel *)self->_rightLabel layer];
      v40 = v39;
      uint64_t v41 = 5;
    }
    else
    {
      [v37 setMaskedCorners:5];

      v39 = [(UILabel *)self->_rightLabel layer];
      v40 = v39;
      uint64_t v41 = 10;
    }
  }
  [v39 setMaskedCorners:v41];

  v52 = self->_constraints;
  v53 = +[NSLayoutConstraint constraintWithItem:self->_leftLabel attribute:7 relatedBy:0 toItem:self->_rightLabel attribute:7 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v52 addObject:v53];

  v54 = self->_constraints;
  v55 = +[NSLayoutConstraint constraintWithItem:self->_leftLabel attribute:8 relatedBy:0 toItem:self->_rightLabel attribute:8 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v54 addObject:v55];

  [(PersonalAudioOptionControl *)self addConstraints:self->_constraints];
  v56 = [(UILabel *)self->_leftLabel layer];
  [v56 setCornerRadius:25.0];

  id v57 = [(UILabel *)self->_rightLabel layer];
  [v57 setCornerRadius:25.0];
}

- (void)selectItem:(unint64_t)a3
{
  [(PersonalAudioOptionControl *)self updateLayoutWithSelectedItem:"updateLayoutWithSelectedItem:"];
  switch(a3)
  {
    case 0uLL:
      return;
    case 2uLL:
      uint64_t v5 = [(PersonalAudioOptionControl *)self rightNode];
      goto LABEL_7;
    case 1uLL:
      uint64_t v5 = [(PersonalAudioOptionControl *)self leftNode];
LABEL_7:
      v6 = (void *)v5;
      [(PersonalAudioOptionControl *)self setSelectedNode:v5];

      break;
  }
  id v7 = [(PersonalAudioOptionControl *)self delegate];
  [v7 didSelectOptionControl:self];
}

- (void)updateWithLeftNode:(id)a3 andRightNode:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  [(PersonalAudioOptionControl *)self setLeftNode:v27];
  [(PersonalAudioOptionControl *)self setRightNode:v6];
  if (+[HCUtilities isInternalInstall]
    && (+[PASettings sharedInstance],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 personalMediaDebugMode],
        v7,
        v8))
  {
    v9 = [(PAEnrollmentNode *)self->_leftNode configuration];

    leftLabel = self->_leftLabel;
    UIAccessibilityTraits v11 = [v27 name];
    if (v9)
    {
      UIAccessibilityTraits v12 = [v27 configuration];
      id v13 = [v12 level];
      uint64_t v14 = [v27 configuration];
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ [%lu, %lu]", v11, v13, [v14 shape]);
      [(UILabel *)leftLabel setText:v15];
    }
    else
    {
      UIAccessibilityTraits v12 = paLocString();
      uint64_t v14 = +[NSString stringWithFormat:@"%@ [%@]", v11, v12];
      [(UILabel *)leftLabel setText:v14];
    }

    double v20 = [v6 configuration];

    rightLabel = self->_rightLabel;
    double v19 = [v6 name];
    if (v20)
    {
      v22 = [v6 configuration];
      id v23 = [v22 level];
      v24 = [v6 configuration];
      v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ [%lu, %lu]", v19, v23, [v24 shape]);
      [(UILabel *)rightLabel setText:v25];
    }
    else
    {
      v22 = paLocString();
      v26 = +[NSString stringWithFormat:@"%@ [%@]", v19, v22];
      [(UILabel *)rightLabel setText:v26];
    }
  }
  else
  {
    id v16 = self->_leftLabel;
    v17 = [v27 name];
    [(UILabel *)v16 setText:v17];

    double v18 = self->_rightLabel;
    double v19 = [v6 name];
    [(UILabel *)v18 setText:v19];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 125.0;
  double v3 = 50.0;
  if (self->_verticalLayout) {
    double v3 = 125.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (PersonalAudioOptionControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PersonalAudioOptionControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PAEnrollmentNode)selectedNode
{
  return self->_selectedNode;
}

- (void)setSelectedNode:(id)a3
{
}

- (UILabel)leftLabel
{
  return self->_leftLabel;
}

- (void)setLeftLabel:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UILabel)rightLabel
{
  return self->_rightLabel;
}

- (void)setRightLabel:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (PAEnrollmentNode)leftNode
{
  return self->_leftNode;
}

- (void)setLeftNode:(id)a3
{
}

- (PAEnrollmentNode)rightNode
{
  return self->_rightNode;
}

- (void)setRightNode:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_rightNode, 0);
  objc_storeStrong((id *)&self->_leftNode, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
  objc_storeStrong((id *)&self->_selectedNode, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end