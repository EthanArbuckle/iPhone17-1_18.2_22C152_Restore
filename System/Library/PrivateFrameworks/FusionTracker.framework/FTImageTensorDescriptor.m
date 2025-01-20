@interface FTImageTensorDescriptor
+ (id)bgraImageWithName:(id)a3 size:(CGSize)a4;
+ (id)bgraSquareImageWithName:(id)a3 size:(double)a4;
+ (id)descriptorWithName:(id)a3 size:(CGSize)a4 pixelFormat:(unsigned int)a5;
- (CGSize)size;
- (NSString)name;
- (unsigned)pixelFormat;
- (void)setName:(id)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation FTImageTensorDescriptor

+ (id)descriptorWithName:(id)a3 size:(CGSize)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  v9 = objc_alloc_init(FTImageTensorDescriptor);
  [(FTImageTensorDescriptor *)v9 setName:v8];
  -[FTImageTensorDescriptor setSize:](v9, "setSize:", width, height);
  [(FTImageTensorDescriptor *)v9 setPixelFormat:v5];

  return v9;
}

+ (id)bgraImageWithName:(id)a3 size:(CGSize)a4
{
  v4 = objc_msgSend(a1, "descriptorWithName:size:pixelFormat:", a3, 1111970369, a4.width, a4.height);

  return v4;
}

+ (id)bgraSquareImageWithName:(id)a3 size:(double)a4
{
  v4 = objc_msgSend(a1, "bgraImageWithName:size:", a3, a4, a4);

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end