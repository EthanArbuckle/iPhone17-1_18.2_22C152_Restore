@interface BPSThumbnailGenerator
+ (BOOL)writeScaledCPBitmapForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5 withPath:(id)a6;
+ (BOOL)writeScaledPNGForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5 withPath:(id)a6;
+ (id)scaledImageForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5;
@end

@implementation BPSThumbnailGenerator

+ (id)scaledImageForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  v9 = (CGImage *)[v8 CGImage];
  if (a5 <= 0.0)
  {
    [v8 scale];
    a5 = v10;
  }
  double v11 = width * a5;
  double v12 = height * a5;
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v9);
  size_t BytesPerRow = CGImageGetBytesPerRow(v9);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(v9);
  ColorSpace = CGImageGetColorSpace(v9);
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(v9);
  CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(v9);
  if (BitsPerPixel == 64 && AlphaInfo == kCGImageAlphaLast && BitsPerComponent == 16) {
    uint32_t v21 = BitmapInfo & 0xFFFFFFE0 | 1;
  }
  else {
    uint32_t v21 = BitmapInfo;
  }
  v22 = CGBitmapContextCreate(0, (unint64_t)v11, (unint64_t)v12, BitsPerComponent, BytesPerRow, ColorSpace, v21);
  CGContextSetInterpolationQuality(v22, kCGInterpolationHigh);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.double width = v11;
  v27.size.double height = v12;
  CGContextDrawImage(v22, v27, v9);
  CGImageRef Image = CGBitmapContextCreateImage(v22);
  v24 = [MEMORY[0x263F1C6B0] imageWithCGImage:Image scale:0 orientation:a5];
  if (Image) {
    CFRelease(Image);
  }
  if (v22) {
    CFRelease(v22);
  }

  return v24;
}

+ (BOOL)writeScaledPNGForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5 withPath:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  double v11 = NSString;
  id v12 = a3;
  v13 = [v11 stringWithFormat:@"%@.png", a6];
  objc_msgSend(a1, "scaledImageForImage:desiredSize:scale:", v12, width, height, a5);
  v14 = (UIImage *)objc_claimAutoreleasedReturnValue();

  v15 = UIImagePNGRepresentation(v14);
  LOBYTE(v12) = [v15 writeToFile:v13 atomically:0];

  return (char)v12;
}

+ (BOOL)writeScaledCPBitmapForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5 withPath:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  double v11 = NSString;
  id v12 = a3;
  v13 = [v11 stringWithFormat:@"%@.cpbitmap", a6];
  v14 = objc_msgSend(a1, "scaledImageForImage:desiredSize:scale:", v12, width, height, 0.0);

  LOBYTE(v11) = [v14 writeToCPBitmapFile:v13 flags:(int)a5];
  return (char)v11;
}

@end