@interface AXMPipelineContextInput
+ (AXMPipelineContextInput)inputWithCIImage:(id)a3;
+ (AXMPipelineContextInput)inputWithCIImage:(id)a3 photoLibraryURL:(id)a4;
+ (AXMPipelineContextInput)inputWithPHAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4;
+ (AXMPipelineContextInput)inputWithPixelBuffer:(id)a3;
+ (AXMPipelineContextInput)inputWithURL:(id)a3;
+ (AXMPipelineContextInput)inputWithURL:(id)a3 photoLibraryURL:(id)a4;
+ (AXMPipelineContextInput)new;
+ (BOOL)supportsSecureCoding;
- (AXMPipelineContextInput)init;
- (AXMPipelineContextInput)initWithCoder:(id)a3;
- (AXMPixelBufferWrapper)pixelBuffer;
- (CGColorSpace)imageColorSpace;
- (CGImage)createCGImageWithMetrics:(id)a3;
- (CGSize)size;
- (CIImage)ciImage;
- (NSString)phAssetLocalIdentifier;
- (NSURL)URL;
- (NSURL)photoLibraryURL;
- (__CVBuffer)wrappedPixelBuffer;
- (id)_initWithCIImage:(id)a3;
- (id)_initWithCIImage:(id)a3 photoLibraryURL:(id)a4;
- (id)_initWithPHAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4;
- (id)_initWithPixelBuffer:(id)a3;
- (id)_initWithURL:(id)a3;
- (id)_initWithURL:(id)a3 photoLibraryURL:(id)a4;
- (id)description;
- (int64_t)inputType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AXMPipelineContextInput

- (AXMPipelineContextInput)init
{
  return 0;
}

+ (AXMPipelineContextInput)new
{
  return 0;
}

+ (AXMPipelineContextInput)inputWithCIImage:(id)a3
{
  id v3 = a3;
  id v4 = [[AXMPipelineContextInput alloc] _initWithCIImage:v3];

  return (AXMPipelineContextInput *)v4;
}

+ (AXMPipelineContextInput)inputWithCIImage:(id)a3 photoLibraryURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AXMPipelineContextInput alloc] _initWithCIImage:v6 photoLibraryURL:v5];

  return (AXMPipelineContextInput *)v7;
}

+ (AXMPipelineContextInput)inputWithPixelBuffer:(id)a3
{
  id v3 = a3;
  id v4 = [[AXMPipelineContextInput alloc] _initWithPixelBuffer:v3];

  return (AXMPipelineContextInput *)v4;
}

+ (AXMPipelineContextInput)inputWithURL:(id)a3
{
  id v3 = a3;
  id v4 = [[AXMPipelineContextInput alloc] _initWithURL:v3];

  return (AXMPipelineContextInput *)v4;
}

+ (AXMPipelineContextInput)inputWithURL:(id)a3 photoLibraryURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AXMPipelineContextInput alloc] _initWithURL:v6 photoLibraryURL:v5];

  return (AXMPipelineContextInput *)v7;
}

+ (AXMPipelineContextInput)inputWithPHAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AXMPipelineContextInput alloc] _initWithPHAssetLocalIdentifier:v6 photoLibraryURL:v5];

  return (AXMPipelineContextInput *)v7;
}

- (id)_initWithCIImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMPipelineContextInput;
  id v6 = [(AXMPipelineContextInput *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_inputType = 0;
    objc_storeStrong((id *)&v6->_ciImage, a3);
  }

  return v7;
}

- (id)_initWithCIImage:(id)a3 photoLibraryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMPipelineContextInput;
  objc_super v9 = [(AXMPipelineContextInput *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_inputType = 0;
    objc_storeStrong((id *)&v9->_ciImage, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (id)_initWithPixelBuffer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMPipelineContextInput;
  id v6 = [(AXMPipelineContextInput *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_inputType = 1;
    objc_storeStrong((id *)&v6->_pixelBuffer, a3);
  }

  return v7;
}

- (id)_initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMPipelineContextInput;
  id v6 = [(AXMPipelineContextInput *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_inputType = 2;
    objc_storeStrong((id *)&v6->_URL, a3);
    v7->_cachedImageURLSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }

  return v7;
}

- (id)_initWithURL:(id)a3 photoLibraryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMPipelineContextInput;
  objc_super v9 = [(AXMPipelineContextInput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_inputType = 2;
    objc_storeStrong((id *)&v9->_URL, a3);
    v10->_cachedImageURLSize = (CGSize)*MEMORY[0x1E4F1DB30];
    objc_storeStrong((id *)&v10->_photoLibraryURL, a4);
  }

  return v10;
}

- (id)_initWithPHAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMPipelineContextInput;
  objc_super v9 = [(AXMPipelineContextInput *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_inputType = 3;
    objc_storeStrong((id *)&v9->_phAssetLocalIdentifier, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (void)dealloc
{
  extendedSRGBColorSpace = self->_extendedSRGBColorSpace;
  if (extendedSRGBColorSpace) {
    CFRelease(extendedSRGBColorSpace);
  }
  v4.receiver = self;
  v4.super_class = (Class)AXMPipelineContextInput;
  [(AXMPipelineContextInput *)&v4 dealloc];
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (AXMPixelBufferWrapper)pixelBuffer
{
  return self->_pixelBuffer;
}

- (CIImage)ciImage
{
  return self->_ciImage;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSURL)photoLibraryURL
{
  return self->_photoLibraryURL;
}

- (NSString)phAssetLocalIdentifier
{
  return self->_phAssetLocalIdentifier;
}

- (CGSize)size
{
  switch(self->_inputType)
  {
    case 0:
      [(CIImage *)self->_ciImage extent];
      double width = v5;
      double height = v6;
      break;
    case 1:
      [(AXMPixelBufferWrapper *)self->_pixelBuffer orientedSize];
      double width = v7;
      double height = v8;
      break;
    case 2:
      double width = self->_cachedImageURLSize.width;
      if (width == *MEMORY[0x1E4F1DB30])
      {
        objc_super v9 = CGImageSourceCreateWithURL((CFURLRef)self->_URL, 0);
        CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
        v11 = [(__CFDictionary *)v10 objectForKey:@"PixelWidth"];
        [v11 doubleValue];
        self->_cachedImageURLSize.double width = v12;

        v13 = [(__CFDictionary *)v10 objectForKey:@"PixelHeight"];
        [v13 doubleValue];
        self->_cachedImageURLSize.double height = v14;

        if (v9) {
          CFRelease(v9);
        }

        double width = self->_cachedImageURLSize.width;
      }
      double height = self->_cachedImageURLSize.height;
      break;
    case 3:
      v15 = +[AXMPhotoAssetData phAssetFromLocalIdentifier:self->_phAssetLocalIdentifier photoLibraryURL:self->_photoLibraryURL];
      double width = (double)(unint64_t)[v15 pixelWidth];
      double height = (double)(unint64_t)[v15 pixelHeight];

      break;
    default:
      break;
  }
  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGColorSpace)imageColorSpace
{
  if (self->_inputType
    || ![(CIImage *)self->_ciImage CGImage]
    || (CGSize result = CGImageGetColorSpace([(CIImage *)self->_ciImage CGImage])) == 0)
  {
    CGSize result = self->_extendedSRGBColorSpace;
    if (!result)
    {
      CGSize result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
      self->_extendedSRGBColorSpace = result;
    }
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMPipelineContextInput)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputType"];
  uint64_t v6 = [v5 integerValue];

  switch(v6)
  {
    case 0:
      double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ciImage"];
      if ([v4 containsValueForKey:@"photoLibraryURL"])
      {
        double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoLibraryURL"];
        objc_super v9 = [(AXMPipelineContextInput *)self _initWithCIImage:v7 photoLibraryURL:v8];
        goto LABEL_10;
      }
      v15 = [(AXMPipelineContextInput *)self _initWithCIImage:v7];
      goto LABEL_13;
    case 1:
      double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ciImage"];
      uint64_t v11 = [v7 pixelBuffer];
      if (!v11) {
        goto LABEL_14;
      }
      uint64_t v12 = v11;
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orientation"];
      uint64_t v14 = [v13 integerValue];

      double v8 = +[AXMPixelBufferWrapper wrapperWithPixelBuffer:v12 orientation:v14];
      objc_super v9 = [(AXMPipelineContextInput *)self _initWithPixelBuffer:v8];
      goto LABEL_10;
    case 2:
      double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
      id v10 = [(AXMPipelineContextInput *)self _initWithURL:v7];
      if ([v4 containsValueForKey:@"photoLibraryURL"])
      {
        double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoLibraryURL"];
        objc_super v9 = (AXMPipelineContextInput *)[v10 _initWithURL:v7 photoLibraryURL:v8];
LABEL_10:
        self = v9;
      }
      else
      {
        v15 = (AXMPipelineContextInput *)[v10 _initWithURL:v7];
LABEL_13:
        self = v15;
      }
LABEL_14:

LABEL_15:
      return self;
    case 3:
      double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetLocalIdentifier"];
      if (![v4 containsValueForKey:@"photoLibraryURL"]) {
        goto LABEL_14;
      }
      double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoLibraryURL"];
      objc_super v9 = [(AXMPipelineContextInput *)self _initWithPHAssetLocalIdentifier:v7 photoLibraryURL:v8];
      goto LABEL_10;
    default:
      goto LABEL_15;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXMPipelineContextInput inputType](self, "inputType"));
  [v15 encodeObject:v4 forKey:@"inputType"];

  if ([(AXMPipelineContextInput *)self inputType])
  {
    if ([(AXMPipelineContextInput *)self inputType] == 1)
    {
      double v5 = [(AXMPipelineContextInput *)self pixelBuffer];
      uint64_t v6 = [v5 pixelBuffer];

      if (!v6) {
        goto LABEL_13;
      }
      double v7 = (void *)MEMORY[0x1E4F1E050];
      double v8 = [(AXMPipelineContextInput *)self pixelBuffer];
      objc_super v9 = objc_msgSend(v7, "imageWithCVPixelBuffer:", objc_msgSend(v8, "pixelBuffer"));

      if (v9)
      {
        [v15 encodeObject:v9 forKey:@"ciImage"];
        id v10 = NSNumber;
        uint64_t v11 = [(AXMPipelineContextInput *)self pixelBuffer];
        uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v11, "orientation"));
        [v15 encodeObject:v12 forKey:@"orientation"];
      }
      goto LABEL_12;
    }
    if ([(AXMPipelineContextInput *)self inputType] == 2)
    {
      v13 = [(AXMPipelineContextInput *)self URL];
      uint64_t v14 = @"URL";
    }
    else
    {
      if ([(AXMPipelineContextInput *)self inputType] != 3) {
        goto LABEL_13;
      }
      v13 = [(AXMPipelineContextInput *)self phAssetLocalIdentifier];
      uint64_t v14 = @"assetLocalIdentifier";
    }
  }
  else
  {
    v13 = [(AXMPipelineContextInput *)self ciImage];
    uint64_t v14 = @"ciImage";
  }
  [v15 encodeObject:v13 forKey:v14];

  objc_super v9 = [(AXMPipelineContextInput *)self photoLibraryURL];
  [v15 encodeObject:v9 forKey:@"photoLibraryURL"];
LABEL_12:

LABEL_13:
}

- (id)description
{
  unint64_t inputType = self->_inputType;
  if (inputType > 3) {
    id v3 = &stru_1F0E72D10;
  }
  else {
    id v3 = off_1E6117F10[inputType];
  }
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXMPipelineContextInput;
  double v5 = [(AXMPipelineContextInput *)&v8 description];
  uint64_t v6 = [v4 stringWithFormat:@"%@ (%@)", v5, v3];

  return v6;
}

- (CGImage)createCGImageWithMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__AXMPipelineContextInput_createCGImageWithMetrics___block_invoke;
  v8[3] = &unk_1E6117EF0;
  v8[4] = self;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [v5 measure:@"Convert to CGImage" execute:v8];
  uint64_t v6 = (CGImage *)v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__AXMPipelineContextInput_createCGImageWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = (id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v4 + 8);
  if (v6 == 2)
  {
    CFURLRef v8 = [(id)v4 URL];
    id v9 = CGDataProviderCreateWithURL(v8);

    if (v9)
    {
      id v10 = CGImageSourceCreateWithDataProvider(v9, 0);
      if (v10)
      {
        uint64_t v11 = v10;
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGImageSourceCreateImageAtIndex(v10, 0, 0);
        CFRelease(v11);
      }
      CGDataProviderRelease(v9);
    }
    else
    {
      uint64_t v14 = AXMediaLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __52__AXMPipelineContextInput_createCGImageWithMetrics___block_invoke_cold_1(v5, v14);
      }
    }
  }
  else if (!v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(v4 + 16) CGImage];
    double v7 = *(CGImage **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGImageRetain(v7);
    }
    else
    {
      uint64_t v12 = AXMCoreImageContext(*(void **)(a1 + 40));
      uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 16);
      [v13 extent];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "createCGImage:fromRect:", v13);
    }
  }
}

- (__CVBuffer)wrappedPixelBuffer
{
  int64_t inputType = self->_inputType;
  if (inputType == 1)
  {
    id v3 = [(AXMPipelineContextInput *)self pixelBuffer];
    goto LABEL_5;
  }
  if (!inputType)
  {
    id v3 = [(AXMPipelineContextInput *)self ciImage];
LABEL_5:
    uint64_t v4 = v3;
    id v5 = (__CVBuffer *)[v3 pixelBuffer];

    return v5;
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_phAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_pixelBuffer, 0);
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);

  objc_storeStrong((id *)&self->_ciImage, 0);
}

void __52__AXMPipelineContextInput_createCGImageWithMetrics___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [*a1 URL];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Could not create CGDataProviderRef for URL: %@", (uint8_t *)&v4, 0xCu);
}

@end