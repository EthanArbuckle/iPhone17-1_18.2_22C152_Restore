@interface DYMetalDrawable
- (DYMetalDrawable)initWithTexture:(id)a3;
- (MTLTexture)texture;
- (void)setTexture:(id)a3;
@end

@implementation DYMetalDrawable

- (void).cxx_destruct
{
}

- (void)setTexture:(id)a3
{
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (DYMetalDrawable)initWithTexture:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DYMetalDrawable;
  v5 = [(DYMetalDrawable *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DYMetalDrawable *)v5 setTexture:v4];
  }

  return v6;
}

@end