@interface CaptureMTLIndirectRenderCommand
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)hasBarrier;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIndirectRenderCommand)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLIndirectRenderCommand)baseObject;
- (NSString)description;
- (id)drawArguments;
- (id)drawIndexedArguments;
- (id)drawIndexedPatchesArguments;
- (id)drawMeshThreadgroupsArguments;
- (id)drawMeshThreadsArguments;
- (id)drawPatchesArguments;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)getTessellationFactorArguments;
- (id)originalObject;
- (unint64_t)getCommandType;
- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3;
- (unint64_t)getOptimizedStatus;
- (unint64_t)getPipelineStateUniqueIdentifier;
- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3;
- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)streamReference;
- (void)clearBarrier;
- (void)dealloc;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)getFragmentBufferAtIndex:(unint64_t)a3;
- (void)getVertexBufferAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setBarrier;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)touch;
@end

@implementation CaptureMTLIndirectRenderCommand

- (void).cxx_destruct
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  id v11 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v25);
  baseObject = self->_baseObject;
  v13 = objc_msgSend(v11, "baseObject", (void)v25);
  [(MTLIndirectRenderCommandSPI *)baseObject setVertexBuffer:v13 offset:a4 attributeStride:a5 atIndex:a6];

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15276;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  v19 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v21 = (uint64_t *)[v11 traceStream];

  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  *(void *)v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  id v11 = objc_msgSend(v9, "baseObject", (void)v23);
  [(MTLIndirectRenderCommandSPI *)baseObject setVertexBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15955;
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
  uint64_t v17 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v19 = (uint64_t *)[v9 traceStream];

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

- (void)setRenderPipelineState:(id)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  v7 = objc_msgSend(v5, "baseObject", (void)v19);
  [(MTLIndirectRenderCommandSPI *)baseObject setRenderPipelineState:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15956;
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
  char v13 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v5 traceStream];

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

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLIndirectRenderCommandSPI *)self->_baseObject setObjectThreadgroupMemoryLength:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15262;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    char v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    char v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = objc_msgSend(v9, "baseObject", (void)v23);
  [(MTLIndirectRenderCommandSPI *)baseObject setObjectBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15263;
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
  long long v17 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v9 traceStream];

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

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = objc_msgSend(v9, "baseObject", (void)v23);
  [(MTLIndirectRenderCommandSPI *)baseObject setMeshBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15264;
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
  long long v17 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v9 traceStream];

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

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = objc_msgSend(v9, "baseObject", (void)v23);
  [(MTLIndirectRenderCommandSPI *)baseObject setFragmentBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15954;
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
  long long v17 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v9 traceStream];

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

- (void)setBarrier
{
}

- (void)reset
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIndirectRenderCommandSPI *)self->_baseObject reset];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15906;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  char v8 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (BOOL)hasBarrier
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject hasBarrier];
}

- (void)getVertexBufferAtIndex:(unint64_t)a3
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject getVertexBufferAtIndex:a3];
}

- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getVertexBufferAddressAtIndex:a3];
}

- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getVertexAttributeStrideAtIndex:a3];
}

- (id)getTessellationFactorArguments
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject getTessellationFactorArguments];
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getPipelineStateUniqueIdentifier];
}

- (unint64_t)getOptimizedStatus
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getOptimizedStatus];
}

- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getObjectThreadgroupMemoryLengthAtIndex:a3];
}

- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getObjectBufferAddressAtIndex:a3];
}

- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getMeshBufferAddressAtIndex:a3];
}

- (void)getFragmentBufferAtIndex:(unint64_t)a3
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject getFragmentBufferAtIndex:a3];
}

- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getFragmentBufferAddressAtIndex:a3];
}

- (unint64_t)getCommandType
{
  return (unint64_t)[(MTLIndirectRenderCommandSPI *)self->_baseObject getCommandType];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  [(MTLIndirectRenderCommandSPI *)self->_baseObject drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6 baseInstance:a7];
  uint64_t v13 = v23;
  *(_DWORD *)(v23 + 8) = -15949;
  char v14 = BYTE9(v24);
  if (BYTE9(v24) > 0x10uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v17 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v23 + 1), v17 | 0x3000000000) + 16;
    char v14 = v17;
  }
  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v24));
    BYTE9(v24) += 48;
  }
  *(unsigned char *)(v13 + 13) = v14;
  long long v18 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v15 = var0;
  *((void *)v15 + 1) = a3;
  *((void *)v15 + 2) = a4;
  *((void *)v15 + 3) = a5;
  *((void *)v15 + 4) = a6;
  *((void *)v15 + 5) = a7;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
}

- (id)drawPatchesArguments
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject drawPatchesArguments];
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12
{
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  traceContext = self->_traceContext;
  id v17 = a10;
  id v18 = a6;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v37);
  baseObject = self->_baseObject;
  uint64_t v20 = [v18 baseObject];
  v36 = v17;
  uint64_t v21 = [v17 baseObject];
  [(MTLIndirectRenderCommandSPI *)baseObject drawPatches:a3 patchStart:a4 patchCount:a5 patchIndexBuffer:v20 patchIndexBufferOffset:a7 instanceCount:a8 baseInstance:a9 tessellationFactorBuffer:v21 tessellationFactorBufferOffset:a11 tessellationFactorBufferInstanceStride:a12];

  uint64_t v22 = v38;
  *(_DWORD *)(v38 + 8) = -15952;
  uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 24);
  uint64_t v24 = BYTE10(v39);
  ++BYTE10(v39);
  Bytes = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v38 + 1), v24 | 0x5800000000);
  *(unsigned char *)(v22 + 13) = v24;
  long long v26 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v28 = [v18 traceStream];

  if (v28) {
    v28 = (void *)*v28;
  }
  v29 = (uint64_t *)[v36 traceStream];

  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v28;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = a8;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = v30;
  *((void *)Bytes + 11) = a11;
  *((void *)Bytes + 12) = a12;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v39);
  *(unsigned char *)(v38 + 15) |= 8u;
}

- (id)drawMeshThreadsArguments
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject drawMeshThreadsArguments];
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a5;
  [(MTLIndirectRenderCommandSPI *)baseObject drawMeshThreads:&v25 threadsPerObjectThreadgroup:&v24 threadsPerMeshThreadgroup:&v23];
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -15265;
  uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 24);
  uint64_t v12 = BYTE10(v28);
  ++BYTE10(v28);
  Bytes = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v27 + 1), v12 | 0x5000000000);
  *(unsigned char *)(v10 + 13) = v12;
  char v14 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = a3->var2;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a5->var2;
  *((void *)Bytes + 2) = var0;
  long long v19 = *(_OWORD *)&a4->var0;
  long long v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = var2;
  *((_OWORD *)Bytes + 3) = v19;
  *((void *)Bytes + 8) = v17;
  *(_OWORD *)(Bytes + 72) = v20;
  *((void *)Bytes + 11) = v18;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (id)drawMeshThreadgroupsArguments
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject drawMeshThreadgroupsArguments];
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a5;
  [(MTLIndirectRenderCommandSPI *)baseObject drawMeshThreadgroups:&v25 threadsPerObjectThreadgroup:&v24 threadsPerMeshThreadgroup:&v23];
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -15266;
  uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 24);
  uint64_t v12 = BYTE10(v28);
  ++BYTE10(v28);
  Bytes = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v27 + 1), v12 | 0x5000000000);
  *(unsigned char *)(v10 + 13) = v12;
  char v14 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = a3->var2;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a5->var2;
  *((void *)Bytes + 2) = var0;
  long long v19 = *(_OWORD *)&a4->var0;
  long long v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = var2;
  *((_OWORD *)Bytes + 3) = v19;
  *((void *)Bytes + 8) = v17;
  *(_OWORD *)(Bytes + 72) = v20;
  *((void *)Bytes + 11) = v18;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  id v16 = a6;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v31);
  baseObject = self->_baseObject;
  unint64_t v18 = [v16 baseObject];
  unint64_t v30 = a8;
  [(MTLIndirectRenderCommandSPI *)baseObject drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v18 indexBufferOffset:a7 instanceCount:a8 baseVertex:a9 baseInstance:a10];

  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -15948;
  uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 24);
  uint64_t v21 = BYTE10(v33);
  ++BYTE10(v33);
  Bytes = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v32 + 1), v21 | 0x4800000000);
  *(unsigned char *)(v19 + 13) = v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = (uint64_t *)[v16 traceStream];

  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v26;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = v30;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  s();
  *(void *)uint64_t v27 = v28;
  *(unsigned char *)(v27 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;
}

- (id)drawIndexedPatchesArguments
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject drawIndexedPatchesArguments];
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  traceContext = self->_traceContext;
  id v19 = a12;
  id v20 = a8;
  id v21 = a6;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v44);
  baseObject = self->_baseObject;
  v42 = v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = [v21 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = [v20 baseObject];
  v43 = v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = [v19 baseObject];
  -[MTLIndirectRenderCommandSPI drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:](baseObject, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, v23, a9, a10, a11, v25, a13, a14);

  uint64_t v26 = v45;
  *(_DWORD *)(v45 + 8) = -15950;
  uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 24);
  uint64_t v28 = BYTE10(v46);
  ++BYTE10(v46);
  Bytes = GTTraceMemPool_allocateBytes(v27, *((uint64_t *)&v45 + 1), v28 | 0x6800000000);
  *(unsigned char *)(v26 + 13) = v28;
  unint64_t v30 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v32 = (uint64_t *)[v42 traceStream];

  if (v32) {
    uint64_t v33 = *v32;
  }
  else {
    uint64_t v33 = 0;
  }
  v34 = [v20 traceStream];

  if (v34) {
    v34 = (void *)*v34;
  }
  v35 = (uint64_t *)[v43 traceStream];

  if (v35) {
    uint64_t v36 = *v35;
  }
  else {
    uint64_t v36 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v33;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = v34;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  *((void *)Bytes + 11) = a11;
  *((void *)Bytes + 12) = v36;
  *((void *)Bytes + 13) = a13;
  *((void *)Bytes + 14) = a14;
  s();
  *(void *)uint64_t v37 = v38;
  *(unsigned char *)(v37 + 8) = BYTE8(v46);
  *(unsigned char *)(v45 + 15) |= 8u;
}

- (id)drawIndexedArguments
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject drawIndexedArguments];
}

- (id)drawArguments
{
  return [(MTLIndirectRenderCommandSPI *)self->_baseObject drawArguments];
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15957;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  char v8 = [(CaptureMTLIndirectRenderCommand *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLIndirectRenderCommand;
  [(CaptureMTLIndirectRenderCommand *)&v12 dealloc];
}

- (void)clearBarrier
{
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLIndirectRenderCommandSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLIndirectRenderCommand;
  uint64_t v3 = [(CaptureMTLIndirectRenderCommand *)&v7 description];
  char v4 = [(MTLIndirectRenderCommandSPI *)self->_baseObject description];
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

- (MTLIndirectRenderCommand)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLIndirectRenderCommand)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLIndirectRenderCommand;
  char v8 = [(CaptureMTLIndirectRenderCommand *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_baseObject, a3);
    v9->_traceContext = a4;
    uint64_t v10 = DEVICEOBJECT(v7);
    v9->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)a4, (unint64_t)v10, (unint64_t)v9);
  }
  return v9;
}

@end