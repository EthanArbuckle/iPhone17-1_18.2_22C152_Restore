@interface CNImageUtilsBitmapFormat
+ (BOOL)supportsSecureCoding;
+ (id)bitmapFormatWithBitmapImage:(CGImage *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFormat:(id)a3;
- (CGColorSpace)colorSpace;
- (CNImageUtilsBitmapFormat)initWithBitmapContext:(CGContext *)a3;
- (CNImageUtilsBitmapFormat)initWithCoder:(id)a3;
- (unint64_t)bitsPerComponent;
- (unint64_t)bitsPerPixel;
- (unint64_t)bytesPerRow;
- (unint64_t)height;
- (unint64_t)width;
- (unsigned)bitmapInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setBitmapInfo:(unsigned int)a3;
- (void)setBitsPerComponent:(unint64_t)a3;
- (void)setBitsPerPixel:(unint64_t)a3;
- (void)setBytesPerRow:(unint64_t)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation CNImageUtilsBitmapFormat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNImageUtilsBitmapFormat)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNImageUtilsBitmapFormat;
  v5 = [(CNImageUtilsBitmapFormat *)&v13 init];
  if (v5)
  {
    v5->_width = (int)[v4 decodeInt32ForKey:@"w"];
    v5->_height = (int)[v4 decodeInt32ForKey:@"h"];
    v5->_bitsPerComponent = (int)[v4 decodeInt32ForKey:@"bpc"];
    v5->_bitsPerPixel = (int)[v4 decodeInt32ForKey:@"bpp"];
    v5->_bytesPerRow = (int)[v4 decodeInt32ForKey:@"bpr"];
    v5->_bitmapInfo = [v4 decodeInt32ForKey:@"i"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"cs"];
    v5->_colorSpace = CGColorSpaceCreateWithPropertyList(v11);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t width_low = LODWORD(self->_width);
  id v5 = a3;
  [v5 encodeInt32:width_low forKey:@"w"];
  [v5 encodeInt32:LODWORD(self->_height) forKey:@"h"];
  [v5 encodeInt32:LODWORD(self->_bitsPerComponent) forKey:@"bpc"];
  [v5 encodeInt32:LODWORD(self->_bitsPerPixel) forKey:@"bpp"];
  [v5 encodeInt32:LODWORD(self->_bytesPerRow) forKey:@"bpr"];
  [v5 encodeInt32:self->_bitmapInfo forKey:@"i"];
  id v6 = (id)CGColorSpaceCopyPropertyList(self->_colorSpace);
  [v5 encodeObject:v6 forKey:@"cs"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CNImageUtilsBitmapFormat *)self isEqualToFormat:v4];

  return v5;
}

- (BOOL)isEqualToFormat:(id)a3
{
  id v4 = a3;
  unint64_t width = self->_width;
  if (width == [v4 width]
    && (unint64_t height = self->_height, height == [v4 height])
    && (unint64_t bitsPerComponent = self->_bitsPerComponent, bitsPerComponent == [v4 bitsPerComponent])
    && (unint64_t bytesPerRow = self->_bytesPerRow, bytesPerRow == [v4 bytesPerRow])
    && (unsigned int bitmapInfo = self->_bitmapInfo, bitmapInfo == [v4 bitmapInfo]))
  {
    colorSpace = self->_colorSpace;
    v11 = (const void *)[v4 colorSpace];
    if (colorSpace) {
      BOOL v12 = CFEqual(colorSpace, v11) != 0;
    }
    else {
      BOOL v12 = v11 == 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)bitmapFormatWithBitmapImage:(CGImage *)a3
{
  id v4 = objc_alloc_init(CNImageUtilsBitmapFormat);
  if (a3)
  {
    [(CNImageUtilsBitmapFormat *)v4 setWidth:CGImageGetWidth(a3)];
    [(CNImageUtilsBitmapFormat *)v4 setHeight:CGImageGetHeight(a3)];
    [(CNImageUtilsBitmapFormat *)v4 setBitsPerComponent:CGImageGetBitsPerComponent(a3)];
    [(CNImageUtilsBitmapFormat *)v4 setBytesPerRow:CGImageGetBytesPerRow(a3)];
    [(CNImageUtilsBitmapFormat *)v4 setBitsPerPixel:CGImageGetBitsPerPixel(a3)];
    [(CNImageUtilsBitmapFormat *)v4 setBitmapInfo:CGImageGetBitmapInfo(a3)];
    [(CNImageUtilsBitmapFormat *)v4 setColorSpace:CGImageGetColorSpace(a3)];
  }

  return v4;
}

- (CNImageUtilsBitmapFormat)initWithBitmapContext:(CGContext *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNImageUtilsBitmapFormat;
  id v4 = [(CNImageUtilsBitmapFormat *)&v6 init];
  if (v4)
  {
    v4->_unint64_t width = CGBitmapContextGetWidth(a3);
    v4->_unint64_t height = CGBitmapContextGetHeight(a3);
    v4->_unint64_t bitsPerComponent = CGBitmapContextGetBitsPerComponent(a3);
    v4->_unint64_t bytesPerRow = CGBitmapContextGetBytesPerRow(a3);
    v4->_bitsPerPixel = CGBitmapContextGetBitsPerPixel(a3);
    v4->_unsigned int bitmapInfo = CGBitmapContextGetBitmapInfo(a3);
    v4->_colorSpace = CGBitmapContextGetColorSpace(a3);
  }
  return v4;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_unint64_t width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_unint64_t height = a3;
}

- (unint64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (void)setBitsPerComponent:(unint64_t)a3
{
  self->_unint64_t bitsPerComponent = a3;
}

- (unint64_t)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(unint64_t)a3
{
  self->_bitsPerPixel = a3;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_unint64_t bytesPerRow = a3;
}

- (unsigned)bitmapInfo
{
  return self->_bitmapInfo;
}

- (void)setBitmapInfo:(unsigned int)a3
{
  self->_unsigned int bitmapInfo = a3;
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)objc_getProperty(self, a2, 56, 1);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
}

@end