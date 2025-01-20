@interface BVHTopDownBuilder
+ (unint64_t)prefixSumScratchBufferSizeWithCapacity:(unint64_t)a3;
- (BVHTopDownBuilder)initWithDevice:(id)a3;
- (GBVHBindings)setupBindingsWithDescriptor:(SEL)a3 scratchBuffer:(id)a4 scratchBufferOffset:(id)a5 outputBuffer:(unint64_t)a6 outputBufferOffset:(id)a7 resourceBufferAddress:(unint64_t)a8 primitiveCountBufferAddress:(unint64_t)a9 scratchBufferSize:(unint64_t)a10;
- (id).cxx_construct;
- (uint64_t)buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:;
- (uint64_t)initWithDevice:;
- (unint64_t)fragmentScratchSizeForDescriptor:(id)a3;
- (unint64_t)fragmentTotalThreadgroupCountForDescriptor:(id)a3;
- (unint64_t)getBuildScratchBufferSizeForDescriptor:(id)a3;
- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3;
- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3 nodeOffset:(unint64_t *)a4 fragmentPrimitiveIndicesOffset:(unint64_t *)a5 fragmentGeometryIndicesOffset:(unint64_t *)a6 motionFragmentOffset:(unint64_t *)a7 fragmentIndexOffset:(unint64_t *)a8 childIndexOffset:(unint64_t *)a9;
- (void)addPrefixSumsWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10;
- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8 primitiveCountBufferAddress:(unint64_t)a9 resourceBufferGPUAddress:(unint64_t)a10 debugBufferGPUAddress:(unint64_t)a11;
- (void)buildWithEncoder:(id)a3 descriptor:(id)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6 counterBuffer:(id)a7 counterBufferOffset:(unint64_t)a8 uniformsBuffer:(id)a9 uniformsBufferOffset:(unint64_t)a10 bindings:(const void *)a11 settings:(GBVHSettings *)a12;
- (void)copyFromBuffer:(id)a3 sourceBufferOffset:(unint64_t)a4 toBuffer:(id)a5 destinationBufferOffset:(unint64_t)a6 length:(unint64_t)a7 encoder:(id)a8;
- (void)copySourceAddress:(unint64_t)a3 destinationAddress:(unint64_t)a4 length:(unint64_t)a5 encoder:(id)a6;
- (void)dealloc;
- (void)getFragmentsWithEncoder:(id)a3 descriptor:(id)a4 primitiveCountBufferAddress:(unint64_t)a5 fragmentScratchBuffer:(id)a6 fragmentScratchBufferOffset:(unint64_t)a7;
- (void)initPipelinesWithDevice:(id)a3;
- (void)initWithDevice:;
- (void)prefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 scratchBuffer:(id)a8 scratchBufferOffset:(unint64_t)a9 countBuffer:(id)a10 countBufferOffset:(unint64_t)a11 capacity:(unint64_t)a12;
- (void)setCounters:(const GBVHCounterValue *)a3 numCounters:(unint64_t)a4 encoder:(id)a5;
- (void)threadgroupPrefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10;
@end

@implementation BVHTopDownBuilder

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((void *)self + 17) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (self->_pipelineCache.map.__table_.__p2_.__value_)
  {
    next = (id *)self->_pipelineCache.map.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v4 = (id *)*next;

        operator delete(next);
        next = v4;
      }
      while (v4);
    }
    self->_pipelineCache.map.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = self->_pipelineCache.map.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        self->_pipelineCache.map.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_pipelineCache.map.__table_.__p2_.__value_ = 0;
  }
  f = (BVHTopDownBuilder *)self->_pipelineCache.createPipeline.__f_.__f_;
  if (f == (BVHTopDownBuilder *)&self->_pipelineCache.createPipeline)
  {
    (*(void (**)(function<id<MTLComputePipelineState> (const PipelineKey &)> *, SEL))(*(void *)self->_pipelineCache.createPipeline.__f_.__buf_.__lx
                                                                                               + 32))(&self->_pipelineCache.createPipeline, a2);
    v8 = (id *)self->_pipelineCache.map.__table_.__p1_.__value_.__next_;
    if (!v8) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (f) {
    (*((void (**)(BVHTopDownBuilder *, SEL))f->super.isa + 5))(f, a2);
  }
  v8 = (id *)self->_pipelineCache.map.__table_.__p1_.__value_.__next_;
  if (v8)
  {
    do
    {
LABEL_12:
      v9 = (id *)*v8;

      operator delete(v8);
      v8 = v9;
    }
    while (v9);
  }
LABEL_13:
  v10 = self->_pipelineCache.map.__table_.__bucket_list_.__ptr_.__value_;
  self->_pipelineCache.map.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v10)
  {
    operator delete(v10);
  }
}

- (void)prefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 scratchBuffer:(id)a8 scratchBufferOffset:(unint64_t)a9 countBuffer:(id)a10 countBufferOffset:(unint64_t)a11 capacity:(unint64_t)a12
{
  if (a12)
  {
    [a3 memoryBarrierWithScope:1];
    if (a12 > 0x200)
    {
      [(BVHTopDownBuilder *)self threadgroupPrefixSumWithEncoder:a3 inputBuffer:a4 inputBufferOffset:a5 reducedBuffer:a8 reducedBufferOffset:a9 countBuffer:a10 countBufferOffset:a11 capacity:a12];
      [(BVHTopDownBuilder *)self prefixSumWithEncoder:a3 inputBuffer:a8 inputBufferOffset:a9 reducedBuffer:a6 reducedBufferOffset:a7 scratchBuffer:a8 scratchBufferOffset:a9 + 4 * ((a12 + 511) >> 9) countBuffer:0 countBufferOffset:0 capacity:(a12 + 511) >> 9];
      -[BVHTopDownBuilder addPrefixSumsWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "addPrefixSumsWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a8, a9, a10);
    }
    else
    {
      -[BVHTopDownBuilder threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a6, a7, a10);
    }
  }
}

- (void)addPrefixSumsWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10
{
  uint64_t KERNEL_INDEX_PREFIX_SUM_ADD_low = LOBYTE(self->KERNEL_INDEX_PREFIX_SUM_ADD);
  *((void *)&v21 + 1) = 0;
  uint64_t v22 = 0;
  *(void *)&long long v21 = KERNEL_INDEX_PREFIX_SUM_ADD_low | 0x70000000;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, &v21));
  [a3 setBuffer:a4 offset:a5 atIndex:28];
  [a3 setBuffer:a6 offset:a7 atIndex:29];
  if (a8)
  {
    [a3 setBuffer:a8 offset:a9 atIndex:30];
  }
  else
  {
    LODWORD(v21) = a10;
    [a3 setBytes:&v21 length:4 atIndex:30];
  }
  [a3 memoryBarrierWithScope:1];
  unint64_t v19 = (a10 + 511) >> 9;
  int64x2_t v20 = vdupq_n_s64(1uLL);
  long long v17 = xmmword_242EA85F0;
  uint64_t v18 = 1;
  [a3 dispatchThreadgroups:&v19 threadsPerThreadgroup:&v17];
}

- (void)threadgroupPrefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10
{
  if (a6) {
    unint64_t v14 = a7;
  }
  else {
    unint64_t v14 = a5;
  }
  if (a6) {
    id v15 = a6;
  }
  else {
    id v15 = a4;
  }
  uint64_t v16 = 276;
  if (!a6) {
    uint64_t v16 = 272;
  }
  uint64_t v17 = *((unsigned __int8 *)&self->super.isa + v16);
  *((void *)&v22 + 1) = 0;
  uint64_t v23 = 0;
  *(void *)&long long v22 = v17 | 0x70000000;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, &v22));
  [a3 setBuffer:a4 offset:a5 atIndex:28];
  [a3 setBuffer:v15 offset:v14 atIndex:29];
  if (a8)
  {
    [a3 setBuffer:a8 offset:a9 atIndex:30];
  }
  else
  {
    LODWORD(v22) = a10;
    [a3 setBytes:&v22 length:4 atIndex:30];
  }
  [a3 memoryBarrierWithScope:1];
  unint64_t v20 = (a10 + 511) >> 9;
  int64x2_t v21 = vdupq_n_s64(1uLL);
  long long v18 = xmmword_242EA85F0;
  uint64_t v19 = 1;
  [a3 dispatchThreadgroups:&v20 threadsPerThreadgroup:&v18];
}

- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8 primitiveCountBufferAddress:(unint64_t)a9 resourceBufferGPUAddress:(unint64_t)a10 debugBufferGPUAddress:(unint64_t)a11
{
  if (a4)
  {
    unint64_t v18 = *((void *)a4 + 3);
    uint64_t v19 = *((void *)a4 + 5);
    LODWORD(v20) = v18;
    if (v19)
    {
      unint64_t v20 = *((void *)a4 + 3);
      if (!*((_DWORD *)a4 + 34))
      {
        unint64_t v20 = *((void *)a4 + 3);
        if (*((_DWORD *)a4 + 37) == 3)
        {
          double v21 = *((float *)a4 + 38) + -1.0;
          if (v21 < 0.0) {
            double v21 = 0.0;
          }
          unint64_t v20 = v18 + vcvtpd_u64_f64(v21 * (double)v18);
        }
      }
    }
    if (*((unsigned char *)a4 + 83))
    {
      unint64_t v22 = *((void *)a4 + 25);
      if (v22 >= 2) {
        LODWORD(v20) = (v22 - 1) * v20;
      }
    }
    if (v19 && !*((_DWORD *)a4 + 34) && *((_DWORD *)a4 + 37) == 3)
    {
      double v23 = *((float *)a4 + 38) + -1.0;
      if (v23 < 0.0) {
        double v23 = 0.0;
      }
      v18 += vcvtpd_u64_f64(v23 * (double)v18);
    }
    if (*((unsigned char *)a4 + 83))
    {
      unint64_t v24 = *((void *)a4 + 25);
      uint64_t v25 = v24 - 1;
      if (v24 <= 1) {
        uint64_t v25 = 1;
      }
      v18 *= v25;
      if (v24 >= 2) {
        v18 *= 1 << *((_DWORD *)a4 + 52);
      }
    }
  }
  else
  {
    LODWORD(v20) = 0;
    unint64_t v18 = 0;
  }
  unsigned int v45 = -[BVHDescriptor maxInnerNodeCount]((unint64_t)a4);
  unsigned int v44 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a4);
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  [(BVHTopDownBuilder *)self getGenericBVHSizeForDescriptor:a4 nodeOffset:&v74 fragmentPrimitiveIndicesOffset:&v73 fragmentGeometryIndicesOffset:&v72 motionFragmentOffset:&v71 fragmentIndexOffset:&v70 childIndexOffset:&v69];
  [a4 updatePipelineKey];
  if (a4) {
    char v53 = 4 * (*((void *)a4 + 24) != 0);
  }
  else {
    char v53 = 0;
  }
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  if (getBatchThreshold(void)::batchThreshold) {
    uint64_t v26 = 0x2000;
  }
  else {
    uint64_t v26 = 0;
  }
  if (a4 && *((unsigned char *)a4 + 83)) {
    char v51 = 16 * (*((void *)a4 + 25) > 1uLL);
  }
  else {
    char v51 = 0;
  }
  unint64_t v52 = v26;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  memset(v58, 0, sizeof(v58));
  if (self)
  {
    [(BVHTopDownBuilder *)self setupBindingsWithDescriptor:a4 scratchBuffer:a7 scratchBufferOffset:a8 outputBuffer:a5 outputBufferOffset:a6 resourceBufferAddress:a10 primitiveCountBufferAddress:a9 scratchBufferSize:0];
    uint64_t v50 = *((void *)&v59 + 1);
  }
  else
  {
    uint64_t v50 = 0;
  }
  uint64_t v27 = [a7 gpuAddress];
  uint64_t v48 = v67;
  uint64_t v49 = v27;
  uint64_t v28 = [a7 gpuAddress];
  uint64_t v46 = v59;
  uint64_t v47 = v28;
  uint64_t v29 = [a7 gpuAddress];
  uint64_t v43 = *(void *)&v58[0];
  uint64_t v30 = [a7 gpuAddress];
  [a3 setBytes:v58 length:336 atIndex:0];
  long long v56 = 0u;
  memset(v57, 0, 24);
  memset(v55, 0, sizeof(v55));
  if (a4)
  {
    uint64_t v31 = *((void *)a4 + 5);
    DWORD2(v57[0]) = *((void *)a4 + 25);
    uint64_t v32 = *((void *)a4 + 3);
    *(void *)&v55[0] = __PAIR64__(v32, v31);
    DWORD2(v55[0]) = *((_DWORD *)a4 + 39);
    *(int32x2_t *)((char *)v55 + 12) = vrev64_s32(*(int32x2_t *)((char *)a4 + 92));
    DWORD1(v55[1]) = *((_DWORD *)a4 + 28);
    *(void *)((char *)v57 + 12) = *((void *)a4 + 13);
    BYTE4(v57[1]) = *((unsigned char *)a4 + 82);
    *((void *)&v55[1] + 1) = __PAIR64__(v44, v45);
    *(void *)&long long v56 = __PAIR64__(v18, v20);
    unint64_t v33 = *((void *)a4 + 20);
    WORD4(v56) = v33;
    WORD5(v56) = (int)log2((double)(unsigned __int16)v33);
    if (!v32)
    {
      LOBYTE(v38) = 1;
      goto LABEL_47;
    }
    unint64_t v34 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a4);
    unint64_t v35 = *((void *)a4 + 1);
    if (v33 == 2)
    {
      double v36 = (double)v35;
      double v37 = (log((double)v34) / 0.693147181 + 2.0) * 1.35;
    }
    else
    {
      if (*((void *)a4 + 30))
      {
        LOBYTE(v38) = 16;
        goto LABEL_47;
      }
      double v36 = (double)v35;
      long double v39 = log((double)v34);
      double v37 = (v39 + v39) / log((double)v33) + 2.0;
    }
    double v40 = ceil(v37);
    if (v40 > v36) {
      double v40 = v36;
    }
    unint64_t v38 = (unint64_t)v40;
    if ((unint64_t)v40 <= 1) {
      LOBYTE(v38) = 1;
    }
  }
  else
  {
    memset(v55, 0, 24);
    *((void *)&v57[0] + 1) = 0;
    *(void *)((char *)v57 + 13) = 0;
    *((void *)&v55[1] + 1) = __PAIR64__(v44, v45);
    *(void *)&long long v56 = __PAIR64__(v18, v20);
    long double v42 = log2(0.0);
    LOBYTE(v38) = 0;
    WORD5(v56) = (int)v42;
  }
LABEL_47:
  BYTE4(v57[0]) = v38;
  BYTE5(v57[0]) = v53 | ((v18 > v52) << 6) | v51 | [a4 useParallelWideBuild];
  WORD1(v57[0]) = [a4 useSpatialSplits];
  WORD6(v56) = self->_threadgroupSize;
  unsigned int spatialBinningTGSize = self->_spatialBinningTGSize;
  HIWORD(v56) = self->_binningTGSize;
  LOWORD(v57[0]) = spatialBinningTGSize;
  [a3 setBytes:v55 length:72 atIndex:1];
  if (a11)
  {
    v54[0] = a11;
    v54[1] = 52;
    [a3 setBytes:v54 length:16 atIndex:4];
  }
  [(BVHTopDownBuilder *)self getFragmentsWithEncoder:a3 descriptor:a4 primitiveCountBufferAddress:a9 fragmentScratchBuffer:a7 fragmentScratchBufferOffset:v50 - v49];
  [(BVHTopDownBuilder *)self buildWithEncoder:a3 descriptor:a4 indirectBuffer:a7 indirectBufferOffset:v48 - v47 counterBuffer:a7 counterBufferOffset:v46 - v29 uniformsBuffer:a7 uniformsBufferOffset:v43 - v30 bindings:v58 settings:v55];
}

- (void)buildWithEncoder:(id)a3 descriptor:(id)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6 counterBuffer:(id)a7 counterBufferOffset:(unint64_t)a8 uniformsBuffer:(id)a9 uniformsBufferOffset:(unint64_t)a10 bindings:(const void *)a11 settings:(GBVHSettings *)a12
{
  id v222 = a3;
  v223 = self;
  unint64_t v220 = a8;
  id v221 = a7;
  if (!a4)
  {
    LODWORD(v18) = 0;
    unint64_t v14 = 0;
    unint64_t v13 = 0;
    LODWORD(v23) = 0;
    goto LABEL_25;
  }
  unint64_t v13 = *((void *)a4 + 3);
  unint64_t v14 = v13;
  if (*((void *)a4 + 5))
  {
    unint64_t v14 = *((void *)a4 + 3);
    if (!*((_DWORD *)a4 + 34))
    {
      unint64_t v14 = *((void *)a4 + 3);
      if (*((_DWORD *)a4 + 37) == 3)
      {
        double v15 = *((float *)a4 + 38) + -1.0;
        if (v15 < 0.0) {
          double v15 = 0.0;
        }
        unint64_t v14 = v13 + vcvtpd_u64_f64(v15 * (double)v13);
      }
    }
  }
  if (*((unsigned char *)a4 + 83))
  {
    unint64_t v16 = *((void *)a4 + 25);
    uint64_t v17 = v16 - 1;
    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    v14 *= v17;
    if (v16 >= 2) {
      v14 *= 1 << *((_DWORD *)a4 + 52);
    }
  }
  unint64_t v18 = *((void *)a4 + 20);
  if (v13)
  {
    unint64_t v19 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a4);
    unint64_t v20 = *((void *)a4 + 1);
    if (v18 == 2)
    {
      double v21 = (double)v20;
      double v22 = (log((double)v19) / 0.693147181 + 2.0) * 1.35;
    }
    else
    {
      if (*((void *)a4 + 30))
      {
        LODWORD(v23) = 16;
        goto LABEL_25;
      }
      double v21 = (double)v20;
      long double v24 = log((double)v19);
      double v22 = (v24 + v24) / log((double)v18) + 2.0;
    }
    double v25 = ceil(v22);
    if (v25 > v21) {
      double v25 = v21;
    }
    if ((unint64_t)v25 <= 1) {
      LODWORD(v23) = 1;
    }
    else {
      unint64_t v23 = (unint64_t)v25;
    }
  }
  else
  {
    LODWORD(v23) = 1;
  }
LABEL_25:
  BOOL v219 = 0;
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  if (getBatchThreshold(void)::batchThreshold) {
    unint64_t v26 = 0x2000;
  }
  else {
    unint64_t v26 = 0;
  }
  BOOL v219 = v14 > v26;
  if (a4)
  {
    char v27 = *((unsigned char *)a4 + 83);
    if (v27) {
      char v27 = *((void *)a4 + 25) > 1uLL;
    }
  }
  else
  {
    char v27 = 0;
  }
  char v218 = v27;
  if (v14 <= v26)
  {
    int dispatchBinsTGSize = 256;
    uint64_t v29 = 40;
  }
  else
  {
    int dispatchBinsTGSize = v223->_dispatchBinsTGSize;
    uint64_t v29 = 44;
  }
  unsigned int v216 = 0;
  unsigned int v217 = dispatchBinsTGSize;
  unsigned int v30 = *(_DWORD *)((char *)&v223->super.isa + v29);
  unsigned int spatialBinningTGSize = v223->_spatialBinningTGSize;
  unsigned int binningTGSize = v223->_binningTGSize;
  unsigned int v216 = v30;
  unsigned int splitTGSize = v223->_splitTGSize;
  unsigned int v214 = spatialBinningTGSize;
  if (a4)
  {
    long long v32 = *(_OWORD *)((char *)a4 + 168);
    uint64_t v33 = *((void *)a4 + 24);
    BOOL v212 = v33 != 0;
    long long v143 = v32;
    if (v33)
    {
      unint64_t v34 = *((void *)a4 + 23);
      if (v34 <= 2 * (uint64_t)v32) {
        unint64_t v34 = 2 * v32;
      }
      *((void *)a4 + 21) = v34;
      *((void *)a4 + 22) = v33;
      [a4 updatePipelineKey];
      long long v32 = v143;
    }
    char v211 = 0;
    {
      long long v32 = v143;
      if (v139)
      {
        -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
        long long v32 = v143;
      }
    }
    if (-[BVHDescriptor isDeterministic]::forceDeterministic)
    {
      LOBYTE(v35) = 1;
    }
    else
    {
      unint64_t v36 = [*((id *)a4 + 6) usage];
      long long v32 = v143;
      uint64_t v35 = (v36 >> 3) & 1;
    }
  }
  else
  {
    LOBYTE(v35) = 0;
    BOOL v212 = 0;
    long long v32 = 0uLL;
  }
  long long v144 = v32;
  char v211 = v35;
  uint64_t KERNEL_INDEX_DISPATCH_BINS_low = LOBYTE(v223->KERNEL_INDEX_DISPATCH_BINS);
  if (a4) {
    [a4 cachedPipelineKey];
  }
  else {
    memset(v147, 0, sizeof(v147));
  }
  *(_OWORD *)v210 = *(_OWORD *)v147;
  *(void *)&v210[16] = *(void *)&v147[16];
  uint64_t v38 = 0x10000000000;
  if (!v212) {
    uint64_t v38 = 0x10008000000;
  }
  unint64_t v39 = v38 | *(void *)v210 & 0xFFFF9EFFF7FFFF00 | KERNEL_INDEX_DISPATCH_BINS_low;
  if (v217) {
    unint64_t v39 = v39 & 0xFFFF9FFF0FFFFFFFLL | (log2((double)v217) << 28);
  }
  *(void *)v210 = v39;
  v208 = 0;
  v207 = 0;
  v206 = 0;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v223->_pipelineCache, (long long *)v210);
  if (a4 && *((void *)a4 + 20) == 2)
  {
    double v40 = 0;
  }
  else
  {
    p_pipelineCache = &v223->_pipelineCache;
    uint64_t KERNEL_INDEX_DISPATCH_BINS_WIDE_low = LOBYTE(v223->KERNEL_INDEX_DISPATCH_BINS_WIDE);
    *(_OWORD *)v147 = *(_OWORD *)v210;
    *(void *)&v147[16] = *(void *)&v210[16];
    unint64_t v43 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_DISPATCH_BINS_WIDE_low;
    if (v217) {
      unint64_t v43 = v43 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v217) << 28);
    }
    *(void *)v147 = v43;
    double v40 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (long long *)v147);
  }
  v208 = v40;
  unsigned int v44 = &v223->_pipelineCache;
  uint64_t v45 = LOBYTE(v223->KERNEL_INDEX_DISPATCH_BINS);
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v46 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | v45;
  if (v216) {
    unint64_t v46 = v46 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v216) << 28);
  }
  *(void *)v147 = v46;
  v207 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v44, (long long *)v147);
  if (a4 && *((void *)a4 + 20) == 2)
  {
    uint64_t v47 = 0;
  }
  else
  {
    uint64_t v48 = &v223->_pipelineCache;
    uint64_t v49 = LOBYTE(v223->KERNEL_INDEX_DISPATCH_BINS_WIDE);
    *(_OWORD *)v147 = *(_OWORD *)v210;
    *(void *)&v147[16] = *(void *)&v210[16];
    unint64_t v50 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | v49;
    if (v216) {
      unint64_t v50 = v50 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v216) << 28);
    }
    *(void *)v147 = v50;
    uint64_t v47 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v48, (long long *)v147);
  }
  v206 = v47;
  v205 = 0;
  char v51 = &v223->_pipelineCache;
  uint64_t KERNEL_INDEX_BIN_FRAGMENTS_low = LOBYTE(v223->KERNEL_INDEX_BIN_FRAGMENTS);
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v53 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_BIN_FRAGMENTS_low;
  if (binningTGSize) {
    unint64_t v53 = v53 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)binningTGSize) << 28);
  }
  *(void *)v147 = v53;
  v205 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v51, (long long *)v147);
  v204 = 0;
  v54 = &v223->_pipelineCache;
  uint64_t KERNEL_INDEX_CLEAR_BATCHES_low = LOBYTE(v223->KERNEL_INDEX_CLEAR_BATCHES);
  unsigned int threadgroupSize = v223->_threadgroupSize;
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v57 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_CLEAR_BATCHES_low;
  if (threadgroupSize) {
    unint64_t v57 = v57 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)threadgroupSize) << 28);
  }
  *(void *)v147 = v57;
  v204 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v54, (long long *)v147);
  v203 = 0;
  v58 = &v223->_pipelineCache;
  uint64_t KERNEL_INDEX_CREATE_BVH_NODES_low = LOBYTE(v223->KERNEL_INDEX_CREATE_BVH_NODES);
  unsigned int v60 = v223->_threadgroupSize;
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v61 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_CREATE_BVH_NODES_low;
  if (v60) {
    unint64_t v61 = v61 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v60) << 28);
  }
  *(void *)v147 = v61;
  v203 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v58, (long long *)v147);
  v202 = 0;
  long long v62 = &v223->_pipelineCache;
  uint64_t KERNEL_INDEX_FIND_BEST_SPLIT_low = LOBYTE(v223->KERNEL_INDEX_FIND_BEST_SPLIT);
  unsigned int v64 = v223->_threadgroupSize;
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v65 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_FIND_BEST_SPLIT_low;
  if (v64) {
    unint64_t v65 = v65 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v64) << 28);
  }
  *(void *)v147 = v65;
  v202 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v62, (long long *)v147);
  v201 = 0;
  v200 = 0;
  v199 = 0;
  unsigned int v142 = v23;
  if (v211)
  {
    int v66 = v18;
    BOOL v67 = v212;
    long long v68 = &v223->_pipelineCache;
    unint64_t v69 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | LOBYTE(v223->KERNEL_INDEX_SPLIT_FRAGMENTS);
    if (splitTGSize) {
      unint64_t v69 = v69 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)splitTGSize) << 28);
    }
    *(_OWORD *)&v147[8] = *(_OWORD *)&v210[8];
    *(void *)v147 = v69 & 0xFFFF9EFFF7FFFFFFLL | ((unint64_t)!v67 << 27) | 0x10000000000;
    v201 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v68, (long long *)v147);
    uint64_t KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM_low = LOBYTE(v223->KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM);
    *(_OWORD *)&v147[8] = *(_OWORD *)&v210[8];
    *(void *)v147 = KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM_low & 0xFFFFFFFFF7FFFFFFLL | *(void *)v210 & 0xFFFF9EFF07FFFF00 | ((unint64_t)!v67 << 27) | 0x100A0000000;
    v200 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v223->_pipelineCache, (long long *)v147);
    uint64_t v71 = &v223->_pipelineCache;
    unint64_t v18 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | LOBYTE(v223->KERNEL_INDEX_SPLIT_FRAGMENTS);
    if (splitTGSize) {
      unint64_t v18 = v18 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)splitTGSize) << 28);
    }
    *(_OWORD *)&v147[8] = *(_OWORD *)&v210[8];
    uint64_t v72 = 0x210000000000;
    if (!v67) {
      uint64_t v72 = 0x210008000000;
    }
    *(void *)v147 = v72 | v18 & 0xFFFF9EFFF7FFFFFFLL;
    v199 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v71, (long long *)v147);
    LODWORD(v18) = v66;
  }
  else
  {
    uint64_t v73 = &v223->_pipelineCache;
    uint64_t KERNEL_INDEX_SPLIT_FRAGMENTS_low = LOBYTE(v223->KERNEL_INDEX_SPLIT_FRAGMENTS);
    *(_OWORD *)v147 = *(_OWORD *)v210;
    *(void *)&v147[16] = *(void *)&v210[16];
    unint64_t v75 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_SPLIT_FRAGMENTS_low;
    if (splitTGSize) {
      unint64_t v75 = v75 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)splitTGSize) << 28);
    }
    *(void *)v147 = v75;
    v199 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v73, (long long *)v147);
  }
  v198 = 0;
  v76 = &v223->_pipelineCache;
  uint64_t KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL_low = LOBYTE(v223->KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL);
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v78 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL_low;
  if (v214) {
    unint64_t v78 = v78 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v214) << 28);
  }
  *(void *)v147 = v78;
  v79 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v76, (long long *)v147);
  v197 = 0;
  v198 = v79;
  v80 = &v223->_pipelineCache;
  uint64_t KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT_low = LOBYTE(v223->KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT);
  unsigned int v82 = v223->_threadgroupSize;
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v83 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT_low;
  if (v82) {
    unint64_t v83 = v83 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v82) << 28);
  }
  *(void *)v147 = v83;
  v197 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v80, (long long *)v147);
  v84 = &v223->_pipelineCache;
  uint64_t KERNEL_INDEX_INITIALIZE_QUEUE_low = LOBYTE(v223->KERNEL_INDEX_INITIALIZE_QUEUE);
  unsigned int v86 = v223->_threadgroupSize;
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v87 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_INITIALIZE_QUEUE_low;
  if (v86) {
    unint64_t v87 = v87 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v86) << 28);
  }
  *(void *)v147 = v87;
  v88 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v84, (long long *)v147);
  v89 = &v223->_pipelineCache;
  uint64_t KERNEL_INDEX_FINALIZE_GBVH_low = LOBYTE(v223->KERNEL_INDEX_FINALIZE_GBVH);
  unsigned int v91 = v223->_threadgroupSize;
  *(_OWORD *)v147 = *(_OWORD *)v210;
  *(void *)&v147[16] = *(void *)&v210[16];
  unint64_t v92 = *(void *)v210 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_FINALIZE_GBVH_low;
  if (v91) {
    unint64_t v92 = v92 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v91) << 28);
  }
  *(void *)v147 = v92;
  v140 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v89, (long long *)v147);
  v195 = 0;
  uint64_t v196 = 0;
  v93 = &v223->_pipelineCache;
  int KERNEL_INDEX_FINISH_BUILD_ITERATION_low = LOBYTE(v223->KERNEL_INDEX_FINISH_BUILD_ITERATION);
  *(void *)&v147[8] = 0;
  *(void *)&v147[16] = 0;
  *(void *)v147 = KERNEL_INDEX_FINISH_BUILD_ITERATION_low | (log2((double)v223->_pipelineCache.baseThreadgroupSize) << 28);
  v95 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v93, (long long *)v147, &v196);
  unsigned int v96 = binningTGSize;
  uint64_t v194 = binningTGSize;
  v195 = v95;
  v192 = 0;
  v193 = 0;
  if (v218)
  {
    int v97 = v18;
    v98 = &v223->_pipelineCache;
    uint64_t KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL_low = LOBYTE(v223->KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL);
    BOOL v100 = v212;
    if (a4) {
      [a4 cachedPipelineKey];
    }
    else {
      memset(v147, 0, sizeof(v147));
    }
    long long v183 = *(_OWORD *)v147;
    v184 = *(id **)&v147[16];
    unint64_t v101 = KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL_low | ((unint64_t)!v100 << 27) | *(void *)v147 & 0xFFFF9EFFF7FFFF00 | 0x10000000000;
    if (v96) {
      unint64_t v101 = v101 & 0xFFFF9FFF0FFFFFFFLL | (log2((double)v96) << 28);
    }
    *(void *)&long long v183 = v101;
    v193 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v98, &v183);
    v102 = &v223->_pipelineCache;
    uint64_t KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT_low = LOBYTE(v223->KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT);
    BOOL v104 = v212;
    unint64_t baseThreadgroupSize = v223->_pipelineCache.baseThreadgroupSize;
    if (a4) {
      [a4 cachedPipelineKey];
    }
    else {
      memset(v147, 0, sizeof(v147));
    }
    long long v183 = *(_OWORD *)v147;
    v184 = *(id **)&v147[16];
    unint64_t v18 = KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT_low | ((unint64_t)!v104 << 27) | *(void *)v147 & 0xFFFF9EFFF7FFFF00 | 0x10000000000;
    if (baseThreadgroupSize) {
      unint64_t v18 = v18 & 0xFFFF9FFF0FFFFFFFLL | (log2((double)baseThreadgroupSize) << 28);
    }
    *(void *)&long long v183 = v18;
    v192 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v102, &v183, 0);
    LODWORD(v18) = v97;
  }
  v191 = 0;
  v106 = &v223->_pipelineCache;
  int KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low = LOBYTE(v223->KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS);
  unint64_t v108 = v223->_pipelineCache.baseThreadgroupSize;
  *(void *)&v147[8] = 0;
  *(void *)&v147[16] = 0;
  *(void *)v147 = KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low | (log2((double)v108) << 28);
  v191 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v106, (long long *)v147);
  [v222 setComputePipelineState:v88];
  [v222 memoryBarrierWithScope:1];
  int64x2_t v188 = vdupq_n_s64(1uLL);
  int64x2_t v189 = v188;
  uint64_t v190 = 1;
  uint64_t v187 = v196;
  [v222 dispatchThreadgroups:&v189 threadsPerThreadgroup:&v187];
  [v222 memoryBarrierWithScope:1];
  *(void *)&long long v183 = &v223;
  *((void *)&v183 + 1) = &v222;
  v184 = &v221;
  v185 = &v220;
  unint64_t v186 = v13;
  char v182 = 0;
  char v182 = [a4 useParallelWideBuild];
  int v181 = 0;
  *(void *)v147 = &v219;
  *(void *)&v147[8] = &v212;
  *(void *)&v147[16] = &v222;
  v148 = &v191;
  v149 = &v196;
  v150 = &v182;
  v151 = &v186;
  v152 = &v206;
  v153 = &v207;
  v154 = &v221;
  v155 = &v220;
  v156 = &v216;
  v157 = &v208;
  p_Pipeline = &Pipeline;
  v159 = &v217;
  v160 = &v183;
  v161 = &v204;
  v162 = &v223;
  v163 = &v205;
  p_unsigned int binningTGSize = &binningTGSize;
  v165 = &v202;
  v166 = a12;
  v167 = &v198;
  v168 = &v214;
  v169 = &v197;
  v170 = &v218;
  v171 = &v193;
  v172 = &v194;
  v173 = &v192;
  v174 = &v211;
  v175 = &v201;
  p_unsigned int splitTGSize = &splitTGSize;
  int v109 = v142 >> 1;
  if (v142 >> 1 <= 1) {
    int v109 = 1;
  }
  v177 = &v200;
  v178 = &v199;
  if (v142 >= 0xA) {
    int v110 = 5;
  }
  else {
    int v110 = v109;
  }
  v179 = &v203;
  v180 = &v195;
  {
    -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::evMaxSpatialSplitsIterations = -1;
  }
  if (-[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::evMaxSpatialSplitsIterations >= 0) {
    unsigned int v111 = -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::evMaxSpatialSplitsIterations;
  }
  else {
    unsigned int v111 = v110;
  }
  if (v182)
  {
    int v112 = log2((double)v18);
    if (v212) {
      goto LABEL_115;
    }
  }
  else
  {
    if ((v18 - 1) >= 2) {
      int v124 = 2;
    }
    else {
      int v124 = v18 - 1;
    }
    if (v219) {
      int v112 = v18 - 1;
    }
    else {
      int v112 = v124;
    }
    if (v212)
    {
LABEL_115:
      LOWORD(v181) = v142 - 1;
      HIWORD(v181) = v112;
      objc_msgSend(v222, "setBytes:length:atIndex:", &v181, 4, 2, v140);
      if (v142 != 1)
      {
        unsigned int v113 = 0;
        int var15 = a12->var15;
        do
        {
          if (var15 && v113 >= v111)
          {
            a12->int var15 = 0;
            [v222 setBytes:a12 length:72 atIndex:1];
          }
          -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::$_9::operator()((uint64_t)v147, v112, v113, 0);
          int var15 = a12->var15;
          unint64_t v115 = v186;
          if (a12->var15) {
            unint64_t v115 = (unint64_t)(float)((float)v186 * 1.08);
          }
          unint64_t v186 = (unint64_t)(float)((float)(1.4 / (float)v18) * (float)v115);
          ++v113;
        }
        while (v142 - 1 != v113);
      }
      LOWORD(v181) = v142;
      if (v182)
      {
        HIWORD(v181) = v18 - 1;
        int v112 = v18 - 1;
      }
      [v222 setBytes:&v181 length:4 atIndex:2];
      if (a4)
      {
        *(_OWORD *)((char *)a4 + 168) = v144;
        [a4 updatePipelineKey];
        int v116 = *((_DWORD *)a4 + 4);
        [a4 cachedPipelineKey];
        int v117 = v116 - 1;
      }
      else
      {
        [0 updatePipelineKey];
        long long v145 = 0uLL;
        int v117 = -1;
        uint64_t v146 = 0;
      }
      v118 = &v223->_pipelineCache;
      uint64_t v119 = LOBYTE(v223->KERNEL_INDEX_DISPATCH_BINS);
      v226[0] = v145;
      *(void *)&v226[1] = v146;
      unint64_t v120 = v145 & 0xFFFF9EFFF7FFFF00 | 0x400008000000 | v119;
      if (v216) {
        unint64_t v120 = v145 & 0xFFFF9EFF07FFFF00 | 0x400008000000 | v119 & 0xFFFFDEFF0FFFFFFFLL | (log2((double)v216) << 28);
      }
      *(void *)&v226[0] = v120;
      v207 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v118, v226);
      if (a4 && *((void *)a4 + 20) == 2)
      {
        v206 = 0;
        v121 = &v223->_pipelineCache;
        unsigned int KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS = v223->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS;
        unsigned int v123 = v223->_threadgroupSize;
      }
      else
      {
        v128 = &v223->_pipelineCache;
        uint64_t v129 = LOBYTE(v223->KERNEL_INDEX_DISPATCH_BINS_WIDE);
        v226[0] = v145;
        *(void *)&v226[1] = v146;
        unint64_t v130 = v145 & 0xFFFF9EFFF7FFFF00 | 0x400008000000 | v129;
        if (v216) {
          unint64_t v130 = v145 & 0xFFFF9EFF07FFFF00 | 0x400008000000 | v129 & 0xFFFFDEFF0FFFFFFFLL | (log2((double)v216) << 28);
        }
        *(void *)&v226[0] = v130;
        v206 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v128, v226);
        v121 = &v223->_pipelineCache;
        unsigned int KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS = v223->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS;
        unsigned int v123 = v223->_threadgroupSize;
        if (!a4)
        {
          memset(v226, 0, 24);
          goto LABEL_151;
        }
      }
      [a4 cachedPipelineKey];
LABEL_151:
      long long v224 = v226[0];
      uint64_t v225 = *(void *)&v226[1];
      unint64_t v131 = KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS | *(void *)&v226[0] & 0xFFFF9EFFF7FFFF00 | 0x10008000000;
      if (v123) {
        unint64_t v131 = v131 & 0xFFFF9FFF0FFFFFFFLL | (log2((double)v123) << 28);
      }
      *(void *)&long long v224 = v131;
      v132 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v121, &v224, 0);
      uint64_t v133 = [v221 gpuAddress];
      v226[0] = v220 + v133;
      [(BVHTopDownBuilder *)v223 setCounters:v226 numCounters:1 encoder:v222];
      [**((id **)&v183 + 1) setComputePipelineState:v132];
      [**((id **)&v183 + 1) memoryBarrierWithScope:1];
      [**((id **)&v183 + 1) dispatchThreadsWithIndirectBuffer:*v184 indirectBufferOffset:*v185 + 192];
      -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::$_9::operator()((uint64_t)v147, v112, v117, 1);
      goto LABEL_154;
    }
  }
  LOWORD(v181) = v142;
  HIWORD(v181) = v112;
  objc_msgSend(v222, "setBytes:length:atIndex:", &v181, 4, 2, v140);
  if (v142)
  {
    unsigned int v125 = 0;
    int v126 = a12->var15;
    do
    {
      if (v126 && v125 >= v111)
      {
        a12->int var15 = 0;
        [v222 setBytes:a12 length:72 atIndex:1];
      }
      -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::$_9::operator()((uint64_t)v147, v112, v125, v125 - v142 == -1);
      int v126 = a12->var15;
      unint64_t v127 = v186;
      if (a12->var15) {
        unint64_t v127 = (unint64_t)(float)((float)v186 * 1.08);
      }
      unint64_t v186 = (unint64_t)(float)((float)(1.4 / (float)v18) * (float)v127);
      ++v125;
    }
    while (v125 != v142);
  }
LABEL_154:
  unsigned int v134 = v223->_threadgroupSize;
  if (!v134) {
    unsigned int v134 = *(_DWORD *)(*(void *)v183 + 16);
  }
  uint64_t v135 = v134;
  [**((id **)&v183 + 1) setComputePipelineState:v141];
  [**((id **)&v183 + 1) memoryBarrierWithScope:1];
  v136 = (void *)**((void **)&v183 + 1);
  id v137 = *v184;
  uint64_t v138 = *v185 + 192;
  *(void *)&v226[0] = v135;
  *(int64x2_t *)((char *)v226 + 8) = vdupq_n_s64(1uLL);
  [v136 dispatchThreadgroupsWithIndirectBuffer:v137 indirectBufferOffset:v138 threadsPerThreadgroup:v226];
}

- (uint64_t)buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:
{
  if (a2)
  {
    uint64_t v7 = result;
    int v8 = 0;
    long long v84 = xmmword_242EA8590;
    do
    {
      if (!**(unsigned char **)v7 || **(unsigned char **)(v7 + 8) && (a4 & 1) != 0)
      {
        if (!v8) {
          goto LABEL_11;
        }
      }
      else
      {
        objc_msgSend(**(id **)(v7 + 16), "setComputePipelineState:", **(void **)(v7 + 24), v84);
        [**(id **)(v7 + 16) memoryBarrierWithScope:1];
        unint64_t v14 = **(void ***)(v7 + 16);
        int64x2_t v95 = vdupq_n_s64(1uLL);
        uint64_t v96 = 1;
        uint64_t v93 = **(void **)(v7 + 32);
        int64x2_t v94 = v95;
        [v14 dispatchThreadgroups:&v95 threadsPerThreadgroup:&v93];
        if (!v8)
        {
LABEL_11:
          int v13 = 0;
          if (a3 && **(unsigned char **)(v7 + 40))
          {
            if (**(unsigned char **)(v7 + 8)) {
              int v13 = a4 ^ 1;
            }
            else {
              int v13 = 1;
            }
          }
          goto LABEL_16;
        }
      }
      int v13 = 1;
LABEL_16:
      objc_msgSend(**(id **)(v7 + 16), "memoryBarrierWithScope:", 1, v84);
      if (**(void **)(v7 + 48) >= 0x101uLL && (**(unsigned char **)(v7 + 8) ? (BOOL v15 = a4 == 0) : (BOOL v15 = 1), v15))
      {
        uint64_t v16 = 104;
        if (v13) {
          uint64_t v16 = 96;
        }
        [**(id **)(v7 + 16) setComputePipelineState:**(void **)(v7 + v16)];
        uint64_t v17 = **(void ***)(v7 + 16);
        uint64_t v18 = **(void **)(v7 + 72);
        uint64_t v19 = **(void **)(v7 + 80);
        uint64_t v89 = **(unsigned int **)(v7 + 112);
        int64x2_t v90 = vdupq_n_s64(1uLL);
        unint64_t v20 = &v89;
      }
      else
      {
        if (v13) {
          uint64_t v21 = 56;
        }
        else {
          uint64_t v21 = 64;
        }
        [**(id **)(v7 + 16) setComputePipelineState:**(void **)(v7 + v21)];
        uint64_t v17 = **(void ***)(v7 + 16);
        uint64_t v18 = **(void **)(v7 + 72);
        uint64_t v19 = **(void **)(v7 + 80);
        uint64_t v91 = **(unsigned int **)(v7 + 88);
        int64x2_t v92 = vdupq_n_s64(1uLL);
        unint64_t v20 = &v91;
      }
      [v17 dispatchThreadgroupsWithIndirectBuffer:v18 indirectBufferOffset:v19 threadsPerThreadgroup:v20];
      if (**(unsigned char **)v7 && (!**(unsigned char **)(v7 + 8) || (a4 & 1) == 0))
      {
        uint64_t v22 = *(void *)(v7 + 120);
        uint64_t v23 = *(unsigned int *)(**(void **)(v7 + 136) + 16);
        if (!v23) {
          uint64_t v23 = *(unsigned int *)(**(void **)v22 + 16);
        }
        [**(id **)(v22 + 8) setComputePipelineState:**(void **)(v7 + 128)];
        [**(id **)(v22 + 8) memoryBarrierWithScope:1];
        long double v24 = **(void ***)(v22 + 8);
        uint64_t v25 = **(void **)(v22 + 16);
        uint64_t v26 = **(void **)(v22 + 24) + 64;
        *(void *)int v97 = v23;
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        [v24 dispatchThreadgroupsWithIndirectBuffer:v25 indirectBufferOffset:v26 threadsPerThreadgroup:v97];
        uint64_t v27 = *(void *)(v7 + 120);
        uint64_t v28 = **(unsigned int **)(v7 + 152);
        if (!v28) {
          uint64_t v28 = *(unsigned int *)(**(void **)v27 + 16);
        }
        [**(id **)(v27 + 8) setComputePipelineState:**(void **)(v7 + 144)];
        [**(id **)(v27 + 8) memoryBarrierWithScope:1];
        uint64_t v29 = **(void ***)(v27 + 8);
        uint64_t v30 = **(void **)(v27 + 16);
        uint64_t v31 = **(void **)(v27 + 24) + 128;
        *(void *)int v97 = v28;
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        [v29 dispatchThreadgroupsWithIndirectBuffer:v30 indirectBufferOffset:v31 threadsPerThreadgroup:v97];
        uint64_t v32 = *(void *)(v7 + 120);
        uint64_t v33 = *(unsigned int *)(**(void **)(v7 + 136) + 16);
        if (!v33) {
          uint64_t v33 = *(unsigned int *)(**(void **)v32 + 16);
        }
        [**(id **)(v32 + 8) setComputePipelineState:**(void **)(v7 + 160)];
        [**(id **)(v32 + 8) memoryBarrierWithScope:1];
        unint64_t v34 = **(void ***)(v32 + 8);
        uint64_t v35 = **(void **)(v32 + 16);
        uint64_t v36 = **(void **)(v32 + 24) + 64;
        *(void *)int v97 = v33;
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        [v34 dispatchThreadgroupsWithIndirectBuffer:v35 indirectBufferOffset:v36 threadsPerThreadgroup:v97];
        if (*(_WORD *)(*(void *)(v7 + 168) + 50))
        {
          uint64_t v37 = *(void *)(v7 + 120);
          uint64_t v38 = *(unsigned int *)(**(void **)(v7 + 136) + 16);
          if (!v38) {
            uint64_t v38 = *(unsigned int *)(**(void **)v37 + 16);
          }
          [**(id **)(v37 + 8) setComputePipelineState:**(void **)(v7 + 128)];
          [**(id **)(v37 + 8) memoryBarrierWithScope:1];
          unint64_t v39 = **(void ***)(v37 + 8);
          uint64_t v40 = **(void **)(v37 + 16);
          uint64_t v41 = **(void **)(v37 + 24) + 64;
          *(void *)int v97 = v38;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          [v39 dispatchThreadgroupsWithIndirectBuffer:v40 indirectBufferOffset:v41 threadsPerThreadgroup:v97];
          uint64_t v42 = *(void *)(v7 + 120);
          uint64_t v43 = **(unsigned int **)(v7 + 184);
          if (!v43) {
            uint64_t v43 = *(unsigned int *)(**(void **)v42 + 16);
          }
          [**(id **)(v42 + 8) setComputePipelineState:**(void **)(v7 + 176)];
          [**(id **)(v42 + 8) memoryBarrierWithScope:1];
          unsigned int v44 = **(void ***)(v42 + 8);
          uint64_t v45 = **(void **)(v42 + 16);
          uint64_t v46 = **(void **)(v42 + 24) + 160;
          *(void *)int v97 = v43;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          [v44 dispatchThreadgroupsWithIndirectBuffer:v45 indirectBufferOffset:v46 threadsPerThreadgroup:v97];
          uint64_t v47 = *(void *)(v7 + 120);
          uint64_t v48 = *(unsigned int *)(**(void **)(v7 + 136) + 16);
          if (!v48) {
            uint64_t v48 = *(unsigned int *)(**(void **)v47 + 16);
          }
          [**(id **)(v47 + 8) setComputePipelineState:**(void **)(v7 + 192)];
          [**(id **)(v47 + 8) memoryBarrierWithScope:1];
          uint64_t v49 = **(void ***)(v47 + 8);
          uint64_t v50 = **(void **)(v47 + 16);
          uint64_t v51 = **(void **)(v47 + 24) + 96;
          *(void *)int v97 = v48;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          [v49 dispatchThreadgroupsWithIndirectBuffer:v50 indirectBufferOffset:v51 threadsPerThreadgroup:v97];
        }
        if (**(unsigned char **)(v7 + 200))
        {
          uint64_t v52 = *(void *)(v7 + 120);
          uint64_t v53 = *(unsigned int *)(**(void **)(v7 + 136) + 16);
          if (!v53) {
            uint64_t v53 = *(unsigned int *)(**(void **)v52 + 16);
          }
          [**(id **)(v52 + 8) setComputePipelineState:**(void **)(v7 + 128)];
          [**(id **)(v52 + 8) memoryBarrierWithScope:1];
          v54 = **(void ***)(v52 + 8);
          uint64_t v55 = **(void **)(v52 + 16);
          uint64_t v56 = **(void **)(v52 + 24) + 64;
          *(void *)int v97 = v53;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          [v54 dispatchThreadgroupsWithIndirectBuffer:v55 indirectBufferOffset:v56 threadsPerThreadgroup:v97];
          uint64_t v57 = *(void *)(v7 + 120);
          uint64_t v58 = **(void **)(v7 + 216);
          if (!v58) {
            uint64_t v58 = *(unsigned int *)(**(void **)v57 + 16);
          }
          [**(id **)(v57 + 8) setComputePipelineState:**(void **)(v7 + 208)];
          [**(id **)(v57 + 8) memoryBarrierWithScope:1];
          long long v59 = **(void ***)(v57 + 8);
          uint64_t v60 = **(void **)(v57 + 16);
          uint64_t v61 = **(void **)(v57 + 24) + 160;
          *(void *)int v97 = v58;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          [v59 dispatchThreadgroupsWithIndirectBuffer:v60 indirectBufferOffset:v61 threadsPerThreadgroup:v97];
          uint64_t v62 = *(void *)(v7 + 120);
          uint64_t v63 = *(unsigned int *)(**(void **)(v7 + 136) + 16);
          if (!v63) {
            uint64_t v63 = *(unsigned int *)(**(void **)v62 + 16);
          }
          [**(id **)(v62 + 8) setComputePipelineState:**(void **)(v7 + 224)];
          [**(id **)(v62 + 8) memoryBarrierWithScope:1];
          unsigned int v64 = **(void ***)(v62 + 8);
          uint64_t v65 = **(void **)(v62 + 16);
          uint64_t v66 = **(void **)(v62 + 24) + 96;
          *(void *)int v97 = v63;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          [v64 dispatchThreadgroupsWithIndirectBuffer:v65 indirectBufferOffset:v66 threadsPerThreadgroup:v97];
        }
        uint64_t v67 = *(void *)(v7 + 120);
        long long v68 = *(_DWORD **)(v7 + 248);
        uint64_t v69 = *v68;
        if (**(unsigned char **)(v7 + 232))
        {
          if (!*v68) {
            uint64_t v69 = *(unsigned int *)(**(void **)v67 + 16);
          }
          [**(id **)(v67 + 8) setComputePipelineState:**(void **)(v7 + 240)];
          [**(id **)(v67 + 8) memoryBarrierWithScope:1];
          uint64_t v70 = **(void ***)(v67 + 8);
          uint64_t v71 = **(void **)(v67 + 16);
          uint64_t v72 = **(void **)(v67 + 24) + 128;
          *(void *)int v97 = v69;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          [v70 dispatchThreadgroupsWithIndirectBuffer:v71 indirectBufferOffset:v72 threadsPerThreadgroup:v97];
          uint64_t v73 = *(void *)(v7 + 120);
          [**(id **)(v73 + 8) setComputePipelineState:**(void **)(v7 + 256)];
          [**(id **)(v73 + 8) memoryBarrierWithScope:1];
          uint64_t v74 = **(void ***)(v73 + 8);
          uint64_t v75 = **(void **)(v73 + 16);
          uint64_t v76 = **(void **)(v73 + 24) + 64;
          *(_OWORD *)int v97 = v84;
          *(void *)&v97[16] = 1;
          [v74 dispatchThreadgroupsWithIndirectBuffer:v75 indirectBufferOffset:v76 threadsPerThreadgroup:v97];
          uint64_t v77 = *(void *)(v7 + 120);
          uint64_t v78 = **(unsigned int **)(v7 + 248);
          if (!v78) {
            uint64_t v78 = *(unsigned int *)(**(void **)v77 + 16);
          }
          [**(id **)(v77 + 8) setComputePipelineState:**(void **)(v7 + 264)];
          [**(id **)(v77 + 8) memoryBarrierWithScope:1];
          v79 = **(void ***)(v77 + 8);
          uint64_t v80 = **(void **)(v77 + 16);
          uint64_t v81 = **(void **)(v77 + 24) + 128;
          *(void *)int v97 = v78;
        }
        else
        {
          if (!*v68) {
            uint64_t v69 = *(unsigned int *)(**(void **)v67 + 16);
          }
          [**(id **)(v67 + 8) setComputePipelineState:**(void **)(v7 + 264)];
          [**(id **)(v67 + 8) memoryBarrierWithScope:1];
          v79 = **(void ***)(v67 + 8);
          uint64_t v80 = **(void **)(v67 + 16);
          uint64_t v81 = **(void **)(v67 + 24) + 128;
          *(void *)int v97 = v69;
        }
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        [v79 dispatchThreadgroupsWithIndirectBuffer:v80 indirectBufferOffset:v81 threadsPerThreadgroup:v97];
        uint64_t v82 = *(void *)(v7 + 120);
        uint64_t v83 = *(unsigned int *)(**(void **)(v7 + 136) + 16);
        if (!v83) {
          uint64_t v83 = *(unsigned int *)(**(void **)v82 + 16);
        }
        objc_msgSend(**(id **)(v82 + 8), "setComputePipelineState:");
        [**(id **)(v82 + 8) memoryBarrierWithScope:1];
        v9 = **(void ***)(v82 + 8);
        uint64_t v10 = **(void **)(v82 + 16);
        uint64_t v11 = **(void **)(v82 + 24) + 64;
        *(void *)int v97 = v83;
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        [v9 dispatchThreadgroupsWithIndirectBuffer:v10 indirectBufferOffset:v11 threadsPerThreadgroup:v97];
      }
      [**(id **)(v7 + 16) setComputePipelineState:**(void **)(v7 + 280)];
      [**(id **)(v7 + 16) memoryBarrierWithScope:1];
      v12 = **(void ***)(v7 + 16);
      int64x2_t v87 = vdupq_n_s64(1uLL);
      uint64_t v88 = 1;
      uint64_t v85 = *(unsigned int *)(**(void **)(v7 + 136) + 16);
      int64x2_t v86 = v87;
      result = [v12 dispatchThreadgroups:&v87 threadsPerThreadgroup:&v85];
      ++v8;
    }
    while (a2 != v8);
  }
  return result;
}

- (void)getFragmentsWithEncoder:(id)a3 descriptor:(id)a4 primitiveCountBufferAddress:(unint64_t)a5 fragmentScratchBuffer:(id)a6 fragmentScratchBufferOffset:(unint64_t)a7
{
  p_pipelineCache = &self->_pipelineCache;
  uint64_t KERNEL_INDEX_INITIALIZE_FRAGMENTS_low = LOBYTE(self->KERNEL_INDEX_INITIALIZE_FRAGMENTS);
  if (a4)
  {
    objc_msgSend(a4, "cachedPipelineKey", a3, a4, a5);
  }
  else
  {
    long long v43 = 0uLL;
    uint64_t v44 = 0;
  }
  *((void *)&v41 + 1) = *((void *)&v43 + 1);
  uint64_t v42 = v44;
  *(void *)&long long v41 = v43 & 0xFFFF9EFF07FFFF00 | KERNEL_INDEX_INITIALIZE_FRAGMENTS_low | 0x10058000000;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v41, 0));
  int64x2_t v39 = vdupq_n_s64(1uLL);
  uint64_t v40 = 1;
  long long v37 = xmmword_242EA7FC0;
  uint64_t v38 = 1;
  [a3 dispatchThreadgroups:&v39 threadsPerThreadgroup:&v37];
  if (a4)
  {
    unint64_t v14 = *((void *)a4 + 3);
    if (v14)
    {
      {
        -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::pipelineIndices = *(void *)&self->KERNEL_INDEX_GET_POLYGON_FRAGMENTS;
        v29.i64[0] = -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::pipelineIndices;
        v30.i32[0] = self->KERNEL_INDEX_GET_CURVE_FRAGMENTS;
        int8x16_t v31 = vextq_s8(vextq_s8(v30, v30, 4uLL), v29, 0xCuLL);
        v31.i32[3] = v31.i32[0];
        *(int8x16_t *)algn_268D5A650 = v31;
        qword_268D5A660 = (uint64_t)vdup_lane_s32((int32x2_t)-[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::pipelineIndices, 1);
      }
      uint64_t v15 = *((unsigned int *)a4 + 34);
      {
        -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::tgSize = 0;
      }
      unsigned int v16 = -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::tgSize;
      if (!-[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::tgSize)
      {
        unsigned int v17 = 32 - __clz(v14);
        if (v17 <= 7) {
          unsigned int v17 = 7;
        }
        if (v17 >= 0xB) {
          unsigned int v17 = 11;
        }
        unsigned int v16 = dword_242EAADE0[v17 - 7];
      }
      unint64_t v18 = v16;
      if (v14 <= v16)
      {
        LODWORD(v19) = 0;
      }
      else
      {
        {
          -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
        }
        if (-[BVHDescriptor isDeterministic]::forceDeterministic) {
          LODWORD(v19) = 1;
        }
        else {
          unint64_t v19 = ((unint64_t)[*((id *)a4 + 6) usage] >> 3) & 1;
        }
      }
      [a4 cachedPipelineKey];
      uint64_t v20 = *((unsigned __int8 *)&-[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::pipelineIndices
            + 4 * v15);
      long long v41 = v43;
      uint64_t v42 = v44;
      uint64_t v21 = v43 & 0xFFFFFFFFFFFFFF00 | v20;
      if (v18) {
        uint64_t v21 = v21 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v18) << 28);
      }
      uint64_t v22 = 0x100000000000;
      if (!v19) {
        uint64_t v22 = 0;
      }
      *(void *)&long long v41 = v21 & 0xFFFFEFFFFFFFFFFFLL | v22;
      if (v19)
      {
        *((void *)&v43 + 1) = *((void *)&v41 + 1);
        uint64_t v44 = v42;
        *(void *)&long long v43 = v41 & 0xFFFF9EFFF7FFFFFFLL | 0x10008000000;
        Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v43);
        *((void *)&v43 + 1) = *((void *)&v41 + 1);
        uint64_t v44 = v42;
        *(void *)&long long v43 = v41 & 0xFFFF9EFFF7FFFFFFLL | 0x210008000000;
        long double v24 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v43);
      }
      else
      {
        long double v24 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v41);
        Pipeline = 0;
      }
      unint64_t v25 = v18 + *((void *)a4 + 3) - 1;
      if (v25 >= v18) {
        uint64_t v26 = v25 / v18;
      }
      else {
        uint64_t v26 = 1;
      }
      if (v19) {
        int v27 = 2;
      }
      else {
        int v27 = 1;
      }
      if (v19)
      {
        [a3 memoryBarrierWithScope:1];
        [a3 setComputePipelineState:Pipeline];
        uint64_t v35 = v26;
        int64x2_t v36 = vdupq_n_s64(1uLL);
        unint64_t v33 = v18;
        int64x2_t v34 = v36;
        [a3 dispatchThreadgroups:&v35 threadsPerThreadgroup:&v33];
        [(BVHTopDownBuilder *)self prefixSumWithEncoder:a3 inputBuffer:a6 inputBufferOffset:a7 reducedBuffer:0 reducedBufferOffset:0 scratchBuffer:a6 scratchBufferOffset:4 * v26 countBuffer:0 countBufferOffset:0 capacity:v26];
        int v28 = v27 - 1;
        do
        {
          [a3 memoryBarrierWithScope:1];
          [a3 setComputePipelineState:v24];
          uint64_t v35 = v26;
          int64x2_t v36 = vdupq_n_s64(1uLL);
          unint64_t v33 = v18;
          int64x2_t v34 = v36;
          [a3 dispatchThreadgroups:&v35 threadsPerThreadgroup:&v33];
          --v28;
        }
        while (v28);
      }
      else
      {
        int64x2_t v32 = vdupq_n_s64(1uLL);
        do
        {
          [a3 memoryBarrierWithScope:1];
          [a3 setComputePipelineState:v24];
          uint64_t v35 = v26;
          int64x2_t v36 = v32;
          unint64_t v33 = v18;
          int64x2_t v34 = v32;
          [a3 dispatchThreadgroups:&v35 threadsPerThreadgroup:&v33];
          --v27;
        }
        while (v27);
      }
    }
  }
}

- (void)copyFromBuffer:(id)a3 sourceBufferOffset:(unint64_t)a4 toBuffer:(id)a5 destinationBufferOffset:(unint64_t)a6 length:(unint64_t)a7 encoder:(id)a8
{
  if (a7)
  {
    unint64_t v22 = 0;
    p_pipelineCache = &self->_pipelineCache;
    int KERNEL_INDEX_COPY_low = LOBYTE(self->KERNEL_INDEX_COPY);
    *((void *)&v23 + 1) = 0;
    unint64_t v24 = 0;
    *(void *)&long long v23 = KERNEL_INDEX_COPY_low | (log2((double)self->_pipelineCache.baseThreadgroupSize) << 28);
    objc_msgSend(a8, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v23, &v22));
    [a8 useResource:a3 usage:1];
    [a8 useResource:a5 usage:2];
    *(void *)&long long v23 = [a3 gpuAddress] + a4;
    unint64_t v16 = (a7 + 3) >> 2;
    *((void *)&v23 + 1) = [a5 gpuAddress] + a6;
    unint64_t v24 = v16;
    [a8 setBytes:&v23 length:24 atIndex:28];
    unint64_t v17 = (v16 + v22 - 1) / v22;
    [a8 memoryBarrierWithScope:1];
    unint64_t v20 = v17;
    int64x2_t v21 = vdupq_n_s64(1uLL);
    unint64_t v18 = v22;
    int64x2_t v19 = v21;
    [a8 dispatchThreadgroups:&v20 threadsPerThreadgroup:&v18];
  }
}

- (void)copySourceAddress:(unint64_t)a3 destinationAddress:(unint64_t)a4 length:(unint64_t)a5 encoder:(id)a6
{
  if (a5)
  {
    unint64_t v18 = 0;
    p_pipelineCache = &self->_pipelineCache;
    int KERNEL_INDEX_COPY_low = LOBYTE(self->KERNEL_INDEX_COPY);
    *((void *)&v19 + 1) = 0;
    unint64_t v20 = 0;
    *(void *)&long long v19 = KERNEL_INDEX_COPY_low | (log2((double)self->_pipelineCache.baseThreadgroupSize) << 28);
    objc_msgSend(a6, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v19, &v18));
    *(void *)&long long v19 = a3;
    *((void *)&v19 + 1) = a4;
    unint64_t v12 = (a5 + 3) >> 2;
    unint64_t v20 = v12;
    [a6 setBytes:&v19 length:24 atIndex:28];
    unint64_t v13 = (v12 + v18 - 1) / v18;
    [a6 memoryBarrierWithScope:1];
    unint64_t v16 = v13;
    int64x2_t v17 = vdupq_n_s64(1uLL);
    unint64_t v14 = v18;
    int64x2_t v15 = v17;
    [a6 dispatchThreadgroups:&v16 threadsPerThreadgroup:&v14];
  }
}

- (void)setCounters:(const GBVHCounterValue *)a3 numCounters:(unint64_t)a4 encoder:(id)a5
{
  uint64_t v14 = 0;
  p_pipelineCache = &self->_pipelineCache;
  int KERNEL_INDEX_SET_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_SET_COUNTERS);
  *((void *)&v15 + 1) = 0;
  uint64_t v16 = 0;
  *(void *)&long long v15 = KERNEL_INDEX_SET_COUNTERS_low | (log2((double)self->_pipelineCache.baseThreadgroupSize) << 28);
  objc_msgSend(a5, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v15, &v14));
  [a5 setBytes:a3 length:16 * a4 atIndex:28];
  [a5 memoryBarrierWithScope:1];
  unint64_t v12 = a4;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v10 = v14;
  int64x2_t v11 = v13;
  [a5 dispatchThreads:&v12 threadsPerThreadgroup:&v10];
}

- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v4 = 0;
  return [(BVHTopDownBuilder *)self getGenericBVHSizeForDescriptor:a3 nodeOffset:&v9 fragmentPrimitiveIndicesOffset:&v8 fragmentGeometryIndicesOffset:&v7 motionFragmentOffset:&v6 fragmentIndexOffset:&v5 childIndexOffset:&v4];
}

- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3 nodeOffset:(unint64_t *)a4 fragmentPrimitiveIndicesOffset:(unint64_t *)a5 fragmentGeometryIndicesOffset:(unint64_t *)a6 motionFragmentOffset:(unint64_t *)a7 fragmentIndexOffset:(unint64_t *)a8 childIndexOffset:(unint64_t *)a9
{
  if (a3)
  {
    unint64_t v16 = *((void *)a3 + 3);
    if (*((void *)a3 + 5) && !*((_DWORD *)a3 + 34) && *((_DWORD *)a3 + 37) == 3)
    {
      double v17 = *((float *)a3 + 38) + -1.0;
      if (v17 < 0.0) {
        double v17 = 0.0;
      }
      v16 += vcvtpd_u64_f64(v17 * (double)v16);
    }
    if (*((unsigned char *)a3 + 83))
    {
      unint64_t v18 = *((void *)a3 + 25);
      if (v18 >= 2) {
        v16 *= v18 - 1;
      }
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  unint64_t v19 = -[BVHDescriptor maxInnerNodeCount]((unint64_t)a3);
  unint64_t v20 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a3);
  if (a3)
  {
    unint64_t v21 = *((void *)a3 + 3);
    if (*((void *)a3 + 5) && !*((_DWORD *)a3 + 34) && *((_DWORD *)a3 + 37) == 3)
    {
      double v22 = *((float *)a3 + 38) + -1.0;
      if (v22 < 0.0) {
        double v22 = 0.0;
      }
      v21 += vcvtpd_u64_f64(v22 * (double)v21);
    }
    if (*((unsigned char *)a3 + 83))
    {
      unint64_t v23 = *((void *)a3 + 25);
      uint64_t v24 = v23 - 1;
      if (v23 <= 1) {
        uint64_t v24 = 1;
      }
      v21 *= v24;
      if (v23 >= 2) {
        v21 *= 1 << *((_DWORD *)a3 + 52);
      }
    }
    unsigned int scratchAlignment = self->_scratchAlignment;
    p_unsigned int scratchAlignment = &self->_scratchAlignment;
    uint64_t v25 = scratchAlignment;
    uint64_t v28 = -(uint64_t)scratchAlignment;
    unint64_t v29 = (scratchAlignment + 7) & v28;
    *a4 = v29;
    uint64_t v30 = 32;
    if (*((unsigned char *)a3 + 82)) {
      uint64_t v30 = 68;
    }
  }
  else
  {
    unint64_t v21 = 0;
    unsigned int v51 = self->_scratchAlignment;
    p_unsigned int scratchAlignment = &self->_scratchAlignment;
    uint64_t v25 = v51;
    uint64_t v28 = -(uint64_t)v51;
    unint64_t v29 = (v51 + 7) & v28;
    *a4 = v29;
    uint64_t v30 = 32;
  }
  uint64_t v31 = v25 - 1;
  unint64_t v32 = (v25 - 1 + v29 + v30 * (v20 + v19)) & v28;
  *a5 = v32;
  if (!a3)
  {
    uint64_t v46 = 0;
    unint64_t v52 = (v31 + v32) & v28;
    *a6 = v52;
    unint64_t v45 = (v25 + v52 + 3) & v28;
    goto LABEL_53;
  }
  unint64_t v33 = *((void *)a3 + 3);
  uint64_t v34 = 2;
  uint64_t v35 = 3;
  uint64_t v36 = 8;
  if (!HIDWORD(v33)) {
    uint64_t v36 = 4;
  }
  if (v33 >> 24) {
    uint64_t v35 = v36;
  }
  if (v33 >= 0x10000) {
    uint64_t v34 = v35;
  }
  if (v33 >= 0x100) {
    uint64_t v37 = v34;
  }
  else {
    uint64_t v37 = 1;
  }
  unint64_t v38 = (v31 + v32 + v37 * v16) & v28;
  *a6 = v38;
  unint64_t v39 = *((void *)a3 + 5);
  if (v39 >= 0x100)
  {
    if (v39 >= 0x10000)
    {
      uint64_t v42 = 8;
      uint64_t v41 = 4;
      if (!HIDWORD(v39)) {
        uint64_t v42 = 4;
      }
      unint64_t v43 = v39 >> 24;
      uint64_t v44 = 3;
      if (v43) {
        uint64_t v44 = v42;
      }
      if (v44 * v16 < 4) {
        goto LABEL_50;
      }
      uint64_t v40 = 3;
      if (v43) {
        uint64_t v40 = v42;
      }
      goto LABEL_49;
    }
    if ((v16 & 0x7FFFFFFFFFFFFFFELL) != 0)
    {
      uint64_t v40 = 2;
      goto LABEL_49;
    }
  }
  else if (v16 >= 4)
  {
    uint64_t v40 = 1;
LABEL_49:
    uint64_t v41 = v40 * v16;
    goto LABEL_50;
  }
  uint64_t v41 = 4;
LABEL_50:
  unint64_t v45 = (v31 + v38 + v41) & v28;
  if (*((unsigned char *)a3 + 82))
  {
    *a7 = v45;
    v45 += 60 * v16;
  }
  uint64_t v46 = 4;
LABEL_53:
  unint64_t v47 = (v31 + v45) & v28;
  *a8 = v47;
  unint64_t v48 = (v31 + v46 * v21 + v47) & v28;
  *a9 = v48;
  if (a3)
  {
    uint64_t v49 = *((void *)a3 + 20);
    if (v49 == 2)
    {
      unint64_t v50 = 0;
      return (v48 + v50 + v25 - 1) & -(uint64_t)v25;
    }
  }
  else
  {
    uint64_t v49 = 0;
  }
  unint64_t v53 = v49 * v19;
  if (HIDWORD(v53)) {
    int v54 = 8;
  }
  else {
    int v54 = 4;
  }
  if (v53 >> 24) {
    int v55 = v54;
  }
  else {
    int v55 = 3;
  }
  if (v53 >= 0x10000) {
    int v56 = v55;
  }
  else {
    int v56 = 2;
  }
  if (v53 >= 0x100) {
    unsigned int v57 = v56;
  }
  else {
    unsigned int v57 = 1;
  }
  if (a3)
  {
    *((_DWORD *)a3 + 36) = v57;
    LODWORD(v25) = *p_scratchAlignment;
  }
  else
  {
    unsigned int v57 = 0;
  }
  unint64_t v50 = v53 * v57;
  return (v48 + v50 + v25 - 1) & -(uint64_t)v25;
}

- (unint64_t)fragmentTotalThreadgroupCountForDescriptor:(id)a3
{
  unint64_t v3 = 0;
  if (a3)
  {
    uint64_t v5 = *((void *)a3 + 5);
    switch(*((_DWORD *)a3 + 34))
    {
      case 1:
        uint64_t v6 = [*((id *)a3 + 6) geometryDescriptors];
        if (!v5) {
          goto LABEL_16;
        }
        uint64_t v7 = (void *)v6;
        unint64_t v3 = 0;
        for (uint64_t i = 0; i != v5; ++i)
        {
          int v9 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", i), "boundingBoxCount");
          if (v9) {
            v3 += (v9 + self->_threadgroupSize - 1) / self->_threadgroupSize;
          }
        }
        break;
      case 4:
        uint64_t v10 = [*((id *)a3 + 6) geometryDescriptors];
        if (!v5) {
          goto LABEL_16;
        }
        int64x2_t v11 = (void *)v10;
        unint64_t v3 = 0;
        for (uint64_t j = 0; j != v5; ++j)
        {
          int v13 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", j), "boundingBoxCount");
          if (v13) {
            v3 += (v13 + self->_threadgroupSize - 1) / self->_threadgroupSize;
          }
        }
        break;
      case 6:
        int v14 = [*((id *)a3 + 6) instanceCount];
        if (!v14) {
          goto LABEL_16;
        }
        goto LABEL_14;
      case 7:
        int v14 = [*((id *)a3 + 6) maxInstanceCount];
        if (v14) {
LABEL_14:
        }
          unint64_t v3 = (v14 + self->_threadgroupSize - 1) / self->_threadgroupSize;
        else {
LABEL_16:
        }
          unint64_t v3 = 0;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

- (unint64_t)getBuildScratchBufferSizeForDescriptor:(id)a3
{
  unint64_t v4 = 0;
  [(BVHTopDownBuilder *)self setupBindingsWithDescriptor:a3 scratchBuffer:0 scratchBufferOffset:0 outputBuffer:0 outputBufferOffset:0 resourceBufferAddress:0 primitiveCountBufferAddress:0 scratchBufferSize:&v4];
  return v4;
}

- (GBVHBindings)setupBindingsWithDescriptor:(SEL)a3 scratchBuffer:(id)a4 scratchBufferOffset:(id)a5 outputBuffer:(unint64_t)a6 outputBufferOffset:(id)a7 resourceBufferAddress:(unint64_t)a8 primitiveCountBufferAddress:(unint64_t)a9 scratchBufferSize:(unint64_t)a10
{
  uint64_t v15 = [a7 gpuAddress];
  unint64_t v90 = -[BVHDescriptor maxInnerNodeCount]((unint64_t)a4);
  unint64_t v96 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a4);
  if (a4)
  {
    unint64_t v16 = *((void *)a4 + 3);
    uint64_t v17 = *((void *)a4 + 5);
    unint64_t v18 = v16;
    if (v17)
    {
      unint64_t v18 = *((void *)a4 + 3);
      if (!*((_DWORD *)a4 + 34))
      {
        unint64_t v18 = *((void *)a4 + 3);
        if (*((_DWORD *)a4 + 37) == 3)
        {
          double v19 = *((float *)a4 + 38) + -1.0;
          if (v19 < 0.0) {
            double v19 = 0.0;
          }
          unint64_t v18 = v16 + vcvtpd_u64_f64(v19 * (double)v16);
        }
      }
    }
    if (*((unsigned char *)a4 + 83))
    {
      unint64_t v20 = *((void *)a4 + 25);
      if (v20 >= 2) {
        v18 *= v20 - 1;
      }
    }
    if (v17 && !*((_DWORD *)a4 + 34) && *((_DWORD *)a4 + 37) == 3)
    {
      double v21 = *((float *)a4 + 38) + -1.0;
      if (v21 < 0.0) {
        double v21 = 0.0;
      }
      v16 += vcvtpd_u64_f64(v21 * (double)v16);
    }
    unint64_t v92 = v18;
    if (*((unsigned char *)a4 + 83))
    {
      unint64_t v22 = *((void *)a4 + 25);
      uint64_t v23 = v22 - 1;
      if (v22 <= 1) {
        uint64_t v23 = 1;
      }
      v16 *= v23;
      if (v22 >= 2) {
        v16 *= 1 << *((_DWORD *)a4 + 52);
      }
    }
  }
  else
  {
    unint64_t v92 = 0;
    unint64_t v16 = 0;
  }
  uint64_t v102 = 0;
  uint64_t v100 = 0;
  uint64_t v101 = 0;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  uint64_t v97 = 0;
  [(BVHTopDownBuilder *)self getGenericBVHSizeForDescriptor:a4 nodeOffset:&v102 fragmentPrimitiveIndicesOffset:&v101 fragmentGeometryIndicesOffset:&v100 motionFragmentOffset:&v99 fragmentIndexOffset:&v98 childIndexOffset:&v97];
  unint64_t batchSize = self->_batchSize;
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  unint64_t v25 = 0;
  unint64_t v26 = 0x2000;
  if (!getBatchThreshold(void)::batchThreshold) {
    unint64_t v26 = 0;
  }
  if (v16 > v26)
  {
    unint64_t v25 = 2;
    if (!__CFADD__(v16 - 1, batchSize)) {
      unint64_t v25 = 2 * ((v16 - 1 + batchSize) / batchSize);
    }
  }
  unint64_t v94 = v25;
  unint64_t v27 = self->_batchSize;
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  unint64_t v28 = v15 + a8;
  unint64_t v29 = 0x2000;
  if (!getBatchThreshold(void)::batchThreshold) {
    unint64_t v29 = 0;
  }
  unint64_t v30 = (v16 + v27 - 1) / v27;
  if (v30 <= 1) {
    unint64_t v30 = 1;
  }
  if (v16 > v29) {
    unint64_t v31 = v30;
  }
  else {
    unint64_t v31 = 0;
  }
  if (a4) {
    BOOL v32 = *((unsigned char *)a4 + 82) != 0;
  }
  else {
    BOOL v32 = 0;
  }
  {
    -[BVHTopDownBuilder setupBindingsWithDescriptor:scratchBuffer:scratchBufferOffset:outputBuffer:outputBufferOffset:resourceBufferAddress:primitiveCountBufferAddress:scratchBufferSize:]::logScratchAllocations = 0;
  }
  result = (GBVHBindings *)[a5 gpuAddress];
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var23 = 0u;
  *(_OWORD *)&retstr->var35 = 0u;
  retstr->var1 = a10;
  retstr->var2 = a9;
  unint64_t v34 = v98 + v28;
  unint64_t v35 = v102 + v28;
  uint64_t v36 = v100;
  unint64_t v37 = v99 + v28;
  if (!v32) {
    unint64_t v37 = 0;
  }
  retstr->var24 = v37;
  retstr->var36 = v28;
  retstr->var37 = 0;
  retstr->var38 = v101 + v28;
  retstr->var39 = v36 + v28;
  unint64_t v38 = v97 + v28;
  uint64_t v39 = 6;
  if (!v32) {
    uint64_t v39 = 32;
  }
  *(_OWORD *)&retstr->var4 = 0uLL;
  retstr->var6 = 0uLL;
  *(_OWORD *)&retstr->var7 = 0uLL;
  *(_OWORD *)&retstr->var9 = 0uLL;
  *(_OWORD *)&retstr->var11 = 0uLL;
  *(_OWORD *)&retstr->var13 = 0uLL;
  *(_OWORD *)&retstr->int var15 = 0uLL;
  *(_OWORD *)&retstr->var17 = 0uLL;
  *(_OWORD *)&retstr->var19 = 0uLL;
  *(_OWORD *)&retstr->var21 = 0uLL;
  *(_OWORD *)&retstr->var25 = 0uLL;
  *(_OWORD *)&retstr->var27 = 0uLL;
  *(_OWORD *)&retstr->var29 = 0uLL;
  *(_OWORD *)&retstr->var31 = 0uLL;
  uint64_t scratchAlignment = self->_scratchAlignment;
  unint64_t v41 = a6 + v39 * v92;
  uint64_t v42 = scratchAlignment - 1;
  retstr->var40 = v38;
  retstr->var3 = (unint64_t)result + a6;
  retstr->var4 = v34;
  uint64_t v43 = -scratchAlignment;
  uint64_t v44 = (scratchAlignment - 1 + v41) & -scratchAlignment;
  *(_OWORD *)&retstr->var33 = 0uLL;
  uint64_t v45 = (scratchAlignment - 1 + 4 * (v96 + v90) + v44) & -scratchAlignment;
  retstr->var19 = v35;
  retstr->var20 = (unint64_t)result + v44;
  uint64_t v46 = (scratchAlignment - 1 + 4 * (a4 != 0) * v16 + v45) & -scratchAlignment;
  unint64_t v47 = (char *)result + v45;
  retstr->var5 = (unint64_t)result + v45;
  if (a4 && *((unsigned char *)a4 + 82) && *((unsigned char *)a4 + 83) && *((void *)a4 + 25) >= 2uLL && *((void *)a4 + 26)) {
    uint64_t v48 = 2 * v16;
  }
  else {
    uint64_t v48 = 0;
  }
  uint64_t v49 = (v42 + v46 + v48) & v43;
  retstr->var23 = (unint64_t)result + v46;
  uint64_t v50 = scratchAlignment + 3;
  uint64_t v51 = (scratchAlignment + 3 + v49) & v43;
  uint64_t v52 = scratchAlignment + 15;
  uint64_t v53 = (scratchAlignment + 15 + v51) & v43;
  retstr->var29 = (unint64_t)result + v49;
  retstr->var30 = (unint64_t)result + v51;
  uint64_t v54 = (scratchAlignment + 15 + v53) & v43;
  retstr->var31 = (unint64_t)result + v53;
  uint64_t v55 = (scratchAlignment + v54 + 351) & v43;
  retstr->var21 = (unint64_t)result + v54;
  if (v32)
  {
    uint64_t v56 = (v52 + v55) & v43;
    unsigned int v57 = (char *)result + v55;
    uint64_t v58 = (v52 + v56) & v43;
    retstr->var32 = (unint64_t)v57;
    retstr->var33 = (unint64_t)result + v56;
    uint64_t v59 = (v50 + v58) & v43;
    uint64_t v60 = (char *)result + v58;
    uint64_t v61 = (v50 + v59) & v43;
    retstr->var34 = (unint64_t)v60;
    retstr->var35 = (unint64_t)result + v59;
    uint64_t v62 = scratchAlignment + 768 * v31 - 1;
    uint64_t v63 = (v62 + v61) & v43;
    unsigned int v64 = (char *)result + v61;
    uint64_t v65 = (v62 + v63) & v43;
    retstr->var25 = (unint64_t)v64;
    retstr->var26 = (unint64_t)result + v63;
    uint64_t v66 = scratchAlignment + 192 * v31 - 1;
    uint64_t v67 = (v66 + v65) & v43;
    long long v68 = (char *)result + v65;
    uint64_t v55 = (v66 + v67) & v43;
    retstr->var27 = (unint64_t)v68;
    retstr->var28 = (unint64_t)result + v67;
    uint64_t v69 = 140;
  }
  else
  {
    uint64_t v62 = scratchAlignment + 768 * v31 - 1;
    uint64_t v66 = scratchAlignment + 192 * v31 - 1;
    uint64_t v69 = 76;
  }
  retstr->var22 = (unint64_t)v47;
  uint64_t v70 = scratchAlignment + 8 * v96 - 1;
  uint64_t v71 = (v70 + v55) & v43;
  uint64_t v72 = (v70 + v71) & v43;
  retstr->var6.var0[0] = (unint64_t)result + v55;
  retstr->var6.var0[1] = (unint64_t)result + v71;
  uint64_t v73 = (v62 + v72) & v43;
  uint64_t v74 = (v62 + v73) & v43;
  retstr->var7 = (unint64_t)result + v72;
  retstr->var8 = (unint64_t)result + v73;
  uint64_t v75 = (v66 + v74) & v43;
  uint64_t v76 = (v66 + v75) & v43;
  uint64_t v77 = (v66 + v76) & v43;
  uint64_t v78 = scratchAlignment + 24 * v94 - 1;
  uint64_t v79 = (v78 + v77) & v43;
  retstr->var13 = (unint64_t)result + v76;
  retstr->var14 = (unint64_t)result + v77;
  uint64_t v80 = (v78 + v79) & v43;
  uint64_t v81 = (v42 + v69 * v94 + v80) & v43;
  uint64_t v82 = (char *)result + v80;
  uint64_t v83 = scratchAlignment + 4 * v31 - 1;
  uint64_t v84 = (v83 + v81) & v43;
  retstr->var9 = (unint64_t)result + v74;
  retstr->var10 = (unint64_t)result + v81;
  uint64_t v85 = (v83 + v84) & v43;
  retstr->var11 = (unint64_t)result + v84;
  retstr->var12 = (unint64_t)result + v75;
  uint64_t v86 = scratchAlignment + 16 * v31 - 1;
  uint64_t v87 = (v86 + v85) & v43;
  retstr->int var15 = (unint64_t)result + v79;
  retstr->var16 = (unint64_t)result + v85;
  uint64_t v88 = (v86 + v87) & v43;
  retstr->var17 = (unint64_t)result + v87;
  retstr->var18 = (unint64_t)v82;
  uint64_t v89 = (v52 + v88) & v43;
  retstr->var0 = (unint64_t)result + v88;
  retstr->var37 = (unint64_t)result + v89;
  if (a11) {
    *a11 = ((scratchAlignment + v89 + 11) & v43) - a6;
  }
  return result;
}

- (unint64_t)fragmentScratchSizeForDescriptor:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = &unk_268D5A000;
  {
    uint64_t v5 = &unk_268D5A000;
    if (v8)
    {
      -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
      uint64_t v5 = (unsigned char *)&unk_268D5A000;
    }
  }
  if (!v5[1480] && ([*((id *)a3 + 6) usage] & 8) == 0) {
    return 0;
  }
  unint64_t v7 = [(BVHTopDownBuilder *)self fragmentTotalThreadgroupCountForDescriptor:a3];
  return +[BVHTopDownBuilder prefixSumScratchBufferSizeWithCapacity:v7]+ 4 * v7;
}

- (void)initPipelinesWithDevice:(id)a3
{
  *(_OWORD *)&self->KERNEL_INDEX_DISPATCH_BINS = xmmword_242EA7E20;
  *(_OWORD *)&self->KERNEL_INDEX_FIND_BEST_SPLIT = xmmword_242EA8600;
  *(_OWORD *)&self->KERNEL_INDEX_INITIALIZE_QUEUE = xmmword_242EA8610;
  *(_OWORD *)&self->unsigned int KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS = xmmword_242EA8620;
  *(_OWORD *)&self->KERNEL_INDEX_SET_COUNTERS = xmmword_242EA8630;
  *(_OWORD *)&self->KERNEL_INDEX_DISPATCH_BINS_WIDE = xmmword_242EA8640;
  *(_OWORD *)&self->KERNEL_INDEX_PREFIX_SUM_ADD = xmmword_242EA8650;
  *(_OWORD *)&self->KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL = xmmword_242EA8660;
  operator new[]();
}

- (void)dealloc
{
  pipelineInfos = self->_pipelineInfos;
  if (pipelineInfos)
  {
    MEMORY[0x24566ED70](pipelineInfos, 0x1050C80A90F5278);
    self->_pipelineInfos = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)BVHTopDownBuilder;
  [(BVHTopDownBuilder *)&v4 dealloc];
}

- (BVHTopDownBuilder)initWithDevice:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)BVHTopDownBuilder;
  objc_super v4 = [(BVHTopDownBuilder *)&v17 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    {
      getDefaultTGSize(objc_object  {objcproto9MTLDevice}*)::unsigned int threadgroupSize = 64;
    }
    v5->_unsigned int threadgroupSize = getDefaultTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
    {
      getBatchSize(objc_object  {objcproto9MTLDevice}*)::unsigned int threadgroupSize = 512;
    }
    v5->_unint64_t batchSize = getBatchSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
    {
      getBatchThreshold(void)::batchThreshold = 1;
    }
    if (getBatchThreshold(void)::batchThreshold) {
      int v6 = 0x2000;
    }
    else {
      int v6 = 0;
    }
    v5->_batchThreshold = v6;
    {
      getBinningTGSize(objc_object  {objcproto9MTLDevice}*)::unsigned int threadgroupSize = 512;
    }
    v5->_unsigned int binningTGSize = getBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
    {
      getSpatialBinningTGSize(objc_object  {objcproto9MTLDevice}*)::unsigned int threadgroupSize = 256;
    }
    v5->_unsigned int spatialBinningTGSize = getSpatialBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
    {
      getSplitTGSize(objc_object  {objcproto9MTLDevice}*)::unsigned int threadgroupSize = 256;
    }
    v5->_unsigned int splitTGSize = getSplitTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
    {
      getDispatchBinsTGSize(objc_object  {objcproto9MTLDevice}*)::unsigned int threadgroupSize = 64;
    }
    v5->_int dispatchBinsTGSize = getDispatchBinsTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
    {
      getDispatchBinsSmallTGSize(objc_object  {objcproto9MTLDevice}*)::unsigned int threadgroupSize = 32;
    }
    v5->_dispatchBinsSmallTGSize = getDispatchBinsSmallTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
    {
      -[BVHTopDownBuilder initWithDevice:]::disableDispatchThreadsWithIndirectBuffer = 0;
    }
    {
      -[BVHTopDownBuilder initWithDevice:]::uint64_t scratchAlignment = 32;
    }
    v5->_uint64_t scratchAlignment = -[BVHTopDownBuilder initWithDevice:]::scratchAlignment;
    v5->_supportsDispatchThreadsWithIndirectBuffer = -[BVHTopDownBuilder initWithDevice:]::disableDispatchThreadsWithIndirectBuffer ^ 1;
    unint64_t v7 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    {
      int v14 = v7;
      unint64_t v7 = v14;
      if (v15)
      {
        {
        }
        {
        }
        if (shouldDumpOrVerifyBVHs(void)::once != -1) {
          dispatch_once(&shouldDumpOrVerifyBVHs(void)::once, &__block_literal_global_607);
        }
        -[BVHTopDownBuilder initWithDevice:]::verify = 0;
        unint64_t v7 = v14;
      }
    }
    if (-[BVHTopDownBuilder initWithDevice:]::verify) {
      int v8 = @"bvh_builder_assert";
    }
    else {
      int v8 = @"bvh_builder";
    }
    uint64_t v16 = 0;
    v5->_library = (MTLLibrary *)objc_msgSend(a3, "newLibraryWithURL:error:", objc_msgSend(v7, "URLForResource:withExtension:", v8, @"metallib"), &v16);
    v5->_pipelineCache.unint64_t baseThreadgroupSize = v5->_threadgroupSize;
    p_createPipeline = &v5->_pipelineCache.createPipeline;
    uint64_t v10 = (void (**)(_OWORD *))&unk_26F853188;
    *(void *)&long long v18 = &unk_26F853188;
    *((void *)&v18 + 1) = v5;
    unint64_t v20 = &v18;
    if (&v5->_pipelineCache.createPipeline != (function<id<MTLComputePipelineState> (const PipelineKey &)> *)&v18)
    {
      if (v5->_pipelineCache.createPipeline.__f_.__f_ == p_createPipeline)
      {
        std::__function::__func<-[BVHTopDownBuilder initWithDevice:]::$_6,std::allocator<-[BVHTopDownBuilder initWithDevice:]::$_6>,objc_object  {objcproto23MTLComputePipelineState}* ()(PipelineKey const&)>::__clone((uint64_t)&v18, v21);
        (*(void (**)(long long *))(*(void *)v20 + 32))(v20);
        unint64_t v20 = 0;
        (*(void (**)(void *, long long *))(*(void *)v5->_pipelineCache.createPipeline.__f_.__f_ + 24))(v5->_pipelineCache.createPipeline.__f_.__f_, &v18);
        (*(void (**)(void *))(*(void *)v5->_pipelineCache.createPipeline.__f_.__f_ + 32))(v5->_pipelineCache.createPipeline.__f_.__f_);
        v5->_pipelineCache.createPipeline.__f_.__f_ = 0;
        unint64_t v20 = &v18;
        (*(void (**)(void *, function<id<MTLComputePipelineState> (const PipelineKey &)> *))(v21[0] + 24))(v21, &v5->_pipelineCache.createPipeline);
        (*(void (**)(void *))(v21[0] + 32))(v21);
        v5->_pipelineCache.createPipeline.__f_.__f_ = p_createPipeline;
        f = v20;
      }
      else
      {
        std::__function::__func<-[BVHTopDownBuilder initWithDevice:]::$_6,std::allocator<-[BVHTopDownBuilder initWithDevice:]::$_6>,objc_object  {objcproto23MTLComputePipelineState}* ()(PipelineKey const&)>::__clone((uint64_t)&v18, v5->_pipelineCache.createPipeline.__f_.__buf_.__lx);
        (*(void (**)(long long *))(*(void *)v20 + 32))(v20);
        f = (long long *)v5->_pipelineCache.createPipeline.__f_.__f_;
        unint64_t v20 = f;
        v5->_pipelineCache.createPipeline.__f_.__f_ = p_createPipeline;
      }
      if (f != &v18)
      {
        if (f) {
          (*(void (**)(long long *))(*(void *)f + 40))(f);
        }
        device = v5->_device;
        if (device) {
          goto LABEL_27;
        }
        goto LABEL_30;
      }
      uint64_t v10 = (void (**)(_OWORD *))v18;
    }
    v10[4](&v18);
    device = v5->_device;
    if (device)
    {
LABEL_27:
      [(MTLDevice *)device maxThreadsPerThreadgroup];
LABEL_31:
      *(_OWORD *)&v5->_maxThreadsPerThreadgroup.width = v18;
      v5->_maxThreadsPerThreadgroup.depth = v19;
      [(BVHTopDownBuilder *)v5 initPipelinesWithDevice:a3];
      return v5;
    }
LABEL_30:
    long long v18 = 0uLL;
    unint64_t v19 = 0;
    goto LABEL_31;
  }
  return v5;
}

- (void)initWithDevice:
{
}

- (uint64_t)initWithDevice:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26F853188;
  a2[1] = v2;
  return result;
}

+ (unint64_t)prefixSumScratchBufferSizeWithCapacity:(unint64_t)a3
{
  if (a3 < 0x201) {
    return 0;
  }
  uint64_t v3 = 0;
  do
  {
    a3 = (a3 + 511) >> 9;
    v3 += a3;
  }
  while (a3 > 0x200);
  return 4 * v3;
}

@end