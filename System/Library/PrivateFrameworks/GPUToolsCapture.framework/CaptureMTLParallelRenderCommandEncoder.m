@interface CaptureMTLParallelRenderCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLCommandBuffer)commandBuffer;
- (CaptureMTLParallelRenderCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLParallelRenderCommandEncoder)baseObject;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (id)renderCommandEncoder;
- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setStencilStoreActionOptions:(unint64_t)a3;
- (void)touch;
@end

@implementation CaptureMTLParallelRenderCommandEncoder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_captureCommandBuffer);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject setStencilStoreActionOptions:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16026;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  v10 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject setStencilStoreAction:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16160;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  v10 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject setDepthStoreActionOptions:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16027;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  v10 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject setDepthStoreAction:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16161;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  v10 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject setColorStoreActionOptions:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16028;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject setColorStoreAction:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16162;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  return [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject sampledRenderCommandEncoderWithProgramInfoBuffer:a3 capacity:a4];
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject pushDebugGroup:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16283;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
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
  *(void *)uint64_t v7 = var0;
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
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject popDebugGroup];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16282;
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
  uint64_t v8 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
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

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject insertDebugSignpost:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16284;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
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
  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)endEncoding
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject endEncoding];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16285;
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
  uint64_t v8 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
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
  *(_DWORD *)(v14 + 8) = -16287;
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
  uint64_t v8 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLParallelRenderCommandEncoder;
  [(CaptureMTLParallelRenderCommandEncoder *)&v12 dealloc];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16288;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
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
  *(void *)uint64_t v7 = var0;
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
  return (NSString *)[(MTLParallelRenderCommandEncoderSPI *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLParallelRenderCommandEncoderSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLParallelRenderCommandEncoder;
  uint64_t v3 = [(CaptureMTLParallelRenderCommandEncoder *)&v7 description];
  id v4 = [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject description];
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

- (id)renderCommandEncoder
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  unint64_t v5 = v4;
  uint64_t v6 = *v4;
  *unint64_t v4 = v7;
  *(void *)&long long v28 = v6;
  BYTE8(v28) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  uint64_t v8 = [(MTLParallelRenderCommandEncoderSPI *)self->_baseObject renderCommandEncoder];
  if (v8) {
    uint64_t v9 = [[CaptureMTLRenderCommandEncoder alloc] initWithBaseObject:v8 captureParallelRenderCommandEncoder:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLRenderCommandEncoder *)v9 traceStream]);
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -16286;
  char v11 = BYTE9(v28);
  if (BYTE9(v28) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v14 = BYTE10(v28);
    ++BYTE10(v28);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v27 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v28));
    BYTE9(v28) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  id v15 = [(CaptureMTLParallelRenderCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLRenderCommandEncoder *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  traceStream = self->_traceStream;
  *(unsigned char *)(v27 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v20 = v27;
  long long v21 = *(_OWORD *)(v27 + 16);
  long long v23 = *(_OWORD *)(v27 + 32);
  long long v22 = *(_OWORD *)(v27 + 48);
  _OWORD *v24 = *(_OWORD *)v27;
  v24[1] = v21;
  v24[2] = v23;
  v24[3] = v22;
  *unint64_t v5 = v28;
  *((unsigned char *)v5 + 8) = BYTE8(v28);
  *(unsigned char *)(v20 + 15) |= 8u;

  return v9;
}

- (CaptureMTLParallelRenderCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CaptureMTLParallelRenderCommandEncoder;
  uint64_t v9 = [(CaptureMTLParallelRenderCommandEncoder *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    uint64_t v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    uint64_t v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream((uint64_t)v13, (unint64_t)v14, *((void *)[v8 traceStream] + 3));

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    id v15 = [v8 retainedObjects];
    size_t v16 = DEVICEOBJECT(v10->_baseObject);
    [v15 addObject:v16];
  }
  return v10;
}

- (CaptureMTLCommandBuffer)commandBuffer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);

  return (CaptureMTLCommandBuffer *)WeakRetained;
}

- (MTLParallelRenderCommandEncoder)baseObject
{
  return self->_baseObject;
}

@end