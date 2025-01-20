@interface ISContinuousRoundedRect
- (ISContinuousRoundedRect)init;
- (double)_cornerRadiusForSize:(CGSize)a3;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISContinuousRoundedRect

- (ISContinuousRoundedRect)init
{
  v3.receiver = self;
  v3.super_class = (Class)ISContinuousRoundedRect;
  return (ISContinuousRoundedRect *)[(ISShapeCompositorResource *)&v3 _init];
}

- (double)_cornerRadiusForSize:(CGSize)a3
{
  if (a3.width >= a3.height) {
    a3.width = a3.height;
  }
  return a3.width * 0.225;
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
    -[ISContinuousRoundedRect _cornerRadiusForSize:](self, "_cornerRadiusForSize:", v5, v6);
    ContinuousRoundedRectCornerRadius = (const CGPath *)_CGPathCreateContinuousRoundedRectCornerRadius(0.0, 0.0, v5, v6, v11);
    [(ISShapeCompositorResource *)self lineWidth];
    CGFloat v14 = v13;
    [(ISShapeCompositorResource *)self lineWidth];
    CGFloat v16 = v15;
    v33.origin.CGFloat x = 0.0;
    v33.origin.CGFloat y = 0.0;
    v33.size.CGFloat width = v5;
    v33.size.CGFloat height = v6;
    CGRect v34 = CGRectInset(v33, v14, v16);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    -[ISContinuousRoundedRect _cornerRadiusForSize:](self, "_cornerRadiusForSize:", v34.size.width, v34.size.height);
    v22 = (const CGPath *)_CGPathCreateContinuousRoundedRectCornerRadius(x, y, width, height, v21);
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, 0, ContinuousRoundedRectCornerRadius);
    CGPathAddPath(Mutable, 0, v22);
    if (ContinuousRoundedRectCornerRadius)
    {
      if (v22 && Mutable)
      {
        [v7 pushState];
        CGContextAddPath((CGContextRef)[v7 cgContext], Mutable);
        v24 = (CGContext *)[v7 cgContext];
        v25 = [(ISShapeCompositorResource *)self lineColor];
        CGContextSetFillColorWithColor(v24, (CGColorRef)[v25 cgColor]);

        CGContextEOFillPath((CGContextRef)[v7 cgContext]);
        [v7 popState];
        CGPathRelease(ContinuousRoundedRectCornerRadius);
        CGPathRelease(v22);
        CGPathRelease(Mutable);
      }
    }
  }
  v26 = [(ISShapeCompositorResource *)self fillColor];

  if (v26)
  {
    -[ISContinuousRoundedRect _cornerRadiusForSize:](self, "_cornerRadiusForSize:", v5, v6);
    uint64_t v28 = _CGPathCreateContinuousRoundedRectCornerRadius(0.0, 0.0, v5, v6, v27);
    if (v28)
    {
      v29 = (const void *)v28;
      [v7 fillPath:v28];
      CFRelease(v29);
    }
  }
  v30 = [v7 image];

  return v30;
}

@end