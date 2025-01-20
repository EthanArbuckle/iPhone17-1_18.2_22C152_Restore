@interface JFXPixelBufferPool
- (CGSize)size;
- (JFXPixelBufferPool)initWithSize:(CGSize)a3;
- (JFXPixelBufferPool)initWithSize:(CGSize)a3 type:(unsigned int)a4;
- (__CVBuffer)createPixelBuffer;
- (unsigned)type;
- (void)dealloc;
@end

@implementation JFXPixelBufferPool

- (JFXPixelBufferPool)initWithSize:(CGSize)a3 type:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  v19[4] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)JFXPixelBufferPool;
  v7 = [(JFXPixelBufferPool *)&v17 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  v7->_size.double width = (double)(unint64_t)width;
  v7->_size.double height = (double)(unint64_t)height;
  v7->_type = v4;
  v18[0] = *MEMORY[0x263F04180];
  v9 = [NSNumber numberWithUnsignedInt:v4];
  uint64_t v10 = *MEMORY[0x263F04158];
  v19[0] = v9;
  v19[1] = MEMORY[0x263EFFA88];
  uint64_t v11 = *MEMORY[0x263F04240];
  v18[1] = v10;
  v18[2] = v11;
  v12 = [NSNumber numberWithDouble:v8->_size.width];
  v19[2] = v12;
  v18[3] = *MEMORY[0x263F04118];
  v13 = [NSNumber numberWithDouble:v8->_size.height];
  v19[3] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

  if (!CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, (CFDictionaryRef)v14, &v8->_pixelBufferPool))
  {

LABEL_5:
    v15 = v8;
    goto LABEL_6;
  }
  CVPixelBufferPoolRelease(v8->_pixelBufferPool);

  v15 = 0;
LABEL_6:

  return v15;
}

- (JFXPixelBufferPool)initWithSize:(CGSize)a3
{
  return -[JFXPixelBufferPool initWithSize:type:](self, "initWithSize:type:", 875704438, a3.width, a3.height);
}

- (void)dealloc
{
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
  {
    CVPixelBufferPoolFlush(pixelBufferPool, 1uLL);
    CVPixelBufferPoolRelease(self->_pixelBufferPool);
    self->_pixelBufferPool = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)JFXPixelBufferPool;
  [(JFXPixelBufferPool *)&v4 dealloc];
}

- (__CVBuffer)createPixelBuffer
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v2 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], self->_pixelBufferPool, &pixelBufferOut);
  result = pixelBufferOut;
  if (v2)
  {
    CVPixelBufferRelease(pixelBufferOut);
    return 0;
  }
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)type
{
  return self->_type;
}

@end