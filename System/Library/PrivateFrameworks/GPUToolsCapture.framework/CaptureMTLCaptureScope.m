@interface CaptureMTLCaptureScope
- (CaptureMTLCaptureScope)initWithDevice:(id)a3 commandQueue:(id)a4 captureContext:(GTTraceContext *)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (unint64_t)streamReference;
- (void)beginScope;
- (void)dealloc;
- (void)endScope;
- (void)setLabel:(id)a3;
@end

@implementation CaptureMTLCaptureScope

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16072;
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
  v8 = [(CaptureMTLCaptureScope *)self traceStream];
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
  +[GTMTLCaptureScopeInfo removeScope:self];
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLCaptureScope;
  [(CaptureMTLCaptureScope *)&v12 dealloc];
}

- (void)setLabel:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CaptureMTLCaptureScope;
  [(CaptureMTLCaptureScope *)&v3 setLabel:a3];
  +[GTMTLCaptureScopeInfo updateAll];
}

- (void)endScope
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
  uint64_t v3 = v26;
  *(_DWORD *)(v26 + 8) = -16070;
  char v4 = BYTE9(v27);
  if (BYTE9(v27) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v7 = BYTE10(v27);
    ++BYTE10(v27);
    v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v26 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    v5 = (char *)(v3 + BYTE9(v27));
    BYTE9(v27) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLCaptureScope *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
  objc_super v12 = [(CaptureMTLCaptureScope *)self traceStream];
  if (v12) {
    unint64_t v13 = v12->var0;
  }
  else {
    unint64_t v13 = 0;
  }
  uint64_t v14 = *((void *)&v26 + 1);
  long long v15 = [(CaptureMTLCaptureScope *)self traceStream];
  if (v15) {
    unint64_t v16 = v15->var0;
  }
  else {
    unint64_t v16 = 0;
  }
  *(void *)&long long v18 = 0x200000002;
  *((void *)&v18 + 1) = v13;
  uint64_t v19 = v14;
  uint64_t v20 = 0;
  unint64_t v21 = v16;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  GTCaptureBoundaryTracker_handleTrigger(&v18);
  v17.receiver = self;
  v17.super_class = (Class)CaptureMTLCaptureScope;
  [(CaptureMTLCaptureScope *)&v17 endScope];
}

- (void)beginScope
{
  v52.receiver = self;
  v52.super_class = (Class)CaptureMTLCaptureScope;
  [(CaptureMTLCaptureScope *)&v52 beginScope];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v49);
  v48.receiver = self;
  v48.super_class = (Class)CaptureMTLCaptureScope;
  uint64_t v3 = [(CaptureMTLCaptureScope *)&v48 label];

  if (v3)
  {
    uint64_t v4 = v50;
    *(unsigned char *)(v50 + 15) |= 1u;
    *(_DWORD *)(v4 + 8) = -16073;
    char v5 = BYTE9(v51);
    if (BYTE9(v51) > 0x30uLL)
    {
      uint64_t v7 = *(void *)(*((void *)&v49 + 1) + 24);
      uint64_t v8 = BYTE10(v51);
      ++BYTE10(v51);
      uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v50 + 1), v8 | 0x1000000000) + 16;
      char v5 = v8;
    }
    else
    {
      uint64_t v6 = (char *)(v4 + BYTE9(v51));
      BYTE9(v51) += 16;
    }
    *(unsigned char *)(v4 + 13) = v5;
    v9 = [(CaptureMTLCaptureScope *)self traceStream];
    if (v9) {
      unint64_t var0 = v9->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v47.receiver = self;
    v47.super_class = (Class)CaptureMTLCaptureScope;
    id v11 = [(CaptureMTLCaptureScope *)&v47 label];
    if ([v11 UTF8String])
    {
      v46.receiver = self;
      v46.super_class = (Class)CaptureMTLCaptureScope;
      id v12 = [(CaptureMTLCaptureScope *)&v46 label];
      id v13 = [v12 UTF8String];
      v45.receiver = self;
      v45.super_class = (Class)CaptureMTLCaptureScope;
      id v14 = [(CaptureMTLCaptureScope *)&v45 label];
      size_t v15 = strlen((const char *)[v14 UTF8String]);
      char v16 = GTTraceEncoder_storeBytes((uint64_t)&v49, v13, v15 + 1);
      *(void *)uint64_t v6 = var0;
      v6[8] = v16;
      *(_DWORD *)(v6 + 9) = 0;
      *((_DWORD *)v6 + 3) = 0;
    }
    else
    {
      *(void *)uint64_t v6 = var0;
      *((void *)v6 + 1) = 0;
    }

    s();
    *(void *)uint64_t v17 = v18;
    *(unsigned char *)(v17 + 8) = BYTE8(v51);
    *(unsigned char *)(v50 + 15) |= 8u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v37);
    long long v49 = v37;
    long long v50 = v38;
    long long v51 = v39;
  }
  uint64_t v19 = v50;
  *(_DWORD *)(v50 + 8) = -16071;
  char v20 = BYTE9(v51);
  if (BYTE9(v51) > 0x38uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 24);
    uint64_t v23 = BYTE10(v51);
    ++BYTE10(v51);
    unint64_t v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v50 + 1), v23 | 0x800000000) + 16;
    char v20 = v23;
  }
  else
  {
    unint64_t v21 = (char *)(v19 + BYTE9(v51));
    BYTE9(v51) += 8;
  }
  *(unsigned char *)(v19 + 13) = v20;
  long long v24 = [(CaptureMTLCaptureScope *)self traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  *(void *)unint64_t v21 = v25;
  long long v26 = [(CaptureMTLCaptureScope *)self traceStream];
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0;
  }
  unint64_t v28 = *((void *)&v50 + 1);
  v29 = [(CaptureMTLCaptureScope *)self traceStream];
  if (v29) {
    unint64_t v30 = v29->var0;
  }
  else {
    unint64_t v30 = 0;
  }
  v31 = (uint64_t *)[*(id *)&self->MTLCaptureScope_opaque[OBJC_IVAR___MTLCaptureScope__device] traceStream];
  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0;
  }
  v33 = (uint64_t *)[*(id *)&self->MTLCaptureScope_opaque[OBJC_IVAR___MTLCaptureScope__commandQueue] traceStream];
  if (v33) {
    uint64_t v34 = *v33;
  }
  else {
    uint64_t v34 = 0;
  }
  *(void *)&long long v37 = 0x100000002;
  *((void *)&v37 + 1) = v27;
  long long v38 = v28;
  *(void *)&long long v39 = v30;
  *((void *)&v39 + 1) = v32;
  uint64_t v40 = 0;
  uint64_t v41 = v34;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  GTCaptureBoundaryTracker_handleTrigger(&v37);
  s();
  *(void *)uint64_t v35 = v36;
  *(unsigned char *)(v35 + 8) = BYTE8(v51);
  *(unsigned char *)(v50 + 15) |= 8u;
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

- (CaptureMTLCaptureScope)initWithDevice:(id)a3 commandQueue:(id)a4 captureContext:(GTTraceContext *)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CaptureMTLCaptureScope;
  uint64_t v10 = [(CaptureMTLCaptureScope *)&v16 initWithDevice:v8 commandQueue:v9];
  id v11 = v10;
  if (v10)
  {
    v10->_traceContext = a5;
    id v13 = v11;
    while ((objc_opt_respondsToSelector() & 1) != 0)
      id v13 = (CaptureMTLCaptureScope *)[(CaptureMTLCaptureScope *)v13 performSelector:"baseObject"];
    id v14 = v13;
    v11->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)a5, (unint64_t)v13, (unint64_t)v11);

    +[GTMTLCaptureScopeInfo addScope:v11];
  }

  return v11;
}

@end