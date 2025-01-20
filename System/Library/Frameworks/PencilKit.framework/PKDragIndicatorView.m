@interface PKDragIndicatorView
- (CGSize)intrinsicContentSize;
- (PKDragIndicatorView)init;
- (double)scalingFactor;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)layoutSubviews;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setScalingFactor:(double)a3;
@end

@implementation PKDragIndicatorView

- (PKDragIndicatorView)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKDragIndicatorView;
  v2 = -[PKDragIndicatorView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 1.0;
    uint64_t v4 = *MEMORY[0x1E4F39EA8];
    v5 = [(PKDragIndicatorView *)v2 layer];
    [v5 setCornerCurve:v4];
  }
  return v3;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKDragIndicatorView;
  [(PKDragIndicatorView *)&v10 layoutSubviews];
  [(PKDragIndicatorView *)self bounds];
  double v4 = v3;
  [(PKDragIndicatorView *)self bounds];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  double v7 = v6 * 0.5;
  v8 = [(PKDragIndicatorView *)self layer];
  [v8 setCornerRadius:v7];

  v9 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_paletteButtonBackgroundColor");
  [(PKDragIndicatorView *)self setBackgroundColor:v9];
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKDragIndicatorView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setScalingFactor:(double)a3
{
  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    [(PKDragIndicatorView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  unint64_t v3 = [(PKDragIndicatorView *)self edgeLocation];
  BOOL v5 = v3 == 2 || v3 == 8;
  double v6 = PKPaletteDragHandleSize(v5);
  double v8 = v7;
  [(PKDragIndicatorView *)self scalingFactor];
  double v10 = v8 * v9;
  double v11 = v6 * v9;
  result.height = v10;
  result.width = v11;
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

@end