@interface CaptureMTLDrawable
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLDrawable)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDrawable)baseObject;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)layer;
- (id)texture;
- (unint64_t)deviceRef;
- (unint64_t)streamReference;
- (void)addPresentScheduledHandler:(id)a3;
- (void)addPresentedHandler:(id)a3;
- (void)dealloc;
- (void)present;
- (void)presentAfterMinimumDuration:(double)a3;
- (void)presentAtTime:(double)a3;
- (void)touch;
@end

@implementation CaptureMTLDrawable

- (void).cxx_destruct
{
}

- (void)addPresentScheduledHandler:(id)a3
{
}

- (void)presentAfterMinimumDuration:(double)a3
{
  PresentTelemetry(self);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLDrawable *)self->_baseObject presentAfterMinimumDuration:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -7156;
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
  v10 = [(CaptureMTLDrawable *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((double *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  PresentTrigger(self, (uint64_t)&v14);
}

- (void)presentAtTime:(double)a3
{
  PresentTelemetry(self);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLDrawable *)self->_baseObject presentAtTime:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -7157;
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
  v10 = [(CaptureMTLDrawable *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((double *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  PresentTrigger(self, (uint64_t)&v14);
}

- (void)present
{
  PresentTelemetry(self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLDrawable *)self->_baseObject present];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -7158;
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
  uint64_t v8 = [(CaptureMTLDrawable *)self traceStream];
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
  PresentTrigger(self, (uint64_t)&v12);
}

- (void)addPresentedHandler:(id)a3
{
}

- (id)texture
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v20);
  id v3 = [(MTLDrawable *)self->_baseObject texture];
  char v4 = v3;
  uint64_t v5 = v3;
  if ((qword_2501C8 & 0x80000) != 0)
  {
    id v6 = v3;
    uint64_t v5 = v6;
    if (([v6 conformsToProtocol:&OBJC_PROTOCOL___CaptureMTLObject] & 1) == 0)
    {
      uint64_t v7 = v6;
      while ((objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v5 = [v7 performSelector:"baseObject"];

        uint64_t v7 = v5;
        if ([v5 conformsToProtocol:&OBJC_PROTOCOL___CaptureMTLObject]) {
          goto LABEL_8;
        }
      }
      uint64_t v5 = v7;
    }
LABEL_8:
  }
  uint64_t v8 = v21;
  *(_DWORD *)(v21 + 8) = -7167;
  char v9 = BYTE9(v22);
  if (BYTE9(v22) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v12 = BYTE10(v22);
    ++BYTE10(v22);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v21 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v22));
    BYTE9(v22) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  long long v13 = [(CaptureMTLDrawable *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v15 = (uint64_t *)[v5 traceStream];
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
  *(unsigned char *)(v17 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;

  return v4;
}

- (id)layer
{
  return [(MTLDrawable *)self->_baseObject layer];
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -7161;
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
  uint64_t v8 = [(CaptureMTLDrawable *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLDrawable;
  [(CaptureMTLDrawable *)&v12 dealloc];
}

- (NSString)description
{
  return (NSString *)[(MTLDrawable *)self->_baseObject description];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLDrawable *)baseObject conformsToProtocol:v4];

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

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (s_logUsingOsLog)
  {
    unsigned __int8 v5 = gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      ClassName = object_getClassName(self->_baseObject);
      *(_DWORD *)buf = 136315394;
      long long v13 = ClassName;
      __int16 v14 = 2080;
      Name = sel_getName(a3);
      _os_log_error_impl(&def_CFBEC, v5, OS_LOG_TYPE_ERROR, "warning: Uncaught selector, -[%s %s]", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = __stderrp;
    uint64_t v7 = object_getClassName(self->_baseObject);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"warning: Uncaught selector, -[%s %s]", v7, sel_getName(a3));
    id v8 = objc_claimAutoreleasedReturnValue();
    fprintf(v6, "%s\n", (const char *)[v8 UTF8String]);
  }
  baseObject = self->_baseObject;

  return baseObject;
}

- (unint64_t)deviceRef
{
  v2 = [(CaptureMTLDrawable *)self layer];
  uint64_t v3 = [v2 device];
  char v4 = (unint64_t *)[v3 traceStream];
  if (v4) {
    unint64_t v5 = *v4;
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
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

- (MTLDrawable)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLDrawable)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLDrawable;
  id v8 = [(CaptureMTLDrawable *)&v12 init];
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