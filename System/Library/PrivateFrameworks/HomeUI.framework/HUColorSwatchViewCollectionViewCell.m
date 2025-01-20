@interface HUColorSwatchViewCollectionViewCell
- (HUColorSwatchView)swatchView;
- (HUColorSwatchViewCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HUColorSwatchViewCollectionViewCell

- (HUColorSwatchViewCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUColorSwatchViewCollectionViewCell;
  v3 = -[HUColorSwatchViewCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HUColorSwatchView);
    swatchView = v3->_swatchView;
    v3->_swatchView = v4;

    [(HUColorSwatchViewCollectionViewCell *)v3 addSubview:v3->_swatchView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HUColorSwatchViewCollectionViewCell;
  [(HUColorSwatchViewCollectionViewCell *)&v8 layoutSubviews];
  [(HUColorSwatchViewCollectionViewCell *)self frame];
  double v4 = v3;
  [(HUColorSwatchViewCollectionViewCell *)self frame];
  double v6 = v5;
  objc_super v7 = [(HUColorSwatchViewCollectionViewCell *)self swatchView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);
}

- (HUColorSwatchView)swatchView
{
  return self->_swatchView;
}

- (void).cxx_destruct
{
}

@end