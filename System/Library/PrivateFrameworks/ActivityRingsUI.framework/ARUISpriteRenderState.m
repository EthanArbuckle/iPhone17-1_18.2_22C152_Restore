@interface ARUISpriteRenderState
- (ARUISpriteRenderState)initWithDevice:(id)a3 library:(id)a4;
- (ARUISpriteRenderState)initWithPipelineLibrary:(id)a3;
- (MTLRenderPipelineState)renderPipelineState;
- (id)name;
- (id)renderPipelineDescriptorFromLibrary:(id)a3;
- (void)setRenderPipelineState:(id)a3;
@end

@implementation ARUISpriteRenderState

- (MTLRenderPipelineState)renderPipelineState
{
  return self->_renderPipelineState;
}

- (ARUISpriteRenderState)initWithPipelineLibrary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARUISpriteRenderState;
  v5 = [(ARUISpriteRenderState *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(ARUISpriteRenderState *)v5 name];
    v8 = (void *)[v4 newRenderPipelineStateWithName:v7 options:0 reflection:0 error:0];

    [(ARUISpriteRenderState *)v6 setRenderPipelineState:v8];
  }

  return v6;
}

- (void)setRenderPipelineState:(id)a3
{
}

- (id)name
{
  return @"ARUISpriteRenderState";
}

- (ARUISpriteRenderState)initWithDevice:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUISpriteRenderState;
  v8 = [(ARUISpriteRenderState *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_super v10 = [(ARUISpriteRenderState *)v8 renderPipelineDescriptorFromLibrary:v7];
    v11 = (void *)[v6 newRenderPipelineStateWithDescriptor:v10 error:0];
    [(ARUISpriteRenderState *)v9 setRenderPipelineState:v11];
  }
  return v9;
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = (void *)[v4 newFunctionWithName:@"vertex_sprite_shader"];
  [v5 setVertexFunction:v6];

  id v7 = (void *)[v4 newFunctionWithName:@"fragment_sprite_shader"];
  [v5 setFragmentFunction:v7];

  v8 = [v5 colorAttachments];
  v9 = [v8 objectAtIndexedSubscript:0];
  [v9 setPixelFormat:80];

  [v5 configureForSourceOverBlending];
  objc_super v10 = [(ARUISpriteRenderState *)self name];
  [v5 setLabel:v10];

  return v5;
}

- (void).cxx_destruct
{
}

@end