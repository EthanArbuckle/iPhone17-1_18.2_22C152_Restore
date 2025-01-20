@interface AKEllipseLayer
- (AKEllipseLayer)init;
- (void)setBounds:(CGRect)a3;
@end

@implementation AKEllipseLayer

- (AKEllipseLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKEllipseLayer;
  v2 = [(AKEllipseLayer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(AKEllipseLayer *)v2 bounds];
    v4 = CGPathCreateWithEllipseInRect(v8, 0);
    [(AKEllipseLayer *)v3 setPath:v4];
    -[AKEllipseLayer setAnchorPoint:](v3, "setAnchorPoint:", 0.5, 0.5);
    [(AKEllipseLayer *)v3 setFillColor:0];
    [(AKEllipseLayer *)v3 setLineWidth:*(double *)&qword_268922C10];
    id v5 = [MEMORY[0x263F1C550] akColorWithWhite:0.6 alpha:0.8];
    -[AKEllipseLayer setStrokeColor:](v3, "setStrokeColor:", [v5 CGColor]);

    CGPathRelease(v4);
  }
  return v3;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)AKEllipseLayer;
  -[AKEllipseLayer setBounds:](&v9, sel_setBounds_);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRect v8 = CGPathCreateWithEllipseInRect(v10, 0);
  [(AKEllipseLayer *)self setPath:v8];
  CGPathRelease(v8);
}

@end