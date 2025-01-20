@interface PKPaletteToolPickerEdgeView
- (PKPaletteToolPickerEdgeView)init;
- (void)_updateUI;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaletteToolPickerEdgeView

- (PKPaletteToolPickerEdgeView)init
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPaletteToolPickerEdgeView;
  v2 = [(PKPaletteToolPickerEdgeView *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_axis = 0;
    v2->_flipHorizontally = 0;
    v4 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = v4;

    [(CAGradientLayer *)v3->_gradientLayer setGeometryFlipped:1];
    v6 = [(PKPaletteToolPickerEdgeView *)v3 layer];
    [v6 insertSublayer:v3->_gradientLayer atIndex:0];

    v7 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    maskLayer = v3->_maskLayer;
    v3->_maskLayer = v7;

    [(CAGradientLayer *)v3->_maskLayer setGeometryFlipped:1];
    v9 = [MEMORY[0x1E4FB1618] blackColor];
    v10 = [v9 colorWithAlphaComponent:1.0];

    v11 = [v10 colorWithAlphaComponent:0.0];
    id v12 = v10;
    v17[0] = [v12 CGColor];
    id v13 = v11;
    v17[1] = [v13 CGColor];
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [(CAGradientLayer *)v3->_maskLayer setColors:v14];

    [(CAGradientLayer *)v3->_gradientLayer setMask:v3->_maskLayer];
    -[PKPaletteToolPickerEdgeView _updateUI]((uint64_t)v3);
  }
  return v3;
}

- (void)_updateUI
{
  v31[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [(id)a1 traitCollection];
    BOOL v3 = [v2 userInterfaceStyle] == 2;

    v4 = [MEMORY[0x1E4FB1618] blackColor];
    v5 = [v4 colorWithAlphaComponent:dbl_1C4829D90[v3]];

    v6 = [v5 colorWithAlphaComponent:0.0];
    id v7 = v5;
    v31[0] = [v7 CGColor];
    id v8 = v6;
    v31[1] = [v8 CGColor];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    [*(id *)(a1 + 408) setColors:v9];

    uint64_t v10 = *(void *)(a1 + 432);
    if (v10) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    if (v10) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }
    if (v10) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.5;
    }
    if (v10) {
      double v14 = 0.5;
    }
    else {
      double v14 = 1.0;
    }
    if (v10) {
      double v15 = 0.5;
    }
    else {
      double v15 = 0.75;
    }
    if (v10) {
      double v16 = 0.75;
    }
    else {
      double v16 = 0.5;
    }
    objc_msgSend(*(id *)(a1 + 408), "setStartPoint:", v11, v12);
    objc_msgSend(*(id *)(a1 + 408), "setEndPoint:", v14, v13);
    objc_msgSend(*(id *)(a1 + 416), "setStartPoint:", v16, v15);
    objc_msgSend(*(id *)(a1 + 416), "setEndPoint:", v13, v14);
    double v17 = -1.0;
    if (!*(unsigned char *)(a1 + 424)) {
      double v17 = 1.0;
    }
    CATransform3DMakeScale(&v30, v17, 1.0, 1.0);
    v18 = *(void **)(a1 + 408);
    CATransform3D v29 = v30;
    [v18 setTransform:&v29];
    v19 = *(void **)(a1 + 408);
    if (v19) {
      [v19 transform];
    }
    else {
      memset(&v27, 0, sizeof(v27));
    }
    if (*(unsigned char *)(a1 + 425)) {
      double v20 = 1.0;
    }
    else {
      double v20 = -1.0;
    }
    CATransform3DScale(&v28, &v27, 1.0, v20, 1.0);
    v21 = *(void **)(a1 + 408);
    CATransform3D v26 = v28;
    [v21 setTransform:&v26];
    if (v10 == 1) {
      double v22 = -1.0;
    }
    else {
      double v22 = 1.0;
    }
    CATransform3DMakeScale(&v25, v22, 1.0, 1.0);
    v23 = *(void **)(a1 + 416);
    CATransform3D v24 = v25;
    [v23 setTransform:&v24];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteToolPickerEdgeView;
  [(PKPaletteToolPickerEdgeView *)&v3 layoutSubviews];
  [(PKPaletteToolPickerEdgeView *)self bounds];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  [(PKPaletteToolPickerEdgeView *)self bounds];
  -[CAGradientLayer setFrame:](self->_maskLayer, "setFrame:");
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteToolPickerEdgeView;
  id v4 = a3;
  [(PKPaletteToolPickerEdgeView *)&v8 traitCollectionDidChange:v4];
  v5 = [(PKPaletteToolPickerEdgeView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[PKPaletteToolPickerEdgeView _updateUI]((uint64_t)self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);

  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end