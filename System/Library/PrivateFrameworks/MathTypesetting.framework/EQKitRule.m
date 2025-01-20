@interface EQKitRule
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)color;
- (EQKitRule)initWithHeight:(double)a3 depth:(double)a4 width:(double)a5 cgColor:(CGColor *)a6;
- (double)depth;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitRule

- (EQKitRule)initWithHeight:(double)a3 depth:(double)a4 width:(double)a5 cgColor:(CGColor *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)EQKitRule;
  v10 = [(EQKitRule *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_height = a3;
    v10->_depth = a4;
    v10->_width = a5;
    if (a6) {
      v12 = (CGColor *)CFRetain(a6);
    }
    else {
      v12 = 0;
    }
    v11->_cgColor = v12;
  }
  return v11;
}

- (void)dealloc
{
  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)EQKitRule;
  [(EQKitRule *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(EQKitRule *)self height];
  double v6 = v5;
  [(EQKitRule *)self depth];
  double v8 = v7;
  [(EQKitRule *)self width];
  cgColor = self->_cgColor;

  return (id)[v4 initWithHeight:cgColor depth:v6 width:v8 cgColor:v9];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EQKitRule *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else if ([(EQKitRule *)v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = v4;
    [(EQKitRule *)self height];
    double v7 = v6;
    [(EQKitRule *)v5 height];
    BOOL v15 = v7 == v8
       && ([(EQKitRule *)self depth], double v10 = v9, [(EQKitRule *)v5 depth], v10 == v11)
       && ([(EQKitRule *)self width], double v13 = v12, [(EQKitRule *)v5 width], v13 == v14)
       && CGColorEqualToColor([(EQKitRule *)self color], [(EQKitRule *)v5 color]);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitRule;
  return [(EQKitBox *)&v3 hash];
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v22 = a3;
  double v7 = (CGContext *)[v22 cgContext];
  if (v7)
  {
    [(EQKitRule *)self width];
    double v9 = v8;
    [(EQKitBox *)self vsize];
    if (v9 > 0.0)
    {
      double v11 = v10;
      if (v10 > 0.0)
      {
        if (self->_cgColor)
        {
          CGContextSaveGState(v7);
          CGContextSetFillColorWithColor(v7, self->_cgColor);
          if ([v22 rendersDebugRects]) {
            CGContextSetStrokeColorWithColor(v7, self->_cgColor);
          }
        }
        [(EQKitRule *)self height];
        double v13 = v12;
        if (v9 >= 0.0) {
          double v14 = v9;
        }
        else {
          double v14 = -v9;
        }
        if (v9 >= 0.0) {
          double v15 = -0.0;
        }
        else {
          double v15 = v9;
        }
        if (v11 >= 0.0) {
          double v16 = v11;
        }
        else {
          double v16 = -v11;
        }
        if (v11 >= 0.0) {
          double v11 = -0.0;
        }
        int v17 = [v22 rendersDebugRects];
        double v18 = y - v13;
        double v19 = x + v15;
        double v20 = v11 + v18;
        if (v17)
        {
          CGContextSetAlpha(v7, 0.333);
          v24.origin.double x = v19;
          v24.origin.double y = v20;
          v24.size.width = v14;
          v24.size.height = v16;
          CGContextFillRect(v7, v24);
          CGContextSetAlpha(v7, 1.0);
          CGFloat v21 = EQKitBox_ContextScale(v7);
          CGContextSetLineWidth(v7, 1.0 / v21);
          v25.origin.double x = v19;
          v25.origin.double y = v20;
          v25.size.width = v14;
          v25.size.height = v16;
          CGContextStrokeRect(v7, v25);
        }
        else
        {
          v26.origin.double x = v19;
          v26.origin.double y = v20;
          v26.size.width = v14;
          v26.size.height = v16;
          CGContextFillRect(v7, v26);
        }
        if (self->_cgColor) {
          CGContextRestoreGState(v7);
        }
      }
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  int v4 = *((_DWORD *)a3 + 6);
  if (v4 == 2)
  {
    a4.double x = a4.x + self->_width;
  }
  else if (v4)
  {
    return 1;
  }
  EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, a4, self->_height);
  return 1;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitRule *)self height];
  uint64_t v6 = v5;
  [(EQKitRule *)self depth];
  uint64_t v8 = v7;
  [(EQKitRule *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f", v4, self, v6, v8, v9];
}

- (double)height
{
  return self->_height;
}

- (double)depth
{
  return self->_depth;
}

- (double)width
{
  return self->_width;
}

- (CGColor)color
{
  return self->_cgColor;
}

@end