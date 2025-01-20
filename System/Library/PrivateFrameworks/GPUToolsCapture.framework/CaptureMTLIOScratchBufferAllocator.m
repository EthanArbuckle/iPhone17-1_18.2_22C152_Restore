@interface CaptureMTLIOScratchBufferAllocator
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIOScratchBufferAllocator)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLIOScratchBufferAllocator)baseObject;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newScratchBufferWithMinimumSize:(unint64_t)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)touch;
@end

@implementation CaptureMTLIOScratchBufferAllocator

- (void).cxx_destruct
{
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15329;
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
  v8 = [(CaptureMTLIOScratchBufferAllocator *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLIOScratchBufferAllocator;
  [(CaptureMTLIOScratchBufferAllocator *)&v12 dealloc];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLIOScratchBufferAllocator *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLIOScratchBufferAllocator;
  uint64_t v3 = [(CaptureMTLIOScratchBufferAllocator *)&v7 description];
  char v4 = [(MTLIOScratchBufferAllocator *)self->_baseObject description];
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

- (id)newScratchBufferWithMinimumSize:(unint64_t)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  objc_super v7 = v6;
  uint64_t v8 = *v6;
  *BOOL v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  id v10 = -[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:](self->_baseObject, "newScratchBufferWithMinimumSize:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLIOScratchBuffer alloc] initWithBaseObject:v10 captureContext:self->_traceContext captureBuffer:0];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLIOScratchBuffer *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -15299;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    long long v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    long long v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  v17 = [(CaptureMTLIOScratchBufferAllocator *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v19 = [(CaptureMTLIOScratchBuffer *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)long long v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a3;
  *objc_super v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (MTLIOScratchBufferAllocator)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLIOScratchBufferAllocator)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLIOScratchBufferAllocator;
  uint64_t v8 = [(CaptureMTLIOScratchBufferAllocator *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_baseObject, a3);
    v9->_traceContext = a4;
    id v10 = DEVICEOBJECT(v7);
    v9->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)a4, (unint64_t)v10, (unint64_t)v9);
  }
  return v9;
}

@end