@interface STKImageData
+ (BOOL)supportsASTC;
+ (id)UTITypeForData:(id)a3;
+ (id)UTTypeForData:(id)a3;
- (BOOL)containsMultipleFrames;
- (BOOL)initializedProperties;
- (BOOL)typeSupportsAnimatedImages;
- (CGImageSource)imageSource;
- (CGSize)ptSize;
- (CGSize)pxSize;
- (CGSize)sizeForImageSource:(CGImageSource *)a3 index:(unint64_t)a4;
- (NSData)data;
- (NSURL)url;
- (STKImageData)initWithData:(id)a3;
- (STKImageData)initWithURL:(id)a3;
- (UIImage)image;
- (UTType)utType;
- (id)MIMEType;
- (id)UTIType;
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

@implementation STKImageData

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)STKImageData;
  [(STKImageData *)&v4 dealloc];
}

+ (id)UTITypeForData:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[STKImageData alloc] initWithData:v3];

  v5 = [(STKImageData *)v4 UTIType];

  return v5;
}

+ (id)UTTypeForData:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 UTITypeForData:v4];
  v6 = v5;
  if (v5 && ![v5 isEqualToString:&stru_26F9FD9F0])
  {
    v9 = [MEMORY[0x263F1D920] typeWithIdentifier:v6];
  }
  else
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v4 debugDescription];
      int v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_2451E4000, v7, OS_LOG_TYPE_DEFAULT, "Cannot determine UTType without a UTIType: %@", (uint8_t *)&v11, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (STKImageData)initWithData:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  v7.receiver = self;
  v7.super_class = (Class)STKImageData;
  v5 = [(STKImageData *)&v7 init];
  if (v5)
  {
    if (v4)
    {
      v5->_imageSource = CGImageSourceCreateWithData(v4, 0);
      v5->_count = 0x7FFFFFFFFFFFFFFFLL;
      [(STKImageData *)v5 setData:v4];
    }
    if (!v5->_imageSource)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (STKImageData)initWithURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STKImageData;
  v5 = [(STKImageData *)&v8 init];
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      v5->_imageSource = CGImageSourceCreateWithURL(v4, 0);
      v6->_count = 0x7FFFFFFFFFFFFFFFLL;
      [(STKImageData *)v6 setUrl:v4];
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
  return MEMORY[0x270F3D608](a1, a2);
}

- (NSData)data
{
  data = self->_data;
  if (!data)
  {
    CFURLRef v4 = [(STKImageData *)self url];
    if (v4)
    {
      v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4 options:8 error:0];
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
    CFURLRef v4 = (void *)MEMORY[0x263F827E8];
    v5 = [(STKImageData *)self data];
    objc_msgSend(v4, "itk_mainScreenScaledImageWithData:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_super v7 = self->_image;
    self->_image = v6;

    image = self->_image;
  }

  return image;
}

- (BOOL)typeSupportsAnimatedImages
{
  v2 = [(STKImageData *)self utType];
  id v3 = v2;
  BOOL v4 = v2
    && ((objc_msgSend(v2, "itk_isPNG") & 1) != 0
     || (objc_msgSend(v3, "itk_isGIF") & 1) != 0
     || (objc_msgSend(v3, "itk_isWebP") & 1) != 0
     || objc_msgSend(v3, "itk_isHEICS"));

  return v4;
}

- (BOOL)containsMultipleFrames
{
  return [(STKImageData *)self count] > 1;
}

- (id)thumbnailFitToSize:(CGSize)a3
{
  return -[STKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", 0, a3.width, a3.height);
}

- (id)thumbnailFillToSize:(CGSize)a3
{
  return -[STKImageData _thumbnailFillToSize:atIndex:](self, "_thumbnailFillToSize:atIndex:", 0, a3.width, a3.height);
}

- (id)thumbnailFillToSizeCropping:(CGSize)a3
{
  if (ITKMainScreenScale_once != -1) {
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  }
  if (*(double *)&ITKMainScreenScale_sMainScreenScale == 0.0) {
    double v4 = 1.0;
  }
  else {
    double v4 = *(double *)&ITKMainScreenScale_sMainScreenScale;
  }
  [(STKImageData *)self ptSize];
  ITKFitOrFillSizeInSize();
  if (ITKMainScreenScale_once != -1) {
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  }
  ITKSizeGetMaxDimension();
  double v6 = v4 * v5;
  if ([(STKImageData *)self count] > 1
    || ([(STKImageData *)self utType],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 conformsToType:*MEMORY[0x263F1DB40]],
        v7,
        !v8)
    || ([(STKImageData *)self data],
        (ThumbnailWithImageSourceAtIndexForMaxDimension = (void *)_CreateThumbnailWithJPEGForMaxDimension(v6)) == 0))
  {
    ThumbnailWithImageSourceAtIndexForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, 0, v6);
  }
  CGImageRef v10 = CKCreateSquareCroppedImageRef(ThumbnailWithImageSourceAtIndexForMaxDimension);
  CFRelease(ThumbnailWithImageSourceAtIndexForMaxDimension);
  if (v10)
  {
    int v11 = objc_msgSend(MEMORY[0x263F827E8], "itk_imageWithCGImage:scale:orientation:", v10, 0, v4);
    CFRelease(v10);
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (id)thumbnailsFitToSize:(CGSize)a3 maxCount:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v8 = [(STKImageData *)self count];
  unint64_t v9 = v8;
  double v10 = 1.0;
  if (v8 > a4) {
    double v10 = (double)v8 / (double)a4;
  }
  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  if (v9 >= a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = v9;
  }
  uint64_t v13 = (void *)[v11 initWithCapacity:v12];
  if (v9)
  {
    unint64_t v14 = 0;
    double v15 = 0.0;
    do
    {
      if (v15 <= (double)v14)
      {
        v16 = -[STKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", v14, width, height);
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
    v17 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218752;
      unint64_t v20 = v9;
      __int16 v21 = 2048;
      unint64_t v22 = a4;
      __int16 v23 = 2048;
      double v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = [v13 count];
      _os_log_impl(&dword_2451E4000, v17, OS_LOG_TYPE_DEFAULT, "GIF wanted %ld frames (> max allowed (%ld)). Used increment %f to generate %ld frames.", (uint8_t *)&v19, 0x2Au);
    }
  }

  return v13;
}

- (id)thumbnailAtIndex:(unint64_t)a3 fillToSize:(CGSize)a4 maxCount:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v10 = [(STKImageData *)self count];
  double v11 = 1.0;
  if (v10 > a5) {
    double v11 = (double)v10 / (double)a5;
  }

  return -[STKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", (unint64_t)(v11 * (double)a3), width, height);
}

- (id)thumbnailsFillToSize:(CGSize)a3 maxCount:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v8 = [(STKImageData *)self count];
  unint64_t v9 = v8;
  double v10 = 1.0;
  if (v8 > a4) {
    double v10 = (double)v8 / (double)a4;
  }
  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  if (v9 >= a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = v9;
  }
  uint64_t v13 = (void *)[v11 initWithCapacity:v12];
  if (v9)
  {
    unint64_t v14 = 0;
    double v15 = 0.0;
    do
    {
      if (v15 <= (double)v14)
      {
        v16 = -[STKImageData _thumbnailFillToSize:atIndex:](self, "_thumbnailFillToSize:atIndex:", v14, width, height);
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
    v17 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218752;
      unint64_t v20 = v9;
      __int16 v21 = 2048;
      unint64_t v22 = a4;
      __int16 v23 = 2048;
      double v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = [v13 count];
      _os_log_impl(&dword_2451E4000, v17, OS_LOG_TYPE_DEFAULT, "GIF wanted %ld frames (> max allowed (%ld)). Used increment %f to generate %ld frames.", (uint8_t *)&v19, 0x2Au);
    }
  }

  return v13;
}

- (id)_defaultDurationsWithMaxCount:(unint64_t)a3
{
  unint64_t v3 = a3;
  v12[1] = *MEMORY[0x263EF8340];
  if ([(STKImageData *)self count] < a3) {
    unint64_t v3 = [(STKImageData *)self count];
  }
  unint64_t v5 = v3;
  bzero((char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v3);
  if (v3)
  {
    unint64_t v6 = v3;
    objc_super v7 = (void **)((char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v8 = [NSNumber numberWithDouble:0.0666666667];
      unint64_t v9 = *v7;
      *v7++ = (void *)v8;

      --v6;
    }
    while (v6);
  }
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:(char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0) count:v3];
  if (v3)
  {
    do

    while (v5 * 8);
  }

  return v10;
}

- (id)durationsWithMaxCount:(unint64_t)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if ([(STKImageData *)self supportsAnimatedImages])
  {
    unint64_t v5 = [(STKImageData *)self count];
    unint64_t v6 = v5;
    if (v5 > a3) {
      double v7 = (double)v5 / (double)a3;
    }
    else {
      double v7 = 1.0;
    }
    id v8 = objc_alloc(MEMORY[0x263EFF980]);
    unint64_t v39 = a3;
    if (v6 >= a3) {
      unint64_t v9 = a3;
    }
    else {
      unint64_t v9 = v6;
    }
    double v10 = (void *)[v8 initWithCapacity:v9];
    if (v6)
    {
      size_t v11 = 0;
      unint64_t v12 = (const void *)*MEMORY[0x263F0F370];
      key = (void *)*MEMORY[0x263F0F390];
      v43 = (void *)*MEMORY[0x263F0F368];
      uint64_t v13 = (const void *)*MEMORY[0x263F0F4E0];
      v46 = (void *)*MEMORY[0x263F0F070];
      v42 = (void *)*MEMORY[0x263F0F058];
      unint64_t v14 = (const void *)*MEMORY[0x263F0F430];
      v45 = (void *)*MEMORY[0x263F0F448];
      v41 = (void *)*MEMORY[0x263F0F428];
      double v15 = (const void *)*MEMORY[0x263F0F570];
      v44 = (void *)*MEMORY[0x263F0F588];
      double v16 = 0.0;
      double v17 = 0.0;
      v40 = (void *)*MEMORY[0x263F0F568];
      do
      {
        if (v7 + v17 <= (double)v11)
        {
          v18 = (void *)[objc_alloc(NSNumber) initWithDouble:v16];
          [v10 addObject:v18];

          double v16 = 0.0;
          double v17 = v7 + v17;
        }
        imageSource = self->_imageSource;
        *(float *)&int valuePtr = 0.0;
        CFDictionaryRef v20 = CGImageSourceCopyPropertiesAtIndex(imageSource, v11, 0);
        if (v20)
        {
          CFDictionaryRef v21 = v20;
          CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v20, v12);
          if (Value)
          {
            CFDictionaryRef v23 = Value;
            CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(Value, key);
            if (v24 || (CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(v23, v43)) != 0) {
              CFNumberGetValue(v24, kCFNumberFloatType, &valuePtr);
            }
          }
          CFDictionaryRef v25 = (const __CFDictionary *)CFDictionaryGetValue(v21, v13);
          if (v25)
          {
            CFDictionaryRef v26 = v25;
            CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(v25, v46);
            if (v27 || (CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(v26, v42)) != 0) {
              CFNumberGetValue(v27, kCFNumberFloatType, &valuePtr);
            }
          }
          CFDictionaryRef v28 = (const __CFDictionary *)CFDictionaryGetValue(v21, v14);
          if (v28)
          {
            CFDictionaryRef v29 = v28;
            CFNumberRef v30 = (const __CFNumber *)CFDictionaryGetValue(v28, v45);
            if (v30 || (CFNumberRef v30 = (const __CFNumber *)CFDictionaryGetValue(v29, v41)) != 0) {
              CFNumberGetValue(v30, kCFNumberFloatType, &valuePtr);
            }
          }
          CFDictionaryRef v31 = (const __CFDictionary *)CFDictionaryGetValue(v21, v15);
          if (v31)
          {
            CFDictionaryRef v32 = v31;
            CFNumberRef v33 = (const __CFNumber *)CFDictionaryGetValue(v31, v44);
            if (v33 || (CFNumberRef v33 = (const __CFNumber *)CFDictionaryGetValue(v32, v40)) != 0) {
              CFNumberGetValue(v33, kCFNumberFloatType, &valuePtr);
            }
          }
          CFRelease(v21);
          float v34 = *(float *)&valuePtr;
        }
        else
        {
          float v34 = 0.0;
        }
        if (v34 < 0.011) {
          float v34 = 0.1;
        }
        double v16 = v16 + v34;
        ++v11;
      }
      while (v6 != v11);
    }
    else
    {
      double v16 = 0.0;
    }
    v35 = (void *)[objc_alloc(NSNumber) initWithDouble:v16];
    [v10 addObject:v35];
    if (v6 > v39)
    {
      v36 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = [v10 count];
        *(float *)&int valuePtr = 3.8523e-34;
        unint64_t v49 = v6;
        __int16 v50 = 2048;
        unint64_t v51 = v39;
        __int16 v52 = 2048;
        double v53 = v7;
        __int16 v54 = 2048;
        uint64_t v55 = v37;
        _os_log_impl(&dword_2451E4000, v36, OS_LOG_TYPE_DEFAULT, "GIF wanted %ld durations (> max allowed (%ld)). Used increment %f to generate %ld durations.", (uint8_t *)&valuePtr, 0x2Au);
      }
    }
  }
  else
  {
    double v10 = &unk_26FA2CB10;
  }

  return v10;
}

- (id)MIMEType
{
  v2 = [(STKImageData *)self utType];
  unint64_t v3 = [v2 preferredMIMEType];

  return v3;
}

- (id)UTIType
{
  return (id)CGImageSourceGetType(self->_imageSource);
}

- (UTType)utType
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(STKImageData *)self UTIType];
  double v4 = v3;
  if (v3 && ![v3 isEqualToString:&stru_26F9FD9F0])
  {
    double v7 = [MEMORY[0x263F1D920] typeWithIdentifier:v4];
  }
  else
  {
    unint64_t v5 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      imageSource = self->_imageSource;
      int v9 = 138412290;
      double v10 = imageSource;
      _os_log_impl(&dword_2451E4000, v5, OS_LOG_TYPE_DEFAULT, "Cannot determine UTType without a UTIType: %@", (uint8_t *)&v9, 0xCu);
    }

    double v7 = 0;
  }

  return (UTType *)v7;
}

- (CGSize)ptSize
{
  [(STKImageData *)self pxSize];
  double v3 = v2;
  double v5 = v4;
  if (ITKMainScreenScale_once != -1) {
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  }
  double v6 = 1.0;
  if (*(double *)&ITKMainScreenScale_sMainScreenScale != 0.0) {
    double v6 = *(double *)&ITKMainScreenScale_sMainScreenScale;
  }
  double v7 = v3 / v6;
  double v8 = v5 / v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)pxSize
{
  [(STKImageData *)self _initializeProperties];
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
  v21[1] = *MEMORY[0x263EF8340];
  if (!self->_initializedProperties)
  {
    self->_initializedProperties = 1;
    double v3 = *MEMORY[0x263F001B0];
    double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
    if ([(STKImageData *)self count])
    {
      imageSource = self->_imageSource;
      uint64_t v20 = *MEMORY[0x263F0F620];
      v21[0] = MEMORY[0x263EFFA88];
      CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, v6);

      if (v7)
      {
        CFDictionaryRef v8 = v7;
        uint64_t v9 = *MEMORY[0x263F0F4C8];
        double v10 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4C8]];
        if (v10
          || ([(__CFDictionary *)v8 objectForKeyedSubscript:*MEMORY[0x263F0F518]],
              uint64_t v11 = objc_claimAutoreleasedReturnValue(),
              [v11 objectForKeyedSubscript:v9],
              double v10 = objc_claimAutoreleasedReturnValue(),
              v11,
              v10))
        {
          uint64_t v12 = [v10 integerValue];
          uint64_t v13 = 2;
          uint64_t v14 = 3;
          if (v12 != 6) {
            uint64_t v14 = 0;
          }
          if (v12 != 8) {
            uint64_t v13 = v14;
          }
          if (v12 == 3) {
            int64_t v15 = 1;
          }
          else {
            int64_t v15 = v13;
          }
        }
        else
        {
          int64_t v15 = 0;
        }

        double v16 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4F8]];
        double v17 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4F0]];
        [v16 floatValue];
        double v3 = v18;
        [v17 floatValue];
        double v4 = v19;
      }
      else
      {
        int64_t v15 = 0;
      }
    }
    else
    {
      int64_t v15 = 0;
    }
    self->_orientation = v15;
    self->_pxSize.double width = v3;
    self->_pxSize.double height = v4;
  }
}

- (id)_thumbnailFitToSize:(CGSize)a3 atIndex:(unint64_t)a4
{
  if (ITKMainScreenScale_once != -1) {
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  }
  if (*(double *)&ITKMainScreenScale_sMainScreenScale == 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = *(double *)&ITKMainScreenScale_sMainScreenScale;
  }
  [(STKImageData *)self ptSize];
  ITKScaleSizeWithinSize();
  ITKFloorSize();
  ITKSizeGetMaxDimension();
  double v8 = v6 * v7;
  uint64_t v9 = [(STKImageData *)self UTIType];
  int v10 = [v9 isEqualToString:@"public.heics"];

  uint64_t v11 = [(STKImageData *)self UTIType];
  uint64_t v12 = [(id)*MEMORY[0x263F1DB40] identifier];
  int v13 = [v11 isEqualToString:v12];

  if ([(STKImageData *)self count] <= 1 && v13)
  {
    [(STKImageData *)self data];
    uint64_t ThumbnailWithJPEGForMaxDimension = _CreateThumbnailWithJPEGForMaxDimension(v8);
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    [(STKImageData *)self sizeForImageSource:self->_imageSource index:a4];
    if (v15 <= v16) {
      double v15 = v16;
    }
    if (v15 != 0.0 && v15 >= v8) {
      goto LABEL_19;
    }
    uint64_t ThumbnailWithJPEGForMaxDimension = (uint64_t)_CreateThumbnailFromHEICSWithMaxDimension(self->_imageSource, a4);
  }
  CGImageRef ThumbnailWithImageSourceAtIndexForMaxDimension = (CGImageRef)ThumbnailWithJPEGForMaxDimension;
  if (ThumbnailWithJPEGForMaxDimension)
  {
LABEL_20:
    float v19 = objc_msgSend(MEMORY[0x263F827E8], "itk_imageWithCGImage:scale:orientation:", ThumbnailWithImageSourceAtIndexForMaxDimension, 0, v6);
    CFRelease(ThumbnailWithImageSourceAtIndexForMaxDimension);
    goto LABEL_22;
  }
LABEL_19:
  CGImageRef ThumbnailWithImageSourceAtIndexForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, a4, v8);
  if (ThumbnailWithImageSourceAtIndexForMaxDimension) {
    goto LABEL_20;
  }
  float v19 = 0;
LABEL_22:

  return v19;
}

- (CGSize)sizeForImageSource:(CGImageSource *)a3 index:(unint64_t)a4
{
  CFDictionaryRef v4 = CGImageSourceCopyPropertiesAtIndex(a3, a4, 0);
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    double v6 = [(__CFDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x263F0F4F8]];
    [v6 doubleValue];
    double v8 = v7;

    uint64_t v9 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x263F0F4F0]];
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
  if (ITKMainScreenScale_once != -1) {
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  }
  if (*(double *)&ITKMainScreenScale_sMainScreenScale == 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = *(double *)&ITKMainScreenScale_sMainScreenScale;
  }
  [(STKImageData *)self ptSize];
  ITKFitOrFillSizeInSize();
  ITKSizeGetMaxDimension();
  double v8 = v6 * v7;
  if (!a4)
  {
    uint64_t v9 = [(STKImageData *)self utType];
    if (objc_msgSend(v9, "itk_isJPEG"))
    {
      unint64_t v10 = [(STKImageData *)self count];

      if (v10 <= 1)
      {
        [(STKImageData *)self data];
        uint64_t ThumbnailWithJPEGForMaxDimension = (const void *)_CreateThumbnailWithJPEGForMaxDimension(v8);
        if (ThumbnailWithJPEGForMaxDimension) {
          goto LABEL_13;
        }
      }
    }
    else
    {
    }
  }
  uint64_t ThumbnailWithJPEGForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, a4, v8);
  if (ThumbnailWithJPEGForMaxDimension)
  {
LABEL_13:
    double v12 = objc_msgSend(MEMORY[0x263F827E8], "itk_imageWithCGImage:scale:orientation:", ThumbnailWithJPEGForMaxDimension, 0, v6);
    CFRelease(ThumbnailWithJPEGForMaxDimension);
    goto LABEL_15;
  }
  double v12 = 0;
LABEL_15:

  return v12;
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

- (void)setData:(id)a3
{
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
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end