@interface JTImage
+ (JTImage)jtImageWithUIImage:(id)a3;
- (BOOL)hasPVImageBufferAndCanCreateCVPixelBufferWithoutCopy;
- (JTImage)initWithPVImage:(id)a3;
- (JTImage)initWithUIImage:(id)a3;
- (PVImageBuffer)pvImageBuffer;
- (UIImage)image;
- (id)bluredImageWithFlippedXAxis:(BOOL)a3;
@end

@implementation JTImage

- (JTImage)initWithPVImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JTImage;
  v6 = [(JTImage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pvImageBuffer, a3);
  }

  return v7;
}

- (JTImage)initWithUIImage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JTImage;
  v6 = [(JTImage *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    uint64_t v8 = [MEMORY[0x263F61268] imageWithUIImage:v5];
    pvImageBuffer = v7->_pvImageBuffer;
    v7->_pvImageBuffer = (PVImageBuffer *)v8;
  }
  return v7;
}

+ (JTImage)jtImageWithUIImage:(id)a3
{
  id v3 = a3;
  v4 = [[JTImage alloc] initWithUIImage:v3];

  return v4;
}

- (UIImage)image
{
  image = self->_image;
  if (!image)
  {
    v4 = [(PVImageBuffer *)self->_pvImageBuffer uiImage];
    id v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  v6 = image;
  return v6;
}

- (id)bluredImageWithFlippedXAxis:(BOOL)a3
{
  BOOL v3 = a3;
  image = self->_image;
  if (image)
  {
    v6 = [(UIImage *)image bluredImageWithFlippedXAxis:a3];
  }
  else
  {
    v7 = [(JTImage *)self pvImageBuffer];
    char v8 = [v7 canCreateCVPixelBuffer];

    if (v8) {
      objc_msgSend(MEMORY[0x263F00650], "imageWithCVPixelBuffer:", -[PVImageBuffer cvPixelBuffer](self->_pvImageBuffer, "cvPixelBuffer"));
    }
    else {
    objc_super v9 = [(JTImage *)self image];
    }
    v6 = [v9 bluredImageWithFlippedXAxis:v3];
  }
  return v6;
}

- (BOOL)hasPVImageBufferAndCanCreateCVPixelBufferWithoutCopy
{
  BOOL v3 = [(JTImage *)self pvImageBuffer];
  if (v3)
  {
    v4 = [(JTImage *)self pvImageBuffer];
    if ([v4 canCreateCVPixelBuffer])
    {
      id v5 = [(JTImage *)self pvImageBuffer];
      int v6 = [v5 cvPixelBufferRequiresCopy] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (PVImageBuffer)pvImageBuffer
{
  return self->_pvImageBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pvImageBuffer, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end