@interface UIImage(PKStrokeSelection)
- (id)pk_imageRotated90DegreesClockwise:()PKStrokeSelection;
@end

@implementation UIImage(PKStrokeSelection)

- (id)pk_imageRotated90DegreesClockwise:()PKStrokeSelection
{
  [a1 size];
  double v6 = v5;
  double v8 = v7;
  v16.width = v7;
  v16.height = v6;
  UIGraphicsBeginImageContext(v16);
  v9 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v10 = [a1 CGImage];
  if (a3) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 2;
  }
  v12 = [v9 imageWithCGImage:v10 scale:v11 orientation:1.0];
  objc_msgSend(v12, "drawInRect:", 0.0, 0.0, v8, v6);

  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v13;
}

@end