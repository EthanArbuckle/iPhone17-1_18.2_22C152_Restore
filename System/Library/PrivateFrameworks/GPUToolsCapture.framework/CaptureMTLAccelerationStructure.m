@interface CaptureMTLAccelerationStructure
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureDevice:(id)a4 captureBuffer:(id)a5;
- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureHeap:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLAccelerationStructure)baseObject;
- (MTLAccelerationStructureDescriptor)captureDescriptor;
- (MTLBuffer)buffer;
- (MTLBuffer)stateBuffer;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLResourceID)gpuResourceID;
- (NSMutableSet)extraRetainedObjects;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)accelerationStructureUniqueIdentifier;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)bufferOffset;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)protectionOptions;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)makeAliasable;
- (void)setCaptureDescriptor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)setStateBuffer:(id)a3;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLAccelerationStructure

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateBuffer, 0);
  objc_storeStrong((id *)&self->_extraRetainedObjects, 0);
  objc_storeStrong((id *)&self->_childrenAccelerationStructures, 0);
  objc_storeStrong((id *)&self->_captureDescriptor, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_captureHeap, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)setStateBuffer:(id)a3
{
}

- (MTLBuffer)stateBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableSet)extraRetainedObjects
{
  return self->_extraRetainedObjects;
}

- (void)waitUntilComplete
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLAccelerationStructureSPI *)self->_baseObject waitUntilComplete];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15649;
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
  v8 = [(CaptureMTLAccelerationStructure *)self traceStream];
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

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  id v5 = [(MTLAccelerationStructureSPI *)self->_baseObject setPurgeableState:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15650;
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
  uint64_t v11 = [(CaptureMTLAccelerationStructure *)self traceStream];
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

- (void)makeAliasable
{
  if (!qword_2501C0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
    [(MTLAccelerationStructureSPI *)self->_baseObject makeAliasable];
    [(CaptureMTLHeap *)self->_captureHeap usedSize];
    [(CaptureMTLHeap *)self->_captureHeap currentAllocatedSize];
    uint64_t v3 = v13;
    *(_DWORD *)(v13 + 8) = -15651;
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
    v8 = [(CaptureMTLAccelerationStructure *)self traceStream];
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
  return [(MTLAccelerationStructureSPI *)self->_baseObject isPurgeable];
}

- (BOOL)isComplete
{
  return [(MTLAccelerationStructureSPI *)self->_baseObject isComplete];
}

- (BOOL)isAliasable
{
  return [(MTLAccelerationStructureSPI *)self->_baseObject isAliasable];
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = [a3 baseObject];
  LOBYTE(baseObject) = [(MTLAccelerationStructureSPI *)baseObject doesAliasResource:v4];

  return (char)baseObject;
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    uint64_t v9 = v8;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (void *)*a3++;
      *(void *)uint64_t v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLAccelerationStructureSPI *)baseObject doesAliasAnyResources:v8 count:a4];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    uint64_t v9 = v8;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (void *)*a3++;
      *(void *)uint64_t v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLAccelerationStructureSPI *)baseObject doesAliasAllResources:v8 count:a4];
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject uniqueIdentifier];
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject unfilteredResourceOptions];
}

- (unint64_t)storageMode
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject storageMode];
}

- (unint64_t)size
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject size];
}

- (void)setResponsibleProcess:(int)a3
{
}

- (int)responsibleProcess
{
  return [(MTLAccelerationStructureSPI *)self->_baseObject responsibleProcess];
}

- (unint64_t)resourceOptions
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject resourceOptions];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject resourceIndex];
}

- (unint64_t)protectionOptions
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject protectionOptions];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLAccelerationStructureSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15661;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    size_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    size_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  unint64_t v10 = [(CaptureMTLAccelerationStructure *)self traceStream];
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
  *(void *)size_t v7 = var0;
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
  return (NSString *)[(MTLAccelerationStructureSPI *)self->_baseObject label];
}

- (unint64_t)heapOffset
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject heapOffset];
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject hazardTrackingMode];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLAccelerationStructureSPI *)self->_baseObject gpuResourceID];
}

- (unint64_t)gpuHandle
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject gpuHandle];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject cpuCacheMode];
}

- (unint64_t)bufferOffset
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject bufferOffset];
}

- (unint64_t)allocationID
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject allocationID];
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject allocatedSize];
}

- (unint64_t)accelerationStructureUniqueIdentifier
{
  return (unint64_t)[(MTLAccelerationStructureSPI *)self->_baseObject accelerationStructureUniqueIdentifier];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLAccelerationStructureSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLAccelerationStructure;
  uint64_t v3 = [(CaptureMTLAccelerationStructure *)&v7 description];
  id v4 = [(MTLAccelerationStructureSPI *)self->_baseObject description];
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
  os_unfair_lock_lock((os_unfair_lock_t)&s_accelerationStructuresLock);
  uint64_t v3 = (void *)s_accelerationStructureGPUResourceIDToStreamRef;
  unint64_t v4 = +[NSNumber numberWithUnsignedLongLong:[(MTLAccelerationStructureSPI *)self->_baseObject gpuResourceID]];
  [v3 removeObjectForKey:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&s_accelerationStructuresLock);
  [(CaptureMTLDevice *)self->_captureDevice deallocateResource:self];
  baseObject = self->_baseObject;
  self->_baseObject = 0;

  [(CaptureMTLHeap *)self->_captureHeap usedSize];
  [(CaptureMTLHeap *)self->_captureHeap currentAllocatedSize];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15659;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x38uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 8;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLAccelerationStructure *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v15.receiver = self;
  v15.super_class = (Class)CaptureMTLAccelerationStructure;
  [(CaptureMTLAccelerationStructure *)&v15 dealloc];
}

- (void)setCaptureDescriptor:(id)a3
{
}

- (MTLAccelerationStructureDescriptor)captureDescriptor
{
  return self->_captureDescriptor;
}

- (MTLBuffer)buffer
{
  if ((qword_2501C8 & 4) == 0 && os_variant_has_internal_content()) {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg(0, (uint64_t)"-[MTLAccelerationStructure buffer] SPI", 0, (uint64_t)"To be able to capture, don't use -[MTLAccelerationStructure buffer] SPI.");
  }
  buffer = self->_buffer;

  return (MTLBuffer *)buffer;
}

- (MTLHeap)heap
{
  return (MTLHeap *)self->_captureHeap;
}

- (MTLAccelerationStructure)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureHeap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CaptureMTLAccelerationStructure;
  uint64_t v9 = [(CaptureMTLAccelerationStructure *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v8 device];
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v9->_captureHeap, a4);
    objc_storeStrong((id *)&v9->_captureDevice, v10);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v9->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v9->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v9);

    traceStream = (uint64_t *)v9->_traceStream;
    if (traceStream) {
      uint64_t v14 = *traceStream;
    }
    else {
      uint64_t v14 = 0;
    }
    RegisterAccelerationStructure(v9, v14, (uint64_t)[v7 gpuResourceID]);
    objc_super v15 = [(MTLAccelerationStructureSPI *)v9->_baseObject buffer];
    if (v15)
    {
      long long v16 = [[CaptureMTLBuffer alloc] initWithBaseObject:v15 captureHeap:v8];
      buffer = v9->_buffer;
      v9->_buffer = v16;
    }
  }

  return v9;
}

- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureDevice:(id)a4 captureBuffer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v45.receiver = self;
  v45.super_class = (Class)CaptureMTLAccelerationStructure;
  id v12 = [(CaptureMTLAccelerationStructure *)&v45 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    objc_storeStrong((id *)&v13->_captureDevice, a4);
    captureHeap = v13->_captureHeap;
    v13->_captureHeap = 0;

    objc_super v15 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v15;
    long long v16 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v15, (unint64_t)v16, (unint64_t)v13);

    traceStream = (uint64_t *)v13->_traceStream;
    if (traceStream) {
      uint64_t v18 = *traceStream;
    }
    else {
      uint64_t v18 = 0;
    }
    RegisterAccelerationStructure(v13, v18, (uint64_t)[v9 gpuResourceID]);
    if (v11)
    {
      objc_super v19 = (CaptureMTLBuffer *)v11;
      buffer = v13->_buffer;
      v13->_buffer = v19;
    }
    else
    {
      buffer = [(MTLAccelerationStructureSPI *)v13->_baseObject buffer];
      if (buffer)
      {
        v24 = [[CaptureMTLBuffer alloc] initWithBaseObject:buffer captureDevice:v10];
        v25 = v13->_buffer;
        v13->_buffer = v24;

        if ((qword_2501C8 & 4) != 0)
        {
          long long v43 = 0u;
          long long v44 = 0u;
          long long v42 = 0u;
          traceContext = v13->_traceContext;
          long long v42 = (unint64_t)traceContext;
          *(void *)&long long v43 = 0;
          *((void *)&v43 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
          s();
          v28 = v27;
          uint64_t v29 = *v27;
          uint64_t *v27 = v30;
          *(void *)&long long v44 = v29;
          BYTE8(v44) = *((unsigned char *)v27 + 8);
          *(_WORD *)((char *)&v44 + 9) = 16400;
          *(_DWORD *)((char *)&v44 + 11) = 0;
          HIBYTE(v44) = 0;
          GTTraceEncoder_setStream((uint64_t *)&v42, (uint64_t)[(CaptureMTLBuffer *)v13->_buffer traceStream]);
          uint64_t v31 = v43;
          *(_DWORD *)(v43 + 8) = -16314;
          char v32 = BYTE9(v44);
          if (BYTE9(v44) > 0x18uLL)
          {
            uint64_t v34 = *(void *)(*((void *)&v42 + 1) + 24);
            uint64_t v35 = BYTE10(v44);
            ++BYTE10(v44);
            v33 = GTTraceMemPool_allocateBytes(v34, *((uint64_t *)&v43 + 1), v35 | 0x2800000000) + 16;
            char v32 = v35;
          }
          else
          {
            v33 = (char *)(v31 + BYTE9(v44));
            BYTE9(v44) += 40;
          }
          *(unsigned char *)(v31 + 13) = v32;
          SaveMTLBufferInfo((uint64_t)&v42, v13->_buffer);
          v36 = [(CaptureMTLDevice *)v13->_captureDevice traceStream];
          if (v36) {
            unint64_t var0 = v36->var0;
          }
          else {
            unint64_t var0 = 0;
          }
          v37 = [(CaptureMTLBuffer *)v13->_buffer traceStream];
          if (v37) {
            unint64_t v38 = v37->var0;
          }
          else {
            unint64_t v38 = 0;
          }
          unint64_t v39 = [(CaptureMTLBuffer *)v13->_buffer length];
          unint64_t v40 = [(CaptureMTLBuffer *)v13->_buffer resourceOptions];
          *(void *)v33 = var0;
          *((void *)v33 + 1) = v38;
          *((void *)v33 + 2) = v39;
          *((void *)v33 + 3) = v40;
          *((void *)v33 + 4) = 0;
          uint64_t *v28 = v44;
          *((unsigned char *)v28 + 8) = BYTE8(v44);
          *(unsigned char *)(v43 + 15) |= 8u;
        }
      }
    }

    if ((qword_2501C8 & 0x10) != 0)
    {
      uint64_t v21 = objc_opt_new();
      extraRetainedObjects = v13->_extraRetainedObjects;
      v13->_extraRetainedObjects = (NSMutableSet *)v21;
    }
  }

  return v13;
}

- (CaptureMTLAccelerationStructure)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  return [(CaptureMTLAccelerationStructure *)self initWithBaseObject:a3 captureDevice:a4 captureBuffer:0];
}

@end