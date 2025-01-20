@interface GKiOSAppIconBrush
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
@end

@implementation GKiOSAppIconBrush

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  CGContextSaveGState(a4);
  UIGraphicsPushContext(a4);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, height * 0.225);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 addClip];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  CGContextTranslateCTM(a4, 0.0, height);
  CGContextScaleCTM(a4, 1.0, -1.0);
  id v13 = v12;
  v14 = (CGImage *)[v13 CGImage];

  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  CGContextDrawImage(a4, v17, v14);
  UIGraphicsPopContext();
  CGContextRestoreGState(a4);
}

@end