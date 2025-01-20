@interface AKTextOverflowIndicatorLayer
- (AKTextOverflowIndicatorLayer)init;
@end

@implementation AKTextOverflowIndicatorLayer

- (AKTextOverflowIndicatorLayer)init
{
  v9.receiver = self;
  v9.super_class = (Class)AKTextOverflowIndicatorLayer;
  v2 = [(AKTextOverflowIndicatorLayer *)&v9 init];
  if (v2)
  {
    Mutable = (CGPath *)qword_268925130;
    if (!qword_268925130)
    {
      Mutable = CGPathCreateMutable();
      memset(&v8, 0, sizeof(v8));
      CGAffineTransformMakeTranslation(&v8, 0.5, 0.5);
      v10.origin.x = 0.0;
      v10.origin.y = 0.0;
      v10.size.width = 12.0;
      v10.size.height = 12.0;
      v4 = CGPathCreateWithRect(v10, 0);
      CGPathAddPath(Mutable, &v8, v4);
      CGPathRelease(v4);
      CGPathMoveToPoint(Mutable, &v8, 6.0, 1.5);
      CGPathAddLineToPoint(Mutable, &v8, 6.0, 10.5);
      CGPathMoveToPoint(Mutable, &v8, 1.5, 6.0);
      CGPathAddLineToPoint(Mutable, &v8, 10.5, 6.0);
      qword_268925130 = (uint64_t)Mutable;
    }
    [(AKTextOverflowIndicatorLayer *)v2 setPath:Mutable];
    [(AKTextOverflowIndicatorLayer *)v2 setLineWidth:1.0];
    id v5 = [MEMORY[0x263F1C550] blackColor];
    -[AKTextOverflowIndicatorLayer setStrokeColor:](v2, "setStrokeColor:", [v5 CGColor]);

    id v6 = [MEMORY[0x263F1C550] whiteColor];
    -[AKTextOverflowIndicatorLayer setFillColor:](v2, "setFillColor:", [v6 CGColor]);

    -[AKTextOverflowIndicatorLayer setBounds:](v2, "setBounds:", 0.0, 0.0, 12.0, 12.0);
    -[AKTextOverflowIndicatorLayer setAnchorPoint:](v2, "setAnchorPoint:", 0.5, 0.5);
  }
  return v2;
}

@end