@interface AXAuditUICursorView
+ (CGRect)resizeFrameForDisplay:(CGRect)a3;
- (AXAuditUICursorView)initWithFrame:(CGRect)a3;
- (BOOL)_isHidden;
- (BOOL)largeCursorEnabled;
- (BOOL)userInteractionEnabled;
- (CGPath)path;
- (CGRect)_cursorFrame;
- (CGRect)resizeFrameForWindow:(CGRect)a3;
- (double)_cachedAlpha;
- (double)lineWidth;
- (id)_outlineColor;
- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4;
- (id)_retrieveFrameBezierPath:(CGRect)a3;
- (id)_retrievePathBezierPaths;
- (unint64_t)highlightStyle;
- (void)_orderIn;
- (void)_orderOut;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setHighlightStyle:(unint64_t)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setPath:(CGPath *)a3;
- (void)set_cachedAlpha:(double)a3;
- (void)set_cursorFrame:(CGRect)a3;
- (void)set_isHidden:(BOOL)a3;
@end

@implementation AXAuditUICursorView

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
  double v7 = [(AXAuditUICursorView *)self window];
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

- (AXAuditUICursorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AXAuditUICursorView;
  v3 = -[AXAuditUICursorView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AXAuditUICursorView *)v3 setClipsToBounds:1];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_4460;
  v9[4] = sub_4470;
  v4 = v3;
  uint64_t v10 = v4;
  double v5 = +[AXSettings sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4478;
  v8[3] = &unk_81B0;
  v8[4] = v9;
  [v5 registerUpdateBlock:v8 forRetrieveSelector:"voiceOverLargeCursorEnabled" withListener:v4];

  [(AXAuditUICursorView *)v4 setOpaque:0];
  [(AXAuditUICursorView *)v4 setNeedsDisplayOnBoundsChange:1];
  double v6 = v4;
  _Block_object_dispose(v9, 8);

  return v6;
}

- (void)dealloc
{
  [(AXAuditUICursorView *)self setPath:0];
  v3.receiver = self;
  v3.super_class = (Class)AXAuditUICursorView;
  [(AXAuditUICursorView *)&v3 dealloc];
}

- (BOOL)largeCursorEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 voiceOverLargeCursorEnabled];

  return v3;
}

- (void)setPath:(CGPath *)a3
{
  if (a3 && !CGPathIsEmpty(a3))
  {
    self->_path = a3;
    CFRetain(a3);
    id v6 = [(AXAuditUICursorView *)self window];
    [v6 frame];
    -[AXAuditUICursorView setFrame:](self, "setFrame:");
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
  BOOL v3 = a3;
  if (![(AXAuditUICursorView *)self _isHidden] || v3)
  {
    if (![(AXAuditUICursorView *)self _isHidden] && v3)
    {
      [(AXAuditUICursorView *)self set_isHidden:1];
      [(AXAuditUICursorView *)self _orderOut];
    }
  }
  else
  {
    [(AXAuditUICursorView *)self set_isHidden:0];
    [(AXAuditUICursorView *)self _orderIn];
  }
}

- (void)setHighlightStyle:(unint64_t)a3
{
  self->_highlightStyle = a3;
  [(AXAuditUICursorView *)self setNeedsDisplay];
}

- (void)_orderOut
{
  [(AXAuditUICursorView *)self alpha];
  -[AXAuditUICursorView set_cachedAlpha:](self, "set_cachedAlpha:");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4710;
  v3[3] = &unk_81D8;
  v3[4] = self;
  +[UIView animateWithDuration:196608 delay:v3 options:0 animations:0.05 completion:0.0];
}

- (void)_orderIn
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_47A8;
  v2[3] = &unk_81D8;
  v2[4] = self;
  +[UIView animateWithDuration:196608 delay:v2 options:0 animations:0.05 completion:0.0];
}

- (double)lineWidth
{
  BOOL v3 = +[AXAuditTheme sharedTheme];
  objc_msgSend(v3, "borderWidthForHighlightStyle:", -[AXAuditUICursorView highlightStyle](self, "highlightStyle"));
  double v5 = v4;
  if ([(AXAuditUICursorView *)self largeCursorEnabled]) {
    double v5 = 8.0;
  }

  return v5;
}

- (void)setCursorFrame:(CGRect)a3
{
  double v4 = round(a3.origin.x);
  double v5 = round(a3.origin.y);
  double v6 = round(a3.size.width);
  double v7 = round(a3.size.height);
  [(AXAuditUICursorView *)self lineWidth];
  double v9 = v8 + 6.0;
  double v10 = -(v8 + 6.0);
  if ([(AXAuditUICursorView *)self largeCursorEnabled]) {
    double v11 = v9 * -1.25;
  }
  else {
    double v11 = v10;
  }
  v20.origin.double x = v4;
  v20.origin.double y = v5;
  v20.size.double width = v6;
  v20.size.double height = v7;
  CGRect v21 = CGRectInset(v20, v11, v11);
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  [(AXAuditUICursorView *)self _cursorFrame];
  BOOL v16 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:0];
  double v17 = CGSizeZero.height;
  -[AXAuditUICursorView setSize:](self, "setSize:", width, height);
  if (CGSizeZero.width != width || v17 != height) {
    -[AXAuditUICursorView setOrigin:](self, "setOrigin:", x, y);
  }
  +[UIView setAnimationsEnabled:v16];

  -[AXAuditUICursorView set_cursorFrame:](self, "set_cursorFrame:", x, y, width, height);
}

- (id)_retrievePathBezierPaths
{
  if ([(AXAuditUICursorView *)self path])
  {
    BOOL v3 = +[UIBezierPath bezierPathWithCGPath:[(AXAuditUICursorView *)self path]];
    double v6 = v3;
    double v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)_retrieveFrameBezierPath:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(AXAuditUICursorView *)self _cursorFrame];
  if (CGSizeZero.width == v9 && CGSizeZero.height == v8)
  {
    double v25 = 0;
  }
  else
  {
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    CGRect v29 = CGRectInset(v28, 3.0, 3.0);
    double v11 = v29.origin.x;
    double v12 = v29.origin.y;
    double v13 = v29.size.width;
    double v14 = v29.size.height;
    [(AXAuditUICursorView *)self lineWidth];
    double v16 = v15;
    unsigned int v17 = [(AXAuditUICursorView *)self largeCursorEnabled];
    if (v14 >= 3.0) {
      int v18 = 1;
    }
    else {
      int v18 = v17;
    }
    if (!v18) {
      double v16 = 0.5;
    }
    CGFloat v19 = v11 + v16 * 0.5;
    CGFloat v20 = v12 + v16 * 0.5;
    CGFloat v21 = v13 - v16;
    CGFloat v22 = v14 - v16;
    CGFloat v23 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v19, v20, v21, v22, 5.0, 5.0);
    v30.origin.CGFloat x = v19;
    v30.origin.CGFloat y = v20;
    v30.size.CGFloat width = v21;
    v30.size.CGFloat height = v22;
    CGRect v31 = CGRectInset(v30, v16 / 3.0, v16 / 3.0);
    double v24 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height, 5.0, 5.0);
    double v25 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, v24, 0);
  }

  return v25;
}

- (id)_retrieveBezierPaths:(CGRect)a3 usingRealPaths:(BOOL *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  if ([(AXAuditUICursorView *)self path])
  {
    IsEmptCGFloat y = CGPathIsEmpty([(AXAuditUICursorView *)self path]);
    *a4 = !IsEmpty;
    if (!IsEmpty)
    {
      double v9 = [(AXAuditUICursorView *)self _retrievePathBezierPaths];
      goto LABEL_6;
    }
  }
  else
  {
    *a4 = 0;
  }
  double v9 = -[AXAuditUICursorView _retrieveFrameBezierPath:](self, "_retrieveFrameBezierPath:", 0.0, 0.0, width, height);
LABEL_6:

  return v9;
}

- (id)_outlineColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v29 = 0;
  [(AXAuditUICursorView *)self bounds];
  double v8 = -[AXAuditUICursorView _retrieveBezierPaths:usingRealPaths:](self, "_retrieveBezierPaths:usingRealPaths:", &v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRect v31 = CGRectInset(v30, 3.0, 3.0);
  double v9 = v31.size.height;
  [(AXAuditUICursorView *)self lineWidth];
  double v11 = v10;
  unsigned int v12 = [(AXAuditUICursorView *)self largeCursorEnabled];
  if (v9 >= 3.0) {
    int v13 = 1;
  }
  else {
    int v13 = v12;
  }
  if (v13) {
    double v14 = v11;
  }
  else {
    double v14 = 0.5;
  }
  double v15 = +[AXAuditTheme sharedTheme];
  unint64_t v16 = [(AXAuditUICursorView *)self highlightStyle];
  unsigned int v17 = [v15 backgroundColorForHighlightStyle:v16];
  int v18 = [v15 borderColorForHighlightStyle:v16];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_4E2C;
  v22[3] = &unk_8200;
  double v27 = v14;
  char v28 = v29;
  id v23 = v17;
  double v24 = self;
  id v25 = v8;
  id v26 = v18;
  id v19 = v18;
  id v20 = v8;
  id v21 = v17;
  [v20 enumerateObjectsUsingBlock:v22];
}

- (CGPath)path
{
  return self->_path;
}

- (unint64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (CGRect)_cursorFrame
{
  double x = self->__cursorFrame.origin.x;
  double y = self->__cursorFrame.origin.y;
  double width = self->__cursorFrame.size.width;
  double height = self->__cursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_cursorFrame:(CGRect)a3
{
  self->__cursorFrame = a3;
}

- (BOOL)_isHidden
{
  return self->__isHidden;
}

- (void)set_isHidden:(BOOL)a3
{
  self->__isHidden = a3;
}

- (double)_cachedAlpha
{
  return self->__cachedAlpha;
}

- (void)set_cachedAlpha:(double)a3
{
  self->__cachedAlpha = a3;
}

@end