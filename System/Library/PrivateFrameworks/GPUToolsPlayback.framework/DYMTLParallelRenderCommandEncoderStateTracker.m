@interface DYMTLParallelRenderCommandEncoderStateTracker
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (DYMTLParallelRenderCommandEncoderStateTracker)initWithDevice:(id)a3 descriptor:(id)a4;
- (DYMTLParallelRenderCommandEncoderStateTracker)initWithEncoder:(id)a3 descriptor:(id)a4;
- (id)descriptor;
- (id)forwardingTargetForSelector:(SEL)a3;
- (unint64_t)height;
- (unint64_t)width;
- (void)_setDefaultsWithDescriptor:(id)a3 device:(id)a4;
@end

@implementation DYMTLParallelRenderCommandEncoderStateTracker

- (DYMTLParallelRenderCommandEncoderStateTracker)initWithEncoder:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)DYMTLParallelRenderCommandEncoderStateTracker;
    v9 = [(DYMTLParallelRenderCommandEncoderStateTracker *)&v14 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_renderEncoder, a3);
      v11 = [v7 device];
      [(DYMTLParallelRenderCommandEncoderStateTracker *)v10 _setDefaultsWithDescriptor:v8 device:v11];

      DYMTLSetAssociatedObject(v10, 0, v8);
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (DYMTLParallelRenderCommandEncoderStateTracker)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)DYMTLParallelRenderCommandEncoderStateTracker;
    id v8 = [(DYMTLParallelRenderCommandEncoderStateTracker *)&v12 init];
    v9 = v8;
    if (v8)
    {
      [(DYMTLParallelRenderCommandEncoderStateTracker *)v8 _setDefaultsWithDescriptor:v7 device:v6];
      DYMTLSetAssociatedObject(v9, 0, v7);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  if ([(MTLParallelRenderCommandEncoder *)self->_renderEncoder conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DYMTLParallelRenderCommandEncoderStateTracker;
    BOOL v5 = [(DYMTLParallelRenderCommandEncoderStateTracker *)&v7 conformsToProtocol:v4];
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_renderEncoder;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYMTLParallelRenderCommandEncoderStateTracker;
  if (-[DYMTLParallelRenderCommandEncoderStateTracker respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (void)_setDefaultsWithDescriptor:(id)a3 device:(id)a4
{
}

- (id)descriptor
{
  return DYMTLGetAssociatedObject(self, 0);
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_renderEncoder, 0);
}

@end