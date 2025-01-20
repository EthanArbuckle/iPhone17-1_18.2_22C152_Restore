@interface SSUICursorView
+ (CGRect)resizeFrameForDisplay:(CGRect)a3;
- (BOOL)isHidden;
- (BOOL)largeCursorEnabled;
- (BOOL)userInteractionEnabled;
- (CGPath)path;
- (CGPoint)hotspotAdjustmentForCursorFrame:(CGRect)a3;
- (CGRect)resizeFrameForWindow:(CGRect)a3;
- (SSUICursorView)initWithFrame:(CGRect)a3;
- (double)lineWidth;
- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4;
- (id)_retrieveFrameBezierPath:(CGRect)a3;
- (id)_retrievePathBezierPaths;
- (unsigned)incomingFlags;
- (void)_orderIn;
- (void)_orderOut;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setEventFlags:(unsigned int)a3;
- (void)setIncomingFlags:(unsigned int)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setPath:(CGPath *)a3;
@end

@implementation SSUICursorView

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
  double v7 = [(SSUICursorView *)self window];
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

- (SSUICursorView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSUICursorView;
  v3 = -[SSUICursorView initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSUICursorView *)v3 setClipsToBounds:1];
  [(SSUICursorView *)v3 setOpaque:0];
  return v3;
}

- (void)dealloc
{
  [(SSUICursorView *)self setPath:0];
  v3.receiver = self;
  v3.super_class = (Class)SSUICursorView;
  [(SSUICursorView *)&v3 dealloc];
}

- (void)setEventFlags:(unsigned int)a3
{
}

- (CGPoint)hotspotAdjustmentForCursorFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  unsigned int v8 = [(SSUICursorView *)self incomingFlags];
  unsigned int v9 = [(SSUICursorView *)self incomingFlags];
  if ((v8 & 0x20000000) != 0)
  {
    if ((v9 & 0x10000000) != 0)
    {
      double x = width * 0.5 + -2.0 + CGPointZero.x;
      double y = height * 0.5 + -2.0 + y;
    }
    else
    {
      double x = width + -3.0 + CGPointZero.x;
    }
  }
  else if ((v9 & 0x10000000) != 0)
  {
    double x = width * 0.5 + -2.0 + CGPointZero.x;
    double y = y - height * 0.5;
  }
  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)setPath:(CGPath *)a3
{
  if (a3 && !CGPathIsEmpty(a3))
  {
    path = self->_path;
    if (path) {
      CFRelease(path);
    }
    self->_path = a3;
    CFRetain(a3);
    id v7 = [(SSUICursorView *)self window];
    [v7 frame];
    -[SSUICursorView setFrame:](self, "setFrame:");
  }
  else
  {
    objc_super v5 = self->_path;
    if (v5)
    {
      CFRelease(v5);
      self->_path = 0;
    }
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
      [(SSUICursorView *)self _orderOut];
    }
  }
  else
  {
    self->_isHidden = 0;
    [(SSUICursorView *)self _orderIn];
  }
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)_orderOut
{
  [(SSUICursorView *)self alpha];
  self->_cachedAlpha = v3;
  +[UIView beginAnimations:@"CursorHide" context:0];
  +[UIView setAnimationDuration:0.05];
  +[UIView setAnimationCurve:3];
  [(SSUICursorView *)self setAlpha:0.0];

  +[UIView commitAnimations];
}

- (void)_orderIn
{
  +[UIView beginAnimations:@"CursorShow" context:0];
  +[UIView setAnimationDuration:0.05];
  +[UIView setAnimationCurve:3];
  [(SSUICursorView *)self setAlpha:self->_cachedAlpha];

  +[UIView commitAnimations];
}

- (double)lineWidth
{
  unsigned int v2 = [(SSUICursorView *)self largeCursorEnabled];
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
  [(SSUICursorView *)self lineWidth];
  double v11 = v10 + 6.0;
  double v12 = -(v10 + 6.0);
  if ([(SSUICursorView *)self largeCursorEnabled]) {
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
  v23[2] = sub_9640;
  v23[3] = &unk_104E0;
  CGRect v24 = v26;
  v23[4] = self;
  uint64_t v18 = objc_retainBlock(v23);
  uint64_t v19 = (void (**)(void))v18;
  if (v4)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_96BC;
    v21[3] = &unk_105A8;
    CGFloat v22 = v18;
    +[UIView animateWithDuration:196612 delay:v21 options:0 animations:0.15 completion:0.0];
  }
  else
  {
    BOOL v20 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:0];
    v19[2](v19);
    +[UIView setAnimationsEnabled:v20];
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
    uint64_t v19 = 0;
  }
  else
  {
    CGRect v22 = CGRectInset(a3, 3.0, 3.0);
    double x = v22.origin.x;
    double y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
    [(SSUICursorView *)self lineWidth];
    double v10 = v9;
    unsigned int v11 = [(SSUICursorView *)self largeCursorEnabled];
    if (height >= 3.0) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
    if (!v12) {
      double v10 = 0.5;
    }
    CGFloat v13 = x + v10 * 0.5;
    CGFloat v14 = y + v10 * 0.5;
    CGFloat v15 = width - v10;
    CGFloat v16 = height - v10;
    CGFloat v17 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v13, v14, v15, v16, 5.0, 5.0);
    v23.origin.double x = v13;
    v23.origin.double y = v14;
    v23.size.double width = v15;
    v23.size.double height = v16;
    CGRect v24 = CGRectInset(v23, v10 / 3.0, v10 / 3.0);
    uint64_t v18 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height, 5.0, 5.0);
    uint64_t v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v17, v18, 0);
  }

  return v19;
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
      int v12 = [(SSUICursorView *)self _retrievePathBezierPaths];
      goto LABEL_6;
    }
  }
  else
  {
    *a4 = 0;
  }
  int v12 = -[SSUICursorView _retrieveFrameBezierPath:](self, "_retrieveFrameBezierPath:", x, y, width, height);
LABEL_6:

  return v12;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v20 = 0;
  unsigned int v8 = -[SSUICursorView _retrieveBezierPaths:usingRealPaths:](self, "_retrieveBezierPaths:usingRealPaths:", &v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectInset(v21, 3.0, 3.0);
  double v9 = v22.size.height;
  [(SSUICursorView *)self lineWidth];
  double v11 = v10;
  unsigned int v12 = [(SSUICursorView *)self largeCursorEnabled];
  if (v9 >= 3.0) {
    int v13 = 1;
  }
  else {
    int v13 = v12;
  }
  double v14 = 0.5;
  if (v13) {
    double v14 = v11;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_9AB8;
  v16[3] = &unk_105D0;
  double v18 = v14;
  char v19 = v20;
  v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  [v15 enumerateObjectsUsingBlock:v16];
}

- (BOOL)largeCursorEnabled
{
  return self->largeCursorEnabled;
}

- (CGPath)path
{
  return self->_path;
}

- (unsigned)incomingFlags
{
  return self->_incomingFlags;
}

- (void)setIncomingFlags:(unsigned int)a3
{
  self->_incomingFlags = a3;
}

- (void).cxx_destruct
{
}

@end