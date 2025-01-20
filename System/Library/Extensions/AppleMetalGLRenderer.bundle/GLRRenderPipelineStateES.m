@interface GLRRenderPipelineStateES
- (GLRRenderPipelineStateES)initWithPipelineState:(id)a3 reflection:(id)a4;
- (void)dealloc;
@end

@implementation GLRRenderPipelineStateES

- (GLRRenderPipelineStateES)initWithPipelineState:(id)a3 reflection:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GLRRenderPipelineStateES;
  v6 = [(GLRRenderPipelineStateES *)&v8 init];
  v6->_internal.renderPipelineState = (MTLRenderPipelineStateSPI *)a3;
  *(void *)&v6->_internal.usageFlags = [a4 usageFlags];
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GLRRenderPipelineStateES;
  [(GLRRenderPipelineStateES *)&v3 dealloc];
}

@end