@interface PKSpaceInsertionView
- (BOOL)isDragging;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (PKSpaceInsertionView)initWithFrame:(CGRect)a3 insertionType:(unint64_t)a4 path:(CGPath *)a5 handleLocation:(CGPoint)a6 scale:(double)a7;
- (unint64_t)insertionType;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setInsertionType:(unint64_t)a3;
- (void)setIsDragging:(BOOL)a3;
@end

@implementation PKSpaceInsertionView

- (PKSpaceInsertionView)initWithFrame:(CGRect)a3 insertionType:(unint64_t)a4 path:(CGPath *)a5 handleLocation:(CGPoint)a6 scale:(double)a7
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  v17.receiver = self;
  v17.super_class = (Class)PKSpaceInsertionView;
  v12 = -[PKSpaceInsertionView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v13 = v12;
  if (v12)
  {
    [(PKSpaceInsertionView *)v12 setOpaque:0];
    v13->_insertionType = a4;
    v13->_lassoPath = CGPathRetain(a5);
    v13->_handleLocation.CGFloat x = x;
    v13->_handleLocation.CGFloat y = y;
    v13->_scale = a7;
    v14 = objc_alloc_init(PKDrawingAdjustmentKnob);
    knobHandle = v13->_knobHandle;
    v13->_knobHandle = v14;

    [(PKSpaceInsertionView *)v13 addSubview:v13->_knobHandle];
    [(PKSpaceInsertionView *)v13 setAccessibilityIdentifier:@"com.apple.pencilkit.insertSpaceHandle"];
  }
  return v13;
}

- (void)dealloc
{
  CGPathRelease(self->_lassoPath);
  v3.receiver = self;
  v3.super_class = (Class)PKSpaceInsertionView;
  [(PKSpaceInsertionView *)&v3 dealloc];
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PKSpaceInsertionView *)self bounds];
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  if (!CGRectContainsPoint(v13, v12)) {
    return 0;
  }
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeTranslation(&v10, 0.0, 15.0);
  v7 = CGPathCreateCopyByStrokingPath(self->_lassoPath, &v10, 80.0, kCGLineCapRound, kCGLineJoinRound, 1.0);
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v8 = CGPathContainsPoint(v7, 0, v11, 0);
  CGPathRelease(v7);
  return v8;
}

- (void)layoutSubviews
{
  if ([(PKSpaceInsertionView *)self effectiveUserInterfaceLayoutDirection])
  {
    [(PKSpaceInsertionView *)self bounds];
    double v4 = v3 + -7.5 + -7.5;
  }
  else
  {
    double v4 = 0.0;
  }
  -[PKDrawingAdjustmentKnob setFrame:](self->_knobHandle, "setFrame:", v4, self->_handleLocation.y + 15.0 + -8.0, 15.0, 16.0);
  id v5 = [(PKSpaceInsertionView *)self tintColor];
  -[PKDrawingAdjustmentKnob setTintColor:](self->_knobHandle, "setTintColor:");
}

- (void)drawRect:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKSpaceInsertionView;
  -[PKSpaceInsertionView drawRect:](&v7, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = [(PKSpaceInsertionView *)self tintColor];
  CurrentContext = UIGraphicsGetCurrentContext();
  id v6 = v4;
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v6 CGColor]);
  CGContextTranslateCTM(CurrentContext, 0.0, 15.0);
  CGContextBeginPath(CurrentContext);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  CGContextSetLineWidth(CurrentContext, 0.5);
  CGContextAddPath(CurrentContext, self->_lassoPath);
  CGContextStrokePath(CurrentContext);
}

- (unint64_t)insertionType
{
  return self->_insertionType;
}

- (void)setInsertionType:(unint64_t)a3
{
  self->_insertionType = a3;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void).cxx_destruct
{
}

@end