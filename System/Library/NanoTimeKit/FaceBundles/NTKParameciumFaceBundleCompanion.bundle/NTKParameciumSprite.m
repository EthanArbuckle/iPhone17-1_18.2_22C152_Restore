@interface NTKParameciumSprite
+ (id)spriteWithBlitBlock:(id)a3;
+ (id)spriteWithImage:(id)a3;
+ (id)spriteWithImage:(id)a3 format:(unint64_t)a4;
- (NTKParameciumSprite)initWithBlitBlock:(id)a3;
- (NTKParameciumSprite)initWithImage:(id)a3;
- (NTKParameciumSprite)initWithImage:(id)a3 format:(unint64_t)a4;
- (id)texture;
- (void)blitIfNecessaryWithCommandBuffer:(id)a3;
@end

@implementation NTKParameciumSprite

+ (id)spriteWithImage:(id)a3
{
  id v3 = a3;
  v4 = [[NTKParameciumSprite alloc] initWithImage:v3];

  return v4;
}

+ (id)spriteWithImage:(id)a3 format:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[NTKParameciumSprite alloc] initWithImage:v5 format:a4];

  return v6;
}

+ (id)spriteWithBlitBlock:(id)a3
{
  id v3 = a3;
  v4 = [[NTKParameciumSprite alloc] initWithBlitBlock:v3];

  return v4;
}

- (NTKParameciumSprite)initWithImage:(id)a3
{
  return [(NTKParameciumSprite *)self initWithImage:a3 format:70];
}

- (NTKParameciumSprite)initWithImage:(id)a3 format:(unint64_t)a4
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKParameciumSprite;
  v6 = [(NTKParameciumSprite *)&v11 init];
  if (v6)
  {
    uint64_t v7 = CLKUIConvertUIImageToMTLTexture();
    id blitTexture = v6->_blitTexture;
    v6->_id blitTexture = (id)v7;

    texture = v6->_texture;
    v6->_texture = 0;
  }
  return v6;
}

- (NTKParameciumSprite)initWithBlitBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKParameciumSprite;
  id v5 = [(NTKParameciumSprite *)&v10 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id blitTexture = v5->_blitTexture;
    v5->_id blitTexture = v6;

    texture = v5->_texture;
    v5->_texture = 0;
  }
  return v5;
}

- (void)blitIfNecessaryWithCommandBuffer:(id)a3
{
  id blitTexture = (void (**)(void))a3;
  id v5 = blitTexture;
  if (!self->_texture)
  {
    id blitTexture = (void (**)(void))self->_blitTexture;
    if (blitTexture)
    {
      v9 = v5;
      blitTexture[2]();
      id v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      texture = self->_texture;
      self->_texture = v6;

      id v8 = self->_blitTexture;
      self->_id blitTexture = 0;

      id v5 = v9;
    }
  }

  _objc_release_x1(blitTexture, v5);
}

- (id)texture
{
  return self->_texture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);

  objc_storeStrong(&self->_blitTexture, 0);
}

@end