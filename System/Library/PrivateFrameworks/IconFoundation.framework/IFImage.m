@interface IFImage
+ (BOOL)supportsSecureCoding;
+ (CGColorSpace)defaultCGColorSpace;
+ (CGImage)createCGImageWithBitmapData:(id)a3;
+ (CGImage)createCGImageWithIFImageData:(id)a3;
+ (CGImage)escapingCGImageWithCGImage:(CGImage *)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)createCALayereWithIFImageData:(id)a3;
+ (id)imageWithContentsOfURL:(id)a3;
- (BOOL)_isDummyCALayerEnabled;
- (BOOL)largest;
- (BOOL)placeholder;
- (BOOL)writeToURL:(id)a3;
- (CALayer)CALayer;
- (CGSize)pixelSize;
- (IFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4;
- (IFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 minimumSize:(CGSize)a5 placeholder:(BOOL)a6;
- (IFImage)initWithCoder:(id)a3;
- (IFImage)initWithContentsOfURL:(id)a3;
- (IFImage)initWithContentsOfURL:(id)a3 scale:(double)a4;
- (IFImage)initWithData:(id)a3 uuid:(id)a4;
- (IFImage)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5;
- (NSData)bitmapData;
- (NSData)data;
- (NSData)validationToken;
- (NSUUID)uuid;
- (double)dimension;
- (id)_init;
- (void)encodeWithCoder:(id)a3;
- (void)setCALayer:(id)a3;
- (void)setData:(id)a3;
- (void)setLargest:(BOOL)a3;
@end

@implementation IFImage

void __25__IFImage_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)&OBJC_METACLASS___IFImage;
  id v2 = objc_msgSendSuper2(&v4, sel_allocWithZone_, v1);
  v3 = (void *)allocWithZone__imageFactory;
  allocWithZone__imageFactory = (uint64_t)v2;
}

+ (CGImage)escapingCGImageWithCGImage:(CGImage *)a3
{
  if (CGImageGetProperty() == *MEMORY[0x1E4F1CFD0])
  {
    objc_super v4 = IFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[IFImage escapingCGImageWithCGImage:]();
    }

    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    CGImageGetImageProvider();
    uint64_t v5 = CGImageProviderCopyImageBlockSet();
    if (v5)
    {
      v6 = [[ISCGImageBlockSet alloc] initWithBlockSet:v5];
      CGImageBlockSetRelease();
      CGImageProviderGetSize();
      CGImageProviderGetComponentType();
      CGImageProviderGetColorSpace();
      v7 = v6;
      if (CGImageProviderAuxInfo_onceToken != -1) {
        dispatch_once(&CGImageProviderAuxInfo_onceToken, &__block_literal_global_230);
      }
      id v8 = (id) CGImageProviderAuxInfo_auxiliaryInfo;
      uint64_t v9 = CGImageProviderCreate();
      if (v9)
      {
        v10 = (const void *)v9;
        v11 = (void *)CGImageCreateWithImageProvider();
        CFRelease(v10);
        if (v11)
        {
          CFAutorelease(v11);
          a3 = (CGImage *)v11;
        }
      }
    }
  }
  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_CALayer, 0);
}

- (IFImage)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[IFCacheImage alloc] initWithData:v10 uuid:v9 validationToken:v8];

  return &v11->super.super;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__IFImage_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    if (allocWithZone__onceToken != -1) {
      dispatch_once(&allocWithZone__onceToken, block);
    }
    v6 = (void *)allocWithZone__imageFactory;
    return v6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___IFImage;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (void)setData:(id)a3
{
}

- (void)setCALayer:(id)a3
{
  objc_storeStrong((id *)&self->_CALayer, a3);

  [(IFImage *)self setData:0];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)IFImage;
  return [(IFImage *)&v3 init];
}

+ (CGImage)createCGImageWithIFImageData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "__IS_imageHeader");
  if (!v4 || *(_DWORD *)v4 != 6) {
    goto LABEL_10;
  }
  LODWORD(v5) = *(_DWORD *)(v4 + 12);
  double v6 = (double)v5;
  double v7 = *(float *)(v4 + 36) * v6;
  double v8 = *(float *)(v4 + 32) * v6;
  if (v8 == *MEMORY[0x1E4F1DB30] && v7 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    goto LABEL_10;
  }
  id v10 = +[IFImage defaultCGColorSpace];
  id v11 = v3;
  v12 = (const void *)([v11 bytes] + 48);
  uint64_t v13 = [v11 length];
  v14 = CGDataProviderCreateWithData(v11, v12, v13 - 48, MEMORY[0x1E4F1C278]);
  if (!v14) {
    goto LABEL_10;
  }
  v15 = v14;
  v16 = CGImageCreate((unint64_t)v8, (unint64_t)v7, 8uLL, 0x20uLL, vcvtpd_u64_f64(v8 * 32.0 * 0.125), v10, 1u, v14, 0, 1, kCGRenderingIntentDefault);
  CFRelease(v15);
  if (v16)
  {
    CGImageSetProperty();
  }
  else
  {
LABEL_10:
    v17 = IFDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[IFImage createCGImageWithIFImageData:]();
    }

    v16 = 0;
  }

  return v16;
}

+ (CGColorSpace)defaultCGColorSpace
{
  if (defaultCGColorSpace_onceToken != -1) {
    dispatch_once(&defaultCGColorSpace_onceToken, &__block_literal_global_7);
  }
  return (CGColorSpace *)defaultCGColorSpace_colorSpace;
}

- (double)dimension
{
  [(IFImage *)self size];
  double v4 = v3;
  [(IFImage *)self size];
  double v6 = v5;
  [(IFImage *)self size];
  if (v4 <= v6) {
    return v8;
  }
  return result;
}

CGColorSpaceRef __30__IFImage_defaultCGColorSpace__block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  defaultCGColorSpace_colorSpace = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)imageWithContentsOfURL:(id)a3
{
  id v3 = a3;
  double v4 = [[IFImage alloc] initWithContentsOfURL:v3];

  if ([(IFImage *)v4 CGImage]) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }

  return v5;
}

+ (id)createCALayereWithIFImageData:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = v3;
  if (!v3)
  {
    double v8 = IFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[IFImage createCALayereWithIFImageData:]();
    }
    goto LABEL_21;
  }
  uint64_t v5 = objc_msgSend(v3, "__IS_imageHeader");
  if (!v5)
  {
    double v8 = IFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[IFImage createCALayereWithIFImageData:]();
    }
    goto LABEL_21;
  }
  unint64_t v6 = *(unsigned int *)(v5 + 8);
  if (!v6)
  {
    double v8 = IFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC6CA000, v8, OS_LOG_TYPE_INFO, "layerTree data size zero", buf, 2u);
    }
    goto LABEL_21;
  }
  uint64_t v7 = *(unsigned int *)(v5 + 4);
  if ([v4 length] < v6)
  {
    double v8 = IFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[IFImage createCALayereWithIFImageData:v8];
    }
    goto LABEL_21;
  }
  if (v7 + v6 + 48 > [v4 length])
  {
    double v8 = IFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      uint64_t v29 = [v4 length];
      __int16 v30 = 2048;
      *(void *)v31 = 48;
      *(_WORD *)&v31[8] = 1024;
      *(_DWORD *)v32 = v7;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v6;
      id v9 = "Incorrect formed data. Data size (%lu) exceeded. Header: %lu, expected bitmap size: %d, expected tree size: %d";
      id v10 = v8;
      uint32_t v11 = 34;
LABEL_30:
      _os_log_error_impl(&dword_1DC6CA000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  id v12 = v4;
  unint64_t v13 = [v12 bytes] + v7 + 48;
  id v14 = v12;
  if (v13 < [v14 bytes]
    || (id v15 = v14, v16 = [v15 bytes], objc_msgSend(v15, "length") + v16 <= v13))
  {
    double v8 = IFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v22 = v14;
      uint64_t v23 = [v22 bytes];
      id v24 = v22;
      uint64_t v25 = [v24 bytes];
      *(_DWORD *)buf = 134219008;
      uint64_t v29 = v13;
      __int16 v30 = 2048;
      *(void *)v31 = v23;
      *(_WORD *)&v31[8] = 2048;
      *(void *)v32 = v25 + [v24 length];
      *(_WORD *)&v32[8] = 1024;
      v33[0] = v7;
      LOWORD(v33[1]) = 1024;
      *(_DWORD *)((char *)&v33[1] + 2) = v6;
      id v9 = "Incorrect formed layer tree data. Ptr: %p, bounds: [%p - %p], expected bitmap size: %d, expected tree size: %d";
      id v10 = v8;
      uint32_t v11 = 44;
      goto LABEL_30;
    }
LABEL_21:
    v17 = 0;
    goto LABEL_22;
  }
  double v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:v6];
  id v27 = 0;
  v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v27];
  id v18 = v27;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    v21 = IFDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [v15 length];
      *(_DWORD *)buf = 134219010;
      uint64_t v29 = 48;
      __int16 v30 = 1024;
      *(_DWORD *)v31 = v7;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v6;
      *(_WORD *)v32 = 2048;
      *(void *)&v32[2] = v26;
      LOWORD(v33[0]) = 2112;
      *(void *)((char *)v33 + 2) = v18;
      _os_log_error_impl(&dword_1DC6CA000, v21, OS_LOG_TYPE_ERROR, "Failed to read layer tree data. Header: %lu, expected bitmap size: %d, expected tree size: %d, data size: %lu. Error: %@", buf, 0x2Cu);
    }
  }
LABEL_22:

  return v17;
}

- (IFImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "_IF_decodeObjectOfClass:forKey:", objc_opt_class(), @"data");

  unint64_t v6 = (IFImage *)[objc_alloc((Class)objc_opt_class()) initWithData:v5 uuid:0];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IFImage(ISImagePriv) *)self data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (IFImage)initWithContentsOfURL:(id)a3 scale:(double)a4
{
  unint64_t v6 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v6)
  {
    uint64_t v7 = v6;
    if (CGImageSourceGetCount(v6))
    {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
      CFRelease(v7);
      if (ImageAtIndex)
      {
        id v9 = [[IFConcreteImage alloc] initWithCGImage:ImageAtIndex scale:a4];

        CFRelease(ImageAtIndex);
        return &v9->super;
      }
    }
    else
    {
      CFRelease(v7);
    }
  }

  return 0;
}

- (IFImage)initWithContentsOfURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  unint64_t v6 = [v5 stringByDeletingPathExtension];

  uint64_t v7 = +[IFResourceMetadata metadataWithFileName:v6];
  double v8 = [v7 scale];
  [v8 doubleValue];
  double v9 = 1.0;
  if (v10 > 1.0)
  {
    uint32_t v11 = [v7 scale];
    [v11 doubleValue];
    double v9 = v12;
  }
  unint64_t v13 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);

  if (v13)
  {
    if (CGImageSourceGetCount(v13))
    {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, 0);
      id v15 = [v7 scale];

      if (!v15)
      {
        CFDictionaryRef v16 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
        v17 = [(__CFDictionary *)v16 _IF_numberForKey:*MEMORY[0x1E4F2F6A8]];
        if (v17
          || ([(__CFDictionary *)v16 _IF_numberForKey:*MEMORY[0x1E4F2F6B0]],
              (v17 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          double v9 = 1.0;
          if ([v17 integerValue] >= 144)
          {
            uint64_t v18 = [v17 integerValue];
            if (v18 <= 287) {
              double v9 = (double)(v18 / 72);
            }
            else {
              double v9 = 1.0;
            }
          }
        }
      }
    }
    else
    {
      CGImageRef ImageAtIndex = 0;
    }
    CFRelease(v13);
  }
  else
  {
    CGImageRef ImageAtIndex = 0;
  }
  id v19 = [[IFConcreteImage alloc] initWithCGImage:ImageAtIndex scale:v9];

  if (ImageAtIndex) {
    CFRelease(ImageAtIndex);
  }

  return &v19->super;
}

- (IFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  id v5 = [[IFConcreteImage alloc] initWithCGImage:a3 scale:a4];

  return &v5->super;
}

- (CGSize)pixelSize
{
  [(IFImage *)self size];
  double v4 = v3;
  double v6 = v5;
  [(IFImage *)self scale];
  double v8 = v6 * v7;
  double v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)placeholder
{
  return [(IFImage *)self validationFlags] & 1;
}

- (BOOL)_isDummyCALayerEnabled
{
  if (_isDummyCALayerEnabled_once != -1) {
    dispatch_once(&_isDummyCALayerEnabled_once, &__block_literal_global_39);
  }
  return _isDummyCALayerEnabled_result;
}

void __33__IFImage__isDummyCALayerEnabled__block_invoke()
{
  if (os_variant_has_internal_content())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v1 = [v0 BOOLForKey:@"ISDummyCALayer"];

    if (v1) {
      _isDummyCALayerEnabled_CGSize result = 1;
    }
  }
}

- (CALayer)CALayer
{
  CALayer = self->_CALayer;
  if (CALayer)
  {
    double v3 = CALayer;
  }
  else if ([(IFImage *)self _isDummyCALayerEnabled])
  {
    double v5 = [[IFColor alloc] initWithSystemColor:9];
    double v6 = [[IFColor alloc] initWithSystemColor:4];
    double v7 = [[IFColor alloc] initWithSystemColor:1];
    double v8 = [[IFColor alloc] initWithSystemColor:14];
    [(IFImage *)self pixelSize];
    double v10 = v9;
    [(IFImage *)self pixelSize];
    double v12 = v11;
    double v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    -[CALayer setFrame:](v3, "setFrame:", 0.0, 0.0, v10, v12);
    [(CALayer *)v3 setBackgroundColor:[(IFColor *)v5 cgColor]];
    id v13 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    objc_msgSend(v13, "setFrame:", v10 * 0.3, 0.0, v10 - v10 * 0.3, v12);
    objc_msgSend(v13, "setBackgroundColor:", -[IFColor cgColor](v6, "cgColor"));
    [(CALayer *)v3 addSublayer:v13];
    id v14 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    objc_msgSend(v14, "setFrame:", v10 * 0.6, 0.0, v10 - v10 * 0.6, v12);
    objc_msgSend(v14, "setBackgroundColor:", -[IFColor cgColor](v7, "cgColor"));
    [(CALayer *)v3 addSublayer:v14];
    id v15 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    objc_msgSend(v15, "setFrame:", v10 * 0.9, 0.0, v10 - v10 * 0.9, v12);
    objc_msgSend(v15, "setBackgroundColor:", -[IFColor cgColor](v8, "cgColor"));
    [(CALayer *)v3 addSublayer:v15];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)largest
{
  return self->_largest;
}

- (void)setLargest:(BOOL)a3
{
  self->_largest = a3;
}

+ (CGImage)createCGImageWithBitmapData:(id)a3
{
  return +[IFImage createCGImageWithIFImageData:a3];
}

- (IFImage)initWithData:(id)a3 uuid:(id)a4
{
  return [(IFImage *)self initWithData:a3 uuid:a4 validationToken:0];
}

- (IFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 minimumSize:(CGSize)a5 placeholder:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  double v9 = [(IFImage *)self initWithCGImage:a3 scale:a4];
  double v10 = v9;
  if (v9)
  {
    -[IFImage setMinimumSize:](v9, "setMinimumSize:", width, height);
    [(IFImage *)v10 setPlaceholder:v6];
    [(IFImage *)v10 setValidationFlags:v6];
  }
  return v10;
}

- (BOOL)writeToURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  double v5 = (CGImage *)[(IFImage *)self CGImage];
  BOOL v6 = CGImageDestinationCreateWithURL(v4, (CFStringRef)*MEMORY[0x1E4F22678], 1uLL, 0);

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    BOOL v9 = 0;
    BOOL result = 0;
    if (!v6) {
      return result;
    }
  }
  else
  {
    CGImageDestinationAddImage(v6, v5, 0);
    BOOL v9 = CGImageDestinationFinalize(v6);
  }
  CFRelease(v6);
  return v9;
}

- (NSUUID)uuid
{
  return (NSUUID *)[MEMORY[0x1E4F29128] UUID];
}

- (NSData)validationToken
{
  return 0;
}

- (NSData)bitmapData
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(IFImage *)self CGImage];
  double v3 = CGImageGetProperty();
  if (!v3)
  {
    [(IFImage *)self size];
    double v5 = v4;
    double v7 = v6;
    [(IFImage *)self scale];
    BOOL v9 = +[IFGraphicsContext bitmapContextWithSize:scale:preset:](IFGraphicsContext, "bitmapContextWithSize:scale:preset:", 0, v5, v7, v8);
    uint64_t v10 = [(IFImage *)self CGImage];
    [(IFImage *)self size];
    double v12 = v11;
    [(IFImage *)self size];
    objc_msgSend(v9, "drawCGImage:inRect:", v10, 0.0, 0.0, v12, v13);
    id v14 = [v9 data];
    [(IFImage *)self size];
    double v16 = v15;
    double v18 = v17;
    [(IFImage *)self minimumSize];
    double v20 = v19;
    double v22 = v21;
    [(IFImage *)self scale];
    uint64_t v42 = 0;
    float v23 = v16;
    float v24 = v18;
    float v40 = v23;
    float v41 = v24;
    int v33 = 6;
    unsigned int v35 = v25;
    uint64_t v34 = [v14 length];
    float v26 = v20;
    float v27 = v22;
    float v38 = v26;
    float v39 = v27;
    [(IFImage *)self iconSize];
    *(float *)&double v28 = v28;
    int v36 = LODWORD(v28);
    [(IFImage *)self iconSize];
    float v30 = v29;
    float v37 = v30;
    v31 = objc_opt_new();
    [v31 appendBytes:&v33 length:48];
    [v31 appendData:v14];
    double v3 = (void *)[v31 copy];
  }

  return (NSData *)v3;
}

+ (void)createCGImageWithIFImageData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC6CA000, v0, v1, "Failed to create cgImage from bitmap data", v2, v3, v4, v5, v6);
}

+ (void)createCALayereWithIFImageData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC6CA000, v0, v1, "No data to extract layer tree from", v2, v3, v4, v5, v6);
}

+ (void)createCALayereWithIFImageData:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC6CA000, v0, v1, "Failed to read header for layer tree data", v2, v3, v4, v5, v6);
}

+ (void)createCALayereWithIFImageData:(NSObject *)a3 .cold.3(void *a1, int a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  uint64_t v6 = [a1 length];
  _os_log_error_impl(&dword_1DC6CA000, a3, OS_LOG_TYPE_ERROR, "Incorrect formed layer tree data. Expected tree size (%d) exceeds data size (%lu)", (uint8_t *)v4, 0x12u);
}

+ (void)escapingCGImageWithCGImage:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DC6CA000, v0, OS_LOG_TYPE_DEBUG, "Copying asset catalog backed CGImage's CGImageBlockSet", v1, 2u);
}

@end