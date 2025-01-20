@interface MDLTextureSampler
- (MDLTexture)texture;
- (MDLTextureFilter)hardwareFilter;
- (MDLTextureSampler)init;
- (MDLTransform)transform;
- (int64_t)textureComponents;
- (unint64_t)mappingChannel;
- (void)setHardwareFilter:(MDLTextureFilter *)hardwareFilter;
- (void)setMappingChannel:(unint64_t)a3;
- (void)setTexture:(MDLTexture *)texture;
- (void)setTextureComponents:(int64_t)a3;
- (void)setTransform:(MDLTransform *)transform;
@end

@implementation MDLTextureSampler

- (MDLTextureSampler)init
{
  v7.receiver = self;
  v7.super_class = (Class)MDLTextureSampler;
  v2 = [(MDLTextureSampler *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->mappingChannel = xmmword_20B1E6D60;
    v4 = objc_alloc_init(MDLTransform);
    transform = v3->transform;
    v3->transform = v4;
  }
  return v3;
}

- (MDLTexture)texture
{
  return self->texture;
}

- (void)setTexture:(MDLTexture *)texture
{
}

- (MDLTextureFilter)hardwareFilter
{
  return self->hardwareFilter;
}

- (void)setHardwareFilter:(MDLTextureFilter *)hardwareFilter
{
}

- (MDLTransform)transform
{
  return self->transform;
}

- (void)setTransform:(MDLTransform *)transform
{
}

- (unint64_t)mappingChannel
{
  return self->mappingChannel;
}

- (void)setMappingChannel:(unint64_t)a3
{
  self->mappingChannel = a3;
}

- (int64_t)textureComponents
{
  return self->textureComponents;
}

- (void)setTextureComponents:(int64_t)a3
{
  self->textureComponents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->transform, 0);
  objc_storeStrong((id *)&self->hardwareFilter, 0);

  objc_storeStrong((id *)&self->texture, 0);
}

@end