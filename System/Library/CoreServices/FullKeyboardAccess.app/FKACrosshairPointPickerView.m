@interface FKACrosshairPointPickerView
- (CGPoint)selectedPoint;
- (CGPoint)selectedScreenPoint;
- (FKACrosshairPointPickerView)initWithFrame:(CGRect)a3;
- (UIView)horizontalLineView;
- (UIView)verticalLineView;
- (double)_xIncrement;
- (double)_yIncrement;
- (unint64_t)xPrecisionLevel;
- (unint64_t)yPrecisionLevel;
- (void)decreaseXPrecision;
- (void)decreaseYPrecision;
- (void)increaseXPrecision;
- (void)increaseYPrecision;
- (void)layoutSubviews;
- (void)moveDown;
- (void)moveLeft;
- (void)moveRight;
- (void)moveUp;
- (void)setHorizontalLineView:(id)a3;
- (void)setSelectedPoint:(CGPoint)a3;
- (void)setVerticalLineView:(id)a3;
- (void)setXPrecisionLevel:(unint64_t)a3;
- (void)setYPrecisionLevel:(unint64_t)a3;
@end

@implementation FKACrosshairPointPickerView

- (FKACrosshairPointPickerView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)FKACrosshairPointPickerView;
  v3 = -[FKACrosshairPointPickerView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (FKACrosshairPointPickerView *)v3;
  if (v3)
  {
    __asm { FMOV            V0.2D, #0.5 }
    *(_OWORD *)(v3 + 40) = _Q0;
    uint64_t v10 = objc_opt_new();
    verticalLineView = v4->_verticalLineView;
    v4->_verticalLineView = (UIView *)v10;

    v12 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.4];
    [(UIView *)v4->_verticalLineView setBackgroundColor:v12];

    uint64_t v13 = objc_opt_new();
    horizontalLineView = v4->_horizontalLineView;
    v4->_horizontalLineView = (UIView *)v13;

    v15 = +[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.4];
    [(UIView *)v4->_horizontalLineView setBackgroundColor:v15];

    [(FKACrosshairPointPickerView *)v4 addSubview:v4->_verticalLineView];
    [(FKACrosshairPointPickerView *)v4 addSubview:v4->_horizontalLineView];
  }
  return v4;
}

- (CGPoint)selectedScreenPoint
{
  v3 = +[UIScreen mainScreen];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  double MinX = CGRectGetMinX(v28);
  [(FKACrosshairPointPickerView *)self selectedPoint];
  double v14 = v13;
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  double v15 = MinX + v14 * CGRectGetWidth(v29);
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  double MinY = CGRectGetMinY(v30);
  [(FKACrosshairPointPickerView *)self selectedPoint];
  double v18 = v17;
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  double v19 = MinY + v18 * CGRectGetHeight(v31);
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  double v20 = CGRectGetMinX(v32) + 1.0;
  if (v15 >= v20) {
    double v21 = v15;
  }
  else {
    double v21 = v20;
  }
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  double v22 = CGRectGetMaxX(v33) + -1.0;
  if (v21 >= v22) {
    double v21 = v22;
  }
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  double v23 = CGRectGetMinY(v34) + 1.0;
  if (v19 < v23) {
    double v19 = v23;
  }
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  double v24 = CGRectGetMaxY(v35) + -1.0;
  if (v19 >= v24) {
    double v25 = v24;
  }
  else {
    double v25 = v19;
  }
  double v26 = v21;
  result.y = v25;
  result.x = v26;
  return result;
}

- (void)setSelectedPoint:(CGPoint)a3
{
  if (self->_selectedPoint.x != a3.x || self->_selectedPoint.y != a3.y)
  {
    self->_selectedPoint = a3;
    [(FKACrosshairPointPickerView *)self setNeedsLayout];
  }
}

- (void)moveLeft
{
  [(FKACrosshairPointPickerView *)self selectedPoint];
  double v4 = v3;
  double v6 = v5;
  [(FKACrosshairPointPickerView *)self _xIncrement];
  double v8 = fmax(v4 - v7, 0.0);

  -[FKACrosshairPointPickerView setSelectedPoint:](self, "setSelectedPoint:", v8, v6);
}

- (void)moveRight
{
  [(FKACrosshairPointPickerView *)self selectedPoint];
  double v4 = v3;
  double v6 = v5;
  [(FKACrosshairPointPickerView *)self _xIncrement];
  double v8 = v4 + v7;
  if (v8 > 1.0) {
    double v8 = 1.0;
  }

  -[FKACrosshairPointPickerView setSelectedPoint:](self, "setSelectedPoint:", v8, v6);
}

- (void)moveUp
{
  [(FKACrosshairPointPickerView *)self selectedPoint];
  double v4 = v3;
  double v6 = v5;
  [(FKACrosshairPointPickerView *)self _yIncrement];
  double v8 = fmax(v6 - v7, 0.0);

  -[FKACrosshairPointPickerView setSelectedPoint:](self, "setSelectedPoint:", v4, v8);
}

- (void)moveDown
{
  [(FKACrosshairPointPickerView *)self selectedPoint];
  double v4 = v3;
  double v6 = v5;
  [(FKACrosshairPointPickerView *)self _yIncrement];
  double v8 = v6 + v7;
  double v9 = 1.0;
  if (v8 <= 1.0) {
    double v9 = v8;
  }

  -[FKACrosshairPointPickerView setSelectedPoint:](self, "setSelectedPoint:", v4, v9);
}

- (void)increaseXPrecision
{
  double v3 = (char *)[(FKACrosshairPointPickerView *)self xPrecisionLevel] + 1;

  [(FKACrosshairPointPickerView *)self setXPrecisionLevel:v3];
}

- (void)decreaseXPrecision
{
  if ([(FKACrosshairPointPickerView *)self xPrecisionLevel])
  {
    double v3 = (char *)[(FKACrosshairPointPickerView *)self xPrecisionLevel] - 1;
    [(FKACrosshairPointPickerView *)self setXPrecisionLevel:v3];
  }
}

- (void)increaseYPrecision
{
  double v3 = (char *)[(FKACrosshairPointPickerView *)self yPrecisionLevel] + 1;

  [(FKACrosshairPointPickerView *)self setYPrecisionLevel:v3];
}

- (void)decreaseYPrecision
{
  if ([(FKACrosshairPointPickerView *)self yPrecisionLevel])
  {
    double v3 = (char *)[(FKACrosshairPointPickerView *)self yPrecisionLevel] - 1;
    [(FKACrosshairPointPickerView *)self setYPrecisionLevel:v3];
  }
}

- (void)layoutSubviews
{
  [(FKACrosshairPointPickerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v11 = [(FKACrosshairPointPickerView *)self traitCollection];
  v12 = [v11 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v12)) {
    double v13 = 8.0;
  }
  else {
    double v13 = 4.0;
  }

  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  double MinX = CGRectGetMinX(v37);
  [(FKACrosshairPointPickerView *)self selectedPoint];
  double v16 = v15;
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  double v17 = MinX + v16 * CGRectGetWidth(v38);
  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.width = v13;
  v39.size.height = v10;
  double v18 = v17 - CGRectGetWidth(v39);
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  double v19 = CGRectGetMinX(v40);
  if (v18 < v19) {
    double v18 = v19;
  }
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  double MaxX = CGRectGetMaxX(v41);
  v42.origin.x = v18;
  v42.origin.y = v6;
  v42.size.width = v13;
  v42.size.height = v10;
  double v21 = MaxX - CGRectGetWidth(v42);
  if (v18 >= v21) {
    double v18 = v21;
  }
  double v22 = [(FKACrosshairPointPickerView *)self verticalLineView];
  objc_msgSend(v22, "setFrame:", v18, v6, v13, v10);

  double v23 = [(FKACrosshairPointPickerView *)self traitCollection];
  double v24 = [v23 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v24)) {
    double v25 = 8.0;
  }
  else {
    double v25 = 4.0;
  }

  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  double MinY = CGRectGetMinY(v43);
  [(FKACrosshairPointPickerView *)self selectedPoint];
  double v28 = v27;
  v44.origin.x = v4;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  double v29 = MinY + v28 * CGRectGetHeight(v44);
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v25;
  double v30 = v29 - CGRectGetHeight(v45);
  v46.origin.x = v4;
  v46.origin.y = v6;
  v46.size.width = v8;
  v46.size.height = v10;
  double v31 = CGRectGetMinY(v46);
  if (v30 < v31) {
    double v30 = v31;
  }
  v47.origin.x = v4;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  double MaxY = CGRectGetMaxY(v47);
  v48.origin.x = v4;
  v48.origin.y = v30;
  v48.size.width = v8;
  v48.size.height = v25;
  double v33 = MaxY - CGRectGetHeight(v48);
  if (v30 >= v33) {
    double v34 = v33;
  }
  else {
    double v34 = v30;
  }
  id v35 = [(FKACrosshairPointPickerView *)self horizontalLineView];
  objc_msgSend(v35, "setFrame:", v4, v34, v8, v25);
}

- (double)_xIncrement
{
  return exp2(-(double)[(FKACrosshairPointPickerView *)self xPrecisionLevel]) * 0.25;
}

- (double)_yIncrement
{
  return exp2(-(double)[(FKACrosshairPointPickerView *)self yPrecisionLevel]) * 0.25;
}

- (UIView)verticalLineView
{
  return self->_verticalLineView;
}

- (void)setVerticalLineView:(id)a3
{
}

- (UIView)horizontalLineView
{
  return self->_horizontalLineView;
}

- (void)setHorizontalLineView:(id)a3
{
}

- (CGPoint)selectedPoint
{
  double x = self->_selectedPoint.x;
  double y = self->_selectedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)xPrecisionLevel
{
  return self->_xPrecisionLevel;
}

- (void)setXPrecisionLevel:(unint64_t)a3
{
  self->_xPrecisionLevel = a3;
}

- (unint64_t)yPrecisionLevel
{
  return self->_yPrecisionLevel;
}

- (void)setYPrecisionLevel:(unint64_t)a3
{
  self->_yPrecisionLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalLineView, 0);

  objc_storeStrong((id *)&self->_verticalLineView, 0);
}

@end