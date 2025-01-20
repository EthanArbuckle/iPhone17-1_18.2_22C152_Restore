@interface CaptureMTLSharedEvent
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4;
- (CaptureMTLSharedEvent)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLSharedEvent)baseObject;
- (NSString)description;
- (NSString)label;
- (id)IOSurfaceSharedEvent;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newSharedEventHandle;
- (id)originalObject;
- (unint64_t)signaledValue;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5;
- (void)setLabel:(id)a3;
- (void)setSignaledValue:(unint64_t)a3;
- (void)touch;
@end

@implementation CaptureMTLSharedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseObject, 0);

  objc_storeStrong((id *)&self->_captureDevice, 0);
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15973;
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
  v8 = [(CaptureMTLSharedEvent *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLSharedEvent;
  [(CaptureMTLSharedEvent *)&v12 dealloc];
}

- (void)setSignaledValue:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLSharedEventSPI *)self->_baseObject setSignaledValue:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15975;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLSharedEvent *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (unint64_t)signaledValue
{
  return (unint64_t)[(MTLSharedEventSPI *)self->_baseObject signaledValue];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLSharedEventSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15974;
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
  uint64_t v10 = [(CaptureMTLSharedEvent *)self traceStream];
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
  return (NSString *)[(MTLSharedEventSPI *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (id)IOSurfaceSharedEvent
{
  return [(MTLSharedEventSPI *)self->_baseObject IOSurfaceSharedEvent];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLSharedEventSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLSharedEvent;
  uint64_t v3 = [(CaptureMTLSharedEvent *)&v7 description];
  id v4 = [(MTLSharedEventSPI *)self->_baseObject description];
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

- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4
{
  unint64_t v6 = a4 + 1000 * GT_ENV;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58__CaptureMTLSharedEvent_waitUntilSignaledValue_timeoutMS___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v6;
  if (waitUntilSignaledValue_timeoutMS__onceToken != -1) {
    dispatch_once(&waitUntilSignaledValue_timeoutMS__onceToken, block);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  unsigned int v7 = [(MTLSharedEventSPI *)self->_baseObject waitUntilSignaledValue:a3 timeoutMS:v6];
  uint64_t v8 = v19;
  *(_DWORD *)(v19 + 8) = -15422;
  char v9 = BYTE9(v20);
  if (BYTE9(v20) > 0x20uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v12 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v19 + 1), v12 | 0x2000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v20));
    BYTE9(v20) += 32;
  }
  *(unsigned char *)(v8 + 13) = v9;
  id v13 = [(CaptureMTLSharedEvent *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = a3;
  *((void *)v10 + 2) = v6;
  *((_DWORD *)v10 + 6) = v7;
  *((_DWORD *)v10 + 7) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
  return v7;
}

void __58__CaptureMTLSharedEvent_waitUntilSignaledValue_timeoutMS___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 134217984;
    uint64_t v4 = v2;
    _os_log_impl(&def_CFBEC, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "-[ waitUntilSignaledValue:timeoutMS:] timeout changed to %llu ms due to capture being loaded.", (uint8_t *)&v3, 0xCu);
  }
}

- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5
{
  id v8 = a5;
  char v9 = self;
  baseObject = v9->_baseObject;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __54__CaptureMTLSharedEvent_notifyListener_atValue_block___block_invoke;
  v13[3] = &unk_222278;
  id v14 = v9;
  id v15 = v8;
  unint64_t v16 = a4;
  uint64_t v11 = v9;
  id v12 = v8;
  [(MTLSharedEventSPI *)baseObject notifyListener:a3 atValue:a4 block:v13];
}

uint64_t __54__CaptureMTLSharedEvent_notifyListener_atValue_block___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (id)newSharedEventHandle
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  id v3 = [(MTLSharedEventSPI *)self->_baseObject newSharedEventHandle];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -15907;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    unint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    unint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  char v9 = [(CaptureMTLSharedEvent *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v6 = var0;
  *((void *)v6 + 1) = v3;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return v3;
}

- (MTLSharedEvent)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLSharedEvent)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLSharedEvent;
  char v9 = [(CaptureMTLSharedEvent *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureDevice, a4);
    objc_storeStrong((id *)&v10->_baseObject, a3);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    uint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end