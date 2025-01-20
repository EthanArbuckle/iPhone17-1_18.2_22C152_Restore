@interface AKAlignmentGuideLineLayer
- (AKAlignmentGuideLineLayer)initWithScaleFactor:(double)a3 forVerticalOrientation:(BOOL)a4 withMaxSize:(double)a5;
@end

@implementation AKAlignmentGuideLineLayer

- (AKAlignmentGuideLineLayer)initWithScaleFactor:(double)a3 forVerticalOrientation:(BOOL)a4 withMaxSize:(double)a5
{
  BOOL v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AKAlignmentGuideLineLayer;
  v8 = [(AKAlignmentGuideLineLayer *)&v17 init];
  v9 = v8;
  if (v8)
  {
    -[AKAlignmentGuideLineLayer setAnchorPoint:](v8, "setAnchorPoint:", 0.0, 0.0);
    -[AKAlignmentGuideLineLayer setFrame:](v9, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v10 = [MEMORY[0x263F1C550] akColorWithSRGBRed:0.933333333 green:0.792156863 blue:0.0 alpha:1.0];
    -[AKAlignmentGuideLineLayer setStrokeColor:](v9, "setStrokeColor:", [v10 CGColor]);

    [(AKAlignmentGuideLineLayer *)v9 setLineWidth:1.0 / a3];
    Mutable = CGPathCreateMutable();
    v12 = Mutable;
    if (v6)
    {
      CGPathMoveToPoint(Mutable, 0, 0.0, -a5);
      double v13 = 0.0;
      v14 = v12;
      double v15 = a5;
    }
    else
    {
      CGPathMoveToPoint(Mutable, 0, -a5, 0.0);
      double v15 = 0.0;
      v14 = v12;
      double v13 = a5;
    }
    CGPathAddLineToPoint(v14, 0, v13, v15);
    [(AKAlignmentGuideLineLayer *)v9 setPath:v12];
    CGPathRelease(v12);
  }
  return v9;
}

@end