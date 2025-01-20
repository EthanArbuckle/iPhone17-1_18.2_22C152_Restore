@interface SCNSpriteKitSource
- (BOOL)isOpaque;
- (SKScene)scene;
- (id)textureSource;
- (void)dealloc;
- (void)setScene:(id)a3;
@end

@implementation SCNSpriteKitSource

- (id)textureSource
{
  v3 = objc_alloc_init(SCNTextureSpriteKitSource);
  [(SCNTextureSpriteKitSource *)v3 setScene:[(SCNSpriteKitSource *)self scene]];
  return v3;
}

- (BOOL)isOpaque
{
  char v5 = 0;
  [(UIColor *)[(SKScene *)[(SCNSpriteKitSource *)self scene] backgroundColor] scn_C3DColorIgnoringColorSpace:0 success:&v5];
  return v2 == 1.0 || v5 == 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNSpriteKitSource;
  [(SCNSpriteKitSource *)&v3 dealloc];
}

- (void)setScene:(id)a3
{
  scene = self->_scene;
  if (scene != a3)
  {

    self->_scene = (SKScene *)a3;
  }
}

- (SKScene)scene
{
  return self->_scene;
}

@end