@interface CaptureMTLIOCommandBuffer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isCapturing;
- (BOOL)isCommited;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIOCommandBuffer)initWithBaseObject:(id)a3 captureIOCommandQueue:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLIOCommandBuffer)baseObject;
- (NSError)error;
- (NSMutableSet)retainedObjects;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (int64_t)status;
- (unint64_t)globalTraceObjectID;
- (unint64_t)streamReference;
- (void)_preCommitWithIndex:(unint64_t)a3;
- (void)addBarrier;
- (void)addCompletedHandler:(id)a3;
- (void)commit;
- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4;
- (void)dealloc;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)enqueue;
- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7;
- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setIsCommited:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)signalEvent:(id)a3 value:(unint64_t)a4;
- (void)touch;
- (void)tryCancel;
- (void)waitForEvent:(id)a3 value:(unint64_t)a4;
- (void)waitUntilCompleted;
@end

@implementation CaptureMTLIOCommandBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_storeStrong((id *)&self->_completedDispatchArray, 0);
  objc_storeStrong((id *)&self->_captureCommandQueue, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)setIsCommited:(BOOL)a3
{
  self->_isCommited = a3;
}

- (BOOL)isCommited
{
  return self->_isCommited;
}

- (BOOL)isCapturing
{
  return self->_isCapturing;
}

- (NSMutableSet)retainedObjects
{
  return self->_retainedObjects;
}

- (void)waitUntilCompleted
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIOCommandBufferSPI *)self->_baseObject waitUntilCompleted];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15335;
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
  v8 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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

- (void)tryCancel
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIOCommandBufferSPI *)self->_baseObject tryCancel];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15336;
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
  v8 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLIOCommandBufferSPI *)self->_baseObject pushDebugGroup:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15292;
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
  uint64_t v10 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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
  [(MTLIOCommandBufferSPI *)self->_baseObject popDebugGroup];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15293;
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
  uint64_t v8 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  traceContext = self->_traceContext;
  id v17 = a10;
  id v18 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v47);
  baseObject = self->_baseObject;
  long long v20 = [v18 baseObject];
  v40 = v17;
  long long v21 = [v17 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v46 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v45 = *a9;
  unint64_t v41 = a4;
  unint64_t v42 = a7;
  [(MTLIOCommandBufferSPI *)baseObject loadTexture:v20 slice:a4 level:a5 size:&v46 sourceBytesPerRow:a7 sourceBytesPerImage:a8 destinationOrigin:&v45 sourceHandle:v21 sourceHandleOffset:a11];

  uint64_t v22 = v48;
  *(_DWORD *)(v48 + 8) = -15310;
  uint64_t v23 = *(void *)(*((void *)&v47 + 1) + 24);
  uint64_t v24 = BYTE10(v49);
  ++BYTE10(v49);
  Bytes = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v48 + 1), v24 | 0x7000000000);
  *(unsigned char *)(v22 + 13) = v24;
  v26 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v27 = (uint64_t *)[v18 traceStream];

  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0;
  }
  unint64_t v29 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t var2 = a6->var2;
  unint64_t v32 = a9->var0;
  unint64_t v33 = a9->var1;
  unint64_t v34 = a9->var2;
  v35 = (uint64_t *)[v40 traceStream];

  if (v35) {
    uint64_t v36 = *v35;
  }
  else {
    uint64_t v36 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v28;
  *((void *)Bytes + 4) = v41;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v29;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = var2;
  *((void *)Bytes + 9) = v42;
  *((void *)Bytes + 10) = a8;
  *((void *)Bytes + 11) = v32;
  *((void *)Bytes + 12) = v33;
  *((void *)Bytes + 13) = v34;
  *((void *)Bytes + 14) = v36;
  *((void *)Bytes + 15) = a11;
  s();
  *(void *)uint64_t v37 = v38;
  *(unsigned char *)(v37 + 8) = BYTE8(v49);
  *(unsigned char *)(v48 + 15) |= 8u;
}

- (void)enqueue
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIOCommandBufferSPI *)self->_baseObject enqueue];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15312;
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
  uint64_t v8 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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

- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = objc_msgSend(v7, "baseObject", (void)v21);
  [(MTLIOCommandBufferSPI *)baseObject copyStatusToBuffer:v9 offset:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15342;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    long long v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    long long v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  id v15 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v17 = (uint64_t *)[v7 traceStream];

  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)long long v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)addBarrier
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIOCommandBufferSPI *)self->_baseObject addBarrier];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15295;
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
  uint64_t v8 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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

- (int64_t)status
{
  return (int64_t)[(MTLIOCommandBufferSPI *)self->_baseObject status];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLIOCommandBufferSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLIOCommandBuffer;
  uint64_t v3 = [(CaptureMTLIOCommandBuffer *)&v7 description];
  char v4 = [(MTLIOCommandBufferSPI *)self->_baseObject description];
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

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a3;
  long long v14 = (unint64_t *)[v13 traceStream];
  if (v14)
  {
    unint64_t v15 = atomic_load(v14 + 7);
    unint64_t v16 = v15;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)v14 + 7, &v16, v15 | 2);
      BOOL v17 = v16 == v15;
      unint64_t v15 = v16;
    }
    while (!v17);
  }
  uint64_t v18 = (unint64_t *)[v13 traceStream];
  if (v18)
  {
    unint64_t v19 = atomic_load(v18 + 7);
    unint64_t v20 = v19;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)v18 + 7, &v20, v19 | 8);
      BOOL v17 = v20 == v19;
      unint64_t v19 = v20;
    }
    while (!v17);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v36);
  baseObject = self->_baseObject;
  long long v22 = [v13 baseObject];
  long long v23 = [v12 baseObject];
  [(MTLIOCommandBufferSPI *)baseObject loadBuffer:v22 offset:a4 size:a5 sourceHandle:v23 sourceHandleOffset:a7];

  uint64_t v24 = v37;
  *(_DWORD *)(v37 + 8) = -15311;
  char v25 = BYTE9(v38);
  if (BYTE9(v38) > 0x10uLL)
  {
    uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 24);
    uint64_t v28 = BYTE10(v38);
    ++BYTE10(v38);
    v26 = GTTraceMemPool_allocateBytes(v27, *((uint64_t *)&v37 + 1), v28 | 0x3000000000) + 16;
    char v25 = v28;
  }
  else
  {
    v26 = (char *)(v24 + BYTE9(v38));
    BYTE9(v38) += 48;
  }
  *(unsigned char *)(v24 + 13) = v25;
  unint64_t v29 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v31 = [v13 traceStream];

  if (v31) {
    v31 = (void *)*v31;
  }
  unint64_t v32 = (uint64_t *)[v12 traceStream];

  if (v32) {
    uint64_t v33 = *v32;
  }
  else {
    uint64_t v33 = 0;
  }
  *(void *)v26 = var0;
  *((void *)v26 + 1) = v31;
  *((void *)v26 + 2) = a4;
  *((void *)v26 + 3) = a5;
  *((void *)v26 + 4) = v33;
  *((void *)v26 + 5) = a7;
  s();
  *(void *)uint64_t v34 = v35;
  *(unsigned char *)(v34 + 8) = BYTE8(v38);
  *(unsigned char *)(v37 + 15) |= 8u;
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v11 = a5;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  id v13 = objc_msgSend(v11, "baseObject", (void)v26);
  [(MTLIOCommandBufferSPI *)baseObject loadBytes:a3 size:a4 sourceHandle:v13 sourceHandleOffset:a6];

  uint64_t v14 = v27;
  *(_DWORD *)(v27 + 8) = -15294;
  char v15 = BYTE9(v28);
  if (BYTE9(v28) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v18 = BYTE10(v28);
    ++BYTE10(v28);
    unint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v27 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    unint64_t v16 = (char *)(v14 + BYTE9(v28));
    BYTE9(v28) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  unint64_t v19 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v23 = GTTraceEncoder_storeBlob((uint64_t)&v26, a3, a4);
  }
  else {
    char v23 = 0;
  }
  *(void *)unint64_t v16 = var0;
  *((void *)v16 + 1) = a4;
  *((void *)v16 + 2) = v22;
  *((void *)v16 + 3) = a6;
  v16[32] = v23;
  *(_DWORD *)(v16 + 33) = 0;
  *((_DWORD *)v16 + 9) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLIOCommandBufferSPI *)baseObject encodeWaitForEvent:v9 value:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15339;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLIOCommandBufferSPI *)baseObject encodeSignalEvent:v9 value:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15340;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLIOCommandBufferSPI *)baseObject signalEvent:v9 value:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15309;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLIOCommandBufferSPI *)baseObject waitForEvent:v9 value:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15308;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLIOCommandBufferSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15313;
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
  uint64_t v10 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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

- (NSString)label
{
  return (NSString *)[(MTLIOCommandBufferSPI *)self->_baseObject label];
}

- (NSError)error
{
  return (NSError *)[(MTLIOCommandBufferSPI *)self->_baseObject error];
}

- (unint64_t)globalTraceObjectID
{
  return (unint64_t)[(MTLIOCommandBufferSPI *)self->_baseObject globalTraceObjectID];
}

- (void)commit
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(CaptureMTLIOCommandBuffer *)self _preCommitWithIndex:*(void *)v13];
  [(MTLIOCommandBufferSPI *)self->_baseObject commit];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15343;
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
  uint64_t v8 = [(CaptureMTLIOCommandBuffer *)self traceStream];
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

- (void)_preCommitWithIndex:(unint64_t)a3
{
  completedDispatchArray = self->_completedDispatchArray;
  if (completedDispatchArray)
  {
    uint64_t v6 = completedDispatchArray;
    uint64_t v7 = self->_completedDispatchArray;
    self->_completedDispatchArray = 0;

    uint64_t v8 = self;
    baseObject = v8->_baseObject;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __49__CaptureMTLIOCommandBuffer__preCommitWithIndex___block_invoke;
    v12[3] = &unk_221C70;
    long long v14 = v8;
    unint64_t v15 = a3;
    long long v13 = v6;
    uint64_t v10 = v8;
    uint64_t v11 = v6;
    [(MTLIOCommandBufferSPI *)baseObject addCompletedHandler:v12];
  }
}

void __49__CaptureMTLIOCommandBuffer__preCommitWithIndex___block_invoke(uint64_t a1)
{
  s();
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  void *v2 = v5;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  *uint64_t v3 = v4;
}

- (void)addCompletedHandler:(id)a3
{
  id v4 = a3;
  completedDispatchArray = self->_completedDispatchArray;
  if (!completedDispatchArray)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_completedDispatchArray;
    self->_completedDispatchArray = v6;

    completedDispatchArray = self->_completedDispatchArray;
  }
  id v8 = objc_retainBlock(v4);
  [(NSMutableArray *)completedDispatchArray addObject:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -15345;
  char v10 = BYTE9(v20);
  if (BYTE9(v20) > 0x30uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v13 = BYTE10(v20);
    ++BYTE10(v20);
    long long v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v19 + 1), v13 | 0x1000000000) + 16;
    char v10 = v13;
  }
  else
  {
    long long v11 = (char *)(v9 + BYTE9(v20));
    BYTE9(v20) += 16;
  }
  *(unsigned char *)(v9 + 13) = v10;
  long long v14 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)long long v11 = var0;
  *((void *)v11 + 1) = v4;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
}

- (void)dealloc
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
  s();
  id v4 = v3;
  uint64_t v5 = *v3;
  *uint64_t v3 = v6;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = self->_completedDispatchArray;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * i) + 16))();
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v9);
  }

  *id v4 = v5;
  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15341;
  char v13 = BYTE9(v26);
  if (BYTE9(v26) > 0x38uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v16 = BYTE10(v26);
    ++BYTE10(v26);
    long long v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v25 + 1), v16 | 0x800000000) + 16;
    char v13 = v16;
  }
  else
  {
    long long v14 = (char *)(v12 + BYTE9(v26));
    BYTE9(v26) += 8;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLIOCommandBuffer *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)long long v14 = var0;
  *id v4 = v26;
  *((unsigned char *)v4 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v19.receiver = self;
  v19.super_class = (Class)CaptureMTLIOCommandBuffer;
  [(CaptureMTLIOCommandBuffer *)&v19 dealloc];
}

- (MTLIOCommandBuffer)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLIOCommandBuffer)initWithBaseObject:(id)a3 captureIOCommandQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CaptureMTLIOCommandBuffer;
  id v9 = [(CaptureMTLIOCommandBuffer *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureCommandQueue, a4);
    objc_storeStrong((id *)&v10->_baseObject, a3);
    long long v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = v11;

    char v13 = [(CaptureMTLIOCommandQueue *)v10->_captureCommandQueue traceContext];
    v10->_traceContext = v13;
    long long v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v13, (unint64_t)v14, (unint64_t)v10);

    v10->_isCapturing = (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2;
  }

  return v10;
}

@end