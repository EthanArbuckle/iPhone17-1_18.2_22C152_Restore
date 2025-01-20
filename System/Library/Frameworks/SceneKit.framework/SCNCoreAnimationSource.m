@interface SCNCoreAnimationSource
- (BOOL)isOpaque;
- (CALayer)layer;
- (id)textureSource;
- (void)dealloc;
- (void)setLayer:(id)a3;
@end

@implementation SCNCoreAnimationSource

- (id)textureSource
{
  v3 = objc_alloc_init(SCNTextureCoreAnimationSource);
  [(SCNTextureCoreAnimationSource *)v3 setLayer:[(SCNCoreAnimationSource *)self layer]];
  return v3;
}

- (BOOL)isOpaque
{
  v2 = [(SCNCoreAnimationSource *)self layer];

  return [(CALayer *)v2 isOpaque];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNCoreAnimationSource;
  [(SCNCoreAnimationSource *)&v3 dealloc];
}

- (void)setLayer:(id)a3
{
  layer = self->_layer;
  if (layer != a3)
  {

    self->_layer = (CALayer *)a3;
  }
}

- (CALayer)layer
{
  return self->_layer;
}

@end