@interface AVTAttributeSectionSeparator
+ (id)reuseIdentifier;
- (AVTAttributeSectionSeparator)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)edgeInsets;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setSeparatorView:(id)a3;
@end

@implementation AVTAttributeSectionSeparator

+ (id)reuseIdentifier
{
  return @"AVTAttributeSectionSeparator";
}

- (AVTAttributeSectionSeparator)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVTAttributeSectionSeparator;
  v3 = -[AVTAttributeSectionSeparator initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    [(AVTAttributeSectionSeparator *)v3 bounds];
    v5 = objc_msgSend(v4, "initWithFrame:");
    [(AVTAttributeSectionSeparator *)v3 setSeparatorView:v5];

    v6 = +[AVTUIColorRepository separatorColor];
    v7 = [(AVTAttributeSectionSeparator *)v3 separatorView];
    [v7 setBackgroundColor:v6];

    v8 = [(AVTAttributeSectionSeparator *)v3 separatorView];
    [(AVTAttributeSectionSeparator *)v3 addSubview:v8];

    v9 = [MEMORY[0x263F1C550] clearColor];
    [(AVTAttributeSectionSeparator *)v3 setBackgroundColor:v9];
  }
  return v3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AVTAttributeSectionSeparator;
  [(AVTAttributeSectionSeparator *)&v14 layoutSubviews];
  [(AVTAttributeSectionSeparator *)self edgeInsets];
  double v4 = v3;
  [(AVTAttributeSectionSeparator *)self bounds];
  double v6 = v5;
  [(AVTAttributeSectionSeparator *)self edgeInsets];
  double v8 = v7;
  [(AVTAttributeSectionSeparator *)self edgeInsets];
  double v10 = v6 - (v8 + v9);
  [(AVTAttributeSectionSeparator *)self bounds];
  double v12 = v11;
  v13 = [(AVTAttributeSectionSeparator *)self separatorView];
  objc_msgSend(v13, "setFrame:", v4, 0.0, v10, v12);
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    [(AVTAttributeSectionSeparator *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  long long v3 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  *(_OWORD *)&self->_edgeInsets.top = *MEMORY[0x263F1D1C0];
  *(_OWORD *)&self->_edgeInsets.bottom = v3;
  [(AVTAttributeSectionSeparator *)self setNeedsLayout];
  v4.receiver = self;
  v4.super_class = (Class)AVTAttributeSectionSeparator;
  [(AVTAttributeSectionSeparator *)&v4 prepareForReuse];
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

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end