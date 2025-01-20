@interface CaptureMTLFunctionPrivateArgument
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLFunctionPrivateArgument)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLFunctionPrivateArgumentSPI)baseObject;
- (NSString)name;
- (NSString)qualifier;
- (NSString)typeName;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)touch;
@end

@implementation CaptureMTLFunctionPrivateArgument

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
  *(_DWORD *)(v14 + 8) = -15494;
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
  v8 = [(CaptureMTLFunctionPrivateArgument *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLFunctionPrivateArgument;
  [(CaptureMTLFunctionPrivateArgument *)&v12 dealloc];
}

- (NSString)typeName
{
  return (NSString *)[(MTLFunctionPrivateArgumentSPI *)self->_baseObject typeName];
}

- (NSString)qualifier
{
  return (NSString *)[(MTLFunctionPrivateArgumentSPI *)self->_baseObject qualifier];
}

- (NSString)name
{
  return (NSString *)[(MTLFunctionPrivateArgumentSPI *)self->_baseObject name];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLFunctionPrivateArgumentSPI *)baseObject conformsToProtocol:v4];

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

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)CaptureMTLFunctionPrivateArgument;
  v2 = [(CaptureMTLFunctionPrivateArgument *)&v5 description];
  uint64_t v3 = +[NSString stringWithFormat:@"%@", v2];

  return v3;
}

- (MTLFunctionPrivateArgumentSPI)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLFunctionPrivateArgument)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLFunctionPrivateArgument;
  v8 = [(CaptureMTLFunctionPrivateArgument *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_baseObject, a3);
    v9->_traceContext = a4;
    uint64_t v10 = DEVICEOBJECT(v9->_baseObject);
    v9->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)a4, (unint64_t)v10, (unint64_t)v9);
  }
  return v9;
}

@end