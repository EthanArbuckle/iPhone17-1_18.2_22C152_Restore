@interface CKImageData
+ (BOOL)supportsASTC;
+ (id)UTITypeForData:(id)a3;
- (BOOL)initializedProperties;
- (CGImageSource)imageSource;
- (CGSize)ptSize;
- (CGSize)pxSize;
- (CGSize)sizeForImageSource:(CGImageSource *)a3 index:(unint64_t)a4;
- (CKImageData)initWithData:(id)a3;
- (CKImageData)initWithURL:(id)a3;
- (NSData)data;
- (NSString)MIMEType;
- (NSString)UTIType;
- (NSURL)url;
- (UIImage)image;
- (id)_defaultDurationsWithMaxCount:(unint64_t)a3;
- (id)_thumbnailFillToSize:(CGSize)a3 atIndex:(unint64_t)a4;
- (id)_thumbnailFitToSize:(CGSize)a3 atIndex:(unint64_t)a4;
- (id)durationsWithMaxCount:(unint64_t)a3;
- (id)thumbnailAtIndex:(unint64_t)a3 fillToSize:(CGSize)a4 maxCount:(unint64_t)a5;
- (id)thumbnailFillToSize:(CGSize)a3;
- (id)thumbnailFillToSizeCropping:(CGSize)a3;
- (id)thumbnailFitToSize:(CGSize)a3;
- (id)thumbnailsFillToSize:(CGSize)a3 maxCount:(unint64_t)a4;
- (id)thumbnailsFitToSize:(CGSize)a3 maxCount:(unint64_t)a4;
- (int64_t)orientation;
- (unint64_t)count;
- (void)_initializeProperties;
- (void)dealloc;
- (void)setCount:(unint64_t)a3;
- (void)setData:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSource:(CGImageSource *)a3;
- (void)setInitializedProperties:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPxSize:(CGSize)a3;
- (void)setUrl:(id)a3;
@end

@implementation CKImageData

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKImageData;
  [(CKImageData *)&v4 dealloc];
}

+ (id)UTITypeForData:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[CKImageData alloc] initWithData:v3];

  v5 = [(CKImageData *)v4 UTIType];

  return v5;
}

- (CKImageData)initWithData:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  v7.receiver = self;
  v7.super_class = (Class)CKImageData;
  v5 = [(CKImageData *)&v7 init];
  if (v5)
  {
    if (v4)
    {
      v5->_imageSource = CGImageSourceCreateWithData(v4, 0);
      v5->_count = 0x7FFFFFFFFFFFFFFFLL;
      [(CKImageData *)v5 setData:v4];
    }
    if (!v5->_imageSource)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (CKImageData)initWithURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CKImageData;
  v5 = [(CKImageData *)&v8 init];
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      v5->_imageSource = CGImageSourceCreateWithURL(v4, 0);
      v6->_count = 0x7FFFFFFFFFFFFFFFLL;
      [(CKImageData *)v6 setUrl:v4];
      if (!v6->_imageSource)
      {

        v6 = 0;
      }
    }
  }

  return v6;
}

+ (BOOL)supportsASTC
{
  return MEMORY[0x1F4124610](a1, a2);
}

- (NSData)data
{
  data = self->_data;
  if (!data)
  {
    CFURLRef v4 = [(CKImageData *)self url];
    if (v4)
    {
      v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:8 error:0];
      v6 = self->_data;
      self->_data = v5;
    }
    data = self->_data;
  }

  return data;
}

- (UIImage)image
{
  image = self->_image;
  if (!image)
  {
    CFURLRef v4 = (void *)MEMORY[0x1E4F42A80];
    v5 = [(CKImageData *)self data];
    v6 = [v4 ckImageWithData:v5];
    objc_super v7 = self->_image;
    self->_image = v6;

    image = self->_image;
  }

  return image;
}

- (id)thumbnailFitToSize:(CGSize)a3
{
  return -[CKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", 0, a3.width, a3.height);
}

- (id)thumbnailFillToSize:(CGSize)a3
{
  return -[CKImageData _thumbnailFillToSize:atIndex:](self, "_thumbnailFillToSize:atIndex:", 0, a3.width, a3.height);
}

- (id)thumbnailFillToSizeCropping:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  double v8 = v7;

  [(CKImageData *)self ptSize];
  double v11 = width / v9;
  double v12 = 0.0;
  if (v9 == 0.0) {
    double v11 = 0.0;
  }
  if (v10 != 0.0) {
    double v12 = height / v10;
  }
  double v13 = fmax(v11, v12);
  double v14 = v9 * v13;
  double v15 = v10 * v13;
  if (CKMainScreenScale_once_37 != -1) {
    dispatch_once(&CKMainScreenScale_once_37, &__block_literal_global_256);
  }
  double v16 = *(double *)&CKMainScreenScale_sMainScreenScale_37;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_37 == 0.0) {
    double v16 = 1.0;
  }
  double v17 = v8 * fmax(ceil(v14 * v16) / v16, ceil(v15 * v16) / v16);
  CFStringRef v18 = [(CKImageData *)self UTIType];
  if (!UTTypeConformsTo(v18, (CFStringRef)*MEMORY[0x1E4F22610])
    || [(CKImageData *)self count] > 1
    || ([(CKImageData *)self data],
        (ThumbnailWithImageSourceAtIndexForMaxDimension = (CGImage *)_CreateThumbnailWithJPEGForMaxDimension(v17)) == 0))
  {
    ThumbnailWithImageSourceAtIndexForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, 0, v17);
  }
  CGImageRef v20 = CKCreateSquareCroppedImageRef(ThumbnailWithImageSourceAtIndexForMaxDimension);
  CFRelease(ThumbnailWithImageSourceAtIndexForMaxDimension);
  if (v20)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v20 scale:0 orientation:v8];
    CFRelease(v20);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)thumbnailsFitToSize:(CGSize)a3 maxCount:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [(CKImageData *)self count];
  unint64_t v9 = v8;
  double v10 = 1.0;
  if (v8 > a4) {
    double v10 = (double)v8 / (double)a4;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v9 >= a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = v9;
  }
  double v13 = (void *)[v11 initWithCapacity:v12];
  if (v9)
  {
    unint64_t v14 = 0;
    double v15 = 0.0;
    do
    {
      if (v15 <= (double)v14)
      {
        double v16 = -[CKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", v14, width, height);
        if (v16) {
          [v13 addObject:v16];
        }
        double v15 = v10 + v15;
      }
      ++v14;
    }
    while (v9 != v14);
  }
  if (v9 > a4)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(4);
      double v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        unint64_t v20 = v9;
        __int16 v21 = 2048;
        unint64_t v22 = a4;
        __int16 v23 = 2048;
        double v24 = v10;
        __int16 v25 = 2048;
        uint64_t v26 = [v13 count];
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_DEBUG, "GIF wanted %ld frames (> max allowed (%ld)). Used increment %f to generate %ld frames.", buf, 0x2Au);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      [v13 count];
      _CKLog();
    }
  }

  return v13;
}

- (id)thumbnailAtIndex:(unint64_t)a3 fillToSize:(CGSize)a4 maxCount:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  if (a3 >= a5)
  {
    unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"CKImageData.m" lineNumber:222 description:@"index must be less than maxCount"];
  }
  unint64_t v10 = [(CKImageData *)self count];
  double v11 = 1.0;
  if (v10 > a5) {
    double v11 = (double)v10 / (double)a5;
  }

  return -[CKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", (unint64_t)(v11 * (double)a3), width, height);
}

- (id)thumbnailsFillToSize:(CGSize)a3 maxCount:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [(CKImageData *)self count];
  unint64_t v9 = v8;
  double v10 = 1.0;
  if (v8 > a4) {
    double v10 = (double)v8 / (double)a4;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v9 >= a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = v9;
  }
  double v13 = (void *)[v11 initWithCapacity:v12];
  if (v9)
  {
    unint64_t v14 = 0;
    double v15 = 0.0;
    do
    {
      if (v15 <= (double)v14)
      {
        double v16 = -[CKImageData _thumbnailFillToSize:atIndex:](self, "_thumbnailFillToSize:atIndex:", v14, width, height);
        if (v16) {
          [v13 addObject:v16];
        }
        double v15 = v10 + v15;
      }
      ++v14;
    }
    while (v9 != v14);
  }
  if (v9 > a4)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(4);
      double v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        unint64_t v20 = v9;
        __int16 v21 = 2048;
        unint64_t v22 = a4;
        __int16 v23 = 2048;
        double v24 = v10;
        __int16 v25 = 2048;
        uint64_t v26 = [v13 count];
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_DEBUG, "GIF wanted %ld frames (> max allowed (%ld)). Used increment %f to generate %ld frames.", buf, 0x2Au);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      [v13 count];
      _CKLog();
    }
  }

  return v13;
}

- (id)_defaultDurationsWithMaxCount:(unint64_t)a3
{
  unint64_t v3 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(CKImageData *)self count] < a3) {
    unint64_t v3 = [(CKImageData *)self count];
  }
  unint64_t v5 = v3;
  bzero((char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v3);
  if (v3)
  {
    unint64_t v6 = v3;
    double v7 = (void **)((char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v8 = [NSNumber numberWithDouble:0.0666666667];
      unint64_t v9 = *v7;
      *v7++ = (void *)v8;

      --v6;
    }
    while (v6);
  }
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:(char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0) count:v3];
  if (v3)
  {
    do

    while (v5 * 8);
  }

  return v10;
}

- (id)durationsWithMaxCount:(unint64_t)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  CFURLRef v4 = [(CKImageData *)self UTIType];
  int IsSupportedAnimatedImage = IMUTTypeIsSupportedAnimatedImage();

  if (IsSupportedAnimatedImage)
  {
    unint64_t v6 = [(CKImageData *)self count];
    unint64_t v7 = v6;
    double v8 = 1.0;
    if (v6 > a3) {
      double v8 = (double)v6 / (double)a3;
    }
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    if (v7 >= a3) {
      unint64_t v10 = a3;
    }
    else {
      unint64_t v10 = v7;
    }
    id v11 = (void *)[v9 initWithCapacity:v10];
    if (v7)
    {
      size_t v12 = 0;
      double v13 = (const void *)*MEMORY[0x1E4F2F990];
      key = (void *)*MEMORY[0x1E4F2F9A8];
      v43 = (void *)*MEMORY[0x1E4F2F988];
      unint64_t v14 = (const void *)*MEMORY[0x1E4F2FCD8];
      v47 = (void *)*MEMORY[0x1E4F2F4D0];
      v42 = (void *)*MEMORY[0x1E4F2F4C0];
      double v15 = (const void *)*MEMORY[0x1E4F2FB18];
      v46 = (void *)*MEMORY[0x1E4F2FB28];
      v41 = (void *)*MEMORY[0x1E4F2FB10];
      double v16 = (const void *)*MEMORY[0x1E4F2FDC8];
      v45 = (void *)*MEMORY[0x1E4F2FDD0];
      double v17 = 0.0;
      double v18 = 0.0;
      v40 = (void *)*MEMORY[0x1E4F2FDC0];
      do
      {
        if (v8 + v17 <= (double)v12)
        {
          v19 = (void *)[objc_alloc(NSNumber) initWithDouble:v18];
          [v11 addObject:v19];

          double v18 = 0.0;
          double v17 = v8 + v17;
        }
        imageSource = self->_imageSource;
        *(float *)&int valuePtr = 0.0;
        CFDictionaryRef v21 = CGImageSourceCopyPropertiesAtIndex(imageSource, v12, 0);
        CFDictionaryRef v22 = v21;
        if (v21)
        {
          CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v21, v13);
          CFDictionaryRef v24 = Value;
          if (Value)
          {
            CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(Value, key);
            if (v25 || (CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(v24, v43)) != 0) {
              CFNumberGetValue(v25, kCFNumberFloatType, &valuePtr);
            }
          }
          CFDictionaryRef v26 = (const __CFDictionary *)CFDictionaryGetValue(v22, v14);
          CFDictionaryRef v27 = v26;
          if (v26)
          {
            CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(v26, v47);
            if (v28 || (CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(v27, v42)) != 0) {
              CFNumberGetValue(v28, kCFNumberFloatType, &valuePtr);
            }
          }
          CFDictionaryRef v29 = (const __CFDictionary *)CFDictionaryGetValue(v22, v15);
          CFDictionaryRef v30 = v29;
          if (v29)
          {
            CFNumberRef v31 = (const __CFNumber *)CFDictionaryGetValue(v29, v46);
            if (v31 || (CFNumberRef v31 = (const __CFNumber *)CFDictionaryGetValue(v30, v41)) != 0) {
              CFNumberGetValue(v31, kCFNumberFloatType, &valuePtr);
            }
          }
          CFDictionaryRef v32 = (const __CFDictionary *)CFDictionaryGetValue(v22, v16);
          CFDictionaryRef v33 = v32;
          if (v32)
          {
            CFNumberRef v34 = (const __CFNumber *)CFDictionaryGetValue(v32, v45);
            if (v34 || (CFNumberRef v34 = (const __CFNumber *)CFDictionaryGetValue(v33, v40)) != 0) {
              CFNumberGetValue(v34, kCFNumberFloatType, &valuePtr);
            }
          }
          CFRelease(v22);
          float v35 = *(float *)&valuePtr;
        }
        else
        {
          float v35 = 0.0;
        }
        if (v35 < 0.011) {
          float v35 = 0.1;
        }
        double v18 = v18 + v35;
        ++v12;
      }
      while (v7 != v12);
    }
    else
    {
      double v18 = 0.0;
    }
    v36 = (void *)[objc_alloc(NSNumber) initWithDouble:v18];
    [v11 addObject:v36];
    if (v7 > a3)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(4);
        v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v38 = [v11 count];
          *(float *)&int valuePtr = 3.8523e-34;
          unint64_t v50 = v7;
          __int16 v51 = 2048;
          unint64_t v52 = a3;
          __int16 v53 = 2048;
          double v54 = v8;
          __int16 v55 = 2048;
          uint64_t v56 = v38;
          _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_DEBUG, "GIF wanted %ld durations (> max allowed (%ld)). Used increment %f to generate %ld durations.", (uint8_t *)&valuePtr, 0x2Au);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        [v11 count];
        _CKLog();
      }
    }
  }
  else
  {
    id v11 = &unk_1EDF15338;
  }

  return v11;
}

- (NSString)MIMEType
{
  v2 = [(CKImageData *)self UTIType];
  if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22610]))
  {
    unint64_t v3 = @"image/jpeg";
  }
  else if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22678]))
  {
    unint64_t v3 = @"image/png";
  }
  else if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F225D8]))
  {
    unint64_t v3 = @"image/gif";
  }
  else
  {
    NSLog(&cfstr_NoMimeTypeForI.isa, v2);
    unint64_t v3 = 0;
  }

  return &v3->isa;
}

- (NSString)UTIType
{
  return (NSString *)CGImageSourceGetType(self->_imageSource);
}

- (CGSize)ptSize
{
  [(CKImageData *)self pxSize];
  double v3 = v2;
  double v5 = v4;
  unint64_t v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  double v8 = v7;

  double v9 = v3 / v8;
  double v10 = v5 / v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)pxSize
{
  [(CKImageData *)self _initializeProperties];
  double width = self->_pxSize.width;
  double height = self->_pxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)count
{
  unint64_t result = self->_count;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t result = CGImageSourceGetCount(self->_imageSource);
    self->_count = result;
  }
  return result;
}

- (void)_initializeProperties
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (!self->_initializedProperties)
  {
    self->_initializedProperties = 1;
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if ([(CKImageData *)self count])
    {
      imageSource = self->_imageSource;
      uint64_t v25 = *MEMORY[0x1E4F2FF48];
      v26[0] = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, v6);

      if (v7)
      {
        CFDictionaryRef v8 = v7;
        uint64_t v9 = *MEMORY[0x1E4F2FCA0];
        double v10 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FCA0]];
        if (v10
          || ([(__CFDictionary *)v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]],
              id v11 = objc_claimAutoreleasedReturnValue(),
              [v11 objectForKeyedSubscript:v9],
              double v10 = objc_claimAutoreleasedReturnValue(),
              v11,
              v10))
        {
          uint64_t v12 = [v10 integerValue];
          uint64_t v13 = 2;
          uint64_t v14 = 3;
          BOOL v15 = v12 != 6;
          if (v12 != 6) {
            uint64_t v14 = 0;
          }
          if (v12 == 8) {
            BOOL v15 = 0;
          }
          else {
            uint64_t v13 = v14;
          }
          int v16 = v12 == 3 || v15;
          if (v12 == 3) {
            int64_t v17 = 1;
          }
          else {
            int64_t v17 = v13;
          }
        }
        else
        {
          int64_t v17 = 0;
          int v16 = 1;
        }

        double v18 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FD00]];
        v19 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FCE8]];
        unint64_t v20 = v19;
        if (v16)
        {
          v19 = v18;
          CFDictionaryRef v21 = v20;
        }
        else
        {
          CFDictionaryRef v21 = v18;
        }
        [v19 floatValue];
        float v23 = v22;
        [v21 floatValue];
        double v4 = v24;
        double v3 = v23;
      }
      else
      {
        int64_t v17 = 0;
      }
    }
    else
    {
      int64_t v17 = 0;
    }
    self->_orientation = v17;
    self->_pxSize.double width = v3;
    self->_pxSize.double height = v4;
  }
}

- (id)_thumbnailFitToSize:(CGSize)a3 atIndex:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  CFDictionaryRef v8 = [MEMORY[0x1E4F42D90] mainScreen];
  [v8 scale];
  double v10 = v9;

  [(CKImageData *)self ptSize];
  double v13 = width / v11;
  double v14 = 0.0;
  if (v11 == 0.0) {
    double v13 = 0.0;
  }
  if (v12 != 0.0) {
    double v14 = height / v12;
  }
  double v15 = fmin(v13, v14);
  double v16 = v10 * fmax(floor(v11 * v15), floor(v12 * v15));
  int64_t v17 = [(CKImageData *)self UTIType];
  int v18 = [v17 isEqualToString:@"public.heics"];

  v19 = [(CKImageData *)self UTIType];
  unint64_t v20 = [(id)*MEMORY[0x1E4F44410] identifier];
  int v21 = [v19 isEqualToString:v20];

  if (a4 || !v21 || [(CKImageData *)self count] > 1)
  {
    if (!v18) {
      goto LABEL_15;
    }
    [(CKImageData *)self sizeForImageSource:self->_imageSource index:a4];
    if (v23 <= v24) {
      double v23 = v24;
    }
    if (v23 >= v16) {
      goto LABEL_15;
    }
    uint64_t ThumbnailFromHEICSWithMaxDimension = (uint64_t)_CreateThumbnailFromHEICSWithMaxDimension(self->_imageSource, a4);
  }
  else
  {
    [(CKImageData *)self data];
    uint64_t ThumbnailFromHEICSWithMaxDimension = _CreateThumbnailWithJPEGForMaxDimension(v16);
  }
  CGImageRef ThumbnailWithImageSourceAtIndexForMaxDimension = (CGImageRef)ThumbnailFromHEICSWithMaxDimension;
  if (ThumbnailFromHEICSWithMaxDimension)
  {
LABEL_16:
    CFDictionaryRef v26 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:ThumbnailWithImageSourceAtIndexForMaxDimension scale:0 orientation:v10];
    CFRelease(ThumbnailWithImageSourceAtIndexForMaxDimension);
    goto LABEL_18;
  }
LABEL_15:
  CGImageRef ThumbnailWithImageSourceAtIndexForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, a4, v16);
  if (ThumbnailWithImageSourceAtIndexForMaxDimension) {
    goto LABEL_16;
  }
  CFDictionaryRef v26 = 0;
LABEL_18:

  return v26;
}

- (CGSize)sizeForImageSource:(CGImageSource *)a3 index:(unint64_t)a4
{
  CFDictionaryRef v4 = CGImageSourceCopyPropertiesAtIndex(a3, a4, 0);
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    CFDictionaryRef v6 = [(__CFDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    [v6 doubleValue];
    double v8 = v7;

    double v9 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
    double v8 = 0.0;
  }

  double v12 = v8;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (id)_thumbnailFillToSize:(CGSize)a3 atIndex:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = [MEMORY[0x1E4F42D90] mainScreen];
  [v8 scale];
  double v10 = v9;

  [(CKImageData *)self ptSize];
  double v13 = width / v11;
  double v14 = 0.0;
  if (v11 == 0.0) {
    double v13 = 0.0;
  }
  if (v12 != 0.0) {
    double v14 = height / v12;
  }
  double v15 = fmax(v13, v14);
  double v16 = v10 * fmax(round(v10 * (v11 * v15)) / v10, round(v10 * (v12 * v15)) / v10);
  if (!a4
    && (CFStringRef v19 = [(CKImageData *)self UTIType], UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x1E4F22610]))
    && [(CKImageData *)self count] <= 1
    && ([(CKImageData *)self data],
        (ThumbnailWithJPEGForMaxDimension = (const void *)_CreateThumbnailWithJPEGForMaxDimension(v16)) != 0)
    || (ThumbnailWithJPEGForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, a4, v16)) != 0)
  {
    int v18 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:ThumbnailWithJPEGForMaxDimension scale:0 orientation:v10];
    CFRelease(ThumbnailWithJPEGForMaxDimension);
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

- (void)setData:(id)a3
{
}

- (void)setPxSize:(CGSize)a3
{
  self->_pxSize = a3;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setImage:(id)a3
{
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (CGImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(CGImageSource *)a3
{
  self->_imageSource = a3;
}

- (BOOL)initializedProperties
{
  return self->_initializedProperties;
}

- (void)setInitializedProperties:(BOOL)a3
{
  self->_initializedProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end