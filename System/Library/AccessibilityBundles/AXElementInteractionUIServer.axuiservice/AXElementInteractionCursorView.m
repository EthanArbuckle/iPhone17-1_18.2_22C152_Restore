@interface AXElementInteractionCursorView
+ (CGRect)resizeFrameForDisplay:(CGRect)a3;
- (AXElementInteractionCursorView)initWithFrame:(CGRect)a3;
- (BOOL)isHidden;
- (BOOL)userInteractionEnabled;
- (CGPath)path;
- (CGRect)cursorFrame;
- (UIColor)backgroundColor;
- (double)lineWidth;
- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4;
- (id)_retrieveFrameBezierPath:(CGRect)a3;
- (id)_retrievePathBezierPaths;
- (void)_orderIn;
- (void)_orderOut;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setPath:(CGPath *)a3;
@end

@implementation AXElementInteractionCursorView

+ (CGRect)resizeFrameForDisplay:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a3.size.width >= 15.0) {
    double v5 = 2.5;
  }
  else {
    double v5 = 15.0 - a3.size.width + 2.5;
  }
  if (a3.size.height >= 15.0) {
    double v6 = 2.5;
  }
  else {
    double v6 = 15.0 - a3.size.height;
  }
  double v21 = v6;
  double v22 = v5;
  double v7 = fabs(x);
  if (x >= 0.0) {
    double v7 = 0.0;
  }
  double v8 = a3.size.width - v7;
  double v9 = fabs(a3.origin.y);
  if (a3.origin.y >= 0.0) {
    double v9 = 0.0;
  }
  double v10 = a3.size.height - v9;
  AXDeviceGetMainScreenPixelBounds();
  CGFloat v11 = v24.origin.x;
  CGFloat v12 = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  if (v8 > CGRectGetWidth(v24))
  {
    v25.origin.double x = v11;
    v25.origin.double y = v12;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double v8 = CGRectGetWidth(v25) - v22;
  }
  v26.origin.double x = v11;
  v26.origin.double y = v12;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  if (v10 > CGRectGetHeight(v26))
  {
    v27.origin.double x = v11;
    v27.origin.double y = v12;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double v10 = CGRectGetHeight(v27) - v21;
  }
  double v16 = v21;
  double v15 = v22;
  if (y >= 0.0) {
    double v17 = y;
  }
  else {
    double v17 = v21;
  }
  if (x >= 0.0) {
    double v18 = x;
  }
  else {
    double v18 = v22;
  }
  if (v8 - v22 * 2.0 <= 0.0) {
    double v15 = 0.0;
  }
  if (v10 - v21 * 2.0 <= 0.0) {
    double v16 = 0.0;
  }
  double v19 = v8;
  double v20 = v10;

  return CGRectInset(*(CGRect *)(&v17 - 1), v15, v16);
}

- (AXElementInteractionCursorView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXElementInteractionCursorView;
  v3 = -[AXElementInteractionCursorView initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AXElementInteractionCursorView *)v3 setClipsToBounds:1];
  [(AXElementInteractionCursorView *)v3 setOpaque:0];
  return v3;
}

- (void)dealloc
{
  [(AXElementInteractionCursorView *)self setPath:0];
  v3.receiver = self;
  v3.super_class = (Class)AXElementInteractionCursorView;
  [(AXElementInteractionCursorView *)&v3 dealloc];
}

- (void)setPath:(CGPath *)a3
{
  if (a3 && !CGPathIsEmpty(a3))
  {
    self->_path = a3;
    CFRetain(a3);
    id v6 = [(AXElementInteractionCursorView *)self window];
    [v6 frame];
    -[AXElementInteractionCursorView setFrame:](self, "setFrame:");
  }
  else
  {
    path = self->_path;
    if (path)
    {
      CFRelease(path);
      self->_path = 0;
    }
  }
}

- (BOOL)userInteractionEnabled
{
  return 0;
}

- (void)setIsHidden:(BOOL)a3
{
  if (!self->_isHidden || a3)
  {
    if (!self->_isHidden && a3)
    {
      self->_isHidden = 1;
      [(AXElementInteractionCursorView *)self _orderOut];
    }
  }
  else
  {
    self->_isHidden = 0;
    [(AXElementInteractionCursorView *)self _orderIn];
  }
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)_orderOut
{
  [(AXElementInteractionCursorView *)self alpha];
  self->_cachedAlpha = v3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1760;
  v4[3] = &unk_4170;
  v4[4] = self;
  +[UIView animateWithDuration:196608 delay:v4 options:0 animations:0.05 completion:0.0];
}

- (void)_orderIn
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_17F8;
  v2[3] = &unk_4170;
  v2[4] = self;
  +[UIView animateWithDuration:196608 delay:v2 options:0 animations:0.05 completion:0.0];
}

- (double)lineWidth
{
  return 2.0;
}

- (void)setCursorFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(AXElementInteractionCursorView *)self lineWidth];
  CGFloat v9 = -(v8 + 6.0);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGRect v17 = CGRectInset(v16, v9, v9);
  double v10 = v17.origin.x;
  double v11 = v17.origin.y;
  double v12 = v17.size.width;
  double v13 = v17.size.height;
  BOOL v14 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:0];
  -[AXElementInteractionCursorView setFrame:](self, "setFrame:", v10, v11, v12, v13);
  +[UIView setAnimationsEnabled:v14];
  self->_cursorFrame.origin.CGFloat x = v10;
  self->_cursorFrame.origin.CGFloat y = v11;
  self->_cursorFrame.size.CGFloat width = v12;
  self->_cursorFrame.size.CGFloat height = v13;

  [(AXElementInteractionCursorView *)self setNeedsDisplay];
}

- (id)_retrievePathBezierPaths
{
  if (self->_path)
  {
    v2 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:");
    objc_super v5 = v2;
    double v3 = +[NSArray arrayWithObjects:&v5 count:1];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)_retrieveFrameBezierPath:(CGRect)a3
{
  if (CGSizeZero.width == self->_cursorFrame.size.width && CGSizeZero.height == self->_cursorFrame.size.height)
  {
    CGRect v17 = 0;
  }
  else
  {
    CGRect v20 = CGRectInset(a3, 3.0, 3.0);
    double x = v20.origin.x;
    double y = v20.origin.y;
    double width = v20.size.width;
    double height = v20.size.height;
    [(AXElementInteractionCursorView *)self lineWidth];
    if (height >= 3.0) {
      double v10 = v9;
    }
    else {
      double v10 = 0.5;
    }
    CGFloat v11 = x + v10 * 0.5;
    CGFloat v12 = y + v10 * 0.5;
    CGFloat v13 = width - v10;
    CGFloat v14 = height - v10;
    double v15 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v11, v12, v13, v14, 5.0, 5.0);
    v21.origin.double x = v11;
    v21.origin.double y = v12;
    v21.size.double width = v13;
    v21.size.double height = v14;
    CGRect v22 = CGRectInset(v21, v10 / 3.0, v10 / 3.0);
    CGRect v16 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height, 5.0, 5.0);
    CGRect v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v15, v16, 0);
  }

  return v17;
}

- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  path = self->_path;
  if (path)
  {
    IsEmptdouble y = CGPathIsEmpty(path);
    *a4 = !IsEmpty;
    if (!IsEmpty)
    {
      CGFloat v12 = [(AXElementInteractionCursorView *)self _retrievePathBezierPaths];
      goto LABEL_6;
    }
  }
  else
  {
    *a4 = 0;
  }
  CGFloat v12 = -[AXElementInteractionCursorView _retrieveFrameBezierPath:](self, "_retrieveFrameBezierPath:", x, y, width, height);
LABEL_6:

  return v12;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v16 = 0;
  double v8 = -[AXElementInteractionCursorView _retrieveBezierPaths:usingRealPaths:](self, "_retrieveBezierPaths:usingRealPaths:", &v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRect v18 = CGRectInset(v17, 3.0, 3.0);
  double v9 = v18.size.height;
  [(AXElementInteractionCursorView *)self lineWidth];
  if (v9 < 3.0) {
    double v10 = 0.5;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1CC0;
  v12[3] = &unk_4198;
  double v14 = v10;
  char v15 = v16;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v11 enumerateObjectsUsingBlock:v12];
}

- (CGPath)path
{
  return self->_path;
}

- (CGRect)cursorFrame
{
  double x = self->_cursorFrame.origin.x;
  double y = self->_cursorFrame.origin.y;
  double width = self->_cursorFrame.size.width;
  double height = self->_cursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end