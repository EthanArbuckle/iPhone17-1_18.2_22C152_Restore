@interface FIUIDividerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (FIUIDividerView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)edgeInsets;
- (UIImageView)imageView;
- (void)layoutSubviews;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setImageView:(id)a3;
@end

@implementation FIUIDividerView

- (FIUIDividerView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FIUIDividerView;
  v3 = -[FIUIDividerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82828]);
    if (FIUIDividerViewRoundedCornerImage_onceToken != -1) {
      dispatch_once(&FIUIDividerViewRoundedCornerImage_onceToken, &__block_literal_global);
    }
    id v5 = (id)FIUIDividerViewRoundedCornerImage_image;
    uint64_t v6 = [v4 initWithImage:v5];
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    long long v8 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&v3->_edgeInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&v3->_edgeInsets.bottom = v8;
    [(FIUIDividerView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 1.5;
  result.height = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(FIUIDividerView *)self edgeInsets];
  double v4 = v3;
  [(FIUIDividerView *)self edgeInsets];
  double v6 = v4 + v5;
  v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 bounds];
  -[FIUIDividerView sizeThatFits:](self, "sizeThatFits:", v8 - v6, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)FIUIDividerView;
  [(FIUIDividerView *)&v12 layoutSubviews];
  [(FIUIDividerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(FIUIDividerView *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
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

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end