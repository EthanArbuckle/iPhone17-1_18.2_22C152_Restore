@interface GKGameMessagesBrush
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
@end

@implementation GKGameMessagesBrush

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v14 = a5;
  CGContextSaveGState(a4);
  UIGraphicsPushContext(a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v14;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  CGContextTranslateCTM(a4, 0.0, height);
  CGContextScaleCTM(a4, 1.0, -1.0);
  id v12 = v11;
  v13 = (CGImage *)[v12 CGImage];

  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGContextDrawImage(a4, v16, v13);
  UIGraphicsPopContext();
  CGContextRestoreGState(a4);
}

@end