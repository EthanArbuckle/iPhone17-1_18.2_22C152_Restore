@interface PKPaletteToolShadowPathView
- (CGSize)intrinsicContentSize;
- (PKPaletteToolShadowPathView)initWithToolConfiguration:(id)a3;
- (double)scalingFactor;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_applyLargeShadowToLayer:(id)a3;
- (void)_applySmallShadowToLayer:(id)a3;
- (void)_updateUI;
- (void)applyShadowToLayer:(id)a3;
- (void)layoutSubviews;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setScalingFactor:(double)a3;
@end

@implementation PKPaletteToolShadowPathView

- (PKPaletteToolShadowPathView)initWithToolConfiguration:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaletteToolShadowPathView;
  v5 = -[PKPaletteToolShadowPathView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(PKPaletteToolShadowPathView *)v5 setUserInteractionEnabled:0];
    v7 = [(PKPaletteToolShadowPathView *)v6 layer];
    [v7 setMasksToBounds:0];

    id v8 = [v4 shadowPath];
    uint64_t v9 = [v8 CGPath];

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    largeShadow = v6->_largeShadow;
    v6->_largeShadow = v10;

    [(UIView *)v6->_largeShadow setUserInteractionEnabled:0];
    v12 = [(UIView *)v6->_largeShadow layer];
    [v12 setShadowPath:v9];

    v13 = [(UIView *)v6->_largeShadow layer];
    [(PKPaletteToolShadowPathView *)v6 _applyLargeShadowToLayer:v13];

    [(PKPaletteToolShadowPathView *)v6 addSubview:v6->_largeShadow];
    id v14 = [v4 shadowPathIncludingTip];
    uint64_t v15 = [v14 CGPath];

    if (v15) {
      uint64_t v9 = v15;
    }
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    smallShadow = v6->_smallShadow;
    v6->_smallShadow = v16;

    [(UIView *)v6->_smallShadow setUserInteractionEnabled:0];
    v18 = [(UIView *)v6->_smallShadow layer];
    [v18 setShadowPath:v9];

    v19 = [(UIView *)v6->_smallShadow layer];
    [(PKPaletteToolShadowPathView *)v6 _applySmallShadowToLayer:v19];

    [(PKPaletteToolShadowPathView *)v6 addSubview:v6->_smallShadow];
    [(PKPaletteToolShadowPathView *)v6 _updateUI];
  }

  return v6;
}

- (void)applyShadowToLayer:(id)a3
{
  id v20 = a3;
  [(PKPaletteToolShadowPathView *)self _applyLargeShadowToLayer:v20];
  [v20 shadowRadius];
  double v5 = v4;
  [(PKPaletteToolShadowPathView *)self scalingFactor];
  [v20 setShadowRadius:v5 * v6];
  [v20 shadowOffset];
  double v8 = v7;
  [(PKPaletteToolShadowPathView *)self scalingFactor];
  double v10 = v8 * v9;
  [v20 shadowOffset];
  double v12 = v11;
  [(PKPaletteToolShadowPathView *)self scalingFactor];
  objc_msgSend(v20, "setShadowOffset:", v10, v12 * v13);
  if ([(PKPaletteToolShadowPathView *)self edgeLocation] == 2)
  {
    [v20 shadowOffset];
    double v15 = -v14;
    [v20 shadowOffset];
    double v17 = v16;
  }
  else
  {
    if ([(PKPaletteToolShadowPathView *)self edgeLocation] != 8) {
      goto LABEL_6;
    }
    [v20 shadowOffset];
    double v15 = v18;
    [v20 shadowOffset];
    double v17 = -v19;
  }
  objc_msgSend(v20, "setShadowOffset:", v15, v17);
LABEL_6:
}

- (void)_applyLargeShadowToLayer:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  id v4 = [v3 blackColor];
  objc_msgSend(v6, "setShadowColor:", objc_msgSend(v4, "CGColor"));

  [v6 setShadowRadius:8.0];
  LODWORD(v5) = 1036831949;
  [v6 setShadowOpacity:v5];
  objc_msgSend(v6, "setShadowOffset:", 0.0, 3.0);
}

- (void)_applySmallShadowToLayer:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  id v4 = [v3 blackColor];
  objc_msgSend(v6, "setShadowColor:", objc_msgSend(v4, "CGColor"));

  [v6 setShadowRadius:1.0];
  LODWORD(v5) = 1041865114;
  [v6 setShadowOpacity:v5];
  objc_msgSend(v6, "setShadowOffset:", 0.0, 3.0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteToolShadowPathView;
  [(PKPaletteToolShadowPathView *)&v3 layoutSubviews];
  [(PKPaletteToolShadowPathView *)self bounds];
  -[UIView setFrame:](self->_largeShadow, "setFrame:");
  [(PKPaletteToolShadowPathView *)self bounds];
  -[UIView setFrame:](self->_smallShadow, "setFrame:");
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteToolShadowPathView *)self _updateUI];
    [(PKPaletteToolShadowPathView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteToolShadowPathView *)self _updateUI];
    [(PKPaletteToolShadowPathView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_updateUI
{
  if ([(PKPaletteToolShadowPathView *)self edgeLocation] == 2)
  {
    double v3 = 1.57079633;
  }
  else if ([(PKPaletteToolShadowPathView *)self edgeLocation] == 8)
  {
    double v3 = -1.57079633;
  }
  else
  {
    double v3 = 0.0;
  }
  memset(&v14, 0, sizeof(v14));
  [(PKPaletteToolShadowPathView *)self scalingFactor];
  CGFloat v5 = v4;
  [(PKPaletteToolShadowPathView *)self scalingFactor];
  CGAffineTransformMakeScale(&v14, v5, v6);
  CGAffineTransform v12 = v14;
  CGAffineTransformRotate(&v13, &v12, v3);
  largeShadow = self->_largeShadow;
  CGAffineTransform v11 = v13;
  [(UIView *)largeShadow setTransform:&v11];
  CGAffineTransform v12 = v14;
  CGAffineTransformRotate(&v10, &v12, v3);
  smallShadow = self->_smallShadow;
  CGAffineTransform v9 = v10;
  [(UIView *)smallShadow setTransform:&v9];
}

- (CGSize)intrinsicContentSize
{
  unint64_t v3 = [(PKPaletteToolShadowPathView *)self edgeLocation];
  double v4 = 46.0;
  double v5 = 106.0;
  if (v3 != 2 && v3 != 8)
  {
    double v4 = 106.0;
    double v5 = 46.0;
  }
  [(PKPaletteToolShadowPathView *)self scalingFactor];
  double v7 = v4 * v6;
  double v8 = v5 * v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallShadow, 0);

  objc_storeStrong((id *)&self->_largeShadow, 0);
}

@end