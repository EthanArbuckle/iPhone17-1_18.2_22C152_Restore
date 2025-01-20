@interface CaptureMTLResidencySet
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)containsAllocation:(id)a3;
- (BOOL)containsHeap:(id)a3;
- (BOOL)containsResource:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLResidencySet)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLResidencySet)baseObject;
- (NSArray)allAllocations;
- (NSArray)allCommittedAllocations;
- (NSString)description;
- (NSString)label;
- (id)allCommittedHeaps;
- (id)allCommittedResources;
- (id)allHeaps;
- (id)allResources;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)allocatedSize;
- (unint64_t)allocationCount;
- (unint64_t)countForHeap:(id)a3;
- (unint64_t)countForResource:(id)a3;
- (unint64_t)currentGeneration;
- (unint64_t)expiredGeneration;
- (unint64_t)generationForAllocation:(id)a3;
- (unint64_t)generationForHeap:(id)a3;
- (unint64_t)generationForResource:(id)a3;
- (unint64_t)streamReference;
- (void)addAllocation:(id)a3;
- (void)addAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)commit;
- (void)dealloc;
- (void)endResidency;
- (void)removeAllAllocations;
- (void)removeAllocation:(id)a3;
- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)requestResidency;
- (void)setCurrentGeneration:(unint64_t)a3;
- (void)setExpiredGeneration:(unint64_t)a3;
- (void)touch;
@end

@implementation CaptureMTLResidencySet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_committedAllocations, 0);
  objc_storeStrong((id *)&self->_tempAllocations, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)requestResidency
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLResidencySetSPI *)self->_baseObject requestResidency];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15223;
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
  v8 = [(CaptureMTLResidencySet *)self traceStream];
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

- (unint64_t)generationForAllocation:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = [a3 baseObject];
  id v5 = [(MTLResidencySetSPI *)baseObject generationForAllocation:v4];

  return (unint64_t)v5;
}

- (void)endResidency
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLResidencySetSPI *)self->_baseObject endResidency];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15230;
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
  v8 = [(CaptureMTLResidencySet *)self traceStream];
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

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15231;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLResidencySet *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLResidencySet;
  [(CaptureMTLResidencySet *)&v12 dealloc];
}

- (BOOL)containsAllocation:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = [a3 baseObject];
  LOBYTE(baseObject) = [(MTLResidencySetSPI *)baseObject containsAllocation:v4];

  return (char)baseObject;
}

- (NSString)label
{
  return (NSString *)[(MTLResidencySetSPI *)self->_baseObject label];
}

- (void)setExpiredGeneration:(unint64_t)a3
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLResidencySet_setExpiredGeneration", (uint64_t)"Residency Set API", 0, 0);
  baseObject = self->_baseObject;

  [(MTLResidencySetSPI *)baseObject setExpiredGeneration:a3];
}

- (unint64_t)expiredGeneration
{
  return (unint64_t)[(MTLResidencySetSPI *)self->_baseObject expiredGeneration];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (void)setCurrentGeneration:(unint64_t)a3
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLResidencySet_setCurrentGeneration", (uint64_t)"Residency Set API", 0, 0);
  baseObject = self->_baseObject;

  [(MTLResidencySetSPI *)baseObject setCurrentGeneration:a3];
}

- (unint64_t)currentGeneration
{
  return (unint64_t)[(MTLResidencySetSPI *)self->_baseObject currentGeneration];
}

- (unint64_t)allocationCount
{
  return (unint64_t)[(MTLResidencySetSPI *)self->_baseObject allocationCount];
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLResidencySetSPI *)self->_baseObject allocatedSize];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLResidencySetSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLResidencySet;
  uint64_t v3 = [(CaptureMTLResidencySet *)&v7 description];
  char v4 = [(MTLResidencySetSPI *)self->_baseObject description];
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

- (unint64_t)generationForResource:(id)a3
{
  return 0;
}

- (unint64_t)generationForHeap:(id)a3
{
  return 0;
}

- (unint64_t)countForResource:(id)a3
{
  return 0;
}

- (unint64_t)countForHeap:(id)a3
{
  return 0;
}

- (BOOL)containsResource:(id)a3
{
  return 0;
}

- (BOOL)containsHeap:(id)a3
{
  return 0;
}

- (id)allResources
{
  return &__NSArray0__struct;
}

- (id)allHeaps
{
  return &__NSArray0__struct;
}

- (id)allCommittedResources
{
  return &__NSArray0__struct;
}

- (id)allCommittedHeaps
{
  return &__NSArray0__struct;
}

- (void)commit
{
  ResidencySetTakeSnapshotInternal(self, 0);
  uint64_t v3 = [(NSMutableSet *)self->_tempAllocations allObjects];
  unint64_t v4 = (NSArray *)[v3 copy];
  committedAllocations = self->_committedAllocations;
  self->_committedAllocations = v4;

  [(MTLResidencySetSPI *)self->_baseObject commit];
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
    uint64_t v6 = v16;
    *(_DWORD *)(v16 + 8) = -15220;
    char v7 = BYTE9(v17);
    if (BYTE9(v17) > 0x38uLL)
    {
      uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
      uint64_t v10 = BYTE10(v17);
      ++BYTE10(v17);
      v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x800000000) + 16;
      char v7 = v10;
    }
    else
    {
      v8 = (char *)(v6 + BYTE9(v17));
      BYTE9(v17) += 8;
    }
    *(unsigned char *)(v6 + 13) = v7;
    uint64_t v11 = [(CaptureMTLResidencySet *)self traceStream];
    if (v11) {
      unint64_t var0 = v11->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    *(void *)v8 = var0;
    s();
    *(void *)uint64_t v13 = v14;
    *(unsigned char *)(v13 + 8) = BYTE8(v17);
    *(unsigned char *)(v16 + 15) |= 8u;
  }
}

- (NSArray)allCommittedAllocations
{
  id v2 = [(NSArray *)self->_committedAllocations copy];

  return (NSArray *)v2;
}

- (NSArray)allAllocations
{
  id v2 = [(NSMutableSet *)self->_tempAllocations allObjects];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (void)removeAllAllocations
{
  ResidencySetTakeSnapshotInternal(self, 0);
  [(NSMutableSet *)self->_tempAllocations removeAllObjects];
  [(MTLResidencySetSPI *)self->_baseObject removeAllAllocations];
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
    uint64_t v3 = v13;
    *(_DWORD *)(v13 + 8) = -15208;
    char v4 = BYTE9(v14);
    if (BYTE9(v14) > 0x38uLL)
    {
      uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
      uint64_t v7 = BYTE10(v14);
      ++BYTE10(v14);
      unint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
      char v4 = v7;
    }
    else
    {
      unint64_t v5 = (char *)(v3 + BYTE9(v14));
      BYTE9(v14) += 8;
    }
    *(unsigned char *)(v3 + 13) = v4;
    v8 = [(CaptureMTLResidencySet *)self traceStream];
    if (v8) {
      unint64_t var0 = v8->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    *(void *)unint64_t v5 = var0;
    s();
    *(void *)uint64_t v10 = v11;
    *(unsigned char *)(v10 + 8) = BYTE8(v14);
    *(unsigned char *)(v13 + 15) |= 8u;
  }
}

- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4
{
  ResidencySetTakeSnapshotInternal(self, 0);
  size_t v7 = 0;
  if (a4)
  {
    do
      id v8 = [(NSMutableSet *)self->_tempAllocations removeObject:a3[v7++]];
    while (a4 != v7);
    baseObject = self->_baseObject;
    size_t v7 = 8 * a4;
    __chkstk_darwin(v8, v9);
    uint64_t v11 = (char *)&v24 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, 8 * a4);
    uint64_t v12 = 0;
    do
    {
      *(void *)&v11[8 * v12] = [(id)a3[v12] baseObject];
      ++v12;
    }
    while (a4 != v12);
  }
  else
  {
    baseObject = self->_baseObject;
    uint64_t v11 = &v27;
  }
  [(MTLResidencySetSPI *)baseObject removeAllocations:v11 count:a4];
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
    uint64_t v13 = v25;
    *(_DWORD *)(v25 + 8) = -15206;
    char v14 = BYTE9(v26);
    if (BYTE9(v26) > 0x28uLL)
    {
      uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 24);
      uint64_t v17 = BYTE10(v26);
      ++BYTE10(v26);
      long long v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v25 + 1), v17 | 0x1800000000) + 16;
      char v14 = v17;
    }
    else
    {
      long long v15 = (char *)(v13 + BYTE9(v26));
      BYTE9(v26) += 24;
    }
    *(unsigned char *)(v13 + 13) = v14;
    v18 = [(CaptureMTLResidencySet *)self traceStream];
    if (v18) {
      unint64_t var0 = v18->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v18, v19);
    bzero((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    char v21 = StreamArray((uint64_t)&v24, (long long *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
    *(void *)long long v15 = var0;
    *((void *)v15 + 1) = a4;
    v15[16] = v21;
    *(_DWORD *)(v15 + 17) = 0;
    *((_DWORD *)v15 + 5) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(unsigned char *)(v22 + 8) = BYTE8(v26);
    *(unsigned char *)(v25 + 15) |= 8u;
  }
}

- (void)removeAllocation:(id)a3
{
  id v4 = a3;
  ResidencySetTakeSnapshotInternal(self, 0);
  [(NSMutableSet *)self->_tempAllocations removeObject:v4];
  baseObject = self->_baseObject;
  uint64_t v6 = [v4 baseObject];
  [(MTLResidencySetSPI *)baseObject removeAllocation:v6];

  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
    uint64_t v7 = v19;
    *(_DWORD *)(v19 + 8) = -15207;
    char v8 = BYTE9(v20);
    if (BYTE9(v20) > 0x30uLL)
    {
      uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 24);
      uint64_t v11 = BYTE10(v20);
      ++BYTE10(v20);
      uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v19 + 1), v11 | 0x1000000000) + 16;
      char v8 = v11;
    }
    else
    {
      uint64_t v9 = (char *)(v7 + BYTE9(v20));
      BYTE9(v20) += 16;
    }
    *(unsigned char *)(v7 + 13) = v8;
    uint64_t v12 = [(CaptureMTLResidencySet *)self traceStream];
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    char v14 = (uint64_t *)[v4 traceStream];
    if (v14) {
      uint64_t v15 = *v14;
    }
    else {
      uint64_t v15 = 0;
    }
    *(void *)uint64_t v9 = var0;
    *((void *)v9 + 1) = v15;
    s();
    *(void *)uint64_t v16 = v17;
    *(unsigned char *)(v16 + 8) = BYTE8(v20);
    *(unsigned char *)(v19 + 15) |= 8u;
  }
}

- (void)addAllocations:(const void *)a3 count:(unint64_t)a4
{
  ResidencySetTakeSnapshotInternal(self, 0);
  size_t v7 = 0;
  if (a4)
  {
    do
      id v8 = [(NSMutableSet *)self->_tempAllocations addObject:a3[v7++]];
    while (a4 != v7);
    baseObject = self->_baseObject;
    size_t v7 = 8 * a4;
    __chkstk_darwin(v8, v9);
    uint64_t v11 = (char *)&v24 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, 8 * a4);
    uint64_t v12 = 0;
    do
    {
      *(void *)&v11[8 * v12] = [(id)a3[v12] baseObject];
      ++v12;
    }
    while (a4 != v12);
  }
  else
  {
    baseObject = self->_baseObject;
    uint64_t v11 = &v27;
  }
  [(MTLResidencySetSPI *)baseObject addAllocations:v11 count:a4];
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
    uint64_t v13 = v25;
    *(_DWORD *)(v25 + 8) = -15211;
    char v14 = BYTE9(v26);
    if (BYTE9(v26) > 0x28uLL)
    {
      uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 24);
      uint64_t v17 = BYTE10(v26);
      ++BYTE10(v26);
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v25 + 1), v17 | 0x1800000000) + 16;
      char v14 = v17;
    }
    else
    {
      uint64_t v15 = (char *)(v13 + BYTE9(v26));
      BYTE9(v26) += 24;
    }
    *(unsigned char *)(v13 + 13) = v14;
    long long v18 = [(CaptureMTLResidencySet *)self traceStream];
    if (v18) {
      unint64_t var0 = v18->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v18, v19);
    bzero((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    char v21 = StreamArray((uint64_t)&v24, (long long *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = a4;
    v15[16] = v21;
    *(_DWORD *)(v15 + 17) = 0;
    *((_DWORD *)v15 + 5) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(unsigned char *)(v22 + 8) = BYTE8(v26);
    *(unsigned char *)(v25 + 15) |= 8u;
  }
}

- (void)addAllocation:(id)a3
{
  id v4 = a3;
  ResidencySetTakeSnapshotInternal(self, 0);
  [(NSMutableSet *)self->_tempAllocations addObject:v4];
  baseObject = self->_baseObject;
  uint64_t v6 = [v4 baseObject];
  [(MTLResidencySetSPI *)baseObject addAllocation:v6];

  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
    uint64_t v7 = v19;
    *(_DWORD *)(v19 + 8) = -15212;
    char v8 = BYTE9(v20);
    if (BYTE9(v20) > 0x30uLL)
    {
      uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 24);
      uint64_t v11 = BYTE10(v20);
      ++BYTE10(v20);
      uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v19 + 1), v11 | 0x1000000000) + 16;
      char v8 = v11;
    }
    else
    {
      uint64_t v9 = (char *)(v7 + BYTE9(v20));
      BYTE9(v20) += 16;
    }
    *(unsigned char *)(v7 + 13) = v8;
    uint64_t v12 = [(CaptureMTLResidencySet *)self traceStream];
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    char v14 = (uint64_t *)[v4 traceStream];
    if (v14) {
      uint64_t v15 = *v14;
    }
    else {
      uint64_t v15 = 0;
    }
    *(void *)uint64_t v9 = var0;
    *((void *)v9 + 1) = v15;
    s();
    *(void *)uint64_t v16 = v17;
    *(unsigned char *)(v16 + 8) = BYTE8(v20);
    *(unsigned char *)(v19 + 15) |= 8u;
  }
}

- (MTLResidencySet)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLResidencySet)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CaptureMTLResidencySet;
  uint64_t v9 = [(CaptureMTLResidencySet *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    uint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);

    uint64_t v13 = +[NSMutableSet set];
    tempAllocations = v10->_tempAllocations;
    v10->_tempAllocations = (NSMutableSet *)v13;

    committedAllocations = v10->_committedAllocations;
    v10->_committedAllocations = 0;

    v10->_snapshotCreated = (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2;
  }

  return v10;
}

@end