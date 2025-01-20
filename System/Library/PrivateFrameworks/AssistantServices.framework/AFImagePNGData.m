@interface AFImagePNGData
- (NSData)imageData;
- (double)scale;
- (void)setImageData:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation AFImagePNGData

- (void).cxx_destruct
{
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

@end