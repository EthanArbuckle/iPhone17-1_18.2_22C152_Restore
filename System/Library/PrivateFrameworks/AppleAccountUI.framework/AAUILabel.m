@interface AAUILabel
- (AAUILabel)initWithCoder:(id)a3;
- (AAUILabel)initWithEdgeInsets:(UIEdgeInsets)a3;
- (AAUILabel)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)edgeInsets;
- (void)drawTextInRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation AAUILabel

- (AAUILabel)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAUILabel;
  result = -[AAUILabel initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&result->_edgeInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&result->_edgeInsets.bottom = v4;
  }
  return result;
}

- (AAUILabel)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAUILabel;
  result = [(AAUILabel *)&v5 initWithCoder:a3];
  if (result)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&result->_edgeInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&result->_edgeInsets.bottom = v4;
  }
  return result;
}

- (AAUILabel)initWithEdgeInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)AAUILabel;
  result = -[AAUILabel initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (result)
  {
    result->_edgeInsets.CGFloat top = top;
    result->_edgeInsets.CGFloat left = left;
    result->_edgeInsets.CGFloat bottom = bottom;
    result->_edgeInsets.CGFloat right = right;
  }
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  float64x2_t v3 = *(float64x2_t *)&self->_edgeInsets.top;
  float64x2_t v4 = *(float64x2_t *)&self->_edgeInsets.bottom;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v3, *MEMORY[0x263F834E8]), (int32x4_t)vceqq_f64(v4, *(float64x2_t *)(MEMORY[0x263F834E8] + 16)))), 0xFuLL))))-[AAUILabel drawTextInRect:](&v6, sel_drawTextInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v5.receiver, v5.super_class, self, AAUILabel); {
  else
  }
    -[AAUILabel drawTextInRect:](&v5, sel_drawTextInRect_, a3.origin.x + v3.f64[1], a3.origin.y + v3.f64[0], a3.size.width - (v3.f64[1] + v4.f64[1]), a3.size.height - (v3.f64[0] + v4.f64[0]), self, AAUILabel, v6.receiver, v6.super_class);
}

- (CGSize)intrinsicContentSize
{
  v7.receiver = self;
  v7.super_class = (Class)AAUILabel;
  [(AAUILabel *)&v7 intrinsicContentSize];
  double v4 = v3 + self->_edgeInsets.left + self->_edgeInsets.right;
  double v6 = v5 + self->_edgeInsets.top + self->_edgeInsets.bottom;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  [(AAUILabel *)self bounds];
  [(AAUILabel *)self setPreferredMaxLayoutWidth:CGRectGetWidth(v4)];
  v3.receiver = self;
  v3.super_class = (Class)AAUILabel;
  [(AAUILabel *)&v3 layoutSubviews];
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

@end