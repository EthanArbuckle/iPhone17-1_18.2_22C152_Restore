@interface ISCircle
- (ISCircle)init;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISCircle

- (ISCircle)init
{
  v3.receiver = self;
  v3.super_class = (Class)ISCircle;
  return (ISCircle *)[(ISShapeCompositorResource *)&v3 _init];
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double v5 = ceil(a3.width);
  double v6 = ceil(a3.height);
  v7 = objc_msgSend(MEMORY[0x1E4F6F1D8], "bitmapContextWithSize:scale:preset:", 0, v5, v6, a4);
  [v7 clear];
  v8 = [(ISShapeCompositorResource *)self fillColor];
  [v7 setFillColor:v8];

  v9 = [(ISShapeCompositorResource *)self lineColor];
  [v7 setStrokeColor:v9];

  [(ISShapeCompositorResource *)self lineWidth];
  objc_msgSend(v7, "setLineWidth:");
  v10 = [(ISShapeCompositorResource *)self lineColor];

  if (v10)
  {
    [(ISShapeCompositorResource *)self lineWidth];
    CGFloat v12 = v11 * 0.5;
    [(ISShapeCompositorResource *)self lineWidth];
    CGFloat v14 = v13 * 0.5;
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = v5;
    v23.size.height = v6;
    CGRect v24 = CGRectInset(v23, v12, v14);
    CGPathRef v15 = CGPathCreateWithEllipseInRect(v24, 0);
    if (v15)
    {
      CGPathRef v16 = v15;
      [v7 strokePath:v15];
      CFRelease(v16);
    }
  }
  v17 = [(ISShapeCompositorResource *)self fillColor];

  if (v17)
  {
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = v5;
    v25.size.height = v6;
    CGPathRef v18 = CGPathCreateWithEllipseInRect(v25, 0);
    if (v18)
    {
      CGPathRef v19 = v18;
      [v7 fillPath:v18];
      CFRelease(v19);
    }
  }
  v20 = [v7 image];

  return v20;
}

@end