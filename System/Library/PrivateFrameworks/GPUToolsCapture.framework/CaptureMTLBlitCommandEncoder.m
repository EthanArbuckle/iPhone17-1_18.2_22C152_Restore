@interface CaptureMTLBlitCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLBlitCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBlitCommandEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10;
- (void)copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6;
- (void)dealloc;
- (void)endEncoding;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8;
- (void)generateMipmapsForTexture:(id)a3;
- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9;
- (void)insertDebugSignpost:(id)a3;
- (void)invalidateCompressedTexture:(id)a3;
- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForCPUAccess:(id)a3;
- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForGPUAccess:(id)a3;
- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6;
- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setLabel:(id)a3;
- (void)touch;
- (void)updateFence:(id)a3;
- (void)waitForFence:(id)a3;
@end

@implementation CaptureMTLBlitCommandEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_destroyWeak((id *)&self->_captureCommandBuffer);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)waitForFence:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  v7 = [v4 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject waitForFence:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16131;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  v13 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)updateFence:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  v7 = [v4 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject updateFence:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16124;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  v13 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject sampleCountersInBuffer:v11 atSampleIndex:a4 withBarrier:v5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15755;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((_DWORD *)v14 + 6) = v5;
  *((_DWORD *)v14 + 7) = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  char v13 = [v10 baseObject];
  long long v14 = *(_OWORD *)&a4->var0.var2;
  v27[0] = *(_OWORD *)&a4->var0.var0;
  v27[1] = v14;
  v27[2] = *(_OWORD *)&a4->var1.var1;
  [(MTLBlitCommandEncoderSPI *)baseObject resetTextureAccessCounters:v13 region:v27 mipLevel:a5 slice:a6];

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15976;
  uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 24);
  uint64_t v17 = BYTE10(v30);
  ++BYTE10(v30);
  Bytes = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v29 + 1), v17 | 0x5000000000);
  *(unsigned char *)(v15 + 13) = v17;
  long long v19 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = (uint64_t *)[v10 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v22;
  long long v23 = *(_OWORD *)&a4->var0.var2;
  long long v24 = *(_OWORD *)&a4->var1.var1;
  *((_OWORD *)Bytes + 2) = *(_OWORD *)&a4->var0.var0;
  *((_OWORD *)Bytes + 3) = v23;
  *((_OWORD *)Bytes + 4) = v24;
  *((void *)Bytes + 10) = a5;
  *((void *)Bytes + 11) = a6;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v7];
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  baseObject = self->_baseObject;
  id v10 = [v7 baseObject];
  -[MTLBlitCommandEncoderSPI resetCommandsInBuffer:withRange:](baseObject, "resetCommandsInBuffer:withRange:", v10, location, length);

  uint64_t v11 = v23;
  *(_DWORD *)(v23 + 8) = -15960;
  char v12 = BYTE9(v24);
  if (BYTE9(v24) > 0x20uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v15 = BYTE10(v24);
    ++BYTE10(v24);
    char v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v23 + 1), v15 | 0x2000000000) + 16;
    char v12 = v15;
  }
  else
  {
    char v13 = (char *)(v11 + BYTE9(v24));
    BYTE9(v24) += 32;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v16 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v18 = (uint64_t *)[v7 traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  *(void *)char v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLBlitCommandEncoderSPI *)self->_baseObject pushDebugGroup:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16374;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  id v10 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)id v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)popDebugGroup
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLBlitCommandEncoderSPI *)self->_baseObject popDebugGroup];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16373;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v7];
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  baseObject = self->_baseObject;
  uint64_t v10 = [v7 baseObject];
  -[MTLBlitCommandEncoderSPI optimizeIndirectCommandBuffer:withRange:](baseObject, "optimizeIndirectCommandBuffer:withRange:", v10, location, length);

  uint64_t v11 = v23;
  *(_DWORD *)(v23 + 8) = -15958;
  char v12 = BYTE9(v24);
  if (BYTE9(v24) > 0x20uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v15 = BYTE10(v24);
    ++BYTE10(v24);
    long long v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v23 + 1), v15 | 0x2000000000) + 16;
    char v12 = v15;
  }
  else
  {
    long long v13 = (char *)(v11 + BYTE9(v24));
    BYTE9(v24) += 32;
  }
  *(unsigned char *)(v11 + 13) = v12;
  size_t v16 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v18 = (uint64_t *)[v7 traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  *(void *)long long v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject optimizeContentsForGPUAccess:v11 slice:a4 level:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15994;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  id v7 = [v4 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject optimizeContentsForGPUAccess:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15995;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  char v13 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject optimizeContentsForCPUAccess:v11 slice:a4 level:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15992;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  id v7 = [v4 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject optimizeContentsForCPUAccess:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15993;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  char v13 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject invalidateCompressedTexture:v11 slice:a4 level:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15469;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)invalidateCompressedTexture:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  id v7 = [v4 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject invalidateCompressedTexture:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15470;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  char v13 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLBlitCommandEncoderSPI *)self->_baseObject insertDebugSignpost:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16375;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)id v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a8;
  [v15 touch];
  if (v15)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v15];
    }
  }
  [v16 touch];
  if (v16)
  {
    uint64_t v18 = self->_retainedObjects;
    if (v18) {
      [(NSMutableSet *)v18 addObject:v16];
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v46);
  baseObject = self->_baseObject;
  long long v20 = [v15 baseObject];
  long long v21 = [v16 baseObject];
  long long v22 = *(_OWORD *)&a4->var0.var2;
  v45[0] = *(_OWORD *)&a4->var0.var0;
  v45[1] = v22;
  v45[2] = *(_OWORD *)&a4->var1.var1;
  unint64_t v43 = a6;
  BOOL v44 = v10;
  [(MTLBlitCommandEncoderSPI *)baseObject getTextureAccessCounters:v20 region:v45 mipLevel:a5 slice:a6 resetCounters:v10 countersBuffer:v21 countersBufferOffset:a9];

  uint64_t v23 = v47;
  *(_DWORD *)(v47 + 8) = -15977;
  uint64_t v24 = *(void *)(*((void *)&v46 + 1) + 24);
  uint64_t v25 = BYTE10(v48);
  ++BYTE10(v48);
  Bytes = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v47 + 1), v25 | 0x6800000000);
  *(unsigned char *)(v23 + 13) = v25;
  v27 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v42 = v15;
  long long v28 = (uint64_t *)[v15 traceStream];
  unint64_t v29 = a5;
  if (v28) {
    uint64_t v30 = *v28;
  }
  else {
    uint64_t v30 = 0;
  }
  unint64_t v32 = a4->var0.var0;
  unint64_t var1 = a4->var0.var1;
  unint64_t var2 = a4->var0.var2;
  unint64_t v33 = a4->var1.var0;
  unint64_t v36 = a4->var1.var1;
  unint64_t v35 = a4->var1.var2;
  v37 = (uint64_t *)[v16 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v30;
  *((void *)Bytes + 4) = v32;
  *((void *)Bytes + 5) = var1;
  *((void *)Bytes + 6) = var2;
  *((void *)Bytes + 7) = v33;
  *((void *)Bytes + 8) = v36;
  *((void *)Bytes + 9) = v35;
  *((void *)Bytes + 10) = v29;
  *((void *)Bytes + 11) = v43;
  *((void *)Bytes + 12) = v38;
  *((void *)Bytes + 13) = a9;
  *((_DWORD *)Bytes + 28) = v44;
  *((_DWORD *)Bytes + 29) = 0;
  s();
  *(void *)uint64_t v39 = v40;
  *(unsigned char *)(v39 + 8) = BYTE8(v48);
  *(unsigned char *)(v47 + 15) |= 8u;
}

- (void)generateMipmapsForTexture:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  id v7 = [v4 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject generateMipmapsForTexture:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16379;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    BOOL v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    BOOL v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  id v13 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)BOOL v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  id v14 = a3;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v14];
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v37);
  baseObject = self->_baseObject;
  uint64_t v17 = [v14 baseObject];
  long long v18 = *(_OWORD *)&a6->var0.var2;
  v36[0] = *(_OWORD *)&a6->var0.var0;
  v36[1] = v18;
  v36[2] = *(_OWORD *)&a6->var1.var1;
  [(MTLBlitCommandEncoderSPI *)baseObject fillTexture:v17 level:a4 slice:a5 region:v36 bytes:a7 length:a8];

  uint64_t v19 = v38;
  *(_DWORD *)(v38 + 8) = -15473;
  uint64_t v20 = *(void *)(*((void *)&v37 + 1) + 24);
  uint64_t v21 = BYTE10(v39);
  ++BYTE10(v39);
  Bytes = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v38 + 1), v21 | 0x6000000000);
  *(unsigned char *)(v19 + 13) = v21;
  uint64_t v23 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v25 = (uint64_t *)[v14 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  long long v27 = *(_OWORD *)&a6->var0.var0;
  long long v28 = *(_OWORD *)&a6->var0.var2;
  long long v29 = *(_OWORD *)&a6->var1.var1;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v34 = *(_OWORD *)&a6->var0.var2;
    long long v35 = *(_OWORD *)&a6->var0.var0;
    long long v33 = *(_OWORD *)&a6->var1.var1;
    char v30 = GTTraceEncoder_storeBlob((uint64_t)&v37, a7, a8);
    long long v29 = v33;
    long long v28 = v34;
    long long v27 = v35;
  }
  else
  {
    char v30 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v26;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((_OWORD *)Bytes + 3) = v27;
  *((_OWORD *)Bytes + 4) = v28;
  *((_OWORD *)Bytes + 5) = v29;
  *((void *)Bytes + 12) = a8;
  Bytes[104] = v30;
  *(_DWORD *)(Bytes + 105) = 0;
  *((_DWORD *)Bytes + 27) = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v39);
  *(unsigned char *)(v38 + 15) |= 8u;
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  [v9 touch];
  if (v9)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v9];
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
  baseObject = self->_baseObject;
  uint64_t v12 = [v9 baseObject];
  -[MTLBlitCommandEncoderSPI fillBuffer:range:value:](baseObject, "fillBuffer:range:value:", v12, location, length, v5);

  uint64_t v13 = v25;
  *(_DWORD *)(v25 + 8) = -16378;
  char v14 = BYTE9(v26);
  if (BYTE9(v26) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v17 = BYTE10(v26);
    ++BYTE10(v26);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v25 + 1), v17 | 0x2800000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v26));
    BYTE9(v26) += 40;
  }
  *(unsigned char *)(v13 + 13) = v14;
  long long v18 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v20 = (uint64_t *)[v9 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = location;
  *((void *)v15 + 3) = length;
  v15[32] = v5;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  [v9 touch];
  if (v9)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v9];
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
  baseObject = self->_baseObject;
  uint64_t v12 = [v9 baseObject];
  -[MTLBlitCommandEncoderSPI fillBuffer:range:pattern4:](baseObject, "fillBuffer:range:pattern4:", v12, location, length, v5);

  uint64_t v13 = v25;
  *(_DWORD *)(v25 + 8) = -15474;
  char v14 = BYTE9(v26);
  if (BYTE9(v26) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v17 = BYTE10(v26);
    ++BYTE10(v26);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v25 + 1), v17 | 0x2800000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v26));
    BYTE9(v26) += 40;
  }
  *(unsigned char *)(v13 + 13) = v14;
  long long v18 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v20 = (uint64_t *)[v9 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = location;
  *((void *)v15 + 3) = length;
  *((_DWORD *)v15 + 8) = v5;
  *((_DWORD *)v15 + 9) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;
}

- (void)endEncoding
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLBlitCommandEncoderSPI *)self->_baseObject endEncoding];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16376;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16383;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLBlitCommandEncoder;
  [(CaptureMTLBlitCommandEncoder *)&v12 dealloc];
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  [v11 touch];
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v11];
    }
  }
  [v12 touch];
  if (v12)
  {
    long long v14 = self->_retainedObjects;
    if (v14) {
      [(NSMutableSet *)v14 addObject:v12];
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v31);
  baseObject = self->_baseObject;
  uint64_t v16 = [v11 baseObject];
  uint64_t v17 = [v12 baseObject];
  -[MTLBlitCommandEncoderSPI copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:](baseObject, "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", v16, location, length, v17, a6);

  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -15959;
  char v19 = BYTE9(v33);
  if (BYTE9(v33) > 0x10uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v22 = BYTE10(v33);
    ++BYTE10(v33);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v32 + 1), v22 | 0x3000000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v33));
    BYTE9(v33) += 48;
  }
  *(unsigned char *)(v18 + 13) = v19;
  uint64_t v23 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v25 = (uint64_t *)[v11 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  long long v27 = (uint64_t *)[v12 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0;
  }
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = location;
  *((void *)v20 + 3) = length;
  *((void *)v20 + 4) = v28;
  *((void *)v20 + 5) = a6;
  s();
  *(void *)uint64_t v29 = v30;
  *(unsigned char *)(v29 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  [v7 touch];
  if (v7)
  {
    id v9 = self->_retainedObjects;
    if (v9) {
      [(NSMutableSet *)v9 addObject:v7];
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  id v11 = [v6 baseObject];
  id v12 = [v7 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromTexture:v11 toTexture:v12];

  uint64_t v13 = v27;
  *(_DWORD *)(v27 + 8) = -15877;
  char v14 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v17 = BYTE10(v28);
    ++BYTE10(v28);
    long long v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v27 + 1), v17 | 0x1800000000) + 16;
    char v14 = v17;
  }
  else
  {
    long long v15 = (char *)(v13 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v13 + 13) = v14;
  uint64_t v18 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v20 = (uint64_t *)[v6 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = (uint64_t *)[v7 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  *(void *)long long v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v23;
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  id v14 = a3;
  id v15 = a6;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v14];
    }
  }
  [v15 touch];
  if (v15)
  {
    uint64_t v17 = self->_retainedObjects;
    if (v17) {
      [(NSMutableSet *)v17 addObject:v15];
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v35);
  baseObject = self->_baseObject;
  char v19 = [v14 baseObject];
  uint64_t v20 = [v15 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromTexture:v19 sourceSlice:a4 sourceLevel:a5 toTexture:v20 destinationSlice:a7 destinationLevel:a8 sliceCount:a9 levelCount:a10];

  uint64_t v21 = v36;
  *(_DWORD *)(v36 + 8) = -15878;
  uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 24);
  uint64_t v23 = BYTE10(v37);
  ++BYTE10(v37);
  Bytes = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v36 + 1), v23 | 0x4800000000);
  *(unsigned char *)(v21 + 13) = v23;
  uint64_t v25 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v27 = (uint64_t *)[v14 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = (uint64_t *)[v15 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v28;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v30;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = a8;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a8;
  [v17 touch];
  if (v17)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v17];
    }
  }
  [v18 touch];
  if (v18)
  {
    uint64_t v20 = self->_retainedObjects;
    if (v20) {
      [(NSMutableSet *)v20 addObject:v18];
    }
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v52);
  baseObject = self->_baseObject;
  uint64_t v22 = [v17 baseObject];
  uint64_t v23 = [v18 baseObject];
  long long v50 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  long long v48 = *(_OWORD *)&a7->var0;
  unint64_t v49 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v47 = *a11;
  unint64_t v44 = a5;
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromTexture:v22 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v50 sourceSize:&v48 toTexture:v23 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v47 options:a12];

  uint64_t v24 = v53;
  *(_DWORD *)(v53 + 8) = -16211;
  uint64_t v25 = *(void *)(*((void *)&v52 + 1) + 24);
  uint64_t v26 = BYTE10(v54);
  ++BYTE10(v54);
  Bytes = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v53 + 1), v26 | 0x8800000000);
  *(unsigned char *)(v24 + 13) = v26;
  uint64_t v28 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v30 = (uint64_t *)[v17 traceStream];
  v45 = v17;
  if (v30) {
    uint64_t v31 = *v30;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v33 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t v34 = a6->var2;
  unint64_t v36 = a7->var0;
  unint64_t v35 = a7->var1;
  unint64_t v37 = a7->var2;
  long long v38 = (uint64_t *)[v18 traceStream];
  if (v38) {
    uint64_t v39 = *v38;
  }
  else {
    uint64_t v39 = 0;
  }
  unint64_t v40 = a11->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v31;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = v44;
  *((void *)Bytes + 12) = v39;
  *((void *)Bytes + 13) = a9;
  *((void *)Bytes + 14) = a10;
  long long v41 = *(_OWORD *)&a11->var0;
  *((void *)Bytes + 6) = v33;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = v34;
  *((void *)Bytes + 9) = v36;
  *((void *)Bytes + 10) = v35;
  *((void *)Bytes + 11) = v37;
  *(_OWORD *)(Bytes + 120) = v41;
  *((void *)Bytes + 17) = v40;
  *((void *)Bytes + 18) = a12;
  s();
  *(void *)uint64_t v42 = v43;
  *(unsigned char *)(v42 + 8) = BYTE8(v54);
  *(unsigned char *)(v53 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v16 = a3;
  id v17 = a8;
  [v16 touch];
  if (v16)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v16];
    }
  }
  [v17 touch];
  if (v17)
  {
    char v19 = self->_retainedObjects;
    if (v19) {
      [(NSMutableSet *)v19 addObject:v17];
    }
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v51);
  baseObject = self->_baseObject;
  uint64_t v21 = [v16 baseObject];
  uint64_t v22 = [v17 baseObject];
  long long v49 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  long long v47 = *(_OWORD *)&a7->var0;
  unint64_t v48 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v46 = *a11;
  unint64_t v43 = a5;
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromTexture:v21 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v49 sourceSize:&v47 toTexture:v22 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v46];

  uint64_t v23 = v52;
  *(_DWORD *)(v52 + 8) = -16382;
  uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 24);
  uint64_t v25 = BYTE10(v53);
  ++BYTE10(v53);
  Bytes = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v52 + 1), v25 | 0x8000000000);
  *(unsigned char *)(v23 + 13) = v25;
  long long v27 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v29 = (uint64_t *)[v16 traceStream];
  unint64_t v44 = v16;
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0;
  }
  unint64_t v32 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t v33 = a6->var2;
  unint64_t v35 = a7->var0;
  unint64_t v34 = a7->var1;
  unint64_t v36 = a7->var2;
  unint64_t v37 = (uint64_t *)[v17 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0;
  }
  unint64_t v39 = a11->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v30;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = v43;
  *((void *)Bytes + 12) = v38;
  *((void *)Bytes + 13) = a9;
  *((void *)Bytes + 14) = a10;
  long long v40 = *(_OWORD *)&a11->var0;
  *((void *)Bytes + 6) = v32;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = v33;
  *((void *)Bytes + 9) = v35;
  *((void *)Bytes + 10) = v34;
  *((void *)Bytes + 11) = v36;
  *(_OWORD *)(Bytes + 120) = v40;
  *((void *)Bytes + 17) = v39;
  s();
  *(void *)uint64_t v41 = v42;
  *(unsigned char *)(v41 + 8) = BYTE8(v53);
  *(unsigned char *)(v52 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  id v18 = a3;
  id v19 = a8;
  [v18 touch];
  if (v18)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v18];
    }
  }
  [v19 touch];
  if (v19)
  {
    uint64_t v21 = self->_retainedObjects;
    if (v21) {
      [(NSMutableSet *)v21 addObject:v19];
    }
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v50);
  baseObject = self->_baseObject;
  uint64_t v23 = [v18 baseObject];
  uint64_t v24 = [v19 baseObject];
  long long v48 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  long long v46 = *(_OWORD *)&a7->var0;
  unint64_t v47 = a7->var2;
  unint64_t v43 = a4;
  unint64_t v44 = a5;
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromTexture:v23 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v48 sourceSize:&v46 toBuffer:v24 destinationOffset:a9 destinationBytesPerRow:a10 destinationBytesPerImage:a11 options:a12];

  uint64_t v25 = v51;
  *(_DWORD *)(v51 + 8) = -16209;
  uint64_t v26 = *(void *)(*((void *)&v50 + 1) + 24);
  uint64_t v27 = BYTE10(v52);
  ++BYTE10(v52);
  Bytes = GTTraceMemPool_allocateBytes(v26, *((uint64_t *)&v51 + 1), v27 | 0x7800000000);
  *(unsigned char *)(v25 + 13) = v27;
  uint64_t v29 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v31 = (uint64_t *)[v18 traceStream];
  v45 = v18;
  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0;
  }
  unint64_t v34 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t v35 = a6->var2;
  unint64_t v37 = a7->var0;
  unint64_t v36 = a7->var1;
  unint64_t v38 = a7->var2;
  unint64_t v39 = (uint64_t *)[v19 traceStream];
  if (v39) {
    uint64_t v40 = *v39;
  }
  else {
    uint64_t v40 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v32;
  *((void *)Bytes + 4) = v43;
  *((void *)Bytes + 5) = v44;
  *((void *)Bytes + 6) = v34;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = v35;
  *((void *)Bytes + 9) = v37;
  *((void *)Bytes + 10) = v36;
  *((void *)Bytes + 11) = v38;
  *((void *)Bytes + 12) = v40;
  *((void *)Bytes + 13) = a9;
  *((void *)Bytes + 14) = a10;
  *((void *)Bytes + 15) = a11;
  *((void *)Bytes + 16) = a12;
  s();
  *(void *)uint64_t v41 = v42;
  *(unsigned char *)(v41 + 8) = BYTE8(v52);
  *(unsigned char *)(v51 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  id v17 = a3;
  id v18 = a8;
  [v17 touch];
  if (v17)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v17];
    }
  }
  [v18 touch];
  if (v18)
  {
    uint64_t v20 = self->_retainedObjects;
    if (v20) {
      [(NSMutableSet *)v20 addObject:v18];
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v49);
  baseObject = self->_baseObject;
  uint64_t v22 = [v17 baseObject];
  uint64_t v23 = [v18 baseObject];
  long long v47 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  long long v45 = *(_OWORD *)&a7->var0;
  unint64_t v46 = a7->var2;
  unint64_t v42 = a4;
  unint64_t v43 = a5;
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromTexture:v22 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v47 sourceSize:&v45 toBuffer:v23 destinationOffset:a9 destinationBytesPerRow:a10 destinationBytesPerImage:a11];

  uint64_t v24 = v50;
  *(_DWORD *)(v50 + 8) = -16380;
  uint64_t v25 = *(void *)(*((void *)&v49 + 1) + 24);
  uint64_t v26 = BYTE10(v51);
  ++BYTE10(v51);
  Bytes = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v50 + 1), v26 | 0x7000000000);
  *(unsigned char *)(v24 + 13) = v26;
  uint64_t v28 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v30 = (uint64_t *)[v17 traceStream];
  unint64_t v44 = v17;
  if (v30) {
    uint64_t v31 = *v30;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v33 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t v34 = a6->var2;
  unint64_t v36 = a7->var0;
  unint64_t v35 = a7->var1;
  unint64_t v37 = a7->var2;
  unint64_t v38 = (uint64_t *)[v18 traceStream];
  if (v38) {
    uint64_t v39 = *v38;
  }
  else {
    uint64_t v39 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v31;
  *((void *)Bytes + 4) = v42;
  *((void *)Bytes + 5) = v43;
  *((void *)Bytes + 6) = v33;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = v34;
  *((void *)Bytes + 9) = v36;
  *((void *)Bytes + 10) = v35;
  *((void *)Bytes + 11) = v37;
  *((void *)Bytes + 12) = v39;
  *((void *)Bytes + 13) = a9;
  *((void *)Bytes + 14) = a10;
  *((void *)Bytes + 15) = a11;
  s();
  *(void *)uint64_t v40 = v41;
  *(unsigned char *)(v40 + 8) = BYTE8(v51);
  *(unsigned char *)(v50 + 15) |= 8u;
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v12];
    }
  }
  [v13 touch];
  if (v13)
  {
    id v15 = self->_retainedObjects;
    if (v15) {
      [(NSMutableSet *)v15 addObject:v13];
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
  baseObject = self->_baseObject;
  id v17 = [v12 baseObject];
  id v18 = [v13 baseObject];
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromBuffer:v17 sourceOffset:a4 toBuffer:v18 destinationOffset:a6 size:a7];

  uint64_t v19 = v33;
  *(_DWORD *)(v33 + 8) = -16377;
  char v20 = BYTE9(v34);
  if (BYTE9(v34) > 0x10uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v23 = BYTE10(v34);
    ++BYTE10(v34);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v33 + 1), v23 | 0x3000000000) + 16;
    char v20 = v23;
  }
  else
  {
    uint64_t v21 = (char *)(v19 + BYTE9(v34));
    BYTE9(v34) += 48;
  }
  *(unsigned char *)(v19 + 13) = v20;
  uint64_t v24 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v26 = (uint64_t *)[v12 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = (uint64_t *)[v13 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0;
  }
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  *((void *)v21 + 3) = v29;
  *((void *)v21 + 4) = a6;
  *((void *)v21 + 5) = a7;
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a8;
  [v17 touch];
  if (v17)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v17];
    }
  }
  [v18 touch];
  if (v18)
  {
    char v20 = self->_retainedObjects;
    if (v20) {
      [(NSMutableSet *)v20 addObject:v18];
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v48);
  baseObject = self->_baseObject;
  uint64_t v22 = [v17 baseObject];
  uint64_t v23 = [v18 baseObject];
  long long v46 = *(_OWORD *)&a7->var0;
  unint64_t var2 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v45 = *a11;
  unint64_t v43 = a5;
  unint64_t v24 = a5;
  unint64_t v25 = a6;
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromBuffer:v22 sourceOffset:a4 sourceBytesPerRow:v24 sourceBytesPerImage:a6 sourceSize:&v46 toTexture:v23 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v45 options:a12];

  uint64_t v26 = v49;
  *(_DWORD *)(v49 + 8) = -16210;
  uint64_t v27 = *(void *)(*((void *)&v48 + 1) + 24);
  uint64_t v28 = BYTE10(v50);
  ++BYTE10(v50);
  Bytes = GTTraceMemPool_allocateBytes(v27, *((uint64_t *)&v49 + 1), v28 | 0x7800000000);
  *(unsigned char *)(v26 + 13) = v28;
  uint64_t v30 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v32 = (uint64_t *)[v17 traceStream];
  if (v32) {
    uint64_t v33 = *v32;
  }
  else {
    uint64_t v33 = 0;
  }
  unint64_t v34 = a7->var0;
  unint64_t var1 = a7->var1;
  unint64_t v36 = a7->var2;
  unint64_t v37 = (uint64_t *)[v18 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0;
  }
  unint64_t v39 = a11->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v33;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = v43;
  *((void *)Bytes + 6) = v25;
  *((void *)Bytes + 10) = v38;
  *((void *)Bytes + 11) = a9;
  *((void *)Bytes + 12) = a10;
  long long v40 = *(_OWORD *)&a11->var0;
  *((void *)Bytes + 7) = v34;
  *((void *)Bytes + 8) = var1;
  *((void *)Bytes + 9) = v36;
  *(_OWORD *)(Bytes + 104) = v40;
  *((void *)Bytes + 15) = v39;
  *((void *)Bytes + 16) = a12;
  s();
  *(void *)uint64_t v41 = v42;
  *(unsigned char *)(v41 + 8) = BYTE8(v50);
  *(unsigned char *)(v49 + 15) |= 8u;
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v16 = a3;
  id v17 = a8;
  [v16 touch];
  if (v16)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v16];
    }
  }
  [v17 touch];
  if (v17)
  {
    uint64_t v19 = self->_retainedObjects;
    if (v19) {
      [(NSMutableSet *)v19 addObject:v17];
    }
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v47);
  baseObject = self->_baseObject;
  uint64_t v21 = [v16 baseObject];
  uint64_t v22 = [v17 baseObject];
  long long v45 = *(_OWORD *)&a7->var0;
  unint64_t var2 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v44 = *a11;
  unint64_t v42 = a5;
  unint64_t v23 = a5;
  unint64_t v24 = a6;
  [(MTLBlitCommandEncoderSPI *)baseObject copyFromBuffer:v21 sourceOffset:a4 sourceBytesPerRow:v23 sourceBytesPerImage:a6 sourceSize:&v45 toTexture:v22 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v44];

  uint64_t v25 = v48;
  *(_DWORD *)(v48 + 8) = -16381;
  uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 24);
  uint64_t v27 = BYTE10(v49);
  ++BYTE10(v49);
  Bytes = GTTraceMemPool_allocateBytes(v26, *((uint64_t *)&v48 + 1), v27 | 0x7000000000);
  *(unsigned char *)(v25 + 13) = v27;
  uint64_t v29 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v31 = (uint64_t *)[v16 traceStream];
  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0;
  }
  unint64_t v33 = a7->var0;
  unint64_t var1 = a7->var1;
  unint64_t v35 = a7->var2;
  unint64_t v36 = (uint64_t *)[v17 traceStream];
  if (v36) {
    uint64_t v37 = *v36;
  }
  else {
    uint64_t v37 = 0;
  }
  unint64_t v38 = a11->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v32;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = v42;
  *((void *)Bytes + 6) = v24;
  *((void *)Bytes + 10) = v37;
  *((void *)Bytes + 11) = a9;
  *((void *)Bytes + 12) = a10;
  long long v39 = *(_OWORD *)&a11->var0;
  *((void *)Bytes + 7) = v33;
  *((void *)Bytes + 8) = var1;
  *((void *)Bytes + 9) = v35;
  *(_OWORD *)(Bytes + 104) = v39;
  *((void *)Bytes + 15) = v38;
  s();
  *(void *)uint64_t v40 = v41;
  *(unsigned char *)(v40 + 8) = BYTE8(v49);
  *(unsigned char *)(v48 + 15) |= 8u;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLBlitCommandEncoderSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16384;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)id v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (NSString)label
{
  return (NSString *)[(MTLBlitCommandEncoderSPI *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLBlitCommandEncoderSPI *)baseObject conformsToProtocol:v4];

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLBlitCommandEncoder;
  uint64_t v3 = [(CaptureMTLBlitCommandEncoder *)&v7 description];
  id v4 = [(MTLBlitCommandEncoderSPI *)self->_baseObject description];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v17 = a3;
  [v17 touch];
  if (v17)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v17];
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v35);
  baseObject = self->_baseObject;
  long long v20 = [v17 baseObject];
  long long v21 = *(_OWORD *)&a6->var0.var2;
  v34[0] = *(_OWORD *)&a6->var0.var0;
  v34[1] = v21;
  v34[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLBlitCommandEncoderSPI fillTexture:level:slice:region:color:pixelFormat:](baseObject, "fillTexture:level:slice:region:color:pixelFormat:", v20, a4, a5, v34, a8, var0, var1, var2, var3);

  uint64_t v22 = v36;
  *(_DWORD *)(v36 + 8) = -15471;
  uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 24);
  uint64_t v24 = BYTE10(v37);
  ++BYTE10(v37);
  Bytes = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v36 + 1), v24 | 0x7800000000);
  *(unsigned char *)(v22 + 13) = v24;
  uint64_t v26 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0;
  }
  uint64_t v28 = (uint64_t *)[v17 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0;
  }
  *((void *)Bytes + 2) = v27;
  *((void *)Bytes + 3) = v29;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  long long v30 = *(_OWORD *)&a6->var0.var2;
  long long v31 = *(_OWORD *)&a6->var1.var1;
  *((_OWORD *)Bytes + 3) = *(_OWORD *)&a6->var0.var0;
  *((_OWORD *)Bytes + 4) = v30;
  *((_OWORD *)Bytes + 5) = v31;
  *((double *)Bytes + 12) = var0;
  *((double *)Bytes + 13) = var1;
  *((double *)Bytes + 14) = var2;
  *((double *)Bytes + 15) = var3;
  *((void *)Bytes + 16) = a8;
  s();
  *(void *)uint64_t v32 = v33;
  *(unsigned char *)(v32 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v15 = a3;
  [v15 touch];
  if (v15)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v15];
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
  baseObject = self->_baseObject;
  uint64_t v18 = [v15 baseObject];
  long long v19 = *(_OWORD *)&a6->var0.var2;
  v32[0] = *(_OWORD *)&a6->var0.var0;
  v32[1] = v19;
  v32[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLBlitCommandEncoderSPI fillTexture:level:slice:region:color:](baseObject, "fillTexture:level:slice:region:color:", v18, a4, a5, v32, var0, var1, var2, var3);

  uint64_t v20 = v34;
  *(_DWORD *)(v34 + 8) = -15472;
  uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 24);
  uint64_t v22 = BYTE10(v35);
  ++BYTE10(v35);
  Bytes = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v34 + 1), v22 | 0x7000000000);
  *(unsigned char *)(v20 + 13) = v22;
  uint64_t v24 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  uint64_t v26 = (uint64_t *)[v15 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  *((void *)Bytes + 2) = v25;
  *((void *)Bytes + 3) = v27;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  long long v28 = *(_OWORD *)&a6->var0.var2;
  long long v29 = *(_OWORD *)&a6->var1.var1;
  *((_OWORD *)Bytes + 3) = *(_OWORD *)&a6->var0.var0;
  *((_OWORD *)Bytes + 4) = v28;
  *((_OWORD *)Bytes + 5) = v29;
  *((double *)Bytes + 12) = var0;
  *((double *)Bytes + 13) = var1;
  *((double *)Bytes + 14) = var2;
  *((double *)Bytes + 15) = var3;
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v35);
  *(unsigned char *)(v34 + 15) |= 8u;
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  [v11 touch];
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v11];
    }
  }
  [v12 touch];
  if (v12)
  {
    id v14 = self->_retainedObjects;
    if (v14) {
      [(NSMutableSet *)v14 addObject:v12];
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v48);
  baseObject = self->_baseObject;
  size_t v16 = [v11 baseObject];
  id v17 = [v12 baseObject];
  -[MTLBlitCommandEncoderSPI resolveCounters:inRange:destinationBuffer:destinationOffset:](baseObject, "resolveCounters:inRange:destinationBuffer:destinationOffset:", v16, location, length, v17, a6);

  uint64_t v18 = v49;
  *(_DWORD *)(v49 + 8) = -15756;
  char v19 = BYTE9(v50);
  if (BYTE9(v50) > 8uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v48 + 1) + 24);
    uint64_t v22 = BYTE10(v50);
    ++BYTE10(v50);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v49 + 1), v22 | 0x3800000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v50));
    BYTE9(v50) += 56;
  }
  *(unsigned char *)(v18 + 13) = v19;
  uint64_t v23 = [(CaptureMTLBlitCommandEncoder *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v25 = (uint64_t *)[v11 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = (uint64_t *)[v12 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0;
  }
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = location;
  *((void *)v20 + 3) = length;
  *((void *)v20 + 4) = v28;
  *((void *)v20 + 5) = a6;
  p_captureCommandBuffer = &self->_captureCommandBuffer;
  *((void *)v20 + 6) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v31 = [WeakRetained isCapturing];

  if (v31)
  {
    uint64_t v32 = DEVICEOBJECT(v12);
    id v33 = [v32 length];
    uint64_t v34 = *(void *)(*((void *)&v48 + 1) + 24);
    uint64_t v35 = BYTE10(v50);
    ++BYTE10(v50);
    Bytes = GTTraceMemPool_allocateBytes(v34, *((uint64_t *)&v49 + 1), v35 | ((void)v33 << 32) | 0x100);
    v20[48] = Bytes[8];
    long long v37 = DEVICEOBJECT(self->_baseObject);
    unint64_t v38 = [v37 device];
    id v39 = [v38 newBufferWithLength:v33 options:0];
    [v37 copyFromBuffer:v32 sourceOffset:0 toBuffer:v39 destinationOffset:0 size:v33];
    id v40 = objc_loadWeakRetained((id *)p_captureCommandBuffer);
    uint64_t v41 = DEVICEOBJECT(v40);

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = __92__CaptureMTLBlitCommandEncoder_resolveCounters_inRange_destinationBuffer_destinationOffset___block_invoke;
    _OWORD v45[3] = &unk_2220F8;
    id v46 = v39;
    long long v47 = Bytes;
    id v42 = v39;
    [v41 addCompletedHandler:v45];
  }
  s();
  *(void *)uint64_t v43 = v44;
  *(unsigned char *)(v43 + 8) = BYTE8(v50);
  *(unsigned char *)(v49 + 15) |= 8u;
}

void *__92__CaptureMTLBlitCommandEncoder_resolveCounters_inRange_destinationBuffer_destinationOffset___block_invoke(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  if (v3) {
    unint64_t v5 = (void *)(v3 + 16);
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = [v2 contents];
  id v7 = [*(id *)(a1 + 32) length];

  return memcpy(v5, v6, (size_t)v7);
}

- (MTLBlitCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLBlitCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CaptureMTLBlitCommandEncoder;
  uint64_t v9 = [(CaptureMTLBlitCommandEncoder *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    id v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream((uint64_t)v13, (unint64_t)v14, *((void *)[v8 traceStream] + 3));

    uint64_t v15 = [v8 retainedObjects];
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = (NSMutableSet *)v15;

    id v17 = v10->_retainedObjects;
    uint64_t v18 = DEVICEOBJECT(v10->_baseObject);
    [(NSMutableSet *)v17 addObject:v18];
  }
  return v10;
}

@end