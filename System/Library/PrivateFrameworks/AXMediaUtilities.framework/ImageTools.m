@interface ImageTools
+ (BOOL)writeImage:(CGImage *)a3 toFile:(id)a4 error:(id *)a5;
+ (CGContext)createARGBBitmapContextWithImage:(CGImage *)a3;
+ (CGImage)loadCGImageEXIFRotatedFromData:(id)a3 error:(id *)a4;
+ (CGImage)loadCGImageEXIFRotatedFromSource:(CGImageSource *)a3 error:(id *)a4;
+ (CGImage)loadCGImageEXIFRotatedFromURL:(id)a3 error:(id *)a4;
+ (CGImage)loadCGImageFromURL:(id)a3 error:(id *)ImageAtIndex;
+ (CGImage)newCGImageFromPlanar8VImageBuffer:(const vImage_Buffer *)a3 error:(id *)a4;
+ (CGImage)newCGImageFromRGBA8VImageBuffer:(const vImage_Buffer *)a3 error:(id *)a4;
+ (CGImage)rotateImage:(CGImage *)a3 accordingToEXIFOrientation:(int)a4;
+ (CGImage)rotateImage:(CGImage *)a3 withAngle:(float)a4 andXFlip:(BOOL)a5 andYFlip:(BOOL)a6;
+ (__CFString)guessType:(id)a3;
+ (__CVBuffer)loadCVPixelBuffer420YpCbCr8FromURL:(id)a3 error:(id *)a4;
+ (__CVBuffer)loadCVPixelBufferARGB8FromURL:(id)a3 error:(id *)a4;
+ (id)getValueForTag:(id)a3 inObject:(id)a4;
+ (id)getValueForTag:(id)a3 inObject:(id)a4 depth:(int)a5 parent:(id)a6;
+ (id)numberOfChannelsInImageData:(id)a3 error:(id *)a4;
+ (id)saveCGImage:(const CGImage *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6;
+ (id)saveCVPixelBuffer420YpCbCr8:(__CVBuffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6;
+ (id)saveCVPixelBufferPlane8:(int)a3 from:(__CVBuffer *)a4 withName:(id)a5 inFolder:(id)a6 error:(id *)a7;
+ (id)saveCVPixelBufferRGBA8:(__CVBuffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6;
+ (id)saveRawBuffer:(void *)a3 withWidth:(unsigned int)a4 andHeight:(unsigned int)a5 andRowBytes:(unsigned int)a6 withName:(id)a7 inFolder:(id)a8 error:(id *)a9;
+ (id)saveVImageBufferPlanar8:(const vImage_Buffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6;
+ (id)saveVImageBufferPlanar8ToData:(const vImage_Buffer *)a3 deriveTypeFromFileName:(id)a4 error:(id *)a5;
+ (id)saveVImageBufferPlanar8ToJPEGData:(const vImage_Buffer *)a3 withCompressionQuality:(float)a4 error:(id *)a5;
+ (id)saveVImageBufferRGBA8:(const vImage_Buffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6;
+ (id)saveVImageBufferRGBA8ToData:(const vImage_Buffer *)a3 deriveTypeFromFileName:(id)a4 error:(id *)a5;
+ (id)saveVImageBufferRGBA8ToJPEGData:(const vImage_Buffer *)a3 withCompressionQuality:(float)a4 error:(id *)a5;
+ (id)writeImageToData:(CGImage *)a3 type:(__CFString *)a4 error:(id *)a5;
+ (int64_t)create420YCbCr8BufferFromPlanar8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 toLumaBuffer:(void *)a7 withBytesPerRowLuma:(unint64_t)a8 andToChromaBuffer:(void *)a9 withBytesPerRowChroma:(unint64_t)a10;
+ (int64_t)create420YCbCr8BufferFromRGB8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 andAlphaFirst:(BOOL)a7 toLumaBuffer:(void *)a8 withBytesPerRowLuma:(unint64_t)a9 andToChromaBuffer:(void *)a10 withBytesPerRowChroma:(unint64_t)a11;
+ (int64_t)createRGB8BufferFrom420Y8BiPlanarBuffer:(void *)a3 withBytesPerRowLuma:(unint64_t)a4 andFrom420CbCr8Buffer:(void *)a5 withBytesPerRowChroma:(unint64_t)a6 andWithWidth:(int)a7 andWithHeight:(int)a8 andAlphaFirst:(BOOL)a9 toRGB8Buffer:(void *)__b withBytesPerRowDst:(unint64_t)a11;
+ (int64_t)createRGB8BufferFrom420Y8PlanarBuffer:(void *)a3 withBytesPerRowY:(unint64_t)a4 andFrom420Cb8Buffer:(void *)a5 withBytesPerRowCb:(unint64_t)a6 andFrom420Cr8Buffer:(void *)a7 withBytesPerRowCr:(unint64_t)a8 andWithWidth:(int)a9 andWithHeight:(int)a10 andAlphaFirst:(BOOL)a11 toRGB8Buffer:(void *)__b withBytesPerRowDst:(unint64_t)a13;
+ (int64_t)extractLumaFromBGRA8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 toBuffer:(void *)a7 withBytesPerRow:(unint64_t)a8;
+ (vImage_Buffer)getVImageBufferFromCGImage:(SEL)a3 error:(CGImage *)a4;
+ (vImage_Buffer)getVImageBufferFromCGImageLuma:(SEL)a3 error:(CGImage *)a4;
+ (vImage_Buffer)getVImageBufferFromCVPixelBuffer:(SEL)a3 channel:(__CVBuffer *)a4 error:(int)a5;
+ (vImage_Buffer)loadVImageBufferEXIFRotatedFromData:(id)a3 error:(id *)a4;
+ (vImage_Buffer)loadVImageBufferEXIFRotatedFromURL:(id)a3 error:(id *)a4;
+ (vImage_Buffer)loadVImageBufferFromData:(id)a3 isRaw:(BOOL)a4 lumaOnly:(BOOL)a5 error:(id *)a6;
+ (vImage_Buffer)loadVImageBufferFromURL:(id)a3 lumaOnly:(BOOL)a4 error:(id *)a5;
+ (void)loadRawBufferFromData:(id)a3 width:(unsigned int *)a4 height:(unsigned int *)a5 rowBytes:(unsigned int *)a6 error:(id *)a7;
+ (void)loadRawBufferFromURL:(id)a3 width:(unsigned int *)a4 height:(unsigned int *)a5 rowBytes:(unsigned int *)a6 error:(id *)a7;
@end

@implementation ImageTools

+ (__CFString)guessType:(id)a3
{
  id v3 = a3;
  v4 = [v3 pathExtension];
  if (![v4 length])
  {
    id v5 = v3;

    v4 = v5;
  }
  if ([v4 isEqualToString:@"png"])
  {
    v6 = (id *)MEMORY[0x1E4F44460];
  }
  else if ([v4 isEqualToString:@"jpg"])
  {
    v6 = (id *)MEMORY[0x1E4F44410];
  }
  else if ([v4 isEqualToString:@"tiff"])
  {
    v6 = (id *)MEMORY[0x1E4F444E0];
  }
  else if ([v4 isEqualToString:@"bmp"])
  {
    v6 = (id *)MEMORY[0x1E4F44340];
  }
  else
  {
    if (![v4 isEqualToString:@"raw"])
    {
      v7 = 0;
      goto LABEL_14;
    }
    v6 = (id *)MEMORY[0x1E4F44498];
  }
  v7 = [*v6 identifier];

LABEL_14:
  return v7;
}

+ (id)getValueForTag:(id)a3 inObject:(id)a4
{
  return (id)[a1 getValueForTag:a3 inObject:a4 depth:0 parent:0];
}

+ (id)getValueForTag:(id)a3 inObject:(id)a4 depth:(int)a5 parent:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v11 = [v10 allKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      uint64_t v15 = (a5 + 1);
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([v17 isEqualToString:v9])
          {
            v26 = [v10 objectForKeyedSubscript:v17];
            goto LABEL_21;
          }
          v18 = [v10 objectForKey:v17];
          id v19 = (id)[a1 getValueForTag:v9 inObject:v18 depth:v15 parent:v10];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = 0;
      goto LABEL_23;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v10;
    uint64_t v20 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      uint64_t v23 = (a5 + 1);
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v11);
          }
          id v25 = (id)objc_msgSend(a1, "getValueForTag:inObject:depth:parent:", v9, *(void *)(*((void *)&v28 + 1) + 8 * j), v23, v11, (void)v28);
        }
        uint64_t v21 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v21);
    }
  }
  v26 = 0;
LABEL_21:

LABEL_23:

  return v26;
}

+ (CGImage)rotateImage:(CGImage *)a3 withAngle:(float)a4 andXFlip:(BOOL)a5 andYFlip:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  float v10 = (float)(a4 * 3.1416) / 180.0;
  __float2 v11 = __sincosf_stret(v10);
  float v12 = fabsf(v11.__cosval);
  float v13 = fabsf(v11.__sinval);
  float Width = (float)CGImageGetWidth(a3);
  float v15 = (float)(v13 * (float)CGImageGetHeight(a3)) + (float)(Width * v12);
  float v16 = (float)CGImageGetWidth(a3);
  float v17 = (float)(v12 * (float)CGImageGetHeight(a3)) + (float)(v16 * v13);
  uint32_t AlphaInfo = CGImageGetAlphaInfo(a3);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  uint64_t v21 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v17, BitsPerComponent, 0, ColorSpace, AlphaInfo);
  CGContextSetAllowsAntialiasing(v21, 0);
  CGContextSetShouldAntialias(v21, 0);
  CGContextSetInterpolationQuality(v21, kCGInterpolationLow);
  memset(&v33, 0, sizeof(v33));
  double v22 = v15;
  double v23 = v17;
  if (v6)
  {
    double v24 = -1.0;
  }
  else
  {
    double v23 = 0.0;
    double v24 = 1.0;
  }
  if (v7)
  {
    double v25 = -1.0;
  }
  else
  {
    double v22 = 0.0;
    double v25 = 1.0;
  }
  CGAffineTransformMakeTranslation(&v33, v22, v23);
  CGAffineTransform v31 = v33;
  CGAffineTransformScale(&transform, &v31, v25, v24);
  CGAffineTransform v33 = transform;
  if (a4 != 0.0)
  {
    memset(&transform, 0, sizeof(transform));
    CGAffineTransformMakeTranslation(&transform, (float)(v15 * 0.5), (float)(v17 * 0.5));
    CGAffineTransform t1 = transform;
    CGAffineTransformRotate(&v31, &t1, v10);
    CGAffineTransform transform = v31;
    CGAffineTransform t1 = v31;
    CGAffineTransformTranslate(&v31, &t1, (float)(v17 * -0.5), (float)(v15 * -0.5));
    CGAffineTransform transform = v31;
    CGAffineTransform t1 = v31;
    CGAffineTransform v29 = v33;
    CGAffineTransformConcat(&v31, &t1, &v29);
    CGAffineTransform v33 = v31;
  }
  CGAffineTransform transform = v33;
  CGContextConcatCTM(v21, &transform);
  CGFloat v26 = (double)CGImageGetWidth(a3);
  v34.size.height = (double)CGImageGetHeight(a3);
  v34.origin.x = 0.0;
  v34.origin.y = 0.0;
  v34.size.width = v26;
  CGContextDrawImage(v21, v34, a3);
  CGContextFlush(v21);
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  return Image;
}

+ (CGImage)rotateImage:(CGImage *)a3 accordingToEXIFOrientation:(int)a4
{
  switch(a4)
  {
    case 2:
      double v4 = 0.0;
      goto LABEL_10;
    case 3:
      double v4 = 0.0;
      goto LABEL_14;
    case 4:
      double v4 = 0.0;
      goto LABEL_7;
    case 5:
      LODWORD(v4) = 1119092736;
LABEL_7:
      uint64_t v6 = 0;
      goto LABEL_15;
    case 6:
      LODWORD(v4) = -1028390912;
      uint64_t v6 = 0;
      goto LABEL_11;
    case 7:
      LODWORD(v4) = 1119092736;
LABEL_10:
      uint64_t v6 = 1;
LABEL_11:
      uint64_t v7 = 0;
      goto LABEL_12;
    case 8:
      LODWORD(v4) = -1028390912;
LABEL_14:
      uint64_t v6 = 1;
LABEL_15:
      uint64_t v7 = 1;
LABEL_12:
      result = +[ImageTools rotateImage:a3 withAngle:v6 andXFlip:v7 andYFlip:v4];
      break;
    default:
      result = CGImageCreateCopy(a3);
      break;
  }
  return result;
}

+ (CGContext)createARGBBitmapContextWithImage:(CGImage *)a3
{
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  if (CGColorSpaceGetModel(ColorSpace))
  {
    DeviceGray = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    uint32_t v8 = 2;
    if (DeviceGray) {
      goto LABEL_3;
    }
LABEL_7:
    float v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3A8];
    float v15 = @"Could not allocate color space";
    goto LABEL_10;
  }
  DeviceGray = CGColorSpaceCreateDeviceGray();
  uint32_t v8 = 0;
  if (!DeviceGray) {
    goto LABEL_7;
  }
LABEL_3:
  id v9 = malloc_type_malloc(4 * Width * Height, 0xCD5F7386uLL);
  if (!v9)
  {
    float v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3A8];
    float v15 = @"Could not allocate bitmap memory";
    goto LABEL_10;
  }
  CGContextRef v10 = CGBitmapContextCreate(v9, Width, Height, 8uLL, 4 * Width, DeviceGray, v8);
  if (!v10)
  {
    float v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3A8];
    float v15 = @"Could not allocate context";
LABEL_10:
    id v16 = [v13 exceptionWithName:v14 reason:v15 userInfo:0];
    objc_exception_throw(v16);
  }
  __float2 v11 = v10;
  CGColorSpaceRelease(DeviceGray);
  return v11;
}

+ (CGImage)loadCGImageFromURL:(id)a3 error:(id *)ImageAtIndex
{
  CFURLRef v5 = (const __CFURL *)a3;
  uint64_t v6 = CGImageSourceCreateWithURL(v5, 0);
  if (v6)
  {
    uint64_t v7 = v6;
    ImageAtIndex = (id *)CGImageSourceCreateImageAtIndex(v6, 0, 0);
    CFRelease(v7);
  }
  else if (ImageAtIndex)
  {
    uint32_t v8 = [NSString stringWithFormat:@"ERROR: Could not create image from URL %@", v5];
    *ImageAtIndex = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:v8];

    ImageAtIndex = 0;
  }

  return (CGImage *)ImageAtIndex;
}

+ (CGImage)loadCGImageEXIFRotatedFromSource:(CGImageSource *)a3 error:(id *)a4
{
  if (a3)
  {
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
    CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    uint64_t v7 = +[ImageTools getValueForTag:@"Orientation" inObject:v6];
    if (v7)
    {
      uint32_t v8 = +[ImageTools getValueForTag:@"Orientation" inObject:v6];
      uint64_t v9 = [v8 intValue];

      CGContextRef v10 = +[ImageTools rotateImage:ImageAtIndex accordingToEXIFOrientation:v9];
      CFRelease(ImageAtIndex);
      CGImageRef ImageAtIndex = v10;
    }
    CFRelease(a3);
  }
  else if (a4)
  {
    +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"could not create image from data"];
    CGImageRef ImageAtIndex = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return ImageAtIndex;
}

+ (CGImage)loadCGImageEXIFRotatedFromURL:(id)a3 error:(id *)a4
{
  CGImageSourceRef v6 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  uint64_t v7 = (CGImage *)[a1 loadCGImageEXIFRotatedFromSource:v6 error:a4];
  CFRelease(v6);
  return v7;
}

+ (CGImage)loadCGImageEXIFRotatedFromData:(id)a3 error:(id *)a4
{
  CGImageSourceRef v6 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  uint64_t v7 = (CGImage *)[a1 loadCGImageEXIFRotatedFromSource:v6 error:a4];
  CFRelease(v6);
  return v7;
}

+ (void)loadRawBufferFromData:(id)a3 width:(unsigned int *)a4 height:(unsigned int *)a5 rowBytes:(unsigned int *)a6 error:(id *)a7
{
  id v11 = a3;
  float v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "getBytes:range:", a4, 0, 4);
    objc_msgSend(v12, "getBytes:range:", a5, 4, 4);
    objc_msgSend(v12, "getBytes:range:", a6, 8, 4);
    size_t v13 = *a5 * *a6;
    uint64_t v14 = malloc_type_malloc(v13, 0x9FD6CA7AuLL);
    objc_msgSend(v12, "getBytes:range:", v14, 12, v13);
  }
  else
  {
    if (a7)
    {
      *a7 = +[AX_CVML_Error createNSErrorWithStatus:16757 andMessage:@"Failed to load raw buffer"];
    }
    uint64_t v14 = 0;
    *a4 = 0;
    *a5 = 0;
    *a6 = 0;
  }

  return v14;
}

+ (void)loadRawBufferFromURL:(id)a3 width:(unsigned int *)a4 height:(unsigned int *)a5 rowBytes:(unsigned int *)a6 error:(id *)a7
{
  id v11 = (void *)MEMORY[0x1E4F1C9B8];
  float v12 = [a3 path];
  size_t v13 = [v11 dataWithContentsOfFile:v12];

  uint64_t v14 = +[ImageTools loadRawBufferFromData:v13 width:a4 height:a5 rowBytes:a6 error:a7];
  return v14;
}

+ (id)numberOfChannelsInImageData:(id)a3 error:(id *)a4
{
  CFDataRef v5 = (const __CFData *)a3;
  CFDataRef v6 = v5;
  if (!v5)
  {
    id v11 = [NSString stringWithFormat:@"ERROR: data is nil"];
    if (a4)
    {
      *a4 = +[AX_CVML_Error createNSErrorWithStatus:16765 andMessage:v11];
    }

    goto LABEL_9;
  }
  uint64_t v7 = CGImageSourceCreateWithData(v5, 0);
  if (!v7 || (uint32_t v8 = v7, ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0), CFRelease(v8), !ImageAtIndex))
  {
LABEL_9:
    uint64_t v12 = -1;
    goto LABEL_14;
  }
  if (CGImageGetBitsPerPixel(ImageAtIndex) == 32)
  {
    CGContextRef v10 = (CFStringRef *)MEMORY[0x1E4F1DC98];
  }
  else
  {
    if (CGImageGetBitsPerPixel(ImageAtIndex) != 8)
    {
      if (a4)
      {
        +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Format not supported (input image must be 32 or 8 bits per pixels)"];
        size_t v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        size_t v13 = 0;
      }
      goto LABEL_13;
    }
    CGContextRef v10 = (CFStringRef *)MEMORY[0x1E4F1DC00];
  }
  size_t v13 = CGColorSpaceCreateWithName(*v10);
LABEL_13:
  CFRelease(ImageAtIndex);
  int NumberOfComponents = CGColorSpaceGetNumberOfComponents(v13);
  CGColorSpaceRelease(v13);
  uint64_t v12 = NumberOfComponents;
LABEL_14:
  float v15 = [NSNumber numberWithInteger:v12];

  return v15;
}

+ (vImage_Buffer)loadVImageBufferFromData:(id)a3 isRaw:(BOOL)a4 lumaOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  CFDataRef v9 = (const __CFData *)a3;
  CFDataRef v10 = v9;
  if (a6)
  {
    if (v9)
    {
      if (v8)
      {
LABEL_4:
        if (v7) {
          NSLog(&cfstr_IgnoringLumaon.isa);
        }
        id v11 = (vImage_Buffer *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
        uint64_t v12 = 0;
        size_t v13 = 0;
        v11->data = +[ImageTools loadRawBufferFromData:v10 width:&v11->width height:&v11->height rowBytes:&v11->rowBytes error:a6];
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v14 = [NSString stringWithFormat:@"ERROR: data is nil"];
      *a6 = +[AX_CVML_Error createNSErrorWithStatus:16765 andMessage:v14];

      if (v8) {
        goto LABEL_4;
      }
    }
    float v15 = CGImageSourceCreateWithData(v10, 0);
    id v11 = (vImage_Buffer *)v15;
    if (v15)
    {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
      CFRelease(v11);
      if (ImageAtIndex)
      {
        if (CGImageGetBitsPerPixel(ImageAtIndex) == 32)
        {
          id v11 = (vImage_Buffer *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
          v11->unint64_t height = CGImageGetHeight(ImageAtIndex);
          size_t Width = CGImageGetWidth(ImageAtIndex);
          v11->width = Width;
          double v18 = (double)Width;
          unint64_t height = v11->height;
          double v20 = (double)height;
          if (v7)
          {
            unint64_t v21 = (Width + 15) & 0xFFFFFFFFFFFFFFF0;
            v11->size_t rowBytes = v21;
            double v22 = malloc_type_malloc(height * v21, 0xDDB706B4uLL);
            v11->data = v22;
            if (v22)
            {
              uint64_t v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
              size_t v24 = v11->height;
              size_t v23 = v11->width;
              size_t BytesPerRow = CGImageGetBytesPerRow(ImageAtIndex);
              CGFloat v26 = CGBitmapContextCreate(0, v23, v24, 8uLL, BytesPerRow, v12, 0x2002u);
              size_t v13 = v26;
              if (v26)
              {
                v56.origin.x = 0.0;
                v56.origin.y = 0.0;
                v56.size.width = v18;
                v56.size.unint64_t height = v20;
                CGContextDrawImage(v26, v56, ImageAtIndex);
              }
              else
              {
                *a6 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to create the context"];
              }
              Data = CGBitmapContextGetData(v13);
              unint64_t v47 = +[ImageTools extractLumaFromBGRA8Buffer:Data withWidth:LODWORD(v11->width) andWithHeight:LODWORD(v11->height) andWithBytesPerRow:CGBitmapContextGetBytesPerRow(v13) toBuffer:v11->data withBytesPerRow:v11->rowBytes];
              if (v47 != 128)
              {
                unint64_t v48 = v47;
                v49 = [NSString stringWithUTF8String:CVML_getStatusDescription(v47)];
                *a6 = +[AX_CVML_Error createNSErrorWithStatus:v48 andMessage:v49];
              }
              goto LABEL_39;
            }
          }
          else
          {
            size_t v38 = CGImageGetBytesPerRow(ImageAtIndex);
            v11->size_t rowBytes = v38;
            v39 = malloc_type_malloc(v11->height * v38, 0x2F0129F6uLL);
            v11->data = v39;
            if (v39)
            {
              uint64_t v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
              v40 = v11->data;
              size_t v41 = v11->height;
              size_t v42 = v11->width;
              size_t rowBytes = v11->rowBytes;
              uint32_t BitmapInfo = CGImageGetBitmapInfo(ImageAtIndex);
              size_t v13 = CGBitmapContextCreate(v40, v42, v41, 8uLL, rowBytes, v12, BitmapInfo);
              if (v13
                || (size_t v13 = CGBitmapContextCreate(v11->data, v11->width, v11->height, 8uLL, v11->rowBytes, v12, 1u)) != 0)
              {
                v58.origin.x = 0.0;
                v58.origin.y = 0.0;
                v58.size.width = v18;
                v58.size.unint64_t height = v20;
                CGContextDrawImage(v13, v58, ImageAtIndex);
LABEL_39:
                CFRelease(ImageAtIndex);
                goto LABEL_40;
              }
              id v45 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to create the context"];
LABEL_30:
              *a6 = v45;
              goto LABEL_39;
            }
          }
        }
        else
        {
          if (CGImageGetBitsPerPixel(ImageAtIndex) != 8)
          {
            id v45 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Format not supported (input image must be 32 or 8 bits per pixels)"];
            id v11 = 0;
            goto LABEL_29;
          }
          id v11 = (vImage_Buffer *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
          v11->unint64_t height = CGImageGetHeight(ImageAtIndex);
          size_t v28 = CGImageGetWidth(ImageAtIndex);
          unint64_t v29 = v11->height;
          unint64_t v30 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
          v11->width = v28;
          v11->size_t rowBytes = v30;
          CGAffineTransform v31 = malloc_type_malloc(v29 * v30, 0xEB4B3BuLL);
          v11->data = v31;
          if (v31)
          {
            long long v32 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
            size_t v34 = v11->height;
            size_t v33 = v11->width;
            size_t v35 = CGImageGetBytesPerRow(ImageAtIndex);
            uint32_t v36 = CGImageGetBitmapInfo(ImageAtIndex);
            v37 = CGBitmapContextCreate(0, v33, v34, 8uLL, v35, v32, v36);
            size_t v13 = v37;
            if (v37)
            {
              v57.size.width = (double)v28;
              v57.size.unint64_t height = (double)v29;
              v57.origin.x = 0.0;
              v57.origin.y = 0.0;
              CGContextDrawImage(v37, v57, ImageAtIndex);
            }
            else
            {
              *a6 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to create the context"];
            }
            v50 = (char *)CGBitmapContextGetData(v13);
            if (v11->height)
            {
              v51 = v50;
              vImagePixelCount v52 = 0;
              v53 = (char *)v11->data;
              do
              {
                size_t v54 = CGBitmapContextGetBytesPerRow(v13);
                memcpy(v53, v51, v54);
                v51 += CGBitmapContextGetBytesPerRow(v13);
                v53 += v11->rowBytes;
                ++v52;
              }
              while (v52 < v11->height);
            }
            CGColorSpaceRelease(v32);
            uint64_t v12 = 0;
            goto LABEL_39;
          }
        }
        id v45 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to allocate the image buffer"];
LABEL_29:
        uint64_t v12 = 0;
        size_t v13 = 0;
        goto LABEL_30;
      }
      id v27 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not extract first image from bundle"];
      id v11 = 0;
    }
    else
    {
      id v27 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not create image from data"];
    }
    uint64_t v12 = 0;
    size_t v13 = 0;
    *a6 = v27;
LABEL_40:
    CGContextRelease(v13);
    CGColorSpaceRelease(v12);
    goto LABEL_41;
  }
  id v11 = 0;
LABEL_41:

  return v11;
}

+ (vImage_Buffer)loadVImageBufferFromURL:(id)a3 lumaOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v7 = a3;
  BOOL v8 = [v7 absoluteString];
  CFDataRef v9 = +[ImageTools guessType:v8];

  CFDataRef v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];

  id v11 = +[ImageTools loadVImageBufferFromData:v10 isRaw:CFEqual(v9, (CFTypeRef)*MEMORY[0x1E4F44498]) != 0 lumaOnly:v6 error:a5];
  return v11;
}

+ (vImage_Buffer)loadVImageBufferEXIFRotatedFromURL:(id)a3 error:(id *)a4
{
  CFDataRef v5 = +[ImageTools loadCGImageEXIFRotatedFromURL:error:](ImageTools, "loadCGImageEXIFRotatedFromURL:error:", a3);
  if (a4)
  {
    if (*a4)
    {
      a4 = 0;
    }
    else
    {
      memset(v7, 0, sizeof(v7));
      +[ImageTools getVImageBufferFromCGImage:v5 error:a4];
      a4 = (id *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
      *a4 = *(id *)&v7[0];
      *(_OWORD *)(a4 + 1) = *(_OWORD *)((char *)v7 + 8);
      a4[3] = (id)*((void *)&v7[1] + 1);
    }
  }
  CGImageRelease(v5);
  return (vImage_Buffer *)a4;
}

+ (vImage_Buffer)loadVImageBufferEXIFRotatedFromData:(id)a3 error:(id *)a4
{
  CFDataRef v5 = +[ImageTools loadCGImageEXIFRotatedFromData:error:](ImageTools, "loadCGImageEXIFRotatedFromData:error:", a3);
  if (a4)
  {
    if (*a4)
    {
      a4 = 0;
    }
    else
    {
      memset(v7, 0, sizeof(v7));
      +[ImageTools getVImageBufferFromCGImage:v5 error:a4];
      a4 = (id *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
      *a4 = *(id *)&v7[0];
      *(_OWORD *)(a4 + 1) = *(_OWORD *)((char *)v7 + 8);
      a4[3] = (id)*((void *)&v7[1] + 1);
    }
  }
  CGImageRelease(v5);
  return (vImage_Buffer *)a4;
}

+ (__CVBuffer)loadCVPixelBufferARGB8FromURL:(id)a3 error:(id *)a4
{
  CFURLRef v5 = (const __CFURL *)a3;
  CVPixelBufferRef pixelBufferOut = 0;
  BOOL v6 = CGImageSourceCreateWithURL(v5, 0);
  if (!v6)
  {
    uint64_t v14 = [NSString stringWithFormat:@"ERROR: Could not create image from URL %@", v5];
    if (a4)
    {
      *a4 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:v14];
    }

    goto LABEL_9;
  }
  id v7 = v6;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
  CFRelease(v7);
  if (!ImageAtIndex)
  {
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not extract first image from bundle"];
      float v15 = 0;
      id v16 = 0;
      int v17 = 0;
      CFDictionaryRef v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
LABEL_9:
    float v15 = 0;
    id v16 = 0;
    int v17 = 0;
    CFDictionaryRef v13 = 0;
    goto LABEL_30;
  }
  if (CGImageGetBitsPerPixel(ImageAtIndex) == 32)
  {
    int Width = CGImageGetWidth(ImageAtIndex);
    int Height = CGImageGetHeight(ImageAtIndex);
    IOSurfacePropertiesDictionary = ImageTools_fcssCreateIOSurfacePropertiesDictionary(Width, Height, 32);
    if (IOSurfacePropertiesDictionary)
    {
      uint64_t v12 = IOSurfacePropertiesDictionary;
      objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", IOSurfacePropertiesDictionary, *MEMORY[0x1E4F24D20], 0);
      CFDictionaryRef v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CFRelease(v12);
      CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      size_t v22 = CGImageGetWidth(ImageAtIndex);
      size_t v23 = CGImageGetHeight(ImageAtIndex);
      if (!CVPixelBufferCreate(v21, v22, v23, 0x20u, v13, &pixelBufferOut))
      {
        CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
        size_t v24 = CVPixelBufferGetWidth(pixelBufferOut);
        size_t v25 = CVPixelBufferGetHeight(pixelBufferOut);
        float v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
        BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
        size_t v27 = CVPixelBufferGetWidth(pixelBufferOut);
        size_t v28 = CVPixelBufferGetHeight(pixelBufferOut);
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
        unint64_t v30 = CGBitmapContextCreate(BaseAddress, v27, v28, 8uLL, BytesPerRow, v15, 6u);
        if (v30)
        {
          id v16 = v30;
          v34.size.unint64_t height = (double)v25;
          v34.size.width = (double)v24;
          v34.origin.x = 0.0;
          v34.origin.y = 0.0;
          CGContextDrawImage(v30, v34, ImageAtIndex);
        }
        else if (a4)
        {
          +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to create the context"];
          id v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v16 = 0;
        }
        int v17 = 1;
        goto LABEL_29;
      }
      if (a4)
      {
        id v18 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to create the CVPixelBuffer"];
        goto LABEL_21;
      }
LABEL_22:
      int v17 = 0;
      id v16 = 0;
      float v15 = 0;
      goto LABEL_29;
    }
    if (a4)
    {
      *a4 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to create the IOSurface properties"];
    }
    ModuleDescription = CVML_getModuleDescription(16766);
    StatusDescription = CVML_getStatusDescription(0x417EuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -2, StatusDescription, "+[ImageTools loadCVPixelBufferARGB8FromURL:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 727);
LABEL_17:
    CFDictionaryRef v13 = 0;
    goto LABEL_22;
  }
  if (!a4) {
    goto LABEL_17;
  }
  id v18 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Format not supported (input image must be 32 bits per pixels)"];
  CFDictionaryRef v13 = 0;
LABEL_21:
  int v17 = 0;
  id v16 = 0;
  float v15 = 0;
  *a4 = v18;
LABEL_29:
  CFRelease(ImageAtIndex);
LABEL_30:
  CGContextRelease(v16);
  CGColorSpaceRelease(v15);
  if (v17) {
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 1uLL);
  }
  CGAffineTransform v31 = pixelBufferOut;

  return v31;
}

+ (__CVBuffer)loadCVPixelBuffer420YpCbCr8FromURL:(id)a3 error:(id *)a4
{
  CFURLRef v5 = (const __CFURL *)a3;
  unint64_t v6 = 16768;
  CVPixelBufferRef pixelBufferOut = 0;
  id v7 = CGImageSourceCreateWithURL(v5, 0);
  if (!v7)
  {
    int v17 = [NSString stringWithFormat:@"ERROR: Could not create image from URL %@", v5];
    if (a4)
    {
      *a4 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:v17];
    }

    CFDictionaryRef v16 = 0;
    goto LABEL_37;
  }
  BOOL v8 = v7;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
  DataProvider = CGImageGetDataProvider(ImageAtIndex);
  CFDataRef v11 = CGDataProviderCopyData(DataProvider);
  CFRelease(v8);
  if (ImageAtIndex)
  {
    if (CGImageGetBitsPerPixel(ImageAtIndex) == 32 || CGImageGetBitsPerPixel(ImageAtIndex) == 8)
    {
      int Width = CGImageGetWidth(ImageAtIndex);
      int Height = CGImageGetHeight(ImageAtIndex);
      IOSurfacePropertiesDictionary = ImageTools_fcssCreateIOSurfacePropertiesDictionary(Width, Height, 875704422);
      if (IOSurfacePropertiesDictionary)
      {
        float v15 = IOSurfacePropertiesDictionary;
        objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", IOSurfacePropertiesDictionary, *MEMORY[0x1E4F24D20], 0);
        CFDictionaryRef v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CFRelease(v15);
        CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        size_t v22 = CGImageGetWidth(ImageAtIndex);
        size_t v23 = CGImageGetHeight(ImageAtIndex);
        if (CVPixelBufferCreate(v21, v22, v23, 0x34323066u, v16, &pixelBufferOut)) {
          goto LABEL_23;
        }
        CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
        unsigned int BitsPerPixel = CGImageGetBitsPerPixel(ImageAtIndex);
        CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(ImageAtIndex);
        int v26 = (BitsPerPixel >> 3);
        if (v26 == 4)
        {
          BOOL v50 = AlphaInfo == kCGImageAlphaFirst;
          BytePtr = CFDataGetBytePtr(v11);
          size_t v46 = CGImageGetWidth(ImageAtIndex);
          size_t v36 = CGImageGetHeight(ImageAtIndex);
          size_t BytesPerRow = CGImageGetBytesPerRow(ImageAtIndex);
          BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 0);
          v40 = CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 1uLL);
          uint64_t v41 = +[ImageTools create420YCbCr8BufferFromRGB8Buffer:BytePtr withWidth:v46 andWithHeight:v36 andWithBytesPerRow:BytesPerRow andAlphaFirst:v50 toLumaBuffer:BaseAddressOfPlane withBytesPerRowLuma:BytesPerRowOfPlane andToChromaBuffer:v40 withBytesPerRowChroma:CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 1uLL)];
          unint64_t v6 = v41;
          int v18 = 1;
          if (v41 > 0x7FuLL) {
            goto LABEL_34;
          }
          uint64_t v32 = v41 - 128;
          ModuleDescription = CVML_getModuleDescription(v41);
          StatusDescription = CVML_getStatusDescription(v6);
          int v35 = 870;
        }
        else if (v26 == 1)
        {
          v49 = CFDataGetBytePtr(v11);
          size_t v47 = CGImageGetWidth(ImageAtIndex);
          size_t v45 = CGImageGetHeight(ImageAtIndex);
          size_t v27 = CGImageGetBytesPerRow(ImageAtIndex);
          size_t v28 = CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
          size_t v29 = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 0);
          int v18 = 1;
          unint64_t v30 = CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 1uLL);
          uint64_t v31 = +[ImageTools create420YCbCr8BufferFromPlanar8Buffer:v49 withWidth:v47 andWithHeight:v45 andWithBytesPerRow:v27 toLumaBuffer:v28 withBytesPerRowLuma:v29 andToChromaBuffer:v30 withBytesPerRowChroma:CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 1uLL)];
          unint64_t v6 = v31;
          if (v31 > 0x7FuLL) {
            goto LABEL_34;
          }
          uint64_t v32 = v31 - 128;
          ModuleDescription = CVML_getModuleDescription(v31);
          StatusDescription = CVML_getStatusDescription(v6);
          int v35 = 857;
        }
        else
        {
          if (a4)
          {
            *a4 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"unexpected number of bytes per pixels"];
          }
          unint64_t v6 = 16747;
          uint64_t v32 = -21;
          ModuleDescription = CVML_getModuleDescription(16747);
          StatusDescription = CVML_getStatusDescription(0x416BuLL);
          int v35 = 875;
        }
        syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, v32, StatusDescription, "+[ImageTools loadCVPixelBuffer420YpCbCr8FromURL:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", v35);
        int v18 = 1;
LABEL_34:
        CFRelease(ImageAtIndex);
        if (v11)
        {
LABEL_35:
          CFRelease(v11);
          if ((v18 & 1) == 0) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
        goto LABEL_18;
      }
      unint64_t v6 = 16766;
      if (a4)
      {
        *a4 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to create the IOSurface properties"];
      }
      id v19 = CVML_getModuleDescription(16766);
      double v20 = CVML_getStatusDescription(0x417EuLL);
      syslog(3, "%s error %lld:%s in %s @ %s:%d\n", v19, -2, v20, "+[ImageTools loadCVPixelBuffer420YpCbCr8FromURL:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 828);
    }
    else if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Format not supported (input image must be 32 bits per pixels)"];
      CFDictionaryRef v16 = 0;
      int v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    CFDictionaryRef v16 = 0;
LABEL_23:
    int v18 = 0;
    goto LABEL_34;
  }
  if (a4)
  {
    +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not extract first image from bundle"];
    int v18 = 0;
    CFDictionaryRef v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (v11) {
      goto LABEL_35;
    }
  }
  else
  {
    int v18 = 0;
    CFDictionaryRef v16 = 0;
    if (v11) {
      goto LABEL_35;
    }
  }
LABEL_18:
  if (v18) {
LABEL_36:
  }
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 1uLL);
LABEL_37:
  if (v6 != 128)
  {
    size_t v42 = [NSString stringWithFormat:@"ERROR: Could not load 420YpCbCr8 buffer"];
    if (a4)
    {
      *a4 = +[AX_CVML_Error createNSErrorWithStatus:v6 andMessage:v42];
    }
  }
  v43 = pixelBufferOut;

  return v43;
}

+ (id)saveCVPixelBufferPlane8:(int)a3 from:(__CVBuffer *)a4 withName:(id)a5 inFolder:(id)a6 error:(id *)a7
{
  id v10 = a5;
  id v11 = a6;
  if ([v10 length])
  {
    if (v11)
    {
      uint64_t v12 = [v11 stringByAppendingPathComponent:v10];
    }
    else
    {
      CFDictionaryRef v13 = NSTemporaryDirectory();
      uint64_t v12 = [v13 stringByAppendingPathComponent:v10];
    }
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a4, a3);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, a3);
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, a3);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, a3);
    int v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
    id v19 = CGDataProviderCreateWithData(0, BaseAddressOfPlane, HeightOfPlane * BytesPerRowOfPlane, 0);
    double v20 = CGImageCreate(WidthOfPlane, HeightOfPlane, 8uLL, 8uLL, BytesPerRowOfPlane, v18, 0, v19, 0, 0, kCGRenderingIntentDefault);
    CFAllocatorRef v21 = CGImageDestinationCreateWithURL((CFURLRef)[MEMORY[0x1E4F1CB10] fileURLWithPath:v12], +[ImageTools guessType:](ImageTools, "guessType:", v10), 1uLL, 0);
    CGImageDestinationAddImage(v21, v20, 0);
    CGImageDestinationFinalize(v21);
    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    CGImageRelease(v20);
    CGDataProviderRelease(v19);
    CGColorSpaceRelease(v18);
    CFRelease(v21);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)saveCVPixelBufferRGBA8:(__CVBuffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 length])
  {
    if (v9)
    {
      id v10 = [v9 stringByAppendingPathComponent:v8];
    }
    else
    {
      id v11 = NSTemporaryDirectory();
      id v10 = [v11 stringByAppendingPathComponent:v8];
    }
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    CFDictionaryRef v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    int v17 = CGDataProviderCreateWithData(0, BaseAddress, Height * BytesPerRow, 0);
    int v18 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, v16, 0, v17, 0, 0, kCGRenderingIntentDefault);
    id v19 = CGImageDestinationCreateWithURL((CFURLRef)[MEMORY[0x1E4F1CB10] fileURLWithPath:v10], +[ImageTools guessType:](ImageTools, "guessType:", v8), 1uLL, 0);
    CGImageDestinationAddImage(v19, v18, 0);
    CGImageDestinationFinalize(v19);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CGImageRelease(v18);
    CGDataProviderRelease(v17);
    CGColorSpaceRelease(v16);
    CFRelease(v19);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)saveCVPixelBuffer420YpCbCr8:(__CVBuffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  CVPixelBufferRef pixelBufferOut = 0;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  IOSurfacePropertiesDictionary = ImageTools_fcssCreateIOSurfacePropertiesDictionary(Width, Height, 32);
  if (IOSurfacePropertiesDictionary)
  {
    uint64_t v14 = IOSurfacePropertiesDictionary;
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", IOSurfacePropertiesDictionary, *MEMORY[0x1E4F24D20], 0);
    CFDictionaryRef v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFRelease(v14);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    size_t v21 = CVPixelBufferGetWidth(a3);
    size_t v22 = CVPixelBufferGetHeight(a3);
    if (CVPixelBufferCreate(v20, v21, v22, 0x20u, v15, &pixelBufferOut))
    {
      unint64_t v16 = 16766;
      ModuleDescription = CVML_getModuleDescription(16766);
      StatusDescription = CVML_getStatusDescription(0x417EuLL);
      syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -2, StatusDescription, "+[ImageTools saveCVPixelBuffer420YpCbCr8:withName:inFolder:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1042);
LABEL_8:
      id v19 = 0;
      goto LABEL_21;
    }
    CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
    signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType > 1714696751)
    {
      if (PixelFormatType == 2033463856 || PixelFormatType == 1714696752)
      {
        id v54 = v10;
        v55 = a6;
        id v56 = v9;
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
        size_t v38 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
        size_t v39 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
        v40 = CVPixelBufferGetBaseAddressOfPlane(a3, 2uLL);
        size_t v41 = CVPixelBufferGetBytesPerRowOfPlane(a3, 2uLL);
        unsigned int v42 = CVPixelBufferGetWidth(a3);
        unsigned int v43 = CVPixelBufferGetHeight(a3);
        BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
        LOBYTE(v50) = 0;
        uint64_t v45 = +[ImageTools createRGB8BufferFrom420Y8PlanarBuffer:withBytesPerRowY:andFrom420Cb8Buffer:withBytesPerRowCb:andFrom420Cr8Buffer:withBytesPerRowCr:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:](ImageTools, "createRGB8BufferFrom420Y8PlanarBuffer:withBytesPerRowY:andFrom420Cb8Buffer:withBytesPerRowCb:andFrom420Cr8Buffer:withBytesPerRowCr:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:", BaseAddressOfPlane, BytesPerRowOfPlane, v38, v39, v40, v41, __PAIR64__(v43, v42), v50, BaseAddress, CVPixelBufferGetBytesPerRow(pixelBufferOut));
        unint64_t v16 = v45;
        if (v45 <= 0x7FuLL)
        {
          uint64_t v33 = v45 - 128;
          CGRect v34 = CVML_getModuleDescription(v45);
          int v35 = CVML_getStatusDescription(v16);
          int v36 = 1061;
          goto LABEL_18;
        }
LABEL_19:
        a6 = v55;
        id v9 = v56;
        id v10 = v54;
        id v19 = +[ImageTools saveCVPixelBufferRGBA8:pixelBufferOut withName:v56 inFolder:v54 error:v55];
LABEL_21:
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
        if (pixelBufferOut) {
          CVPixelBufferRelease(pixelBufferOut);
        }
        goto LABEL_23;
      }
    }
    else if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
    {
      id v54 = v10;
      v55 = a6;
      id v56 = v9;
      size_t v25 = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      size_t v26 = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      size_t v27 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      size_t v28 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      size_t v29 = CVPixelBufferGetWidth(a3);
      size_t v30 = CVPixelBufferGetHeight(a3);
      uint64_t v31 = CVPixelBufferGetBaseAddress(pixelBufferOut);
      LOBYTE(v49) = 0;
      uint64_t v32 = +[ImageTools createRGB8BufferFrom420Y8BiPlanarBuffer:v25 withBytesPerRowLuma:v26 andFrom420CbCr8Buffer:v27 withBytesPerRowChroma:v28 andWithWidth:v29 andWithHeight:v30 andAlphaFirst:v49 toRGB8Buffer:v31 withBytesPerRowDst:CVPixelBufferGetBytesPerRow(pixelBufferOut)];
      unint64_t v16 = v32;
      if (v32 <= 0x7FuLL)
      {
        uint64_t v33 = v32 - 128;
        CGRect v34 = CVML_getModuleDescription(v32);
        int v35 = CVML_getStatusDescription(v16);
        int v36 = 1074;
LABEL_18:
        syslog(3, "%s error %lld:%s in %s @ %s:%d\n", v34, v33, v35, "+[ImageTools saveCVPixelBuffer420YpCbCr8:withName:inFolder:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", v36);
        id v19 = 0;
        a6 = v55;
        id v9 = v56;
        id v10 = v54;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    unint64_t v16 = 16747;
    size_t v46 = CVML_getModuleDescription(16747);
    vImagePixelCount v52 = CVML_getStatusDescription(0x416BuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", v46, -21, v52, "+[ImageTools saveCVPixelBuffer420YpCbCr8:withName:inFolder:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1079);
    goto LABEL_8;
  }
  if (a6)
  {
    *a6 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Failed to create the IOSurface properties"];
  }
  unint64_t v16 = 16766;
  int v17 = CVML_getModuleDescription(16766);
  int v18 = CVML_getStatusDescription(0x417EuLL);
  syslog(3, "%s error %lld:%s in %s @ %s:%d\n", v17, -2, v18, "+[ImageTools saveCVPixelBuffer420YpCbCr8:withName:inFolder:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1027);
  id v19 = 0;
  CFDictionaryRef v15 = 0;
LABEL_23:
  if (v16 != 128)
  {
    size_t v47 = [NSString stringWithFormat:@"ERROR: Could not save 420YpCbCr8 buffer"];
    if (a6)
    {
      *a6 = +[AX_CVML_Error createNSErrorWithStatus:v16 andMessage:v47];
    }
  }

  return v19;
}

+ (CGImage)newCGImageFromPlanar8VImageBuffer:(const vImage_Buffer *)a3 error:(id *)a4
{
  unint64_t v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
  id v7 = CGDataProviderCreateWithData(0, a3->data, a3->height * a3->rowBytes, 0);
  if (!v7)
  {
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not create data provider."];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6) {
        return v10;
      }
    }
    else
    {
      id v10 = 0;
      if (!v6) {
        return v10;
      }
    }
LABEL_9:
    CGColorSpaceRelease(v6);
    return v10;
  }
  id v8 = v7;
  CGImageRef v9 = CGImageCreate(a3->width, a3->height, 8uLL, 8uLL, a3->rowBytes, v6, 0, v7, 0, 0, kCGRenderingIntentDefault);
  id v10 = v9;
  if (a4 && !v9)
  {
    *a4 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not create image."];
  }
  CGDataProviderRelease(v8);
  if (v6) {
    goto LABEL_9;
  }
  return v10;
}

+ (id)saveVImageBufferPlanar8ToJPEGData:(const vImage_Buffer *)a3 withCompressionQuality:(float)a4 error:(id *)a5
{
  id v7 = +[ImageTools newCGImageFromPlanar8VImageBuffer:error:](ImageTools, "newCGImageFromPlanar8VImageBuffer:error:", a3);
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA58] data];
    CGImageRef v9 = [(id)*MEMORY[0x1E4F44410] identifier];
    id v10 = CGImageDestinationCreateWithData(v8, v9, 1uLL, 0);

    if (v10)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
      *(float *)&double v11 = a4;
      CFDictionaryRef v13 = [NSNumber numberWithFloat:v11];
      CGImageDestinationSetProperties(v10, (CFDictionaryRef)objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E4F2F430], 0));

      CGImageDestinationAddImage(v10, v7, 0);
      if (!CGImageDestinationFinalize(v10))
      {
        if (a5)
        {
          *a5 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not finalize image."];
        }

        id v8 = 0;
      }
      CFRelease(v10);
      CGImageRelease(v7);
      id v7 = v8;
      id v8 = v7;
    }
    else
    {
      if (a5)
      {
        *a5 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not create image destination."];
      }
      CGImageRelease(v7);
      id v7 = 0;
    }
  }

  return v7;
}

+ (id)saveVImageBufferPlanar8ToData:(const vImage_Buffer *)a3 deriveTypeFromFileName:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[ImageTools newCGImageFromPlanar8VImageBuffer:a3 error:a5];
  if (v8)
  {
    CGImageRef v9 = v8;
    id v10 = +[ImageTools writeImageToData:type:error:](ImageTools, "writeImageToData:type:error:", v8, +[ImageTools guessType:v7], a5);
    CGImageRelease(v9);
  }
  else
  {
    CGImageRelease(0);
    id v10 = 0;
  }

  return v10;
}

+ (id)saveVImageBufferPlanar8:(const vImage_Buffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (![v9 length])
  {
    double v11 = 0;
LABEL_8:
    id v16 = v11;
    double v11 = v16;
    goto LABEL_10;
  }
  if (v10)
  {
    double v11 = [v10 stringByAppendingPathComponent:v9];
  }
  else
  {
    uint64_t v12 = NSTemporaryDirectory();
    double v11 = [v12 stringByAppendingPathComponent:v9];
  }
  CFDictionaryRef v13 = +[ImageTools newCGImageFromPlanar8VImageBuffer:a3 error:a6];
  if (!v13) {
    goto LABEL_8;
  }
  uint64_t v14 = v13;
  BOOL v15 = +[ImageTools writeImage:v13 toFile:v11 error:a6];
  CGImageRelease(v14);
  if (v15) {
    goto LABEL_8;
  }
  id v16 = 0;
LABEL_10:

  return v16;
}

+ (CGImage)newCGImageFromRGBA8VImageBuffer:(const vImage_Buffer *)a3 error:(id *)a4
{
  unint64_t v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  id v7 = CGDataProviderCreateWithData(0, a3->data, a3->height * a3->rowBytes, 0);
  if (!v7)
  {
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not create data provider."];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6) {
        return v10;
      }
    }
    else
    {
      id v10 = 0;
      if (!v6) {
        return v10;
      }
    }
LABEL_9:
    CGColorSpaceRelease(v6);
    return v10;
  }
  id v8 = v7;
  CGImageRef v9 = CGImageCreate(a3->width, a3->height, 8uLL, 0x20uLL, a3->rowBytes, v6, 0, v7, 0, 0, kCGRenderingIntentDefault);
  id v10 = v9;
  if (a4 && !v9)
  {
    *a4 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not create image."];
  }
  CGDataProviderRelease(v8);
  if (v6) {
    goto LABEL_9;
  }
  return v10;
}

+ (id)writeImageToData:(CGImage *)a3 type:(__CFString *)a4 error:(id *)a5
{
  id v8 = [MEMORY[0x1E4F1CA58] data];
  CGImageRef v9 = CGImageDestinationCreateWithData(v8, a4, 1uLL, 0);
  if (v9)
  {
    id v10 = v9;
    CGImageDestinationAddImage(v9, a3, 0);
    if (!CGImageDestinationFinalize(v10))
    {
      if (a5)
      {
        *a5 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not finalize image."];
      }

      id v8 = 0;
    }
    CFRelease(v10);
    double v11 = v8;
    id v8 = v11;
  }
  else if (a5)
  {
    +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not create image destination."];
    double v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

+ (id)saveVImageBufferRGBA8ToJPEGData:(const vImage_Buffer *)a3 withCompressionQuality:(float)a4 error:(id *)a5
{
  id v7 = +[ImageTools newCGImageFromRGBA8VImageBuffer:error:](ImageTools, "newCGImageFromRGBA8VImageBuffer:error:", a3);
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA58] data];
    CGImageRef v9 = [(id)*MEMORY[0x1E4F44410] identifier];
    id v10 = CGImageDestinationCreateWithData(v8, v9, 1uLL, 0);

    if (v10)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
      *(float *)&double v11 = a4;
      CFDictionaryRef v13 = [NSNumber numberWithFloat:v11];
      CGImageDestinationSetProperties(v10, (CFDictionaryRef)objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E4F2F430], 0));

      CGImageDestinationAddImage(v10, v7, 0);
      if (!CGImageDestinationFinalize(v10))
      {
        if (a5)
        {
          *a5 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not finalize image."];
        }

        id v8 = 0;
      }
      CFRelease(v10);
      CGImageRelease(v7);
      id v7 = v8;
      id v8 = v7;
    }
    else
    {
      if (a5)
      {
        *a5 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not create image destination."];
      }
      CGImageRelease(v7);
      id v7 = 0;
    }
  }

  return v7;
}

+ (id)saveVImageBufferRGBA8ToData:(const vImage_Buffer *)a3 deriveTypeFromFileName:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[ImageTools newCGImageFromRGBA8VImageBuffer:a3 error:a5];
  if (v8)
  {
    CGImageRef v9 = v8;
    id v10 = +[ImageTools writeImageToData:type:error:](ImageTools, "writeImageToData:type:error:", v8, +[ImageTools guessType:v7], a5);
    CGImageRelease(v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (BOOL)writeImage:(CGImage *)a3 toFile:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = a4;
  CFURLRef v9 = (const __CFURL *)[v7 fileURLWithPath:v8];
  id v10 = +[ImageTools guessType:v8];

  double v11 = CGImageDestinationCreateWithURL(v9, v10, 1uLL, 0);
  if (v11)
  {
    uint64_t v12 = v11;
    CGImageDestinationAddImage(v11, a3, 0);
    BOOL v13 = CGImageDestinationFinalize(v12);
    BOOL v14 = v13;
    if (a5 && !v13)
    {
      *a5 = +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not finalize image."];
    }
    CFRelease(v12);
  }
  else if (a5)
  {
    +[AX_CVML_Error createNSErrorWithStatus:16766 andMessage:@"Could not finalize image."];
    BOOL v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v14;
}

+ (id)saveVImageBufferRGBA8:(const vImage_Buffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (![v9 length])
  {
    double v11 = 0;
LABEL_10:
    id v15 = v11;
    double v11 = v15;
    goto LABEL_12;
  }
  if (v10)
  {
    double v11 = [v10 stringByAppendingPathComponent:v9];
  }
  else
  {
    uint64_t v12 = NSTemporaryDirectory();
    double v11 = [v12 stringByAppendingPathComponent:v9];
  }
  BOOL v13 = +[ImageTools newCGImageFromRGBA8VImageBuffer:a3 error:a6];
  if (v13)
  {
    BOOL v14 = v13;
    if (!+[ImageTools writeImage:v13 toFile:v11 error:a6])
    {

      double v11 = 0;
    }
    CGImageRelease(v14);
    goto LABEL_10;
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

+ (id)saveCGImage:(const CGImage *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([v8 length])
  {
    if (v9)
    {
      id v10 = [v9 stringByAppendingPathComponent:v8];
    }
    else
    {
      double v11 = NSTemporaryDirectory();
      id v10 = [v11 stringByAppendingPathComponent:v8];
    }
    CFURLRef v12 = (const __CFURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
    BOOL v13 = AXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      CFURLRef v21 = v12;
      _os_log_impl(&dword_1B57D5000, v13, OS_LOG_TYPE_DEFAULT, "Saving image to URL: %@", (uint8_t *)&v20, 0xCu);
    }

    BOOL v14 = CGImageDestinationCreateWithURL(v12, +[ImageTools guessType:v8], 1uLL, 0);
    if (v14)
    {
      id v15 = v14;
      CGImageDestinationAddImage(v14, a3, 0);
      BOOL v16 = CGImageDestinationFinalize(v15);
      int v17 = AXLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        CFURLRef v18 = [NSNumber numberWithBool:v16];
        int v20 = 138412290;
        CFURLRef v21 = v18;
        _os_log_impl(&dword_1B57D5000, v17, OS_LOG_TYPE_DEFAULT, "Succe: %@", (uint8_t *)&v20, 0xCu);
      }
      CFRelease(v15);
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)saveRawBuffer:(void *)a3 withWidth:(unsigned int)a4 andHeight:(unsigned int)a5 andRowBytes:(unsigned int)a6 withName:(id)a7 inFolder:(id)a8 error:(id *)a9
{
  unsigned int v21 = a5;
  unsigned int v22 = a4;
  unsigned int v20 = a6;
  id v13 = a7;
  id v14 = a8;
  if ([v13 length])
  {
    if (v14)
    {
      id v15 = [v14 stringByAppendingPathComponent:v13];
    }
    else
    {
      BOOL v16 = NSTemporaryDirectory();
      id v15 = [v16 stringByAppendingPathComponent:v13];
    }
    uint64_t v17 = a5 * a6;
    CFURLRef v18 = [MEMORY[0x1E4F1CA58] dataWithLength:v17 + 12];
    objc_msgSend(v18, "replaceBytesInRange:withBytes:", 0, 4, &v22);
    objc_msgSend(v18, "replaceBytesInRange:withBytes:", 4, 4, &v20);
    objc_msgSend(v18, "replaceBytesInRange:withBytes:", 8, 4, &v21);
    objc_msgSend(v18, "replaceBytesInRange:withBytes:", 12, v17, a3);
    [v18 writeToFile:v15 atomically:1];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (vImage_Buffer)getVImageBufferFromCVPixelBuffer:(SEL)a3 channel:(__CVBuffer *)a4 error:(int)a5
{
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  if (CVPixelBufferGetPlaneCount(a4))
  {
    retstr->data = CVPixelBufferGetBaseAddressOfPlane(a4, a5);
    retstr->unint64_t height = CVPixelBufferGetHeightOfPlane(a4, a5);
    retstr->width = CVPixelBufferGetWidthOfPlane(a4, a5);
    result = (vImage_Buffer *)CVPixelBufferGetBytesPerRowOfPlane(a4, a5);
  }
  else
  {
    retstr->data = CVPixelBufferGetBaseAddress(a4);
    retstr->unint64_t height = CVPixelBufferGetHeight(a4);
    retstr->width = CVPixelBufferGetWidth(a4);
    result = (vImage_Buffer *)CVPixelBufferGetBytesPerRow(a4);
  }
  retstr->size_t rowBytes = (size_t)result;
  return result;
}

+ (vImage_Buffer)getVImageBufferFromCGImageLuma:(SEL)a3 error:(CGImage *)a4
{
  id v7 = +[ImageTools createARGBBitmapContextWithImage:](ImageTools, "createARGBBitmapContextWithImage:", a4, a5);
  size_t Width = CGImageGetWidth(a4);
  size_t Height = CGImageGetHeight(a4);
  v30.size.width = (double)Width;
  v30.size.unint64_t height = (double)Height;
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  CGContextDrawImage(v7, v30, a4);
  Data = (unsigned __int8 *)CGBitmapContextGetData(v7);
  retstr->data = 0;
  retstr->unint64_t height = Height;
  size_t v11 = (Width + 15) & 0xFFFFFFFFFFFFFFF0;
  int v28 = Width;
  retstr->width = Width;
  retstr->size_t rowBytes = v11;
  size_t v25 = Data;
  size_t v26 = v11;
  CFURLRef v12 = malloc_type_malloc(v11 * Height, 0x20EEE66AuLL);
  retstr->data = v12;
  int v27 = Height;
  if ((int)Height >= 1)
  {
    id v13 = v12;
    int v14 = 0;
    uint64_t v15 = Width;
    BOOL v16 = v25;
    do
    {
      if (v28 >= 1)
      {
        uint64_t v17 = 0;
        LODWORD(v18) = 0;
        do
        {
          ColorSpace = CGImageGetColorSpace(a4);
          CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
          uint64_t v21 = (int)v18;
          uint64_t v18 = (int)v18 + 1;
          if (Model)
          {
            int v22 = v16[v18];
            LODWORD(v18) = v21 + 4;
            unsigned int v23 = (77 * v22 + 151 * v16[v21 + 2] + 28 * v16[v21 + 3]) >> 8;
          }
          else
          {
            unsigned int v23 = (255 * v16[v21]) >> 8;
          }
          v13[v17++] = v23;
        }
        while (v15 != v17);
      }
      v16 += CGBitmapContextGetBytesPerRow(v7);
      v13 += v26;
      ++v14;
    }
    while (v14 != v27);
  }
  CGContextRelease(v7);

  free(v25);
  return result;
}

+ (vImage_Buffer)getVImageBufferFromCGImage:(SEL)a3 error:(CGImage *)a4
{
  DataProvider = CGImageGetDataProvider(a4);
  CFDataRef v8 = CGDataProviderCopyData(DataProvider);
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  retstr->width = CGImageGetWidth(a4);
  retstr->unint64_t height = CGImageGetHeight(a4);
  retstr->size_t rowBytes = CGImageGetBytesPerRow(a4);
  size_t Length = CFDataGetLength(v8);
  id v10 = malloc_type_malloc(Length, 0xADB244AAuLL);
  retstr->data = v10;
  BytePtr = CFDataGetBytePtr(v8);
  size_t v12 = CFDataGetLength(v8);
  memcpy(v10, BytePtr, v12);

  CFRelease(v8);
  return result;
}

+ (int64_t)extractLumaFromBGRA8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 toBuffer:(void *)a7 withBytesPerRow:(unint64_t)a8
{
  if (a3 && a7)
  {
    int64_t v8 = 16768;
    if (a5)
    {
      uint64_t v11 = 0;
      uint64_t v12 = a5;
      unint64_t v13 = a4 - 8;
      unint64_t v14 = a4;
      uint64_t v15 = a4 - 8;
      BOOL v16 = (char *)a7 + 8;
      uint64_t v17 = (unsigned __int8 *)a3;
      do
      {
        unint64_t v18 = 0;
        id v19 = v16;
        do
        {
          int8x8x4_t v25 = vld4_s8((const char *)a3);
          a3 = (char *)a3 + 32;
          unint64_t v20 = v18;
          uint64_t v21 = v19;
          *(int8x8_t *)((char *)a7 + v18) = vaddhn_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v25.val[1], (uint8x8_t)0x9696969696969696), (uint8x8_t)v25.val[0], (uint8x8_t)0x1D1D1D1D1D1D1D1DLL), (int16x8_t)vmull_u8((uint8x8_t)v25.val[2], (uint8x8_t)0x4C4C4C4C4C4C4C4CLL));
          v18 += 8;
          v19 += 8;
        }
        while (v18 <= v13);
        if (v18 < v14)
        {
          unint64_t v22 = v15 - v20;
          unsigned int v23 = v17;
          do
          {
            *v21++ = (unsigned __int16)(29 * *v23 + 150 * v23[1] + 76 * v23[2]) >> 8;
            v23 += 4;
            --v22;
          }
          while (v22);
        }
        a7 = (char *)a7 + v18;
        v17 += a6;
        ++v11;
        v16 += a8;
      }
      while (v11 != v12);
    }
  }
  else
  {
    int64_t v8 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools extractLumaFromBGRA8Buffer:withWidth:andWithHeight:andWithBytesPerRow:toBuffer:withBytesPerRow:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1537);
  }
  return v8;
}

+ (int64_t)create420YCbCr8BufferFromPlanar8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 toLumaBuffer:(void *)a7 withBytesPerRowLuma:(unint64_t)a8 andToChromaBuffer:(void *)a9 withBytesPerRowChroma:(unint64_t)a10
{
  uint64_t v11 = (char *)a7;
  unint64_t v14 = (char *)a3;
  uint64_t v15 = a9;
  if (a3 && a7 && a9)
  {
    int64_t v16 = 16768;
    if (a5 >= 1)
    {
      int v19 = a5;
      unint64_t v20 = (char *)a3;
      do
      {
        memcpy(v11, v20, a4);
        v20 += a6;
        v11 += a8;
        --v19;
      }
      while (v19);
      int64_t v16 = 16768;
      if (a5 >= 2)
      {
        int v21 = 0;
        unint64_t v22 = &v14[a6];
        unint64_t v23 = 2 * a6;
        do
        {
          if (a4 >= 1)
          {
            uint64_t v24 = 1;
            int8x8x4_t v25 = v15;
            do
            {
              *v25++ = (v14[v24]
                      + v14[v24 - 1]
                      + v22[v24 - 1]
                      + v22[v24]) >> 2;
              uint64_t v26 = v24 + 1;
              v24 += 2;
            }
            while (v26 < a4);
          }
          v22 += v23;
          v14 += v23;
          v15 += a10;
          ++v21;
        }
        while (v21 != a5 >> 1);
      }
    }
  }
  else
  {
    int64_t v16 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools create420YCbCr8BufferFromPlanar8Buffer:withWidth:andWithHeight:andWithBytesPerRow:toLumaBuffer:withBytesPerRowLuma:andToChromaBuffer:withBytesPerRowChroma:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1615);
  }
  return v16;
}

+ (int64_t)create420YCbCr8BufferFromRGB8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 andAlphaFirst:(BOOL)a7 toLumaBuffer:(void *)a8 withBytesPerRowLuma:(unint64_t)a9 andToChromaBuffer:(void *)a10 withBytesPerRowChroma:(unint64_t)a11
{
  unint64_t v13 = a10;
  if (a3 && a8 && a10)
  {
    int64_t v14 = 16768;
    int v17 = a5 >> 1;
    unint64_t v18 = (char *)a3 + a7;
    unsigned int v19 = a4 >> 1;
    uint64_t v20 = 2 * (a6 - 4 * a4) + 8;
    uint64_t v21 = (a6 - 4 * a4) + 12;
    do
    {
      uint64_t v22 = 0;
      unint64_t v23 = &v18[v20];
      uint64_t v24 = &v18[v21];
      int8x8x4_t v25 = v18;
      unsigned int v26 = v19;
      do
      {
        LOBYTE(v11) = *v25;
        LOBYTE(v12) = v25[1];
        *(float *)&unsigned int v27 = (float)LODWORD(v12) * 0.5872;
        float v28 = *(float *)&v27 + (float)((float)LODWORD(v11) * 0.2988);
        LOBYTE(v27) = v25[2];
        float v29 = (float)(v28 + (float)((float)v27 * 0.114)) + 0.5;
        unsigned int v30 = 1132396544;
        if (v29 >= 0.0) {
          float v31 = v29;
        }
        else {
          float v31 = 0.0;
        }
        if (v29 <= 255.0) {
          float v32 = v31;
        }
        else {
          float v32 = 255.0;
        }
        *((unsigned char *)a8 + v22) = (int)v32;
        LOBYTE(v32) = *v25;
        LOBYTE(v31) = v25[1];
        *(float *)&unsigned int v33 = (float)LODWORD(v31) * -0.3391;
        float v34 = *(float *)&v33 + (float)((float)LODWORD(v32) * -0.1726);
        LOBYTE(v33) = v25[2];
        float v35 = (float)(v34 + (float)((float)v33 * 0.5117)) + 128.5;
        if (v35 >= 0.0) {
          float v36 = v35;
        }
        else {
          float v36 = 0.0;
        }
        if (v35 <= 255.0) {
          float v37 = v36;
        }
        else {
          float v37 = 255.0;
        }
        size_t v38 = &v13[v22];
        v13[v22] = (int)v37;
        LOBYTE(v37) = *v25;
        LOBYTE(v36) = v25[1];
        *(float *)&unsigned int v39 = (float)LODWORD(v36) * -0.4282;
        float v40 = *(float *)&v39 + (float)((float)LODWORD(v37) * 0.5115);
        LOBYTE(v39) = v25[2];
        float v41 = (float)(v40 + (float)((float)v39 * -0.083)) + 128.5;
        if (v41 >= 0.0) {
          float v42 = v41;
        }
        else {
          float v42 = 0.0;
        }
        if (v41 <= 255.0) {
          float v43 = v42;
        }
        else {
          float v43 = 255.0;
        }
        unint64_t v18 = v23;
        v38[1] = (int)v43;
        LOBYTE(v43) = v25[4];
        LOBYTE(v42) = v25[5];
        *(float *)&unsigned int v44 = (float)LODWORD(v42) * 0.5872;
        float v45 = *(float *)&v44 + (float)((float)LODWORD(v43) * 0.2988);
        LOBYTE(v44) = v25[6];
        float v46 = (float)(v45 + (float)((float)v44 * 0.114)) + 0.5;
        if (v46 >= 0.0) {
          float v47 = v46;
        }
        else {
          float v47 = 0.0;
        }
        if (v46 <= 255.0) {
          float v48 = v47;
        }
        else {
          float v48 = 255.0;
        }
        uint64_t v49 = v24;
        *((unsigned char *)a8 + v22 + 1) = (int)v48;
        LOBYTE(v48) = *v38;
        LOBYTE(v30) = v25[4];
        *(float *)&unsigned int v50 = (float)v30;
        float v51 = (float)LODWORD(v48) + (float)(*(float *)&v50 * -0.1726);
        LOBYTE(v50) = v25[5];
        *(float *)&unsigned int v52 = (float)v50;
        float v53 = v51 + (float)(*(float *)&v52 * -0.3391);
        LOBYTE(v52) = v25[6];
        float v54 = (float)((float)(v53 + (float)((float)v52 * 0.5117)) + 128.5) * 0.5;
        float v55 = 255.0;
        if (v54 <= 255.0)
        {
          float v55 = 0.0;
          if (v54 >= 0.0) {
            float v55 = v54;
          }
        }
        *size_t v38 = (int)v55;
        LOBYTE(v54) = v38[1];
        LOBYTE(v55) = v25[4];
        *(float *)&unsigned int v56 = (float)LODWORD(v55);
        float v57 = (float)LODWORD(v54) + (float)(*(float *)&v56 * 0.5115);
        LOBYTE(v56) = v25[5];
        *(float *)&unsigned int v58 = (float)v56;
        float v59 = v57 + (float)(*(float *)&v58 * -0.4282);
        LOBYTE(v58) = v25[6];
        float v11 = (float)((float)(v59 + (float)((float)v58 * -0.083)) + 128.5) * 0.5;
        float v12 = 255.0;
        if (v11 <= 255.0)
        {
          float v12 = 0.0;
          if (v11 >= 0.0) {
            float v12 = v11;
          }
        }
        v25 += 8;
        v38[1] = (int)v12;
        v22 += 2;
        v23 += 8;
        v24 += 8;
        --v26;
      }
      while (v26);
      unint64_t v60 = a9;
      unsigned int v61 = v19;
      do
      {
        v62 = (char *)a8 + v60;
        LOBYTE(v11) = *(v49 - 2);
        LOBYTE(v12) = *(v49 - 3);
        *(float *)&unsigned int v63 = (float)LODWORD(v12) * 0.5872;
        float v64 = *(float *)&v63 + (float)((float)LODWORD(v11) * 0.2988);
        LOBYTE(v63) = *(v49 - 4);
        *(float *)&unsigned int v65 = (float)v63;
        *(float *)&unsigned int v66 = (float)(v64 + (float)(*(float *)&v65 * 0.114)) + 0.5;
        char *v62 = (int)*(float *)&v66;
        LOBYTE(v66) = v49[2];
        LOBYTE(v65) = v49[1];
        *(float *)&unsigned int v67 = (float)v65 * 0.5872;
        float v68 = *(float *)&v67 + (float)((float)v66 * 0.2988);
        LOBYTE(v67) = *v49;
        float v12 = (float)v67;
        float v11 = (float)(v68 + (float)(v12 * 0.114)) + 0.5;
        v62[1] = (int)v11;
        v18 += 8;
        v60 += 2;
        v49 += 8;
        --v61;
      }
      while (v61);
      a8 = (char *)a8 + a9 + a9;
      v13 += a11;
      --v17;
    }
    while (v17);
  }
  else
  {
    int64_t v14 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools create420YCbCr8BufferFromRGB8Buffer:withWidth:andWithHeight:andWithBytesPerRow:andAlphaFirst:toLumaBuffer:withBytesPerRowLuma:andToChromaBuffer:withBytesPerRowChroma:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1666);
  }
  return v14;
}

+ (int64_t)createRGB8BufferFrom420Y8PlanarBuffer:(void *)a3 withBytesPerRowY:(unint64_t)a4 andFrom420Cb8Buffer:(void *)a5 withBytesPerRowCb:(unint64_t)a6 andFrom420Cr8Buffer:(void *)a7 withBytesPerRowCr:(unint64_t)a8 andWithWidth:(int)a9 andWithHeight:(int)a10 andAlphaFirst:(BOOL)a11 toRGB8Buffer:(void *)__b withBytesPerRowDst:(unint64_t)a13
{
  if (a7 && a5 && a3 && __b)
  {
    int v20 = a10 >> 1;
    memset(__b, 255, a10 * a13);
    unsigned int v21 = 0;
    uint64_t v22 = (char *)a3 + 1;
    do
    {
      if (a9 >= 1)
      {
        uint64_t v23 = 0;
        uint64_t v24 = (char *)__b + a13 * v21;
        uint64_t v25 = v21 + 1;
        unsigned int v26 = &v22[a4 * v25];
        unsigned int v27 = &v22[a4 * v21];
        float v28 = (char *)__b + a13 * v25;
        uint64_t v29 = v21 >> 1;
        unsigned int v30 = (unsigned __int8 *)a7 + v29 * a8;
        float v31 = (unsigned __int8 *)a5 + v29 * a6;
        do
        {
          float v32 = &v24[a11];
          int v34 = *v31++;
          int v33 = v34;
          int v35 = *v30++;
          v33 -= 128;
          unsigned int v36 = v27[v23 - 1];
          int v37 = 512 - 343 * v33;
          int v38 = 1773 * v33 + 512;
          unsigned int v39 = &v26[v23];
          v40.i32[0] = 512;
          v40.i32[1] = v37;
          int32x2_t v41 = vmla_s32(v40, vdup_n_s32(v35 - 128), (int32x2_t)0xFFFFFD370000057CLL);
          int32x2_t v42 = vdup_n_s32(v36);
          if ((int)((v36 + (v38 >> 10)) & ~((int)(v36 + (v38 >> 10)) >> 31)) >= 255) {
            char v43 = -1;
          }
          else {
            char v43 = (v36 + (v38 >> 10)) & ~((int)(v36 + (v38 >> 10)) >> 31);
          }
          int32x2_t v44 = vmin_s32(vmax_s32(vsra_n_s32(v42, v41, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          v32[2] = v43;
          v32[1] = v44.i8[4];
          *float v32 = v44.i8[0];
          unsigned int v45 = *(v39 - 1);
          int32x2_t v46 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v45), v41, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          float v47 = &v28[a11];
          *float v47 = v46.i8[0];
          int v48 = (v45 + (v38 >> 10)) & ~((int)(v45 + (v38 >> 10)) >> 31);
          v47[1] = v46.i8[4];
          if (v48 >= 255) {
            LOBYTE(v48) = -1;
          }
          v47[2] = v48;
          unsigned int v49 = v27[v23];
          int32x2_t v50 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v49), v41, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          v32[4] = v50.i8[0];
          int v51 = (v49 + (v38 >> 10)) & ~((int)(v49 + (v38 >> 10)) >> 31);
          v32[5] = v50.i8[4];
          if (v51 >= 255) {
            LOBYTE(v51) = -1;
          }
          v32[6] = v51;
          unsigned int v52 = *v39;
          int32x2_t v53 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v52), v41, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          v47[4] = v53.i8[0];
          int v54 = (v52 + (v38 >> 10)) & ~((int)(v52 + (v38 >> 10)) >> 31);
          v47[5] = v53.i8[4];
          if (v54 >= 255) {
            LOBYTE(v54) = -1;
          }
          v47[6] = v54;
          v23 += 2;
          v24 += 8;
          v28 += 8;
        }
        while ((int)v23 < a9);
      }
      v21 += 2;
      --v20;
    }
    while (v20);
    return 16768;
  }
  else
  {
    int64_t v17 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools createRGB8BufferFrom420Y8PlanarBuffer:withBytesPerRowY:andFrom420Cb8Buffer:withBytesPerRowCb:andFrom420Cr8Buffer:withBytesPerRowCr:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1769);
  }
  return v17;
}

+ (int64_t)createRGB8BufferFrom420Y8BiPlanarBuffer:(void *)a3 withBytesPerRowLuma:(unint64_t)a4 andFrom420CbCr8Buffer:(void *)a5 withBytesPerRowChroma:(unint64_t)a6 andWithWidth:(int)a7 andWithHeight:(int)a8 andAlphaFirst:(BOOL)a9 toRGB8Buffer:(void *)__b withBytesPerRowDst:(unint64_t)a11
{
  if (a5 && a3 && __b)
  {
    int v19 = a8 >> 1;
    memset(__b, 255, a8 * a11);
    unsigned int v20 = 0;
    unsigned int v21 = (char *)__b + a9 + 4;
    uint64_t v22 = (char *)a3 + 1;
    do
    {
      if (a7 >= 1)
      {
        uint64_t v23 = 0;
        uint64_t v24 = &v21[a11 * v20];
        uint64_t v25 = v20 + 1;
        unsigned int v26 = &v22[a4 * v25];
        unsigned int v27 = &v22[a4 * v20];
        float v28 = (char *)a5 + a6 * ((unint64_t)v20 >> 1);
        uint64_t v29 = &v21[a11 * v25];
        do
        {
          int v30 = v28[v23] - 128;
          unsigned int v31 = v28[v23 + 1] - 128;
          unsigned int v32 = v27[v23 - 1];
          int v33 = 512 - 343 * v30;
          int v34 = 1773 * v30 + 512;
          int v35 = (v32 + (v34 >> 10)) & ~((int)(v32 + (v34 >> 10)) >> 31);
          if (v35 >= 255) {
            LOBYTE(v35) = -1;
          }
          *(v24 - 2) = v35;
          v36.i32[0] = 512;
          v36.i32[1] = v33;
          int32x2_t v37 = vmla_s32(v36, vdup_n_s32(v31), (int32x2_t)0xFFFFFD370000057CLL);
          int32x2_t v38 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v32), v37, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          *(v24 - 3) = v38.i8[4];
          *(v24 - 4) = v38.i8[0];
          unsigned int v39 = v26[v23 - 1];
          int32x2_t v40 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v39), v37, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          *(v29 - 4) = v40.i8[0];
          *(v29 - 3) = v40.i8[4];
          int v41 = (v39 + (v34 >> 10)) & ~((int)(v39 + (v34 >> 10)) >> 31);
          if (v41 >= 255) {
            LOBYTE(v41) = -1;
          }
          *(v29 - 2) = v41;
          unsigned int v42 = v27[v23];
          int32x2_t v43 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v42), v37, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          *uint64_t v24 = v43.i8[0];
          v24[1] = v43.i8[4];
          int v44 = (v42 + (v34 >> 10)) & ~((int)(v42 + (v34 >> 10)) >> 31);
          if (v44 >= 255) {
            LOBYTE(v44) = -1;
          }
          v24[2] = v44;
          unsigned int v45 = v26[v23];
          int32x2_t v46 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v45), v37, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          *uint64_t v29 = v46.i8[0];
          v29[1] = v46.i8[4];
          int v47 = (v45 + (v34 >> 10)) & ~((int)(v45 + (v34 >> 10)) >> 31);
          if (v47 >= 255) {
            LOBYTE(v47) = -1;
          }
          v29[2] = v47;
          v23 += 2;
          v24 += 8;
          v29 += 8;
        }
        while ((int)v23 < a7);
      }
      v20 += 2;
      --v19;
    }
    while (v19);
    return 16768;
  }
  else
  {
    int64_t v16 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools createRGB8BufferFrom420Y8BiPlanarBuffer:withBytesPerRowLuma:andFrom420CbCr8Buffer:withBytesPerRowChroma:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1873);
  }
  return v16;
}

@end