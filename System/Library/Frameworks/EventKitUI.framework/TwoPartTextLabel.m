@interface TwoPartTextLabel
- (BOOL)hasTwoParts;
- (BOOL)strikethroughPart1;
- (BOOL)strikethroughPart2;
- (CGSize)idealSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)textPart2Size;
- (TwoPartTextLabel)init;
- (double)rightmostDisplayedPartWidth;
- (id)description;
- (void)drawRect:(CGRect)a3;
- (void)setMinimumPart2Width:(double)a3;
- (void)setStrikethroughPart1:(BOOL)a3;
- (void)setStrikethroughPart2:(BOOL)a3;
- (void)setTextPart1:(id)a3;
- (void)setTextPart1:(id)a3 part2:(id)a4;
@end

@implementation TwoPartTextLabel

- (TwoPartTextLabel)init
{
  v6.receiver = self;
  v6.super_class = (Class)TwoPartTextLabel;
  v2 = [(TwoPartTextLabel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(TwoPartTextLabel *)v2 layer];
    [v4 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"separatedOptions.enableContext"];
    [v4 setNeedsDisplay];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TwoPartTextLabel;
  v4 = [(TwoPartTextLabel *)&v8 description];
  v5 = [(TwoPartTextLabel *)self text];
  objc_super v6 = [v3 stringWithFormat:@"%@\t'%@'\t'%@'", v4, v5, self->_secondTextPart];

  return v6;
}

- (void)setTextPart1:(id)a3 part2:(id)a4
{
  v7 = (NSString *)a4;
  [(TwoPartTextLabel *)self setTextPart1:a3];
  if (self->_secondTextPart != v7)
  {
    objc_storeStrong((id *)&self->_secondTextPart, a4);
    self->_part2Size = (CGSize)*MEMORY[0x1E4F1DB30];
    [(TwoPartTextLabel *)self setNeedsDisplay];
  }
}

- (void)setTextPart1:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TwoPartTextLabel;
  [(TwoPartTextLabel *)&v3 setText:a3];
}

- (void)setStrikethroughPart1:(BOOL)a3
{
  if (self->_strikethroughPart1 != a3)
  {
    self->_strikethroughPart1 = a3;
    [(TwoPartTextLabel *)self setNeedsDisplay];
  }
}

- (void)setStrikethroughPart2:(BOOL)a3
{
  if (self->_strikethroughPart2 != a3)
  {
    self->_strikethroughPart2 = a3;
    [(TwoPartTextLabel *)self setNeedsDisplay];
  }
}

- (CGSize)textPart2Size
{
  p_part2Size = &self->_part2Size;
  if (self->_part2Size.width == 0.0
    && self->_part2Size.height == 0.0
    && [(NSString *)self->_secondTextPart length])
  {
    secondTextPart = self->_secondTextPart;
    v5 = [(TwoPartTextLabel *)self font];
    [(NSString *)secondTextPart _legacy_sizeWithFont:v5];
    p_part2Size->double width = v6;
    p_part2Size->double height = v7;
  }
  double width = p_part2Size->width;
  double height = p_part2Size->height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)hasTwoParts
{
  [(TwoPartTextLabel *)self textPart2Size];
  if (v3 <= 0.0) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TwoPartTextLabel;
  [(TwoPartTextLabel *)&v6 textSize];
  return v4 > 0.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(TwoPartTextLabel *)self idealSize];
  if (width < v4) {
    double v4 = width;
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)idealSize
{
  [(TwoPartTextLabel *)self textPart2Size];
  double v4 = v3;
  double v6 = v5;
  CGFloat v7 = [(TwoPartTextLabel *)self text];
  objc_super v8 = [(TwoPartTextLabel *)self font];
  objc_msgSend(v7, "_legacy_sizeWithFont:", v8);
  double v10 = v9;
  double v12 = v11;

  if (v4 > 0.0 && v10 > 0.0)
  {
    double v13 = self->_minPart2Width - v4;
    if (v13 <= 0.0) {
      double v14 = 18.0;
    }
    else {
      double v14 = v13 + 18.0;
    }
    double v10 = v10 + v14;
  }
  double v15 = v4 + v10;
  if (v12 >= v6) {
    double v16 = v12;
  }
  else {
    double v16 = v6;
  }
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (double)rightmostDisplayedPartWidth
{
  [(TwoPartTextLabel *)self textPart2Size];
  if (result == 0.0)
  {
    v4.receiver = self;
    v4.super_class = (Class)TwoPartTextLabel;
    [(TwoPartTextLabel *)&v4 textSize];
  }
  return result;
}

- (void)setMinimumPart2Width:(double)a3
{
  if (self->_minPart2Width != a3)
  {
    self->_minPart2Width = a3;
    [(TwoPartTextLabel *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v41[1] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)TwoPartTextLabel;
  -[TwoPartTextLabel drawRect:](&v39, sel_drawRect_);
  [(TwoPartTextLabel *)self textPart2Size];
  if (v8 <= 0.0)
  {
    double v18 = *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    double v9 = v8;
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v11 = [(TwoPartTextLabel *)self text];
    uint64_t v40 = *MEMORY[0x1E4FB06F8];
    double v12 = [(TwoPartTextLabel *)self font];
    v41[0] = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    [v11 sizeWithAttributes:v13];
    double v15 = v14;

    if (CalInterfaceIsLeftToRight())
    {
      double v16 = x + v15;
      CalRoundToScreenScale(v16 + 18.0 + fmax(self->_minPart2Width - v9, 0.0));
      double v18 = v17;
      if (v9 + v17 > width)
      {
        if (v16 + 4.0 >= width - v9) {
          double v18 = v16 + 4.0;
        }
        else {
          double v18 = width - v9;
        }
      }
    }
    else
    {
      v42.origin.double x = x;
      v42.origin.double y = y;
      v42.size.double width = width;
      v42.size.CGFloat height = height;
      CGFloat MaxX = CGRectGetMaxX(v42);
      CalRoundToScreenScale(MaxX - v15 + -18.0 - fmax(self->_minPart2Width - v9, 0.0) - v9);
      double v18 = v20;
      if (v20 < 0.0)
      {
        v43.origin.double x = x;
        v43.origin.double y = y;
        v43.size.double width = width;
        v43.size.CGFloat height = height;
        double v18 = fmin(CGRectGetMaxX(v43) - v15 + -4.0 - v9, 0.0);
      }
    }
    double v21 = v10 + CalFloorToScreenScale(0.4);
    v22 = [(TwoPartTextLabel *)self currentTextColor];
    [v22 set];

    secondTextPart = self->_secondTextPart;
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.double width = width;
    v44.size.CGFloat height = height;
    CGFloat v24 = CGRectGetMaxX(v44) - v18;
    v25 = [(TwoPartTextLabel *)self font];
    -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](secondTextPart, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v25, [(TwoPartTextLabel *)self lineBreakMode], v18, v21, v24);
  }
  if ([(TwoPartTextLabel *)self strikethroughPart1]
    || [(TwoPartTextLabel *)self strikethroughPart2])
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    v27 = [(TwoPartTextLabel *)self font];
    [v27 lineHeight];
    double v29 = v28;

    if ([(TwoPartTextLabel *)self strikethroughPart1]) {
      double v30 = 0.0;
    }
    else {
      double v30 = v18;
    }
    [(TwoPartTextLabel *)self bounds];
    CGFloat v31 = CGRectGetMaxX(v45) - v30 + -2.0;
    CalRoundToScreenScale(0.5);
    double v33 = v32;
    v34 = [(TwoPartTextLabel *)self font];
    [v34 xHeight];
    CalRoundToScreenScale(y + v29 - v33 - v35);
    CGFloat v37 = v36;

    CGContextSaveGState(CurrentContext);
    id v38 = [(TwoPartTextLabel *)self textColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v38 CGColor]);

    v46.origin.double x = v30;
    v46.origin.double y = v37;
    v46.size.double width = v31;
    v46.size.CGFloat height = v33;
    CGContextFillRect(CurrentContext, v46);
    CGContextRestoreGState(CurrentContext);
  }
}

- (BOOL)strikethroughPart1
{
  return self->_strikethroughPart1;
}

- (BOOL)strikethroughPart2
{
  return self->_strikethroughPart2;
}

- (void).cxx_destruct
{
}

@end