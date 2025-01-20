@interface UIImage(Blur)
- (id)bluredImageWithFlippedXAxis:()Blur;
@end

@implementation UIImage(Blur)

- (id)bluredImageWithFlippedXAxis:()Blur
{
  v4 = objc_msgSend(MEMORY[0x263F00650], "imageWithCGImage:", objc_msgSend(a1, "CGImage"));
  v5 = [v4 bluredImageWithFlippedXAxis:a3];

  return v5;
}

@end