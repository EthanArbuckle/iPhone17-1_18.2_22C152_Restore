@interface CaptureMTLIOCommandQueue
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIOCommandQueue)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLIOCommandQueue)baseObject;
- (NSString)description;
- (NSString)label;
- (id)commandBuffer;
- (id)commandBufferWithUnretainedReferences;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)globalTraceObjectID;
- (unint64_t)streamReference;
- (void)barrier;
- (void)dealloc;
- (void)enqueueBarrier;
- (void)setLabel:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLIOCommandQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)enqueueBarrier
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIOCommandQueueSPI *)self->_baseObject enqueueBarrier];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15291;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLIOCommandQueue *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v5 = var0;
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
  *(_DWORD *)(v14 + 8) = -15332;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLIOCommandQueue *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLIOCommandQueue;
  [(CaptureMTLIOCommandQueue *)&v12 dealloc];
}

- (id)commandBufferWithUnretainedReferences
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  long long v23 = (unint64_t)traceContext;
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v5 = v4;
  uint64_t v6 = *v4;
  *char v4 = v7;
  *(void *)&long long v25 = v6;
  BYTE8(v25) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v25 + 9) = 16400;
  *(_DWORD *)((char *)&v25 + 11) = 0;
  HIBYTE(v25) = 0;
  v8 = [(MTLIOCommandQueueSPI *)self->_baseObject commandBufferWithUnretainedReferences];
  if (v8) {
    v9 = [[CaptureMTLIOCommandBuffer alloc] initWithBaseObject:v8 captureIOCommandQueue:self];
  }
  else {
    v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLIOCommandBuffer *)v9 traceStream]);
  uint64_t v10 = v24;
  *(_DWORD *)(v24 + 8) = -15306;
  char v11 = BYTE9(v25);
  if (BYTE9(v25) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v14 = BYTE10(v25);
    ++BYTE10(v25);
    objc_super v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v24 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    objc_super v12 = (char *)(v10 + BYTE9(v25));
    BYTE9(v25) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  long long v15 = [(CaptureMTLIOCommandQueue *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v17 = [(CaptureMTLIOCommandBuffer *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)objc_super v12 = var0;
  *((void *)v12 + 1) = v18;
  unsigned __int8 __src = [(CaptureMTLIOCommandBuffer *)v9 isCapturing];
  char v19 = GTTraceEncoder_storeBytes((uint64_t)&v23, &__src, 1uLL);
  uint64_t v20 = v24;
  *(unsigned char *)(v24 + 14) = v19;
  uint64_t *v5 = v25;
  *((unsigned char *)v5 + 8) = BYTE8(v25);
  *(unsigned char *)(v20 + 15) |= 8u;

  return v9;
}

- (id)commandBuffer
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  long long v23 = (unint64_t)traceContext;
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v5 = v4;
  uint64_t v6 = *v4;
  *char v4 = v7;
  *(void *)&long long v25 = v6;
  BYTE8(v25) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v25 + 9) = 16400;
  *(_DWORD *)((char *)&v25 + 11) = 0;
  HIBYTE(v25) = 0;
  v8 = [(MTLIOCommandQueueSPI *)self->_baseObject commandBuffer];
  if (v8) {
    v9 = [[CaptureMTLIOCommandBuffer alloc] initWithBaseObject:v8 captureIOCommandQueue:self];
  }
  else {
    v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLIOCommandBuffer *)v9 traceStream]);
  uint64_t v10 = v24;
  *(_DWORD *)(v24 + 8) = -15333;
  char v11 = BYTE9(v25);
  if (BYTE9(v25) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v14 = BYTE10(v25);
    ++BYTE10(v25);
    objc_super v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v24 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    objc_super v12 = (char *)(v10 + BYTE9(v25));
    BYTE9(v25) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  long long v15 = [(CaptureMTLIOCommandQueue *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v17 = [(CaptureMTLIOCommandBuffer *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)objc_super v12 = var0;
  *((void *)v12 + 1) = v18;
  unsigned __int8 __src = [(CaptureMTLIOCommandBuffer *)v9 isCapturing];
  char v19 = GTTraceEncoder_storeBytes((uint64_t)&v23, &__src, 1uLL);
  uint64_t v20 = v24;
  *(unsigned char *)(v24 + 14) = v19;
  uint64_t *v5 = v25;
  *((unsigned char *)v5 + 8) = BYTE8(v25);
  *(unsigned char *)(v20 + 15) |= 8u;

  return v9;
}

- (void)barrier
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIOCommandQueueSPI *)self->_baseObject barrier];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15334;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLIOCommandQueue *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (NSString)label
{
  return (NSString *)[(MTLIOCommandQueueSPI *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLIOCommandQueueSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLIOCommandQueue;
  uint64_t v3 = [(CaptureMTLIOCommandQueue *)&v7 description];
  char v4 = [(MTLIOCommandQueueSPI *)self->_baseObject description];
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

- (MTLIOCommandQueue)baseObject
{
  return self->_baseObject;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLIOCommandQueueSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15307;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    objc_super v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    objc_super v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLIOCommandQueue *)self traceStream];
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
  *(void *)objc_super v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (unint64_t)globalTraceObjectID
{
  return (unint64_t)[(MTLIOCommandQueueSPI *)self->_baseObject globalTraceObjectID];
}

- (CaptureMTLIOCommandQueue)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLIOCommandQueue;
  uint64_t v9 = [(CaptureMTLIOCommandQueue *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end