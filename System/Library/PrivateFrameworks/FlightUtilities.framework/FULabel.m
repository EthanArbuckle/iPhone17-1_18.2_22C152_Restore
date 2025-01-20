@interface FULabel
- (BOOL)uppercase;
- (BOOL)useCurrentLocale;
- (FULabel)associatedScalingLabel;
- (NSLayoutConstraint)associatedLabelConstraint;
- (id)_associatedScalingLabel;
- (id)onTap;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)performTap:(id)a3;
- (void)setAssociatedLabelConstraint:(id)a3;
- (void)setAssociatedScalingLabel:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setOnTap:(id)a3;
- (void)setStyleProvider:(id)a3 primaryStyle:(BOOL)a4;
- (void)setText:(id)a3;
- (void)setUppercase:(BOOL)a3 usingCurrentLocale:(BOOL)a4;
- (void)updateWidthConstraintWithRatio:(double)a3;
@end

@implementation FULabel

- (void)setUppercase:(BOOL)a3 usingCurrentLocale:(BOOL)a4
{
  if (self->_uppercase != a3 || self->_useCurrentLocale != a4)
  {
    self->_uppercase = a3;
    self->_useCurrentLocale = a4;
    if (self->_stringValue) {
      -[FULabel setText:](self, "setText:");
    }
    if (self->_attributedStringValue)
    {
      -[FULabel setAttributedText:](self, "setAttributedText:");
    }
  }
}

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)FULabel;
  [(FULabel *)&v4 awakeFromNib];
  [(FULabel *)self setUserInteractionEnabled:1];
  v3 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_performTap_];
  [(FULabel *)self addGestureRecognizer:v3];
}

- (void)performTap:(id)a3
{
  if ([a3 state] == 3)
  {
    objc_super v4 = [(FULabel *)self onTap];

    if (v4)
    {
      v5 = [(FULabel *)self onTap];
      v5[2]();
    }
  }
}

- (void)setAssociatedScalingLabel:(id)a3
{
  id obj = a3;
  id v4 = [(FULabel *)self associatedScalingLabel];

  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_associatedScalingLabel, obj);
    [(FULabel *)self setAdjustsFontSizeToFitWidth:1];
    [obj setAdjustsFontSizeToFitWidth:1];
  }
}

- (id)_associatedScalingLabel
{
  return self->_realAssociatedScalingLabel;
}

- (void)layoutSubviews
{
  v3 = [(FULabel *)self associatedScalingLabel];
  [v3 _actualScaleFactor];
  double v5 = v4;
  [(FULabel *)self _actualScaleFactor];
  if (v5 != v6)
  {
    [(FULabel *)self _actualScaleFactor];
    double v8 = v7;
    [v3 _actualScaleFactor];
    if (v8 > v9) {
      objc_storeStrong((id *)&self->_realAssociatedScalingLabel, v3);
    }
  }
  [(FULabel *)self setNeedsDisplay];
  v10.receiver = self;
  v10.super_class = (Class)FULabel;
  [(TLKLabel *)&v10 layoutSubviews];
}

- (void)updateWidthConstraintWithRatio:(double)a3
{
  double v5 = [(FULabel *)self associatedLabelConstraint];
  [v5 setActive:0];

  double v6 = (void *)MEMORY[0x263F08938];
  double v7 = [(FULabel *)self associatedScalingLabel];
  id v8 = [v6 constraintWithItem:self attribute:7 relatedBy:0 toItem:v7 attribute:7 multiplier:a3 constant:0.0];

  [v8 setActive:1];
  [(FULabel *)self setAssociatedLabelConstraint:v8];
}

- (void)setText:(id)a3
{
  double v4 = (__CFString *)a3;
  double v5 = v4;
  if (v4) {
    double v6 = v4;
  }
  else {
    double v6 = &stru_26E6B8080;
  }
  objc_storeStrong((id *)&self->_stringValue, v6);
  BOOL v7 = [(FULabel *)self uppercase];
  stringValue = self->_stringValue;
  if (v7)
  {
    double v9 = [(NSString *)stringValue FU_uppercaseStringUsingCurrentLocale:[(FULabel *)self useCurrentLocale]];
  }
  else
  {
    double v9 = stringValue;
  }
  objc_super v10 = v9;
  v11 = [(FULabel *)self associatedScalingLabel];
  if (v11)
  {
    v12 = [(FULabel *)self _defaultAttributes];
    [(NSString *)v10 sizeWithAttributes:v12];
    double v14 = v13;

    v15 = [(FULabel *)v11 text];
    v16 = [(FULabel *)self _defaultAttributes];
    [v15 sizeWithAttributes:v16];
    double v18 = v17;

    if (v18 <= 0.0 || v14 <= 0.0) {
      double v20 = 1.0;
    }
    else {
      double v20 = v14 / v18;
    }
    v21 = [(FULabel *)v11 associatedLabelConstraint];

    if (v21)
    {
      double v22 = 1.0 / v20;
      v23 = v11;
    }
    else
    {
      v23 = self;
      double v22 = v20;
    }
    [(FULabel *)v23 updateWidthConstraintWithRatio:v22];
  }
  v24.receiver = self;
  v24.super_class = (Class)FULabel;
  [(TLKLabel *)&v24 setText:v10];
}

- (void)setStyleProvider:(id)a3 primaryStyle:(BOOL)a4
{
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4) {
    double v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26E6B8080];
  }
  objc_storeStrong((id *)&self->_attributedStringValue, v5);
  if (!v4) {

  }
  BOOL v6 = [(FULabel *)self uppercase];
  attributedStringValue = self->_attributedStringValue;
  if (v6)
  {
    attributedStringValue = objc_msgSend(attributedStringValue, "FU_uppercaseAttributedStringCurrentLocale:", -[FULabel useCurrentLocale](self, "useCurrentLocale"));
  }
  v8.receiver = self;
  v8.super_class = (Class)FULabel;
  [(TLKLabel *)&v8 setAttributedText:attributedStringValue];
  if (v6) {
}
  }

- (id)onTap
{
  return objc_getProperty(self, a2, 912, 1);
}

- (void)setOnTap:(id)a3
{
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (BOOL)useCurrentLocale
{
  return self->_useCurrentLocale;
}

- (FULabel)associatedScalingLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedScalingLabel);

  return (FULabel *)WeakRetained;
}

- (NSLayoutConstraint)associatedLabelConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedLabelConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAssociatedLabelConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedLabelConstraint);
  objc_destroyWeak((id *)&self->_associatedScalingLabel);
  objc_storeStrong(&self->_onTap, 0);
  objc_storeStrong((id *)&self->_realAssociatedScalingLabel, 0);
  objc_storeStrong((id *)&self->_attributedStringValue, 0);

  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end