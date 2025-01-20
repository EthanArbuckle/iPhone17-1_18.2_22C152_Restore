@interface ARUIRingsRenderState
- (ARUIRingsRenderState)initWithDevice:(id)a3 library:(id)a4;
- (ARUIRingsRenderState)initWithPipelineLibrary:(id)a3;
- (BOOL)shouldRunStateForRing:(id)a3;
- (MTLRenderPipelineState)renderPipelineState;
- (id)name;
- (id)renderPipelineDescriptorFromLibrary:(id)a3;
- (int64_t)centeredAroundPercentSegmentDrawCount;
- (unint64_t)renderArea;
- (void)didInitialize;
- (void)setCenteredAroundPercentSegmentDrawCount:(int64_t)a3;
- (void)setRenderArea:(unint64_t)a3;
- (void)setRenderPipelineState:(id)a3;
@end

@implementation ARUIRingsRenderState

- (MTLRenderPipelineState)renderPipelineState
{
  return self->_renderPipelineState;
}

- (unint64_t)renderArea
{
  return self->_renderArea;
}

- (ARUIRingsRenderState)initWithPipelineLibrary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARUIRingsRenderState;
  v5 = [(ARUIRingsRenderState *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(ARUIRingsRenderState *)v5 name];
    v8 = (void *)[v4 newRenderPipelineStateWithName:v7 options:0 reflection:0 error:0];

    [(ARUIRingsRenderState *)v6 setRenderPipelineState:v8];
    [(ARUIRingsRenderState *)v6 didInitialize];
  }
  return v6;
}

- (void)setRenderPipelineState:(id)a3
{
}

- (void)didInitialize
{
  *(_OWORD *)&self->_renderArea = xmmword_21E189AE0;
}

- (void)setRenderArea:(unint64_t)a3
{
  self->_renderArea = a3;
}

- (ARUIRingsRenderState)initWithDevice:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUIRingsRenderState;
  v8 = [(ARUIRingsRenderState *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_super v10 = [(ARUIRingsRenderState *)v8 renderPipelineDescriptorFromLibrary:v7];
    v11 = (void *)[v6 newRenderPipelineStateWithDescriptor:v10 error:0];
    [(ARUIRingsRenderState *)v9 setRenderPipelineState:v11];
    [(ARUIRingsRenderState *)v9 didInitialize];
  }
  return v9;
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  return 0;
}

- (id)name
{
  return 0;
}

- (BOOL)shouldRunStateForRing:(id)a3
{
  return 1;
}

- (int64_t)centeredAroundPercentSegmentDrawCount
{
  return self->_centeredAroundPercentSegmentDrawCount;
}

- (void)setCenteredAroundPercentSegmentDrawCount:(int64_t)a3
{
  self->_centeredAroundPercentSegmentDrawCount = a3;
}

- (void).cxx_destruct
{
}

@end