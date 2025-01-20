@interface PKPaletteToolPickerClippingEdgeView
- (PKPaletteToolPickerClippingEdgeView)init;
- (void)_updateUI;
- (void)layoutSubviews;
@end

@implementation PKPaletteToolPickerClippingEdgeView

- (PKPaletteToolPickerClippingEdgeView)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteToolPickerClippingEdgeView;
  v2 = [(PKPaletteToolPickerClippingEdgeView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(PKPaletteToolPickerClippingEdgeView *)v2 setUserInteractionEnabled:0];
    v3->_axis = 0;
    v4 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = v4;

    [(CAGradientLayer *)v3->_gradientLayer setGeometryFlipped:1];
    v6 = [(PKPaletteToolPickerClippingEdgeView *)v3 layer];
    [v6 insertSublayer:v3->_gradientLayer atIndex:0];

    -[PKPaletteToolPickerClippingEdgeView _updateUI]((uint64_t)v3);
  }
  return v3;
}

- (void)_updateUI
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4FB1618] systemFillColor];
    double v3 = 0.5;
    v4 = [v2 colorWithAlphaComponent:0.5];

    v5 = [v4 colorWithAlphaComponent:0.0];
    id v6 = v4;
    v17[0] = [v6 CGColor];
    id v7 = v5;
    v17[1] = [v7 CGColor];
    objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [*(id *)(a1 + 408) setColors:v8];

    uint64_t v9 = *(void *)(a1 + 424);
    double v10 = 0.75;
    if (v9) {
      double v11 = 0.75;
    }
    else {
      double v11 = 0.5;
    }
    if (v9)
    {
      double v10 = 0.5;
      double v12 = 0.5;
    }
    else
    {
      double v12 = 1.0;
    }
    if (v9) {
      double v3 = 1.0;
    }
    objc_msgSend(*(id *)(a1 + 408), "setStartPoint:", v11, v10);
    objc_msgSend(*(id *)(a1 + 408), "setEndPoint:", v3, v12);
    double v13 = -1.0;
    if (!*(unsigned char *)(a1 + 416)) {
      double v13 = 1.0;
    }
    CATransform3DMakeScale(&v16, v13, 1.0, 1.0);
    v14 = *(void **)(a1 + 408);
    CATransform3D v15 = v16;
    [v14 setTransform:&v15];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteToolPickerClippingEdgeView;
  [(PKPaletteToolPickerClippingEdgeView *)&v3 layoutSubviews];
  [(PKPaletteToolPickerClippingEdgeView *)self bounds];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
}

- (void).cxx_destruct
{
}

@end