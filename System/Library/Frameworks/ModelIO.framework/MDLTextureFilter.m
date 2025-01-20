@interface MDLTextureFilter
- (MDLMaterialMipMapFilterMode)mipFilter;
- (MDLMaterialTextureFilterMode)magFilter;
- (MDLMaterialTextureFilterMode)minFilter;
- (MDLMaterialTextureWrapMode)rWrapMode;
- (MDLMaterialTextureWrapMode)sWrapMode;
- (MDLMaterialTextureWrapMode)tWrapMode;
- (MDLTextureFilter)init;
- (void)setMagFilter:(MDLMaterialTextureFilterMode)magFilter;
- (void)setMinFilter:(MDLMaterialTextureFilterMode)minFilter;
- (void)setMipFilter:(MDLMaterialMipMapFilterMode)mipFilter;
- (void)setRWrapMode:(MDLMaterialTextureWrapMode)rWrapMode;
- (void)setSWrapMode:(MDLMaterialTextureWrapMode)sWrapMode;
- (void)setTWrapMode:(MDLMaterialTextureWrapMode)tWrapMode;
@end

@implementation MDLTextureFilter

- (MDLTextureFilter)init
{
  v8.receiver = self;
  v8.super_class = (Class)MDLTextureFilter;
  v2 = [(MDLTextureFilter *)&v8 init];
  v4 = v2;
  if (v2)
  {
    objc_msgSend_setMagFilter_(v2, v3, 1);
    objc_msgSend_setMinFilter_(v4, v5, 1);
    objc_msgSend_setMipFilter_(v4, v6, 1);
  }
  return v4;
}

- (MDLMaterialTextureWrapMode)sWrapMode
{
  return self->sWrapMode;
}

- (void)setSWrapMode:(MDLMaterialTextureWrapMode)sWrapMode
{
  self->sWrapMode = sWrapMode;
}

- (MDLMaterialTextureWrapMode)tWrapMode
{
  return self->tWrapMode;
}

- (void)setTWrapMode:(MDLMaterialTextureWrapMode)tWrapMode
{
  self->tWrapMode = tWrapMode;
}

- (MDLMaterialTextureWrapMode)rWrapMode
{
  return self->rWrapMode;
}

- (void)setRWrapMode:(MDLMaterialTextureWrapMode)rWrapMode
{
  self->rWrapMode = rWrapMode;
}

- (MDLMaterialTextureFilterMode)minFilter
{
  return self->minFilter;
}

- (void)setMinFilter:(MDLMaterialTextureFilterMode)minFilter
{
  self->minFilter = minFilter;
}

- (MDLMaterialTextureFilterMode)magFilter
{
  return self->magFilter;
}

- (void)setMagFilter:(MDLMaterialTextureFilterMode)magFilter
{
  self->magFilter = magFilter;
}

- (MDLMaterialMipMapFilterMode)mipFilter
{
  return self->mipFilter;
}

- (void)setMipFilter:(MDLMaterialMipMapFilterMode)mipFilter
{
  self->mipFilter = mipFilter;
}

@end