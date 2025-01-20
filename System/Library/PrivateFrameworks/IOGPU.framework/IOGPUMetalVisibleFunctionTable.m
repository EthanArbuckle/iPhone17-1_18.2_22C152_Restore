@interface IOGPUMetalVisibleFunctionTable
- (MTLBuffer)globalBuffer;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)globalBufferOffset;
- (unint64_t)gpuAddress;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setGlobalBuffer:(id)a3;
- (void)setGlobalBufferOffset:(unint64_t)a3;
- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
@end

@implementation IOGPUMetalVisibleFunctionTable

- (MTLBuffer)globalBuffer
{
  return 0;
}

- (void)setGlobalBuffer:(id)a3
{
}

- (unint64_t)globalBufferOffset
{
  return 0;
}

- (void)setGlobalBufferOffset:(unint64_t)a3
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4
{
}

- (unint64_t)gpuAddress
{
  return 0;
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return 0;
}

@end