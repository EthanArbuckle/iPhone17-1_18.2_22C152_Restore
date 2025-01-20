@interface UIImage(Compositing)
+ (id)blankImageOfSize:()Compositing;
- (id)compositeImage:()Compositing blendMode:alpha:;
- (uint64_t)compositeImage:()Compositing;
@end

@implementation UIImage(Compositing)

+ (id)blankImageOfSize:()Compositing
{
  v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
  if (blankImageOfSize__onceToken != -1) {
    dispatch_once(&blankImageOfSize__onceToken, &__block_literal_global_0);
  }
  v9 = [(id)blankImageOfSize__blankImageCache objectForKey:v8];
  if (!v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", a3, a4);
    v9 = [v10 imageWithActions:&__block_literal_global_5];
    [(id)blankImageOfSize__blankImageCache setObject:v9 forKey:v8];
    if (!v9)
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, a1, @"UIImage+Compositing.m", 32, @"Invalid parameter not satisfying: %@", @"retValue != nil" object file lineNumber description];
    }
  }

  return v9;
}

- (uint64_t)compositeImage:()Compositing
{
  return [a1 compositeImage:a3 blendMode:0 alpha:1.0];
}

- (id)compositeImage:()Compositing blendMode:alpha:
{
  id v8 = a4;
  [a1 size];
  double v10 = v9;
  [a1 size];
  double v12 = v11;
  [a1 scale];
  CGFloat v14 = v13;
  v19.width = v10;
  v19.height = v12;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetAllowsAntialiasing(CurrentContext, 1);
  CGContextSetShouldAntialias(CurrentContext, 1);
  objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v10, v12);
  objc_msgSend(v8, "drawInRect:blendMode:alpha:", a5, 0.0, 0.0, v10, v12, a2);

  v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v16;
}

@end