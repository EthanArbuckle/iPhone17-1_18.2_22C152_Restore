@interface AVTCompositorTextureProvider
- (AVTCompositorTextureProvider)initWithCompositor:(id)a3 memoji:(id)a4 propertyName:(id)a5;
- (id)newTextureForDevice:(id)a3;
- (void)componentDidChangeForTypes:(unint64_t)a3;
- (void)dealloc;
- (void)renderToTexture:(id)a3 computeCommandHandler:(id)a4 blitCommandHandler:(id)a5 completionHandler:(id)a6 helper:(id)a7;
- (void)skinColorDidChange;
@end

@implementation AVTCompositorTextureProvider

- (AVTCompositorTextureProvider)initWithCompositor:(id)a3 memoji:(id)a4 propertyName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTCompositorTextureProvider;
  v11 = [(AVTCompositorTextureProvider *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_memoji, v9);
    objc_storeWeak((id *)&v12->_compositor, v8);
    uint64_t v13 = [v10 copy];
    propertyName = v12->_propertyName;
    v12->_propertyName = (NSString *)v13;

    v12->_skinIsDirty = 1;
    v12->_componentDirtyMask = -1;
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_compositor);
    [WeakRetained addClient:v12];
  }
  return v12;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositor);
  [WeakRetained removeClient:self];

  v4.receiver = self;
  v4.super_class = (Class)AVTCompositorTextureProvider;
  [(AVTCompositorTextureProvider *)&v4 dealloc];
}

- (void)skinColorDidChange
{
  self->_skinIsDirty = 1;
}

- (void)componentDidChangeForTypes:(unint64_t)a3
{
  self->_componentDirtyMask |= a3;
}

- (id)newTextureForDevice:(id)a3
{
  propertyName = self->_propertyName;
  id v5 = a3;
  v6 = +[AVTCompositorPipelineCache pipelineForPropertyName:propertyName device:v5];
  pipeline = self->_pipeline;
  self->_pipeline = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_memoji);
  [WeakRetained skinTextureSize];
  double v10 = v9;

  v11 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:70 width:(unint64_t)v10 height:(unint64_t)v10 mipmapped:1];
  [v11 setUsage:3];
  [v11 setStorageMode:2];
  v12 = (void *)[v5 newTextureWithDescriptor:v11];

  uint64_t v13 = [NSString stringWithFormat:@"Compositor - %@", self->_propertyName];
  [v12 setLabel:v13];

  return v12;
}

- (void)renderToTexture:(id)a3 computeCommandHandler:(id)a4 blitCommandHandler:(id)a5 completionHandler:(id)a6 helper:(id)a7
{
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (self->_skinIsDirty || self->_componentDirtyMask)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", -[NSMutableSet count](self->_helperTokens, "count"));
    pipeline = self->_pipeline;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_memoji);
    [(AVTCompositorPipeline *)pipeline compositeTexture:v21 forMemoji:WeakRetained considerSkin:self->_skinIsDirty componentsToConsider:self->_componentDirtyMask computeCommandHandler:v12 blitCommandHandler:v13 completionHandler:v14 helper:v15 helperTokens:v16];

    id v19 = objc_loadWeakRetained((id *)&self->_memoji);
    uint64_t v20 = [v19 usageIntent];

    if (v20 != 2) {
      objc_storeStrong((id *)&self->_helperTokens, v16);
    }
    self->_skinIsDirty = 0;
    self->_componentDirtyMask = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperTokens, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_destroyWeak((id *)&self->_compositor);
  objc_destroyWeak((id *)&self->_memoji);
}

@end