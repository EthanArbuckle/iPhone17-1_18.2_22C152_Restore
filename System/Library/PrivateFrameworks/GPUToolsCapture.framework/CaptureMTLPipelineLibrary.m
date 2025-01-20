@interface CaptureMTLPipelineLibrary
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)disableRunTimeCompilation;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLPipelineLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLPipelineCache)functionCache;
- (MTLPipelineCache)pipelineCache;
- (MTLPipelineLibrary)baseObject;
- (NSArray)metallibPaths;
- (NSArray)pipelineNames;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)setDisableRunTimeCompilation:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLPipelineLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15742;
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
  v8 = [(CaptureMTLPipelineLibrary *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLPipelineLibrary;
  [(CaptureMTLPipelineLibrary *)&v12 dealloc];
}

- (NSArray)pipelineNames
{
  return (NSArray *)[(MTLPipelineLibrarySPI *)self->_baseObject pipelineNames];
}

- (MTLPipelineCache)pipelineCache
{
  return (MTLPipelineCache *)[(MTLPipelineLibrarySPI *)self->_baseObject pipelineCache];
}

- (NSArray)metallibPaths
{
  return (NSArray *)[(MTLPipelineLibrarySPI *)self->_baseObject metallibPaths];
}

- (NSString)label
{
  return (NSString *)[(MTLPipelineLibrarySPI *)self->_baseObject label];
}

- (MTLPipelineCache)functionCache
{
  return (MTLPipelineCache *)[(MTLPipelineLibrarySPI *)self->_baseObject functionCache];
}

- (BOOL)disableRunTimeCompilation
{
  return [(MTLPipelineLibrarySPI *)self->_baseObject disableRunTimeCompilation];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLPipelineLibrarySPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLPipelineLibrary;
  uint64_t v3 = [(CaptureMTLPipelineLibrary *)&v7 description];
  char v4 = [(MTLPipelineLibrarySPI *)self->_baseObject description];
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

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [(MTLPipelineLibrarySPI *)self->_baseObject setLabel:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15743;
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
  uint64_t v10 = [(CaptureMTLPipelineLibrary *)self traceStream];
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

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTLPipelineLibrarySPI setDisableRunTimeCompilation:](self->_baseObject, "setDisableRunTimeCompilation:");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15744;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    objc_super v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    objc_super v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLPipelineLibrary *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)objc_super v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  return [(MTLPipelineLibrarySPI *)self->_baseObject newRenderPipelineDescriptorWithName:a3 error:a4];
}

- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  return [(MTLPipelineLibrarySPI *)self->_baseObject newComputePipelineDescriptorWithName:a3 error:a4];
}

- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  baseObject = self->_baseObject;
  unint64_t v41 = a4;
  if (self->_isBaseObjectDebugDevice) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = 65539;
  }
  id v50 = 0;
  id v12 = [(MTLPipelineLibrarySPI *)baseObject newRenderPipelineStateWithName:v9 options:v11 reflection:&v50 error:a6];
  id v13 = v50;
  v44 = v12;
  if (v12) {
    v45 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v12 capturePipelineLibrary:self];
  }
  else {
    v45 = 0;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  traceContext = self->_traceContext;
  long long v47 = (unint64_t)traceContext;
  *(void *)&long long v48 = 0;
  *((void *)&v48 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  long long v16 = v15;
  uint64_t v17 = *v15;
  *long long v15 = v18;
  *(void *)&long long v49 = v17;
  BYTE8(v49) = *((unsigned char *)v15 + 8);
  *(_WORD *)((char *)&v49 + 9) = 16400;
  *(_DWORD *)((char *)&v49 + 11) = 0;
  HIBYTE(v49) = 0;
  GTTraceEncoder_setStream((uint64_t *)&v47, (uint64_t)[(CaptureMTLRenderPipelineState *)v45 traceStream]);
  uint64_t v19 = v48;
  *(_DWORD *)(v48 + 8) = -15738;
  char v20 = BYTE9(v49);
  if (BYTE9(v49) > 0x18uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 24);
    uint64_t v23 = BYTE10(v49);
    ++BYTE10(v49);
    long long v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v48 + 1), v23 | 0x2800000000) + 16;
    char v20 = v23;
  }
  else
  {
    long long v21 = (char *)(v19 + BYTE9(v49));
    BYTE9(v49) += 40;
  }
  *(unsigned char *)(v19 + 13) = v20;
  SaveMTLRenderPipelineReflection((uint64_t)&v47, v44, v13, 0);
  v24 = [(CaptureMTLPipelineLibrary *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v26 = [(CaptureMTLRenderPipelineState *)v45 traceStream];
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0;
  }
  v42 = v13;
  if (a6) {
    id v28 = *a6;
  }
  else {
    id v28 = 0;
  }
  v40 = a6;
  id v29 = v9;
  id v30 = [v29 UTF8String];
  if (v30)
  {
    id v31 = v29;
    unint64_t v32 = var0;
    id v33 = [v31 UTF8String];
    size_t v34 = strlen((const char *)[v31 UTF8String]);
    v35 = v33;
    unint64_t var0 = v32;
    LOBYTE(v30) = GTTraceEncoder_storeBytes((uint64_t)&v47, v35, v34 + 1);
  }
  *(void *)long long v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = v41;
  *((void *)v21 + 3) = v28;
  v21[32] = (char)v30;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  if (v41)
  {
    id v36 = v42;
    if (a5)
    {
      if ((~(_BYTE)v41 & 3) != 0 && !self->_isBaseObjectDebugDevice)
      {
        v37 = DEVICEOBJECT(self->_baseObject);
        id v46 = v42;
        id v38 = [v37 newRenderPipelineStateWithName:v29 options:v41 reflection:&v46 error:v40];
        id v36 = v46;
      }
      id v36 = v36;
      *a5 = v36;
    }
  }
  else
  {
    id v36 = v42;
  }
  *long long v16 = v49;
  *((unsigned char *)v16 + 8) = BYTE8(v49);
  *(unsigned char *)(v48 + 15) |= 8u;

  return v45;
}

- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  baseObject = self->_baseObject;
  unint64_t v41 = a4;
  if (self->_isBaseObjectDebugDevice) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = 65539;
  }
  id v50 = 0;
  id v12 = [(MTLPipelineLibrarySPI *)baseObject newComputePipelineStateWithName:v9 options:v11 reflection:&v50 error:a6];
  id v13 = v50;
  v44 = v12;
  if (v12) {
    v45 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v12 capturePipelineLibrary:self];
  }
  else {
    v45 = 0;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  traceContext = self->_traceContext;
  long long v47 = (unint64_t)traceContext;
  *(void *)&long long v48 = 0;
  *((void *)&v48 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  long long v16 = v15;
  uint64_t v17 = *v15;
  *long long v15 = v18;
  *(void *)&long long v49 = v17;
  BYTE8(v49) = *((unsigned char *)v15 + 8);
  *(_WORD *)((char *)&v49 + 9) = 16400;
  *(_DWORD *)((char *)&v49 + 11) = 0;
  HIBYTE(v49) = 0;
  GTTraceEncoder_setStream((uint64_t *)&v47, (uint64_t)[(CaptureMTLComputePipelineState *)v45 traceStream]);
  uint64_t v19 = v48;
  *(_DWORD *)(v48 + 8) = -15740;
  char v20 = BYTE9(v49);
  if (BYTE9(v49) > 0x18uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 24);
    uint64_t v23 = BYTE10(v49);
    ++BYTE10(v49);
    long long v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v48 + 1), v23 | 0x2800000000) + 16;
    char v20 = v23;
  }
  else
  {
    long long v21 = (char *)(v19 + BYTE9(v49));
    BYTE9(v49) += 40;
  }
  *(unsigned char *)(v19 + 13) = v20;
  SaveMTLComputePipelineReflection((uint64_t)&v47, v44, v13, 0, 0);
  v24 = [(CaptureMTLPipelineLibrary *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v26 = [(CaptureMTLComputePipelineState *)v45 traceStream];
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0;
  }
  v42 = v13;
  if (a6) {
    id v28 = *a6;
  }
  else {
    id v28 = 0;
  }
  v40 = a6;
  id v29 = v9;
  id v30 = [v29 UTF8String];
  if (v30)
  {
    id v31 = v29;
    unint64_t v32 = var0;
    id v33 = [v31 UTF8String];
    size_t v34 = strlen((const char *)[v31 UTF8String]);
    v35 = v33;
    unint64_t var0 = v32;
    LOBYTE(v30) = GTTraceEncoder_storeBytes((uint64_t)&v47, v35, v34 + 1);
  }
  *(void *)long long v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = v41;
  *((void *)v21 + 3) = v28;
  v21[32] = (char)v30;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  if (v41)
  {
    id v36 = v42;
    if (a5)
    {
      if ((~(_BYTE)v41 & 3) != 0 && !self->_isBaseObjectDebugDevice)
      {
        v37 = DEVICEOBJECT(self->_baseObject);
        id v46 = v42;
        id v38 = [v37 newComputePipelineStateWithName:v29 options:v41 reflection:&v46 error:v40];
        id v36 = v46;
      }
      id v36 = v36;
      *a5 = v36;
    }
  }
  else
  {
    id v36 = v42;
  }
  *long long v16 = v49;
  *((unsigned char *)v16 + 8) = BYTE8(v49);
  *(unsigned char *)(v48 + 15) |= 8u;

  return v45;
}

- (MTLPipelineLibrary)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLPipelineLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLPipelineLibrary;
  id v9 = [(CaptureMTLPipelineLibrary *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    unint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);

    NSClassFromString(@"MTLDebugPipelineLibrary");
    v10->_isBaseObjectDebugDevice = objc_opt_isKindOfClass() & 1;
  }

  return v10;
}

@end