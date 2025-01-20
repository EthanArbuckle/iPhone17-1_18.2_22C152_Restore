@interface AKHandleLayer
- (AKHandleLayer)init;
@end

@implementation AKHandleLayer

- (AKHandleLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKHandleLayer;
  v2 = [(AKHandleLayer *)&v7 init];
  if (v2)
  {
    double v3 = *(double *)&AKPointOfInterestSize_Handle;
    if (!qword_2689251E8)
    {
      v8.origin.x = 0.0;
      v8.origin.y = 0.0;
      *(void *)&v8.size.width = AKPointOfInterestSize_Handle;
      *(void *)&v8.size.height = AKPointOfInterestSize_Handle;
      qword_2689251E8 = (uint64_t)CGPathCreateWithEllipseInRect(v8, 0);
    }
    -[AKHandleLayer setPath:](v2, "setPath:");
    [(AKHandleLayer *)v2 setLineWidth:1.0];
    id v4 = [MEMORY[0x263F1C550] whiteColor];
    -[AKHandleLayer setStrokeColor:](v2, "setStrokeColor:", [v4 CGColor]);

    id v5 = [MEMORY[0x263F1C550] akColorWithSRGBRed:0.105882353 green:0.454901961 blue:0.796078431 alpha:1.0];
    -[AKHandleLayer setFillColor:](v2, "setFillColor:", [v5 CGColor]);

    -[AKHandleLayer setBounds:](v2, "setBounds:", 0.0, 0.0, v3, v3);
    -[AKHandleLayer setAnchorPoint:](v2, "setAnchorPoint:", 0.5, 0.5);
  }
  return v2;
}

@end