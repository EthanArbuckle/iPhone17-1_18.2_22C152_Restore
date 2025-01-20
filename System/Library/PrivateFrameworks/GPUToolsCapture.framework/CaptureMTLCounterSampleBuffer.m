@interface CaptureMTLCounterSampleBuffer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLCounterSampleBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLCounterSampleBuffer)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (id)resolveCounterRange:(_NSRange)a3;
- (unint64_t)sampleCount;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)touch;
@end

@implementation CaptureMTLCounterSampleBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (id)resolveCounterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
    v6 = -[MTLCounterSampleBuffer resolveCounterRange:](self->_baseObject, "resolveCounterRange:", location, length);
    uint64_t v7 = v19;
    *(_DWORD *)(v19 + 8) = -15753;
    char v8 = BYTE9(v20);
    if (BYTE9(v20) > 0x20uLL)
    {
      uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 24);
      uint64_t v11 = BYTE10(v20);
      ++BYTE10(v20);
      v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v19 + 1), v11 | 0x2000000000) + 16;
      char v8 = v11;
    }
    else
    {
      v9 = (char *)(v7 + BYTE9(v20));
      BYTE9(v20) += 32;
    }
    *(unsigned char *)(v7 + 13) = v8;
    v12 = [(CaptureMTLCounterSampleBuffer *)self traceStream];
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    char v14 = SaveNSData((uint64_t)&v18, v6);
    *(void *)v9 = var0;
    *((void *)v9 + 1) = location;
    *((void *)v9 + 2) = length;
    v9[24] = v14;
    *(_DWORD *)(v9 + 25) = 0;
    *((_DWORD *)v9 + 7) = 0;
    s();
    *(void *)uint64_t v15 = v16;
    *(unsigned char *)(v15 + 8) = BYTE8(v20);
    *(unsigned char *)(v19 + 15) |= 8u;
  }
  else
  {
    v6 = -[MTLCounterSampleBuffer resolveCounterRange:](self->_baseObject, "resolveCounterRange:", a3.location, a3.length);
  }

  return v6;
}

- (unint64_t)sampleCount
{
  return (unint64_t)[(MTLCounterSampleBuffer *)self->_baseObject sampleCount];
}

- (NSString)label
{
  return (NSString *)[(MTLCounterSampleBuffer *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLCounterSampleBuffer *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLCounterSampleBuffer;
  v3 = [(CaptureMTLCounterSampleBuffer *)&v7 description];
  v4 = [(MTLCounterSampleBuffer *)self->_baseObject description];
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

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15867;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    unint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    unint64_t v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  char v8 = [(CaptureMTLCounterSampleBuffer *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLCounterSampleBuffer;
  [(CaptureMTLCounterSampleBuffer *)&v12 dealloc];
}

- (MTLCounterSampleBuffer)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLCounterSampleBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLCounterSampleBuffer;
  v9 = [(CaptureMTLCounterSampleBuffer *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    objc_super v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end