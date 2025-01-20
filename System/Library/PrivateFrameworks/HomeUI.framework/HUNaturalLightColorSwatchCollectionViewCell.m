@interface HUNaturalLightColorSwatchCollectionViewCell
- (HUNaturalLightColorSwatchCollectionViewCell)initWithFrame:(CGRect)a3;
- (HUNaturalLightColorSwatchView)swatchView;
- (void)layoutSubviews;
@end

@implementation HUNaturalLightColorSwatchCollectionViewCell

- (HUNaturalLightColorSwatchCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)HUNaturalLightColorSwatchCollectionViewCell;
  v5 = -[HUNaturalLightColorSwatchCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = -[HUNaturalLightColorSwatchView initWithFrame:]([HUNaturalLightColorSwatchView alloc], "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
    swatchView = v5->_swatchView;
    v5->_swatchView = v6;

    [(HUNaturalLightColorSwatchCollectionViewCell *)v5 addSubview:v5->_swatchView];
  }
  return v5;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)HUNaturalLightColorSwatchCollectionViewCell;
  [(HUNaturalLightColorSwatchCollectionViewCell *)&v10 layoutSubviews];
  [(HUNaturalLightColorSwatchCollectionViewCell *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_super v9 = [(HUNaturalLightColorSwatchCollectionViewCell *)self swatchView];
  objc_msgSend(v9, "setFrame:", v7, v8, v4, v6);
}

- (HUNaturalLightColorSwatchView)swatchView
{
  return self->_swatchView;
}

- (void).cxx_destruct
{
}

@end