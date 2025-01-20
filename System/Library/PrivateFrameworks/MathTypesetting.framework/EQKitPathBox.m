@interface EQKitPathBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)color;
- (CGPath)cgPath;
- (CGRect)erasableBounds;
- (CGRect)p_cacheErasableBounds;
- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5;
- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5 drawingMode:(int)a6 lineWidth:(double)a7;
- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7;
- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7 drawingMode:(int)a8 lineWidth:(double)a9;
- (double)depth;
- (double)height;
- (double)lineWidth;
- (double)paddingLeft;
- (double)paddingRight;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)drawingMode;
- (void)dealloc;
- (void)p_cacheDimensions;
- (void)p_ensureDimensionsAreValid;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitPathBox

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7 drawingMode:(int)a8 lineWidth:(double)a9
{
  v20.receiver = self;
  v20.super_class = (Class)EQKitPathBox;
  v16 = [(EQKitPathBox *)&v20 init];
  if (v16)
  {
    if (a3) {
      CGMutablePathRef MutableCopy = CGPathCreateMutableCopy(a3);
    }
    else {
      CGMutablePathRef MutableCopy = 0;
    }
    v16->_cgPath = MutableCopy;
    v16->_height = a4;
    v16->_paddingLeft = a5;
    v16->_paddingRight = a6;
    if (a7) {
      v18 = (CGColor *)CFRetain(a7);
    }
    else {
      v18 = 0;
    }
    v16->_cgColor = v18;
    v16->_drawingMode = a8;
    v16->_lineWidth = a9;
  }
  return v16;
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7
{
  return [(EQKitPathBox *)self initWithCGPath:a3 height:a7 paddingLeft:0 paddingRight:a4 cgColor:a5 drawingMode:a6 lineWidth:1.0];
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5
{
  return [(EQKitPathBox *)self initWithCGPath:a3 height:a5 paddingLeft:0 paddingRight:a4 cgColor:0.0 drawingMode:0.0 lineWidth:1.0];
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5 drawingMode:(int)a6 lineWidth:(double)a7
{
  return [(EQKitPathBox *)self initWithCGPath:a3 height:a5 paddingLeft:*(void *)&a6 paddingRight:a4 cgColor:0.0 drawingMode:0.0 lineWidth:a7];
}

- (void)dealloc
{
  CGPathRelease(self->_cgPath);
  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)EQKitPathBox;
  [(EQKitPathBox *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitPathBox *)self cgPath];
  [(EQKitPathBox *)self height];
  double v7 = v6;
  [(EQKitPathBox *)self paddingLeft];
  double v9 = v8;
  [(EQKitPathBox *)self paddingRight];
  double v11 = v10;
  v12 = [(EQKitPathBox *)self color];
  uint64_t v13 = [(EQKitPathBox *)self drawingMode];
  [(EQKitPathBox *)self lineWidth];

  return (id)[v4 initWithCGPath:v5 height:v12 paddingLeft:v13 paddingRight:v7 cgColor:v9 drawingMode:v11 lineWidth:v14];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EQKitPathBox *)a3;
  if (self == v4)
  {
    BOOL v21 = 1;
  }
  else if ([(EQKitPathBox *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    [(EQKitPathBox *)self height];
    double v7 = v6;
    [(EQKitPathBox *)v5 height];
    if (v7 != v8) {
      goto LABEL_13;
    }
    [(EQKitPathBox *)self paddingLeft];
    double v10 = v9;
    [(EQKitPathBox *)v5 paddingLeft];
    if (v10 != v11) {
      goto LABEL_13;
    }
    [(EQKitPathBox *)self paddingRight];
    double v13 = v12;
    [(EQKitPathBox *)v5 paddingRight];
    if (v13 == v14
      && CGColorEqualToColor([(EQKitPathBox *)self color], [(EQKitPathBox *)v5 color])
      && (int v15 = [(EQKitPathBox *)self drawingMode], v15 == [(EQKitPathBox *)v5 drawingMode])
      && ([(EQKitPathBox *)self lineWidth], double v17 = v16,
                                                        [(EQKitPathBox *)v5 lineWidth],
                                                        v17 == v18))
    {
      v19 = [(EQKitPathBox *)self cgPath];
      objc_super v20 = [(EQKitPathBox *)v5 cgPath];
      BOOL v21 = v19 == v20 || CGPathEqualToPath(v19, v20);
    }
    else
    {
LABEL_13:
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (void)p_ensureDimensionsAreValid
{
  if (!self->_dimensionsValid)
  {
    [(EQKitPathBox *)self p_cacheDimensions];
    self->_dimensionsValid = 1;
  }
}

- (double)depth
{
  return self->_depth;
}

- (double)width
{
  return self->_width;
}

- (CGRect)erasableBounds
{
  if (self->_erasableBoundsValid)
  {
    double x = self->_erasableBounds.origin.x;
    double y = self->_erasableBounds.origin.y;
    double width = self->_erasableBounds.size.width;
    double height = self->_erasableBounds.size.height;
  }
  else
  {
    [(EQKitPathBox *)self p_cacheErasableBounds];
    self->_erasableBounds.origin.double x = x;
    self->_erasableBounds.origin.double y = y;
    self->_erasableBounds.size.double width = width;
    self->_erasableBounds.size.double height = height;
    self->_erasableBoundsValid = 1;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = (CGContext *)[v7 cgContext];
  if (v8 && self->_cgPath)
  {
    v11.receiver = self;
    v11.super_class = (Class)EQKitPathBox;
    -[EQKitBox renderIntoContext:offset:](&v11, sel_renderIntoContext_offset_, v7, x, y);
    CGContextSaveGState(v8);
    CGContextTranslateCTM(v8, x + self->_paddingLeft, y - self->_height);
    cgColor = self->_cgColor;
    if (cgColor)
    {
      CGContextSetFillColorWithColor(v8, cgColor);
      CGContextSetStrokeColorWithColor(v8, self->_cgColor);
    }
    if ([v7 rendersDebugRects])
    {
      CGContextSetAlpha(v8, 0.333);
      CGContextAddPath(v8, self->_cgPath);
      CGContextEOFillPath(v8);
      CGContextSetAlpha(v8, 1.0);
      CGFloat v10 = EQKitBox_ContextScale(v8);
      CGContextSetLineWidth(v8, 1.0 / v10);
      CGContextAddPath(v8, self->_cgPath);
      CGContextStrokePath(v8);
    }
    else
    {
      CGContextAddPath(v8, self->_cgPath);
      CGContextSetLineWidth(v8, self->_lineWidth);
      CGContextDrawPath(v8, (CGPathDrawingMode)self->_drawingMode);
    }
    CGContextRestoreGState(v8);
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  cgPath = self->_cgPath;
  if (cgPath)
  {
    v6.double x = a4.x + self->_paddingLeft;
    v6.double y = a4.y - self->_height;
    EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v6, cgPath);
  }
  return cgPath != 0;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitPathBox *)self height];
  uint64_t v6 = v5;
  [(EQKitPathBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitPathBox *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f", v4, self, v6, v8, v9];
}

- (void)p_cacheDimensions
{
  self->_depth = 0.0;
  self->_CGFloat width = 0.0;
  cgPath = self->_cgPath;
  if (cgPath)
  {
    PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(cgPath);
    CGFloat x = PathBoundingBox.origin.x;
    CGFloat y = PathBoundingBox.origin.y;
    CGFloat width = PathBoundingBox.size.width;
    CGFloat height = PathBoundingBox.size.height;
    if (!CGRectIsEmpty(PathBoundingBox))
    {
      v9.origin.CGFloat x = x;
      v9.origin.CGFloat y = y;
      v9.size.CGFloat width = width;
      v9.size.CGFloat height = height;
      self->_depth = CGRectGetHeight(v9) - self->_height;
      v10.origin.CGFloat x = x;
      v10.origin.CGFloat y = y;
      v10.size.CGFloat width = width;
      v10.size.CGFloat height = height;
      self->_CGFloat width = CGRectGetWidth(v10) + self->_paddingLeft + self->_paddingRight;
    }
  }
}

- (CGRect)p_cacheErasableBounds
{
  double v4 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  cgPath = self->_cgPath;
  if (cgPath)
  {
    PathBoundingBodouble x = CGPathGetPathBoundingBox(cgPath);
    double x = PathBoundingBox.origin.x;
    double y = PathBoundingBox.origin.y;
    CGFloat width = PathBoundingBox.size.width;
    CGFloat height = PathBoundingBox.size.height;
    if (!CGRectIsEmpty(PathBoundingBox))
    {
      double v3 = y - self->_height;
      double v4 = x + self->_paddingLeft;
      CGFloat v5 = width;
      CGFloat v6 = height;
    }
  }
  double v12 = v4;
  double v13 = v3;
  double v14 = v5;
  double v15 = v6;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (double)height
{
  return self->_height;
}

- (CGPath)cgPath
{
  return self->_cgPath;
}

- (double)paddingLeft
{
  return self->_paddingLeft;
}

- (double)paddingRight
{
  return self->_paddingRight;
}

- (CGColor)color
{
  return self->_cgColor;
}

- (int)drawingMode
{
  return self->_drawingMode;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

@end