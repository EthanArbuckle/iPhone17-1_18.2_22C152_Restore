@interface HRPaddingLabel
- (CGSize)intrinsicContentSize;
- (HRPaddingLabel)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)padding;
- (void)drawTextInRect:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setPadding:(UIEdgeInsets)a3;
@end

@implementation HRPaddingLabel

- (HRPaddingLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HRPaddingLabel;
  v3 = -[HRPaddingLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    -[HRPaddingLabel setPadding:](v3, "setPadding:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  }
  return v4;
}

- (void)setBounds:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HRPaddingLabel;
  -[HRPaddingLabel setBounds:](&v9, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HRPaddingLabel *)self bounds];
  double v5 = v4;
  [(HRPaddingLabel *)self padding];
  double v7 = v5 - v6;
  [(HRPaddingLabel *)self padding];
  [(HRPaddingLabel *)self setPreferredMaxLayoutWidth:v7 - v8];
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HRPaddingLabel *)self padding];
  v12.receiver = self;
  v12.super_class = (Class)HRPaddingLabel;
  -[HRPaddingLabel drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (CGSize)intrinsicContentSize
{
  v16.receiver = self;
  v16.super_class = (Class)HRPaddingLabel;
  [(HRPaddingLabel *)&v16 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(HRPaddingLabel *)self padding];
  double v8 = v4 + v7;
  [(HRPaddingLabel *)self padding];
  double v10 = v8 + v9;
  [(HRPaddingLabel *)self padding];
  double v12 = v6 + v11;
  [(HRPaddingLabel *)self padding];
  double v14 = v12 + v13;
  double v15 = v10;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

@end