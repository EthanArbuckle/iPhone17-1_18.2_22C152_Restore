@interface UIImage(DOCNodeThumbnail)
- (id)doc_averageColorInRect:()DOCNodeThumbnail;
@end

@implementation UIImage(DOCNodeThumbnail)

- (id)doc_averageColorInRect:()DOCNodeThumbnail
{
  if (doc_averageColorInRect__onceToken != -1) {
    dispatch_once(&doc_averageColorInRect__onceToken, &__block_literal_global_0);
  }
  [a1 scale];
  CGFloat v11 = a2 * v10;
  CGFloat v12 = a3 * v10;
  CGFloat v13 = a4 * v10;
  CGFloat v14 = a5 * v10;
  int data = 0;
  v15 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, (CGColorSpaceRef)doc_averageColorInRect__colorSpace, 0x4005u);
  CGContextSetInterpolationQuality(v15, kCGInterpolationLow);
  v16 = (CGImage *)[a1 CGImage];
  v25.origin.x = v11;
  v25.origin.y = v12;
  v25.size.width = v13;
  v25.size.height = v14;
  v17 = CGImageCreateWithImageInRect(v16, v25);
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = 1.0;
  v26.size.height = 1.0;
  CGContextDrawImage(v15, v26, v17);
  CGImageRelease(v17);
  CGContextRelease(v15);
  LOBYTE(v19) = BYTE1(data);
  LOBYTE(v18) = data;
  LOBYTE(v20) = BYTE2(data);
  v21 = [MEMORY[0x263F1C550] colorWithRed:(double)v18 / 255.0 green:(double)v19 / 255.0 blue:(double)v20 / 255.0 alpha:1.0];
  return v21;
}

@end