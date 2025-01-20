@interface CGBitmapFormat
+ (BOOL)supportsSecureCoding;
- (CGBitmapFormat)initWithBitmapContext:(CGContext *)a3;
- (CGBitmapFormat)initWithCoder:(id)a3;
- (CGColorSpace)colorSpace;
- (CGImage)createImageWithData:(id)a3;
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

@implementation CGBitmapFormat

- (void)setColorSpace:(CGColorSpace *)a3
{
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBitmapInfo:(unsigned int)a3
{
  self->_bitmapInfo = a3;
}

- (unsigned)bitmapInfo
{
  return self->_bitmapInfo;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_bytesPerRow = a3;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBitsPerPixel:(unint64_t)a3
{
  self->_bitsPerPixel = a3;
}

- (unint64_t)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerComponent:(unint64_t)a3
{
  self->_bitsPerComponent = a3;
}

- (unint64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t width_low = LODWORD(self->_width);
  id v5 = a3;
  [v5 encodeInt32:width_low forKey:@"w"];
  [v5 encodeInt32:LODWORD(self->_height) forKey:@"h"];
  [v5 encodeInt32:LODWORD(self->_bitsPerPixel) forKey:@"bpp"];
  [v5 encodeInt32:LODWORD(self->_bitsPerComponent) forKey:@"bpc"];
  [v5 encodeInt32:LODWORD(self->_bytesPerRow) forKey:@"bpr"];
  [v5 encodeInt32:self->_bitmapInfo forKey:@"bmi"];
  id v6 = (id)CGColorSpaceCopyPropertyList(self->_colorSpace);
  [v5 encodeObject:v6 forKey:@"cs"];
}

- (CGBitmapFormat)initWithCoder:(id)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CGBitmapFormat;
  id v5 = [(CGBitmapFormat *)&v11 init];
  if (v5)
  {
    v5->_width = (int)[v4 decodeInt32ForKey:@"w"];
    v5->_height = (int)[v4 decodeInt32ForKey:@"h"];
    v5->_bitsPerPixel = (int)[v4 decodeInt32ForKey:@"bpp"];
    v5->_bitsPerComponent = (int)[v4 decodeInt32ForKey:@"bpc"];
    v5->_bytesPerRow = (int)[v4 decodeInt32ForKey:@"bpr"];
    v5->_bitmapInfo = [v4 decodeInt32ForKey:@"bmi"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v12[2] = objc_opt_class();
    v12[3] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
    v8 = [v6 setWithArray:v7];

    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"cs"];
    v5->_colorSpace = CGColorSpaceCreateWithPropertyList(v9);
  }
  return v5;
}

- (CGImage)createImageWithData:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  id v5 = CGDataProviderCreateWithCFData(v4);
  if (v5)
  {
    v12 = v5;
    v13 = CGImageCreate([(CGBitmapFormat *)self width], [(CGBitmapFormat *)self height], [(CGBitmapFormat *)self bitsPerComponent], [(CGBitmapFormat *)self bitsPerPixel], [(CGBitmapFormat *)self bytesPerRow], [(CGBitmapFormat *)self colorSpace], [(CGBitmapFormat *)self bitmapInfo], v5, 0, 1, kCGRenderingIntentPerceptual);
    CFRelease(v12);
  }
  else
  {
    CGLog(2, (uint64_t)"Failed to create data provoder with data: (%p)", v6, v7, v8, v9, v10, v11, (char)v4);
    v13 = 0;
  }

  return v13;
}

- (CGBitmapFormat)initWithBitmapContext:(CGContext *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CGBitmapFormat;
  CFDataRef v4 = [(CGBitmapFormat *)&v6 init];
  if (v4)
  {
    v4->_width = CGBitmapContextGetWidth(a3);
    v4->_height = CGBitmapContextGetHeight(a3);
    v4->_bitsPerPixel = CGBitmapContextGetBitsPerPixel(a3);
    v4->_bitsPerComponent = CGBitmapContextGetBitsPerComponent(a3);
    v4->_bytesPerRow = CGBitmapContextGetBytesPerRow(a3);
    v4->_bitmapInfo = CGBitmapContextGetBitmapInfo(a3);
    v4->_colorSpace = CGBitmapContextGetColorSpace(a3);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end