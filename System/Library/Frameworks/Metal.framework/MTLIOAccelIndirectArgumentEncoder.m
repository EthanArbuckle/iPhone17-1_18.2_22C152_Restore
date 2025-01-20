@interface MTLIOAccelIndirectArgumentEncoder
- (unint64_t)encodedLength;
- (void)constantDataAtIndex:(unint64_t)a3;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setIndirectArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4;
- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
@end

@implementation MTLIOAccelIndirectArgumentEncoder

- (unint64_t)encodedLength
{
  return 0;
}

- (void)setIndirectArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = [a3 privateICBuffer];

  [(MTLIOAccelIndirectArgumentEncoder *)self setBuffer:v6 offset:0 atIndex:a4];
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      v8 = (void *)*a3++;
      -[MTLIOAccelIndirectArgumentEncoder setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", [v8 privateICBuffer], 0, location++);
      --length;
    }
    while (length);
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
  if ([(MTLDevice *)[(_MTLIndirectArgumentEncoder *)self device] requiresRaytracingEmulation])
  {
    uint64_t v8 = [a3 visibleFunctionTable];
    [(MTLIOAccelIndirectArgumentEncoder *)self setVisibleFunctionTable:v8 atIndex:a4];
  }
  else
  {
    [(MTLIOAccelIndirectArgumentEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(MTLDevice *)[(_MTLIndirectArgumentEncoder *)self device] requiresRaytracingEmulation])
  {
    if (length)
    {
      v9 = (void *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = [v11 visibleFunctionTable];
        --v10;
      }
      while (v10);
    }
    -[MTLIOAccelIndirectArgumentEncoder setVisibleFunctionTables:withRange:](self, "setVisibleFunctionTables:withRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    [(MTLIOAccelIndirectArgumentEncoder *)self doesNotRecognizeSelector:a2];
  }
}

@end