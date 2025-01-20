@interface CaptureMTLIndirectComputeCommand
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIndirectComputeCommand)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLIndirectComputeCommand)baseObject;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)clearBarrier;
- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dealloc;
- (void)reset;
- (void)setBarrier;
- (void)setComputePipelineState:(id)a3;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setStageInRegion:(id *)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)touch;
@end

@implementation CaptureMTLIndirectComputeCommand

- (void).cxx_destruct
{
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLIndirectComputeCommand *)self->_baseObject setThreadgroupMemoryLength:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15927;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  v12 = [(CaptureMTLIndirectComputeCommand *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setStageInRegion:(id *)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  long long v6 = *(_OWORD *)&a3->var0.var2;
  v18[0] = *(_OWORD *)&a3->var0.var0;
  v18[1] = v6;
  v18[2] = *(_OWORD *)&a3->var1.var1;
  [(MTLIndirectComputeCommand *)baseObject setStageInRegion:v18];
  uint64_t v7 = v20;
  *(_DWORD *)(v20 + 8) = -15926;
  char v8 = BYTE9(v21);
  if (BYTE9(v21) > 8uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v11 = BYTE10(v21);
    ++BYTE10(v21);
    v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v20 + 1), v11 | 0x3800000000) + 16;
    char v8 = v11;
  }
  else
  {
    v9 = (char *)(v7 + BYTE9(v21));
    BYTE9(v21) += 56;
  }
  *(unsigned char *)(v7 + 13) = v8;
  v12 = [(CaptureMTLIndirectComputeCommand *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v9 = var0;
  long long v14 = *(_OWORD *)&a3->var0.var2;
  long long v15 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v9 + 24) = v14;
  *(_OWORD *)(v9 + 40) = v15;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  id v11 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v25);
  baseObject = self->_baseObject;
  v13 = objc_msgSend(v11, "baseObject", (void)v25);
  [(MTLIndirectComputeCommand *)baseObject setKernelBuffer:v13 offset:a4 attributeStride:a5 atIndex:a6];

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15277;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  long long v19 = [(CaptureMTLIndirectComputeCommand *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = (uint64_t *)[v11 traceStream];

  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  id v11 = objc_msgSend(v9, "baseObject", (void)v23);
  [(MTLIndirectComputeCommand *)baseObject setKernelBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15933;
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
  uint64_t v17 = [(CaptureMTLIndirectComputeCommand *)self traceStream];
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

- (void)setComputePipelineState:(id)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  uint64_t v7 = objc_msgSend(v5, "baseObject", (void)v19);
  [(MTLIndirectComputeCommand *)baseObject setComputePipelineState:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15934;
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
  char v13 = [(CaptureMTLIndirectComputeCommand *)self traceStream];
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
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
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
  [(MTLIndirectComputeCommand *)self->_baseObject reset];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15905;
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
  uint64_t v8 = [(CaptureMTLIndirectComputeCommand *)self traceStream];
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

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15935;
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
  uint64_t v8 = [(CaptureMTLIndirectComputeCommand *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLIndirectComputeCommand;
  [(CaptureMTLIndirectComputeCommand *)&v12 dealloc];
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a4;
  [(MTLIndirectComputeCommand *)baseObject concurrentDispatchThreads:&v6 threadsPerThreadgroup:&v5];
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a4;
  [(MTLIndirectComputeCommand *)baseObject concurrentDispatchThreadgroups:&v21 threadsPerThreadgroup:&v20];
  uint64_t v8 = v23;
  *(_DWORD *)(v23 + 8) = -15931;
  char v9 = BYTE9(v24);
  if (BYTE9(v24) > 8uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v12 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v23 + 1), v12 | 0x3800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v24));
    BYTE9(v24) += 56;
  }
  *(unsigned char *)(v8 + 13) = v9;
  long long v13 = [(CaptureMTLIndirectComputeCommand *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = a3->var2;
  unint64_t v16 = a4->var2;
  *(void *)uint64_t v10 = var0;
  long long v17 = *(_OWORD *)&a4->var0;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&a3->var0;
  *((void *)v10 + 3) = var2;
  *((_OWORD *)v10 + 2) = v17;
  *((void *)v10 + 6) = v16;
  s();
  *(void *)uint64_t v18 = v19;
  *(unsigned char *)(v18 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
}

- (void)clearBarrier
{
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLIndirectComputeCommand *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLIndirectComputeCommand;
  uint64_t v3 = [(CaptureMTLIndirectComputeCommand *)&v7 description];
  char v4 = [(MTLIndirectComputeCommand *)self->_baseObject description];
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

- (MTLIndirectComputeCommand)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLIndirectComputeCommand)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLIndirectComputeCommand;
  uint64_t v8 = [(CaptureMTLIndirectComputeCommand *)&v12 init];
  char v9 = v8;
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