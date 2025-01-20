@interface VOTUICursorView
+ (CGRect)resizeFrameForDisplay:(CGRect)a3;
- (BOOL)isHidden;
- (BOOL)largeCursorEnabled;
- (BOOL)userInteractionEnabled;
- (CGPath)path;
- (CGRect)resizeFrameForWindow:(CGRect)a3;
- (CGSize)cornerRadius;
- (VOTUICursorView)initWithFrame:(CGRect)a3;
- (double)lineWidth;
- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4;
- (id)_retrieveFrameBezierPath:(CGRect)a3;
- (id)_retrievePathBezierPaths;
- (void)_orderIn;
- (void)_orderOut;
- (void)_traitCollectionDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setIsHidden:(BOOL)a3;
- (void)setPath:(CGPath *)a3;
@end

@implementation VOTUICursorView

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
  double v26 = v6;
  double v28 = v5;
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
  v11 = +[UIScreen mainScreen];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v30.origin.double x = v13;
  v30.origin.double y = v15;
  v30.size.width = v17;
  v30.size.height = v19;
  if (v8 > CGRectGetWidth(v30))
  {
    v31.origin.double x = v13;
    v31.origin.double y = v15;
    v31.size.width = v17;
    v31.size.height = v19;
    double v8 = CGRectGetWidth(v31) - v28;
  }
  v32.origin.double x = v13;
  v32.origin.double y = v15;
  v32.size.width = v17;
  v32.size.height = v19;
  if (v10 > CGRectGetHeight(v32))
  {
    v33.origin.double x = v13;
    v33.origin.double y = v15;
    v33.size.width = v17;
    v33.size.height = v19;
    double v10 = CGRectGetHeight(v33) - v27;
  }
  double v21 = v27;
  double v20 = v28;
  if (y >= 0.0) {
    double v22 = y;
  }
  else {
    double v22 = v27;
  }
  if (x >= 0.0) {
    double v23 = x;
  }
  else {
    double v23 = v28;
  }
  if (v8 - v28 * 2.0 <= 0.0) {
    double v20 = 0.0;
  }
  if (v10 - v27 * 2.0 <= 0.0) {
    double v21 = 0.0;
  }
  double v24 = v8;
  double v25 = v10;

  return CGRectInset(*(CGRect *)(&v22 - 1), v20, v21);
}

- (CGRect)resizeFrameForWindow:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [(VOTUICursorView *)self window];
  [v7 bounds];
  UIRectInset();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  uint64_t v16 = v9;
  uint64_t v17 = v11;
  uint64_t v18 = v13;
  uint64_t v19 = v15;
  CGFloat v20 = x;
  CGFloat v21 = y;
  CGFloat v22 = width;
  CGFloat v23 = height;

  return CGRectIntersection(*(CGRect *)&v16, *(CGRect *)&v20);
}

- (VOTUICursorView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VOTUICursorView;
  v3 = -[VOTUICursorView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VOTUICursorView *)v3 setClipsToBounds:1];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_CF78;
  v12[4] = sub_CF88;
  v4 = v3;
  uint64_t v13 = v4;
  double v5 = +[AXSettings sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_CF90;
  v11[3] = &unk_3D238;
  v11[4] = v12;
  [v5 registerUpdateBlock:v11 forRetrieveSelector:"voiceOverLargeCursorEnabled" withListener:v4];

  [(VOTUICursorView *)v4 setOpaque:0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  double v6 = +[NSArray arrayWithObjects:v15 count:2];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_CFA0;
  v10[3] = &unk_3D260;
  v10[4] = v12;
  id v7 = [(VOTUICursorView *)v4 registerForTraitChanges:v6 withHandler:v10];

  uint64_t v8 = v4;
  _Block_object_dispose(v12, 8);

  return v8;
}

- (void)dealloc
{
  [(VOTUICursorView *)self setPath:0];
  v3.receiver = self;
  v3.super_class = (Class)VOTUICursorView;
  [(VOTUICursorView *)&v3 dealloc];
}

- (BOOL)largeCursorEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 voiceOverLargeCursorEnabled];

  return v3;
}

- (void)setPath:(CGPath *)a3
{
  BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
  if (!a3) {
    goto LABEL_4;
  }
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  if (CGPathIsEmpty(a3)
    || (v14.origin.x = x, v14.origin.CGFloat y = y, v14.size.width = width, v14.size.height = height, CGRectIsEmpty(v14)))
  {
LABEL_4:
    path = self->_path;
    if (path)
    {
      CFRelease(path);
      self->_path = 0;
    }
  }
  else
  {
    uint64_t v10 = self->_path;
    if (v10) {
      CFRelease(v10);
    }
    self->_path = a3;
    CFRetain(a3);
    id v11 = [(VOTUICursorView *)self window];
    [v11 frame];
    -[VOTUICursorView setFrame:](self, "setFrame:");
  }
}

- (void)setBackgroundColor:(id)a3
{
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
      [(VOTUICursorView *)self _orderOut];
    }
  }
  else
  {
    self->_isHidden = 0;
    [(VOTUICursorView *)self _orderIn];
  }
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)_orderOut
{
  [(VOTUICursorView *)self alpha];
  self->_cachedAlpha = v3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_D24C;
  v4[3] = &unk_3D2B0;
  v4[4] = self;
  +[UIView animateWithDuration:196608 delay:v4 options:0 animations:0.05 completion:0.0];
}

- (void)_orderIn
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_D2E4;
  v2[3] = &unk_3D2B0;
  v2[4] = self;
  +[UIView animateWithDuration:196608 delay:v2 options:0 animations:0.05 completion:0.0];
}

- (CGSize)cornerRadius
{
  [(VOTUICursorView *)self lineWidth];
  double v3 = v2 + v2;
  double v4 = v3;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (double)lineWidth
{
  unsigned int v2 = [(VOTUICursorView *)self largeCursorEnabled];
  double result = 2.0;
  if (v2) {
    return 8.0;
  }
  return result;
}

- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(VOTUICursorView *)self lineWidth];
  double v11 = v10 + 6.0;
  double v12 = -(v10 + 6.0);
  if ([(VOTUICursorView *)self largeCursorEnabled]) {
    double v13 = v11 * -1.25;
  }
  else {
    double v13 = v12;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRect v26 = CGRectInset(v25, v13, v13);
  CGFloat v14 = v26.origin.x;
  CGFloat v15 = v26.origin.y;
  CGFloat v16 = v26.size.width;
  CGFloat v17 = v26.size.height;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_D524;
  v23[3] = &unk_3D3A0;
  v23[4] = self;
  CGRect v24 = v26;
  uint64_t v18 = objc_retainBlock(v23);
  uint64_t v19 = (void (**)(void))v18;
  if (v4)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_D538;
    v21[3] = &unk_3D3C8;
    CGFloat v22 = v18;
    +[UIView animateWithDuration:196612 delay:v21 options:0 animations:0.15 completion:0.0];
  }
  else
  {
    BOOL v20 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:0];
    v19[2](v19);
    +[UIView setAnimationsEnabled:v20];
    [(VOTUICursorView *)self setNeedsDisplay];
  }
  self->_cursorFrame.origin.CGFloat x = v14;
  self->_cursorFrame.origin.CGFloat y = v15;
  self->_cursorFrame.size.CGFloat width = v16;
  self->_cursorFrame.size.CGFloat height = v17;
}

- (id)_retrievePathBezierPaths
{
  if (self->_path)
  {
    unsigned int v2 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:");
    double v5 = v2;
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
    CGFloat v23 = 0;
  }
  else
  {
    CGRect v26 = CGRectInset(a3, 3.0, 3.0);
    double x = v26.origin.x;
    double y = v26.origin.y;
    double width = v26.size.width;
    double height = v26.size.height;
    [(VOTUICursorView *)self lineWidth];
    double v10 = v9;
    [(VOTUICursorView *)self cornerRadius];
    double v12 = v11;
    double v14 = v13;
    unsigned int v15 = [(VOTUICursorView *)self largeCursorEnabled];
    if (height >= 3.0) {
      int v16 = 1;
    }
    else {
      int v16 = v15;
    }
    if (!v16) {
      double v10 = 0.5;
    }
    CGFloat v17 = x + v10 * 0.5;
    CGFloat v18 = y + v10 * 0.5;
    CGFloat v19 = width - v10;
    CGFloat v20 = height - v10;
    CGFloat v21 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v17, v18, v19, v20, v12, v14);
    v27.origin.double x = v17;
    v27.origin.double y = v18;
    v27.size.double width = v19;
    v27.size.double height = v20;
    CGRect v28 = CGRectInset(v27, v10 / 3.0, v10 / 3.0);
    CGFloat v22 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height, v12, v14);
    CGFloat v23 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v21, v22, 0);
  }

  return v23;
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
      double v12 = [(VOTUICursorView *)self _retrievePathBezierPaths];
      goto LABEL_6;
    }
  }
  else
  {
    *a4 = 0;
  }
  double v12 = -[VOTUICursorView _retrieveFrameBezierPath:](self, "_retrieveFrameBezierPath:", x, y, width, height);
LABEL_6:

  return v12;
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4 = [a3 userInterfaceStyle];
  double v5 = [(VOTUICursorView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    [(VOTUICursorView *)self setNeedsDisplay];
    [(VOTUICursorView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  char v16 = 0;
  [(VOTUICursorView *)self bounds];
  double v3 = -[VOTUICursorView _retrieveBezierPaths:usingRealPaths:](self, "_retrieveBezierPaths:usingRealPaths:", &v16);
  id v4 = [(VOTUICursorView *)self layer];
  double v5 = [v4 sublayers];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= 1)
  {
    do
    {
      id v7 = objc_alloc_init((Class)CAShapeLayer);
      uint64_t v8 = [(VOTUICursorView *)self layer];
      [v8 addSublayer:v7];

      double v9 = [(VOTUICursorView *)self layer];
      double v10 = [v9 sublayers];
      id v11 = [v10 count];
    }
    while ((unint64_t)v11 < 2);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_DA08;
  v13[3] = &unk_3D3F0;
  char v15 = v16;
  v13[4] = self;
  id v14 = v3;
  id v12 = v3;
  [v12 enumerateObjectsUsingBlock:v13];
}

- (CGPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end