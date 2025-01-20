@interface _PKColorPickerView
- (BOOL)pointIsSignificantlyOutside:(CGPoint)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKColorMatrixView)gridColorPicker;
- (PKColorPickerCrosshairView)crosshairView;
- (UIColor)initialColor;
- (UIColor)selectedColor;
- (UIPanGestureRecognizer)crosshairPanGR;
- (_PKColorPickerView)initWithFrame:(CGRect)a3;
- (_PKColorPickerViewDelegate)delegate;
- (void)_setSelectedColorForPoint:(CGPoint)a3;
- (void)colorPickerImplementationDidChangeSelectedColor:(id)a3;
- (void)colorPickerImplementationUserDidTouchUpInside:(id)a3;
- (void)didPanCrosshair:(id)a3;
- (void)layoutSubviews;
- (void)setCrosshairPanGR:(id)a3;
- (void)setCrosshairView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGridColorPicker:(id)a3;
- (void)setInitialColor:(id)a3;
- (void)setSelectedColor:(id)a3;
@end

@implementation _PKColorPickerView

- (_PKColorPickerView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_PKColorPickerView;
  v3 = -[_PKColorPickerView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_PKColorPickerView *)v3 setClipsToBounds:0];
  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  selectedColor = v3->_selectedColor;
  v3->_selectedColor = (UIColor *)v4;

  v6 = [PKColorMatrixView alloc];
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v11 = -[PKColorMatrixView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  gridColorPicker = v3->_gridColorPicker;
  v3->_gridColorPicker = (PKColorMatrixView *)v11;

  [(PKColorMatrixView *)v3->_gridColorPicker setColorPickerDelegate:v3];
  v13 = [(_PKColorPickerView *)v3 selectedColor];
  [(PKColorMatrixView *)v3->_gridColorPicker setSelectedColor:v13];

  v14 = [(PKColorMatrixView *)v3->_gridColorPicker layer];
  [v14 setCornerRadius:9.0];

  [(PKColorMatrixView *)v3->_gridColorPicker setClipsToBounds:1];
  v15 = -[PKColorPickerCrosshairView initWithFrame:]([PKColorPickerCrosshairView alloc], "initWithFrame:", v7, v8, v9, v10);
  crosshairView = v3->_crosshairView;
  v3->_crosshairView = v15;

  [(PKColorPickerCrosshairView *)v3->_crosshairView setDelegate:v3->_gridColorPicker];
  uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v3 action:sel_didPanCrosshair_];
  crosshairPanGR = v3->_crosshairPanGR;
  v3->_crosshairPanGR = (UIPanGestureRecognizer *)v17;

  [(_PKColorPickerView *)v3 addGestureRecognizer:v3->_crosshairPanGR];
  [(_PKColorPickerView *)v3 addSubview:v3->_gridColorPicker];
  [(_PKColorPickerView *)v3 addSubview:v3->_crosshairView];
  v19 = [(_PKColorPickerView *)v3 crosshairView];
  [v19 update];

  [(_PKColorPickerView *)v3 setAccessibilityIdentifier:@"gridColorPicker"];
  [(PKColorMatrixView *)v3->_gridColorPicker setHidden:0];
  return v3;
}

- (void)setSelectedColor:(id)a3
{
  id v4 = a3;
  v5 = [(_PKColorPickerView *)self gridColorPicker];
  v6 = [v5 representableColorForColor:v4];

  selectedColor = self->_selectedColor;
  self->_selectedColor = v6;
  double v8 = v6;

  double v9 = [(_PKColorPickerView *)self gridColorPicker];
  [v9 setSelectedColor:v8];

  [(_PKColorPickerView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_PKColorPickerView;
  [(_PKColorPickerView *)&v13 layoutSubviews];
  [(_PKColorPickerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(_PKColorPickerView *)self gridColorPicker];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(_PKColorPickerView *)self crosshairView];
  [v12 update];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 352.0;
  double v4 = 296.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didPanCrosshair:(id)a3
{
  id v7 = a3;
  if ([v7 state] == 1)
  {
    double v4 = [(_PKColorPickerView *)self selectedColor];
    initialColor = self->_initialColor;
    self->_initialColor = v4;
  }
  else if ([v7 state] == 2)
  {
    [v7 locationInView:self];
    -[_PKColorPickerView _setSelectedColorForPoint:](self, "_setSelectedColorForPoint:");
  }
  else if ([v7 state] == 3)
  {
    double v6 = [(_PKColorPickerView *)self delegate];
    [v6 _colorPickerViewUserDidTouchUpInside:self];
  }
}

- (void)_setSelectedColorForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (fabs(a3.x) != INFINITY && fabs(a3.y) != INFINITY)
  {
    double v6 = [(_PKColorPickerView *)self crosshairView];
    objc_msgSend(v6, "setCenter:", x, y);

    if (-[_PKColorPickerView pointIsSignificantlyOutside:](self, "pointIsSignificantlyOutside:", x, y)
      && self->_initialColor)
    {
      id v7 = [(_PKColorPickerView *)self crosshairView];
      double v8 = [v7 delegate];
      [v8 colorPickerCrosshairViewShouldUpdateWithColor:self->_initialColor];
    }
    else
    {
      id v7 = [(_PKColorPickerView *)self crosshairView];
      double v8 = [v7 delegate];
      double v9 = [(_PKColorPickerView *)self crosshairView];
      objc_msgSend(v8, "colorPickerCrosshairViewShouldUpdateColor:point:", v9, x, y);
    }
    [(_PKColorPickerView *)self setNeedsLayout];
  }
}

- (BOOL)pointIsSignificantlyOutside:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(_PKColorPickerView *)self bounds];
  DKDDistanceToRect(x, y, v6, v7, v8, v9);
  double v11 = v10;
  [(_PKColorPickerView *)self frame];
  double v13 = v12;
  v14 = +[PKColorMatrixView defaultColorMatrix];
  double v15 = v13 / (double)(unint64_t)[v14 count] * 5.0;

  if (v11 <= v15) {
    return 0;
  }
  [(_PKColorPickerView *)self bounds];
  v17.CGFloat x = x;
  v17.CGFloat y = y;
  return !CGRectContainsPoint(v18, v17);
}

- (void)colorPickerImplementationDidChangeSelectedColor:(id)a3
{
  double v4 = [a3 selectedColor];
  [(_PKColorPickerView *)self setSelectedColor:v4];

  id v5 = [(_PKColorPickerView *)self delegate];
  [v5 _colorPickerViewDidChangeSelectedColor:self];
}

- (void)colorPickerImplementationUserDidTouchUpInside:(id)a3
{
  id v4 = [(_PKColorPickerView *)self delegate];
  [v4 _colorPickerViewUserDidTouchUpInside:self];
}

- (_PKColorPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_PKColorPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (UIColor)initialColor
{
  return self->_initialColor;
}

- (void)setInitialColor:(id)a3
{
}

- (UIPanGestureRecognizer)crosshairPanGR
{
  return self->_crosshairPanGR;
}

- (void)setCrosshairPanGR:(id)a3
{
}

- (PKColorPickerCrosshairView)crosshairView
{
  return self->_crosshairView;
}

- (void)setCrosshairView:(id)a3
{
}

- (PKColorMatrixView)gridColorPicker
{
  return self->_gridColorPicker;
}

- (void)setGridColorPicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridColorPicker, 0);
  objc_storeStrong((id *)&self->_crosshairView, 0);
  objc_storeStrong((id *)&self->_crosshairPanGR, 0);
  objc_storeStrong((id *)&self->_initialColor, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end