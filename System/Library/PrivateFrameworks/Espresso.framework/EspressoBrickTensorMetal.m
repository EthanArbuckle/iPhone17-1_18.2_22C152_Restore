@interface EspressoBrickTensorMetal
- (MTLTexture)texture;
- (void)setTexture:(id)a3;
@end

@implementation EspressoBrickTensorMetal

- (void).cxx_destruct
{
}

- (void)setTexture:(id)a3
{
}

- (MTLTexture)texture
{
  return (MTLTexture *)objc_getProperty(self, a2, 16, 1);
}

@end