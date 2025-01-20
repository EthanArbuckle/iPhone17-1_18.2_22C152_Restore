@interface NTKImageSource
+ (NTKImageSource)imageSourceWithData:(id)a3;
- (CGImage)CreateCGImageWithSubsampleFactor:(int64_t)a3;
- (CGImageSource)CGImageSource;
- (id)initImageSourceWithData:(id)a3;
- (void)dealloc;
@end

@implementation NTKImageSource

+ (NTKImageSource)imageSourceWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKImageSource alloc] initImageSourceWithData:v3];

  if ([v4 CGImageSource]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NTKImageSource *)v5;
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
  CFDataRef v4 = (const __CFData *)a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKImageSource;
  id v5 = [(NTKImageSource *)&v9 init];
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
        v11 = "-[NTKImageSource initImageSourceWithData:]";
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s: Cannot create image source", buf, 0xCu);
      }
    }
  }

  return v5;
}

- (CGImage)CreateCGImageWithSubsampleFactor:(int64_t)a3
{
  if (!self->_imageSourceRef) {
    return 0;
  }
  v8[0] = kCGImageSourceSubsampleFactor;
  CFDataRef v4 = +[NSNumber numberWithInteger:a3];
  v8[1] = kCGImageSourceShouldCache;
  v9[0] = v4;
  v9[1] = &__kCFBooleanFalse;
  CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_imageSourceRef, 0, v5);
  return ImageAtIndex;
}

- (CGImageSource)CGImageSource
{
  return self->_imageSourceRef;
}

@end