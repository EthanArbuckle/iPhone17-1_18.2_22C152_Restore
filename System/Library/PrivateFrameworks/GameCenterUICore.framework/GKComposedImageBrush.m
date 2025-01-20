@interface GKComposedImageBrush
- (CGSize)sizeForInput:(id)a3;
- (UIEdgeInsets)maskInsets;
- (UIImage)backgroundImage;
- (UIImage)maskImage;
- (UIImage)overlayImage;
- (double)scaleForInput:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
- (void)setBackgroundImage:(id)a3;
- (void)setMaskImage:(id)a3;
- (void)setMaskInsets:(UIEdgeInsets)a3;
- (void)setOverlayImage:(id)a3;
@end

@implementation GKComposedImageBrush

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKComposedImageBrush;
  id v4 = [(GKThemeBrush *)&v9 copyWithZone:a3];
  v5 = [(GKComposedImageBrush *)self maskImage];
  [v4 setMaskImage:v5];

  v6 = [(GKComposedImageBrush *)self backgroundImage];
  [v4 setBackgroundImage:v6];

  v7 = [(GKComposedImageBrush *)self overlayImage];
  [v4 setOverlayImage:v7];

  [(GKComposedImageBrush *)self maskInsets];
  objc_msgSend(v4, "setMaskInsets:");
  return v4;
}

- (CGSize)sizeForInput:(id)a3
{
  id v4 = [(GKComposedImageBrush *)self maskImage];

  if (!v4)
  {
    v5 = NSString;
    v6 = [NSString stringWithFormat:@"Assertion failed"];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKThemeBrush.m"];
    id v8 = [v7 lastPathComponent];
    objc_super v9 = [v5 stringWithFormat:@"%@ (self.maskImage != ((void *)0))\n[%s (%s:%d)]", v6, "-[GKComposedImageBrush sizeForInput:]", objc_msgSend(v8, "UTF8String"), 413];

    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v9 format];
  }
  v10 = [(GKComposedImageBrush *)self maskImage];
  [v10 size];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)scaleForInput:(id)a3
{
  id v4 = [(GKComposedImageBrush *)self maskImage];

  if (!v4)
  {
    v5 = NSString;
    v6 = [NSString stringWithFormat:@"Assertion failed"];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKThemeBrush.m"];
    id v8 = [v7 lastPathComponent];
    objc_super v9 = [v5 stringWithFormat:@"%@ (self.maskImage != ((void *)0))\n[%s (%s:%d)]", v6, "-[GKComposedImageBrush scaleForInput:]", objc_msgSend(v8, "UTF8String"), 419];

    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v9 format];
  }
  v10 = [(GKComposedImageBrush *)self maskImage];
  [v10 scale];
  double v12 = v11;

  return v12;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v30 = a5;
  double v11 = [(GKComposedImageBrush *)self backgroundImage];
  double v12 = [(GKComposedImageBrush *)self maskImage];
  double v13 = [(GKComposedImageBrush *)self overlayImage];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v14 = v30;
  }
  else {
    double v14 = 0;
  }
  id v15 = v14;
  CGContextSaveGState(a4);
  CGContextTranslateCTM(a4, 0.0, height);
  CGContextScaleCTM(a4, 1.0, -1.0);
  if (v11)
  {
    double v16 = (CGImage *)[v11 CGImage];
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.double width = width;
    v32.size.double height = height;
    CGContextDrawImage(a4, v32, v16);
  }
  if (v15)
  {
    [(GKComposedImageBrush *)self maskInsets];
    double v18 = x + v17;
    double v20 = y + v19;
    double v22 = width - (v17 + v21);
    double v24 = height - (v19 + v23);
    CGContextSaveGState(a4);
    v25 = (CGImage *)[v12 CGImage];
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    CGContextClipToMask(a4, v33, v25);
    v26 = (CGImage *)[v15 CGImage];
    v34.origin.double x = v18;
    v34.origin.double y = v20;
    v34.size.double width = v22;
    v34.size.double height = v24;
    CGContextDrawImage(a4, v34, v26);
    CGContextRestoreGState(a4);
    if (annotateOnceToken != -1) {
      dispatch_once(&annotateOnceToken, &__block_literal_global_181);
    }
    if (shouldAnnotateImageUsage)
    {
      v27 = (objc_class *)objc_opt_class();
      Name = class_getName(v27);
      _annotateDrawInRectWithContextAndInput((uint64_t)Name, a4, v30, v18, v20, v22, v24);
    }
  }
  if (v13)
  {
    v29 = (CGImage *)[v13 CGImage];
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    CGContextDrawImage(a4, v35, v29);
  }
  CGContextRestoreGState(a4);
}

void __53__GKComposedImageBrush_drawInRect_withContext_input___block_invoke()
{
  id v0 = [MEMORY[0x263F40298] shared];
  shouldAnnotateImageUsage = [v0 shouldAnnotateImageUsage];
}

- (UIImage)maskImage
{
  return self->_maskImage;
}

- (void)setMaskImage:(id)a3
{
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (void)setOverlayImage:(id)a3
{
}

- (UIEdgeInsets)maskInsets
{
  double top = self->_maskInsets.top;
  double left = self->_maskInsets.left;
  double bottom = self->_maskInsets.bottom;
  double right = self->_maskInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMaskInsets:(UIEdgeInsets)a3
{
  self->_maskInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
}

@end