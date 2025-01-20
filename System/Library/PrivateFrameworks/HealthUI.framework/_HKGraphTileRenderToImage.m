@interface _HKGraphTileRenderToImage
- (BOOL)invertedYAxis;
- (CGColorSpace)colorSpace;
- (CGContext)drawingContext;
- (CGImage)drawToImage:(id)a3;
- (CGImage)lastRenderedImage;
- (CGSize)sizeInPoints;
- (_HKGraphTileRenderToImage)initWithSize:(CGSize)a3 scale:(double)a4 invertedYAxis:(BOOL)a5;
- (double)scale;
- (unint64_t)bufferSize;
- (unint64_t)bytesPerRow;
- (unint64_t)heightInPixels;
- (unint64_t)widthInPixels;
- (unsigned)bitmapInfo;
- (void)dealloc;
- (void)rawBufferBytes;
@end

@implementation _HKGraphTileRenderToImage

- (_HKGraphTileRenderToImage)initWithSize:(CGSize)a3 scale:(double)a4 invertedYAxis:(BOOL)a5
{
  double height = a3.height;
  double width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)_HKGraphTileRenderToImage;
  v9 = [(_HKGraphTileRenderToImage *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_scale = a4;
    v9->_sizeInPoints.double width = width;
    v9->_sizeInPoints.double height = height;
    v9->_invertedYAxis = a5;
    unint64_t v11 = vcvtpd_u64_f64(width * a4);
    v9->_widthInPixels = v11;
    v9->_heightInPixels = vcvtpd_u64_f64(height * (double)(unint64_t)ceil(a4));
    v9->_bytesPerRow = 4 * v11;
    CGColorSpaceRef v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
    v10->_bitmapInfo = 2;
    size_t v13 = 4 * v10->_widthInPixels * v10->_heightInPixels;
    v10->_colorSpace = v12;
    v10->_bufferSize = v13;
    v14 = malloc_type_malloc(v13, 0xAB70C2uLL);
    v10->_rawBufferBytes = v14;
    v10->_drawingContext = CGBitmapContextCreate(v14, v10->_widthInPixels, v10->_heightInPixels, 8uLL, v10->_bytesPerRow, v10->_colorSpace, v10->_bitmapInfo);
    v10->_lastRenderedImage = 0;
  }
  return v10;
}

- (void)dealloc
{
  lastRenderedImage = self->_lastRenderedImage;
  if (lastRenderedImage)
  {
    CGImageRelease(lastRenderedImage);
    self->_lastRenderedImage = 0;
  }
  CGContextRelease(self->_drawingContext);
  self->_drawingContext = 0;
  free(self->_rawBufferBytes);
  self->_rawBufferBytes = 0;
  CGColorSpaceRelease(self->_colorSpace);
  v4.receiver = self;
  v4.super_class = (Class)_HKGraphTileRenderToImage;
  [(_HKGraphTileRenderToImage *)&v4 dealloc];
}

- (CGImage)drawToImage:(id)a3
{
  objc_super v4 = (void (**)(id, CGContext *))a3;
  UIGraphicsPushContext([(_HKGraphTileRenderToImage *)self drawingContext]);
  CGContextSaveGState([(_HKGraphTileRenderToImage *)self drawingContext]);
  if (self->_invertedYAxis)
  {
    CGContextTranslateCTM([(_HKGraphTileRenderToImage *)self drawingContext], 0.0, (double)[(_HKGraphTileRenderToImage *)self heightInPixels]);
    CGContextScaleCTM([(_HKGraphTileRenderToImage *)self drawingContext], 1.0, -1.0);
  }
  v5 = [(_HKGraphTileRenderToImage *)self drawingContext];
  [(_HKGraphTileRenderToImage *)self scale];
  CGFloat v7 = v6;
  [(_HKGraphTileRenderToImage *)self scale];
  CGContextScaleCTM(v5, v7, v8);
  v9 = [(_HKGraphTileRenderToImage *)self drawingContext];
  [(_HKGraphTileRenderToImage *)self sizeInPoints];
  v4[2](v4, v9);

  CGContextRestoreGState([(_HKGraphTileRenderToImage *)self drawingContext]);
  UIGraphicsPopContext();
  v10 = CGDataProviderCreateWithData(0, self->_rawBufferBytes, self->_bufferSize, 0);
  unint64_t v11 = CGImageCreate(self->_widthInPixels, self->_heightInPixels, 8uLL, 0x20uLL, self->_bytesPerRow, self->_colorSpace, self->_bitmapInfo, v10, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v10);
  lastRenderedImage = self->_lastRenderedImage;
  if (lastRenderedImage) {
    CGImageRelease(lastRenderedImage);
  }
  self->_lastRenderedImage = v11;
  return v11;
}

- (CGSize)sizeInPoints
{
  double width = self->_sizeInPoints.width;
  double height = self->_sizeInPoints.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)invertedYAxis
{
  return self->_invertedYAxis;
}

- (unint64_t)widthInPixels
{
  return self->_widthInPixels;
}

- (unint64_t)heightInPixels
{
  return self->_heightInPixels;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)rawBufferBytes
{
  return self->_rawBufferBytes;
}

- (unsigned)bitmapInfo
{
  return self->_bitmapInfo;
}

- (CGContext)drawingContext
{
  return self->_drawingContext;
}

- (CGImage)lastRenderedImage
{
  return self->_lastRenderedImage;
}

@end