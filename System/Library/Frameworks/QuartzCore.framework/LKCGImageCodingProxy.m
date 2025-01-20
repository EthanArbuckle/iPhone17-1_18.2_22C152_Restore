@interface LKCGImageCodingProxy
+ (BOOL)supportsSecureCoding;
- (LKCGImageCodingProxy)initWithCoder:(id)a3;
- (LKCGImageCodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LKCGImageCodingProxy

- (id)decodedObject
{
  return self->_image;
}

- (LKCGImageCodingProxy)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (-[LKCGImageCodingProxy initWithCoder:]::onceToken != -1) {
    dispatch_once(&-[LKCGImageCodingProxy initWithCoder:]::onceToken, &__block_literal_global_763);
  }
  v16.receiver = self;
  v16.super_class = (Class)LKCGImageCodingProxy;
  v5 = [(LKCGImageCodingProxy *)&v16 init];
  if (v5)
  {
    if ([a3 containsValueForKey:@"loadAsHDR"])
    {
      int v6 = [a3 decodeBoolForKey:@"loadAsHDR"];
      v7 = &-[LKCGImageCodingProxy initWithCoder:]::dictHDR;
      if (!v6) {
        v7 = &-[LKCGImageCodingProxy initWithCoder:]::dictSDR;
      }
      CFDictionaryRef v8 = (const __CFDictionary *)*v7;
    }
    else
    {
      CFDictionaryRef v8 = (const __CFDictionary *)-[LKCGImageCodingProxy initWithCoder:]::dictSDR;
    }
    CFDataRef v9 = (const __CFData *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    if (v9
      && (CFDataRef v10 = v9, (v11 = CGImageSourceCreateWithData(v9, v8)) != 0)
      && (v12 = v11, v5->_image = CGImageSourceCreateImageAtIndex(v11, 0, v8), CFRelease(v12), v5->_image))
    {
      if ([a3 containsValueForKey:@"A8asL8"]
        && [a3 decodeBoolForKey:@"A8asL8"])
      {
        CGImageRef v13 = CA_copyL8CGImageAsA8(v5->_image);
        CGImageRelease(v5->_image);
        v5->_image = v13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[a3 delegate];
        if (objc_opt_respondsToSelector()) {
          [v14 unarchiver:a3 didReadData:v10 forImage:v5->_image];
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)LKCGImageCodingProxy;
  [(LKCGImageCodingProxy *)&v3 dealloc];
}

id __38__LKCGImageCodingProxy_initWithCoder___block_invoke()
{
  -[LKCGImageCodingProxy initWithCoder:]::dictSDR = (uint64_t)image_properties_dictionary(0);
  id result = image_properties_dictionary(1);
  -[LKCGImageCodingProxy initWithCoder:]::dictHDR = (uint64_t)result;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  CFStringRef v4 = (const __CFString *)CACodingImageFormat;
  image = self->_image;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = (void *)[a3 delegate];
    if (objc_opt_respondsToSelector())
    {
      v7 = (void *)MEMORY[0x185324A30]();
      CFDictionaryRef v8 = (void *)[v6 archiver:a3 dataForImage:image];
      if (v8)
      {
        id v15 = v8;
        id v9 = v8;
        [a3 encodeObject:v15 forKey:@"data"];
        if (!image)
        {

          return;
        }
        goto LABEL_21;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v6 archiver:a3 formatForImage:image];
      if (v10) {
        CFStringRef v4 = (const __CFString *)v10;
      }
    }
  }
  unsigned int v11 = CA_CGImageIsA8(image);
  if (v11)
  {
    image = CA_copyA8CGImageAsL8(image);
    if (!image)
    {
LABEL_25:
      CGImageRelease(image);
      return;
    }
  }
  else if (!image)
  {
    return;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v12 = CGImageDestinationCreateWithData((CFMutableDataRef)v15, v4, 1uLL, 0);
  if (v12)
  {
    CGImageRef v13 = v12;
    CGImageDestinationAddImage(v12, image, 0);
    CGImageDestinationFinalize(v13);
    CFRelease(v13);
  }
  if (!v15)
  {
    if (!v11) {
      return;
    }
    goto LABEL_25;
  }
  [a3 encodeObject:v15 forKey:@"data"];
  if (v11)
  {
    char v14 = 1;
    [a3 encodeBool:1 forKey:@"A8asL8"];
    goto LABEL_22;
  }
LABEL_21:
  char v14 = 0;
LABEL_22:
  CGImageGetColorSpace(image);
  if (CGColorSpaceContainsFlexGTCInfo()) {
    [a3 encodeBool:1 forKey:@"loadAsHDR"];
  }

  if (v14) {
    goto LABEL_25;
  }
}

- (LKCGImageCodingProxy)initWithObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)LKCGImageCodingProxy;
  CFStringRef v4 = [(LKCGImageCodingProxy *)&v15 init];
  if (!v4) {
    return v4;
  }
  CFTypeID v5 = CFGetTypeID(a3);
  if (CAMachPortGetTypeID::once[0] != -1) {
    dispatch_once(CAMachPortGetTypeID::once, &__block_literal_global_5766);
  }
  if (v5 == CAMachPortGetTypeID::type)
  {
    if (a3)
    {
      mach_port_t v6 = *((_DWORD *)a3 + 4);
      if (v6)
      {
        v7 = IOSurfaceLookupFromMachPort(v6);
        if (v7)
        {
          CFDictionaryRef v8 = v7;
          v4->_image = (CGImage *)create_cgimage_from_iosurface(v7);
          CFRelease(v8);
        }
      }
    }
    return v4;
  }
  if (v5 == CVPixelBufferGetTypeID())
  {
    IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)a3);
    if (!IOSurface) {
      return v4;
    }
    goto LABEL_14;
  }
  if (v5 == IOSurfaceGetTypeID())
  {
    IOSurface = (__IOSurface *)a3;
LABEL_14:
    CGImageRef cgimage_from_iosurface = (CGImageRef)create_cgimage_from_iosurface(IOSurface);
LABEL_15:
    v4->_image = cgimage_from_iosurface;
    return v4;
  }
  if (CAImageQueueGetTypeID::once != -1) {
    dispatch_once(&CAImageQueueGetTypeID::once, &__block_literal_global_14584);
  }
  if (v5 != CAImageQueueGetTypeID::type)
  {
    CGImageRef cgimage_from_iosurface = CGImageRetain((CGImageRef)a3);
    goto LABEL_15;
  }
  v12 = CAImageQueueCopyLastIOSurface((uint64_t)a3);
  if (v12)
  {
    CGImageRef v13 = v12;
    uint64_t v14 = create_cgimage_from_iosurface(v12);
    CFRelease(v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  v4->_image = (CGImage *)v14;
  return v4;
}

@end