@interface DYCAMetalLayerWrapper
- (DYCAMetalLayerWrapper)init;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)nextDrawable;
- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3;
@end

@implementation DYCAMetalLayerWrapper

- (void).cxx_destruct
{
}

- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3
{
  MTLPixelFormat v5 = [(CAMetalLayer *)self->_layer pixelFormat];
  [(CAMetalLayer *)self->_layer drawableSize];
  unint64_t v7 = (unint64_t)(v6 + 0.5);
  [(CAMetalLayer *)self->_layer drawableSize];
  v9 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:v5 width:v7 height:(unint64_t)(v8 + 0.5) mipmapped:0];
  if ([(CAMetalLayer *)self->_layer framebufferOnly]) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 0;
  }
  [v9 setUsage:v10];
  [v9 setResourceIndex:a3];
  [v9 setForceResourceIndex:1];
  [v9 setIsDrawable:1];
  v11 = [(CAMetalLayer *)self->_layer nextDrawable];
  v12 = [v11 texture];
  id v13 = [v12 iosurface];

  v14 = [(CAMetalLayer *)self->_layer device];
  id v15 = [v14 newTextureWithDescriptor:v9 iosurface:v13 plane:0];

  [v15 setLabel:@"CAMetalLayer Drawable"];
  v16 = [[DYMetalDrawable alloc] initWithTexture:v15];

  return v16;
}

- (id)nextDrawable
{
  return [(CAMetalLayer *)self->_layer nextDrawable];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_layer;
}

- (DYCAMetalLayerWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)DYCAMetalLayerWrapper;
  v2 = [(DYCAMetalLayerWrapper *)&v6 init];
  if (v2)
  {
    v3 = (CAMetalLayer *)objc_alloc_init((Class)CAMetalLayer);
    layer = v2->_layer;
    v2->_layer = v3;
  }
  return v2;
}

@end