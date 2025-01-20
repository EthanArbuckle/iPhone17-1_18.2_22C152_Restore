@interface SCNPassContext
- (MTLCommandBuffer)commandBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (double)time;
- (id)inputTextureWithName:(id)a3;
- (id)outputTextureWithName:(id)a3;
@end

@implementation SCNPassContext

- (double)time
{
  return C3DEngineContextGetNextFrameTime((uint64_t)self->_context->var3);
}

- (MTLCommandQueue)commandQueue
{
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_context->var3);

  return (MTLCommandQueue *)-[SCNMTLRenderContext commandQueue](RenderContext);
}

- (MTLCommandBuffer)commandBuffer
{
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_context->var3);

  return (MTLCommandBuffer *)-[SCNMTLRenderContext currentCommandBuffer](RenderContext);
}

- (MTLDevice)device
{
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_context->var3);

  return (MTLDevice *)-[SCNMTLRenderContext device](RenderContext);
}

- (id)inputTextureWithName:(id)a3
{
  var5 = self->_context->var0[1].var5;
  v4 = (char *)[a3 UTF8String];

  return C3DPassGetInputTextureNamed((C3D::Pass *)var5, v4);
}

- (id)outputTextureWithName:(id)a3
{
  var5 = self->_context->var0[1].var5;
  v4 = (char *)[a3 UTF8String];

  return C3DPassGetOutputTextureNamed((C3D::Pass *)var5, v4);
}

@end