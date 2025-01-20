@interface ICDocCamCVPixelBufferUtilities
+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3;
+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4;
+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4 copyMemory:(BOOL)a5;
+ (id)coreImageForPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4;
@end

@implementation ICDocCamCVPixelBufferUtilities

+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3
{
  result = (CGImage *)CVBufferGetAttachment(a3, (CFStringRef)*MEMORY[0x263F03E38], 0);
  if (result)
  {
    return (CGImage *)[a1 createImageWithCVPixelBuffer:a3 colorSpace:result];
  }
  return result;
}

+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4
{
  return (CGImage *)[a1 createImageWithCVPixelBuffer:a3 colorSpace:a4 copyMemory:1];
}

+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4 copyMemory:(BOOL)a5
{
  BOOL v5 = a5;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 32)
  {
    CGBitmapInfo v9 = 16390;
    if (!a4) {
      return 0;
    }
  }
  else
  {
    if (PixelFormatType != 1111970369) {
      return 0;
    }
    CGBitmapInfo v9 = 8198;
    if (!a4) {
      return 0;
    }
  }
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    if (BaseAddress)
    {
      v14 = BaseAddress;
      if (!v5)
      {
        CGDataProviderRef v21 = CGDataProviderCreateWithData(a3, BaseAddress, Height * BytesPerRow, (CGDataProviderReleaseDataCallback)sReleaseCVPixelBuffer);
        if (!v21)
        {
          if (a3)
          {
            CVPixelBufferUnlockBaseAddress(a3, 1uLL);
            CVPixelBufferRelease(a3);
          }
          return 0;
        }
        v22 = v21;
        CVPixelBufferRetain(a3);
        v19 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, a4, v9, v22, 0, 1, kCGRenderingIntentDefault);
        v20 = v22;
LABEL_14:
        CGDataProviderRelease(v20);
        return v19;
      }
      v15 = malloc_type_malloc(Height * BytesPerRow, 0xA023D790uLL);
      if (v15)
      {
        v16 = v15;
        memcpy(v15, v14, Height * BytesPerRow);
        v17 = CGDataProviderCreateWithData(v16, v16, Height * BytesPerRow, (CGDataProviderReleaseDataCallback)sReleasePixelMemory);
        if (v17)
        {
          v18 = v17;
          v19 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, a4, v9, v17, 0, 1, kCGRenderingIntentDefault);
          v20 = v18;
          goto LABEL_14;
        }
      }
    }
  }
  return 0;
}

+ (id)coreImageForPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4
{
  v4 = (CGImage *)[a1 createImageWithCVPixelBuffer:a3 colorSpace:a4];
  if (v4)
  {
    BOOL v5 = [MEMORY[0x263F00650] imageWithCGImage:v4];
    CGImageRelease(v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end