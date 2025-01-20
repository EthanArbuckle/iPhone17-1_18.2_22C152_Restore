@interface CRKCoreGraphicsUtilities
+ (CGContext)createImageContextForSize:(CGSize)a3;
+ (CGImage)createResizedImageFromImage:(CGImage *)a3 newSize:(CGSize)a4;
+ (id)imageDataFromImage:(CGImage *)a3;
@end

@implementation CRKCoreGraphicsUtilities

+ (id)imageDataFromImage:(CGImage *)a3
{
  v4 = (__CFData *)objc_opt_new();
  v5 = [(id)*MEMORY[0x263F1DC08] identifier];
  v6 = CGImageDestinationCreateWithData(v4, v5, 1uLL, 0);

  if (v6)
  {
    CGImageDestinationAddImage(v6, a3, 0);
    BOOL v7 = CGImageDestinationFinalize(v6);
    CFRelease(v6);
    if (v7)
    {
      v8 = (void *)[(__CFData *)v4 copy];
      goto LABEL_9;
    }
    v9 = _CRKLogGeneral_16();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CRKCoreGraphicsUtilities imageDataFromImage:](v9);
    }
  }
  else
  {
    v9 = _CRKLogGeneral_16();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CRKCoreGraphicsUtilities imageDataFromImage:](v9);
    }
  }

  v8 = 0;
LABEL_9:

  return v8;
}

+ (CGImage)createResizedImageFromImage:(CGImage *)a3 newSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  size_t v7 = (unint64_t)a4.width;
  size_t v8 = (unint64_t)a4.height;
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  size_t BytesPerRow = CGImageGetBytesPerRow(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(a3);
  result = CGBitmapContextCreate(0, v7, v8, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  if (result)
  {
    v14 = result;
    CGContextSetInterpolationQuality(result, kCGInterpolationHigh);
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGContextDrawImage(v14, v16, a3);
    Image = CGBitmapContextCreateImage(v14);
    CGContextRelease(v14);
    return Image;
  }
  return result;
}

+ (CGContext)createImageContextForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  result = CGColorSpaceCreateDeviceRGB();
  if (result)
  {
    v6 = result;
    Alignedsize_t BytesPerRow = CGBitmapGetAlignedBytesPerRow();
    size_t v8 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, AlignedBytesPerRow, v6, 0x2002u);
    CFRelease(v6);
    return v8;
  }
  return result;
}

+ (void)imageDataFromImage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Failed to create CGImageDestination with data", v1, 2u);
}

+ (void)imageDataFromImage:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Failed to convert CG context to image data", v1, 2u);
}

@end