@interface AKAlternateHandleLayer
- (AKAlternateHandleLayer)init;
@end

@implementation AKAlternateHandleLayer

- (AKAlternateHandleLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKAlternateHandleLayer;
  v2 = [(AKAlternateHandleLayer *)&v7 init];
  if (v2)
  {
    double v3 = *(double *)&AKPointOfInterestRadius_Handle_Alternate;
    if (!qword_268925220)
    {
      v8.origin.x = 0.0;
      v8.origin.y = 0.0;
      *(void *)&v8.size.width = AKPointOfInterestRadius_Handle_Alternate;
      *(void *)&v8.size.height = AKPointOfInterestRadius_Handle_Alternate;
      qword_268925220 = (uint64_t)CGPathCreateWithEllipseInRect(v8, 0);
    }
    -[AKAlternateHandleLayer setPath:](v2, "setPath:");
    [(AKAlternateHandleLayer *)v2 setLineWidth:1.0];
    id v4 = [MEMORY[0x263F1C550] whiteColor];
    -[AKAlternateHandleLayer setStrokeColor:](v2, "setStrokeColor:", [v4 CGColor]);

    id v5 = [MEMORY[0x263F1C550] greenColor];
    -[AKAlternateHandleLayer setFillColor:](v2, "setFillColor:", [v5 CGColor]);

    -[AKAlternateHandleLayer setBounds:](v2, "setBounds:", 0.0, 0.0, v3, v3);
    -[AKAlternateHandleLayer setAnchorPoint:](v2, "setAnchorPoint:", 0.5, 0.5);
  }
  return v2;
}

@end