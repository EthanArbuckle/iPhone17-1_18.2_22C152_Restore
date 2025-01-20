@interface CaptureMTLBuffer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureBuffer:(id)a4;
- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureHeap:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)baseObject;
- (MTLDevice)device;
- (MTLHeap)heap;
- (NSString)description;
- (NSString)label;
- (__IOSurface)_aneIOSurface;
- (__IOSurface)iosurface;
- (id)_quicklookData;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuAddress;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)length;
- (unint64_t)parentGPUAddress;
- (unint64_t)parentGPUSize;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (void)addDebugMarker:(id)a3 range:(_NSRange)a4;
- (void)contents;
- (void)dealloc;
- (void)didModifyRange:(_NSRange)a3;
- (void)makeAliasable;
- (void)removeAllDebugMarkers;
- (void)setLabel:(id)a3;
- (void)setParentGPUAddress:(unint64_t)a3;
- (void)setParentGPUSize:(unint64_t)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureRemoteStorageBuffer, 0);
  objc_storeStrong((id *)&self->_captureHeap, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (id)_quicklookData
{
  return GTMTLQL_EncodeBuffer((uint64_t)self->_traceContext, self);
}

- (void)waitUntilComplete
{
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  id v5 = [(MTLBufferSPI *)self->_baseObject setPurgeableState:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16367;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLBuffer *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (void)removeAllDebugMarkers
{
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  id v9 = a3;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v30 = v12;
  BYTE8(v30) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  id v14 = [(MTLBufferSPI *)self->_baseObject newTextureWithDescriptor:v9 offset:a4 bytesPerRow:a5];
  v15 = [(MTLDevice *)self->_captureDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:v14 withDescriptor:v9];

  if (v14) {
    long long v16 = [[CaptureMTLTexture alloc] initWithBaseObject:v14 captureBuffer:self];
  }
  else {
    long long v16 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLTexture *)v16 traceStream]);
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -16368;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x18uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x2800000000) + 16;
    char v18 = v21;
  }
  else
  {
    v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 40;
  }
  *(unsigned char *)(v17 + 13) = v18;
  SaveMTLTextureInfo((uint64_t)&v28, v14);
  v22 = [(CaptureMTLBuffer *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v24 = [(CaptureMTLTexture *)v16 traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  char v26 = SaveMTLTextureDescriptor((uint64_t)&v28, v15);
  *(void *)v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = a5;
  v19[32] = v26;
  *(_DWORD *)(v19 + 33) = 0;
  *((_DWORD *)v19 + 9) = 0;
  uint64_t *v11 = v30;
  *((unsigned char *)v11 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;

  return v16;
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  traceContext = self->_traceContext;
  id v11 = a3;
  long long v35 = (unint64_t)traceContext;
  *(void *)&long long v36 = 0;
  *((void *)&v36 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  *uint64_t v12 = v15;
  *(void *)&long long v37 = v14;
  BYTE8(v37) = *((unsigned char *)v12 + 8);
  *(_WORD *)((char *)&v37 + 9) = 16400;
  *(_DWORD *)((char *)&v37 + 11) = 0;
  HIBYTE(v37) = 0;
  id v16 = [(MTLBufferSPI *)self->_baseObject newLinearTextureWithDescriptor:v11 offset:a4 bytesPerRow:a5 bytesPerImage:a6];
  uint64_t v17 = [(MTLDevice *)self->_captureDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:v16 withDescriptor:v11];

  if (v16) {
    char v18 = [[CaptureMTLTexture alloc] initWithBaseObject:v16 captureBuffer:self];
  }
  else {
    char v18 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v35, (uint64_t)[(CaptureMTLTexture *)v18 traceStream]);
  uint64_t v19 = v36;
  *(_DWORD *)(v36 + 8) = -16098;
  char v20 = BYTE9(v37);
  if (BYTE9(v37) > 0x10uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 24);
    v34 = v18;
    v23 = v17;
    unint64_t v24 = a4;
    unint64_t v25 = a5;
    unint64_t v26 = a6;
    uint64_t v27 = BYTE10(v37);
    ++BYTE10(v37);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v36 + 1), v27 | 0x3000000000) + 16;
    char v20 = v27;
    a6 = v26;
    a5 = v25;
    a4 = v24;
    uint64_t v17 = v23;
    char v18 = v34;
  }
  else
  {
    uint64_t v21 = (char *)(v19 + BYTE9(v37));
    BYTE9(v37) += 48;
  }
  *(unsigned char *)(v19 + 13) = v20;
  SaveMTLTextureInfo((uint64_t)&v35, v16);
  long long v28 = [(CaptureMTLBuffer *)self traceStream];
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v30 = [(CaptureMTLTexture *)v18 traceStream];
  if (v30) {
    unint64_t v31 = v30->var0;
  }
  else {
    unint64_t v31 = 0;
  }
  char v32 = SaveMTLTextureDescriptor((uint64_t)&v35, v17);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v31;
  *((void *)v21 + 2) = a4;
  *((void *)v21 + 3) = a5;
  *((void *)v21 + 4) = a6;
  v21[40] = v32;
  *(_DWORD *)(v21 + 41) = 0;
  *((_DWORD *)v21 + 11) = 0;
  *uint64_t v13 = v37;
  *((unsigned char *)v13 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;

  return v18;
}

- (void)makeAliasable
{
  if (!qword_2501C0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
    [(MTLBufferSPI *)self->_baseObject makeAliasable];
    [(MTLHeap *)self->_captureHeap usedSize];
    [(MTLHeap *)self->_captureHeap currentAllocatedSize];
    uint64_t v3 = v13;
    *(_DWORD *)(v13 + 8) = -16122;
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
    v8 = [(CaptureMTLBuffer *)self traceStream];
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
}

- (BOOL)isPurgeable
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  unsigned int v3 = [(MTLBufferSPI *)self->_baseObject isPurgeable];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16366;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    uint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  id v9 = [(CaptureMTLBuffer *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return v3;
}

- (BOOL)isComplete
{
  return [(MTLBufferSPI *)self->_baseObject isComplete];
}

- (BOOL)isAliasable
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  unsigned int v3 = [(MTLBufferSPI *)self->_baseObject isAliasable];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16113;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    uint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  id v9 = [(CaptureMTLBuffer *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return v3;
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  uint64_t v4 = [a3 baseObject];
  LOBYTE(baseObject) = [(MTLBufferSPI *)baseObject doesAliasResource:v4];

  return (char)baseObject;
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    id v9 = v8;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (void *)*a3++;
      *(void *)id v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLBufferSPI *)baseObject doesAliasAnyResources:v8 count:a4];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    id v9 = v8;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (void *)*a3++;
      *(void *)id v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLBufferSPI *)baseObject doesAliasAllResources:v8 count:a4];
}

- (void)didModifyRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
    -[MTLBufferSPI didModifyRange:](self->_baseObject, "didModifyRange:", location, length);
    uint64_t v6 = v17;
    *(_DWORD *)(v17 + 8) = -16208;
    char v7 = BYTE9(v18);
    if (BYTE9(v18) > 0x28uLL)
    {
      uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
      uint64_t v11 = BYTE10(v18);
      ++BYTE10(v18);
      uint64_t v8 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
      char v7 = v11;
    }
    else
    {
      uint64_t v8 = (char *)(v6 + BYTE9(v18));
      BYTE9(v18) += 24;
    }
    *(unsigned char *)(v6 + 13) = v7;
    uint64_t v12 = [(CaptureMTLBuffer *)self traceStream];
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    *(void *)uint64_t v8 = var0;
    *((void *)v8 + 1) = location;
    *((void *)v8 + 2) = length;
    s();
    *(void *)uint64_t v14 = v15;
    *(unsigned char *)(v14 + 8) = BYTE8(v18);
    *(unsigned char *)(v17 + 15) |= 8u;
  }
  else
  {
    baseObject = self->_baseObject;
    -[MTLBufferSPI didModifyRange:](baseObject, "didModifyRange:");
  }
}

- (void)addDebugMarker:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  -[MTLBufferSPI addDebugMarker:range:](self->_baseObject, "addDebugMarker:range:", v7, location, length);
  uint64_t v8 = v23;
  *(_DWORD *)(v23 + 8) = -16103;
  char v9 = BYTE9(v24);
  if (BYTE9(v24) > 0x20uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v12 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v23 + 1), v12 | 0x2000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v24));
    BYTE9(v24) += 32;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLBuffer *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v15 = v7;
  id v16 = [v15 UTF8String];
  if (v16)
  {
    id v17 = v15;
    id v18 = [v17 UTF8String];
    size_t v19 = strlen((const char *)[v17 UTF8String]);
    LOBYTE(v16) = GTTraceEncoder_storeBytes((uint64_t)&v22, v18, v19 + 1);
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = location;
  *((void *)v10 + 2) = length;
  v10[24] = (char)v16;
  *(_DWORD *)(v10 + 25) = 0;
  *((_DWORD *)v10 + 7) = 0;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
}

- (__IOSurface)_aneIOSurface
{
  return (__IOSurface *)[(MTLBufferSPI *)self->_baseObject _aneIOSurface];
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject unfilteredResourceOptions];
}

- (unint64_t)storageMode
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject storageMode];
}

- (void)setResponsibleProcess:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLBufferSPI *)self->_baseObject setResponsibleProcess:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16371;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLBuffer *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (int)responsibleProcess
{
  return [(MTLBufferSPI *)self->_baseObject responsibleProcess];
}

- (unint64_t)resourceOptions
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject resourceOptions];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject resourceIndex];
}

- (void)setParentGPUSize:(unint64_t)a3
{
}

- (unint64_t)parentGPUSize
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject parentGPUSize];
}

- (void)setParentGPUAddress:(unint64_t)a3
{
}

- (unint64_t)parentGPUAddress
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject parentGPUAddress];
}

- (unint64_t)length
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject length];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLBufferSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16372;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLBuffer *)self traceStream];
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
  *(void *)id v7 = var0;
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
  return (NSString *)[(MTLBufferSPI *)self->_baseObject label];
}

- (__IOSurface)iosurface
{
  return (__IOSurface *)[(MTLBufferSPI *)self->_baseObject iosurface];
}

- (unint64_t)heapOffset
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject heapOffset];
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject hazardTrackingMode];
}

- (unint64_t)gpuAddress
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject gpuAddress];
}

- (MTLDevice)device
{
  return self->_captureDevice;
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject cpuCacheMode];
}

- (unint64_t)allocationID
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject allocationID];
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLBufferSPI *)self->_baseObject allocatedSize];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLBufferSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLBuffer;
  uint64_t v3 = [(CaptureMTLBuffer *)&v7 description];
  id v4 = [(MTLBufferSPI *)self->_baseObject description];
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

- (void)contents
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v5 = atomic_load(p_var1);
    unint64_t v6 = v5;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)p_var1, &v6, v5 | 3);
      BOOL v7 = v6 == v5;
      unint64_t v5 = v6;
    }
    while (!v7);
    uint64_t v8 = self->_traceStream;
  }
  else
  {
    uint64_t v8 = 0;
  }
  CaptureMTLBuffer_registerBaseBufferForTracing(self->_baseObject, (uint64_t)v8, 0);
  baseObject = self->_baseObject;

  return [(MTLBufferSPI *)baseObject contents];
}

- (MTLHeap)heap
{
  return self->_captureHeap;
}

- (MTLBuffer)baseObject
{
  return self->_baseObject;
}

- (void)dealloc
{
  if (ShouldRegisterBufferForTracing(self->_baseObject)) {
    GTMemoryGuard_unregisterRegion((uint64_t)self->_traceStream);
  }
  [(MTLDevice *)self->_captureDevice deallocateResource:self];
  baseObject = self->_baseObject;
  self->_baseObject = 0;

  [(MTLHeap *)self->_captureHeap usedSize];
  [(MTLHeap *)self->_captureHeap currentAllocatedSize];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16370;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x38uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    unint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x800000000) + 16;
    char v5 = v8;
  }
  else
  {
    unint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 8;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLBuffer *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v6 = var0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v13.receiver = self;
  v13.super_class = (Class)CaptureMTLBuffer;
  [(CaptureMTLBuffer *)&v13 dealloc];
}

- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CaptureMTLBuffer;
  uint64_t v9 = [(CaptureMTLBuffer *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    objc_storeStrong((id *)&v10->_captureRemoteStorageBuffer, a4);
    objc_super v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    long long v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v13, (unint64_t)v14, (unint64_t)v10);
  }
  return v10;
}

- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureHeap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CaptureMTLBuffer;
  uint64_t v9 = [(CaptureMTLBuffer *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    objc_storeStrong((id *)&v10->_captureHeap, a4);
    objc_super v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    long long v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v13, (unint64_t)v14, (unint64_t)v10);

    [v8 usedSize];
    [v8 currentAllocatedSize];
  }

  return v10;
}

- (CaptureMTLBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLBuffer;
  uint64_t v9 = [(CaptureMTLBuffer *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    uint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end