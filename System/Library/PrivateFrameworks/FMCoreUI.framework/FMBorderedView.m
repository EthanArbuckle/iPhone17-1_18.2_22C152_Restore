@interface FMBorderedView
- (BOOL)hairlineBorder;
- (UIColor)borderColor;
- (double)borderWidth;
- (double)cornerRadius;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHairlineBorder:(BOOL)a3;
@end

@implementation FMBorderedView

- (void)setBorderWidth:(double)a3
{
  if (a3 >= 0.0)
  {
    double v7 = a3;
    [(FMBorderedView *)self setHairlineBorder:0];
    goto LABEL_5;
  }
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v6 = v5;

  [(FMBorderedView *)self setHairlineBorder:1];
  if (v6 > 1.0)
  {
    double v7 = 1.0 / v6;
LABEL_5:
    v8 = [(FMBorderedView *)self layer];
    id v10 = v8;
    double v9 = v7;
    goto LABEL_7;
  }
  v8 = [(FMBorderedView *)self layer];
  double v9 = 1.0;
  id v10 = v8;
LABEL_7:
  [v8 setBorderWidth:v9];
}

- (double)borderWidth
{
  if ([(FMBorderedView *)self hairlineBorder]) {
    return -1.0;
  }
  v4 = [(FMBorderedView *)self layer];
  [v4 borderWidth];
  double v6 = v5;

  return v6;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(FMBorderedView *)self layer];
  [v4 setCornerRadius:a3];
}

- (double)cornerRadius
{
  v2 = [(FMBorderedView *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setBorderColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  id v5 = [(FMBorderedView *)self layer];
  [v5 setBorderColor:v4];
}

- (UIColor)borderColor
{
  v2 = (void *)MEMORY[0x263F1C550];
  double v3 = [(FMBorderedView *)self layer];
  uint64_t v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "borderColor"));

  return (UIColor *)v4;
}

- (BOOL)hairlineBorder
{
  return self->_hairlineBorder;
}

- (void)setHairlineBorder:(BOOL)a3
{
  self->_hairlineBorder = a3;
}

@end