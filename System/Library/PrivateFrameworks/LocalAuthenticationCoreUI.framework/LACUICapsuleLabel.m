@interface LACUICapsuleLabel
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (CGSize)intrinsicContentSize;
- (id)_desaturatedSystemRedColor;
- (void)_setBackgroundColor:(void *)a1;
- (void)setStyle:(int64_t)a3;
@end

@implementation LACUICapsuleLabel

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 bounds];
  double v12 = v11;

  if (width <= v12)
  {
    v19.receiver = self;
    v19.super_class = (Class)LACUICapsuleLabel;
    -[LACUICapsuleLabel textRectForBounds:limitedToNumberOfLines:](&v19, sel_textRectForBounds_limitedToNumberOfLines_, a4, x, y, width + -32.0, height + -4.0);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)LACUICapsuleLabel;
    -[LACUICapsuleLabel textRectForBounds:limitedToNumberOfLines:](&v20, sel_textRectForBounds_limitedToNumberOfLines_, a4, x, y, width, height);
    double v16 = v15 + 32.0;
    double v18 = v17 + 4.0;
  }
  result.size.double height = v18;
  result.size.double width = v16;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)LACUICapsuleLabel;
  [(LACUICapsuleLabel *)&v13 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(LACUICapsuleLabel *)self text];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    double v4 = v4 + 32.0;
    double v6 = v6 + 4.0;
    v9 = [(LACUICapsuleLabel *)self layer];
    objc_msgSend(v9, "setCornerRadius:", fmin(v6 * 0.5, 18.0));

    v10 = [(LACUICapsuleLabel *)self layer];
    [v10 masksToBounds];
  }
  double v11 = v4;
  double v12 = v6;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)setStyle:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      -[LACUICapsuleLabel _desaturatedSystemRedColor]((uint64_t)self);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      double v4 = (void *)MEMORY[0x263F825C8];
      goto LABEL_6;
    case 1:
      id v7 = [MEMORY[0x263F825C8] whiteColor];
      uint64_t v5 = [MEMORY[0x263F825C8] systemRedColor];
      goto LABEL_8;
    case 0:
      id v7 = [MEMORY[0x263F825C8] labelColor];
      double v4 = (void *)MEMORY[0x263F825C8];
LABEL_6:
      uint64_t v5 = [v4 clearColor];
LABEL_8:
      double v6 = (void *)v5;
      goto LABEL_10;
  }
  id v7 = 0;
  double v6 = 0;
LABEL_10:
  [(LACUICapsuleLabel *)self setTextColor:v7];
  -[LACUICapsuleLabel _setBackgroundColor:](self, v6);
}

- (id)_desaturatedSystemRedColor
{
  if (a1)
  {
    v1 = [MEMORY[0x263F825C8] systemRedColor];
    double v7 = 0.0;
    double v8 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    if ([v1 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5])
    {
      objc_msgSend(MEMORY[0x263F825C8], "colorWithHue:saturation:brightness:alpha:", v8, fmax(fmin(v7 + -0.4, 1.0), 0.0), v6, v5);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v2 = v1;
    }
    double v3 = v2;
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (void)_setBackgroundColor:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v6 = [a1 layer];
    id v4 = v3;
    uint64_t v5 = [v4 CGColor];

    [v6 setBackgroundColor:v5];
  }
}

@end