@interface _MTLIndirectArgumentEncoder
- (MTLDevice)device;
- (_MTLIndirectArgumentBufferLayout)layout;
- (_MTLIndirectArgumentEncoder)initWithLayout:(id)a3 device:(id)a4;
- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3;
- (void)constantDataAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIndirectArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4;
- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
@end

@implementation _MTLIndirectArgumentEncoder

- (_MTLIndirectArgumentEncoder)initWithLayout:(id)a3 device:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_MTLIndirectArgumentEncoder;
  v6 = [(_MTLObjectWithLabel *)&v8 init];
  if (v6)
  {
    v6->_device = (MTLDevice *)a4;
    v6->_layout = (_MTLIndirectArgumentBufferLayout *)a3;
  }
  return v6;
}

- (void)dealloc
{
  self->_device = 0;
  self->_layout = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLIndirectArgumentEncoder;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setBuffer:offset:atIndex:]", 929, @"Unreachable code", a5, v5, v6, v7, v8);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setBuffers:offsets:withRange:]", 934, @"Unreachable code", a5.location, a5.length, v5, v6, v7);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setTexture:atIndex:]", 939, @"Unreachable code", v4, v5, v6, v7, v8);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setTextures:withRange:]", 944, @"Unreachable code", a4.length, v4, v5, v6, v7);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setSamplerState:atIndex:]", 949, @"Unreachable code", v4, v5, v6, v7, v8);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setSamplerStates:withRange:]", 954, @"Unreachable code", a4.length, v4, v5, v6, v7);
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setRenderPipelineState:atIndex:]", 960, @"Unreachable code", v4, v5, v6, v7, v8);
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setRenderPipelineStates:withRange:]", 965, @"Unreachable code", a4.length, v4, v5, v6, v7);
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setComputePipelineState:atIndex:]", 970, @"Unreachable code", v4, v5, v6, v7, v8);
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setComputePipelineStates:withRange:]", 975, @"Unreachable code", a4.length, v4, v5, v6, v7);
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setIndirectCommandBuffer:atIndex:]", 980, @"Unreachable code", v4, v5, v6, v7, v8);
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setIndirectCommandBuffers:withRange:]", 985, @"Unreachable code", a4.length, v4, v5, v6, v7);
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder constantDataAtIndex:]", 990, @"Unreachable code", v3, v4, v5, v6, vars0);
  return 0;
}

- (void)setIndirectArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5
{
  unint64_t v7 = a4 + [(_MTLIndirectArgumentEncoder *)self encodedLength] * a5;

  [(_MTLIndirectArgumentEncoder *)self setArgumentBuffer:a3 offset:v7];
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  id result = [(_MTLIndirectArgumentBufferLayout *)self->_layout bufferLayoutForResourceAtIndex:a3];
  if (result)
  {
    id v5 = result;
    device = self->_device;
    return (id)[(MTLDevice *)device newArgumentEncoderWithLayout:v5];
  }
  return result;
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLIndirectArgumentEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(_MTLIndirectArgumentEncoder *)self setBuffer:v8 offset:v9 atIndex:a4];
  }
  else
  {
    [(_MTLIndirectArgumentEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
}

- (_MTLIndirectArgumentBufferLayout)layout
{
  return self->_layout;
}

@end