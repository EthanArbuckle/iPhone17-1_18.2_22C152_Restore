@interface CIImageRowReader
+ (id)forImage:(id)a3 downscaleToMax:(unsigned int)a4 colorspace:(CGColorSpace *)a5 usingContext:(id)a6;
+ (id)forImage:(id)a3 usingContext:(id)a4;
+ (id)forImage:(id)a3 usingContext:(id)a4 colorspace:(CGColorSpace *)a5;
+ (id)fromImage:(CGImage *)a3;
+ (id)fromImageFile:(id)a3;
+ (id)withDictionary:(id)a3;
- (CIImageRowReader)init;
- (const)rowAtIndex:(unsigned int)a3;
- (signed)alpha;
- (signed)blue;
- (signed)green;
- (signed)red;
- (unint64_t)height;
- (unint64_t)width;
- (unsigned)bytesPerPixel;
- (void)_dumpImage:(id)a3 colorspace:(CGColorSpace *)a4;
- (void)dealloc;
- (void)dumpImage:(id)a3;
- (void)dumpImageAsDeviceRGB:(id)a3;
- (void)dumpImageAsDict:(id)a3;
@end

@implementation CIImageRowReader

+ (id)fromImageFile:(id)a3
{
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", a3)) {
    return 0;
  }
  CFURLRef v4 = (const __CFURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  if (!v4) {
    return 0;
  }
  v5 = CGImageSourceCreateWithURL(v4, 0);
  if (!v5) {
    return 0;
  }
  v6 = v5;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0);
  if (ImageAtIndex)
  {
    v8 = ImageAtIndex;
    id v9 = +[CIImageRowReader fromImage:ImageAtIndex];
    CGImageRelease(v8);
  }
  else
  {
    id v9 = 0;
  }
  CFRelease(v6);
  return v9;
}

+ (id)fromImage:(CGImage *)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t Width = CGImageGetWidth(a3);
  unint64_t Height = CGImageGetHeight(a3);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  CGColorSpaceRef ColorSpace = CGImageGetColorSpace(a3);
  v8 = 0;
  if (!Width || !Height || !BitsPerComponent) {
    return v8;
  }
  id v9 = ColorSpace;
  v10 = malloc_type_calloc(Height, 4 * Width, 0xE0B9042EuLL);
  if (!v10) {
    return 0;
  }
  v11 = v10;
  v12 = CGBitmapContextCreate(v10, Width, Height, BitsPerComponent, 4 * Width, v9, 5u);
  v15.size.width = (double)Width;
  v15.size.height = (double)Height;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  CGContextDrawImage(v12, v15, a3);
  CGContextFlush(v12);
  CGContextRelease(v12);
  v8 = objc_alloc_init(CIImageRowReader);
  v8->bpr = 4 * Width;
  v8->data = v11;
  v8->height = Height;
  v8->width = Width;
  if (v9) {
    v13 = (CGColorSpace *)CFRetain(v9);
  }
  else {
    v13 = 0;
  }
  v8->cs = v13;
  *(void *)&v8->red = 0x3000200010000;
  return v8;
}

- (void)_dumpImage:(id)a3 colorspace:(CGColorSpace *)a4
{
  v7 = objc_opt_new();
  CFDataRef v8 = (const __CFData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:self->data length:self->height * self->bpr];
  unint64_t height = self->height;
  unint64_t width = self->width;
  v11 = CGDataProviderCreateWithCFData(v8);
  if (v11)
  {
    v12 = v11;
    if (self->alpha && self->alpha != 3) {
      abort();
    }
    if (self->alpha) {
      CGBitmapInfo v13 = 5;
    }
    else {
      CGBitmapInfo v13 = 6;
    }
    v14 = CGImageCreate((unint64_t)(double)width, (unint64_t)(double)height, 8uLL, 0x20uLL, self->bpr, a4, v13, v11, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v12);
    if (v14)
    {
      CFURLRef v15 = (const __CFURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a3];
      v16 = CGImageDestinationCreateWithURL(v15, @"public.tiff", 1uLL, 0);
      CGImageDestinationAddImage(v16, v14, 0);
      CGImageDestinationFinalize(v16);
      CGImageRelease(v14);
      CFRelease(v16);
    }
  }

  [v7 drain];
}

- (void)dumpImage:(id)a3
{
  if (self->cs)
  {
    -[CIImageRowReader _dumpImage:colorspace:](self, "_dumpImage:colorspace:");
  }
  else
  {
    v5 = +[CIContext defaultRGBColorSpace];
    [(CIImageRowReader *)self _dumpImage:a3 colorspace:v5];
    if (v5)
    {
      CGColorSpaceRelease(v5);
    }
  }
}

- (void)dumpImageAsDeviceRGB:(id)a3
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  [(CIImageRowReader *)self _dumpImage:a3 colorspace:DeviceRGB];

  CGColorSpaceRelease(DeviceRGB);
}

+ (id)forImage:(id)a3 downscaleToMax:(unsigned int)a4 colorspace:(CGColorSpace *)a5 usingContext:(id)a6
{
  id v9 = a3;
  [a3 extent];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  if (CGRectIsNull(v19)) {
    return 0;
  }
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (CGRectIsInfinite(v20)) {
    return 0;
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  if (CGRectIsEmpty(v21)) {
    return 0;
  }
  double v15 = (double)a4;
  if (width > (double)a4 || height > v15)
  {
    CGFloat v17 = fmin(fmin(v15 / width, v15 / height), 1.0);
    CGAffineTransformMakeScale(&v18, v17, v17);
    id v9 = (id)[v9 imageByApplyingTransform:&v18];
  }
  return +[CIImageRowReader forImage:v9 usingContext:a6 colorspace:a5];
}

- (void)dumpImageAsDict:(id)a3
{
  v6[8] = *MEMORY[0x1E4F143B8];
  v5[0] = @"bytes";
  v6[0] = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->data length:self->bpr * self->height];
  v5[1] = @"width";
  v6[1] = [NSNumber numberWithUnsignedLong:self->width];
  v5[2] = @"height";
  v6[2] = [NSNumber numberWithUnsignedLong:self->height];
  v5[3] = @"bpr";
  v6[3] = [NSNumber numberWithUnsignedLong:self->bpr];
  v5[4] = @"red";
  v6[4] = [NSNumber numberWithShort:self->red];
  v5[5] = @"green";
  v6[5] = [NSNumber numberWithShort:self->green];
  v5[6] = @"blue";
  v6[6] = [NSNumber numberWithShort:self->blue];
  v5[7] = @"alpha";
  v6[7] = [NSNumber numberWithShort:self->alpha];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, v5, 8), "writeToFile:atomically:", a3, 1);
}

+ (id)withDictionary:(id)a3
{
  CFURLRef v4 = objc_alloc_init(CIImageRowReader);
  v5 = (void *)[a3 valueForKey:@"bytes"];
  v6 = malloc_type_malloc([v5 length], 0xB788E73AuLL);
  v4->data = v6;
  memcpy(v6, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  v4->bpr = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"bpr"), "unsignedLongValue");
  v4->double width = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"width"), "unsignedLongValue");
  v4->double height = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"height"), "unsignedLongValue");
  v4->red = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"red"), "shortValue");
  v4->green = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"green"), "shortValue");
  v4->blue = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"blue"), "shortValue");
  v4->alpha = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"alpha"), "shortValue");
  return v4;
}

+ (id)forImage:(id)a3 usingContext:(id)a4
{
  v6 = +[CIContext defaultRGBColorSpace];
  id v7 = +[CIImageRowReader forImage:a3 usingContext:a4 colorspace:v6];
  CGColorSpaceRelease(v6);
  return v7;
}

+ (id)forImage:(id)a3 usingContext:(id)a4 colorspace:(CGColorSpace *)a5
{
  CFDataRef v8 = objc_alloc_init(CIImageRowReader);
  [a3 extent];
  double v10 = v9;
  double v12 = v11;
  *(float *)&double v9 = v13;
  signed int v14 = vcvtms_s32_f32(*(float *)&v9);
  *(float *)&double v9 = v15;
  size_t v16 = (int)vcvtms_s32_f32(*(float *)&v9);
  CGFloat v17 = malloc_type_calloc(4 * v14, v16, 0xAC1BC31CuLL);
  if (v17)
  {
    CGAffineTransform v18 = v17;
    objc_msgSend(a4, "render:toBitmap:rowBytes:bounds:format:colorSpace:", a3, v17, 4 * v14, 264, a5, v10, v12, (double)(unint64_t)v14, (double)v16);
    v8->bpr = 4 * v14;
    v8->data = v18;
    v8->double height = v16;
    v8->double width = v14;
    *(void *)&v8->red = 0x3000200010000;
    if (a5) {
      CGRect v19 = (CGColorSpace *)CFRetain(a5);
    }
    else {
      CGRect v19 = 0;
    }
    v8->cs = v19;
  }
  return v8;
}

- (CIImageRowReader)init
{
  v3.receiver = self;
  v3.super_class = (Class)CIImageRowReader;
  result = [(CIImageRowReader *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->bpr = 0u;
    *(_OWORD *)&result->double height = 0u;
  }
  return result;
}

- (void)dealloc
{
  data = self->data;
  if (data) {
    free(data);
  }
  cs = self->cs;
  if (cs) {
    CGColorSpaceRelease(cs);
  }
  v5.receiver = self;
  v5.super_class = (Class)CIImageRowReader;
  [(CIImageRowReader *)&v5 dealloc];
}

- (unint64_t)width
{
  return self->width;
}

- (unint64_t)height
{
  return self->height;
}

- (signed)red
{
  return self->red;
}

- (signed)green
{
  return self->green;
}

- (signed)blue
{
  return self->blue;
}

- (signed)alpha
{
  return self->alpha;
}

- (const)rowAtIndex:(unsigned int)a3
{
  data = (char *)self->data;
  if (data) {
    return &data[self->bpr * a3];
  }
  else {
    return 0;
  }
}

- (unsigned)bytesPerPixel
{
  return 4;
}

@end