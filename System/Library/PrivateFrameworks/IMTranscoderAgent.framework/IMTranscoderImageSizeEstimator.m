@interface IMTranscoderImageSizeEstimator
+ (id)newEstimatorWithURL:(id)a3 uti:(id)a4 imageSource:(CGImageSource *)a5;
- (CGSize)_newSizeForMaximumDimension:(int64_t)a3 originalSize:(CGSize)result;
- (IMTranscoderImageSizeEstimator)initWithUTI:(id)a3 imageSource:(CGImageSource *)a4;
- (IMTranscoderImageSizeEstimator)initWithUTI:(id)a3 originalSize:(CGSize)a4 fileSize:(unint64_t)a5;
- (double)_estimatedBytesPerPixelForJPEGQuality:(double)a3;
- (double)_nominalBytesPerPixelForUTI:(id)a3;
- (double)_normalizedInputFactorForUTI:(id)a3 bytesPerPixel:(double)a4;
- (unint64_t)estimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5;
@end

@implementation IMTranscoderImageSizeEstimator

+ (id)newEstimatorWithURL:(id)a3 uti:(id)a4 imageSource:(CGImageSource *)a5
{
  if (!UTTypeConformsTo((CFStringRef)a4, (CFStringRef)*MEMORY[0x263F01A80])
    && !UTTypeConformsTo((CFStringRef)a4, @"public.heif-standard")
    || (v8 = [IMTranscoderImageCMPhotoSizeEstimator alloc],
        (id result = (id)objc_msgSend_initWithURL_uti_imageSource_(v8, v9, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v10, v11)) == 0))
  {
    v13 = [IMTranscoderImageSizeEstimator alloc];
    return (id)MEMORY[0x270F9A6D0](v13, sel_initWithUTI_imageSource_, a4, a5, v14, v15, v16);
  }
  return result;
}

- (IMTranscoderImageSizeEstimator)initWithUTI:(id)a3 imageSource:(CGImageSource *)a4
{
  v36.receiver = self;
  v36.super_class = (Class)IMTranscoderImageSizeEstimator;
  v6 = [(IMTranscoderImageSizeEstimator *)&v36 init];
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a4, 0, 0);
  if (ImageAtIndex)
  {
    v8 = ImageAtIndex;
    size_t BitsPerPixel = CGImageGetBitsPerPixel(ImageAtIndex);
    CGFloat Width = (double)CGImageGetWidth(v8);
    size_t Height = CGImageGetHeight(v8);
    v6->_originalSize.width = Width;
    v6->_originalSize.height = (double)Height;
    CFRelease(v8);
    if (v6->_originalSize.width != *MEMORY[0x263F001B0]
      || v6->_originalSize.height != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      CFDictionaryRef v13 = CGImageSourceCopyProperties(a4, 0);
      CFDictionaryRef v19 = v13;
      if (v13)
      {
        v20 = objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x263F0F360], v15, v16, v17, v18);
        objc_msgSend_doubleValue(v20, v21, v22, v23, v24, v25, v26);
        if (v32 != 0.0)
        {
          double v33 = v32 / (v6->_originalSize.width * v6->_originalSize.height);
          if (BitsPerPixel > 0x27) {
            double v33 = v33 * 0.5;
          }
          objc_msgSend__normalizedInputFactorForUTI_bytesPerPixel_(v6, v27, (uint64_t)a3, v28, v29, v30, v31, v33);
          v6->_normalizedInputFactor = v34;
        }
      }
    }
  }
  return v6;
}

- (IMTranscoderImageSizeEstimator)initWithUTI:(id)a3 originalSize:(CGSize)a4 fileSize:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  v17.receiver = self;
  v17.super_class = (Class)IMTranscoderImageSizeEstimator;
  v9 = [(IMTranscoderImageSizeEstimator *)&v17 init];
  v9->_originalSize.double width = width;
  v9->_originalSize.double height = height;
  objc_msgSend__normalizedInputFactorForUTI_bytesPerPixel_(v9, v10, (uint64_t)a3, v11, v12, v13, v14, (double)a5 / (width * height));
  v9->_normalizedInputFactor = v15;
  return v9;
}

- (CGSize)_newSizeForMaximumDimension:(int64_t)a3 originalSize:(CGSize)result
{
  if (result.width >= result.height) {
    double width = result.width;
  }
  else {
    double width = result.height;
  }
  if (width > (double)a3)
  {
    double v5 = (double)a3 / width;
    result.double width = (double)(int)(result.width * v5);
    result.double height = (double)(int)(result.height * v5);
  }
  return result;
}

- (double)_nominalBytesPerPixelForUTI:(id)a3
{
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01A80])) {
    return 0.35;
  }
  if (UTTypeConformsTo((CFStringRef)a3, @"public.heif-standard")) {
    return 0.18;
  }
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01AE0])) {
    return 1.8;
  }
  int v5 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01A40]);
  double result = 0.7;
  if (!v5) {
    return 0.0;
  }
  return result;
}

- (double)_normalizedInputFactorForUTI:(id)a3 bytesPerPixel:(double)a4
{
  objc_msgSend__nominalBytesPerPixelForUTI_(self, a2, (uint64_t)a3, v4, v5, v6, v7);
  double v10 = a4 / v9;
  if (v9 == 0.0) {
    double v10 = 1.0;
  }
  double result = 2.0;
  if (v10 <= 2.0)
  {
    double result = v10;
    if (v10 < 0.15) {
      return 0.15;
    }
  }
  return result;
}

- (double)_estimatedBytesPerPixelForJPEGQuality:(double)a3
{
  objc_msgSend__nominalBytesPerPixelForUTI_(self, a2, *MEMORY[0x263F01A80], v3, v4, v5, v6);
  return a3 / 0.9 * v8;
}

- (unint64_t)estimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5
{
  if (self->_originalSize.width == *MEMORY[0x263F001B0]
    && self->_originalSize.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    return 0;
  }
  objc_msgSend__newSizeForMaximumDimension_originalSize_(self, a2, a4, a4, v5, v6, v7);
  double v14 = v12 * v13;
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F01A80]))
  {
    objc_msgSend__estimatedBytesPerPixelForJPEGQuality_(self, v15, v16, v17, v18, v19, v20, a5);
  }
  else if (UTTypeConformsTo((CFStringRef)a3, @"public.heif-standard"))
  {
    objc_msgSend__estimatedBytesPerPixelForJPEGQuality_(self, v23, v24, v25, v26, v27, v28, a5);
    double v21 = v29 * 0.6;
  }
  else
  {
    objc_msgSend__nominalBytesPerPixelForUTI_(self, v23, (uint64_t)a3, v25, v26, v27, v28);
  }
  return (unint64_t)(v14 * (v21 * self->_normalizedInputFactor) * 0.85);
}

@end