@interface CATintedImage
+ (BOOL)supportsSecureCoding;
+ (id)tintedImageWithCABackingStore:(CABackingStore *)a3;
+ (id)tintedImageWithCGImage:(CGImage *)a3 tint:(CGColor *)a4;
+ (id)tintedImageWithCGImage:(CGImage *)a3 tint:(CGColor *)a4 copyFlags:(unsigned int)a5;
+ (void)CAMLParserStartElement:(id)a3;
- (CATintedImage)initWithCoder:(id)a3;
- (CGColor)tint;
- (CGImage)image;
- (id)CAMLTypeForKey:(id)a3;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)CA_copyRenderValue;
- (void)CA_prepareRenderValue;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(CGImage *)a3;
- (void)setTint:(CGColor *)a3;
@end

@implementation CATintedImage

- (void)CA_copyRenderValue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  image = self->_image;
  if (!image) {
    return 0;
  }
  uint64_t v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v4 && (uint64_t v5 = *(void *)(v4 + 40)) != 0)
  {
    v6 = *(CGImage **)(v5 + 112);
  }
  else
  {
    v6 = (CGImage *)CAGetColorSpace(0x1Du);
    image = self->_image;
  }
  v8 = (char *)CA::Render::copy_image(image, v6, (CGColorSpace *)self->_copy_flags, 0.0, 1.0);
  tint = self->_tint;
  if (tint)
  {
    long long v11 = 0uLL;
    CA::Render::convert_cgcolor_to_float(tint, v6, (CGColorSpace *)&v11, 0, v7);
    *(_OWORD *)(v8 + 60) = v11;
  }
  *((_DWORD *)v8 + 3) |= 0x100000u;
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGImageRelease(self->_image);
  CGColorRelease(self->_tint);
  v3.receiver = self;
  v3.super_class = (Class)CATintedImage;
  [(CATintedImage *)&v3 dealloc];
}

+ (id)tintedImageWithCGImage:(CGImage *)a3 tint:(CGColor *)a4 copyFlags:(unsigned int)a5
{
  uint64_t v8 = objc_opt_new();
  *(void *)(v8 + 8) = CGImageRetain(a3);
  *(void *)(v8 + 16) = CGColorRetain(a4);
  *(_DWORD *)(v8 + 24) = a5;

  return (id)v8;
}

- (void)CA_prepareRenderValue
{
  image = self->_image;
  if (image)
  {
    uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (v5 && (uint64_t v6 = *(void *)(v5 + 40)) != 0) {
      v7 = *(CGImage **)(v6 + 112);
    }
    else {
      v7 = (CGImage *)CAGetColorSpace(0x1Du);
    }
    copy_flags = (CGColorSpace *)self->_copy_flags;
    CA::Render::prepare_image(image, v7, copy_flags, v2);
  }
}

- (void)setTint:(CGColor *)a3
{
}

- (CGColor)tint
{
  return (CGColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImage:(CGImage *)a3
{
}

- (CGImage)image
{
  return (CGImage *)objc_getProperty(self, a2, 8, 1);
}

- (id)CAMLTypeForKey:(id)a3
{
  if ([a3 isEqualToString:@"image"]) {
    return @"CGImage";
  }
  if ([a3 isEqualToString:@"tint"]) {
    return @"CGColor";
  }
  return 0;
}

- (void)encodeWithCAMLWriter:(id)a3
{
  if (self->_image)
  {
    [a3 beginPropertyElement:@"image"];
    [a3 encodeObject:self->_image];
    [a3 endElement];
  }
  if (self->_tint)
  {
    [a3 beginPropertyElement:@"tint"];
    [a3 encodeObject:self->_tint];
    [a3 endElement];
  }
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  if ([a5 isEqualToString:@"image"])
  {
    [(CATintedImage *)self setImage:a4];
  }
  else if ([a5 isEqualToString:@"tint"])
  {
    [(CATintedImage *)self setTint:a4];
  }
}

- (CATintedImage)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CATintedImage;
  uint64_t v4 = [(CATintedImage *)&v8 init];
  if (v4)
  {
    if ((-[CATintedImage setImage:](v4, "setImage:", objc_msgSend(a3, "CA_decodeObjectForKey:", @"image")),
          -[CATintedImage setTint:](v4, "setTint:", objc_msgSend(a3, "CA_decodeObjectForKey:", @"tint")),
          [(CATintedImage *)v4 image])
      && (CFTypeID v5 = CFGetTypeID([(CATintedImage *)v4 image]), v5 != CGImageGetTypeID())
      || [(CATintedImage *)v4 tint]
      && (CFTypeID v6 = CFGetTypeID([(CATintedImage *)v4 tint]), v6 != CGColorGetTypeID()))
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  image = self->_image;
  if (image)
  {
    objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", image, @"image", 0);
    if (self->_tint)
    {
      objc_msgSend(a3, "CA_encodeObject:forKey:conditional:");
    }
  }
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4 = (id)objc_opt_new();
  [a3 setElementValue:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tintedImageWithCABackingStore:(CABackingStore *)a3
{
  id v4 = objc_opt_new();
  v4[1] = CABackingStoreCopyCGImage((uint64_t)a3);
  v4[2] = CABackingStoreCopyTintColor((uint64_t)a3);

  return v4;
}

+ (id)tintedImageWithCGImage:(CGImage *)a3 tint:(CGColor *)a4
{
  return (id)[a1 tintedImageWithCGImage:a3 tint:a4 copyFlags:0];
}

@end