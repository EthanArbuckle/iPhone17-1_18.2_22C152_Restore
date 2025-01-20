@interface Renderer
- (Renderer)initWithMetalKitView:(id)a3;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
- (void)renderEncodedCommands:(id)a3 toCommandBuffer:(id)a4 withView:(id)a5;
- (void)setDevice:(id)a3;
- (void)setDisplayTextureEncoder:(id)a3;
@end

@implementation Renderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureRenderer, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
}

- (void)drawInMTKView:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 currentRenderPassDescriptor];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [v9 currentDrawable];

    if (v6)
    {
      v7 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      [(Renderer *)self renderEncodedCommands:self->_encoder toCommandBuffer:v7 withView:v9];
      v8 = [v9 currentDrawable];
      [v7 presentDrawable:v8];

      [v7 commit];
    }
  }
}

- (void)renderEncodedCommands:(id)a3 toCommandBuffer:(id)a4 withView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 currentRenderPassDescriptor];
  v12 = [v9 renderCommandEncoderWithDescriptor:v11];
  if (v8)
  {
    v26 = v11;
    id v27 = v9;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v28 = v8;
    id obj = [v8 commands];
    id v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v16);
          textureRenderer = self->_textureRenderer;
          id v19 = [v10 colorPixelFormat];
          [v10 drawableSize];
          double v21 = v20;
          double v23 = v22;
          v24 = [v10 layer];
          [v24 contentsScale];
          -[GTMTLTextureRenderer render:withEncoder:withFormat:renderTargetSize:viewContentsScale:](textureRenderer, "render:withEncoder:withFormat:renderTargetSize:viewContentsScale:", v17, v12, v19, v21, v23, v25);

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }

    id v9 = v27;
    id v8 = v28;
    v11 = v26;
  }
  [v12 endEncoding];
}

- (void)setDisplayTextureEncoder:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_encoder, a3);
  device = self->_device;
  v6 = [v8 device];

  if (device != v6)
  {
    v7 = [v8 device];
    [(Renderer *)self setDevice:v7];
  }
}

- (void)setDevice:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_device, a3);
  device = self->_device;
  if (device)
  {
    v6 = (MTLCommandQueue *)[(MTLDevice *)device newCommandQueue];
    commandQueue = self->_commandQueue;
    self->_commandQueue = v6;

    id v8 = (GTMTLTextureRenderer *)[objc_alloc((Class)GTMTLTextureRenderer) initWithDevice:v10];
    textureRenderer = self->_textureRenderer;
    self->_textureRenderer = v8;
  }
}

- (Renderer)initWithMetalKitView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)Renderer;
  v5 = [(Renderer *)&v8 init];
  if (v5)
  {
    v6 = [v4 device];
    [(Renderer *)v5 setDevice:v6];
  }
  return v5;
}

@end