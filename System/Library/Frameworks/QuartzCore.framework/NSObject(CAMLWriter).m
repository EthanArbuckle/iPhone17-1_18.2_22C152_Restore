@interface NSObject(CAMLWriter)
- (BOOL)CAMLTypeSupportedForKey:()CAMLWriter;
- (__CFString)CAMLType;
- (uint64_t)CAMLTypeForKey:()CAMLWriter;
- (void)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSObject(CAMLWriter)

- (BOOL)CAMLTypeSupportedForKey:()CAMLWriter
{
  return objc_msgSend(a1, "CAMLTypeForKey:") != 0;
}

- (uint64_t)CAMLTypeForKey:()CAMLWriter
{
  return 0;
}

- (void)encodeWithCAMLWriter:()CAMLWriter
{
  v4 = a1;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CFTypeID v5 = CFGetTypeID(a1);
  if (v5 == CGColorGetTypeID())
  {
    long long v22 = 0u;
    long long v23 = 0u;
    memset(&v21, 0, sizeof(v21));
    if (CGColorGetPattern(v4))
    {
      uint64_t Image = CGPatternGetImage();
      if (Image)
      {
        uint64_t v7 = [a3 URLStringForResource:Image];
        if (v7) {
          [a3 setElementAttribute:v7 forKey:@"src"];
        }
      }
      CGPatternGetMatrix();
      CGAffineTransform v20 = v21;
      if (!CGAffineTransformIsIdentity(&v20))
      {
        CFStringRef v8 = CACreateStringWithDoubleArray((uint64_t)&v21, 6uLL, 1.0e-12);
        if (v8)
        {
          CFStringRef v9 = v8;
          CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"matrix(%@)", v8);
          [a3 setElementAttribute:v10 forKey:@"matrix"];
          CFRelease(v10);
LABEL_33:
          CFRelease(v9);
        }
      }
    }
    else
    {
      v14 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
      CA_CGColorGetRGBComponents(v4, v14, (CGFloat *)&v22);
      if (*((double *)&v23 + 1) != 1.0)
      {
        CFStringRef v15 = CACreateStringWithDoubleArray((uint64_t)&v23 + 8, 1uLL, 0.001);
        if (v15)
        {
          CFStringRef v16 = v15;
          [a3 setElementAttribute:v15 forKey:@"opacity"];
          CFRelease(v16);
        }
      }
      CFStringRef v17 = CACreateStringWithDoubleArray((uint64_t)&v22, 3uLL, 0.001);
      if (v17)
      {
        CFStringRef v9 = v17;
        [a3 setElementContent:v17];
        goto LABEL_33;
      }
    }
  }
  else if (v5 == CGImageGetTypeID())
  {
    if (v4)
    {
      unsigned int v11 = CA_CGImageIsA8(v4);
      if (v11) {
        v4 = CA_copyA8CGImageAsL8(v4);
      }
      uint64_t v12 = [a3 URLStringForResource:v4];
      if (v12)
      {
        [a3 setElementAttribute:v12 forKey:@"src"];
        if (v11) {
          [a3 setElementAttribute:@"1" forKey:@"A8asL8"];
        }
        CGImageGetColorSpace(v4);
        if (CGColorSpaceContainsFlexGTCInfo()) {
          [a3 setElementAttribute:@"1" forKey:@"loadAsHDR"];
        }
      }
      if (v11)
      {
        CGImageRelease(v4);
      }
    }
  }
  else if (v5 == CGImageSourceGetTypeID() || v5 == CGPDFDocumentGetTypeID())
  {
    uint64_t v13 = [a3 URLStringForResource:v4];
    if (v13)
    {
      [a3 setElementAttribute:v13 forKey:@"src"];
    }
  }
  else if (v5 == CGPathGetTypeID())
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    CGPathApply(v4, v19, (CGPathApplierFunction)path_callback);
    [a3 setElementContent:v19];
  }
  else
  {
    if (CABackingStoreGetTypeID::once[0] != -1) {
      dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
    }
    if (v5 == CABackingStoreGetTypeID::type)
    {
      v18 = +[CATintedImage tintedImageWithCABackingStore:v4];
      if ([(CATintedImage *)v18 image])
      {
        [(CATintedImage *)v18 encodeWithCAMLWriter:a3];
      }
    }
  }
}

- (__CFString)CAMLType
{
  CFTypeID v1 = CFGetTypeID(a1);
  if (v1 == CGColorGetTypeID()) {
    return @"CGColor";
  }
  if (v1 == CGImageGetTypeID()) {
    return @"CGImage";
  }
  if (v1 == CGImageSourceGetTypeID()) {
    return @"CGImageSource";
  }
  if (v1 == CGPDFDocumentGetTypeID()) {
    return @"CGPDFDocument";
  }
  if (v1 == CGPathGetTypeID()) {
    return @"CGPath";
  }
  if (CABackingStoreGetTypeID::once[0] != -1) {
    dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
  }
  if (v1 == CABackingStoreGetTypeID::type) {
    return @"CATintedImage";
  }
  v3 = (objc_class *)objc_opt_class();

  return (__CFString *)NSStringFromClass(v3);
}

@end