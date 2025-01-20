@interface FMBorderedButton
- (BOOL)hairlineBorder;
- (UIColor)borderColor;
- (double)borderWidth;
- (double)cornerRadius;
- (void)_bbUpdateLayer;
- (void)awakeFromNib;
- (void)prepareForInterfaceBuilder;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHairlineBorder:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation FMBorderedButton

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)FMBorderedButton;
  [(FMBorderedButton *)&v3 awakeFromNib];
  [(FMBorderedButton *)self _bbUpdateLayer];
}

- (void)prepareForInterfaceBuilder
{
  v3.receiver = self;
  v3.super_class = (Class)FMBorderedButton;
  [(FMBorderedButton *)&v3 prepareForInterfaceBuilder];
  [(FMBorderedButton *)self _bbUpdateLayer];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)FMBorderedButton;
  [(FMBorderedButton *)&v3 tintColorDidChange];
  [(FMBorderedButton *)self _bbUpdateLayer];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMBorderedButton;
  [(FMBorderedButton *)&v4 setEnabled:a3];
  [(FMBorderedButton *)self _bbUpdateLayer];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMBorderedButton;
  [(FMBorderedButton *)&v4 setHighlighted:a3];
  [(FMBorderedButton *)self _bbUpdateLayer];
}

- (void)setBorderWidth:(double)a3
{
  if (a3 >= 0.0)
  {
    double v7 = a3;
    [(FMBorderedButton *)self setHairlineBorder:0];
    goto LABEL_5;
  }
  objc_super v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v6 = v5;

  [(FMBorderedButton *)self setHairlineBorder:1];
  if (v6 > 1.0)
  {
    double v7 = 1.0 / v6;
LABEL_5:
    v8 = [(FMBorderedButton *)self layer];
    id v10 = v8;
    double v9 = v7;
    goto LABEL_7;
  }
  v8 = [(FMBorderedButton *)self layer];
  double v9 = 1.0;
  id v10 = v8;
LABEL_7:
  [v8 setBorderWidth:v9];
}

- (double)borderWidth
{
  if ([(FMBorderedButton *)self hairlineBorder]) {
    return -1.0;
  }
  objc_super v4 = [(FMBorderedButton *)self layer];
  [v4 borderWidth];
  double v6 = v5;

  return v6;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(FMBorderedButton *)self layer];
  [v4 setCornerRadius:a3];
}

- (double)cornerRadius
{
  v2 = [(FMBorderedButton *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)_bbUpdateLayer
{
  if (([(FMBorderedButton *)self isEnabled] & 1) == 0)
  {
    double v5 = [(FMBorderedButton *)self titleColorForState:2];
    id v14 = v5;
    if (!v5)
    {
LABEL_13:
      id v2 = [(FMBorderedButton *)self titleColorForState:0];
      uint64_t v6 = [v2 CGColor];
LABEL_14:
      v11 = [(FMBorderedButton *)self layer];
      [v11 setBorderColor:v6];

      id v10 = v14;
      if (v14) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_7:
    uint64_t v6 = [v5 CGColor];
    goto LABEL_14;
  }
  if (![(FMBorderedButton *)self isHighlighted])
  {
    if ([(FMBorderedButton *)self buttonType] == 1)
    {
      double v7 = [MEMORY[0x263F15760] animation];
      [v7 setDuration:0.215];
      v8 = [(FMBorderedButton *)self layer];
      [v8 addAnimation:v7 forKey:@"borderColor"];
    }
    id v14 = [(FMBorderedButton *)self titleColorForState:0];
    uint64_t v9 = [v14 CGColor];
    id v2 = [(FMBorderedButton *)self layer];
    [v2 setBorderColor:v9];
    goto LABEL_11;
  }
  id v14 = [(FMBorderedButton *)self titleColorForState:1];
  if ([(FMBorderedButton *)self buttonType] != 1)
  {
    double v5 = v14;
    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  if (v14)
  {
    double v4 = [v14 colorWithAlphaComponent:0.2];
    id v2 = v4;
  }
  else
  {
    id v2 = [(FMBorderedButton *)self titleColorForState:0];
    double v4 = [v2 colorWithAlphaComponent:0.2];
  }
  uint64_t v12 = [v4 CGColor];
  v13 = [(FMBorderedButton *)self layer];
  [v13 setBorderColor:v12];

  id v10 = v14;
  if (v14) {
    goto LABEL_18;
  }

LABEL_11:
  id v10 = v14;
LABEL_18:
  id v15 = v10;

  id v10 = v15;
LABEL_19:
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (BOOL)hairlineBorder
{
  return self->_hairlineBorder;
}

- (void)setHairlineBorder:(BOOL)a3
{
  self->_hairlineBorder = a3;
}

- (void).cxx_destruct
{
}

@end