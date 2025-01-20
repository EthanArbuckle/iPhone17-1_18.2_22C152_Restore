@interface NSData(FamilyCircle)
- (CFTypeRef)_faCreateContextWithImage:()FamilyCircle crop:diameter:;
- (CFTypeRef)_faCreateImageRef;
- (__CFData)_faCircularImageDataWithDiameter:()FamilyCircle cropRect:;
- (double)_faTranformedRectForImageSize:()FamilyCircle cropRect:diameter:;
- (id)fa_dictionaryFromPlistData;
- (uint64_t)_faCircularImageDataWithDiameter:()FamilyCircle;
@end

@implementation NSData(FamilyCircle)

- (uint64_t)_faCircularImageDataWithDiameter:()FamilyCircle
{
  return objc_msgSend(a1, "_faCircularImageDataWithDiameter:cropRect:", a3, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (CFTypeRef)_faCreateImageRef
{
  v1 = CGDataProviderCreateWithCFData(a1);
  v2 = v1;
  if (!v1 || (v3 = CGImageSourceCreateWithDataProvider(v1, 0)) == 0)
  {
    CGDataProviderRelease(v2);
    return 0;
  }
  v4 = v3;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v3, 0, 0);
  CGDataProviderRelease(v2);
  CFRelease(v4);
  if (!ImageAtIndex) {
    return 0;
  }
  return CFAutorelease(ImageAtIndex);
}

- (double)_faTranformedRectForImageSize:()FamilyCircle cropRect:diameter:
{
  if (a5 <= 0.0) {
    return 0.0;
  }
  double v7 = -(a3 * (a7 / a5));
  v9.origin.x = a3;
  v9.origin.y = a4;
  v9.size.width = a5;
  v9.size.height = a6;
  CGRectGetMaxY(v9);
  return v7;
}

- (CFTypeRef)_faCreateContextWithImage:()FamilyCircle crop:diameter:
{
  if (cf)
  {
    CFRetain(cf);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (DeviceRGB) {
      v16 = CGBitmapContextCreate(0, (unint64_t)a8, (unint64_t)a8, 8uLL, 0, DeviceRGB, 1u);
    }
    else {
      v16 = 0;
    }
    CGContextSetInterpolationQuality(v16, kCGInterpolationMedium);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = a8;
    v21.size.height = a8;
    v17 = CGPathCreateWithEllipseInRect(v21, 0);
    CGContextAddPath(v16, v17);
    CGContextClip(v16);
    double Width = (double)CGImageGetWidth((CGImageRef)cf);
    objc_msgSend(a1, "_faTranformedRectForImageSize:cropRect:diameter:", Width, (double)CGImageGetHeight((CGImageRef)cf), a4, a5, a6, a7, a8);
    CGContextDrawImage(v16, v22, (CGImageRef)cf);
  }
  else
  {
    v17 = 0;
    v16 = 0;
    DeviceRGB = 0;
  }
  CGPathRelease(v17);
  CGColorSpaceRelease(DeviceRGB);
  CGImageRelease((CGImageRef)cf);
  if (!v16) {
    return 0;
  }
  return CFAutorelease(v16);
}

- (__CFData)_faCircularImageDataWithDiameter:()FamilyCircle cropRect:
{
  v12 = (void *)MEMORY[0x1D2607F00]();
  if (a2 <= 0.0)
  {
    v14 = _FALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NSData(FamilyCircle) _faCircularImageDataWithDiameter:cropRect:](v14, a2);
    }

    v15 = 0;
  }
  else
  {
    if ([a1 _faCreateImageRef]) {
      CFTypeRef v13 = CFRetain((CFTypeRef)[a1 _faCreateImageRef]);
    }
    else {
      CFTypeRef v13 = 0;
    }
    if (objc_msgSend(a1, "_faCreateContextWithImage:crop:diameter:", v13, a3, a4, a5, a6, a2)) {
      v16 = (CGContext *)CFRetain((CFTypeRef)objc_msgSend(a1, "_faCreateContextWithImage:crop:diameter:", v13, a3, a4, a5, a6, a2));
    }
    else {
      v16 = 0;
    }
    CGImageRef Image = CGBitmapContextCreateImage(v16);
    if (Image)
    {
      v18 = Image;
      Mutable = CFDataCreateMutable(0, 0);
      v20 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x1E4F22678], 1uLL, 0);
      if (v20)
      {
        CGRect v21 = v20;
        CGImageDestinationAddImage(v20, v18, 0);
        CGImageDestinationFinalize(v21);
        CFRelease(v21);
      }
      CFRelease(v18);
    }
    else
    {
      Mutable = 0;
    }
    CGContextRelease(v16);
    if (v13) {
      CFRelease(v13);
    }
    if ([(__CFData *)Mutable length]) {
      v15 = Mutable;
    }
    else {
      v15 = 0;
    }
  }
  return v15;
}

- (id)fa_dictionaryFromPlistData
{
  uint64_t v4 = 0;
  v1 = [MEMORY[0x1E4F28F98] propertyListWithData:a1 options:0 format:0 error:&v4];
  id v2 = 0;
  if (!v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v1;
    }
    else {
      id v2 = 0;
    }
  }

  return v2;
}

- (void)_faCircularImageDataWithDiameter:()FamilyCircle cropRect:.cold.1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[NSData(FamilyCircle) _faCircularImageDataWithDiameter:cropRect:]";
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_error_impl(&dword_1D252C000, log, OS_LOG_TYPE_ERROR, "%s invalid diameter %f", (uint8_t *)&v2, 0x16u);
}

@end