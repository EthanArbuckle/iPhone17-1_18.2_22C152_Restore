@interface AXPIPinchChainView
- (AXPIFingerAppearanceDelegate)appearanceDelegate;
- (AXPIPinchChainView)initWithFrame:(CGRect)a3;
- (BOOL)isPressed;
- (BOOL)isSelected;
- (BOOL)isUserInteractionEnabled;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (void)drawRect:(CGRect)a3;
- (void)setAppearanceDelegate:(id)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setPressed:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation AXPIPinchChainView

- (AXPIPinchChainView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXPIPinchChainView;
  v3 = -[AXPIPinchChainView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(AXPIPinchChainView *)v3 setBackgroundColor:v4];

    [(AXPIPinchChainView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (void)setStartPoint:(CGPoint)a3
{
  if (self->_startPoint.x != a3.x || self->_startPoint.y != a3.y)
  {
    self->_startPoint = a3;
    [(AXPIPinchChainView *)self setNeedsDisplay];
  }
}

- (void)setEndPoint:(CGPoint)a3
{
  if (self->_endPoint.x != a3.x || self->_endPoint.y != a3.y)
  {
    self->_endPoint = a3;
    [(AXPIPinchChainView *)self setNeedsDisplay];
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(AXPIPinchChainView *)self setNeedsDisplay];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(AXPIPinchChainView *)self setNeedsDisplay];
  }
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  v4 = [(AXPIPinchChainView *)self appearanceDelegate];
  [v4 fingerWidth];
  CGFloat v6 = v5;

  v57.origin.double x = self->_startPoint.x;
  v57.origin.double y = self->_startPoint.y;
  v58.origin.double x = self->_endPoint.x;
  v58.origin.double y = self->_endPoint.y;
  v57.size.width = v6;
  v57.size.height = v6;
  v58.size.width = v6;
  v58.size.height = v6;
  if (!CGRectIntersectsRect(v57, v58))
  {
    if (+[AXPIFingerUtilities laserEnabled])
    {
      v7 = [(AXPIPinchChainView *)self appearanceDelegate];
      char v8 = [v7 useSystemFilters];
    }
    else
    {
      char v8 = 0;
    }
    CurrentContext = UIGraphicsGetCurrentContext();
    double x = self->_startPoint.x;
    [(AXPIPinchChainView *)self frame];
    double v12 = x - v11;
    double y = self->_startPoint.y;
    [(AXPIPinchChainView *)self frame];
    double v15 = y - v14;
    double v16 = self->_endPoint.x;
    [(AXPIPinchChainView *)self frame];
    double v18 = v16 - v17;
    double v19 = self->_endPoint.y;
    [(AXPIPinchChainView *)self frame];
    double v21 = v19 - v20;
    double v22 = atan2(v19 - v20 - v15, v18 - v12);
    v23 = [(AXPIPinchChainView *)self appearanceDelegate];
    [v23 fingerInnerRadius];
    double v25 = v24;
    v26 = [(AXPIPinchChainView *)self appearanceDelegate];
    [v26 strokeWidth];
    double v28 = v27;
    v29 = [(AXPIPinchChainView *)self appearanceDelegate];
    [v29 strokeOutlineWidth];
    double v31 = v30;

    v32 = [(AXPIPinchChainView *)self appearanceDelegate];
    LODWORD(v26) = [v32 showInnerCircle];

    if (v26)
    {
      double v33 = v25 + v28 + v31 * 0.5;
      __double2 v34 = __sincos_stret(v22);
      CGContextMoveToPoint(CurrentContext, v12 + v33 * v34.__cosval, v15 + v33 * v34.__sinval);
      CGContextAddLineToPoint(CurrentContext, v18 - v33 * v34.__cosval, v21 - v33 * v34.__sinval);
      v35 = [(AXPIPinchChainView *)self appearanceDelegate];
      id v36 = [v35 strokeOutlineColor];
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v36 CGColor]);

      v37 = [(AXPIPinchChainView *)self appearanceDelegate];
      [v37 strokeOutlineWidth];
      double v39 = v38;
      v40 = [(AXPIPinchChainView *)self appearanceDelegate];
      [v40 strokeWidth];
      CGContextSetLineWidth(CurrentContext, v41 + v39 * 2.0);

      CGContextStrokePath(CurrentContext);
    }
    v42 = [(AXPIPinchChainView *)self appearanceDelegate];
    [v42 fingerInnerRadius];
    double v44 = v43;

    v45 = [(AXPIPinchChainView *)self appearanceDelegate];
    char v46 = [v45 showFingerOutlines];

    if ((v46 & 1) == 0)
    {
      v47 = [(AXPIPinchChainView *)self appearanceDelegate];
      [v47 strokeWidth];
      double v44 = v44 + v48 * -0.5;
    }
    __double2 v49 = __sincos_stret(v22);
    CGContextMoveToPoint(CurrentContext, v12 + v44 * v49.__cosval, v15 + v44 * v49.__sinval);
    CGContextAddLineToPoint(CurrentContext, v18 - v44 * v49.__cosval, v21 - v44 * v49.__sinval);
    if ((v8 & 1) == 0)
    {
      if ([(AXPIPinchChainView *)self isPressed] || [(AXPIPinchChainView *)self isSelected])
      {
        v50 = [(AXPIPinchChainView *)self appearanceDelegate];
        uint64_t v51 = [v50 selectedStrokeColor];
      }
      else
      {
        v50 = [(AXPIPinchChainView *)self appearanceDelegate];
        uint64_t v51 = [v50 deselectedStrokeColor];
      }
      v52 = (void *)v51;

      id v53 = v52;
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v53 CGColor]);
    }
    v54 = [(AXPIPinchChainView *)self appearanceDelegate];
    [v54 strokeWidth];
    CGContextSetLineWidth(CurrentContext, v55);

    CGContextStrokePath(CurrentContext);
  }
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (AXPIFingerAppearanceDelegate *)WeakRetained;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end