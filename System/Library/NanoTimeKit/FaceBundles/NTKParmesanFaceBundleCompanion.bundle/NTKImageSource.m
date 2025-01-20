@interface NTKImageSource
+ (id)imageSourceWithData:(id)a3;
- (CGImage)CreateCGImageWithSubsampleFactor:(int64_t)a3;
- (CGImageSource)CGImageSource;
- (id)initImageSourceWithData:(id)a3;
- (void)dealloc;
@end

@implementation NTKImageSource

+ (id)imageSourceWithData:(id)a3
{
  id v3 = a3;
  v4 = [NTKImageSource alloc];
  inited = objc_msgSend_initImageSourceWithData_(v4, v5, (uint64_t)v3, v6);

  if (objc_msgSend_CGImageSource(inited, v8, v9, v10)) {
    id v11 = inited;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  imageSourceRef = self->_imageSourceRef;
  if (imageSourceRef) {
    CFRelease(imageSourceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKImageSource;
  [(NTKImageSource *)&v4 dealloc];
}

- (id)initImageSourceWithData:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFDataRef v4 = (const __CFData *)a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKImageSource;
  v5 = [(NTKImageSource *)&v9 init];
  if (v5)
  {
    CGImageSourceRef v6 = CGImageSourceCreateWithData(v4, 0);
    v5->_imageSourceRef = v6;
    if (!v6)
    {
      v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v11 = "-[NTKImageSource initImageSourceWithData:]";
        _os_log_impl(&dword_246B51000, v7, OS_LOG_TYPE_DEFAULT, "%s: Cannot create image source", buf, 0xCu);
      }
    }
  }

  return v5;
}

- (CGImage)CreateCGImageWithSubsampleFactor:(int64_t)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  if (!self->_imageSourceRef) {
    return 0;
  }
  v10[0] = *MEMORY[0x263F0F628];
  v5 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);
  v10[1] = *MEMORY[0x263F0F600];
  v11[0] = v5;
  v11[1] = MEMORY[0x263EFFA80];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v11, (uint64_t)v10, 2);
  CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_imageSourceRef, 0, v7);
  return ImageAtIndex;
}

- (CGImageSource)CGImageSource
{
  return self->_imageSourceRef;
}

@end