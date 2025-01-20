@interface ARUIRenderState
- (ARUIRenderState)initWithDevice:(id)a3 library:(id)a4;
- (MTLRenderPipelineState)renderPipelineState;
- (id)renderPipelineDescriptorFromLibrary:(id)a3;
- (void)setRenderPipelineState:(id)a3;
@end

@implementation ARUIRenderState

- (ARUIRenderState)initWithDevice:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUIRenderState;
  v8 = [(ARUIRenderState *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v10 = [(ARUIRenderState *)v8 renderPipelineDescriptorFromLibrary:v7];
    v11 = (void *)[v6 newRenderPipelineStateWithDescriptor:v10 error:0];
    [(ARUIRenderState *)v9 setRenderPipelineState:v11];
  }
  return v9;
}

- (void)setRenderPipelineState:(id)a3
{
}

- (MTLRenderPipelineState)renderPipelineState
{
  return self->_renderPipelineState;
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end