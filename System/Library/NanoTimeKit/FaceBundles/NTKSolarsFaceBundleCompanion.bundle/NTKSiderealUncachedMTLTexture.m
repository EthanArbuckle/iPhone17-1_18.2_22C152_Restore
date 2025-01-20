@interface NTKSiderealUncachedMTLTexture
- (MTLTexture)texture;
- (NTKSiderealUncachedMTLTexture)initWithTextureGenerationBlock:(id)a3;
- (id)loadTextureWithCommandBuffer:(id)a3 usingBlitEncoder:(id)a4;
@end

@implementation NTKSiderealUncachedMTLTexture

- (NTKSiderealUncachedMTLTexture)initWithTextureGenerationBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKSiderealUncachedMTLTexture;
  v5 = [(NTKSiderealUncachedMTLTexture *)&v10 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id loaderBlock = v5->_loaderBlock;
    v5->_id loaderBlock = v6;

    mtlTexture = v5->_mtlTexture;
    v5->_mtlTexture = 0;
  }
  return v5;
}

- (MTLTexture)texture
{
  return self->_mtlTexture;
}

- (id)loadTextureWithCommandBuffer:(id)a3 usingBlitEncoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!self->_mtlTexture)
  {
    if (!v7)
    {
      v8 = [v6 blitCommandEncoder];
    }
    (*((void (**)(void))self->_loaderBlock + 2))();
    v9 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    mtlTexture = self->_mtlTexture;
    self->_mtlTexture = v9;

    id loaderBlock = self->_loaderBlock;
    self->_id loaderBlock = 0;
  }
  id v12 = v8;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loaderBlock, 0);

  objc_storeStrong((id *)&self->_mtlTexture, 0);
}

@end