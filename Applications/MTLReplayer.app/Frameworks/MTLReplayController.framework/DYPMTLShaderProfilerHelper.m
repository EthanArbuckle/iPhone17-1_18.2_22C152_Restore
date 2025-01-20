@interface DYPMTLShaderProfilerHelper
- (BOOL)dumpInstructions;
- (DYPMTLShaderProfilerHelper)init;
- (double)_conservativeLatencyAdjustment:(double)a3 withLimiter:(double)a4;
- (double)_latencyAdjustmentEstimate:(double)a3 withLimiter:(double)a4;
- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6;
- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterTypeLoad:(unsigned int)a6 forLimiterTypeStore:(unsigned int)a7;
- (double)_latencyAdjustmentFactorWithLimiterDataWithLerp:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6;
- (double)_latencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5;
- (double)_waitLatencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5;
- (id).cxx_construct;
- (id)_costHeaders;
- (id)_eventTypesForTarget:(int)a3;
- (id)_traceHeaders;
- (uint64_t)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:;
- (uint64_t)adjustHWBiasAndFinalizeResult;
- (uint64_t)setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:;
- (unsigned)_computeSampleNormFactorForSample:(const ShaderProfilerUSCSampleInfo *)a3 forProgramStartAddress:(unint64_t)a4 forProgramEndAddress:(unint64_t)a5;
- (void)_calculateAggregatedEffectiveGPUEncoderCost;
- (void)_calculateAndAppendPerBatchCosts:(void *)a3 forFrameIndex:(unsigned int)a4 atTimestamp:(unint64_t)a5 withLimiterIndices:(void *)a6 withTimestampBuffers:(void *)a7 withActiveBatches:(const void *)a8 withPerRingBufferLimiterEncoderCosts:(void *)a9;
- (void)_calculateAverageGPUCommandDuration;
- (void)_cleanup;
- (void)_dumpAggregatedGPUTimePerBatchForFrame:(unsigned int)a3;
- (void)_dumpLimiterBatchInfoCosts:(void *)a3 forRingBuffer:(unsigned int)a4 forFrame:(unsigned int)a5;
- (void)_dumpTraceBufferPacketsInFile:(__sFILE *)a3 usingTracePackets:(unsigned int *)a4 withExtractedSamples:(const void *)a5 withTraceBufferCount:(unsigned int)a6 forTargetIndex:(int)a7;
- (void)_processTracePackets:(unsigned int *)a3 forRenderIndex:(unsigned int)a4 andGenerateSampleList:(void *)a5 forTargetIndex:(int)a6 forLimiterIndex:(unsigned int)a7;
- (void)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:;
- (void)_setupShaderBinaryInfo:(id)a3 withBinaryKey:(const void *)a4 andNumDraws:(unsigned int)a5;
- (void)adjustHWBiasAndFinalizeResult;
- (void)evaluateStreamingSamples:(uint64_t)a3 withUSCSampleNum:(uint64_t)a4 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:;
- (void)evaluateStreamingSamples:(unint64_t *)a3 withUSCSampleNum:(unsigned int)a4 withProgramAddressLUT:(void *)a5 targetIndex:(int)a6 forRingBufferIndex:(unsigned int)a7 withMinEncoderIndex:(unsigned int)a8 withMaxEncoderIndex:(unsigned int)a9 withEncoderIdToEncoderIndexMap:(void *)a10 withProfilingData:(id)a11;
- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(long long *)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:;
- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(unint64_t)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:;
- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:;
- (void)generateTargetSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a6 withUSCSampleBuffer:(unint64_t *)a7 withUSCSampleNum:(unsigned int)a8 withBatchIDToEncoderIndex:(void *)a9 andEncoderIndexToBatchIdMap:(void *)a10 targetIndex:(int)a11;
- (void)generateTargetSamplesForResult:(uint64_t)a3 withProgramAddressLUT:(char)a4 withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:;
- (void)setDumpInstructions:(BOOL)a3;
- (void)setupDataForEvaluatingStreamingSamples:(id)a3 forRingBufferCount:(unsigned int)a4 forTargetIndex:(int)a5;
@end

@implementation DYPMTLShaderProfilerHelper

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((void *)self + 55) = 0;
  *((_DWORD *)self + 112) = 1065353216;
  *((void *)self + 59) = 0;
  *((void *)self + 60) = 0;
  *((void *)self + 58) = 0;
  *((_OWORD *)self + 31) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((_DWORD *)self + 132) = 1065353216;
  *((void *)self + 67) = 850045863;
  *((_OWORD *)self + 34) = 0u;
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((void *)self + 74) = 0;
  *((void *)self + 75) = 850045863;
  *((void *)self + 82) = 0;
  *((_OWORD *)self + 39) = 0u;
  *((_OWORD *)self + 40) = 0u;
  *((_OWORD *)self + 38) = 0u;
  *((void *)self + 83) = 850045863;
  *((void *)self + 90) = 0;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 42) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 93, 0);
  objc_storeStrong((id *)self + 92, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 664));
  std::mutex::~mutex((std::mutex *)((char *)self + 600));
  std::mutex::~mutex((std::mutex *)((char *)self + 536));
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)self + 496);
  objc_storeStrong((id *)self + 61, 0);
  v3 = (void *)*((void *)self + 58);
  if (v3)
  {
    *((void *)self + 59) = v3;
    operator delete(v3);
  }
  objc_storeStrong((id *)self + 57, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)self + 416);
  for (uint64_t i = 0; i != -72; i -= 24)
  {
    v5 = *(void **)((char *)self + i + 392);
    if (v5)
    {
      *(void *)((char *)self + i + 400) = v5;
      operator delete(v5);
    }
  }
  v6 = (void *)*((void *)self + 40);
  if (v6)
  {
    *((void *)self + 41) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *((void *)self + 37);
  if (v7)
  {
    uint64_t v8 = *((void *)self + 38);
    v9 = (void *)*((void *)self + 37);
    if (v8 != v7)
    {
      do
        uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(v8 - 40);
      while (v8 != v7);
      v9 = (void *)*((void *)self + 37);
    }
    *((void *)self + 38) = v7;
    operator delete(v9);
  }
  v23 = (void **)((char *)self + 272);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
  v23 = (void **)((char *)self + 248);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
  v10 = (void **)*((void *)self + 28);
  if (v10)
  {
    v11 = (void **)*((void *)self + 29);
    v12 = (void *)*((void *)self + 28);
    if (v11 != v10)
    {
      do
      {
        v11 -= 3;
        v23 = v11;
        std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }
      while (v11 != v10);
      v12 = (void *)*((void *)self + 28);
    }
    *((void *)self + 29) = v10;
    operator delete(v12);
  }
  v13 = (void **)*((void *)self + 25);
  if (v13)
  {
    v14 = (void **)*((void *)self + 26);
    v15 = (void *)*((void *)self + 25);
    if (v14 != v13)
    {
      do
      {
        v14 -= 3;
        v23 = v14;
        std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }
      while (v14 != v13);
      v15 = (void *)*((void *)self + 25);
    }
    *((void *)self + 26) = v13;
    operator delete(v15);
  }
  objc_storeStrong((id *)self + 24, 0);
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 21, 0);
  objc_storeStrong((id *)self + 20, 0);
  objc_storeStrong((id *)self + 19, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::~__hash_table((uint64_t)self + 112);
  uint64_t v16 = *((void *)self + 10);
  if (v16)
  {
    uint64_t v17 = *((void *)self + 11);
    v18 = (void *)*((void *)self + 10);
    if (v17 != v16)
    {
      do
        uint64_t v17 = std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>>>::~__hash_table(v17 - 40);
      while (v17 != v16);
      v18 = (void *)*((void *)self + 10);
    }
    *((void *)self + 11) = v16;
    operator delete(v18);
  }
  v19 = (void **)*((void *)self + 7);
  if (v19)
  {
    v20 = (void **)*((void *)self + 8);
    v21 = (void *)*((void *)self + 7);
    if (v20 != v19)
    {
      do
      {
        v20 -= 3;
        v23 = v20;
        std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }
      while (v20 != v19);
      v21 = (void *)*((void *)self + 7);
    }
    *((void *)self + 8) = v19;
    operator delete(v21);
  }
  std::__hash_table<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::__unordered_map_hasher<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>>>::__deallocate_node(*((void **)self + 4));
  v22 = (void *)*((void *)self + 2);
  *((void *)self + 2) = 0;
  if (v22)
  {
    operator delete(v22);
  }
}

- (void)setDumpInstructions:(BOOL)a3
{
  *((unsigned char *)self + 752) = a3;
}

- (BOOL)dumpInstructions
{
  return *((unsigned char *)self + 752);
}

- (void)generateTargetSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a6 withUSCSampleBuffer:(unint64_t *)a7 withUSCSampleNum:(unsigned int)a8 withBatchIDToEncoderIndex:(void *)a9 andEncoderIndexToBatchIdMap:(void *)a10 targetIndex:(int)a11
{
  v459 = (id *)a3;
  v14 = [v459 drawCallInfoList];
  unint64_t v15 = (unint64_t)[v14 count];
  v599 = 0;
  v598 = 0;
  uint64_t v600 = 0;
  if (v15)
  {
    std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100](&v598, v15);
    uint64_t v16 = (char *)v599;
    size_t v17 = 24 * ((24 * v15 - 24) / 0x18) + 24;
    bzero(v599, v17);
    v599 = &v16[v17];
  }
  v439 = a7;
  v447 = self;

  unsigned int v20 = 0;
  unsigned int v460 = 0;
  while (1)
  {
    v21 = [v459 drawCallInfoList];
    uint64_t v22 = v20;
    BOOL v23 = (unint64_t)[v21 count] > v20;

    if (!v23) {
      break;
    }
    v24 = [v459 drawCallInfoList];
    v25 = [v24 objectAtIndexedSubscript:v22];

    v26 = [v25 programInfo];
    if (!v26
      || ([v25 programInfo],
          unint64_t v11 = objc_claimAutoreleasedReturnValue(),
          BOOL v27 = [(id)v11 programId] == (id)-1,
          (id)v11,
          v26,
          !v27))
    {
      v28 = a9;
      v29 = a10;
      v30 = v598;
      id v588 = 0;
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      unint64_t v11 = (unint64_t)&v30[3 * v460];
      v32 = (unint64_t *)(v11 + 8);
      v31 = *(void **)(v11 + 8);
      uint64_t v33 = *(void *)v11;
      uint64_t v34 = (uint64_t)v31 - *(void *)v11;
      if ((unint64_t)v34 > 0xBF)
      {
        if (v34 != 192)
        {
          v56 = (void *)(v33 + 192);
          while (v31 != v56)
          {
            v31 -= 4;
            std::allocator<std::pair<ShaderBinaryInfo * {__strong},std::string>>::destroy[abi:nn180100]((uint64_t)v31);
          }
          unint64_t *v32 = (unint64_t)v56;
        }
      }
      else
      {
        uint64_t v35 = v34 >> 5;
        unint64_t v36 = 6 - (v34 >> 5);
        v37 = &v30[3 * v460];
        uint64_t v40 = v37[2];
        v39 = (char **)(v37 + 2);
        uint64_t v38 = v40;
        if (v36 <= (v40 - (uint64_t)v31) >> 5)
        {
          v57 = &v31[4 * v36];
          uint64_t v58 = 192 - 32 * v35;
          do
          {
            std::pair<ShaderBinaryInfo * {__strong},std::string>::pair[abi:nn180100](v31, (uint64_t)&v588);
            v31 += 4;
            v58 -= 32;
          }
          while (v58);
          unint64_t *v32 = (unint64_t)v57;
        }
        else
        {
          v605 = v39;
          uint64_t v41 = v38 - v33;
          uint64_t v42 = v41 >> 4;
          if ((unint64_t)(v41 >> 4) <= 6) {
            uint64_t v42 = 6;
          }
          if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v43 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v42;
          }
          v44 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTable>>(v43);
          v45 = &v44[32 * v35];
          *(void *)v603 = v44;
          *(void *)&v603[8] = v45;
          *(void *)&v603[16] = v45;
          v604 = &v44[32 * v46];
          v47 = v44 + 192;
          uint64_t v48 = v35 - 6;
          do
          {
            std::pair<ShaderBinaryInfo * {__strong},std::string>::pair[abi:nn180100](v45, (uint64_t)&v588);
            v45 += 32;
          }
          while (!__CFADD__(v48++, 1));
          unint64_t v50 = *v32;
          uint64_t v51 = *(void *)v11;
          uint64_t v52 = *(void *)&v603[8];
          if (*v32 == *(void *)v11)
          {
            int64x2_t v55 = vdupq_n_s64(v50);
          }
          else
          {
            do
            {
              uint64_t v53 = *(void *)(v50 - 32);
              v50 -= 32;
              *(void *)unint64_t v50 = 0;
              *(void *)(v52 - 32) = v53;
              v52 -= 32;
              long long v54 = *(_OWORD *)(v50 + 8);
              *(void *)(v52 + 24) = *(void *)(v50 + 24);
              *(_OWORD *)(v52 + 8) = v54;
              *(void *)(v50 + 16) = 0;
              *(void *)(v50 + 24) = 0;
              *(void *)(v50 + 8) = 0;
            }
            while (v50 != v51);
            int64x2_t v55 = *(int64x2_t *)v11;
          }
          *(void *)unint64_t v11 = v52;
          unint64_t *v32 = (unint64_t)v47;
          *(int64x2_t *)&v603[8] = v55;
          v59 = *v39;
          *v39 = v604;
          v604 = v59;
          *(void *)v603 = v55.i64[0];
          std::__split_buffer<std::pair<ShaderBinaryInfo * {__strong},std::string>>::~__split_buffer((uint64_t)v603);
        }
      }
      a10 = v29;
      if (SHIBYTE(v590) < 0) {
        operator delete(__p[0]);
      }

      a9 = v28;
      uint64_t v60 = [v459[30] objectForKeyedSubscript:v25[1]];
      v61 = *(void **)(*(void *)v11 + 32);
      *(void *)(*(void *)v11 + 32) = v60;

      v62 = (void *)v25[1];
      if (v62)
      {
        std::string::basic_string[abi:nn180100]<0>(v603, (char *)[v62 UTF8String]);
        uint64_t v63 = *(void *)v11 + 40;
        if (*(char *)(*(void *)v11 + 63) < 0) {
          operator delete(*(void **)v63);
        }
        *(_OWORD *)uint64_t v63 = *(_OWORD *)v603;
        *(void *)(v63 + 16) = *(void *)&v603[16];
      }
      uint64_t v64 = [v459[31] objectForKeyedSubscript:v25[2]];
      v65 = *(void **)(*(void *)v11 + 64);
      *(void *)(*(void *)v11 + 64) = v64;

      v66 = (void *)v25[2];
      if (v66)
      {
        std::string::basic_string[abi:nn180100]<0>(v603, (char *)[v66 UTF8String]);
        uint64_t v67 = *(void *)v11 + 72;
        if (*(char *)(*(void *)v11 + 95) < 0) {
          operator delete(*(void **)v67);
        }
        *(_OWORD *)uint64_t v67 = *(_OWORD *)v603;
        *(void *)(v67 + 16) = *(void *)&v603[16];
      }
      uint64_t v68 = [v459[32] objectForKeyedSubscript:v25[3]];
      v69 = *(void **)(*(void *)v11 + 96);
      *(void *)(*(void *)v11 + 96) = v68;

      ++v460;
      v70 = (void *)v25[3];
      if (v70)
      {
        std::string::basic_string[abi:nn180100]<0>(v603, (char *)[v70 UTF8String]);
        uint64_t v71 = *(void *)v11 + 104;
        if (*(char *)(*(void *)v11 + 127) < 0) {
          operator delete(*(void **)v71);
        }
        *(_OWORD *)uint64_t v71 = *(_OWORD *)v603;
        *(void *)(v71 + 16) = *(void *)&v603[16];
      }
    }

    unsigned int v20 = v22 + 1;
  }
  id v595 = 0;
  std::string::basic_string[abi:nn180100]<0>(&v596, "");
  id v588 = 0;
  __p[0] = &v588;
  __p[1] = (void *)0x5812000000;
  v590 = __Block_byref_object_copy__626;
  memset(v592, 0, sizeof(v592));
  v591 = __Block_byref_object_dispose__627;
  uint64_t v593 = 0;
  int v594 = 1065353216;
  id v72 = v459[33];
  v587[0] = _NSConcreteStackBlock;
  v587[1] = 3221225472;
  v587[2] = __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke;
  v587[3] = &unk_745C90;
  v587[4] = &v588;
  [v72 enumerateKeysAndObjectsUsingBlock:v587];
  if (*((__int16 *)v439 + 3) == -275)
  {
    BOOL v73 = 1;
  }
  else
  {
    uint64_t v74 = 1;
    unint64_t v75 = 1023;
    while (v74 != 1024)
    {
      uint64_t v76 = SHIWORD(v439[v74++]);
      if (v76 == -275)
      {
        unint64_t v75 = v74 - 2;
        break;
      }
    }
    BOOL v73 = v75 < 0x3FF;
  }
  v585 = 0;
  v584 = 0;
  uint64_t v586 = 0;
  unint64_t v77 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  std::vector<std::vector<ShaderProfilerUSCSampleInfo>>::resize((uint64_t)&v584, v77);
  unsigned int v78 = std::thread::hardware_concurrency();
  uint64_t v575 = 0;
  v576 = &v575;
  uint64_t v577 = 0x4812000000;
  v578 = __Block_byref_object_copy__629;
  v579 = __Block_byref_object_dispose__630;
  v580 = &unk_4E231D;
  if (v78 <= 1) {
    unint64_t v79 = 1;
  }
  else {
    unint64_t v79 = v78 >> 1;
  }
  v583 = 0;
  v581 = 0;
  v582 = 0;
  v80 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v79);
  v581 = v80;
  v583 = &v80[4 * v81];
  bzero(v80, 4 * v79);
  v582 = &v80[4 * v79];
  uint64_t v566 = 0;
  v567 = &v566;
  uint64_t v568 = 0x4812000000;
  v569 = __Block_byref_object_copy__629;
  v570 = __Block_byref_object_dispose__630;
  v571 = &unk_4E231D;
  v574 = 0;
  v572 = 0;
  v573 = 0;
  v82 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v79);
  v572 = v82;
  v574 = &v82[4 * v83];
  bzero(v82, 4 * v79);
  v573 = &v82[4 * v79];
  uint64_t v559 = 0;
  v560 = &v559;
  uint64_t v561 = 0x4812000000;
  v562 = __Block_byref_object_copy__583;
  v563 = __Block_byref_object_dispose__584;
  v564 = &unk_4E231D;
  memset(v565, 0, sizeof(v565));
  v555[0] = 0;
  v555[1] = v555;
  v555[2] = 0x4812000000;
  v555[3] = __Block_byref_object_copy__587;
  v555[4] = __Block_byref_object_dispose__588;
  v555[5] = &unk_4E231D;
  uint64_t v558 = 0;
  v556 = 0;
  v557 = 0;
  std::vector<ShaderProfilerUSCSampleInfo>::reserve(&v556, 0x100000uLL);
  std::vector<std::vector<ShaderProfilerUSCSampleInfo>>::resize((uint64_t)(v560 + 6), v79);
  queue = dispatch_get_global_queue(0, 0);
  group = dispatch_group_create();
  v84 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>((v79 + 1));
  bzero(v84, 4 * (v79 + 1));
  v450 = (uint64_t *)v84;
  unint64_t v453 = v79;
  if (v79)
  {
    uint64_t v85 = 0;
    unint64_t v86 = v79;
    do
    {
      *v84++ = a8 / v79 * v85++;
      --v86;
    }
    while (v86);
    *((_DWORD *)v450 + v79) = a8;
    if (!v73)
    {
      uint64_t v87 = 0;
      do
      {
        uint64_t v88 = v87;
        uint64_t v89 = *((unsigned int *)v450 + v87++);
        if (v89 < *((_DWORD *)v450 + v87))
        {
          while (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(a10, v439[v89]))
          {
            if (++v89 >= (unint64_t)*((unsigned int *)v450 + v87)) {
              goto LABEL_65;
            }
          }
          *((_DWORD *)v450 + v88) = v89;
        }
LABEL_65:
        ;
      }
      while (v87 != v79);
    }
    uint64_t v90 = 0;
    unint64_t v440 = v77;
    v91 = v450;
    v92 = a9;
    do
    {
      uint64_t v93 = *v91;
      v91 = (uint64_t *)((char *)v91 + 4);
      uint64_t v94 = v90 + 1;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_635;
      block[3] = &unk_745CB8;
      int v549 = v90;
      uint64_t v550 = v93;
      BOOL v554 = v73;
      unsigned int v551 = a8;
      int v552 = a11;
      block[4] = v447;
      block[5] = &v575;
      block[6] = &v566;
      block[7] = v555;
      unsigned int v553 = a5;
      block[10] = a10;
      block[11] = v440;
      block[12] = v92;
      block[9] = v439;
      block[8] = &v559;
      dispatch_group_async(group, queue, block);
      uint64_t v90 = v94;
    }
    while (v79 != v94);
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v96 = 0;
    a9 = &stru_20 + 8;
    unsigned int v97 = a5;
    do
    {
      uint64_t v451 = v96;
      v98 = (unint64_t *)(v560[6] + 24 * v96);
      unint64_t v11 = *v98;
      unint64_t v99 = v98[1];
      while (v11 != v99)
      {
        v100 = (void **)&v584[3 * (*(_DWORD *)v11 - v97)];
        v102 = v100 + 1;
        v101 = (char *)v100[1];
        v103 = (char *)v100[2];
        if (v101 >= v103)
        {
          unint64_t v106 = 0xCCCCCCCCCCCCCCCDLL * ((v101 - (unsigned char *)*v100) >> 3);
          unint64_t v107 = v106 + 1;
          if (v106 + 1 > 0x666666666666666) {
            abort();
          }
          unint64_t v108 = 0xCCCCCCCCCCCCCCCDLL * ((v103 - (unsigned char *)*v100) >> 3);
          if (2 * v108 > v107) {
            unint64_t v107 = 2 * v108;
          }
          if (v108 >= 0x333333333333333) {
            unint64_t v109 = 0x666666666666666;
          }
          else {
            unint64_t v109 = v107;
          }
          if (v109) {
            unint64_t v109 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v109);
          }
          else {
            uint64_t v110 = 0;
          }
          unint64_t v111 = v109 + 40 * v106;
          int64x2_t v95 = *(int64x2_t *)v11;
          long long v112 = *(_OWORD *)(v11 + 16);
          *(void *)(v111 + 32) = *(void *)(v11 + 32);
          *(int64x2_t *)unint64_t v111 = v95;
          *(_OWORD *)(v111 + 16) = v112;
          v113 = (char *)*v102;
          v114 = (char *)*v100;
          unint64_t v115 = v111;
          if (*v102 != *v100)
          {
            do
            {
              int64x2_t v95 = *(int64x2_t *)(v113 - 40);
              long long v116 = *(_OWORD *)(v113 - 24);
              *(void *)(v115 - 8) = *((void *)v113 - 1);
              *(_OWORD *)(v115 - 24) = v116;
              *(int64x2_t *)(v115 - 40) = v95;
              v115 -= 40;
              v113 -= 40;
            }
            while (v113 != v114);
            v113 = (char *)*v100;
          }
          *v100 = (void *)v115;
          v105 = (void *)(v111 + 40);
          *v102 = (void *)(v111 + 40);
          v100[2] = (void *)(v109 + 40 * v110);
          if (v113) {
            operator delete(v113);
          }
          unsigned int v97 = a5;
        }
        else
        {
          int64x2_t v95 = *(int64x2_t *)v11;
          long long v104 = *(_OWORD *)(v11 + 16);
          *((void *)v101 + 4) = *(void *)(v11 + 32);
          *(int64x2_t *)v101 = v95;
          *((_OWORD *)v101 + 1) = v104;
          v105 = v101 + 40;
        }
        *v102 = v105;
        v11 += 40;
      }
      unint64_t v79 = v453;
      uint64_t v96 = v451 + 1;
    }
    while (v451 + 1 != v453);
  }
  else
  {
    _DWORD *v84 = a8;
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  }
  v117 = v584;
  for (uint64_t i = (uint64_t)v585;
        v117 != (unint64_t *)i;
        *(double *)v95.i64 = std::__introsort<std::_ClassicAlgPolicy,USCSampleComparator &,ShaderProfilerUSCSampleInfo *,false>(v119, v120, v122, 1, *(double *)v95.i64))
  {
    unint64_t v119 = *v117;
    v120 = (double *)v117[1];
    v117 += 3;
    unint64_t v121 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)((uint64_t)v120 - v119) >> 3));
    if (v120 == (double *)v119) {
      uint64_t v122 = 0;
    }
    else {
      uint64_t v122 = v121;
    }
  }
  size_t v123 = 8 * v460;
  if (v460)
  {
    v124 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v460);
    bzero(v124, v123);
    v437 = (unsigned int *)v124;
    v434 = (unsigned int *)&v124[8 * v460];
  }
  else
  {
    v437 = 0;
    v434 = 0;
  }
  uint64_t v539 = 0;
  v540 = &v539;
  uint64_t v541 = 0x4812000000;
  v542 = __Block_byref_object_copy__637;
  v543 = __Block_byref_object_dispose__638;
  v544 = &unk_4E231D;
  v547 = 0;
  v545 = 0;
  v546 = 0;
  if (v79)
  {
    v125 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v79);
    v545 = v125;
    v547 = &v125[24 * v126];
    bzero(v125, 24 * ((24 * (unint64_t)v79 - 24) / 0x18) + 24);
    v546 = &v125[24 * ((24 * (unint64_t)v79 - 24) / 0x18) + 24];
    v435 = (char *)v447 + 752;
    if (*((unsigned char *)v447 + 752))
    {
      for (uint64_t j = 0; j != v79; ++j)
      {
        uint64_t v128 = v540[6];
        v129 = (char **)(v128 + 24 * j);
        v131 = v129 + 1;
        v130 = v129[1];
        v132 = *v129;
        unint64_t v11 = (v130 - *v129) >> 3;
        if (v460 <= v11)
        {
          if (v460 < v11) {
            *v131 = &v132[8 * v460];
          }
        }
        else
        {
          uint64_t v133 = v128 + 24 * j;
          uint64_t v135 = *(void *)(v133 + 16);
          a9 = (void *)(v133 + 16);
          uint64_t v134 = v135;
          if (v460 - v11 <= (v135 - (uint64_t)v130) >> 3)
          {
            v147 = &v130[8 * (v460 - v11)];
            size_t v148 = v123 - 8 * v11;
            do
            {
              *(void *)v130 = 0;
              v130 += 8;
              v148 -= 8;
            }
            while (v148);
            *v131 = v147;
          }
          else
          {
            unint64_t v136 = v134 - (void)v132;
            unint64_t v137 = (v134 - (uint64_t)v132) >> 2;
            if (v137 <= v460) {
              unint64_t v137 = v460;
            }
            if (v136 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v138 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v138 = v137;
            }
            v139 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v138);
            v141 = &v139[8 * v11];
            size_t v142 = v123 - 8 * v11;
            v143 = v141;
            do
            {
              *(void *)v143 = 0;
              v143 += 8;
              v142 -= 8;
            }
            while (v142);
            v144 = *v131;
            v145 = *v129;
            if (*v131 != *v129)
            {
              do
              {
                uint64_t v146 = *((void *)v144 - 1);
                v144 -= 8;
                *((void *)v141 - 1) = v146;
                v141 -= 8;
              }
              while (v144 != v145);
              v144 = *v129;
            }
            *v129 = v141;
            *v131 = &v139[8 * v460];
            *(void *)a9 = &v139[8 * v140];
            if (v144) {
              operator delete(v144);
            }
          }
        }
      }
    }
  }
  else
  {
    v435 = (char *)v447 + 752;
  }
  uint64_t v530 = 0;
  v531 = &v530;
  uint64_t v532 = 0x4812000000;
  v533 = __Block_byref_object_copy__640;
  v534 = __Block_byref_object_dispose__641;
  v535 = &unk_4E231D;
  v538 = 0;
  v536 = 0;
  v537 = 0;
  if (v79)
  {
    v149 = (char *)operator new(24 * v79);
    bzero(v149, 24 * ((24 * v79 - 24) / 0x18) + 24);
    v536 = v149;
    v537 = &v149[24 * ((24 * v79 - 24) / 0x18) + 24];
    v538 = &v149[24 * v79];
  }
  v445 = dispatch_group_create();

  uint64_t v521 = 0;
  v522 = &v521;
  uint64_t v523 = 0x4812000000;
  v524 = __Block_byref_object_copy__643;
  v525 = __Block_byref_object_dispose__644;
  v526 = &unk_4E231D;
  v529 = 0;
  v527 = 0;
  v528 = 0;
  int v150 = v453;
  if (*v435 && v453)
  {
    v151 = (char *)operator new(40 * v453);
    v152 = v151;
    do
    {
      *(_OWORD *)v152 = 0uLL;
      *((_OWORD *)v152 + 1) = 0uLL;
      *((_DWORD *)v152 + 8) = 1065353216;
      v152 += 40;
    }
    while (v152 != &v151[40 * v453]);
    v527 = v151;
    v528 = &v151[40 * v453];
    v529 = v528;
  }
  uint64_t v512 = 0;
  v513 = &v512;
  uint64_t v514 = 0x4812000000;
  v515 = __Block_byref_object_copy__646;
  v516 = __Block_byref_object_dispose__647;
  v517 = &unk_4E231D;
  v520 = 0;
  v518 = 0;
  v519 = 0;
  if (v453)
  {
    v153 = (char *)operator new(40 * v453);
    v154 = v153;
    do
    {
      *(_OWORD *)v154 = 0uLL;
      *((_OWORD *)v154 + 1) = 0uLL;
      *((_DWORD *)v154 + 8) = 1065353216;
      v154 += 40;
    }
    while (v154 != &v153[40 * v453]);
    v518 = v153;
    v519 = &v153[40 * v453];
    v520 = v519;
  }
  uint64_t v503 = 0;
  v504 = &v503;
  uint64_t v505 = 0x4812000000;
  v506 = __Block_byref_object_copy__649;
  v507 = __Block_byref_object_dispose__650;
  v508 = &unk_4E231D;
  v511 = 0;
  v509 = 0;
  v510 = 0;
  if (v453)
  {
    v155 = (char *)operator new(40 * v453);
    v156 = v155;
    do
    {
      *(_OWORD *)v156 = 0uLL;
      *((_OWORD *)v156 + 1) = 0uLL;
      *((_DWORD *)v156 + 8) = 1065353216;
      v156 += 40;
    }
    while (v156 != &v155[40 * v453]);
    v509 = v155;
    v510 = &v155[40 * v453];
    v511 = v510;
  }
  v501 = 0;
  v500 = 0;
  unint64_t v502 = 0;
  std::vector<unsigned long long>::reserve((void **)&v500, 0xAAAAAAAAAAAAAAABLL * (v585 - v584));
  uint64_t v157 = (uint64_t)v585;
  uint64_t v158 = (uint64_t)v584;
  v159 = v500;
  if (v585 != v584)
  {
    unint64_t v160 = 0;
    unint64_t v161 = v502;
    do
    {
      if (*(void *)(v158 + 24 * v160) != *(void *)(v158 + 24 * v160 + 8))
      {
        a9 = v501;
        if ((unint64_t)v501 >= v161)
        {
          uint64_t v162 = v501 - v159;
          unint64_t v163 = v162 + 1;
          if ((unint64_t)(v162 + 1) >> 61) {
            abort();
          }
          if ((uint64_t)(v161 - (void)v159) >> 2 > v163) {
            unint64_t v163 = (uint64_t)(v161 - (void)v159) >> 2;
          }
          if (v161 - (unint64_t)v159 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v164 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v164 = v163;
          }
          if (v164) {
            unint64_t v164 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v164);
          }
          else {
            uint64_t v165 = 0;
          }
          v166 = (unint64_t *)(v164 + 8 * v162);
          unint64_t *v166 = v160;
          unint64_t v11 = (unint64_t)(v166 + 1);
          while (a9 != v159)
          {
            unint64_t v167 = *((void *)a9 - 1);
            a9 = (char *)a9 - 8;
            *--v166 = v167;
          }
          unint64_t v161 = v164 + 8 * v165;
          v500 = v166;
          v501 = (void *)v11;
          unint64_t v502 = v161;
          if (v159) {
            operator delete(v159);
          }
          v159 = v166;
          int v150 = v453;
        }
        else
        {
          void *v501 = v160;
          a9 = (char *)a9 + 8;
          unint64_t v11 = (unint64_t)a9;
        }
        v501 = (void *)v11;
        uint64_t v157 = (uint64_t)v585;
        uint64_t v158 = (uint64_t)v584;
      }
      ++v160;
    }
    while (v160 < 0xAAAAAAAAAAAAAAABLL * ((v157 - v158) >> 3));
    v159 = v500;
  }
  if (v150)
  {
    LODWORD(a9) = 0;
    v442 = v501;
    unint64_t v11 = (unint64_t)v493;
    size_t __lena = (char *)v501 - (char *)v159;
    unint64_t v168 = v501 - v159;
    unint64_t v441 = (unint64_t)((char *)v501 - (char *)v159) >> 3;
    unsigned int v169 = v441 / v453;
    do
    {
      int v170 = a9 + 1;
      v486[0] = _NSConcreteStackBlock;
      v486[1] = 3321888768;
      v486[2] = __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_652;
      v486[3] = &unk_745CE0;
      if (a9 - v453 == -1) {
        int v171 = v441;
      }
      else {
        int v171 = (a9 + 1) * v169;
      }
      int v495 = a9 * v169;
      int v496 = v171;
      v488 = 0;
      v489 = 0;
      v487 = 0;
      if (v442 != v159)
      {
        if ((__lena & 0x8000000000000000) != 0) {
          abort();
        }
        v172 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v168);
        v487 = v172;
        v488 = v172;
        v489 = &v172[8 * v173];
        memmove(v172, v159, __lena);
        v488 = &v172[8 * v168];
      }
      unsigned int v497 = v460;
      v490 = a4;
      v486[5] = &v588;
      std::pair<ShaderBinaryInfo * {__strong},std::string>::pair[abi:nn180100](v491, (uint64_t)&v595);
      memset(v493, 0, sizeof(v493));
      std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__init_with_size[abi:nn180100]<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>*,std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>*>(v493, v598, (uint64_t *)v599, 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v599 - (unsigned char *)v598) >> 3));
      v486[6] = &v512;
      int v498 = (int)a9;
      int v499 = a11;
      memset(v494, 0, sizeof(v494));
      std::vector<std::vector<ShaderProfilerUSCSampleInfo>>::__init_with_size[abi:nn180100]<std::vector<ShaderProfilerUSCSampleInfo>*,std::vector<ShaderProfilerUSCSampleInfo>*>(v494, (uint64_t)v584, (uint64_t)v585, 0xAAAAAAAAAAAAAAABLL * (v585 - v584));
      v486[7] = &v530;
      v486[4] = v447;
      v486[8] = &v521;
      v486[9] = &v539;
      v486[10] = &v503;
      dispatch_group_async(v445, queue, v486);
      *(void *)v603 = v494;
      std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
      *(void *)v603 = v493;
      std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
      if (v492 < 0) {
        operator delete(v491[1]);
      }

      if (v487)
      {
        v488 = (char *)v487;
        operator delete(v487);
      }
      a9 = (void *)(a9 + 1);
    }
    while (v170 != v453);
  }
  dispatch_group_wait(v445, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v174 = v531[6];
  for (uint64_t k = v531[7]; v174 != k; v174 += 24)
  {
    uint64_t v176 = *(void *)v174;
    uint64_t v177 = *(void *)(v174 + 8);
    while (v176 != v177)
    {
      v178 = [*(id *)v176 uscSamples];
      BOOL v179 = v178 == 0;

      if (v179)
      {
        v180 = objc_opt_new();
        [*(id *)v176 setUscSamples:v180];
      }
      v181 = [*(id *)v176 uscSamples];
      [v181 appendBytes:*(void *)(v176 + 8) length:*(void *)(v176 + 16) - *(void *)(v176 + 8)];

      v176 += 32;
    }
  }
  if (*v435)
  {
    if (v460)
    {
      for (uint64_t m = 0; m != v460; ++m)
      {
        v183 = &v437[2 * m];
        v183[1] = m;
        if (v453)
        {
          uint64_t v184 = 0;
          unsigned int v185 = *v183;
          do
          {
            v185 += *(_DWORD *)(*(void *)(v540[6] + v184) + 8 * m);
            unsigned int *v183 = v185;
            v184 += 24;
          }
          while (24 * v453 != v184);
        }
      }
    }
    long long v483 = 0u;
    long long v484 = 0u;
    float v485 = 1.0;
    uint64_t v186 = v522[6];
    uint64_t v443 = v522[7];
    if (v186 != v443)
    {
      while (1)
      {
        uint64_t v446 = v186;
        v187 = *(uint64_t **)(v186 + 16);
        if (v187) {
          break;
        }
LABEL_326:
        uint64_t v186 = v446 + 40;
        if (v446 + 40 == v443) {
          goto LABEL_327;
        }
      }
      while (1)
      {
        v188 = std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](&v483, (uint64_t)(v187 + 2));
        if (!v188) {
          break;
        }
        v189 = (uint64_t *)v187[7];
        if (v189)
        {
          unint64_t v174 = (unint64_t)v188;
          v190 = (uint64_t *)(v188 + 40);
          v191 = v188 + 56;
          while (1)
          {
            unint64_t v192 = *((unsigned int *)v189 + 4);
            v193 = (int32x2_t *)std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v190, *((_DWORD *)v189 + 4));
            if (!v193) {
              break;
            }
            v193[3] = vadd_s32(v193[3], (int32x2_t)v189[3]);
            v193[5].i32[1] += *((_DWORD *)v189 + 11);
LABEL_235:
            v189 = (uint64_t *)*v189;
            if (!v189) {
              goto LABEL_325;
            }
          }
          a9 = *(void **)(v174 + 48);
          if (a9)
          {
            uint8x8_t v194 = (uint8x8_t)vcnt_s8((int8x8_t)a9);
            v194.i16[0] = vaddlv_u8(v194);
            if (v194.u32[0] > 1uLL)
            {
              unint64_t v11 = v192;
              if ((unint64_t)a9 <= v192) {
                unint64_t v11 = v192 % (unint64_t)a9;
              }
            }
            else
            {
              unint64_t v11 = (a9 - 1) & v192;
            }
            v195 = *(uint64_t ***)(*v190 + 8 * v11);
            if (v195)
            {
              for (n = *v195; n; n = (uint64_t *)*n)
              {
                unint64_t v197 = n[1];
                if (v197 == v192)
                {
                  if (*((_DWORD *)n + 4) == v192) {
                    goto LABEL_235;
                  }
                }
                else
                {
                  if (v194.u32[0] > 1uLL)
                  {
                    if (v197 >= (unint64_t)a9) {
                      v197 %= (unint64_t)a9;
                    }
                  }
                  else
                  {
                    v197 &= (unint64_t)a9 - 1;
                  }
                  if (v197 != v11) {
                    break;
                  }
                }
              }
            }
          }
          v198 = operator new(0x30uLL);
          void *v198 = 0;
          v198[1] = v192;
          long long v199 = *((_OWORD *)v189 + 2);
          *((_OWORD *)v198 + 1) = *((_OWORD *)v189 + 1);
          *((_OWORD *)v198 + 2) = v199;
          float v200 = (float)(unint64_t)(*(void *)(v174 + 64) + 1);
          float v201 = *(float *)(v174 + 72);
          if (!a9 || (float)(v201 * (float)(unint64_t)a9) < v200)
          {
            BOOL v202 = ((unint64_t)a9 & ((unint64_t)a9 - 1)) != 0;
            if ((unint64_t)a9 < 3) {
              BOOL v202 = 1;
            }
            unint64_t v203 = v202 | (2 * (void)a9);
            unint64_t v204 = vcvtps_u32_f32(v200 / v201);
            if (v203 <= v204) {
              size_t v205 = v204;
            }
            else {
              size_t v205 = v203;
            }
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v190, v205);
            a9 = *(void **)(v174 + 48);
            if (((unint64_t)a9 & ((unint64_t)a9 - 1)) != 0)
            {
              if ((unint64_t)a9 <= v192) {
                unint64_t v11 = v192 % (unint64_t)a9;
              }
              else {
                unint64_t v11 = v192;
              }
            }
            else
            {
              unint64_t v11 = (a9 - 1) & v192;
            }
          }
          uint64_t v206 = *v190;
          v207 = *(void **)(*v190 + 8 * v11);
          if (v207)
          {
            void *v198 = *v207;
          }
          else
          {
            void *v198 = *v191;
            void *v191 = v198;
            *(void *)(v206 + 8 * v11) = v191;
            if (!*v198)
            {
LABEL_234:
              ++*(void *)(v174 + 64);
              goto LABEL_235;
            }
            unint64_t v208 = *(void *)(*v198 + 8);
            if (((unint64_t)a9 & ((unint64_t)a9 - 1)) != 0)
            {
              if (v208 >= (unint64_t)a9) {
                v208 %= (unint64_t)a9;
              }
            }
            else
            {
              v208 &= (unint64_t)a9 - 1;
            }
            v207 = (void *)(*v190 + 8 * v208);
          }
          void *v207 = v198;
          goto LABEL_234;
        }
LABEL_325:
        v187 = (uint64_t *)*v187;
        if (!v187) {
          goto LABEL_326;
        }
      }
      int v209 = *((char *)v187 + 39);
      if (v209 >= 0) {
        v210 = v187 + 2;
      }
      else {
        v210 = (uint64_t *)v187[2];
      }
      if (v209 >= 0) {
        unint64_t v211 = *((unsigned __int8 *)v187 + 39);
      }
      else {
        unint64_t v211 = v187[3];
      }
      unint64_t v212 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v210, v211);
      v213 = (void *)v212;
      size_t v214 = *((void *)&v483 + 1);
      if (*((void *)&v483 + 1))
      {
        uint8x8_t v215 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v483 + 8));
        v215.i16[0] = vaddlv_u8(v215);
        unint64_t v174 = v215.u32[0];
        if (v215.u32[0] > 1uLL)
        {
          a9 = (void *)v212;
          if (v212 >= *((void *)&v483 + 1)) {
            a9 = (void *)(v212 % *((void *)&v483 + 1));
          }
        }
        else
        {
          a9 = (void *)((*((void *)&v483 + 1) - 1) & v212);
        }
        v216 = *(unsigned __int8 ***)(v483 + 8 * (void)a9);
        if (v216)
        {
          for (iuint64_t i = *v216; ii; iuint64_t i = *(unsigned __int8 **)ii)
          {
            unint64_t v218 = *((void *)ii + 1);
            if ((void *)v218 == v213)
            {
              if (std::equal_to<std::string>::operator()[abi:nn180100](ii + 16, (unsigned __int8 *)v187 + 16)) {
                goto LABEL_325;
              }
            }
            else
            {
              if (v174 > 1)
              {
                if (v218 >= v214) {
                  v218 %= v214;
                }
              }
              else
              {
                v218 &= v214 - 1;
              }
              if ((void *)v218 != a9) {
                break;
              }
            }
          }
        }
      }
      v219 = (char *)operator new(0x50uLL);
      *(void *)v603 = v219;
      *(void *)&v603[8] = &v484;
      v603[16] = 0;
      *(void *)v219 = 0;
      *((void *)v219 + 1) = v213;
      v220 = (std::string *)(v219 + 16);
      if (*((char *)v187 + 39) < 0)
      {
        std::string::__init_copy_ctor_external(v220, (const std::string::value_type *)v187[2], v187[3]);
      }
      else
      {
        long long v221 = *((_OWORD *)v187 + 1);
        *((void *)v219 + 4) = v187[4];
        *(_OWORD *)&v220->__r_.__value_.__l.__data_ = v221;
      }
      v461 = a9;
      size_t __lenb = v214;
      unint64_t v454 = (unint64_t)v213;
      *(_OWORD *)(v219 + 40) = 0u;
      v222 = (uint64_t *)(v219 + 40);
      *(_OWORD *)(v219 + 56) = 0u;
      *((_DWORD *)v219 + 18) = *((_DWORD *)v187 + 18);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)(v219 + 40), v187[6]);
      a9 = (void *)v187[7];
      if (a9)
      {
        v223 = v219 + 56;
        unint64_t v224 = *((void *)v219 + 6);
        do
        {
          unint64_t v11 = (unint64_t)a9 + 16;
          unint64_t v225 = *((unsigned int *)a9 + 4);
          if (v224)
          {
            uint8x8_t v226 = (uint8x8_t)vcnt_s8((int8x8_t)v224);
            v226.i16[0] = vaddlv_u8(v226);
            if (v226.u32[0] > 1uLL)
            {
              unint64_t v174 = *((unsigned int *)a9 + 4);
              if (v224 <= v225) {
                unint64_t v174 = v225 % v224;
              }
            }
            else
            {
              unint64_t v174 = (v224 - 1) & v225;
            }
            v227 = *(uint64_t ***)(*v222 + 8 * v174);
            if (v227)
            {
              for (juint64_t j = *v227; jj; juint64_t j = (uint64_t *)*jj)
              {
                unint64_t v229 = jj[1];
                if (v229 == v225)
                {
                  if (*((_DWORD *)jj + 4) == v225) {
                    goto LABEL_302;
                  }
                }
                else
                {
                  if (v226.u32[0] > 1uLL)
                  {
                    if (v229 >= v224) {
                      v229 %= v224;
                    }
                  }
                  else
                  {
                    v229 &= v224 - 1;
                  }
                  if (v229 != v174) {
                    break;
                  }
                }
              }
            }
          }
          v230 = operator new(0x30uLL);
          void *v230 = 0;
          v230[1] = v225;
          long long v231 = *((_OWORD *)a9 + 2);
          *((_OWORD *)v230 + 1) = *(_OWORD *)v11;
          *((_OWORD *)v230 + 2) = v231;
          float v232 = (float)(unint64_t)(*((void *)v219 + 8) + 1);
          float v233 = *((float *)v219 + 18);
          if (!v224 || (float)(v233 * (float)v224) < v232)
          {
            BOOL v234 = (v224 & (v224 - 1)) != 0;
            if (v224 < 3) {
              BOOL v234 = 1;
            }
            unint64_t v235 = v234 | (2 * v224);
            unint64_t v236 = vcvtps_u32_f32(v232 / v233);
            if (v235 <= v236) {
              size_t v237 = v236;
            }
            else {
              size_t v237 = v235;
            }
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)(v219 + 40), v237);
            unint64_t v224 = *((void *)v219 + 6);
            if ((v224 & (v224 - 1)) != 0)
            {
              if (v224 <= v225) {
                unint64_t v174 = v225 % v224;
              }
              else {
                unint64_t v174 = v225;
              }
            }
            else
            {
              unint64_t v174 = (v224 - 1) & v225;
            }
          }
          uint64_t v238 = *v222;
          v239 = *(void **)(*v222 + 8 * v174);
          if (v239)
          {
            void *v230 = *v239;
          }
          else
          {
            void *v230 = *v223;
            void *v223 = v230;
            *(void *)(v238 + 8 * v174) = v223;
            if (!*v230) {
              goto LABEL_301;
            }
            unint64_t v240 = *(void *)(*v230 + 8);
            if ((v224 & (v224 - 1)) != 0)
            {
              if (v240 >= v224) {
                v240 %= v224;
              }
            }
            else
            {
              v240 &= v224 - 1;
            }
            v239 = (void *)(*v222 + 8 * v240);
          }
          void *v239 = v230;
LABEL_301:
          ++*((void *)v219 + 8);
LABEL_302:
          a9 = *(void **)a9;
        }
        while (a9);
      }
      v603[16] = 1;
      float v241 = (float)(unint64_t)(*((void *)&v484 + 1) + 1);
      unint64_t v243 = (unint64_t)v461;
      size_t v242 = __lenb;
      if (!__lenb || (float)(v485 * (float)__lenb) < v241)
      {
        BOOL v244 = (__lenb & (__lenb - 1)) != 0;
        if (__lenb < 3) {
          BOOL v244 = 1;
        }
        unint64_t v245 = v244 | (2 * __lenb);
        unint64_t v246 = vcvtps_u32_f32(v241 / v485);
        if (v245 <= v246) {
          size_t v247 = v246;
        }
        else {
          size_t v247 = v245;
        }
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v483, v247);
        size_t v242 = *((void *)&v483 + 1);
        if ((*((void *)&v483 + 1) & (*((void *)&v483 + 1) - 1)) != 0)
        {
          if (v454 >= *((void *)&v483 + 1)) {
            unint64_t v243 = v454 % *((void *)&v483 + 1);
          }
          else {
            unint64_t v243 = v454;
          }
        }
        else
        {
          unint64_t v243 = (*((void *)&v483 + 1) - 1) & v454;
        }
      }
      uint64_t v248 = v483;
      v249 = *(void **)(v483 + 8 * v243);
      if (v249)
      {
        *(void *)v219 = *v249;
      }
      else
      {
        *(void *)v219 = v484;
        *(void *)&long long v484 = v219;
        *(void *)(v248 + 8 * v243) = &v484;
        if (!*(void *)v219)
        {
LABEL_324:
          *(void *)v603 = 0;
          ++*((void *)&v484 + 1);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,void *>>>>::reset[abi:nn180100]((uint64_t)v603);
          goto LABEL_325;
        }
        size_t v250 = *(void *)(*(void *)v219 + 8);
        if ((v242 & (v242 - 1)) != 0)
        {
          if (v250 >= v242) {
            v250 %= v242;
          }
        }
        else
        {
          v250 &= v242 - 1;
        }
        v249 = (void *)(v483 + 8 * v250);
      }
      void *v249 = v219;
      goto LABEL_324;
    }
LABEL_327:
    long long v480 = 0u;
    long long v481 = 0u;
    float v482 = 1.0;
    uint64_t v251 = v504[6];
    uint64_t v455 = v504[7];
    if (v251 != v455)
    {
      double v252 = 0.0;
      while (1)
      {
        uint64_t v462 = v251;
        v253 = *(uint64_t **)(v251 + 16);
        if (v253) {
          break;
        }
LABEL_413:
        uint64_t v251 = v462 + 40;
        if (v462 + 40 == v455) {
          goto LABEL_416;
        }
      }
      while (1)
      {
        int v254 = *((char *)v253 + 39);
        if (v254 >= 0) {
          v255 = v253 + 2;
        }
        else {
          v255 = (uint64_t *)v253[2];
        }
        if (v254 >= 0) {
          unint64_t v256 = *((unsigned __int8 *)v253 + 39);
        }
        else {
          unint64_t v256 = v253[3];
        }
        unint64_t v257 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v255, v256);
        unint64_t v258 = *((void *)&v480 + 1);
        if (!*((void *)&v480 + 1))
        {
          v263 = v253 + 5;
          unint64_t v264 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v255, v256);
          goto LABEL_371;
        }
        unint64_t v259 = v257;
        uint8x8_t v260 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v480 + 8));
        v260.i16[0] = vaddlv_u8(v260);
        unint64_t v261 = v260.u32[0];
        if (v260.u32[0] > 1uLL)
        {
          unint64_t v262 = v257;
          if (v257 >= *((void *)&v480 + 1)) {
            unint64_t v262 = v257 % *((void *)&v480 + 1);
          }
        }
        else
        {
          unint64_t v262 = (*((void *)&v480 + 1) - 1) & v257;
        }
        v265 = *(void ***)(v480 + 8 * v262);
        if (v265)
        {
          v266 = (char *)*v265;
          if (*v265)
          {
            while (1)
            {
              unint64_t v267 = *((void *)v266 + 1);
              if (v267 == v259)
              {
                if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v266 + 16, (unsigned __int8 *)v253 + 16))
                {
                  char v299 = 0;
                  goto LABEL_397;
                }
              }
              else
              {
                if (v261 > 1)
                {
                  if (v267 >= v258) {
                    v267 %= v258;
                  }
                }
                else
                {
                  v267 &= v258 - 1;
                }
                if (v267 != v262)
                {
LABEL_353:
                  v263 = v253 + 5;
                  unint64_t v264 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v255, v256);
                  if (!v258) {
                    goto LABEL_371;
                  }
                  goto LABEL_356;
                }
              }
              v266 = *(char **)v266;
              if (!v266) {
                goto LABEL_353;
              }
            }
          }
        }
        v263 = v253 + 5;
        unint64_t v264 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v255, v256);
LABEL_356:
        uint8x8_t v268 = (uint8x8_t)vcnt_s8((int8x8_t)v258);
        v268.i16[0] = vaddlv_u8(v268);
        unint64_t v269 = v268.u32[0];
        if (v268.u32[0] > 1uLL)
        {
          unint64_t v256 = v264;
          if (v264 >= v258) {
            unint64_t v256 = v264 % v258;
          }
        }
        else
        {
          unint64_t v256 = (v258 - 1) & v264;
        }
        v270 = *(void ***)(v480 + 8 * v256);
        if (v270)
        {
          v266 = (char *)*v270;
          if (*v270)
          {
            do
            {
              unint64_t v271 = *((void *)v266 + 1);
              if (v271 == v264)
              {
                if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v266 + 16, (unsigned __int8 *)v253 + 16))
                {
                  char v299 = 1;
                  goto LABEL_397;
                }
              }
              else
              {
                if (v269 > 1)
                {
                  if (v271 >= v258) {
                    v271 %= v258;
                  }
                }
                else
                {
                  v271 &= v258 - 1;
                }
                if (v271 != v256) {
                  break;
                }
              }
              v266 = *(char **)v266;
            }
            while (v266);
          }
        }
LABEL_371:
        v266 = (char *)operator new(0x58uLL);
        *(void *)v603 = v266;
        *(void *)&v603[8] = &v481;
        v603[16] = 0;
        *(void *)v266 = 0;
        *((void *)v266 + 1) = v264;
        v272 = (std::string *)(v266 + 16);
        if (*((char *)v253 + 39) < 0)
        {
          std::string::__init_copy_ctor_external(v272, (const std::string::value_type *)v253[2], v253[3]);
        }
        else
        {
          long long v273 = *((_OWORD *)v253 + 1);
          *((void *)v266 + 4) = v253[4];
          *(_OWORD *)&v272->__r_.__value_.__l.__data_ = v273;
        }
        *(_OWORD *)(v266 + 40) = *v263;
        *((void *)v266 + 8) = 0;
        *((void *)v266 + 9) = 0;
        *((void *)v266 + 7) = 0;
        *(_OWORD *)(v266 + 56) = *(_OWORD *)(v253 + 7);
        *((void *)v266 + 9) = v253[9];
        v253[7] = 0;
        v253[8] = 0;
        v253[9] = 0;
        *((void *)v266 + 10) = v253[10];
        v603[16] = 1;
        float v274 = (float)(unint64_t)(*((void *)&v481 + 1) + 1);
        if (!v258 || (float)(v482 * (float)v258) < v274)
        {
          BOOL v275 = v258 < 3 || (v258 & (v258 - 1)) != 0;
          unint64_t v276 = v275 | (2 * v258);
          unint64_t v277 = vcvtps_u32_f32(v274 / v482);
          if (v276 <= v277) {
            size_t v278 = v277;
          }
          else {
            size_t v278 = v276;
          }
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v480, v278);
          unint64_t v258 = *((void *)&v480 + 1);
          if ((*((void *)&v480 + 1) & (*((void *)&v480 + 1) - 1)) != 0)
          {
            if (v264 >= *((void *)&v480 + 1)) {
              unint64_t v256 = v264 % *((void *)&v480 + 1);
            }
            else {
              unint64_t v256 = v264;
            }
          }
          else
          {
            unint64_t v256 = (*((void *)&v480 + 1) - 1) & v264;
          }
        }
        uint64_t v279 = v480;
        v280 = *(void **)(v480 + 8 * v256);
        if (v280)
        {
          *(void *)v266 = *v280;
        }
        else
        {
          *(void *)v266 = v481;
          *(void *)&long long v481 = v266;
          *(void *)(v279 + 8 * v256) = &v481;
          if (!*(void *)v266) {
            goto LABEL_396;
          }
          unint64_t v281 = *(void *)(*(void *)v266 + 8);
          if ((v258 & (v258 - 1)) != 0)
          {
            if (v281 >= v258) {
              v281 %= v258;
            }
          }
          else
          {
            v281 &= v258 - 1;
          }
          v280 = (void *)(v480 + 8 * v281);
        }
        void *v280 = v266;
LABEL_396:
        *(void *)v603 = 0;
        ++*((void *)&v481 + 1);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,BinaryInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,BinaryInfo>,void *>>>>::reset[abi:nn180100]((uint64_t)v603);
        char v299 = 1;
LABEL_397:
        uint64_t v282 = v253[7];
        uint64_t v283 = v253[8];
        unint64_t v284 = 0x6DB6DB6DB6DB6DB7 * ((v283 - v282) >> 3);
        uint64_t v285 = *((void *)v266 + 7);
        if (v284 == 0x6DB6DB6DB6DB6DB7 * ((*((void *)v266 + 8) - v285) >> 3) && v283 != v282)
        {
          uint64_t v287 = 0;
          if (v284 <= 1) {
            unint64_t v284 = 1;
          }
          do
          {
            v288 = (uint64_t *)(v285 + 56 * v287);
            *((_DWORD *)v288 + 8) += *(_DWORD *)(v282 + 56 * v287 + 32);
            uint64_t v289 = *v288;
            uint64_t v290 = v288[1] - *v288;
            if (v290)
            {
              float64x2_t v292 = *(float64x2_t *)(v288 + 5);
              v291 = (float64x2_t *)(v288 + 5);
              float64x2_t v293 = v292;
              uint64_t v294 = v290 / 24;
              float64x2_t v295 = *(float64x2_t *)(v266 + 40);
              if ((unint64_t)(v290 / 24) <= 1) {
                uint64_t v294 = 1;
              }
              v296 = (float64x2_t *)(*(void *)(v282 + 56 * v287) + 8);
              v297 = (float64x2_t *)(v289 + 8);
              do
              {
                if ((v299 & 1) == 0)
                {
                  LODWORD(v297[-1].f64[1]) += LODWORD(v296[-1].f64[1]);
                  float64x2_t *v297 = vaddq_f64(*v296, *v297);
                }
                float64x2_t v298 = *v296;
                v296 = (float64x2_t *)((char *)v296 + 24);
                float64x2_t v293 = vaddq_f64(v298, v293);
                float64x2_t v295 = vaddq_f64(v298, v295);
                double v252 = v252 + v298.f64[1];
                v297 = (float64x2_t *)((char *)v297 + 24);
                --v294;
              }
              while (v294);
              float64x2_t *v291 = v293;
              *(float64x2_t *)(v266 + 40) = v295;
            }
            ++v287;
          }
          while (v287 != v284);
        }
        v253 = (uint64_t *)*v253;
        if (!v253) {
          goto LABEL_413;
        }
      }
    }
    double v252 = 0.0;
LABEL_416:
    v300 = fopen("/tmp/com.apple.gputools.profiling/shaderProfilerResults/bblCostInfo.txt", "wt");
    std::string::basic_string[abi:nn180100]<0>(v603, "Binary 0x%s : Num Basic Blocks = %u : Total Cost = %.4f %% Weight = %.4f\n\n");
    std::string::basic_string[abi:nn180100]<0>(v471, "Index   PC  NumInst  Mean Occurences  Total Original Cost Total Cost  Block Weight %%\n");
    std::string::basic_string[abi:nn180100]<0>(v601, "%d      0x%x %4d %10u  %15.2f %15.2f %15.4f\n\n");
    std::string::basic_string[abi:nn180100]<0>(&v477, "%d      0x%x %15u %15.4f %15.4f %15.5f\n");
    uint64_t v301 = v481;
    if ((void)v481)
    {
      do
      {
        v302 = (void *)(v301 + 16);
        v303 = *(GPUToolsPlatformLLVMShaderProfilerHelperImpl ***)(v301 + 80);
        TargetClauseAnalysis = (uint64_t *)GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(*v303);
        if (v603[23] >= 0) {
          v305 = v603;
        }
        else {
          v305 = *(const char **)v603;
        }
        if (*(char *)(v301 + 39) < 0) {
          v302 = (void *)*v302;
        }
        uint64_t v306 = *TargetClauseAnalysis;
        fprintf(v300, v305, v302, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(v301 + 64) - *(void *)(v301 + 56)) >> 3), *(void *)(v301 + 48), *(double *)(v301 + 48) * 100.0 / v252);
        v307 = *(unsigned int ***)(v301 + 56);
        v456 = (uint64_t *)v301;
        v463 = *(unsigned int ***)(v301 + 64);
        if (v307 != v463)
        {
          uint64_t v308 = 0;
          v309 = (void *)(v306 + 160);
          do
          {
            v310 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v309, *((_DWORD *)v307 + 6));
            if (v310)
            {
              v311 = v310;
              if ((SBYTE7(v472) & 0x80u) == 0) {
                v312 = v471;
              }
              else {
                v312 = (void **)v471[0];
              }
              fputs((const char *)v312, v300);
              if (v602 >= 0) {
                v313 = (const char *)v601;
              }
              else {
                v313 = (const char *)v601[0];
              }
              int __lenc = v308;
              fprintf(v300, v313, v308, v311[3], 0xAAAAAAAAAAAAAAABLL * (((char *)v307[1] - (char *)*v307) >> 3), *((unsigned int *)v307 + 8), v307[5], v307[6], *((double *)v307 + 6) * 100.0 / v252);
              v315 = *v307;
              v314 = v307[1];
              if (*v307 != v314)
              {
                int v316 = 0;
                do
                {
                  v317 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v309, *((_DWORD *)v307 + 6) + v316);
                  if (v317)
                  {
                    uint64_t v318 = v317[3];
                    GPUToolsPlatformLLVMShaderProfilerHelper::ShaderInstructionInfoFromBinary((void ***)&v474, (uint64_t)*v303, v318, v318 + *((unsigned int *)v317 + 8));
                    if (v474 != v475)
                    {
                      v319 = &v474->__r_.__value_.__s.__data_[8];
                      if (v474[1].__r_.__value_.__s.__data_[7] < 0) {
                        v319 = *(const char **)v319;
                      }
                      fprintf(v300, "%s\n", v319);
                      if (SHIBYTE(v479) >= 0) {
                        fprintf(v300, (const char *)&v477, (*((_DWORD *)v307 + 6) + v316), v318, *v315, *((void *)v315 + 1), *((void *)v315 + 2), *((double *)v315 + 2) * 100.0 / v252);
                      }
                      else {
                        fprintf(v300, (const char *)v477, (*((_DWORD *)v307 + 6) + v316), v318, *v315, *((void *)v315 + 1), *((void *)v315 + 2), *((double *)v315 + 2) * 100.0 / v252);
                      }
                      ++v316;
                    }
                    v470.__r_.__value_.__r.__words[0] = (std::string::size_type)&v474;
                    std::vector<InstructionInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&v470);
                  }
                  v315 += 6;
                }
                while (v315 != v314);
              }
              uint64_t v308 = (__lenc + 1);
              fputc(10, v300);
            }
            v307 += 7;
          }
          while (v307 != v463);
        }
        fputc(10, v300);
        uint64_t v301 = *v456;
      }
      while (*v456);
    }
    fclose(v300);
    if (SHIBYTE(v479) < 0) {
      operator delete(v477);
    }
    v320 = v447;
    if (SHIBYTE(v602) < 0) {
      operator delete(v601[0]);
    }
    if (SBYTE7(v472) < 0) {
      operator delete(v471[0]);
    }
    if ((v603[23] & 0x80000000) != 0) {
      operator delete(*(void **)v603);
    }
    *(_OWORD *)v471 = 0u;
    long long v472 = 0u;
    int v473 = 1065353216;
    uint64_t v321 = v513[6];
    uint64_t v322 = v513[7];
    while (v321 != v322)
    {
      for (kuint64_t k = *(void **)(v321 + 16); kk; kuint64_t k = (void *)*kk)
      {
        if (!std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](v471, (uint64_t)(kk + 2)))std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>((uint64_t)v471, (uint64_t)(kk + 2), (uint64_t)(kk + 2), kk + 5); {
      }
        }
      v321 += 40;
    }
    unint64_t v324 = *((void *)&v484 + 1);
    v478 = 0;
    v479 = 0;
    v477 = 0;
    if (*((void *)&v484 + 1))
    {
      if (*((void *)&v484 + 1) >= 0xAAAAAAAAAAAAAABuLL) {
        abort();
      }
      v325 = (char *)operator new(24 * *((void *)&v484 + 1));
      v477 = v325;
      v479 = &v325[24 * v324];
      bzero(v325, 24 * ((24 * v324 - 24) / 0x18) + 24);
      v478 = &v325[24 * ((24 * v324 - 24) / 0x18) + 24];
      v326 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v324);
      bzero(v326, 4 * v324);
      uint64_t v327 = *((void *)&v484 + 1);
      if (*((void *)&v484 + 1))
      {
        if (*((void *)&v484 + 1) >> 62) {
          abort();
        }
        v328 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(*((unint64_t *)&v484 + 1));
        bzero(v328, 4 * v327);
        goto LABEL_468;
      }
    }
    else
    {
      v326 = 0;
    }
    v328 = 0;
LABEL_468:
    v464 = (unsigned int *)v326;
    __lend = v328;
    v329 = (void *)v484;
    if ((void)v484)
    {
      unsigned int v330 = 0;
      unsigned int v331 = 0;
      do
      {
        uint64_t v332 = v330;
        v333 = (char *)v477;
        v334 = (unint64_t *)((char *)v477 + 24 * v330);
        v335 = v334 + 2;
        unint64_t v336 = v329[8];
        unint64_t v337 = *v334;
        v457 = v329;
        if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v334[2] - *v334) >> 2) < v336)
        {
          if (v336 > 0x924924924924924) {
            abort();
          }
          v338 = (char *)v477 + 24 * v330;
          uint64_t v341 = *((void *)v338 + 1);
          v339 = (void **)(v338 + 8);
          uint64_t v340 = v341;
          v342 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<ClauseData>>(v336);
          v344 = (char *)*v339;
          v345 = (char *)*v334;
          v346 = &v342[28 * ((uint64_t)(v341 - v337) / 28)];
          if (*v339 != (void *)*v334)
          {
            do
            {
              long long v347 = *(_OWORD *)(v344 - 28);
              *((_OWORD *)v346 - 1) = *((_OWORD *)v344 - 1);
              *(_OWORD *)(v346 - 28) = v347;
              v346 -= 28;
              v344 -= 28;
            }
            while (v344 != v345);
            v344 = (char *)*v334;
          }
          unint64_t *v334 = (unint64_t)v346;
          *v339 = &v342[28 * ((uint64_t)(v340 - v337) / 28)];
          void *v335 = &v342[28 * v343];
          v329 = v457;
          if (v344) {
            operator delete(v344);
          }
        }
        v348 = (uint64_t *)v329[7];
        v349 = &v333[24 * v332];
        v352 = (_OWORD *)*((void *)v349 + 1);
        v351 = (void **)(v349 + 8);
        for (muint64_t m = v352; v348; v348 = (uint64_t *)*v348)
        {
          v353 = (long long *)((char *)v348 + 20);
          if ((unint64_t)mm >= *v335)
          {
            uint64_t v355 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)((uint64_t)mm - *v334) >> 2);
            unint64_t v356 = v355 + 1;
            if ((unint64_t)(v355 + 1) > 0x924924924924924) {
              abort();
            }
            if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v335 - *v334) >> 2) > v356) {
              unint64_t v356 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v335 - *v334) >> 2);
            }
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v335 - *v334) >> 2)) >= 0x492492492492492) {
              unint64_t v357 = 0x924924924924924;
            }
            else {
              unint64_t v357 = v356;
            }
            if (v357) {
              unint64_t v357 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ClauseData>>(v357);
            }
            else {
              uint64_t v358 = 0;
            }
            v359 = (_OWORD *)(v357 + 28 * v355);
            long long v360 = *v353;
            *(_OWORD *)((char *)v359 + 12) = *((_OWORD *)v348 + 2);
            _OWORD *v359 = v360;
            v361 = (char *)*v351;
            v362 = (char *)*v334;
            v363 = v359;
            if (*v351 != (void *)*v334)
            {
              do
              {
                long long v364 = *(_OWORD *)(v361 - 28);
                *(v363 - 1) = *((_OWORD *)v361 - 1);
                *(_OWORD *)((char *)v363 - 28) = v364;
                v363 = (_OWORD *)((char *)v363 - 28);
                v361 -= 28;
              }
              while (v361 != v362);
              v361 = (char *)*v334;
            }
            unint64_t *v334 = (unint64_t)v363;
            muint64_t m = (_OWORD *)((char *)v359 + 28);
            *v351 = (char *)v359 + 28;
            void *v335 = v357 + 28 * v358;
            if (v361) {
              operator delete(v361);
            }
          }
          else
          {
            long long v354 = *v353;
            *(_OWORD *)((char *)mm + 12) = *((_OWORD *)v348 + 2);
            *muint64_t m = v354;
            muint64_t m = (_OWORD *)((char *)mm + 28);
          }
          *v351 = mm;
          v331 += *((_DWORD *)v348 + 7);
          v464[v332] += *((_DWORD *)v348 + 6);
          __lend[v332] += *((_DWORD *)v348 + 7);
        }
        unint64_t v365 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * ((uint64_t)((uint64_t)mm - *v334) >> 2));
        if (mm == (_OWORD *)*v334) {
          uint64_t v366 = 0;
        }
        else {
          uint64_t v366 = v365;
        }
        std::__introsort<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *,false>(*v334, (unsigned int *)mm, v366, 1);
        unsigned int v330 = v332 + 1;
        v329 = (void *)*v457;
        v320 = v447;
      }
      while (*v457);
    }
    else
    {
      unsigned int v331 = 0;
    }
    std::string::basic_string[abi:nn180100]<0>(v603, "%u%u");
    std::string::basic_string[abi:nn180100]<0>(&v604, "");
    std::string::basic_string[abi:nn180100]<0>(&v607, "%s%s%u%u%.2f");
    std::string::basic_string[abi:nn180100]<0>(v610, "");
    v474 = 0;
    v475 = 0;
    p_data = 0;
    v474 = (std::string *)operator new(0x60uLL);
    v475 = v474;
    p_data = (void **)&v474[4].__r_.__value_.__l.__data_;
    v367 = v464;
    uint64_t v368 = 0;
    v475 = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((long long *)v603, &v611, v474);
    do
    {
      if (SHIBYTE(v610[v368 + 2]) < 0) {
        operator delete((void *)v610[v368]);
      }
      v368 -= 3;
    }
    while (v368 != -12);
    v369 = [(DYPMTLShaderProfilerHelper *)v320 _costHeaders];
    if (v369)
    {
      uint64_t v370 = 0;
      for (uint64_t nn = 0; nn != 3; ++nn)
      {
        id v372 = [v369 objectAtIndexedSubscript:nn];
        v373 = (const std::string::value_type *)[v372 UTF8String];
        std::string::assign(&v474[v370], v373);

        ++v370;
      }
    }
    v374 = fopen("/tmp/com.apple.gputools.profiling/shaderProfilerResults/segLikeCost.txt", "wt");
    v375 = fopen("/tmp/com.apple.gputools.profiling/shaderProfilerResults/segLikeCostOnly.txt", "wt");
    v376 = v474;
    if (SHIBYTE(v474->__r_.__value_.__r.__words[2]) < 0) {
      v376 = (std::string *)v474->__r_.__value_.__r.__words[0];
    }
    v377 = (int *)v576[6];
    v378 = (int *)v576[7];
    if (v377 == v378)
    {
      uint64_t v379 = 0;
    }
    else
    {
      LODWORD(v379) = 0;
      do
      {
        int v380 = *v377++;
        uint64_t v379 = (v380 + v379);
      }
      while (v377 != v378);
    }
    v381 = (int *)v567[6];
    v382 = (int *)v567[7];
    if (v381 == v382)
    {
      uint64_t v383 = 0;
    }
    else
    {
      LODWORD(v383) = 0;
      do
      {
        int v384 = *v381++;
        uint64_t v383 = (v384 + v383);
      }
      while (v381 != v382);
    }
    v449 = v369;
    fprintf(v374, (const char *)v376, v379, v383);
    v385 = (const char *)&v474[1];
    if (SHIBYTE(v474[1].__r_.__value_.__r.__words[2]) < 0) {
      v385 = *(const char **)v385;
    }
    fputs(v385, v375);
    uint64_t v386 = v484;
    if ((void)v484)
    {
      unsigned int v387 = 0;
      double v388 = (double)v331;
      do
      {
        v389 = (const char *)&v474[2];
        if (SHIBYTE(v474[2].__r_.__value_.__r.__words[2]) < 0) {
          v389 = *(const char **)v389;
        }
        v390 = (uint64_t *)(v386 + 16);
        uint64_t v391 = v386 + 16;
        if (*(char *)(v386 + 39) < 0) {
          uint64_t v391 = *v390;
        }
        uint64_t v392 = v387;
        unsigned int v452 = v387;
        uint64_t v433 = __lend[v387];
        fprintf(v374, v389, off_745D10[*(unsigned int *)(*((void *)v477 + 3 * v387) + 20)], v391, v367[v387], v433, (double)v433 * 100.0 / v388);
        v393 = (const char *)&v474[2];
        if (SHIBYTE(v474[2].__r_.__value_.__r.__words[2]) < 0) {
          v393 = *(const char **)v393;
        }
        uint64_t v394 = v386 + 16;
        if (*(char *)(v386 + 39) < 0) {
          uint64_t v394 = *v390;
        }
        fprintf(v375, v393, off_745D10[*(unsigned int *)(*((void *)v477 + 3 * v392) + 20)], v394, v367[v392], __lend[v392], (double)__lend[v392] * 100.0 / v388);
        v395 = (const char *)&v474[1];
        v458 = (uint64_t *)v386;
        if (SHIBYTE(v474[1].__r_.__value_.__r.__words[2]) < 0) {
          v395 = *(const char **)v395;
        }
        fputs(v395, v374);
        v396 = (char *)v477 + 24 * v392;
        v397 = *(unsigned int **)v396;
        v398 = (unsigned int *)*((void *)v396 + 1);
        while (v397 != v398)
        {
          unsigned int v399 = v397[1];
          unsigned int v400 = v397[2];
          double v401 = (double)v400 / (double)v399;
          if (!v399) {
            double v401 = 0.0;
          }
          fprintf(v374, "0x%0.8x %6u %10u %10u %10u %10.2g %10u %10.2g\n", *v397, *v397, v397[3], v399, v397[6], v401, v397[2], (double)v400 * 100.0 / v388);
          unsigned int v402 = v397[1];
          unsigned int v403 = v397[2];
          double v404 = (double)v403 / (double)v402;
          if (!v402) {
            double v404 = 0.0;
          }
          fprintf(v375, "0x%0.8x %6u %10u %10u %10u %10.2g %10u %10.2g\n", *v397, *v397, v397[3], v402, v397[6], v404, v397[2], (double)v403 * 100.0 / v388);
          v405 = (GPUToolsPlatformLLVMShaderProfilerHelperImpl **)*((void *)std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](v471, (uint64_t)v390)+ 5);
          uint64_t v406 = GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(*v405);
          v407 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((void *)(*(void *)v406 + 56), *v397);
          if (v407) {
            unint64_t v408 = *((unsigned int *)v407 + 6);
          }
          else {
            unint64_t v408 = 0xFFFFFFFFLL;
          }
          v409 = *v405;
          v601[0] = 0;
          v601[1] = 0;
          *(_DWORD *)&v603[8] = 0;
          char v606 = 0;
          uint64_t v607 = 0;
          int v608 = 1;
          v604 = 0;
          v605 = 0;
          *(void *)&v603[16] = 0;
          uint64_t v602 = 0;
          v609 = v601;
          llvm::raw_ostream::SetUnbuffered((llvm::raw_ostream *)v603);
          v410 = (uint64_t **)GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(v409);
          uint64_t v412 = **v410;
          if (0x2E8BA2E8BA2E8BA3 * (((*v410)[1] - v412) >> 3) > v408)
          {
            v413 = (uint64_t *)(v412 + 88 * *(void *)((*v410)[3] + 48 * v408));
            GPUToolsPlatformLLVMShaderProfilerHelperImpl::_DumpInstructionsToOStream(v409, (llvm::raw_ostream *)v603, *v413, v413[1] + *v413, v411);
          }
          v414 = v609;
          if (*((char *)v609 + 23) < 0)
          {
            v416 = (std::string::value_type *)*v609;
            v415 = (unsigned __int8 *)v609[1];
          }
          else
          {
            v415 = (unsigned __int8 *)*((unsigned __int8 *)v609 + 23);
            v416 = (std::string::value_type *)v609;
          }
          v470.__r_.__value_.__s.__data_[0] = 9;
          v417 = std::remove[abi:nn180100]<std::__wrap_iter<char *>,char>(v416, &v415[(void)v416], (unsigned __int8 *)&v470);
          if (*((char *)v414 + 23) < 0)
          {
            v419 = *v414;
            v418 = (char *)v414[1] + (void)*v414;
          }
          else
          {
            v418 = (char *)v414 + *((unsigned __int8 *)v414 + 23);
            v419 = v414;
          }
          std::string::erase((std::string *)v414, v417 - v419, v418 - (char *)v417);
          if (*((char *)v609 + 23) < 0) {
            std::string::__init_copy_ctor_external(&v470, (const std::string::value_type *)*v609, (std::string::size_type)v609[1]);
          }
          else {
            std::string v470 = *(std::string *)v609;
          }
          llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)v603);
          if (SHIBYTE(v602) < 0) {
            operator delete(v601[0]);
          }
          int v420 = SHIBYTE(v470.__r_.__value_.__r.__words[2]);
          v421 = (void *)v470.__r_.__value_.__r.__words[0];
          if ((v470.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v422 = &v470;
          }
          else {
            v422 = (std::string *)v470.__r_.__value_.__r.__words[0];
          }
          fputs((const char *)v422, v374);
          fputc(10, v374);
          if (v420 < 0) {
            operator delete(v421);
          }
          v397 += 7;
        }
        unsigned int v387 = v452 + 1;
        uint64_t v386 = *v458;
        v367 = v464;
      }
      while (*v458);
    }
    if (v374) {
      fclose(v374);
    }
    unint64_t v423 = 126 - 2 * __clz(((char *)v434 - (char *)v437) >> 3);
    uint64_t v424 = (char *)v434 - (char *)v437;
    if (v434 == v437) {
      uint64_t v425 = 0;
    }
    else {
      uint64_t v425 = v423;
    }
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>((unint64_t)v437, v434, v425, 1);
    fwrite("\nDraw Call Costs\n", 0x11uLL, 1uLL, v375);
    fprintf(v375, "Idx   drawIdx  function vertex key  fragment key  Cost    %%Weight\n");
    if ((int)((unint64_t)v424 >> 3) >= 1)
    {
      uint64_t v426 = 0;
      double v427 = (double)v331;
      if ((int)(v424 >> 3) <= 1) {
        uint64_t v428 = 1;
      }
      else {
        uint64_t v428 = (int)(v424 >> 3);
      }
      v429 = v437;
      do
      {
        v430 = [v459 drawCallInfoList];
        v431 = [v430 objectAtIndexedSubscript:v426];

        fprintf(v375, "%d : %8u %8u   0x%s   0x%s    0x%s : %8u  : %4.2f\n", v426, [v431 drawCallIndex], [v431 functionIndex], (const char *)[v431 UTF8String], (const char *)[v431 UTF8String], (const char *)[v431 UTF8String], *v429, (double)*v429 * 100.0 / v427);
        v367 = v464;
        v369 = v449;
        ++v426;
        v429 += 2;
      }
      while (v428 != v426);
    }
    if (v375) {
      fclose(v375);
    }

    *(void *)v603 = &v474;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
    if (__lend) {
      operator delete(__lend);
    }
    if (v367) {
      operator delete(v367);
    }
    *(void *)v603 = &v477;
    std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
    std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__deallocate_node((void *)v472);
    v432 = v471[0];
    v471[0] = 0;
    if (v432) {
      operator delete(v432);
    }
    std::__hash_table<std::__hash_value_type<std::string,BinaryInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BinaryInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BinaryInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BinaryInfo>>>::~__hash_table((uint64_t)&v480);
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>>>::~__hash_table((uint64_t)&v483);
    v159 = v500;
  }
  if (v159)
  {
    v501 = v159;
    operator delete(v159);
  }
  _Block_object_dispose(&v503, 8);
  *(void *)v603 = &v509;
  std::vector<std::unordered_map<std::string,BinaryInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
  _Block_object_dispose(&v512, 8);
  *(void *)v603 = &v518;
  std::vector<std::unordered_map<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
  _Block_object_dispose(&v521, 8);
  *(void *)v603 = &v527;
  std::vector<std::unordered_map<std::string,std::unordered_map<unsigned int,ClauseData>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
  _Block_object_dispose(&v530, 8);
  *(void *)v603 = &v536;
  std::vector<std::vector<InstructionPCInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
  _Block_object_dispose(&v539, 8);
  *(void *)v603 = &v545;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
  if (v437) {
    operator delete(v437);
  }
  if (v450) {
    operator delete(v450);
  }

  _Block_object_dispose(v555, 8);
  if (v556)
  {
    v557 = v556;
    operator delete(v556);
  }
  _Block_object_dispose(&v559, 8);
  *(void *)v603 = v565;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
  _Block_object_dispose(&v566, 8);
  if (v572)
  {
    v573 = (char *)v572;
    operator delete(v572);
  }
  _Block_object_dispose(&v575, 8);
  if (v581)
  {
    v582 = (char *)v581;
    operator delete(v581);
  }
  *(void *)v603 = &v584;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
  _Block_object_dispose(&v588, 8);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>>>::~__hash_table((uint64_t)&v592[8]);
  if (v597 < 0) {
    operator delete(v596);
  }

  *(void *)v603 = &v598;
  std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v603);
}

void __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v6;
  unint64_t v9 = strtoull((const char *)[v8 UTF8String], 0, 16);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = v8;
  v12 = (char *)[v11 UTF8String];
  id v13 = v7;
  unint64_t v43 = v13;
  std::string::basic_string[abi:nn180100]<0>(&__p, v12);
  unint64_t v14 = *(void *)(v10 + 56);
  if (v14)
  {
    uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v14) {
        unint64_t v3 = v9 % v14;
      }
    }
    else
    {
      unint64_t v3 = (v14 - 1) & v9;
    }
    uint64_t v16 = *(void **)(*(void *)(v10 + 48) + 8 * v3);
    if (v16)
    {
      for (uint64_t i = (void *)*v16; i; uint64_t i = (void *)*i)
      {
        unint64_t v18 = i[1];
        if (v18 == v9)
        {
          if (i[2] == v9) {
            goto LABEL_74;
          }
        }
        else
        {
          if (v15.u32[0] > 1uLL)
          {
            if (v18 >= v14) {
              v18 %= v14;
            }
          }
          else
          {
            v18 &= v14 - 1;
          }
          if (v18 != v3) {
            break;
          }
        }
      }
    }
  }
  v19 = operator new(0x38uLL);
  unsigned int v20 = (void *)(v10 + 64);
  v46[0] = v19;
  v46[1] = v10 + 64;
  void *v19 = 0;
  v19[1] = v9;
  unint64_t v43 = 0;
  v19[2] = v9;
  v19[3] = v13;
  v19[6] = v45;
  *((_OWORD *)v19 + 2) = __p;
  long long __p = 0uLL;
  uint64_t v45 = 0;
  char v47 = 1;
  float v21 = (float)(unint64_t)(*(void *)(v10 + 72) + 1);
  float v22 = *(float *)(v10 + 80);
  if (!v14 || (float)(v22 * (float)v14) < v21)
  {
    BOOL v23 = 1;
    if (v14 >= 3) {
      BOOL v23 = (v14 & (v14 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v14);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    else {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v14 = *(void *)(v10 + 56);
    if (*(void *)&prime > v14) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v14)
    {
      unint64_t v33 = vcvtps_u32_f32((float)*(unint64_t *)(v10 + 72) / *(float *)(v10 + 80));
      if (v14 < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v14), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }
      else
      {
        uint64_t v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }
      if (*(void *)&prime <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      if (*(void *)&prime >= v14)
      {
        unint64_t v14 = *(void *)(v10 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          BOOL v27 = operator new(8 * *(void *)&prime);
          v28 = *(void **)(v10 + 48);
          *(void *)(v10 + 48) = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0;
          *(int8x8_t *)(v10 + 56) = prime;
          do
            *(void *)(*(void *)(v10 + 48) + 8 * v29++) = 0;
          while (*(void *)&prime != v29);
          v30 = (void *)*v20;
          if (*v20)
          {
            unint64_t v31 = v30[1];
            uint8x8_t v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(void *)&prime) {
                v31 %= *(void *)&prime;
              }
            }
            else
            {
              v31 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v10 + 48) + 8 * v31) = v20;
            unint64_t v36 = (void *)*v30;
            if (*v30)
            {
              do
              {
                unint64_t v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }
                else
                {
                  v37 &= *(void *)&prime - 1;
                }
                if (v37 != v31)
                {
                  uint64_t v38 = *(void *)(v10 + 48);
                  if (!*(void *)(v38 + 8 * v37))
                  {
                    *(void *)(v38 + 8 * v37) = v30;
                    goto LABEL_55;
                  }
                  void *v30 = *v36;
                  *unint64_t v36 = **(void **)(*(void *)(v10 + 48) + 8 * v37);
                  **(void **)(*(void *)(v10 + 48) + 8 * v37) = v36;
                  unint64_t v36 = v30;
                }
                unint64_t v37 = v31;
LABEL_55:
                v30 = v36;
                unint64_t v36 = (void *)*v36;
                unint64_t v31 = v37;
              }
              while (v36);
            }
          }
          unint64_t v14 = (unint64_t)prime;
          goto LABEL_59;
        }
        uint64_t v42 = *(void **)(v10 + 48);
        *(void *)(v10 + 48) = 0;
        if (v42) {
          operator delete(v42);
        }
        unint64_t v14 = 0;
        *(void *)(v10 + 56) = 0;
      }
    }
LABEL_59:
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v9 >= v14) {
        unint64_t v3 = v9 % v14;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v14 - 1) & v9;
    }
  }
  v39 = *(void **)(*(void *)(v10 + 48) + 8 * v3);
  uint64_t v40 = v46[0];
  if (v39)
  {
    *(void *)v46[0] = *v39;
LABEL_72:
    void *v39 = v40;
    goto LABEL_73;
  }
  *(void *)v46[0] = *(void *)(v10 + 64);
  *(void *)(v10 + 64) = v40;
  *(void *)(*(void *)(v10 + 48) + 8 * v3) = v20;
  if (*(void *)v40)
  {
    unint64_t v41 = *(void *)(*(void *)v40 + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v41 >= v14) {
        v41 %= v14;
      }
    }
    else
    {
      v41 &= v14 - 1;
    }
    v39 = (void *)(*(void *)(v10 + 48) + 8 * v41);
    goto LABEL_72;
  }
LABEL_73:
  v46[0] = 0;
  ++*(void *)(v10 + 72);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,void *>>>>::reset[abi:nn180100]((uint64_t)v46);
LABEL_74:
  if (SHIBYTE(v45) < 0) {
    operator delete((void *)__p);
  }
}

id __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_635(uint64_t a1)
{
  if ([*(id *)(a1 + 32) dumpInstructions])
  {
    snprintf(__str, 0x80uLL, "/tmp/com.apple.gputools.profiling/shaderProfilerResults/uscSamplingProcessedSample_%d.txt", *(_DWORD *)(a1 + 104));
    uint64_t v76 = fopen(__str, "wt");
  }
  else
  {
    uint64_t v76 = 0;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 108);
  if (v2 < *(_DWORD *)(a1 + 112))
  {
    while (1)
    {
      uint64_t v3 = *(void *)(a1 + 72);
      uint64_t v4 = v2;
      if (!*(unsigned char *)(a1 + 128)) {
        break;
      }
      if (*(__int16 *)(v3 + 8 * v2 + 6) == -275)
      {
        uint64_t v5 = 0;
        unsigned int v6 = *(_DWORD *)(a1 + 116);
        do
        {
          *(void *)&__str[8 * v5] = *(void *)(v3 + 8 * ((v2 + v5) % v6));
          ++v5;
        }
        while (v5 != 3);
        unsigned int v80 = v86;
        unsigned int v7 = ((*(_DWORD *)__str >> 4) & 7) + v2;
        LODWORD(v8) = (*(_DWORD *)__str >> 7) & 0x7F;
        unsigned int v2 = v7 + v8;
        uint64_t v79 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }
LABEL_79:
      if (++v2 >= *(_DWORD *)(a1 + 112)) {
        goto LABEL_80;
      }
    }
    unint64_t v9 = *(void *)(v3 + 8 * v2);
    if (v9 == -1)
    {
      unsigned int v80 = -1;
      unint64_t v10 = *(void *)(v3 + 8 * v2);
    }
    else
    {
      unsigned int v11 = v2;
      uint64_t v12 = *(void *)(a1 + 80);
      *(_DWORD *)__str = *(void *)(v3 + 8 * v2);
      unsigned int v80 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v12, v9, __str)+ 5);
      unint64_t v10 = *(void *)(v3 + 8 * v4);
      unsigned int v2 = v11;
    }
    unsigned int v7 = v2 + 1;
    uint64_t v8 = (v9 >> 30) & 0x1FC;
    uint64_t v79 = v10 >> 39;
    v2 += v8;
LABEL_14:
    if ((v8 & 3) == 0 && v8 >= 4)
    {
      unsigned int v75 = v2;
      int v13 = 0;
      unsigned int v14 = v8 >> 2;
      unsigned int v77 = v8 >> 2;
      unsigned int v78 = v7;
      do
      {
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        unsigned int v17 = *(_DWORD *)(a1 + 116);
        uint64_t v18 = *(void *)(a1 + 72);
        do
        {
          uint64_t v19 = v18 + 8 * (((v7 + 4 * v13) % v17 + v16) % v17);
          unsigned int v20 = &__str[v15];
          *(_DWORD *)unsigned int v20 = *(void *)v19;
          *((_DWORD *)v20 + 1) = *(_DWORD *)(v19 + 4);
          ++v16;
          v15 += 8;
        }
        while (v15 != 32);
        if ((__str[0] & 0xF) == 1)
        {
          v82 = 0;
          uint64_t v83 = 0;
          uint64_t v84 = 0;
          [*(id *)(a1 + 32) _processTracePackets:__str forRenderIndex:v80 andGenerateSampleList:&v82 forTargetIndex:*(unsigned int *)(a1 + 120) forLimiterIndex:v79];
          if ([*(id *)(a1 + 32) dumpInstructions])
          {
            float v21 = *(void **)(a1 + 32);
            uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
            ++*(_DWORD *)(v22 + 4 * *(unsigned int *)(a1 + 104));
            [v21 _dumpTraceBufferPacketsInFile:v76 usingTracePackets:__str withExtractedSamples:&v82 withTraceBufferCount:forTargetIndex:];
            unint64_t v24 = v82;
            BOOL v23 = v83;
            uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
            *(_DWORD *)(v25 + 4 * *(unsigned int *)(a1 + 104)) -= 858993459
                                                                  * ((unint64_t)((char *)v83 - (char *)v82) >> 3);
          }
          else
          {
            unint64_t v24 = v82;
            BOOL v23 = v83;
          }
          if (v24 != v23)
          {
            do
            {
              unsigned int v26 = *(_DWORD *)v24;
              if (*(_DWORD *)v24 != -1 || *((_DWORD *)v24 + 3) == -1)
              {
                unsigned int v28 = *(_DWORD *)(a1 + 124);
                BOOL v29 = v26 >= v28;
                unint64_t v30 = v26 - v28;
                if (v29 && *(void *)(a1 + 88) > v30)
                {
                  unsigned int v31 = *(_DWORD *)(**(void **)(a1 + 96) + 4 * v30);
                  unsigned int v81 = v31;
                  if (v31 != -1)
                  {
                    if (*(unsigned char *)(a1 + 128))
                    {
                      unsigned int v31 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(*(void *)(a1 + 80), v31, &v81)+ 5);
                      unsigned int v28 = *(_DWORD *)(a1 + 124);
                    }
                    BOOL v29 = v31 >= v28;
                    unint64_t v32 = v31 - v28;
                    if (v29 && *(void *)(a1 + 88) > v32)
                    {
                      unint64_t v33 = (unint64_t *)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48)
                                               + 24 * *(unsigned int *)(a1 + 104));
                      uint64_t v35 = (void **)(v33 + 1);
                      unint64_t v34 = v33[1];
                      unint64_t v37 = v33 + 2;
                      unint64_t v36 = v33[2];
                      if (v34 >= v36)
                      {
                        unint64_t v61 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v34 - *v33) >> 3);
                        unint64_t v62 = v61 + 1;
                        if (v61 + 1 > 0x666666666666666) {
                          abort();
                        }
                        unint64_t v63 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v36 - *v33) >> 3);
                        if (2 * v63 > v62) {
                          unint64_t v62 = 2 * v63;
                        }
                        if (v63 >= 0x333333333333333) {
                          unint64_t v64 = 0x666666666666666;
                        }
                        else {
                          unint64_t v64 = v62;
                        }
                        if (v64) {
                          unint64_t v64 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v64);
                        }
                        else {
                          uint64_t v65 = 0;
                        }
                        unint64_t v66 = v64 + 40 * v61;
                        long long v67 = *v24;
                        long long v68 = v24[1];
                        *(void *)(v66 + 32) = *((void *)v24 + 4);
                        *(_OWORD *)unint64_t v66 = v67;
                        *(_OWORD *)(v66 + 16) = v68;
                        v69 = (char *)*v35;
                        v70 = (char *)*v33;
                        unint64_t v71 = v66;
                        if (*v35 != (void *)*v33)
                        {
                          do
                          {
                            long long v72 = *(_OWORD *)(v69 - 40);
                            long long v73 = *(_OWORD *)(v69 - 24);
                            *(void *)(v71 - 8) = *((void *)v69 - 1);
                            *(_OWORD *)(v71 - 24) = v73;
                            *(_OWORD *)(v71 - 40) = v72;
                            v71 -= 40;
                            v69 -= 40;
                          }
                          while (v69 != v70);
                          v69 = (char *)*v33;
                        }
                        *unint64_t v33 = v71;
                        uint64_t v40 = (void *)(v66 + 40);
                        *uint64_t v35 = (void *)(v66 + 40);
                        void *v37 = v64 + 40 * v65;
                        if (v69) {
                          operator delete(v69);
                        }
                      }
                      else
                      {
                        long long v38 = *v24;
                        long long v39 = v24[1];
                        *(void *)(v34 + 32) = *((void *)v24 + 4);
                        *(_OWORD *)unint64_t v34 = v38;
                        *(_OWORD *)(v34 + 16) = v39;
                        uint64_t v40 = (void *)(v34 + 40);
                      }
                      *uint64_t v35 = v40;
                    }
                  }
                }
              }
              else
              {
                unint64_t v41 = *(void **)(*(void *)(a1 + 56) + 8);
                unint64_t v42 = v41[7];
                unint64_t v43 = v41[8];
                if (v42 >= v43)
                {
                  uint64_t v47 = v41[6];
                  unint64_t v48 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v42 - v47) >> 3);
                  unint64_t v49 = v48 + 1;
                  if (v48 + 1 > 0x666666666666666) {
                    abort();
                  }
                  unint64_t v50 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v43 - v47) >> 3);
                  if (2 * v50 > v49) {
                    unint64_t v49 = 2 * v50;
                  }
                  if (v50 >= 0x333333333333333) {
                    unint64_t v51 = 0x666666666666666;
                  }
                  else {
                    unint64_t v51 = v49;
                  }
                  if (v51) {
                    unint64_t v51 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v51);
                  }
                  else {
                    uint64_t v52 = 0;
                  }
                  unint64_t v53 = v51 + 40 * v48;
                  long long v54 = *v24;
                  long long v55 = v24[1];
                  *(void *)(v53 + 32) = *((void *)v24 + 4);
                  *(_OWORD *)unint64_t v53 = v54;
                  *(_OWORD *)(v53 + 16) = v55;
                  v57 = (char *)v41[6];
                  v56 = (char *)v41[7];
                  unint64_t v58 = v53;
                  if (v56 != v57)
                  {
                    do
                    {
                      long long v59 = *(_OWORD *)(v56 - 40);
                      long long v60 = *(_OWORD *)(v56 - 24);
                      *(void *)(v58 - 8) = *((void *)v56 - 1);
                      *(_OWORD *)(v58 - 24) = v60;
                      *(_OWORD *)(v58 - 40) = v59;
                      v58 -= 40;
                      v56 -= 40;
                    }
                    while (v56 != v57);
                    v56 = (char *)v41[6];
                  }
                  unint64_t v46 = v53 + 40;
                  v41[6] = v58;
                  v41[7] = v53 + 40;
                  v41[8] = v51 + 40 * v52;
                  if (v56) {
                    operator delete(v56);
                  }
                }
                else
                {
                  long long v44 = *v24;
                  long long v45 = v24[1];
                  *(void *)(v42 + 32) = *((void *)v24 + 4);
                  *(_OWORD *)unint64_t v42 = v44;
                  *(_OWORD *)(v42 + 16) = v45;
                  unint64_t v46 = v42 + 40;
                }
                v41[7] = v46;
              }
              unint64_t v24 = (_OWORD *)((char *)v24 + 40);
            }
            while (v24 != v23);
            BOOL v23 = v82;
          }
          if (v23)
          {
            uint64_t v83 = v23;
            operator delete(v23);
          }
          unsigned int v14 = v77;
          unsigned int v7 = v78;
        }
        ++v13;
      }
      while (v13 != v14);
      unsigned int v2 = v75;
    }
    goto LABEL_79;
  }
LABEL_80:
  id result = [*(id *)(a1 + 32) dumpInstructions];
  if (result) {
    return (id)fclose(v76);
  }
  return result;
}

void __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_652(uint64_t a1)
{
  uint64_t v2 = a1;
  uint64_t v319 = 0;
  memset(v318, 0, sizeof(v318));
  unint64_t v4 = *(unsigned int *)(a1 + 200);
  unint64_t v3 = *(unsigned int *)(a1 + 204);
  if (v4 >= v3) {
    goto LABEL_230;
  }
  unint64_t v281 = (id *)(a1 + 120);
  do
  {
    unint64_t v279 = v4;
    uint64_t v5 = (unint64_t *)(**(void **)(v2 + 112) + 24 * *(void *)(*(void *)(v2 + 88) + 8 * v4));
    unint64_t v1 = *v5;
    unint64_t v282 = v5[1];
    uint64_t v283 = *(void *)(*(void *)(v2 + 88) + 8 * v4);
    if (*v5 == v282) {
      goto LABEL_229;
    }
    do
    {
      unsigned int v6 = *(unsigned __int8 **)v1;
      unsigned int v7 = *(_DWORD *)(*(void *)v1 + 4) % *(_DWORD *)(v2 + 208);
      unsigned int v317 = v7;
      unint64_t v8 = *v6;
      if (v8 == 98)
      {
        unint64_t v8 = v6[40];
        unint64_t v9 = *((void *)v6 + 4);
      }
      else
      {
        unint64_t v9 = -1;
      }
      unint64_t v10 = *(int8x8_t **)(*(void *)(v2 + 40) + 8);
      int8x8_t v11 = v10[7];
      if (v11)
      {
        uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
        v12.i16[0] = vaddlv_u8(v12);
        if (v12.u32[0] > 1uLL)
        {
          unint64_t v13 = v9;
          if (v9 >= *(void *)&v11) {
            unint64_t v13 = v9 % *(void *)&v11;
          }
        }
        else
        {
          unint64_t v13 = (*(void *)&v11 - 1) & v9;
        }
        unsigned int v14 = *(void **)(*(void *)&v10[6] + 8 * v13);
        if (v14)
        {
          for (uint64_t i = (void *)*v14; i; uint64_t i = (void *)*i)
          {
            unint64_t v16 = i[1];
            if (v16 == v9)
            {
              if (i[2] == v9)
              {
                uint64_t v162 = (id *)(i + 3);
                goto LABEL_25;
              }
            }
            else
            {
              if (v12.u32[0] > 1uLL)
              {
                if (v16 >= *(void *)&v11) {
                  v16 %= *(void *)&v11;
                }
              }
              else
              {
                v16 &= *(void *)&v11 - 1;
              }
              if (v16 != v13) {
                break;
              }
            }
          }
        }
      }
      uint64_t v162 = v281;
      if (v8 <= 5) {
        uint64_t v162 = (id *)(*(void *)(*(void *)(v2 + 152) + 24 * v7) + 32 * v8);
      }
LABEL_25:
      int v286 = v8;
      v288 = v162;
      uint64_t v292 = (uint64_t)(v162 + 1);
      id v305 = *v162;
      unsigned int v17 = [v305 binary];

      if (v17)
      {
        uint64_t v294 = std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]((void *)(*(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 48)+ 40 * *(unsigned int *)(v2 + 212)), v292);
        if (!v294) {
          operator new();
        }
      }
      else
      {
        uint64_t v294 = 0;
      }
      unint64_t v303 = v1;
      uint64_t v18 = *(void *)v1;
      HIDWORD(v318[0]) = *(void *)(*(void *)v1 + 8);
      uint64_t v19 = (char **)(*(void *)(v2 + 176) + 24 * v283);
      float v21 = *v19;
      unsigned int v20 = v19[1];
      uint64_t v22 = v20 - *v19;
      if (v22)
      {
        unint64_t v23 = 0xCCCCCCCCCCCCCCCDLL * (v22 >> 3);
        v300 = v21;
        do
        {
          uint64_t v24 = (uint64_t)&v21[40 * (v23 >> 1)];
          BOOL v25 = USCSampleComparator::operator()(v24, (uint64_t)v318);
          if (v25) {
            v23 += ~(v23 >> 1);
          }
          else {
            v23 >>= 1;
          }
          if (v25) {
            float v21 = (char *)(v24 + 40);
          }
        }
        while (v23);
        unsigned int v26 = v300;
        if (v20 != v21)
        {
          HIDWORD(v318[0]) = *(void *)(v18 + 16);
          if (v20 != v300)
          {
            unint64_t v27 = 0xCCCCCCCCCCCCCCCDLL * ((v20 - v300) >> 3);
            do
            {
              if (USCSampleComparator::operator()((uint64_t)v318, (uint64_t)&v26[40 * (v27 >> 1)]))
              {
                v27 >>= 1;
              }
              else
              {
                v26 += 40 * (v27 >> 1) + 40;
                v27 += ~(v27 >> 1);
              }
            }
            while (v27);
          }
          if (v21 != v26)
          {
            uint64_t v301 = v26;
            while (1)
            {
              unsigned int v28 = [v305 binary];

              if (!v28)
              {
                unint64_t v46 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(1uLL);
                *(_DWORD *)unint64_t v46 = *((_DWORD *)v21 + 3);
                *(void *)(v46 + 4) = 1;
                *((_DWORD *)v46 + 3) = 0;
                v307 = (unsigned int *)v46;
                uint64_t v47 = (uint64_t)(v46 + 16);
                int v48 = 1;
                goto LABEL_171;
              }
              uint64_t TargetClauseAnalysis = GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(**((GPUToolsPlatformLLVMShaderProfilerHelperImpl ***)v294 + 5));
              unint64_t v30 = *(uint64_t **)TargetClauseAnalysis;
              unsigned int v31 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((void *)(*(void *)TargetClauseAnalysis + 56), (*((_DWORD *)v21 + 3) - *(_DWORD *)(*(void *)v303 + 8)));
              unint64_t v32 = v301;
              if (v31)
              {
                unsigned int v33 = *((_DWORD *)v31 + 6);
                if (v33 != -1) {
                  break;
                }
              }
LABEL_226:
              v21 += 40;
              if (v21 == v32) {
                goto LABEL_227;
              }
            }
            uint64_t v34 = *(void *)(v30[3] + 48 * v33 + 8 * *((unsigned int *)v21 + 8));
            uint64_t v35 = *v30;
            uint64_t v36 = *v30 + 88 * v34 + 24;
            unsigned int v37 = v317;
            long long v38 = std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v36, v317, &v317);
            int v39 = *((_DWORD *)v38 + 7) + *((_DWORD *)v21 + 2);
            ++*((_DWORD *)v38 + 6);
            *((_DWORD *)v38 + 7) = v39;
            uint64_t v40 = std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v36, v37, &v317);
            unint64_t v41 = v40;
            uint64_t v42 = ((*(void *)(*(void *)(*(void *)(*(void *)(v2 + 56) + 8) + 48)
                                            + 24 * *(unsigned int *)(v2 + 212)
                                            + 8)
                                - *(void *)(*(void *)(*(void *)(*(void *)(v2 + 56) + 8) + 48)
                                            + 24 * *(unsigned int *)(v2 + 212))) >> 5);
            long long v44 = (char *)*((void *)v40 + 5);
            unint64_t v43 = *((void *)v40 + 6);
            if ((unint64_t)v44 >= v43)
            {
              unint64_t v49 = (char *)*((void *)v40 + 4);
              uint64_t v50 = (v44 - v49) >> 3;
              unint64_t v51 = v50 + 1;
              if ((unint64_t)(v50 + 1) >> 61) {
                abort();
              }
              uint64_t v52 = v43 - (void)v49;
              if (v52 >> 2 > v51) {
                unint64_t v51 = v52 >> 2;
              }
              BOOL v53 = (unint64_t)v52 >= 0x7FFFFFFFFFFFFFF8;
              unint64_t v54 = 0x1FFFFFFFFFFFFFFFLL;
              if (!v53) {
                unint64_t v54 = v51;
              }
              if (v54)
              {
                unint64_t v54 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v54);
                unint64_t v49 = (char *)*((void *)v41 + 4);
                long long v44 = (char *)*((void *)v41 + 5);
              }
              else
              {
                uint64_t v55 = 0;
              }
              v56 = (void *)(v54 + 8 * v50);
              void *v56 = v42;
              long long v45 = v56 + 1;
              while (v44 != v49)
              {
                uint64_t v57 = *((void *)v44 - 1);
                v44 -= 8;
                *--v56 = v57;
              }
              *((void *)v41 + 4) = v56;
              *((void *)v41 + 5) = v45;
              *((void *)v41 + 6) = v54 + 8 * v55;
              if (v49) {
                operator delete(v49);
              }
            }
            else
            {
              *(void *)long long v44 = v42;
              long long v45 = v44 + 8;
            }
            *((void *)v41 + 5) = v45;
            uint64_t v58 = **(void **)TargetClauseAnalysis
                + 88
                * *(void *)(*(void *)(*(void *)TargetClauseAnalysis + 24)
                            + 48 * v33
                            + 8 * *((unsigned int *)v21 + 8));
            long long v60 = *(unsigned char **)(v58 + 64);
            long long v59 = *(unsigned char **)(v58 + 72);
            size_t v61 = v59 - v60;
            uint64_t v62 = (v59 - v60) >> 4;
            uint64_t v296 = v35;
            if (v59 == v60)
            {
              v307 = 0;
              int v48 = 0;
              uint64_t v47 = 16 * v62;
            }
            else
            {
              if ((v61 & 0x8000000000000000) != 0) {
                abort();
              }
              unint64_t v63 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>((v59 - v60) >> 4);
              memmove(v63, v60, v61);
              uint64_t v64 = 0;
              int v48 = 0;
              uint64_t v47 = (uint64_t)&v63[16 * v62];
              do
              {
                v48 += *(_DWORD *)&v63[v64 + 4];
                v64 += 16;
              }
              while (16 * v62 != v64);
              v307 = (unsigned int *)v63;
            }
            if (![*(id *)(v2 + 32) dumpInstructions])
            {
LABEL_171:
              if ([*(id *)(v2 + 32) dumpInstructions])
              {
                uint64_t v113 = v317;
                uint64_t v114 = *(void *)(*(void *)(*(void *)(*(void *)(v2 + 72) + 8) + 48)
                                 + 24 * *(unsigned int *)(v2 + 212));
                *(_DWORD *)(v114 + 8 * v317) += *((_DWORD *)v21 + 2);
                *(_DWORD *)(*(void *)(*(void *)(*(void *)(*(void *)(v2 + 72) + 8) + 48)
                                      + 24 * *(unsigned int *)(v2 + 212))
                          + 8 * v113
                          + 4) = v113;
              }
              unsigned int v298 = [*(id *)(v2 + 32) _computeSampleNormFactorForSample:v21 forProgramStartAddress:*(void *)(*(void *)v303 + 8) forProgramEndAddress:*(void *)(*(void *)v303 + 16)];
              unint64_t v115 = (char **)(*(void *)(*(void *)(*(void *)(v2 + 56) + 8) + 48)
                             + 24 * *(unsigned int *)(v2 + 212));
              v117 = v115 + 1;
              long long v116 = v115[1];
              unint64_t v119 = v115 + 2;
              unint64_t v118 = (unint64_t)v115[2];
              if ((unint64_t)v116 < v118)
              {
                *(void *)long long v116 = v305;
                *((void *)v116 + 1) = 0;
                *((void *)v116 + 2) = 0;
                *((void *)v116 + 3) = 0;
                v120 = v116 + 32;
                unint64_t *v117 = v116 + 32;
LABEL_196:
                unint64_t *v117 = v120;
                uint64_t v133 = *(void *)(*(void *)(*(void *)(*(void *)(v2 + 56) + 8) + 48)
                                 + 24 * *(unsigned int *)(v2 + 212)
                                 + 8);
                uint64_t v134 = v47 - (void)v307;
                uint64_t v135 = *(void *)(v133 - 24);
                if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(v133 - 8) - v135) >> 2) < (v47 - (uint64_t)v307) >> 4)
                {
                  if (v134 < 0) {
                    abort();
                  }
                  uint64_t v136 = *(void *)(v133 - 16);
                  unint64_t v137 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<DYMTLShaderProfilerProcessedUSCSample>>(v134 >> 4);
                  uint64_t v140 = *(char **)(v133 - 24);
                  v139 = *(char **)(v133 - 16);
                  v141 = &v137[20 * ((v136 - v135) / 20)];
                  if (v139 != v140)
                  {
                    do
                    {
                      long long v142 = *(_OWORD *)(v139 - 20);
                      *((_DWORD *)v141 - 1) = *((_DWORD *)v139 - 1);
                      *(_OWORD *)(v141 - 20) = v142;
                      v141 -= 20;
                      v139 -= 20;
                    }
                    while (v139 != v140);
                    v139 = *(char **)(v133 - 24);
                  }
                  *(void *)(v133 - 24) = v141;
                  *(void *)(v133 - 16) = &v137[20 * ((v136 - v135) / 20)];
                  *(void *)(v133 - 8) = &v137[20 * v138];
                  if (v139) {
                    operator delete(v139);
                  }
                }
                if (v307 != (unsigned int *)v47)
                {
                  int v143 = v48 * v298;
                  unsigned int v144 = v317;
                  v145 = v307;
                  do
                  {
                    int v146 = v145[1] * *((_DWORD *)v21 + 2);
                    if (v146)
                    {
                      unsigned int v147 = *v145;
                      size_t v148 = *(unsigned int **)(v133 - 16);
                      unint64_t v149 = *(void *)(v133 - 8);
                      if ((unint64_t)v148 >= v149)
                      {
                        uint64_t v151 = *(void *)(v133 - 24);
                        unint64_t v152 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v148 - v151) >> 2);
                        unint64_t v153 = v152 + 1;
                        if (v152 + 1 > 0xCCCCCCCCCCCCCCCLL) {
                          abort();
                        }
                        unint64_t v154 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v149 - v151) >> 2);
                        if (2 * v154 > v153) {
                          unint64_t v153 = 2 * v154;
                        }
                        if (v154 >= 0x666666666666666) {
                          unint64_t v155 = 0xCCCCCCCCCCCCCCCLL;
                        }
                        else {
                          unint64_t v155 = v153;
                        }
                        if (v155) {
                          unint64_t v155 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<DYMTLShaderProfilerProcessedUSCSample>>(v155);
                        }
                        else {
                          uint64_t v156 = 0;
                        }
                        uint64_t v157 = (unsigned int *)(v155 + 20 * v152);
                        *uint64_t v157 = v144;
                        v157[1] = v146;
                        v157[2] = v147;
                        v157[3] = v146;
                        v157[4] = v143;
                        v159 = *(char **)(v133 - 24);
                        uint64_t v158 = *(char **)(v133 - 16);
                        unint64_t v160 = v157;
                        if (v158 != v159)
                        {
                          do
                          {
                            long long v161 = *(_OWORD *)(v158 - 20);
                            *(v160 - 1) = *((_DWORD *)v158 - 1);
                            *(_OWORD *)(v160 - 5) = v161;
                            v160 -= 5;
                            v158 -= 20;
                          }
                          while (v158 != v159);
                          uint64_t v158 = *(char **)(v133 - 24);
                        }
                        int v150 = v157 + 5;
                        *(void *)(v133 - 24) = v160;
                        *(void *)(v133 - 16) = v157 + 5;
                        *(void *)(v133 - 8) = v155 + 20 * v156;
                        if (v158) {
                          operator delete(v158);
                        }
                      }
                      else
                      {
                        *size_t v148 = v144;
                        v148[1] = v146;
                        v148[2] = v147;
                        v148[3] = v146;
                        int v150 = v148 + 5;
                        v148[4] = v143;
                      }
                      *(void *)(v133 - 16) = v150;
                    }
                    v145 += 4;
                  }
                  while (v145 != (unsigned int *)v47);
                }
                uint64_t v2 = a1;
                unint64_t v32 = v301;
                if (v307) {
                  operator delete(v307);
                }
                goto LABEL_226;
              }
              uint64_t v121 = (v116 - *v115) >> 5;
              if ((unint64_t)(v121 + 1) >> 59) {
                abort();
              }
              uint64_t v122 = v118 - (void)*v115;
              uint64_t v123 = v122 >> 4;
              if (v122 >> 4 <= (unint64_t)(v121 + 1)) {
                uint64_t v123 = v121 + 1;
              }
              if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v124 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v124 = v123;
              }
              if (v124)
              {
                if (v124 >> 59) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                v125 = (char *)operator new(32 * v124);
              }
              else
              {
                v125 = 0;
              }
              uint64_t v126 = &v125[32 * v121];
              v127 = &v125[32 * v124];
              *(void *)uint64_t v126 = v305;
              *((void *)v126 + 1) = 0;
              *((void *)v126 + 2) = 0;
              *((void *)v126 + 3) = 0;
              v120 = v126 + 32;
              uint64_t v128 = *v117;
              v129 = *v115;
              if (*v117 == *v115)
              {
                *unint64_t v115 = v126;
                unint64_t *v117 = v120;
                *unint64_t v119 = v127;
              }
              else
              {
                v130 = v127;
                do
                {
                  uint64_t v131 = *((void *)v128 - 4);
                  v128 -= 32;
                  *(void *)uint64_t v128 = 0;
                  *((void *)v126 - 4) = v131;
                  v126 -= 32;
                  *((void *)v126 + 2) = 0;
                  *((void *)v126 + 3) = 0;
                  *((void *)v126 + 1) = 0;
                  *(_OWORD *)(v126 + 8) = *(_OWORD *)(v128 + 8);
                  *((void *)v126 + 3) = *((void *)v128 + 3);
                  *((void *)v128 + 1) = 0;
                  *((void *)v128 + 2) = 0;
                  *((void *)v128 + 3) = 0;
                }
                while (v128 != v129);
                v132 = *v115;
                uint64_t v128 = *v117;
                *unint64_t v115 = v126;
                unint64_t *v117 = v120;
                *unint64_t v119 = v130;
                if (v128 != v132)
                {
                  uint64_t v2 = a1;
                  do
                  {
                    v128 -= 32;
                    std::allocator<InstructionPCInfo>::destroy[abi:nn180100]((uint64_t)v128);
                  }
                  while (v128 != v132);
                  uint64_t v128 = v132;
LABEL_194:
                  if (v128) {
                    operator delete(v128);
                  }
                  goto LABEL_196;
                }
              }
              uint64_t v2 = a1;
              goto LABEL_194;
            }
            uint64_t v285 = v34;
            uint64_t v65 = *(void *)(*(void *)(*(void *)(v2 + 64) + 8) + 48) + 40 * *(unsigned int *)(v2 + 212);
            unint64_t v66 = (char *)std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]((void *)v65, v292);
            if (!v66)
            {
              long long v310 = 0u;
              long long v311 = 0u;
              int v312 = 1065353216;
              if (*((char *)v288 + 31) < 0)
              {
                std::string::__init_copy_ctor_external(&v313, (const std::string::value_type *)v288[1], (std::string::size_type)v288[2]);
                unint64_t v69 = *((void *)&v310 + 1);
                uint64_t v70 = v310;
                uint64_t v67 = *((void *)&v311 + 1);
                uint64_t v68 = v311;
                int v72 = v312;
              }
              else
              {
                uint64_t v67 = 0;
                uint64_t v68 = 0;
                unint64_t v69 = 0;
                uint64_t v70 = 0;
                long long v71 = *(_OWORD *)v292;
                v313.__r_.__value_.__r.__words[2] = *(void *)(v292 + 16);
                *(_OWORD *)&v313.__r_.__value_.__l.__data_ = v71;
                int v72 = 1065353216;
              }
              long long v310 = 0uLL;
              v314[0] = v70;
              v314[1] = v69;
              v315[0] = v68;
              v315[1] = v67;
              int v316 = v72;
              if (v67)
              {
                unint64_t v73 = *(void *)(v68 + 8);
                if ((v69 & (v69 - 1)) != 0)
                {
                  if (v73 >= v69) {
                    v73 %= v69;
                  }
                }
                else
                {
                  v73 &= v69 - 1;
                }
                *(void *)(v70 + 8 * v73) = v315;
                long long v311 = 0uLL;
              }
              if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v74 = &v313;
              }
              else {
                uint64_t v74 = (std::string *)v313.__r_.__value_.__r.__words[0];
              }
              if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type size = HIBYTE(v313.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type size = v313.__r_.__value_.__l.__size_;
              }
              unint64_t v76 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v74, size);
              unint64_t v77 = v76;
              unint64_t v78 = *(void *)(v65 + 8);
              if (v78)
              {
                uint8x8_t v79 = (uint8x8_t)vcnt_s8((int8x8_t)v78);
                v79.i16[0] = vaddlv_u8(v79);
                unint64_t v80 = v79.u32[0];
                if (v79.u32[0] > 1uLL)
                {
                  unint64_t v81 = v76;
                  if (v76 >= v78) {
                    unint64_t v81 = v76 % v78;
                  }
                }
                else
                {
                  unint64_t v81 = (v78 - 1) & v76;
                }
                uint64_t v290 = v81;
                v82 = *(void ***)(*(void *)v65 + 8 * v81);
                if (v82)
                {
                  unint64_t v66 = (char *)*v82;
                  if (*v82)
                  {
                    do
                    {
                      unint64_t v83 = *((void *)v66 + 1);
                      if (v83 == v77)
                      {
                        if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v66 + 16, (unsigned __int8 *)&v313))
                        {
                          goto LABEL_127;
                        }
                      }
                      else
                      {
                        if (v80 > 1)
                        {
                          if (v83 >= v78) {
                            v83 %= v78;
                          }
                        }
                        else
                        {
                          v83 &= v78 - 1;
                        }
                        if (v83 != v290) {
                          break;
                        }
                      }
                      unint64_t v66 = *(char **)v66;
                    }
                    while (v66);
                  }
                }
              }
              unint64_t v66 = (char *)operator new(0x50uLL);
              v320[0] = v66;
              v320[1] = v65 + 16;
              *(void *)unint64_t v66 = 0;
              *((void *)v66 + 1) = v77;
              *(std::string *)(v66 + 16) = v313;
              memset(&v313, 0, sizeof(v313));
              std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)(v66 + 40), v314);
              char v321 = 1;
              float v84 = (float)(unint64_t)(*(void *)(v65 + 24) + 1);
              float v85 = *(float *)(v65 + 32);
              if (!v78 || (float)(v85 * (float)v78) < v84)
              {
                BOOL v86 = (v78 & (v78 - 1)) != 0;
                if (v78 < 3) {
                  BOOL v86 = 1;
                }
                unint64_t v87 = v86 | (2 * v78);
                unint64_t v88 = vcvtps_u32_f32(v84 / v85);
                if (v87 <= v88) {
                  size_t v89 = v88;
                }
                else {
                  size_t v89 = v87;
                }
                std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(v65, v89);
                unint64_t v78 = *(void *)(v65 + 8);
                if ((v78 & (v78 - 1)) == 0)
                {
                  uint64_t v90 = (v78 - 1) & v77;
                  goto LABEL_116;
                }
                if (v77 >= v78)
                {
                  uint64_t v90 = v77 % v78;
LABEL_116:
                  uint64_t v290 = v90;
                }
                else
                {
                  uint64_t v290 = v77;
                }
              }
              v91 = *(void **)(*(void *)v65 + 8 * v290);
              if (v91)
              {
                *(void *)unint64_t v66 = *v91;
                goto LABEL_125;
              }
              *(void *)unint64_t v66 = *(void *)(v65 + 16);
              *(void *)(v65 + 16) = v66;
              *(void *)(*(void *)v65 + 8 * v290) = v65 + 16;
              if (*(void *)v66)
              {
                unint64_t v92 = *(void *)(*(void *)v66 + 8);
                if ((v78 & (v78 - 1)) != 0)
                {
                  if (v92 >= v78) {
                    v92 %= v78;
                  }
                }
                else
                {
                  v92 &= v78 - 1;
                }
                v91 = (void *)(*(void *)v65 + 8 * v92);
LABEL_125:
                void *v91 = v66;
              }
              v320[0] = 0;
              ++*(void *)(v65 + 24);
              std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,void *>>>>::reset[abi:nn180100]((uint64_t)v320);
LABEL_127:
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v314);
              uint64_t v2 = a1;
              if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v313.__r_.__value_.__l.__data_);
              }
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v310);
            }
            unint64_t v93 = (unint64_t)(v66 + 40);
            unint64_t v94 = *v307;
            int64x2_t v95 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((void *)v66 + 5, *v307);
            if (v95)
            {
              int v96 = *((_DWORD *)v95 + 7);
              ++*((_DWORD *)v95 + 6);
              *((_DWORD *)v95 + 7) = v96 + *((_DWORD *)v21 + 2);
              *((_DWORD *)v95 + 11) += *((_DWORD *)v21 + 9);
              goto LABEL_171;
            }
            uint64_t v290 = (uint64_t)(v66 + 40);
            int v280 = *(_DWORD *)(v296 + 88 * v285 + 8);
            int v297 = *((_DWORD *)v21 + 2);
            unint64_t v97 = *((void *)v66 + 6);
            if (v97)
            {
              uint8x8_t v98 = (uint8x8_t)vcnt_s8((int8x8_t)v97);
              v98.i16[0] = vaddlv_u8(v98);
              if (v98.u32[0] > 1uLL)
              {
                unint64_t v99 = v94;
                if (v97 <= v94) {
                  unint64_t v99 = v94 % v97;
                }
              }
              else
              {
                unint64_t v99 = (v97 - 1) & v94;
              }
              unint64_t v93 = v99;
              v100 = *(uint64_t ***)(*(void *)v290 + 8 * v99);
              if (v100)
              {
                for (uint64_t j = *v100; j; uint64_t j = (uint64_t *)*j)
                {
                  unint64_t v102 = j[1];
                  if (v102 == v94)
                  {
                    if (*((_DWORD *)j + 4) == v94) {
                      goto LABEL_170;
                    }
                  }
                  else
                  {
                    if (v98.u32[0] > 1uLL)
                    {
                      if (v102 >= v97) {
                        v102 %= v97;
                      }
                    }
                    else
                    {
                      v102 &= v97 - 1;
                    }
                    if (v102 != v99) {
                      break;
                    }
                  }
                }
              }
            }
            v103 = operator new(0x30uLL);
            void *v103 = 0;
            v103[1] = v94;
            *((_DWORD *)v103 + 4) = v94;
            *((_DWORD *)v103 + 5) = v94;
            *((_DWORD *)v103 + 6) = 1;
            *((_DWORD *)v103 + 7) = v297;
            *((_DWORD *)v103 + 8) = v61 >> 4;
            *((_DWORD *)v103 + 9) = v280;
            *((_DWORD *)v103 + 10) = v286;
            *((_DWORD *)v103 + 11) = v297 == 0;
            float v104 = (float)(unint64_t)(*((void *)v66 + 8) + 1);
            float v105 = *((float *)v66 + 18);
            if (!v97 || (float)(v105 * (float)v97) < v104)
            {
              BOOL v106 = (v97 & (v97 - 1)) != 0;
              if (v97 < 3) {
                BOOL v106 = 1;
              }
              unint64_t v107 = v106 | (2 * v97);
              unint64_t v108 = vcvtps_u32_f32(v104 / v105);
              if (v107 <= v108) {
                size_t v109 = v108;
              }
              else {
                size_t v109 = v107;
              }
              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(v290, v109);
              unint64_t v97 = *((void *)v66 + 6);
              if ((v97 & (v97 - 1)) != 0)
              {
                if (v97 <= v94) {
                  unint64_t v93 = v94 % v97;
                }
                else {
                  unint64_t v93 = v94;
                }
              }
              else
              {
                unint64_t v93 = (v97 - 1) & v94;
              }
            }
            uint64_t v110 = *(void *)v290;
            unint64_t v111 = *(void **)(*(void *)v290 + 8 * v93);
            if (v111)
            {
              void *v103 = *v111;
            }
            else
            {
              void *v103 = *((void *)v66 + 7);
              *((void *)v66 + 7) = v103;
              *(void *)(v110 + 8 * v93) = v66 + 56;
              if (!*v103) {
                goto LABEL_169;
              }
              unint64_t v112 = *(void *)(*v103 + 8);
              if ((v97 & (v97 - 1)) != 0)
              {
                if (v112 >= v97) {
                  v112 %= v97;
                }
              }
              else
              {
                v112 &= v97 - 1;
              }
              unint64_t v111 = (void *)(*(void *)v290 + 8 * v112);
            }
            *unint64_t v111 = v103;
LABEL_169:
            ++*((void *)v66 + 8);
LABEL_170:
            uint64_t v2 = a1;
            goto LABEL_171;
          }
        }
      }
LABEL_227:

      unint64_t v1 = v303 + 8;
    }
    while (v303 + 8 != v282);
    unint64_t v3 = *(unsigned int *)(v2 + 204);
LABEL_229:
    unint64_t v4 = v279 + 1;
  }
  while (v279 + 1 < v3);
LABEL_230:
  if (!*(unsigned char *)(*(void *)(v2 + 32) + 8))
  {
    unint64_t v163 = *(uint64_t **)(*(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 48)
                       + 40 * *(unsigned int *)(v2 + 212)
                       + 16);
    if (v163)
    {
      while (1)
      {
        uint64_t v308 = (GPUToolsPlatformLLVMShaderProfilerHelperImpl **)v163[5];
        unint64_t v164 = (TargetClauseAnalysis **)GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(*v308);
        TargetBlocks = (uint64_t *)TargetClauseAnalysis::GetTargetBlocks(*v164);
        unint64_t v284 = (uint64_t **)v163;
        unint64_t v168 = (uint64_t *)v163[2];
        unint64_t v167 = (long long *)(v163 + 2);
        v166 = v168;
        float64x2_t v293 = v164;
        unsigned int v169 = *v164;
        uint64_t v170 = *(void *)(*(void *)(*(void *)(v2 + 80) + 8) + 48) + 40 * *(unsigned int *)(v2 + 212);
        int v171 = *((char *)v167 + 23);
        if (v171 >= 0) {
          v172 = (uint64_t *)v167;
        }
        else {
          v172 = v166;
        }
        if (v171 >= 0) {
          unint64_t v173 = *((unsigned __int8 *)v167 + 23);
        }
        else {
          unint64_t v173 = *((void *)v167 + 1);
        }
        unint64_t v174 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v172, v173);
        unint64_t v175 = v174;
        unint64_t v176 = *(void *)(v170 + 8);
        if (v176)
        {
          uint8x8_t v177 = (uint8x8_t)vcnt_s8((int8x8_t)v176);
          v177.i16[0] = vaddlv_u8(v177);
          unint64_t v178 = v177.u32[0];
          if (v177.u32[0] > 1uLL)
          {
            unint64_t v1 = v174;
            if (v174 >= v176) {
              unint64_t v1 = v174 % v176;
            }
          }
          else
          {
            unint64_t v1 = (v176 - 1) & v174;
          }
          BOOL v179 = *(uint64_t ***)(*(void *)v170 + 8 * v1);
          if (v179)
          {
            v180 = *v179;
            if (*v179)
            {
              while (1)
              {
                unint64_t v181 = v180[1];
                if (v181 == v175)
                {
                  if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v180 + 16, (unsigned __int8 *)v167))
                  {
                    uint64_t v289 = v180;
                    uint64_t v2 = a1;
                    goto LABEL_281;
                  }
                }
                else
                {
                  if (v178 > 1)
                  {
                    if (v181 >= v176) {
                      v181 %= v176;
                    }
                  }
                  else
                  {
                    v181 &= v176 - 1;
                  }
                  if (v181 != v1)
                  {
LABEL_255:
                    uint64_t v2 = a1;
                    break;
                  }
                }
                v180 = (uint64_t *)*v180;
                if (!v180) {
                  goto LABEL_255;
                }
              }
            }
          }
        }
        v182 = operator new(0x58uLL);
        v313.__r_.__value_.__r.__words[0] = (std::string::size_type)v182;
        v313.__r_.__value_.__l.__size_ = v170 + 16;
        v313.__r_.__value_.__s.__data_[16] = 0;
        void *v182 = 0;
        v182[1] = v175;
        uint64_t v289 = v182;
        v183 = (std::string *)(v182 + 2);
        if (*((char *)v284 + 39) < 0)
        {
          std::string::__init_copy_ctor_external(v183, (const std::string::value_type *)v284[2], (std::string::size_type)v284[3]);
        }
        else
        {
          long long v184 = *v167;
          v183->__r_.__value_.__r.__words[2] = *((void *)v167 + 2);
          *(_OWORD *)&v183->__r_.__value_.__l.__data_ = v184;
        }
        unsigned int v185 = v289;
        *(_OWORD *)(v289 + 9) = 0u;
        *(_OWORD *)(v289 + 7) = 0u;
        *(_OWORD *)(v289 + 5) = 0u;
        v313.__r_.__value_.__s.__data_[16] = 1;
        float v186 = (float)(unint64_t)(*(void *)(v170 + 24) + 1);
        float v187 = *(float *)(v170 + 32);
        if (!v176 || (float)(v187 * (float)v176) < v186)
        {
          BOOL v188 = (v176 & (v176 - 1)) != 0;
          if (v176 < 3) {
            BOOL v188 = 1;
          }
          unint64_t v189 = v188 | (2 * v176);
          unint64_t v190 = vcvtps_u32_f32(v186 / v187);
          if (v189 <= v190) {
            size_t v191 = v190;
          }
          else {
            size_t v191 = v189;
          }
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(v170, v191);
          unint64_t v176 = *(void *)(v170 + 8);
          unsigned int v185 = v289;
          if ((v176 & (v176 - 1)) != 0)
          {
            if (v175 >= v176) {
              unint64_t v1 = v175 % v176;
            }
            else {
              unint64_t v1 = v175;
            }
          }
          else
          {
            unint64_t v1 = (v176 - 1) & v175;
          }
        }
        unint64_t v192 = *(void **)(*(void *)v170 + 8 * v1);
        if (v192) {
          break;
        }
        *unsigned int v185 = *(void *)(v170 + 16);
        *(void *)(v170 + 16) = v185;
        *(void *)(*(void *)v170 + 8 * v1) = v170 + 16;
        if (*v185)
        {
          unint64_t v193 = *(void *)(*v185 + 8);
          if ((v176 & (v176 - 1)) != 0)
          {
            if (v193 >= v176) {
              v193 %= v176;
            }
          }
          else
          {
            v193 &= v176 - 1;
          }
          unint64_t v192 = (void *)(*(void *)v170 + 8 * v193);
          goto LABEL_279;
        }
LABEL_280:
        v313.__r_.__value_.__r.__words[0] = 0;
        ++*(void *)(v170 + 24);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,BinaryInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,BinaryInfo>,void *>>>>::reset[abi:nn180100]((uint64_t)&v313);
LABEL_281:
        v289[10] = v308;
        uint64_t v194 = TargetBlocks[1] - *TargetBlocks;
        unint64_t v195 = v194 >> 7;
        uint64_t v196 = v289[7];
        unint64_t v197 = v289[8];
        unint64_t v198 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v197 - v196) >> 3);
        unint64_t v1 = (v194 >> 7) - v198;
        if (v194 >> 7 <= v198)
        {
          if (v194 >> 7 < v198)
          {
            uint64_t v215 = v196 + 56 * v195;
            if (v197 != v215)
            {
              unint64_t v1 = v289[8];
              do
              {
                v217 = *(void **)(v1 - 56);
                v1 -= 56;
                v216 = v217;
                if (v217)
                {
                  *(void *)(v197 - 48) = v216;
                  operator delete(v216);
                }
                unint64_t v197 = v1;
              }
              while (v1 != v215);
            }
            v289[8] = v215;
          }
          goto LABEL_310;
        }
        uint64_t v199 = v289[9];
        if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v199 - v197) >> 3) >= v1)
        {
          bzero((void *)v289[8], 56 * ((56 * v1 - 56) / 0x38) + 56);
          v289[8] = v197 + 56 * ((56 * v1 - 56) / 0x38) + 56;
        }
        else
        {
          if (v194 < 0) {
            abort();
          }
          unint64_t v200 = 0x6DB6DB6DB6DB6DB7 * ((v199 - v196) >> 3);
          if (2 * v200 > v195) {
            unint64_t v195 = 2 * v200;
          }
          if (v200 >= 0x249249249249249) {
            unint64_t v195 = 0x492492492492492;
          }
          if (v195 > 0x492492492492492) {
LABEL_375:
          }
            std::__throw_bad_array_new_length[abi:nn180100]();
          uint64_t v201 = 56 * v195;
          BOOL v202 = (char *)operator new(56 * v195);
          unint64_t v203 = &v202[56 * v198];
          unint64_t v204 = &v202[v201];
          bzero(v203, 56 * ((56 * v1 - 56) / 0x38) + 56);
          size_t v205 = &v203[56 * ((56 * v1 - 56) / 0x38) + 56];
          v207 = (char *)v289[7];
          uint64_t v206 = (char *)v289[8];
          if (v206 != v207)
          {
            uint64_t v208 = 0;
            do
            {
              int v209 = &v203[v208];
              v210 = &v206[v208];
              *((void *)v209 - 7) = 0;
              *((void *)v209 - 6) = 0;
              *((void *)v209 - 5) = 0;
              *(_OWORD *)(v209 - 56) = *(_OWORD *)&v206[v208 - 56];
              *((void *)v209 - 5) = *(void *)&v206[v208 - 40];
              *((void *)v210 - 7) = 0;
              *((void *)v210 - 6) = 0;
              *((void *)v210 - 5) = 0;
              long long v211 = *(_OWORD *)&v206[v208 - 16];
              *((_OWORD *)v209 - 2) = *(_OWORD *)&v206[v208 - 32];
              *((_OWORD *)v209 - 1) = v211;
              v208 -= 56;
            }
            while (&v206[v208] != v207);
            unint64_t v1 = v289[7];
            uint64_t v206 = (char *)v289[8];
            v289[7] = &v203[v208];
            v289[8] = v205;
            v289[9] = v204;
            if (v206 != (char *)v1)
            {
              unint64_t v212 = v206;
              do
              {
                size_t v214 = (void *)*((void *)v212 - 7);
                v212 -= 56;
                v213 = v214;
                if (v214)
                {
                  *((void *)v206 - 6) = v213;
                  operator delete(v213);
                }
                uint64_t v206 = v212;
              }
              while (v212 != (char *)v1);
              uint64_t v206 = (char *)v1;
            }
            if (!v206) {
              goto LABEL_310;
            }
LABEL_309:
            operator delete(v206);
            goto LABEL_310;
          }
          v289[7] = v203;
          v289[8] = v205;
          v289[9] = v204;
          if (v206) {
            goto LABEL_309;
          }
        }
LABEL_310:
        uint64_t v218 = *TargetBlocks;
        uint64_t v287 = TargetBlocks[1];
        if (*TargetBlocks != v287)
        {
          unsigned int v219 = 0;
          do
          {
            unsigned int v220 = v219;
            uint64_t v221 = v289[7];
            v222 = (char **)(v221 + 56 * v219);
            v304 = v222;
            if (objc_msgSend(*(id *)(v2 + 32), "dumpInstructions", v279))
            {
              int v223 = *(_DWORD *)(v218 + 80);
              uint64_t v224 = v221 + 56 * v220;
              *(_DWORD *)(v224 + 24) = v223;
              unint64_t v1 = v224 + 24;
              int v225 = *(_DWORD *)(v218 + 84);
              *(_DWORD *)(v1 + 4) = v225;
              unint64_t v226 = (v225 - v223 + 1);
              v228 = *v222;
              v227 = v222[1];
              unint64_t v229 = 0xAAAAAAAAAAAAAAABLL * ((v227 - *v222) >> 3);
              unint64_t v230 = v226 - v229;
              if (v226 <= v229)
              {
                if (v226 < v229) {
                  v222[1] = &v228[24 * v226];
                }
              }
              else
              {
                long long v231 = v222[2];
                if (0xAAAAAAAAAAAAAAABLL * ((v231 - v227) >> 3) >= v230)
                {
                  unint64_t v243 = &v227[24 * v230];
                  do
                  {
                    *(void *)v227 = 0;
                    *(_OWORD *)(v227 + 8) = xmmword_4C8030;
                    v227 += 24;
                  }
                  while (v227 != v243);
                  v222[1] = v243;
                }
                else
                {
                  unint64_t v232 = 0xAAAAAAAAAAAAAAABLL * ((v231 - v228) >> 3);
                  uint64_t v233 = 2 * v232;
                  if (2 * v232 <= v226) {
                    uint64_t v233 = v226;
                  }
                  if (v232 >= 0x555555555555555) {
                    unint64_t v234 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v234 = v233;
                  }
                  if (v234 > 0xAAAAAAAAAAAAAAALL) {
                    goto LABEL_375;
                  }
                  unint64_t v235 = (char *)operator new(24 * v234);
                  unint64_t v236 = &v235[24 * v229];
                  size_t v237 = &v235[24 * v226];
                  uint64_t v238 = v236;
                  do
                  {
                    *(void *)uint64_t v238 = 0;
                    *(_OWORD *)(v238 + 8) = xmmword_4C8030;
                    v238 += 24;
                  }
                  while (v238 != v237);
                  unint64_t v240 = *v304;
                  v239 = v304[1];
                  if (v239 == *v304)
                  {
                    size_t v242 = v304;
                  }
                  else
                  {
                    do
                    {
                      long long v241 = *(_OWORD *)(v239 - 24);
                      *((void *)v236 - 1) = *((void *)v239 - 1);
                      *(_OWORD *)(v236 - 24) = v241;
                      v236 -= 24;
                      v239 -= 24;
                    }
                    while (v239 != v240);
                    size_t v242 = v304;
                    v239 = *v304;
                  }
                  *size_t v242 = v236;
                  v242[1] = v237;
                  v242[2] = &v235[24 * v234];
                  v222 = v242;
                  if (v239) {
                    operator delete(v239);
                  }
                }
              }
              BOOL v244 = *(void **)(v218 + 56);
              if (v244)
              {
                unsigned int v245 = *(_DWORD *)v1;
                unsigned int v246 = *(_DWORD *)(v1 + 4);
                do
                {
                  if (v245 <= v246)
                  {
                    size_t v247 = (int *)v244[3];
                    uint64_t v248 = *v222;
                    unsigned int v249 = v245;
                    do
                    {
                      int v250 = *v247++;
                      *(_DWORD *)v248 += v250;
                      v248 += 24;
                      ++v249;
                    }
                    while (v249 <= v246);
                  }
                  BOOL v244 = (void *)*v244;
                }
                while (v244);
              }
              uint64_t v251 = (int *)v222[1];
              if (*v222 == (char *)v251)
              {
                unsigned int v252 = 0;
              }
              else
              {
                unsigned int v252 = 0;
                v253 = (int *)*v222;
                do
                {
                  int v254 = *v253;
                  v253 += 6;
                  v252 += v254;
                }
                while (v253 != v251);
              }
              *(_DWORD *)(v221 + 56 * v220 + 32) = v252 / (0xAAAAAAAAAAAAAAABLL * (((char *)v251 - *v222) >> 3));
            }
            unsigned int v291 = v220;
            uint64_t v255 = *(void *)(v218 + 16);
            if (v255)
            {
              do
              {
                float64x2_t v295 = (uint64_t *)v255;
                uint64_t v256 = *(void *)*v293
                     + 88 * *(void *)(*((void *)*v293 + 3) + 48 * *(unsigned int *)(v255 + 16));
                uint64_t v257 = *(void *)(v256 + 40);
                if (v257)
                {
                  uint64_t v299 = v256 + 24;
                  do
                  {
                    v302 = (uint64_t *)v257;
                    LODWORD(v313.__r_.__value_.__l.__data_) = *(_DWORD *)(v257 + 16);
                    unsigned int data = v313.__r_.__value_.__l.__data_;
                    unint64_t v259 = std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v299, v313.__r_.__value_.__l.__data_, &v313);
                    uint8x8_t v260 = (unint64_t *)*((void *)v259 + 4);
                    for (uint64_t k = (unint64_t *)*((void *)v259 + 5); v260 != k; v2 = a1)
                    {
                      unint64_t v261 = *v260;
                      uint64_t v262 = *(void *)(*(void *)(*(void *)(*(void *)(v2 + 56) + 8) + 48)
                                       + 24 * *(unsigned int *)(v2 + 212))
                           + 32 * *v260;
                      v263 = *(_DWORD **)(v262 + 8);
                      unint64_t v1 = *(void *)(v262 + 16);
                      while (v263 != (_DWORD *)v1)
                      {
                        unint64_t v264 = v263[2];
                        uint64_t v265 = *((void *)v169 + 17);
                        if (v264 < (*((void *)v169 + 18) - v265) >> 2)
                        {
                          unint64_t v266 = *(unsigned int *)(v218 + 80);
                          if (v261 >= v266 && v261 <= *(unsigned int *)(v218 + 84))
                          {
                            int v268 = *(_DWORD *)(v265 + 4 * v264);
                            unint64_t v269 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((void *)(v218 + 40), data);
                            if (v269)
                            {
                              unint64_t v270 = (v268 - v266);
                              uint64_t v271 = v269[3];
                              if (v270 < (v269[4] - v271) >> 2)
                              {
                                v272 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((void *)(v218 + 88), data);
                                if (v272)
                                {
                                  LODWORD(v273) = *((_DWORD *)v272 + 5);
                                  LODWORD(v274) = *(_DWORD *)(v271 + 4 * v270);
                                  *(double *)&unint64_t v275 = (double)v274;
                                  double v276 = (double)v273 / *(double *)&v275;
                                  LODWORD(v275) = v263[1];
                                  v263[1] = (v276 * (double)v275);
                                  if ([*(id *)(a1 + 32) dumpInstructions])
                                  {
                                    LODWORD(v277) = v263[4];
                                    v278.i64[0] = v263[3];
                                    v278.i64[1] = v263[1];
                                    *(float64x2_t *)&(*v304)[24 * v270 + 8] = vaddq_f64(*(float64x2_t *)&(*v304)[24 * v270 + 8], vdivq_f64(vcvtq_f64_u64(v278), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v277), 0)));
                                  }
                                }
                              }
                            }
                          }
                        }
                        v263 += 5;
                      }
                      ++v260;
                    }
                    uint64_t v257 = *v302;
                  }
                  while (*v302);
                }
                uint64_t v255 = *v295;
              }
              while (*v295);
            }
            unsigned int v219 = v291 + 1;
            v218 += 128;
          }
          while (v218 != v287);
        }
        unint64_t v163 = *v284;
        if (!*v284) {
          return;
        }
      }
      *unsigned int v185 = *v192;
LABEL_279:
      *unint64_t v192 = v185;
      goto LABEL_280;
    }
  }
}

- (void)generateTargetSamplesForResult:(uint64_t)a3 withProgramAddressLUT:(char)a4 withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:
{
  while (2)
  {
    unint64_t v10 = a2 - 7;
    unint64_t v11 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v11;
          uint64_t v12 = (uint64_t)a2 - v11;
          unint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)((uint64_t)a2 - v11) >> 2);
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                unsigned int v60 = *(a2 - 7);
                BOOL v5 = v60 == *(_DWORD *)v11;
                BOOL v61 = v60 < *(_DWORD *)v11;
                if (v5) {
                  BOOL v61 = *(a2 - 2) < *(_DWORD *)(v11 + 20);
                }
                if (v61)
                {
                  *(_OWORD *)&v153[12] = *(_OWORD *)(v11 + 12);
                  *(_OWORD *)unint64_t v153 = *(_OWORD *)v11;
                  long long v62 = *(_OWORD *)v10;
                  *(_OWORD *)(v11 + 12) = *((_OWORD *)a2 - 1);
                  *(_OWORD *)unint64_t v11 = v62;
                  *((_OWORD *)a2 - 1) = *(_OWORD *)&v153[12];
                  *(_OWORD *)unint64_t v10 = *(_OWORD *)v153;
                }
                break;
              case 3uLL:
                std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(v11, (int *)(v11 + 28), (uint64_t)(a2 - 7));
                break;
              case 4uLL:
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(v11, v11 + 28, v11 + 56, (uint64_t)(a2 - 7));
                break;
              case 5uLL:
                unint64_t v63 = (_OWORD *)(v11 + 28);
                uint64_t v64 = (_OWORD *)(v11 + 56);
                uint64_t v65 = (_OWORD *)(v11 + 84);
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(v11, v11 + 28, v11 + 56, v11 + 84);
                unsigned int v66 = *(a2 - 7);
                unsigned int v67 = *(_DWORD *)(v11 + 84);
                BOOL v5 = v66 == v67;
                BOOL v68 = v66 < v67;
                if (v5) {
                  BOOL v68 = *(a2 - 2) < *(_DWORD *)(v11 + 104);
                }
                if (v68)
                {
                  *(_OWORD *)unint64_t v154 = *v65;
                  *(_OWORD *)&v154[12] = *(_OWORD *)(v11 + 96);
                  long long v69 = *(_OWORD *)v10;
                  *(_OWORD *)(v11 + 96) = *((_OWORD *)a2 - 1);
                  _OWORD *v65 = v69;
                  *((_OWORD *)a2 - 1) = *(_OWORD *)&v154[12];
                  *(_OWORD *)unint64_t v10 = *(_OWORD *)v154;
                  unsigned int v70 = *(_DWORD *)(v11 + 84);
                  unsigned int v71 = *(_DWORD *)(v11 + 56);
                  BOOL v5 = v70 == v71;
                  BOOL v72 = v70 < v71;
                  if (v5) {
                    BOOL v72 = *(_DWORD *)(v11 + 104) < *(_DWORD *)(v11 + 76);
                  }
                  if (v72)
                  {
                    *(_OWORD *)unint64_t v155 = *v64;
                    *(_OWORD *)&v155[12] = *(_OWORD *)(v11 + 68);
                    *uint64_t v64 = *v65;
                    *(_OWORD *)(v11 + 68) = *(_OWORD *)(v11 + 96);
                    _OWORD *v65 = *(_OWORD *)v155;
                    *(_OWORD *)(v11 + 96) = *(_OWORD *)&v155[12];
                    unsigned int v73 = *(_DWORD *)(v11 + 56);
                    unsigned int v74 = *(_DWORD *)(v11 + 28);
                    BOOL v5 = v73 == v74;
                    BOOL v75 = v73 < v74;
                    if (v5) {
                      BOOL v75 = *(_DWORD *)(v11 + 76) < *(_DWORD *)(v11 + 48);
                    }
                    if (v75)
                    {
                      *(_OWORD *)uint64_t v156 = *v63;
                      *(_OWORD *)&v156[12] = *(_OWORD *)(v11 + 40);
                      *unint64_t v63 = *v64;
                      *(_OWORD *)(v11 + 40) = *(_OWORD *)(v11 + 68);
                      *uint64_t v64 = *(_OWORD *)v156;
                      *(_OWORD *)(v11 + 68) = *(_OWORD *)&v156[12];
                      unsigned int v76 = *(_DWORD *)(v11 + 28);
                      BOOL v5 = v76 == *(_DWORD *)v11;
                      BOOL v77 = v76 < *(_DWORD *)v11;
                      if (v5) {
                        BOOL v77 = *(_DWORD *)(v11 + 48) < *(_DWORD *)(v11 + 20);
                      }
                      if (v77)
                      {
                        *(_OWORD *)&v157[12] = *(_OWORD *)(v11 + 12);
                        *(_OWORD *)uint64_t v157 = *(_OWORD *)v11;
                        *(_OWORD *)unint64_t v11 = *v63;
                        *(_OWORD *)(v11 + 12) = *(_OWORD *)(v11 + 40);
                        *unint64_t v63 = *(_OWORD *)v157;
                        *(_OWORD *)(v11 + 40) = *(_OWORD *)&v157[12];
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v12 <= 671)
          {
            unint64_t v78 = (unsigned int *)(v11 + 28);
            BOOL v80 = (unsigned int *)v11 == a2 || v78 == a2;
            if (a4)
            {
              if (!v80)
              {
                uint64_t v81 = 0;
                unint64_t v82 = v11;
                do
                {
                  unint64_t v83 = v78;
                  unsigned int v84 = *(_DWORD *)(v82 + 28);
                  unsigned int v85 = *(_DWORD *)(v82 + 48);
                  BOOL v86 = v84 < *(_DWORD *)v82;
                  if (v84 == *(_DWORD *)v82) {
                    BOOL v86 = v85 < *(_DWORD *)(v82 + 20);
                  }
                  if (v86)
                  {
                    long long v158 = *(_OWORD *)(v82 + 32);
                    int v87 = *(_DWORD *)(v82 + 52);
                    uint64_t v88 = v81;
                    while (1)
                    {
                      uint64_t v89 = v11 + v88;
                      *(_OWORD *)(v89 + 28) = *(_OWORD *)(v11 + v88);
                      *(_OWORD *)(v89 + 40) = *(_OWORD *)(v11 + v88 + 12);
                      if (!v88) {
                        break;
                      }
                      unsigned int v90 = *(_DWORD *)(v89 - 28);
                      BOOL v91 = v85 < *(_DWORD *)(v89 - 8);
                      BOOL v5 = v84 == v90;
                      BOOL v92 = v84 < v90;
                      if (!v5) {
                        BOOL v91 = v92;
                      }
                      v88 -= 28;
                      if (!v91)
                      {
                        uint64_t v93 = v11 + v88 + 28;
                        goto LABEL_120;
                      }
                    }
                    uint64_t v93 = v11;
LABEL_120:
                    *(_DWORD *)uint64_t v93 = v84;
                    *(_OWORD *)(v93 + 4) = v158;
                    *(_DWORD *)(v93 + 20) = v85;
                    *(_DWORD *)(v93 + 24) = v87;
                  }
                  unint64_t v78 = v83 + 7;
                  v81 += 28;
                  unint64_t v82 = (unint64_t)v83;
                }
                while (v83 + 7 != a2);
              }
            }
            else if (!v80)
            {
              do
              {
                unint64_t v137 = (unint64_t)v78;
                unsigned int v138 = *(_DWORD *)(a1 + 28);
                unsigned int v139 = *(_DWORD *)(a1 + 48);
                BOOL v140 = v138 < *(_DWORD *)a1;
                if (v138 == *(_DWORD *)a1) {
                  BOOL v140 = v139 < *(_DWORD *)(a1 + 20);
                }
                if (v140)
                {
                  long long v161 = *(_OWORD *)(a1 + 32);
                  int v141 = *(_DWORD *)(a1 + 52);
                  unint64_t v142 = v137;
                  do
                  {
                    *(_OWORD *)unint64_t v142 = *(_OWORD *)(v142 - 28);
                    *(_OWORD *)(v142 + 12) = *(_OWORD *)(v142 - 16);
                    unsigned int v143 = *(_DWORD *)(v142 - 56);
                    unsigned int v144 = *(_DWORD *)(v142 - 36);
                    v142 -= 28;
                    BOOL v145 = v139 < v144;
                    BOOL v5 = v138 == v143;
                    BOOL v146 = v138 < v143;
                    if (v5) {
                      BOOL v146 = v145;
                    }
                  }
                  while (v146);
                  *(_DWORD *)unint64_t v142 = v138;
                  *(_OWORD *)(v142 + 4) = v161;
                  *(_DWORD *)(v142 + 20) = v139;
                  *(_DWORD *)(v142 + 24) = v141;
                }
                unint64_t v78 = (unsigned int *)(v137 + 28);
                a1 = v137;
              }
              while ((unsigned int *)(v137 + 28) != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((unsigned int *)v11 != a2)
            {
              int64_t v94 = (v13 - 2) >> 1;
              int64_t v95 = v94;
              do
              {
                int64_t v96 = v95;
                if (v94 >= v95)
                {
                  uint64_t v97 = (2 * v95) | 1;
                  unint64_t v98 = v11 + 28 * v97;
                  if (2 * v96 + 2 < (uint64_t)v13)
                  {
                    unsigned int v100 = *(_DWORD *)(v98 + 28);
                    BOOL v99 = *(_DWORD *)(v11 + 28 * v97 + 20) < *(_DWORD *)(v98 + 48);
                    if (*(_DWORD *)v98 != v100) {
                      BOOL v99 = *(_DWORD *)v98 < v100;
                    }
                    if (v99) {
                      v98 += 28;
                    }
                    else {
                      unsigned int v100 = *(_DWORD *)v98;
                    }
                    if (v99) {
                      uint64_t v97 = 2 * v96 + 2;
                    }
                  }
                  else
                  {
                    unsigned int v100 = *(_DWORD *)v98;
                  }
                  unint64_t v101 = v11 + 28 * v96;
                  unsigned int v102 = *(_DWORD *)v101;
                  unsigned int v103 = *(_DWORD *)(v101 + 20);
                  BOOL v5 = v100 == *(_DWORD *)v101;
                  BOOL v104 = v100 < *(_DWORD *)v101;
                  if (v5) {
                    BOOL v104 = *(_DWORD *)(v98 + 20) < v103;
                  }
                  if (!v104)
                  {
                    long long v159 = *(_OWORD *)(v101 + 4);
                    int v105 = *(_DWORD *)(v101 + 24);
                    do
                    {
                      BOOL v106 = (_OWORD *)v101;
                      unint64_t v101 = v98;
                      long long v107 = *(_OWORD *)v98;
                      *(_OWORD *)((char *)v106 + 12) = *(_OWORD *)(v98 + 12);
                      *BOOL v106 = v107;
                      if (v94 < v97) {
                        break;
                      }
                      uint64_t v108 = (2 * v97) | 1;
                      unint64_t v98 = v11 + 28 * v108;
                      uint64_t v97 = 2 * v97 + 2;
                      if (v97 < (uint64_t)v13)
                      {
                        unsigned int v111 = *(_DWORD *)v98;
                        unsigned int v109 = *(_DWORD *)(v98 + 28);
                        BOOL v110 = *(_DWORD *)(v11 + 28 * v108 + 20) < *(_DWORD *)(v98 + 48);
                        if (*(_DWORD *)v98 != v109) {
                          BOOL v110 = v111 < v109;
                        }
                        if (v110)
                        {
                          unsigned int v111 = *(_DWORD *)(v98 + 28);
                          v98 += 28;
                        }
                        else
                        {
                          uint64_t v97 = v108;
                        }
                      }
                      else
                      {
                        unsigned int v111 = *(_DWORD *)v98;
                        uint64_t v97 = v108;
                      }
                      BOOL v112 = *(_DWORD *)(v98 + 20) < v103;
                      BOOL v5 = v111 == v102;
                      BOOL v113 = v111 < v102;
                      if (!v5) {
                        BOOL v112 = v113;
                      }
                    }
                    while (!v112);
                    *(_DWORD *)unint64_t v101 = v102;
                    *(_OWORD *)(v101 + 4) = v159;
                    *(_DWORD *)(v101 + 20) = v103;
                    *(_DWORD *)(v101 + 24) = v105;
                  }
                }
                int64_t v95 = v96 - 1;
              }
              while (v96);
              int64_t v114 = v12 / 0x1CuLL;
              do
              {
                uint64_t v115 = 0;
                *(_OWORD *)&v160[12] = *(_OWORD *)(v11 + 12);
                *(_OWORD *)unint64_t v160 = *(_OWORD *)v11;
                long long v116 = (_OWORD *)v11;
                do
                {
                  uint64_t v117 = v115 + 1;
                  unint64_t v118 = (unsigned int *)v116 + 7 * v115 + 7;
                  uint64_t v119 = (2 * v115) | 1;
                  uint64_t v120 = 2 * v115 + 2;
                  if (v120 < v114)
                  {
                    unsigned int v121 = v118[7];
                    BOOL v122 = *((_DWORD *)v116 + 7 * v117 + 5) < v118[12];
                    BOOL v5 = *v118 == v121;
                    BOOL v123 = *v118 < v121;
                    if (!v5) {
                      BOOL v122 = v123;
                    }
                    if (v122)
                    {
                      v118 += 7;
                      uint64_t v119 = v120;
                    }
                  }
                  long long v124 = *(_OWORD *)v118;
                  *(_OWORD *)((char *)v116 + 12) = *(_OWORD *)(v118 + 3);
                  *long long v116 = v124;
                  long long v116 = v118;
                  uint64_t v115 = v119;
                }
                while (v119 <= (uint64_t)((unint64_t)(v114 - 2) >> 1));
                a2 -= 7;
                if (v118 == a2)
                {
                  *(_OWORD *)(v118 + 3) = *(_OWORD *)&v160[12];
                  *(_OWORD *)unint64_t v118 = *(_OWORD *)v160;
                }
                else
                {
                  long long v125 = *(_OWORD *)a2;
                  *(_OWORD *)(v118 + 3) = *(_OWORD *)(a2 + 3);
                  *(_OWORD *)unint64_t v118 = v125;
                  *(_OWORD *)(a2 + 3) = *(_OWORD *)&v160[12];
                  *(_OWORD *)a2 = *(_OWORD *)v160;
                  uint64_t v126 = (uint64_t)v118 - v11 + 28;
                  if (v126 >= 29)
                  {
                    unint64_t v127 = (v126 / 0x1CuLL - 2) >> 1;
                    unint64_t v128 = v11 + 28 * v127;
                    unsigned int v129 = *v118;
                    unsigned int v130 = v118[5];
                    if (*(_DWORD *)v128 == *v118 ? *(_DWORD *)(v128 + 20) < v130 : *(_DWORD *)v128 < *v118)
                    {
                      long long v149 = *(_OWORD *)(v118 + 1);
                      unsigned int v132 = v118[6];
                      do
                      {
                        uint64_t v133 = v118;
                        unint64_t v118 = (unsigned int *)v128;
                        long long v134 = *(_OWORD *)v128;
                        *(_OWORD *)(v133 + 3) = *(_OWORD *)(v128 + 12);
                        *(_OWORD *)uint64_t v133 = v134;
                        if (!v127) {
                          break;
                        }
                        unint64_t v127 = (v127 - 1) >> 1;
                        unint64_t v128 = v11 + 28 * v127;
                        BOOL v135 = *(_DWORD *)v128 < v129;
                        if (*(_DWORD *)v128 == v129) {
                          BOOL v135 = *(_DWORD *)(v128 + 20) < v130;
                        }
                      }
                      while (v135);
                      *unint64_t v118 = v129;
                      *(_OWORD *)(v118 + 1) = v149;
                      v118[5] = v130;
                      v118[6] = v132;
                    }
                  }
                }
              }
              while (v114-- > 2);
            }
            return;
          }
          unint64_t v14 = v13 >> 1;
          unint64_t v15 = v11 + 28 * (v13 >> 1);
          if ((unint64_t)v12 >= 0xE01)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(a1, (int *)(a1 + 28 * (v13 >> 1)), (uint64_t)(a2 - 7));
            uint64_t v16 = 28 * v14;
            unsigned int v17 = (int *)(28 * v14 + a1 - 28);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(a1 + 28, v17, (uint64_t)(a2 - 14));
            uint64_t v18 = (int *)(a1 + 28 + v16);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(a1 + 56, v18, (uint64_t)(a2 - 21));
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>((uint64_t)v17, (int *)v15, (uint64_t)v18);
            *(_OWORD *)&v150[12] = *(_OWORD *)(a1 + 12);
            *(_OWORD *)int v150 = *(_OWORD *)a1;
            long long v19 = *(_OWORD *)v15;
            *(_OWORD *)(a1 + 12) = *(_OWORD *)(v15 + 12);
            *(_OWORD *)a1 = v19;
            *(_OWORD *)(v15 + 12) = *(_OWORD *)&v150[12];
            *(_OWORD *)unint64_t v15 = *(_OWORD *)v150;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(a1 + 28 * (v13 >> 1), (int *)a1, (uint64_t)(a2 - 7));
          }
          --a3;
          unsigned int v20 = *(_DWORD *)a1;
          if (a4)
          {
            unsigned int v21 = *(_DWORD *)(a1 + 20);
            break;
          }
          unsigned int v22 = *(_DWORD *)(a1 - 28);
          unsigned int v21 = *(_DWORD *)(a1 + 20);
          BOOL v5 = v22 == v20;
          BOOL v23 = v22 < v20;
          if (v5) {
            BOOL v23 = *(_DWORD *)(a1 - 8) < v21;
          }
          if (v23) {
            break;
          }
          long long v148 = *(_OWORD *)(a1 + 4);
          unsigned int v42 = *(a2 - 7);
          BOOL v5 = v20 == v42;
          BOOL v43 = v20 < v42;
          if (v5) {
            BOOL v43 = v21 < *(a2 - 2);
          }
          if (v43)
          {
            unint64_t v11 = a1;
            do
            {
              unsigned int v44 = *(_DWORD *)(v11 + 28);
              v11 += 28;
              BOOL v45 = v20 < v44;
              if (v20 == v44) {
                BOOL v45 = v21 < *(_DWORD *)(v11 + 20);
              }
            }
            while (!v45);
          }
          else
          {
            unint64_t v46 = (unsigned int *)(a1 + 28);
            do
            {
              unint64_t v11 = (unint64_t)v46;
              if (v46 >= a2) {
                break;
              }
              unsigned int v47 = *v46;
              BOOL v48 = v21 < *(_DWORD *)(v11 + 20);
              BOOL v5 = v20 == v47;
              BOOL v49 = v20 < v47;
              if (!v5) {
                BOOL v48 = v49;
              }
              unint64_t v46 = (unsigned int *)(v11 + 28);
            }
            while (!v48);
          }
          uint64_t v50 = a2;
          if (v11 < (unint64_t)a2)
          {
            uint64_t v50 = a2;
            do
            {
              unsigned int v51 = *(v50 - 7);
              v50 -= 7;
              BOOL v52 = v20 < v51;
              if (v20 == v51) {
                BOOL v52 = v21 < v50[5];
              }
            }
            while (v52);
          }
          int v53 = *(_DWORD *)(a1 + 24);
          while (v11 < (unint64_t)v50)
          {
            *(_OWORD *)&v152[12] = *(_OWORD *)(v11 + 12);
            *(_OWORD *)unint64_t v152 = *(_OWORD *)v11;
            long long v54 = *(_OWORD *)v50;
            *(_OWORD *)(v11 + 12) = *(_OWORD *)(v50 + 3);
            *(_OWORD *)unint64_t v11 = v54;
            *(_OWORD *)(v50 + 3) = *(_OWORD *)&v152[12];
            *(_OWORD *)uint64_t v50 = *(_OWORD *)v152;
            do
            {
              unsigned int v55 = *(_DWORD *)(v11 + 28);
              v11 += 28;
              BOOL v56 = v20 < v55;
              if (v20 == v55) {
                BOOL v56 = v21 < *(_DWORD *)(v11 + 20);
              }
            }
            while (!v56);
            do
            {
              unsigned int v57 = *(v50 - 7);
              v50 -= 7;
              BOOL v58 = v20 < v57;
              if (v20 == v57) {
                BOOL v58 = v21 < v50[5];
              }
            }
            while (v58);
          }
          BOOL v4 = v11 - 28 >= a1;
          BOOL v5 = v11 - 28 == a1;
          if (v11 - 28 != a1)
          {
            long long v59 = *(_OWORD *)(v11 - 28);
            *(_OWORD *)(a1 + 12) = *(_OWORD *)(v11 - 16);
            *(_OWORD *)a1 = v59;
          }
          a4 = 0;
          *(_DWORD *)(v11 - 28) = v20;
          *(_OWORD *)(v11 - 24) = v148;
          *(_DWORD *)(v11 - 8) = v21;
          *(_DWORD *)(v11 - 4) = v53;
        }
        long long v147 = *(_OWORD *)(a1 + 4);
        int v24 = *(_DWORD *)(a1 + 24);
        unint64_t v25 = a1;
        do
        {
          unint64_t v26 = v25;
          unsigned int v27 = *(_DWORD *)(v25 + 28);
          v25 += 28;
          BOOL v28 = v27 < v20;
          if (v27 == v20) {
            BOOL v28 = *(_DWORD *)(v26 + 48) < v21;
          }
        }
        while (v28);
        BOOL v29 = a2;
        if (v26 == a1)
        {
          BOOL v29 = a2;
          do
          {
            if (v25 >= (unint64_t)v29) {
              break;
            }
            unsigned int v32 = *(v29 - 7);
            v29 -= 7;
            BOOL v33 = v32 < v20;
            if (v32 == v20) {
              BOOL v33 = v29[5] < v21;
            }
          }
          while (!v33);
        }
        else
        {
          do
          {
            unsigned int v30 = *(v29 - 7);
            v29 -= 7;
            BOOL v31 = v30 < v20;
            if (v30 == v20) {
              BOOL v31 = v29[5] < v21;
            }
          }
          while (!v31);
        }
        unint64_t v11 = v25;
        if (v25 < (unint64_t)v29)
        {
          unint64_t v34 = (unint64_t)v29;
          do
          {
            *(_OWORD *)uint64_t v151 = *(_OWORD *)v11;
            *(_OWORD *)&v151[12] = *(_OWORD *)(v11 + 12);
            long long v35 = *(_OWORD *)v34;
            *(_OWORD *)(v11 + 12) = *(_OWORD *)(v34 + 12);
            *(_OWORD *)unint64_t v11 = v35;
            *(_OWORD *)(v34 + 12) = *(_OWORD *)&v151[12];
            *(_OWORD *)unint64_t v34 = *(_OWORD *)v151;
            do
            {
              unsigned int v36 = *(_DWORD *)(v11 + 28);
              v11 += 28;
              BOOL v37 = v36 < v20;
              if (v36 == v20) {
                BOOL v37 = *(_DWORD *)(v11 + 20) < v21;
              }
            }
            while (v37);
            do
            {
              unsigned int v38 = *(_DWORD *)(v34 - 28);
              v34 -= 28;
              BOOL v39 = v38 < v20;
              if (v38 == v20) {
                BOOL v39 = *(_DWORD *)(v34 + 20) < v21;
              }
            }
            while (!v39);
          }
          while (v11 < v34);
        }
        if (v11 - 28 != a1)
        {
          long long v40 = *(_OWORD *)(v11 - 28);
          *(_OWORD *)(a1 + 12) = *(_OWORD *)(v11 - 16);
          *(_OWORD *)a1 = v40;
        }
        *(_DWORD *)(v11 - 28) = v20;
        *(_OWORD *)(v11 - 24) = v147;
        *(_DWORD *)(v11 - 8) = v21;
        *(_DWORD *)(v11 - 4) = v24;
        if (v25 >= (unint64_t)v29) {
          break;
        }
LABEL_43:
        std::__introsort<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *,false>(a1, v11 - 28, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v41 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(a1, v11 - 28);
      if (std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>(v11, (uint64_t)a2))
      {
        break;
      }
      if (!v41) {
        goto LABEL_43;
      }
    }
    a2 = (unsigned int *)(v11 - 28);
    if (!v41) {
      continue;
    }
    break;
  }
}

- (void)adjustHWBiasAndFinalizeResult
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    unint64_t v3 = (char *)a1[1];
    BOOL v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        BOOL v5 = (void *)*((void *)v3 - 3);
        if (v5)
        {
          *((void *)v3 - 2) = v5;
          operator delete(v5);
        }
        v3 -= 48;
      }
      while (v3 != v2);
      BOOL v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

- (uint64_t)adjustHWBiasAndFinalizeResult
{
  if (0xAAAAAAAAAAAAAAABLL * ((result[2] - *result) >> 4) < a2)
  {
    if (a2 >= 0x555555555555556) {
      abort();
    }
    uint64_t v2 = result;
    std::__split_buffer<[(DYPMTLShaderProfilerHelper *)v3 adjustHWBiasAndFinalizeResult];
    std::vector<DynamicBuffer>::__swap_out_circular_buffer(v2, v3);
    return (uint64_t *)std::__split_buffer<DynamicBuffer>::~__split_buffer((uint64_t)v3);
  }
  return result;
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) + 24 * *(unsigned int *)(a1 + 48);
  unint64_t v3 = *(void **)v2;
  unint64_t v26 = *(void **)(v2 + 8);
  if (*(void **)v2 != v26)
  {
    do
    {
      BOOL v4 = (unsigned int *)v3[3];
      unsigned int v27 = v3;
      BOOL v28 = (unsigned int *)v3[4];
      if (v4 != v28)
      {
        uint64_t v5 = *v3;
        uint64_t v32 = v3[1] + 24;
        unint64_t v34 = (void *)(*v3 + 40);
        BOOL v29 = (uint64_t *)v3[2];
        unsigned int v30 = (void *)(*v3 + 88);
        do
        {
          unsigned int v35 = *v4;
          unsigned int v36 = *v4;
          if (v4[2])
          {
            unsigned int v6 = 0;
            BOOL v33 = v4;
            do
            {
              unsigned int v7 = v4[1];
              unint64_t v8 = *(void *)(*((void *)std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v32, v35, &v36)+ 4)+ 8 * (v7 + v6));
              unint64_t v9 = [WeakRetained[21] objectAtIndexedSubscript:v8 & 0x1F];
              unint64_t v10 = [v9 objectAtIndexedSubscript:v8 >> 5];

              uint64_t v11 = [v10 objectAtIndexedSubscript:HIDWORD(v8)];

              unint64_t v13 = *(double **)(v11 + 48);
              uint64_t v12 = *(unsigned int **)(v11 + 56);
              if (v13 != (double *)v12)
              {
                uint64_t v14 = *v29;
                unint64_t v15 = (v29[1] - *v29) >> 2;
                do
                {
                  unint64_t v16 = *(unsigned int *)v13;
                  if (v15 > v16)
                  {
                    unsigned int v17 = *(_DWORD *)(v14 + 4 * v16);
                    unsigned int v18 = *(_DWORD *)(v5 + 80);
                    unint64_t v19 = v17 - v18;
                    if (v17 >= v18 && v17 <= *(_DWORD *)(v5 + 84))
                    {
                      unsigned int v20 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v34, v35);
                      if (v20)
                      {
                        uint64_t v21 = v20[3];
                        if (v19 < (v20[4] - v21) >> 2)
                        {
                          unsigned int v22 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v30, v35);
                          if (v22)
                          {
                            LODWORD(v23) = *((_DWORD *)v22 + 5);
                            LODWORD(v24) = *(_DWORD *)(v21 + 4 * v19);
                            double v25 = (double)v23 / (double)v24;
                            if (v25 > 1.0) {
                              double v25 = 1.0 - *(double *)(v11 + 32) + v25 * *(double *)(v11 + 32);
                            }
                            if (v25 > 50.0) {
                              double v25 = 50.0;
                            }
                            v13[1] = v13[1] * v25;
                          }
                        }
                      }
                    }
                  }
                  v13 += 2;
                }
                while (v13 != (double *)v12);
              }

              ++v6;
              BOOL v4 = v33;
            }
            while (v6 < v33[2]);
          }
          v4 += 3;
        }
        while (v4 != v28);
      }
      unint64_t v3 = v27 + 6;
    }
    while (v27 + 6 != v26);
  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  for (uint64_t i = (void *)WeakRetained[4]; i; uint64_t i = (void *)*i)
  {
    uint64_t v2 = i[3];
    unint64_t v3 = *(atomic_ullong ***)(v2 + 16);
    BOOL v4 = *(atomic_ullong ***)(v2 + 24);
    if (v3 != v4)
    {
      unint64_t v5 = 0;
      do
      {
        unsigned int v6 = *v3;
        unsigned int v7 = v3[1];
        while (v6 != v7)
        {
          unint64_t v8 = atomic_exchange(v6, v5);
          unint64_t v9 = atomic_load((unint64_t *)v6);
          unint64_t v5 = v9 + v8;
          ++v6;
        }
        v3 += 3;
      }
      while (v3 != v4);
      uint64_t v2 = i[3];
    }
    unsigned int v10 = atomic_load((unsigned int *)(v2 + 40));
    uint64_t v11 = +[NSMutableData dataWithLength:16 * v10];
    [*(id *)(i[3] + 8) setUscSamples:v11];
  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_DWORD *)(v1 + 40))
  {
    unint64_t v2 = 0;
    uint64_t v53 = v1;
    do
    {
      BOOL v56 = *(void **)(*(void *)(*((void *)WeakRetained + 25) + 24 * v2) + 8 * *(unsigned int *)(v1 + 44));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      unint64_t v3 = [*((id *)WeakRetained + 21) objectAtIndexedSubscript:v2 WeakRetained];
      obuint64_t j = [v3 objectAtIndexedSubscript:*(unsigned int *)(v1 + 44)];

      id v4 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (!v4) {
        goto LABEL_58;
      }
      unint64_t v54 = v2;
      uint64_t v55 = *(void *)v62;
      do
      {
        id v57 = v4;
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v62 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v61 + 1) + 8 * v5);
          unsigned int v7 = *(_DWORD *)(v6 + 16);
          unint64_t v8 = (void *)(*v56 + 24 * v7);
          unint64_t v9 = (char *)*v8;
          uint64_t v11 = (char **)(v8 + 1);
          unsigned int v10 = (char *)v8[1];
          uint64_t v58 = v5;
          if ((char *)*v8 != v10)
          {
            while (*(_DWORD *)v9 != *(_DWORD *)(v6 + 20))
            {
              v9 += 16;
              if (v9 == v10)
              {
                unint64_t v9 = (char *)v8[1];
                break;
              }
            }
          }
          uint64_t v13 = *(void *)(v6 + 48);
          uint64_t v12 = *(void *)(v6 + 56);
          if (v13 != v12)
          {
            uint64_t i = (char **)(*v56 + 24 * v7 + 16);
            long long v59 = i;
            uint64_t v60 = *(void *)(v6 + 56);
            do
            {
              if (v9 == *v11)
              {
                unint64_t v16 = (char *)*v8;
                uint64_t v17 = (uint64_t)&v9[-*v8];
                uint64_t v18 = v17 >> 4;
                unint64_t v15 = (char *)(*v8 + (v17 & 0xFFFFFFFFFFFFFFF0));
                unint64_t v19 = *i;
                if (v9 >= *i)
                {
                  double v25 = v8;
                  uint64_t v26 = v6;
                  uint64_t v27 = v18 + 1;
                  if ((unint64_t)(v18 + 1) >> 60) {
                    abort();
                  }
                  unint64_t v28 = v19 - v16;
                  unint64_t v29 = (v19 - v16) >> 3;
                  if (v29 <= v27) {
                    unint64_t v29 = v18 + 1;
                  }
                  if (v28 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v30 = v29;
                  }
                  if (v30)
                  {
                    uint64_t v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v30);
                  }
                  else
                  {
                    uint64_t v32 = 0;
                    uint64_t v31 = 0;
                  }
                  unsigned int v36 = &v32[16 * v18];
                  BOOL v37 = &v32[16 * v31];
                  if (v18 == v31)
                  {
                    if ((uint64_t)(v17 & 0xFFFFFFFFFFFFFFF0) < 1)
                    {
                      if ((unint64_t)v17 < 0x10) {
                        unint64_t v39 = 1;
                      }
                      else {
                        unint64_t v39 = (v17 >> 3) & 0xFFFFFFFFFFFFFFFELL;
                      }
                      long long v40 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v39);
                      unsigned int v36 = &v40[16 * (v39 >> 2)];
                      BOOL v37 = &v40[16 * v41];
                      if (v32)
                      {
                        unsigned int v42 = &v40[16 * v41];
                        operator delete(v32);
                        BOOL v37 = v42;
                      }
                    }
                    else
                    {
                      if (v27 >= 0) {
                        unint64_t v38 = v18 + 1;
                      }
                      else {
                        unint64_t v38 = v18 + 2;
                      }
                      v36 -= 16 * (v38 >> 1);
                    }
                  }
                  uint64_t v6 = v26;
                  *(_DWORD *)unsigned int v36 = *(_DWORD *)(v26 + 20);
                  *((void *)v36 + 1) = *(void *)(v13 + 8);
                  unint64_t v8 = v25;
                  BOOL v43 = (char *)*v25;
                  unsigned int v44 = v36;
                  if ((char *)*v25 != v15)
                  {
                    BOOL v45 = v15;
                    unint64_t v46 = v36;
                    do
                    {
                      unsigned int v44 = v46 - 16;
                      *((_OWORD *)v46 - 1) = *((_OWORD *)v45 - 1);
                      v45 -= 16;
                      v46 -= 16;
                    }
                    while (v45 != v43);
                  }
                  unsigned int v47 = v36 + 16;
                  BOOL v48 = *v11;
                  for (uint64_t i = v59; v15 != v48; v47 += 16)
                  {
                    long long v49 = *(_OWORD *)v15;
                    v15 += 16;
                    *(_OWORD *)unsigned int v47 = v49;
                  }
                  uint64_t v50 = (char *)*v8;
                  *unint64_t v8 = v44;
                  *uint64_t v11 = v47;
                  unsigned char *v59 = v37;
                  if (v50) {
                    operator delete(v50);
                  }
                  unint64_t v15 = v36;
                  uint64_t v12 = v60;
                  goto LABEL_55;
                }
                int v20 = *(_DWORD *)(v6 + 20);
                if (v15 != v9)
                {
                  uint64_t v21 = *(void *)(v13 + 8);
                  unsigned int v22 = v9 - 16;
                  unint64_t v23 = v9;
                  while (v22 < v9)
                  {
                    long long v24 = *(_OWORD *)v22;
                    v22 += 16;
                    *(_OWORD *)unint64_t v23 = v24;
                    v23 += 16;
                  }
                  *uint64_t v11 = v23;
                  if (v9 != v15 + 16)
                  {
                    uint64_t v33 = (v9 - (v15 + 16)) >> 4;
                    unint64_t v34 = v9 - 8;
                    uint64_t v35 = 16 * v33;
                    do
                    {
                      *((_DWORD *)v34 - 2) = *(_DWORD *)&v15[v35 - 16];
                      *(void *)unint64_t v34 = *(void *)&v15[v35 - 8];
                      v34 -= 16;
                      v35 -= 16;
                    }
                    while (v35);
                  }
                  *(_DWORD *)unint64_t v15 = v20;
                  *(void *)&v16[16 * v18 + 8] = v21;
                  goto LABEL_55;
                }
                *(_DWORD *)unint64_t v9 = v20;
                *(void *)&v16[16 * v18 + 8] = *(void *)(v13 + 8);
                *uint64_t v11 = v9 + 16;
              }
              else
              {
                *((double *)v9 + 1) = *(double *)(v13 + 8) + *((double *)v9 + 1);
              }
              unint64_t v15 = v9;
LABEL_55:
              v13 += 16;
              unint64_t v9 = v15;
            }
            while (v13 != v12);
          }
          uint64_t v5 = v58 + 1;
          uint64_t v1 = v53;
          unint64_t v2 = v54;
        }
        while ((id)(v58 + 1) != v57);
        id v4 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v4);
LABEL_58:

      ++v2;
    }
    while (v2 < *(unsigned int *)(v1 + 40));
  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _calculateAverageGPUCommandDuration];
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _calculateAggregatedEffectiveGPUEncoderCost];
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _calculateEffectiveGPUEncoderCostForFrameIndex:*(unsigned int *)(a1 + 40)];
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_7(uint64_t a1)
{
  unsigned int v18 = std::thread::hardware_concurrency();
  unint64_t v2 = v18 >> 1;
  uint64_t v19 = a1;
  int v20 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = 0;
  unint64_t v16 = v23;
  unint64_t v17 = v2 - 1;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v18 >> 1;
  }
  uint64_t v15 = v4;
  while (v3 < (unint64_t)objc_msgSend(WeakRetained[21], "count", v15, v16))
  {
    uint64_t v5 = [WeakRetained[21] objectAtIndexedSubscript:v3];
    unint64_t v6 = (unint64_t)[v5 count];

    if (v18 >= 2)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v15;
      unint64_t v9 = (v17 + v6) / (v18 >> 1);
      do
      {
        uint64_t v10 = v7 + 1;
        uint64_t v11 = (void *)v3;
        unint64_t v12 = v7 * v9;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        if (v6 >= (v7 + 1) * v9) {
          uint64_t v13 = (v7 + 1) * v9;
        }
        else {
          uint64_t v13 = v6;
        }
        v23[0] = __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_8;
        v23[1] = &unk_745C40;
        objc_copyWeak(v24, v20);
        v24[1] = (id)v12;
        v24[2] = (id)v13;
        unint64_t v3 = (unint64_t)v11;
        v24[3] = v11;
        uint64_t v14 = +[NSBlockOperation blockOperationWithBlock:v22];
        [WeakRetained[92] addOperation:v14];
        [*(id *)(v19 + 32) addDependency:v14];

        objc_destroyWeak(v24);
        uint64_t v7 = v10;
        --v8;
      }
      while (v8);
    }
    ++v3;
  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_8(uint64_t a1)
{
  uint64_t v1 = (void *)a1;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  for (unint64_t i = v1[5]; i < v1[6]; ++i)
  {
    unint64_t v3 = [WeakRetained[21] objectAtIndexedSubscript:v1[7]];
    uint64_t v4 = [v3 objectAtIndexedSubscript:i];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    obuint64_t j = v4;
    id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v7);
          uint64_t v9 = v8[1];
          if (v9)
          {
            uint64_t v10 = v1;
            unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(v9 + 16) + 24 * v1[7]) + 8 * i), (uint64_t)(v8[7] - v8[6]) >> 4);
            uint64_t v12 = v8[6];
            uint64_t v13 = v8[7];
            uint64_t v14 = [*(id *)(v8[1] + 8) uscSamples];
            [v14 replaceBytesInRange:16 * add withBytes:v13 - v12, v8[6]];

            uint64_t v1 = v10;
          }
          uint64_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
  }
}

- (void)_dumpLimiterBatchInfoCosts:(void *)a3 forRingBuffer:(unsigned int)a4 forFrame:(unsigned int)a5
{
  unsigned int v16 = a5;
  if (*((unsigned char *)self + 752))
  {
    id v6 = +[NSString stringWithFormat:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/perLimiterBatchCosts.txt", *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)self + 496, a5, &v16)+ 5), *(void *)&a4];
    uint64_t v7 = fopen((const char *)[v6 UTF8String], "wt");
    if (v7)
    {
      fwrite("Limiter Index : BatchIdx Cost\n", 0x1EuLL, 1uLL, v7);
      uint64_t v9 = *(void *)a3;
      uint64_t v8 = *((void *)a3 + 1);
      if (v8 != *(void *)a3)
      {
        unint64_t v10 = 0;
        do
        {
          if (*(void *)(v9 + 24 * v10) != *(void *)(v9 + 24 * v10 + 8))
          {
            fprintf(v7, "%lu: ", v10);
            uint64_t v11 = (double **)(*(void *)a3 + 24 * v10);
            uint64_t v12 = *v11;
            uint64_t v13 = (int *)v11[1];
            while (v12 != (double *)v13)
            {
              double v14 = v12[1];
              int v15 = *(_DWORD *)v12;
              v12 += 2;
              fprintf(v7, "\t%u %f, ", v15, v14);
            }
            fputc(10, v7);
            uint64_t v9 = *(void *)a3;
            uint64_t v8 = *((void *)a3 + 1);
          }
          ++v10;
        }
        while (v10 < 0xAAAAAAAAAAAAAAABLL * ((v8 - v9) >> 3));
      }
      fclose(v7);
    }
  }
}

- (void)_calculateAggregatedEffectiveGPUEncoderCost
{
  *((void *)self + 41) = *((void *)self + 40);
  unsigned int v3 = [*((id *)self + 20) encoderCount];
  if (!v3) {
    return;
  }
  unsigned int v4 = v3;
  unint64_t v5 = v3;
  uint64_t v7 = (unsigned char *)*((void *)self + 40);
  id v6 = (char *)*((void *)self + 41);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 3);
  unint64_t v9 = v3 - v8;
  unint64_t v74 = v3;
  if (v3 > v8)
  {
    uint64_t v10 = *((void *)self + 42);
    if (0x6DB6DB6DB6DB6DB7 * ((v10 - (uint64_t)v6) >> 3) < v9)
    {
      unint64_t v11 = 0x6DB6DB6DB6DB6DB7 * ((v10 - (uint64_t)v7) >> 3);
      unint64_t v12 = 0xDB6DB6DB6DB6DB6ELL * ((v10 - (uint64_t)v7) >> 3);
      if (v12 <= v3) {
        unint64_t v12 = v3;
      }
      if (v11 >= 0x249249249249249) {
        unint64_t v13 = 0x492492492492492;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13 > 0x492492492492492) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      uint64_t v14 = 56 * v13;
      int v15 = (char *)operator new(56 * v13);
      unsigned int v16 = &v15[8 * ((v6 - v7) >> 3)];
      long long v17 = &v15[v14];
      bzero(v16, 56 * ((56 * v9 - 56) / 0x38) + 56);
      long long v18 = &v16[56 * ((56 * v9 - 56) / 0x38) + 56];
      if (v6 != v7)
      {
        do
        {
          long long v19 = *(_OWORD *)(v6 - 56);
          long long v20 = *(_OWORD *)(v6 - 40);
          long long v21 = *(_OWORD *)(v6 - 24);
          *((void *)v16 - 1) = *((void *)v6 - 1);
          *(_OWORD *)(v16 - 24) = v21;
          *(_OWORD *)(v16 - 40) = v20;
          *(_OWORD *)(v16 - 56) = v19;
          v16 -= 56;
          v6 -= 56;
        }
        while (v6 != v7);
        id v6 = (char *)*((void *)self + 40);
      }
      *((void *)self + 40) = v16;
      *((void *)self + 41) = v18;
      *((void *)self + 42) = v17;
      unint64_t v5 = v74;
      if (v6) {
        operator delete(v6);
      }
      goto LABEL_19;
    }
    bzero(v6, 56 * ((56 * v9 - 56) / 0x38) + 56);
    unsigned int v22 = &v6[56 * ((56 * v9 - 56) / 0x38) + 56];
    goto LABEL_18;
  }
  if (v3 < v8)
  {
    unsigned int v22 = &v7[56 * v3];
LABEL_18:
    *((void *)self + 41) = v22;
  }
LABEL_19:
  uint64_t v23 = *((void *)self + 37);
  for (uint64_t i = *((void *)self + 38); v23 != i; v23 += 40)
  {
    for (uint64_t j = *(uint64_t **)(v23 + 16); j; uint64_t j = (uint64_t *)*j)
    {
      unsigned int v26 = *((_DWORD *)j + 4);
      if (v26 != -1)
      {
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        unsigned int v29 = v26 % v4;
        uint64_t v30 = *((void *)self + 40);
        do
        {
          uint64_t v31 = (double *)(v30 + 56 * v29 + 8 * v28);
          v31[3] = *(double *)&j[v27 + 6] + v31[3];
          double *v31 = *(double *)&j[v27 + 3] + *v31;
          ++v28;
          ++v27;
        }
        while (v27 != 3);
        ++*(_DWORD *)(v30 + 56 * v29 + 48);
      }
    }
  }
  BOOL v75 = +[NSMutableArray arrayWithCapacity:v5];
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  if (v4 <= 1) {
    uint64_t v34 = 1;
  }
  else {
    uint64_t v34 = v4;
  }
  do
  {
    uint64_t v35 = +[NSMutableArray arrayWithCapacity:3];
    for (uint64_t k = 0; k != 24; k += 8)
    {
      uint64_t v37 = *((void *)self + 40);
      unsigned int v38 = *(_DWORD *)(v37 + 56 * v33 + 48);
      if (v38)
      {
        unint64_t v39 = (double *)(v37 + v32 + k);
        double v40 = v39[3] / (double)v38;
        v39[3] = v40;
        double *v39 = *v39 / (double)v38;
      }
      else
      {
        double v40 = *(double *)(v37 + v32 + k + 24);
      }
      uint64_t v41 = +[NSNumber numberWithDouble:v40];
      [v35 addObject:v41];
    }
    [v75 addObject:v35];

    ++v33;
    v32 += 56;
  }
  while (v33 != v34);
  [*((id *)self + 20) setEffectiveKickTimes:v75];
  unint64_t v42 = v74;
  BOOL v43 = +[NSMutableArray arrayWithCapacity:v74];
  unsigned int v44 = +[NSMutableArray arrayWithCapacity:v74];
  unint64_t v45 = 0;
  p_cache = GTMTLReplayActivityLoadArchive.cache;
  uint64_t v73 = 8 * v74;
  while (v45 < (unint64_t)objc_msgSend(*((id *)self + 23), "count", v73))
  {
    unsigned int v47 = p_cache;
    uint64_t v48 = *((void *)self + 31);
    uint64_t v77 = *((void *)self + 34);
    long long v49 = std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v42);
    bzero(v49, v73);
    unsigned int v76 = std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v42);
    bzero(v76, v73);
    uint64_t v50 = *(double ****)(v48 + 24 * v45);
    unsigned int v51 = *(double ****)(v48 + 24 * v45 + 8);
    BOOL v52 = v49;
    for (p_cache = v47; v50 != v51; ++v50)
    {
      uint64_t v53 = **v50;
      uint64_t v54 = (char *)(*v50)[1] - (char *)v53;
      if (v54)
      {
        unint64_t v55 = v54 >> 3;
        if (v55 <= 1) {
          unint64_t v55 = 1;
        }
        BOOL v56 = (double *)v49;
        do
        {
          double v57 = *v53++;
          double *v56 = v57 + *v56;
          ++v56;
          --v55;
        }
        while (v55);
      }
    }
    uint64_t v58 = *(double ****)(v77 + 24 * v45);
    for (uint64_t m = *(double ****)(v77 + 24 * v45 + 8); v58 != m; ++v58)
    {
      uint64_t v60 = **v58;
      uint64_t v61 = (char *)(*v58)[1] - (char *)v60;
      if (v61)
      {
        unint64_t v62 = v61 >> 3;
        if (v62 <= 1) {
          unint64_t v62 = 1;
        }
        long long v63 = (double *)v76;
        do
        {
          double v64 = *v60++;
          *long long v63 = v64 + *v63;
          ++v63;
          --v62;
        }
        while (v62);
      }
    }
    for (uint64_t n = 0; n != v34; ++n)
    {
      if (!v45)
      {
        unsigned int v66 = objc_opt_new();
        [v43 addObject:v66];
      }
      unsigned int v67 = [v43 objectAtIndexedSubscript:n];
      BOOL v68 = v67;
      if (v67)
      {
        [v67 timing];
        [v68 timing];
      }
    }
    for (iuint64_t i = 0; ii != v34; ++ii)
    {
      if (!v45)
      {
        unsigned int v70 = objc_opt_new();
        [v44 addObject:v70];
      }
      unsigned int v71 = [v44 objectAtIndexedSubscript:ii];
      BOOL v72 = v71;
      if (v71)
      {
        [v71 timing];
        [v72 timing];
      }
    }
    if (v76) {
      operator delete(v76);
    }
    if (v52) {
      operator delete(v52);
    }
    ++v45;
    unint64_t v42 = v74;
  }
  [*((id *)self + 20) setLoadActionTimes:v43];
  [*((id *)self + 20) setStoreActionTimes:v44];
}

- (void)_calculateAverageGPUCommandDuration
{
  unint64_t v2 = self;
  unsigned int v3 = (char *)self + 344;
  unsigned int v4 = (char *)self + 416;
  unint64_t v5 = (char *)self + 344;
  do
  {
    *((void *)v5 + 1) = *(void *)v5;
    std::vector<double>::resize((char **)v5, *((unsigned int *)v2 + 26));
    v5 += 24;
  }
  while (v5 != v4);
  id v6 = [*((id *)v2 + 24) objectAtIndexedSubscript:0];
  unsigned int v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = +[NSMutableArray arrayWithCapacity:*((unsigned int *)v2 + 26)];
    [*((id *)v2 + 20) setAveragePerDrawKickDurations:v8];

    uint64_t v9 = *((unsigned int *)v2 + 26);
    uint64_t v10 = (long long *)operator new(0x30uLL);
    *uint64_t v10 = xmmword_4C8060;
    v10[1] = xmmword_4C8060;
    v10[2] = xmmword_4C8060;
    unsigned int v51 = 0;
    uint64_t v52 = 0;
    uint64_t v50 = 0;
    std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100](&v50, v7);
    unint64_t v11 = v51;
    unint64_t v12 = &v51[3 * v7];
    uint64_t v13 = 24 * v7;
    do
    {
      *unint64_t v11 = 0;
      v11[1] = 0;
      v11[2] = 0;
      std::vector<std::pair<unsigned long long,unsigned long long>>::__init_with_size[abi:nn180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>(v11, v10, v10 + 3, 3uLL);
      v11 += 3;
      v13 -= 24;
    }
    while (v13);
    unsigned int v51 = v12;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    unint64_t v55 = 0;
    long long v49 = v2;
    if (v9)
    {
      uint64_t v14 = operator new(24 * v9);
      int v15 = &v14[3 * v9];
      uint64_t v53 = v14;
      unint64_t v55 = v15;
      do
      {
        void *v14 = 0;
        v14[1] = 0;
        v14[2] = 0;
        unsigned int v16 = v50;
        long long v17 = v51;
        if (v51 != (void **)v50)
        {
          std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100](v14, 0xAAAAAAAAAAAAAAABLL * (((char *)v51 - (char *)v50) >> 3));
          uint64_t v18 = v14[1];
          do
          {
            *(void *)uint64_t v18 = 0;
            *(void *)(v18 + 8) = 0;
            *(void *)(v18 + 16) = 0;
            std::vector<std::pair<unsigned long long,unsigned long long>>::__init_with_size[abi:nn180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>((_OWORD *)v18, *v16, v16[1], v16[1] - *v16);
            v18 += 24;
            v16 += 3;
          }
          while (v16 != (long long **)v17);
          v14[1] = v18;
        }
        v14 += 3;
      }
      while (v14 != v15);
      uint64_t v54 = v15;
      unint64_t v2 = v49;
    }
    BOOL v56 = (void ***)&v50;
    std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v56);
    operator delete(v10);
    long long v19 = (uint64_t *)*((void *)v2 + 28);
    long long v20 = (uint64_t *)*((void *)v2 + 29);
    if (v19 != v20)
    {
      if (v7 <= 1) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = v7;
      }
      do
      {
        uint64_t v22 = 0;
        uint64_t v23 = *v19;
        do
        {
          uint64_t v24 = 0;
          uint64_t v25 = **(void **)(v23 + 8 * v22);
          unint64_t v26 = 0xCCCCCCCCCCCCCCCDLL * ((*(void *)(*(void *)(v23 + 8 * v22) + 8) - v25) >> 3);
          uint64_t v27 = v53;
          do
          {
            if (v24 == v26) {
              abort();
            }
            for (uint64_t i = *(uint64_t ***)(v25 + 40 * v24 + 16); i; uint64_t i = (uint64_t **)*i)
            {
              unsigned int v29 = (uint64_t *)(*(void *)(v27[3 * *((unsigned int *)i + 4)] + 24 * v22) + 16 * v24);
              uint64_t v30 = (uint64_t *)*v29;
              unint64_t v31 = v29[1];
              if ((unint64_t)i[3] < *v29) {
                uint64_t v30 = i[3];
              }
              uint64_t *v29 = (uint64_t)v30;
              unint64_t v32 = (unint64_t)i[4];
              if (v31 > v32) {
                unint64_t v32 = v31;
              }
              v29[1] = v32;
            }
            ++v24;
          }
          while (v24 != 3);
          ++v22;
        }
        while (v22 != v21);
        v19 += 3;
      }
      while (v19 != v20);
    }
    if (*((_DWORD *)v2 + 26))
    {
      unint64_t v33 = 0;
      if (v7 <= 1) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = v7;
      }
      double v35 = 1.0 / (double)v7;
      do
      {
        unsigned int v36 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3, v49);
        for (uint64_t j = 0; j != 3; ++j)
        {
          uint64_t v38 = 0;
          unint64_t v39 = (uint64_t *)v53[3 * v33];
          uint64_t v40 = v34;
          do
          {
            uint64_t v41 = *v39;
            v39 += 3;
            unint64_t v42 = (unint64_t *)(v41 + 16 * j);
            unint64_t v44 = *v42;
            unint64_t v43 = v42[1];
            BOOL v45 = v43 >= v44;
            unint64_t v46 = v43 - v44;
            if (!v45) {
              unint64_t v46 = 0;
            }
            v38 += v46;
            --v40;
          }
          while (v40);
          *(double *)(*(void *)&v3[24 * j] + 8 * v33) = v35 * (double)(125 * v38 / 3uLL);
          unsigned int v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v36 addObject:v47];
        }
        uint64_t v48 = [*((id *)v49 + 20) averagePerDrawKickDurations];
        [v48 addObject:v36];

        ++v33;
      }
      while (v33 < *((unsigned int *)v49 + 26));
    }
    uint64_t v50 = (long long **)&v53;
    std::vector<std::vector<std::vector<GRCInfo::MergeCounterData(NSArray *,NSArray*<NSArray*<NSString *>>,NSArray *,std::vector<std::unordered_map<unsigned int,GRCInfo::EncoderCounterInfo>> &,NSMutableDictionary<NSArray*,NSNumber *> *)::CounterValueData,std::allocator<GRCInfo::MergeCounterData(NSArray *,NSArray*<NSArray*<NSString *>>,NSArray *,std::vector<std::unordered_map<unsigned int,GRCInfo::EncoderCounterInfo>> &,NSMutableDictionary<NSArray*,NSNumber *> *)::CounterValueData>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v50);
  }
}

- (void)_dumpAggregatedGPUTimePerBatchForFrame:(unsigned int)a3
{
  unsigned int v58 = a3;
  if (*((unsigned char *)self + 752))
  {
    unsigned int v56 = [*((id *)self + 20) encoderCount];
    if (v56)
    {
      unint64_t v5 = +[NSString stringWithFormat:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/AggregatedEffectiveGPUTimePerBatch.txt", *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)self + 496, a3, &v58)+ 5)];
      id v6 = +[NSFileManager defaultManager];
      unsigned int v7 = [v5 stringByDeletingLastPathComponent];
      [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

      unint64_t end = v5;
      uint64_t v9 = fopen((const char *)[(id)end UTF8String], "wb");

      uint64_t v10 = *((void *)self + 37) + 40 * a3;
      memset(&v57, 0, sizeof(v57));
      std::vector<unsigned int>::reserve(&v57, *(void *)(v10 + 24));
      unint64_t v11 = *(uint64_t **)(v10 + 16);
      uint64_t v54 = (void *)(v10 + 16);
      begiuint64_t n = v57.__begin_;
      if (v11)
      {
        value = v57.__end_cap_.__value_;
        do
        {
          unsigned int v14 = *((_DWORD *)v11 + 4);
          if (v14 != -1)
          {
            unint64_t end = (unint64_t)v57.__end_;
            if (v57.__end_ >= value)
            {
              uint64_t v16 = v57.__end_ - begin;
              unint64_t v17 = v16 + 1;
              if ((unint64_t)(v16 + 1) >> 62)
              {
                v57.__end_cap_.__value_ = value;
                v57.__begin_ = begin;
                abort();
              }
              if (((char *)value - (char *)begin) >> 1 > v17) {
                unint64_t v17 = ((char *)value - (char *)begin) >> 1;
              }
              if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v18 = v17;
              }
              if (v18)
              {
                unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v18);
                unsigned int v14 = *((_DWORD *)v11 + 4);
              }
              else
              {
                uint64_t v19 = 0;
              }
              long long v20 = (unsigned int *)(v18 + 4 * v16);
              *long long v20 = v14;
              int v15 = v20 + 1;
              while ((unsigned int *)end != begin)
              {
                unsigned int v21 = *(_DWORD *)(end - 4);
                end -= 4;
                *--long long v20 = v21;
              }
              value = (unsigned int *)(v18 + 4 * v19);
              v57.__end_ = v15;
              if (begin) {
                operator delete(begin);
              }
              begiuint64_t n = v20;
            }
            else
            {
              *v57.__end_ = v14;
              end += 4;
              int v15 = (unsigned int *)end;
            }
            v57.__end_ = v15;
          }
          unint64_t v11 = (uint64_t *)*v11;
        }
        while (v11);
        v57.__end_cap_.__value_ = value;
        v57.__begin_ = begin;
      }
      std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
      std::vector<unsigned int>::pointer __p = v57.__begin_;
      std::vector<unsigned int>::pointer v55 = v57.__end_;
      if (v57.__begin_ != v57.__end_)
      {
        std::vector<unsigned int>::pointer v22 = v57.__begin_;
        while (1)
        {
          unint64_t v23 = *v22;
          unint64_t v24 = *(void *)(v10 + 8);
          if (v24)
          {
            uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              unint64_t end = *v22;
              if (v24 <= v23) {
                unint64_t end = v23 % v24;
              }
            }
            else
            {
              unint64_t end = (v24 - 1) & v23;
            }
            unint64_t v26 = *(void ***)(*(void *)v10 + 8 * end);
            if (v26)
            {
              uint64_t v27 = (char *)*v26;
              if (*v26)
              {
                do
                {
                  unint64_t v28 = *((void *)v27 + 1);
                  if (v28 == v23)
                  {
                    if (*((_DWORD *)v27 + 4) == v23) {
                      goto LABEL_100;
                    }
                  }
                  else
                  {
                    if (v25.u32[0] > 1uLL)
                    {
                      if (v28 >= v24) {
                        v28 %= v24;
                      }
                    }
                    else
                    {
                      v28 &= v24 - 1;
                    }
                    if (v28 != end) {
                      break;
                    }
                  }
                  uint64_t v27 = *(char **)v27;
                }
                while (v27);
              }
            }
          }
          uint64_t v27 = (char *)operator new(0x50uLL);
          *(void *)uint64_t v27 = 0;
          *((void *)v27 + 1) = v23;
          *((_DWORD *)v27 + 4) = *v22;
          *(_OWORD *)(v27 + 24) = 0u;
          *(_OWORD *)(v27 + 40) = 0u;
          *(_OWORD *)(v27 + 56) = 0u;
          *((void *)v27 + 9) = 0;
          float v29 = (float)(unint64_t)(*(void *)(v10 + 24) + 1);
          float v30 = *(float *)(v10 + 32);
          if (!v24 || (float)(v30 * (float)v24) < v29) {
            break;
          }
LABEL_90:
          unint64_t v46 = *(void **)v10;
          unsigned int v47 = *(void **)(*(void *)v10 + 8 * end);
          if (v47)
          {
            *(void *)uint64_t v27 = *v47;
          }
          else
          {
            *(void *)uint64_t v27 = *v54;
            *uint64_t v54 = v27;
            v46[end] = v54;
            if (!*(void *)v27) {
              goto LABEL_99;
            }
            unint64_t v48 = *(void *)(*(void *)v27 + 8);
            if ((v24 & (v24 - 1)) != 0)
            {
              if (v48 >= v24) {
                v48 %= v24;
              }
            }
            else
            {
              v48 &= v24 - 1;
            }
            unsigned int v47 = (void *)(*(void *)v10 + 8 * v48);
          }
          void *v47 = v27;
LABEL_99:
          ++*(void *)(v10 + 24);
          LODWORD(v23) = *v22;
LABEL_100:
          unint64_t end = 0;
          unsigned int v49 = v23 % v56;
          do
          {
            uint64_t v50 = (double *)&v27[8 * end];
            double v51 = v50[3];
            if (v51 > 2.22044605e-16) {
              fprintf(v9, "%u %u\t%f µs / %f µs = %f %% \n", v49, end, v50[6] * 0.001, v51 * 0.001, v50[6] * 100.0 / v51);
            }
            ++end;
          }
          while (end != 3);
          if (++v22 == v55) {
            goto LABEL_115;
          }
        }
        BOOL v31 = (v24 & (v24 - 1)) != 0;
        if (v24 < 3) {
          BOOL v31 = 1;
        }
        unint64_t v32 = v31 | (2 * v24);
        unint64_t v33 = vcvtps_u32_f32(v29 / v30);
        if (v32 <= v33) {
          int8x8_t prime = (int8x8_t)v33;
        }
        else {
          int8x8_t prime = (int8x8_t)v32;
        }
        if (*(void *)&prime == 1)
        {
          int8x8_t prime = (int8x8_t)2;
        }
        else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
        {
          int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        }
        unint64_t v24 = *(void *)(v10 + 8);
        if (*(void *)&prime > v24) {
          goto LABEL_56;
        }
        if (*(void *)&prime < v24)
        {
          unint64_t v41 = vcvtps_u32_f32((float)*(unint64_t *)(v10 + 24) / *(float *)(v10 + 32));
          if (v24 < 3 || (uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v24), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
          {
            unint64_t v41 = std::__next_prime(v41);
          }
          else
          {
            uint64_t v43 = 1 << -(char)__clz(v41 - 1);
            if (v41 >= 2) {
              unint64_t v41 = v43;
            }
          }
          if (*(void *)&prime <= v41) {
            int8x8_t prime = (int8x8_t)v41;
          }
          if (*(void *)&prime >= v24)
          {
            unint64_t v24 = *(void *)(v10 + 8);
          }
          else
          {
            if (prime)
            {
LABEL_56:
              if (*(void *)&prime >> 61) {
                std::__throw_bad_array_new_length[abi:nn180100]();
              }
              double v35 = operator new(8 * *(void *)&prime);
              unsigned int v36 = *(void **)v10;
              *(void *)uint64_t v10 = v35;
              if (v36) {
                operator delete(v36);
              }
              uint64_t v37 = 0;
              *(int8x8_t *)(v10 + 8) = prime;
              do
                *(void *)(*(void *)v10 + 8 * v37++) = 0;
              while (*(void *)&prime != v37);
              uint64_t v38 = (void *)*v54;
              if (*v54)
              {
                unint64_t v39 = v38[1];
                uint8x8_t v40 = (uint8x8_t)vcnt_s8(prime);
                v40.i16[0] = vaddlv_u8(v40);
                if (v40.u32[0] > 1uLL)
                {
                  if (v39 >= *(void *)&prime) {
                    v39 %= *(void *)&prime;
                  }
                }
                else
                {
                  v39 &= *(void *)&prime - 1;
                }
                *(void *)(*(void *)v10 + 8 * v39) = v54;
                unint64_t v44 = (void *)*v38;
                if (*v38)
                {
                  do
                  {
                    unint64_t v45 = v44[1];
                    if (v40.u32[0] > 1uLL)
                    {
                      if (v45 >= *(void *)&prime) {
                        v45 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v45 &= *(void *)&prime - 1;
                    }
                    if (v45 != v39)
                    {
                      if (!*(void *)(*(void *)v10 + 8 * v45))
                      {
                        *(void *)(*(void *)v10 + 8 * v45) = v38;
                        goto LABEL_81;
                      }
                      *uint64_t v38 = *v44;
                      void *v44 = **(void **)(*(void *)v10 + 8 * v45);
                      **(void **)(*(void *)v10 + 8 * v45) = v44;
                      unint64_t v44 = v38;
                    }
                    unint64_t v45 = v39;
LABEL_81:
                    uint64_t v38 = v44;
                    unint64_t v44 = (void *)*v44;
                    unint64_t v39 = v45;
                  }
                  while (v44);
                }
              }
              unint64_t v24 = (unint64_t)prime;
              goto LABEL_85;
            }
            uint64_t v52 = *(void **)v10;
            *(void *)uint64_t v10 = 0;
            if (v52) {
              operator delete(v52);
            }
            unint64_t v24 = 0;
            *(void *)(v10 + 8) = 0;
          }
        }
LABEL_85:
        if ((v24 & (v24 - 1)) != 0)
        {
          if (v24 <= v23) {
            unint64_t end = v23 % v24;
          }
          else {
            unint64_t end = v23;
          }
        }
        else
        {
          unint64_t end = (v24 - 1) & v23;
        }
        goto LABEL_90;
      }
LABEL_115:
      fclose(v9);
      if (__p) {
        operator delete(__p);
      }
    }
  }
}

- (void)_calculateAndAppendPerBatchCosts:(void *)a3 forFrameIndex:(unsigned int)a4 atTimestamp:(unint64_t)a5 withLimiterIndices:(void *)a6 withTimestampBuffers:(void *)a7 withActiveBatches:(const void *)a8 withPerRingBufferLimiterEncoderCosts:(void *)a9
{
  uint64_t v9 = *(void *)a6;
  if (*((void *)a6 + 1) != *(void *)a6)
  {
    unint64_t v11 = a5;
    unint64_t v13 = 0;
    do
    {
      unsigned int v14 = (void *)(*(void *)a3 + 40 * v13);
      if (v14[3])
      {
        int v15 = (void *)v14[2];
        if (v15)
        {
          do
          {
            uint64_t v16 = (void *)*v15;
            operator delete(v15);
            int v15 = v16;
          }
          while (v16);
        }
        v14[2] = 0;
        uint64_t v17 = v14[1];
        if (v17)
        {
          for (uint64_t i = 0; i != v17; ++i)
            *(void *)(*v14 + 8 * i) = 0;
        }
        v14[3] = 0;
        uint64_t v9 = *(void *)a6;
      }
      uint64_t v19 = (uint64_t *)(*(void *)a7 + 24 * v13);
      unint64_t v20 = *(unsigned int *)(v9 + 4 * v13);
      unint64_t v21 = v19[2];
      uint64_t v22 = *v19;
      if (v21 <= v20)
      {
        unsigned int v25 = *(_DWORD *)(v9 + 4 * v13);
        unint64_t v23 = v25;
      }
      else
      {
        unint64_t v23 = *(unsigned int *)(v9 + 4 * v13);
        unsigned int v24 = *(_DWORD *)(v9 + 4 * v13);
        while (*(void *)(v22 + 8 * v23) < v11)
        {
          unint64_t v23 = v24 + 1;
          unsigned int v24 = v23;
          unsigned int v25 = v23;
          if (v21 <= v23) {
            goto LABEL_17;
          }
        }
        unsigned int v25 = v24;
      }
LABEL_17:
      uint64_t v26 = *(void *)(v22 + 8 * v23);
      if (v26 == v11)
      {
        *(_DWORD *)(v9 + 4 * v13) = v25;
        double v27 = 1.0;
        LODWORD(v20) = v25;
      }
      else
      {
        double v27 = 0.0;
        if (v25 > v20)
        {
          LODWORD(v20) = v25 - 1;
          *(_DWORD *)(v9 + 4 * v13) = v25 - 1;
          uint64_t v28 = *(void *)(v22 + 8 * (v25 - 1));
          double v27 = (double)(v11 - v28) / (double)(unint64_t)(v26 - v28);
        }
      }
      float v29 = *(void **)(*(void *)a9 + 8 * v13);
      float v30 = (double *)operator new(0x20uLL);
      *(_DWORD *)float v30 = v20;
      v30[1] = 1.0 - v27;
      *((_DWORD *)v30 + 4) = v25;
      v30[3] = v27;
      BOOL v31 = (unsigned int *)(v30 + 4);
      std::vector<unsigned int>::pointer __p = v30;
      do
      {
        unint64_t v32 = *(unsigned int *)v30;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29[1] - *v29) >> 3) <= v32) {
          abort();
        }
        uint64_t v33 = *v29 + 24 * v32;
        double v35 = *(double **)v33;
        uint64_t v34 = *(unsigned int **)(v33 + 8);
        while (v35 != (double *)v34)
        {
          unint64_t v36 = *(unsigned int *)v35;
          if (v36 == -1)
          {
LABEL_43:
            double v44 = v35[1];
            double v45 = v30[1];
            unint64_t v46 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)(*(void *)a3 + 40 * v13), v36, v35);
            v46[3] = v46[3] + v44 * v45;
          }
          else
          {
            uint64_t v37 = (void *)(*(void *)a8 + 40 * v13);
            int8x8_t v38 = (int8x8_t)v37[1];
            if (v38)
            {
              uint8x8_t v39 = (uint8x8_t)vcnt_s8(v38);
              v39.i16[0] = vaddlv_u8(v39);
              if (v39.u32[0] > 1uLL)
              {
                unint64_t v40 = *(unsigned int *)v35;
                if (*(void *)&v38 <= v36) {
                  unint64_t v40 = v36 % *(void *)&v38;
                }
              }
              else
              {
                unint64_t v40 = (v38.i32[0] - 1) & v36;
              }
              unint64_t v41 = *(uint64_t ***)(*v37 + 8 * v40);
              if (v41)
              {
                for (uint64_t j = *v41; j; uint64_t j = (uint64_t *)*j)
                {
                  unint64_t v43 = j[1];
                  if (v43 == v36)
                  {
                    if (*((_DWORD *)j + 4) == v36) {
                      goto LABEL_43;
                    }
                  }
                  else
                  {
                    if (v39.u32[0] > 1uLL)
                    {
                      if (v43 >= *(void *)&v38) {
                        v43 %= *(void *)&v38;
                      }
                    }
                    else
                    {
                      v43 &= *(void *)&v38 - 1;
                    }
                    if (v43 != v40) {
                      break;
                    }
                  }
                }
              }
            }
          }
          v35 += 2;
        }
        v30 += 2;
      }
      while (v30 != (double *)v31);
      operator delete(__p);
      ++v13;
      uint64_t v9 = *(void *)a6;
      unint64_t v11 = a5;
    }
    while (v13 < (uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 2);
  }
}

- (void)evaluateStreamingSamples:(unint64_t *)a3 withUSCSampleNum:(unsigned int)a4 withProgramAddressLUT:(void *)a5 targetIndex:(int)a6 forRingBufferIndex:(unsigned int)a7 withMinEncoderIndex:(unsigned int)a8 withMaxEncoderIndex:(unsigned int)a9 withEncoderIdToEncoderIndexMap:(void *)a10 withProfilingData:(id)a11
{
  id v46 = a11;
  unint64_t v12 = *((void *)a10 + 3);
  if (v12 <= [*((id *)self + 20) encoderCount]
    && [*((id *)self + 21) count] > a7)
  {
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = __Block_byref_object_copy__3540;
    v52[4] = __Block_byref_object_dispose__3541;
    id v53 = 0;
    [v46 objectForKeyedSubscript:@"usc sample data thread offsets"];
    if (objc_claimAutoreleasedReturnValue())
    {
      std::mutex::lock((std::mutex *)((char *)self + 536));
      unint64_t v13 = [v46 objectForKeyedSubscript:@"frame index"];
      val = self;
      unsigned int v14 = [v13 unsignedIntValue];

      int v15 = self;
      uint64_t v16 = (uint64_t *)((char *)self + 416);
      uint64_t v17 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((void *)self + 52, v14);
      if (v17) {
        goto LABEL_44;
      }
      uint64_t v18 = *((void *)self + 55);
      unint64_t v19 = *((void *)self + 53);
      if (v19)
      {
        uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)v19);
        v20.i16[0] = vaddlv_u8(v20);
        if (v20.u32[0] > 1uLL)
        {
          self = (DYPMTLShaderProfilerHelper *)v14;
          if (v19 <= v14) {
            self = (DYPMTLShaderProfilerHelper *)(v14 % v19);
          }
        }
        else
        {
          self = (DYPMTLShaderProfilerHelper *)((v19 - 1) & v14);
        }
        unint64_t v21 = *(void ***)(*v16 + 8 * (void)self);
        if (v21)
        {
          uint64_t v17 = *v21;
          if (*v21)
          {
            do
            {
              unint64_t v22 = v17[1];
              if (v22 == v14)
              {
                if (*((_DWORD *)v17 + 4) == v14)
                {
                  int v15 = val;
                  goto LABEL_44;
                }
              }
              else
              {
                if (v20.u32[0] > 1uLL)
                {
                  if (v22 >= v19) {
                    v22 %= v19;
                  }
                }
                else
                {
                  v22 &= v19 - 1;
                }
                if ((DYPMTLShaderProfilerHelper *)v22 != self) {
                  break;
                }
              }
              uint64_t v17 = (void *)*v17;
            }
            while (v17);
          }
        }
      }
      uint64_t v17 = operator new(0x18uLL);
      *uint64_t v17 = 0;
      v17[1] = v14;
      *((_DWORD *)v17 + 4) = v14;
      *((_DWORD *)v17 + 5) = v18;
      float v23 = (float)(unint64_t)(v18 + 1);
      int v15 = val;
      float v24 = *((float *)val + 112);
      if (!v19 || (float)(v24 * (float)v19) < v23)
      {
        BOOL v25 = 1;
        if (v19 >= 3) {
          BOOL v25 = (v19 & (v19 - 1)) != 0;
        }
        unint64_t v26 = v25 | (2 * v19);
        unint64_t v27 = vcvtps_u32_f32(v23 / v24);
        if (v26 <= v27) {
          size_t v28 = v27;
        }
        else {
          size_t v28 = v26;
        }
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v16, v28);
        unint64_t v19 = *((void *)val + 53);
        if ((v19 & (v19 - 1)) != 0)
        {
          if (v19 <= v14) {
            self = (DYPMTLShaderProfilerHelper *)(v14 % v19);
          }
          else {
            self = (DYPMTLShaderProfilerHelper *)v14;
          }
        }
        else
        {
          self = (DYPMTLShaderProfilerHelper *)((v19 - 1) & v14);
        }
      }
      uint64_t v29 = *v16;
      float v30 = *(void **)(*v16 + 8 * (void)self);
      if (v30)
      {
        *uint64_t v17 = *v30;
      }
      else
      {
        *uint64_t v17 = *((void *)val + 54);
        *((void *)val + 54) = v17;
        *(void *)(v29 + 8 * (void)self) = (char *)val + 432;
        if (!*v17)
        {
LABEL_43:
          ++*((void *)val + 55);
LABEL_44:
          unsigned int v51 = *((_DWORD *)v17 + 5);
          *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v15 + 496, v51, &v51)+ 5) = v14;
          unint64_t v32 = [*((id *)v15 + 21) objectAtIndexedSubscript:a7];
          id v33 = [v32 count];
          uint64_t v34 = v51;
          BOOL v35 = (unint64_t)v33 > v51;

          if (!v35)
          {
            uint64_t v37 = [*((id *)val + 21) objectAtIndexedSubscript:a7];
            int8x8_t v38 = objc_opt_new();
            [v37 addObject:v38];

            uint8x8_t v39 = [*((id *)val + 22) objectAtIndexedSubscript:a7];
            unint64_t v40 = objc_opt_new();
            [v39 addObject:v40];

            unint64_t v41 = [*((id *)val + 23) objectAtIndexedSubscript:a7];
            uint8x8_t v42 = objc_opt_new();
            [v41 addObject:v42];

            unint64_t v43 = [*((id *)val + 24) objectAtIndexedSubscript:a7];
            double v44 = objc_opt_new();
            [v43 addObject:v44];

            operator new();
          }
          id v48 = [v46 objectForKeyedSubscript:@"limiter data"];
          [v48 length];
          id v50 = v48;
          [v50 bytes];
          double v45 = [*((id *)val + 22) objectAtIndexedSubscript:a7];
          [v45 setObject:v50 atIndexedSubscript:v34];

          operator new();
        }
        unint64_t v31 = *(void *)(*v17 + 8);
        if ((v19 & (v19 - 1)) != 0)
        {
          if (v31 >= v19) {
            v31 %= v19;
          }
        }
        else
        {
          v31 &= v19 - 1;
        }
        float v30 = (void *)(*v16 + 8 * v31);
      }
      void *v30 = v17;
      goto LABEL_43;
    }

    _Block_object_dispose(v52, 8);
  }
}

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([*(id *)(a1 + 32) dumpInstructions])
  {
    unint64_t v2 = +[NSString stringWithFormat:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/evaluateStreamingSamples_%lu.txt", *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)WeakRetained + 496, *(_DWORD *)(a1 + 120), (_DWORD *)(a1 + 120))+ 5), *(unsigned int *)(a1 + 124), *(void *)(a1 + 72)];
    unsigned int v3 = +[NSFileManager defaultManager];
    unsigned int v4 = [v2 stringByDeletingLastPathComponent];
    [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

    id v5 = v2;
    unint64_t v98 = fopen((const char *)[v5 UTF8String], "wt");
  }
  else
  {
    unint64_t v98 = 0;
  }
  int v6 = *(_DWORD *)(a1 + 128);
  memset(v105, 0, sizeof(v105));
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  memset(v117, 0, sizeof(v117));
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  memset(v121, 0, sizeof(v121));
  long long v123 = 0u;
  long long v124 = 0u;
  float v125 = 1.0;
  unint64_t v129 = 0;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v126 = 0u;
  float v130 = 1.0;
  BOOL v132 = v6 < 2;
  int v122 = 1050253722;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v121, 0x36uLL);
  if (*((void *)&v123 + 1)) {
    float v7 = (float)*((unint64_t *)&v124 + 1) / (float)*((unint64_t *)&v123 + 1);
  }
  else {
    float v7 = 0.0;
  }
  float v125 = fmaxf(v7, 0.3);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v123, vcvtps_u32_f32(16.0 / v125));
  std::vector<ShaderProfilerUSCSampleInfo>::reserve((void **)v117, 0x10uLL);
  if ((void)v128) {
    float v8 = (float)v129 / (float)(unint64_t)v128;
  }
  else {
    float v8 = 0.0;
  }
  float v130 = fmaxf(v8, 0.3);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v127 + 8, vcvtps_u32_f32(18.0 / v130));
  std::vector<std::vector<ProfileEvent>>::resize((uint64_t)&v126);
  std::vector<ShaderProfilerUSCSampleInfo>::reserve((void **)&v117[1] + 1, 0x10uLL);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  unint64_t v11 = (unsigned int *)(v10 + 8 * v9);
  unsigned int v12 = *v11;
  if (*v11 < v11[1])
  {
    while (1)
    {
      uint64_t v13 = *(void *)(a1 + 104);
      uint64_t v102 = v13;
      unint64_t v14 = *(void *)(v13 + 8 * v12);
      if (v14 == -1
        || (int v15 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(*(void **)(a1 + 112), *(void *)(v13 + 8 * v12))) == 0)
      {
        int v16 = -1;
      }
      else
      {
        int v16 = *((_DWORD *)v15 + 5);
      }
      int v100 = v16;
      unsigned int v17 = v12 + 1;
      uint64_t v18 = (v14 >> 30) & 0x1FC;
      unsigned int v19 = *(_DWORD *)(v10 + 8 * v9 + 4);
      unsigned int v97 = v18 + v12 + 1;
      if (v97 >= v19) {
        goto LABEL_127;
      }
      if (v18 && (v14 & 0x7F00000000) != 0) {
        break;
      }
LABEL_126:
      unsigned int v12 = v97;
      if (v97 >= v19) {
        goto LABEL_127;
      }
    }
    int v21 = 0;
    unint64_t v99 = v14 >> 39;
    uint64_t v101 = v12;
LABEL_21:
    int v103 = v21;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)(a1 + 104);
    unsigned int v24 = v17;
    do
    {
      uint64_t v25 = v23 + 8 * v24;
      unint64_t v26 = &v137[v22];
      _DWORD *v26 = *(void *)v25;
      v26[1] = *(_DWORD *)(v25 + 4);
      v22 += 2;
      ++v24;
    }
    while (v22 != 8);
    if ((v137[0] & 0xF) != 1) {
      goto LABEL_124;
    }
    int v115 = v100;
    int v116 = v99;
    uint64_t v131 = 0x1FFFFFFFFLL;
    unint64_t v27 = (void **)*((void *)&v109 + 1);
    *((void *)&v111 + 1) = 0;
    unint64_t v28 = v110 - *((void *)&v109 + 1);
    if ((void)v110 - *((void *)&v109 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v27);
        unint64_t v27 = (void **)(*((void *)&v109 + 1) + 8);
        *((void *)&v109 + 1) = v27;
        unint64_t v28 = v110 - (void)v27;
      }
      while ((void)v110 - (void)v27 > 0x10uLL);
    }
    if (v28 >> 3 == 1)
    {
      uint64_t v29 = 512;
    }
    else
    {
      if (v28 >> 3 != 2) {
        goto LABEL_31;
      }
      uint64_t v29 = 1024;
    }
    *(void *)&long long v111 = v29;
LABEL_31:
    float v30 = (void **)*((void *)&v112 + 1);
    *((void *)&v114 + 1) = 0;
    unint64_t v31 = v113 - *((void *)&v112 + 1);
    if ((void)v113 - *((void *)&v112 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v30);
        float v30 = (void **)(*((void *)&v112 + 1) + 8);
        *((void *)&v112 + 1) = v30;
        unint64_t v31 = v113 - (void)v30;
      }
      while ((void)v113 - (void)v30 > 0x10uLL);
    }
    if (v31 >> 3 == 1)
    {
      uint64_t v32 = 512;
    }
    else
    {
      if (v31 >> 3 != 2) {
        goto LABEL_38;
      }
      uint64_t v32 = 1024;
    }
    *(void *)&long long v114 = v32;
LABEL_38:
    id v33 = (void **)*((void *)&v118 + 1);
    *((void *)&v120 + 1) = 0;
    unint64_t v34 = v119 - *((void *)&v118 + 1);
    if ((void)v119 - *((void *)&v118 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v33);
        id v33 = (void **)(*((void *)&v118 + 1) + 8);
        *((void *)&v118 + 1) = v33;
        unint64_t v34 = v119 - (void)v33;
      }
      while ((void)v119 - (void)v33 > 0x10uLL);
    }
    if (v34 >> 3 == 1)
    {
      uint64_t v35 = 256;
    }
    else
    {
      if (v34 >> 3 != 2) {
        goto LABEL_45;
      }
      uint64_t v35 = 512;
    }
    *(void *)&long long v120 = v35;
LABEL_45:
    unint64_t v36 = (void **)*((void *)&v106 + 1);
    *((void *)&v108 + 1) = 0;
    unint64_t v37 = v107 - *((void *)&v106 + 1);
    if ((void)v107 - *((void *)&v106 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v36);
        unint64_t v36 = (void **)(*((void *)&v106 + 1) + 8);
        *((void *)&v106 + 1) = v36;
        unint64_t v37 = v107 - (void)v36;
      }
      while ((void)v107 - (void)v36 > 0x10uLL);
    }
    if (v37 >> 3 == 1)
    {
      uint64_t v38 = 256;
    }
    else
    {
      if (v37 >> 3 != 2)
      {
LABEL_52:
        uint64_t v39 = *((void *)&v126 + 1);
        uint64_t v40 = v126;
        if (*((void *)&v126 + 1) != (void)v126)
        {
          uint64_t v41 = *((void *)&v126 + 1);
          do
          {
            unint64_t v43 = *(void **)(v41 - 24);
            v41 -= 24;
            uint8x8_t v42 = v43;
            if (v43)
            {
              *(void *)(v39 - 16) = v42;
              operator delete(v42);
            }
            uint64_t v39 = v41;
          }
          while (v41 != v40);
        }
        *((void *)&v126 + 1) = v40;
        std::vector<std::vector<ProfileEvent>>::resize((uint64_t)&v126);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(v121);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(&v123);
        *((void *)&v117[0] + 1) = *(void *)&v117[0];
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear((void *)&v127 + 1);
        unint64_t v44 = 0;
        uint64_t v104 = 0;
        char v45 = 1;
        while (1)
        {
          unsigned int v46 = v137[v44];
          if (v46)
          {
            if (v44)
            {
              if (v132) {
                ProfileEventHelper::ProcessQueueLegacy((ProfileEventHelper *)&v104);
              }
              else {
                ProfileEventHelper::ProcessQueue((ProfileEventHelper *)&v104);
              }
              if (v44 == 7)
              {
LABEL_75:
                if (v132) {
                  ProfileEventHelper::ProcessQueueLegacy((ProfileEventHelper *)&v104);
                }
                else {
                  ProfileEventHelper::ProcessQueue((ProfileEventHelper *)&v104);
                }
                if ([*(id *)(a1 + 32) dumpInstructions]) {
                  [*(id *)(a1 + 32) _dumpTraceBufferPacketsInFile:v98 usingTracePackets:v137 withExtractedSamples:v117 withTraceBufferCount:++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) forTargetIndex:*(unsigned int *)(a1 + 128)];
                }
                unsigned int v49 = (int *)*((void *)&v117[0] + 1);
                for (uint64_t i = *(unsigned int **)&v117[0]; i != (unsigned int *)v49; i += 10)
                {
                  unsigned int v51 = *i;
                  BOOL v52 = *i != -1 || i[3] == -1;
                  if (v52
                    && v51 <= *(_DWORD *)(a1 + 132)
                    && (v53 = *(_DWORD *)(a1 + 136), BOOL v48 = v51 >= v53, v54 = v51 - v53, v48))
                  {
                    unsigned int v76 = (void **)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48)
                                              + 24 * *(void *)(a1 + 72))
                                  + 24 * v54);
                    unint64_t v78 = v76 + 1;
                    uint64_t v77 = (char *)v76[1];
                    uint8x8_t v79 = (char *)v76[2];
                    if (v77 >= v79)
                    {
                      unint64_t v83 = 0xCCCCCCCCCCCCCCCDLL * ((v77 - (unsigned char *)*v76) >> 3);
                      unint64_t v84 = v83 + 1;
                      if (v83 + 1 > 0x666666666666666) {
LABEL_130:
                      }
                        abort();
                      unint64_t v85 = 0xCCCCCCCCCCCCCCCDLL * ((v79 - (unsigned char *)*v76) >> 3);
                      if (2 * v85 > v84) {
                        unint64_t v84 = 2 * v85;
                      }
                      if (v85 >= 0x333333333333333) {
                        unint64_t v86 = 0x666666666666666;
                      }
                      else {
                        unint64_t v86 = v84;
                      }
                      if (v86) {
                        unint64_t v86 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v86);
                      }
                      else {
                        uint64_t v87 = 0;
                      }
                      unint64_t v88 = v86 + 40 * v83;
                      long long v89 = *(_OWORD *)i;
                      long long v90 = *((_OWORD *)i + 1);
                      *(void *)(v88 + 32) = *((void *)i + 4);
                      *(_OWORD *)unint64_t v88 = v89;
                      *(_OWORD *)(v88 + 16) = v90;
                      BOOL v91 = (char *)*v78;
                      BOOL v92 = (char *)*v76;
                      unint64_t v93 = v88;
                      if (*v78 != *v76)
                      {
                        do
                        {
                          long long v94 = *(_OWORD *)(v91 - 40);
                          long long v95 = *(_OWORD *)(v91 - 24);
                          *(void *)(v93 - 8) = *((void *)v91 - 1);
                          *(_OWORD *)(v93 - 24) = v95;
                          *(_OWORD *)(v93 - 40) = v94;
                          v93 -= 40;
                          v91 -= 40;
                        }
                        while (v91 != v92);
                        BOOL v91 = (char *)*v76;
                      }
                      *unsigned int v76 = (void *)v93;
                      unint64_t v82 = (void *)(v88 + 40);
                      *unint64_t v78 = (void *)(v88 + 40);
                      v76[2] = (void *)(v86 + 40 * v87);
                      if (v91) {
                        operator delete(v91);
                      }
                    }
                    else
                    {
                      long long v80 = *(_OWORD *)i;
                      long long v81 = *((_OWORD *)i + 1);
                      *((void *)v77 + 4) = *((void *)i + 4);
                      *(_OWORD *)uint64_t v77 = v80;
                      *((_OWORD *)v77 + 1) = v81;
                      unint64_t v82 = v77 + 40;
                    }
                    *unint64_t v78 = v82;
                  }
                  else
                  {
                    std::vector<unsigned int>::pointer v55 = (unint64_t *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48)
                                             + 24 * *(void *)(a1 + 72));
                    std::vector<unsigned int> v57 = (void **)(v55 + 1);
                    unint64_t v56 = v55[1];
                    long long v59 = v55 + 2;
                    unint64_t v58 = v55[2];
                    if (v56 >= v58)
                    {
                      unint64_t v63 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v56 - *v55) >> 3);
                      unint64_t v64 = v63 + 1;
                      if (v63 + 1 > 0x666666666666666) {
                        goto LABEL_130;
                      }
                      unint64_t v65 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v58 - *v55) >> 3);
                      if (2 * v65 > v64) {
                        unint64_t v64 = 2 * v65;
                      }
                      if (v65 >= 0x333333333333333) {
                        unint64_t v66 = 0x666666666666666;
                      }
                      else {
                        unint64_t v66 = v64;
                      }
                      if (v66) {
                        unint64_t v66 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v66);
                      }
                      else {
                        uint64_t v67 = 0;
                      }
                      unint64_t v68 = v66 + 40 * v63;
                      long long v69 = *(_OWORD *)i;
                      long long v70 = *((_OWORD *)i + 1);
                      *(void *)(v68 + 32) = *((void *)i + 4);
                      *(_OWORD *)unint64_t v68 = v69;
                      *(_OWORD *)(v68 + 16) = v70;
                      unsigned int v71 = (char *)*v57;
                      BOOL v72 = (char *)*v55;
                      unint64_t v73 = v68;
                      if (*v57 != (void *)*v55)
                      {
                        do
                        {
                          long long v74 = *(_OWORD *)(v71 - 40);
                          long long v75 = *(_OWORD *)(v71 - 24);
                          *(void *)(v73 - 8) = *((void *)v71 - 1);
                          *(_OWORD *)(v73 - 24) = v75;
                          *(_OWORD *)(v73 - 40) = v74;
                          v73 -= 40;
                          v71 -= 40;
                        }
                        while (v71 != v72);
                        unsigned int v71 = (char *)*v55;
                      }
                      *std::vector<unsigned int>::pointer v55 = v73;
                      unint64_t v62 = (void *)(v68 + 40);
                      char *v57 = (void *)(v68 + 40);
                      void *v59 = v66 + 40 * v67;
                      if (v71) {
                        operator delete(v71);
                      }
                    }
                    else
                    {
                      long long v60 = *(_OWORD *)i;
                      long long v61 = *((_OWORD *)i + 1);
                      *(void *)(v56 + 32) = *((void *)i + 4);
                      *(_OWORD *)unint64_t v56 = v60;
                      *(_OWORD *)(v56 + 16) = v61;
                      unint64_t v62 = (void *)(v56 + 40);
                    }
                    char *v57 = v62;
                  }
                }
LABEL_124:
                int v21 = v103 + 1;
                v17 += 4;
                if (v103 + 1 >= (*(_DWORD *)(v102 + 8 * v101 + 4) & 0x7Fu))
                {
                  uint64_t v9 = *(void *)(a1 + 72);
                  uint64_t v10 = *(void *)(a1 + 80);
                  unsigned int v19 = *(_DWORD *)(v10 + 8 * v9 + 4);
                  goto LABEL_126;
                }
                goto LABEL_21;
              }
              char v45 = 1;
            }
            LODWORD(v131) = v137[++v44];
          }
          else if ((v137[v44] & 3) == 2)
          {
            int v135 = (v46 >> 5) & 0xFFF;
            int v136 = (v46 >> 2) & 7;
            std::deque<ProfileEvent>::emplace_back<unsigned int &,unsigned int &>(v105, &v135, &v136);
            if (v45)
            {
              if (((v46 >> 5) & 0xFFF) <= 1) {
                int v47 = 1;
              }
              else {
                int v47 = (v46 >> 5) & 0xFFF;
              }
              HIDWORD(v131) = v47;
            }
            unsigned int v133 = v46 >> 20;
            int v134 = (v46 >> 17) & 7;
            std::deque<ProfileEvent>::emplace_back<unsigned int &,unsigned int &>(v105, &v133, &v134);
            char v45 = 0;
          }
          BOOL v48 = v44++ >= 7;
          if (v48) {
            goto LABEL_75;
          }
        }
      }
      uint64_t v38 = 512;
    }
    *(void *)&long long v108 = v38;
    goto LABEL_52;
  }
LABEL_127:
  if ([*(id *)(a1 + 32) dumpInstructions]) {
    fclose(v98);
  }
  ProfileEventHelper::~ProfileEventHelper((ProfileEventHelper *)&v104);
}

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_599(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 88))
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        std::vector<ShaderProfilerUSCSampleInfo>::reserve((void **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) + v2), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48)+ 24 * *(void *)(a1 + 72)+ 8)- *(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48)+ 24 * *(void *)(a1 + 72))) >> 3)* *(void *)(a1 + 80));
      }
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) + v2;
      id v5 = (char **)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48)
                               + 24 * *(void *)(a1 + 72))
                   + v2);
      std::vector<ShaderProfilerUSCSampleInfo>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ShaderProfilerUSCSampleInfo*>,std::__wrap_iter<ShaderProfilerUSCSampleInfo*>>(v4, *(char **)(v4 + 8), *v5, v5[1], 0xCCCCCCCCCCCCCCCDLL * ((v5[1] - *v5) >> 3));
      ++v3;
      v2 += 24;
    }
    while (v3 < *(unsigned int *)(a1 + 88));
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = v6 + 48;
  float v8 = *(char **)(v6 + 56);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) + 24 * *(void *)(a1 + 72);
  uint64_t v10 = *(char **)v9;
  unint64_t v11 = *(char **)(v9 + 8);
  uint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v11[-*(void *)v9] >> 3);

  std::vector<ShaderProfilerUSCSampleInfo>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ShaderProfilerUSCSampleInfo*>,std::__wrap_iter<ShaderProfilerUSCSampleInfo*>>(v7, v8, v10, v11, v12);
}

- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(unint64_t)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[2] - *a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667) {
      abort();
    }
    std::__split_buffer<-[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:]::ThreadRangeInfo>::__split_buffer(&v10, a2, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[1] - *a1) >> 3), (uint64_t)(a1 + 2));
    uint64_t v4 = (char *)*a1;
    unint64_t v3 = (char *)a1[1];
    id v5 = v11;
    if (v3 == (char *)*a1)
    {
      float v8 = (char *)a1[1];
    }
    else
    {
      do
      {
        long long v6 = *(_OWORD *)(v3 - 40);
        long long v7 = *(_OWORD *)(v3 - 24);
        *((void *)v5 - 1) = *((void *)v3 - 1);
        *(_OWORD *)(v5 - 24) = v7;
        *(_OWORD *)(v5 - 40) = v6;
        v5 -= 40;
        v3 -= 40;
      }
      while (v3 != v4);
      float v8 = (char *)*a1;
      unint64_t v3 = (char *)a1[1];
    }
    *a1 = v5;
    uint64_t v9 = a1[2];
    *(_OWORD *)(a1 + 1) = v12;
    *(void *)&long long v12 = v3;
    *((void *)&v12 + 1) = v9;
    uint64_t v10 = v8;
    unint64_t v11 = v8;
    if (v3 != v8) {
      *(void *)&long long v12 = &v8[(v3 - v8 - 40) % 0x28uLL];
    }
    if (v8) {
      operator delete(v8);
    }
  }
}

- (void)evaluateStreamingSamples:(uint64_t)a3 withUSCSampleNum:(uint64_t)a4 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x666666666666667) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    long long v7 = (char *)operator new(40 * a2);
  }
  else
  {
    long long v7 = 0;
  }
  float v8 = &v7[40 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[40 * a2];
  return a1;
}

- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(long long *)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  uint64_t v4 = (char *)a1[2];
  id v5 = (char *)a1[1];
  if (v5 >= v4)
  {
    uint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (unsigned char *)*a1) >> 3);
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) > 0x666666666666666) {
      abort();
    }
    unint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((v4 - (unsigned char *)*a1) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x333333333333333) {
      unint64_t v12 = 0x666666666666666;
    }
    else {
      unint64_t v12 = v10;
    }
    std::__split_buffer<-[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:]::ThreadRangeInfo>::__split_buffer(&v23, v12, v9, (uint64_t)(a1 + 2));
    uint64_t v13 = v25;
    long long v14 = *a2;
    long long v15 = a2[1];
    *((void *)v25 + 4) = *((void *)a2 + 4);
    *(_OWORD *)uint64_t v13 = v14;
    *((_OWORD *)v13 + 1) = v15;
    int v16 = v24;
    float v8 = v25 + 40;
    v25 += 40;
    uint64_t v18 = (char *)*a1;
    unsigned int v17 = (char *)a1[1];
    if (v17 == *a1)
    {
      int v21 = (char *)a1[1];
    }
    else
    {
      do
      {
        long long v19 = *(_OWORD *)(v17 - 40);
        long long v20 = *(_OWORD *)(v17 - 24);
        *((void *)v16 - 1) = *((void *)v17 - 1);
        *(_OWORD *)(v16 - 24) = v20;
        *(_OWORD *)(v16 - 40) = v19;
        v16 -= 40;
        v17 -= 40;
      }
      while (v17 != v18);
      int v21 = (char *)*a1;
      unsigned int v17 = (char *)a1[1];
      float v8 = v25;
    }
    *a1 = v16;
    a1[1] = v8;
    uint64_t v22 = a1[2];
    a1[2] = v26;
    uint64_t v25 = v17;
    unint64_t v26 = v22;
    uint64_t v23 = v21;
    unsigned int v24 = v21;
    if (v17 != v21) {
      uint64_t v25 = &v21[(v17 - v21 - 40) % 0x28uLL];
    }
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    long long v6 = *a2;
    long long v7 = a2[1];
    *((void *)v5 + 4) = *((void *)a2 + 4);
    *(_OWORD *)id v5 = v6;
    *((_OWORD *)v5 + 1) = v7;
    float v8 = v5 + 40;
  }
  a1[1] = v8;
}

uint64_t __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_607(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 56);
  while (v2 != v3)
  {
    uint64_t v4 = *(double **)v2;
    uint64_t v5 = *(void *)(v2 + 8) - *(void *)v2;
    if (v5)
    {
      unint64_t v6 = v5 >> 3;
      long long v7 = **(double ***)(result + 48);
      if (v6 <= 1) {
        unint64_t v6 = 1;
      }
      do
      {
        double v8 = *v4++;
        *long long v7 = v8 + *v7;
        ++v7;
        --v6;
      }
      while (v6);
    }
    v2 += 24;
  }
  uint64_t v9 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v10 = *(void *)(v9 + 48);
  uint64_t v11 = *(void *)(v9 + 56);
  while (v10 != v11)
  {
    unint64_t v12 = *(double **)v10;
    uint64_t v13 = *(void *)(v10 + 8) - *(void *)v10;
    if (v13)
    {
      unint64_t v14 = v13 >> 3;
      long long v15 = **(double ***)(result + 56);
      if (v14 <= 1) {
        unint64_t v14 = 1;
      }
      do
      {
        double v16 = *v12++;
        double *v15 = v16 + *v15;
        ++v15;
        --v14;
      }
      while (v14);
    }
    v10 += 24;
  }
  return result;
}

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_2(unint64_t a1)
{
  unint64_t v1 = a1;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v2 = *(uint64_t ***)(v1 + 88);
  uint64_t v3 = *v2;
  unint64_t v152 = v2[1];
  if (*v2 != v152)
  {
    unsigned int v4 = *(_DWORD *)(v1 + 168);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 32) + 8) + 48) + 40 * v4;
    uint64_t v157 = (void *)(*(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 48) + 24 * v4);
    uint64_t v150 = v1 + 112;
    uint64_t v151 = WeakRetained + 464;
    unint64_t v149 = v1 + 72;
    unint64_t v148 = v1 + 64;
    uint64_t v156 = (float **)(v5 + 16);
    unint64_t v165 = v1;
    uint64_t v159 = v5;
    while (1)
    {
      unsigned int v6 = *((_DWORD *)v3 + 2);
      unsigned int v172 = v6;
      long long v7 = std::__hash_table<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(*(void *)(v1 + 96), v6, &v172);
      unsigned int v8 = *((_DWORD *)v3 + 4);
      uint64_t v166 = *(void *)(v7[3] + 8 * *((unsigned int *)v3 + 3));
      unsigned int v171 = v8;
      unsigned int v9 = *(_DWORD *)(v1 + 172);
      if (v8 < v9) {
        unsigned int v9 = v8;
      }
      uint64_t v10 = (void *)(**(void **)(v1 + 104) + 40 * v9);
      unint64_t v11 = *v3;
      int8x8_t v12 = (int8x8_t)v10[1];
      if (v12)
      {
        uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
        v13.i16[0] = vaddlv_u8(v13);
        if (v13.u32[0] > 1uLL)
        {
          unint64_t v14 = *v3;
          if (v11 >= *(void *)&v12) {
            unint64_t v14 = v11 % *(void *)&v12;
          }
        }
        else
        {
          unint64_t v14 = (*(void *)&v12 - 1) & v11;
        }
        uint64_t i = *(void **)(*v10 + 8 * v14);
        if (i)
        {
          for (uint64_t i = (void *)*i; i; uint64_t i = (void *)*i)
          {
            unint64_t v16 = i[1];
            if (v16 == v11)
            {
              if (i[2] == v11) {
                break;
              }
            }
            else
            {
              if (v13.u32[0] > 1uLL)
              {
                if (v16 >= *(void *)&v12) {
                  v16 %= *(void *)&v12;
                }
              }
              else
              {
                v16 &= *(void *)&v12 - 1;
              }
              if (v16 != v14) {
                goto LABEL_22;
              }
            }
          }
        }
      }
      else
      {
LABEL_22:
        uint64_t i = 0;
      }
      uint64_t v17 = *((unsigned int *)v3 + 5);
      uint64_t v18 = (void **)(i + 3);
      uint64_t v19 = v150;
      if (!i) {
        uint64_t v18 = (void **)v150;
      }
      if (v17 <= 3) {
        uint64_t v19 = *(void *)(**(void **)(v1 + 144) + 24 * v8) + 32 * v17;
      }
      if (v11 == -1) {
        long long v20 = (void **)v19;
      }
      else {
        long long v20 = v18;
      }
      uint64_t v162 = v20;
      int v21 = *v20;
      if (v21) {
        int v21 = (void *)v21[1];
      }
      unint64_t v154 = v21;
      uint64_t v22 = [v154 binary];

      int v153 = v17;
      long long v161 = v22
           ? std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]((void *)WeakRetained + 14, (uint64_t)(v162 + 1)): 0;
      unsigned int v23 = *((_DWORD *)v3 + 6);
      unsigned int v24 = *((_DWORD *)v3 + 7);
      unint64_t v155 = v3;
      if (v23 != v24) {
        break;
      }
LABEL_36:

      uint64_t v3 = v155 + 5;
      if (v155 + 5 == v152) {
        goto LABEL_221;
      }
    }
    uint64_t v25 = *(void *)(*(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 48) + 24 * (v6 - *(_DWORD *)(v1 + 176)));
    unint64_t v164 = (_DWORD *)(v25 + 40 * v24);
    unint64_t v26 = (_DWORD *)(v25 + 40 * v23);
    uint64_t v27 = *((unsigned int *)v3 + 8);
    unsigned int v163 = v17 - 1;
    int v158 = v17 << 28;
    unint64_t v160 = v22;
    while (1)
    {
      if (!v22)
      {
        int v40 = 0;
        unint64_t v34 = 0;
        double v38 = 1.0;
        goto LABEL_135;
      }
      uint64_t TargetClauseAnalysis = GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(**((GPUToolsPlatformLLVMShaderProfilerHelperImpl ***)v161 + 5));
      uint64_t v29 = *(void **)TargetClauseAnalysis;
      float v30 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((void *)(*(void *)TargetClauseAnalysis + 56), (v26[3] - *(_DWORD *)(v166 + 8)));
      if (!v30) {
        goto LABEL_191;
      }
      unsigned int v31 = *((_DWORD *)v30 + 6);
      if (v31 == -1) {
        goto LABEL_191;
      }
      uint64_t v32 = *v29 + 88 * *(void *)(v29[3] + 48 * v31 + 8 * v26[8]);
      uint64_t v35 = *(int **)(v32 + 64);
      unint64_t v34 = (int **)(v32 + 64);
      id v33 = v35;
      unint64_t v37 = v34 + 1;
      unint64_t v36 = v34[1];
      double v38 = 1.0;
      if (v35 != v36 && (unint64_t)((char *)v36 - (char *)v33) <= 0x2F && *(void *)(v1 + 152) != 0)
      {
        double v38 = 0.0;
        switch(v33[3])
        {
          case 6:
          case 7:
          case 8:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
            [WeakRetained _latencyAdjustmentFactorWithLimiterData:forIndex:withLimiterTypeIndexMap:forLimiterType:];
            goto LABEL_55;
          case 9:
            [WeakRetained _latencyAdjustmentFactorWithLimiterData:forIndex:withLimiterTypeIndexMap:forLimiterTypeLoad:forLimiterTypeStore:];
            goto LABEL_55;
          case 15:
            goto LABEL_53;
          case 17:
            [WeakRetained _waitLatencyAdjustmentWithLimiterData:forIndex:withLimiterTypeIndexMap:];
            goto LABEL_55;
          case 18:
          case 19:
            break;
          default:
            int v42 = v33[2];
            if (v42 == 3)
            {
LABEL_53:
              [WeakRetained _latencyAdjustmentFactorWithLimiterDataWithLerp:forIndex:withLimiterTypeIndexMap:forLimiterType:];
            }
            else
            {
              double v38 = 1.0;
              if (v42 != 4) {
                break;
              }
              [WeakRetained _latencyAdjustmentWithLimiterData:forIndex:withLimiterTypeIndexMap:];
            }
LABEL_55:
            double v38 = v41;
            break;
        }
      }
      unint64_t v43 = *v34;
      if (*v34 == *v37)
      {
        int v40 = 0;
      }
      else
      {
        int v40 = 0;
        do
        {
          v40 += v43[1];
          v43 += 4;
        }
        while (v43 != *v37);
      }
      unint64_t v44 = **(void **)TargetClauseAnalysis
          + 88
          * *(void *)(*(void *)(*(void *)TargetClauseAnalysis + 24) + 48 * v31 + 8 * v26[8]);
      unint64_t v45 = *(void *)(v5 + 8);
      if (v45)
      {
        uint8x8_t v46 = (uint8x8_t)vcnt_s8((int8x8_t)v45);
        v46.i16[0] = vaddlv_u8(v46);
        if (v46.u32[0] > 1uLL)
        {
          unint64_t v47 = v44;
          if (v45 <= v44) {
            unint64_t v47 = v44 % v45;
          }
        }
        else
        {
          unint64_t v47 = (v45 - 1) & v44;
        }
        BOOL v48 = *(void ***)(*(void *)v5 + 8 * v47);
        if (v48)
        {
          unsigned int v49 = (float *)*v48;
          if (*v48)
          {
            do
            {
              unint64_t v50 = *((void *)v49 + 1);
              if (v50 == v44)
              {
                if (*((void *)v49 + 2) == v44) {
                  goto LABEL_119;
                }
              }
              else
              {
                if (v46.u32[0] > 1uLL)
                {
                  if (v50 >= v45) {
                    v50 %= v45;
                  }
                }
                else
                {
                  v50 &= v45 - 1;
                }
                if (v50 != v47) {
                  break;
                }
              }
              unsigned int v49 = *(float **)v49;
            }
            while (v49);
          }
        }
        long long v168 = 0u;
        long long v169 = 0u;
        int v170 = 1065353216;
        if (v46.u32[0] > 1uLL)
        {
          unint64_t v1 = v44;
          if (v45 <= v44) {
            unint64_t v1 = v44 % v45;
          }
        }
        else
        {
          unint64_t v1 = (v45 - 1) & v44;
        }
        unsigned int v51 = *(void ***)(*(void *)v5 + 8 * v1);
        if (v51)
        {
          unsigned int v49 = (float *)*v51;
          if (*v51)
          {
            do
            {
              unint64_t v52 = *((void *)v49 + 1);
              if (v52 == v44)
              {
                if (*((void *)v49 + 2) == v44)
                {
                  unint64_t v1 = v165;
                  goto LABEL_115;
                }
              }
              else
              {
                if (v46.u32[0] > 1uLL)
                {
                  if (v52 >= v45) {
                    v52 %= v45;
                  }
                }
                else
                {
                  v52 &= v45 - 1;
                }
                if (v52 != v1) {
                  break;
                }
              }
              unsigned int v49 = *(float **)v49;
            }
            while (v49);
          }
        }
      }
      else
      {
        long long v168 = 0u;
        long long v169 = 0u;
        int v170 = 1065353216;
      }
      unsigned int v49 = (float *)operator new(0x40uLL);
      v173[0] = v49;
      v173[1] = v156;
      *(void *)unsigned int v49 = 0;
      *((void *)v49 + 1) = v44;
      *((void *)v49 + 2) = v44;
      std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)(v49 + 6), (uint64_t *)&v168);
      char v174 = 1;
      float v53 = (float)(unint64_t)(*(void *)(v5 + 24) + 1);
      float v54 = *(float *)(v5 + 32);
      if (!v45 || (float)(v54 * (float)v45) < v53)
      {
        BOOL v55 = (v45 & (v45 - 1)) != 0;
        if (v45 < 3) {
          BOOL v55 = 1;
        }
        unint64_t v56 = v55 | (2 * v45);
        unint64_t v57 = vcvtps_u32_f32(v53 / v54);
        if (v56 <= v57) {
          size_t v58 = v57;
        }
        else {
          size_t v58 = v56;
        }
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(v5, v58);
        unint64_t v45 = *(void *)(v5 + 8);
        if ((v45 & (v45 - 1)) != 0)
        {
          if (v45 <= v44) {
            unint64_t v1 = v44 % v45;
          }
          else {
            unint64_t v1 = v44;
          }
        }
        else
        {
          unint64_t v1 = (v45 - 1) & v44;
        }
      }
      uint64_t v59 = *(void *)v5;
      long long v60 = *(float ***)(*(void *)v5 + 8 * v1);
      if (v60) {
        break;
      }
      *(void *)unsigned int v49 = *v156;
      char *v156 = v49;
      *(void *)(v59 + 8 * v1) = v156;
      unint64_t v1 = v165;
      if (*(void *)v49)
      {
        unint64_t v61 = *(void *)(*(void *)v49 + 8);
        if ((v45 & (v45 - 1)) != 0)
        {
          if (v61 >= v45) {
            v61 %= v45;
          }
        }
        else
        {
          v61 &= v45 - 1;
        }
        long long v60 = (float **)(*(void *)v5 + 8 * v61);
        goto LABEL_113;
      }
LABEL_114:
      v173[0] = 0;
      ++*(void *)(v5 + 24);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<long,std::unordered_map<unsigned int,DrawDurationInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long,std::unordered_map<unsigned int,DrawDurationInfo>>,void *>>>>::reset[abi:nn180100]((uint64_t)v173);
LABEL_115:
      std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::~__hash_table((uint64_t)&v168);
      unint64_t v62 = *((void *)v49 + 4);
      if (v62) {
        float v63 = (float)*((unint64_t *)v49 + 6) / (float)v62;
      }
      else {
        float v63 = 0.0;
      }
      float v64 = fmaxf(v63, 0.3);
      v49[14] = v64;
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)(v49 + 6), vcvtps_u32_f32(32.0 / v64));
LABEL_119:
      unint64_t v65 = std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)(v49 + 6), v171, &v171);
      unint64_t v66 = v65;
      int v67 = *((_DWORD *)v65 + 7) + v26[2];
      ++*((_DWORD *)v65 + 6);
      *((_DWORD *)v65 + 7) = v67;
      unint64_t v68 = *(_DWORD *)(v1 + 184) & 0x1F | (32 * *(_DWORD *)(v1 + 188)) | (unint64_t)(v27 << 32);
      long long v70 = (char *)*((void *)v65 + 5);
      unint64_t v69 = *((void *)v65 + 6);
      if ((unint64_t)v70 >= v69)
      {
        BOOL v72 = (char *)*((void *)v65 + 4);
        uint64_t v73 = (v70 - v72) >> 3;
        unint64_t v74 = v73 + 1;
        if ((unint64_t)(v73 + 1) >> 61) {
          abort();
        }
        uint64_t v75 = v69 - (void)v72;
        if (v75 >> 2 > v74) {
          unint64_t v74 = v75 >> 2;
        }
        BOOL v76 = (unint64_t)v75 >= 0x7FFFFFFFFFFFFFF8;
        unint64_t v77 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v76) {
          unint64_t v77 = v74;
        }
        if (v77)
        {
          unint64_t v77 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v77);
          BOOL v72 = (char *)*((void *)v66 + 4);
          long long v70 = (char *)*((void *)v66 + 5);
        }
        else
        {
          uint64_t v78 = 0;
        }
        uint8x8_t v79 = (unint64_t *)(v77 + 8 * v73);
        *uint8x8_t v79 = v68;
        unsigned int v71 = v79 + 1;
        while (v70 != v72)
        {
          unint64_t v80 = *((void *)v70 - 1);
          v70 -= 8;
          *--uint8x8_t v79 = v80;
        }
        *((void *)v66 + 4) = v79;
        *((void *)v66 + 5) = v71;
        *((void *)v66 + 6) = v77 + 8 * v78;
        if (v72) {
          operator delete(v72);
        }
      }
      else
      {
        *(void *)long long v70 = v68;
        unsigned int v71 = v70 + 8;
      }
      *((void *)v66 + 5) = v71;
LABEL_135:
      unsigned int v81 = sqrt((double)[WeakRetained _computeSampleNormFactorForSample:v26 forProgramStartAddress:*(void *)(v166 + 8) forProgramEndAddress:*(void *)(v166 + 16)]);
      if (v81 <= 1) {
        unsigned int v82 = 1;
      }
      else {
        unsigned int v82 = v81;
      }
      uint64_t v83 = [*(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) objectAtIndexedSubscript:v27];
      uint64_t v86 = v83;
      *(void *)(v83 + 8) = *v162;
      *(_DWORD *)(v83 + 16) = v26[1];
      int v87 = *(_DWORD *)(v1 + 188);
      *(_DWORD *)(v83 + 24) = *(_DWORD *)(v83 + 24) & 0xF8000000 | v87 & 0x7FFFFFF;
      int v88 = v87 & 0x7FFFFFF | (*(_DWORD *)(v1 + 184) << 27);
      unsigned int v89 = v172;
      *(_DWORD *)(v83 + 20) = v172;
      *(_DWORD *)(v83 + 24) = v88;
      *(double *)(v83 + 32) = v38;
      if (v34)
      {
        uint64_t v90 = (char *)v34[1] - (char *)*v34;
        unint64_t v91 = v90 >> 4;
        uint64_t v92 = *(void *)(v86 + 48);
        if (v90 >> 4 <= (unint64_t)((*(void *)(v86 + 64) - v92) >> 4)) {
          goto LABEL_149;
        }
        if (v90 < 0) {
          abort();
        }
      }
      else
      {
        uint64_t v92 = *(void *)(v83 + 48);
        if (*(void *)(v83 + 64) != v92) {
          goto LABEL_149;
        }
        unint64_t v91 = 1;
      }
      uint64_t v93 = *(void *)(v86 + 56);
      long long v94 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v91);
      unsigned int v97 = *(char **)(v86 + 48);
      int64_t v96 = *(char **)(v86 + 56);
      unint64_t v98 = &v94[(v93 - v92) & 0xFFFFFFFFFFFFFFF0];
      if (v96 != v97)
      {
        do
        {
          long long v84 = *((_OWORD *)v96 - 1);
          *((_OWORD *)v98 - 1) = v84;
          v98 -= 16;
          v96 -= 16;
        }
        while (v96 != v97);
        int64_t v96 = *(char **)(v86 + 48);
      }
      *(void *)(v86 + 48) = v98;
      *(void *)(v86 + 56) = &v94[(v93 - v92) & 0xFFFFFFFFFFFFFFF0];
      *(void *)(v86 + 64) = &v94[16 * v95];
      if (v96) {
        operator delete(v96);
      }
LABEL_149:
      if (v163 <= 2)
      {
        unint64_t v99 = (void *)(*v157 + 40 * v163);
        unsigned int v100 = v171;
        uint64_t v101 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v99, v171);
        if (v101)
        {
          unint64_t v102 = v26[1];
          LODWORD(v103) = v102 - 1;
          if (v102) {
            unint64_t v103 = v103;
          }
          else {
            unint64_t v103 = 0;
          }
          if (v101[3] < v103) {
            unint64_t v103 = v101[3];
          }
          if (v101[4] > v102) {
            unint64_t v102 = v101[4];
          }
          v101[3] = v103;
          v101[4] = v102;
        }
        else
        {
          uint64_t v104 = v26[1];
          LODWORD(v105) = v104 - 1;
          if (v104) {
            uint64_t v105 = v105;
          }
          else {
            uint64_t v105 = 0;
          }
          LODWORD(v168) = v100;
          *((void *)&v168 + 1) = v105;
          *(void *)&long long v169 = v104;
          std::__hash_table<std::__hash_value_type<unsigned int,std::pair<unsigned long long,unsigned long long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<unsigned long long,unsigned long long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<unsigned long long,unsigned long long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<unsigned long long,unsigned long long>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,std::pair<unsigned long long,unsigned long long>>>((uint64_t)v99, v100, (uint64_t)&v168);
        }
      }
      if (v34)
      {
        long long v107 = *v34;
        long long v106 = v34[1];
        if (v107 == v106) {
          goto LABEL_190;
        }
        unsigned int v108 = 0;
        double v109 = (double)(v82 * v40);
        unsigned int v110 = v171 & 0xFFFFFFF | v158;
        do
        {
          LODWORD(v84) = v26[2];
          LODWORD(v85) = v107[1];
          double v85 = (double)*(unint64_t *)&v85;
          double v111 = v38 * (double)(unint64_t)v84 * v85 / v109;
          DWORD1(v84) = 1018167296;
          if (v111 > 2.22044605e-16)
          {
            int v112 = *v107;
            unint64_t v114 = *(void *)(v86 + 56);
            unint64_t v113 = *(void *)(v86 + 64);
            if (v114 >= v113)
            {
              uint64_t v116 = *(void *)(v86 + 48);
              uint64_t v117 = (uint64_t)(v114 - v116) >> 4;
              unint64_t v118 = v117 + 1;
              if ((unint64_t)(v117 + 1) >> 60) {
                abort();
              }
              uint64_t v119 = v113 - v116;
              if (v119 >> 3 > v118) {
                unint64_t v118 = v119 >> 3;
              }
              if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v120 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v120 = v118;
              }
              if (v120) {
                unint64_t v120 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v120);
              }
              else {
                uint64_t v121 = 0;
              }
              unint64_t v122 = v120 + 16 * v117;
              *(_DWORD *)unint64_t v122 = v112;
              *(_DWORD *)(v122 + 4) = v110;
              *(double *)(v122 + 8) = v111;
              long long v124 = *(char **)(v86 + 48);
              long long v123 = *(char **)(v86 + 56);
              unint64_t v125 = v122;
              if (v123 != v124)
              {
                do
                {
                  long long v84 = *((_OWORD *)v123 - 1);
                  *(_OWORD *)(v125 - 16) = v84;
                  v125 -= 16;
                  v123 -= 16;
                }
                while (v123 != v124);
                long long v123 = *(char **)(v86 + 48);
              }
              unint64_t v115 = v122 + 16;
              *(void *)(v86 + 48) = v125;
              *(void *)(v86 + 56) = v122 + 16;
              *(void *)(v86 + 64) = v120 + 16 * v121;
              if (v123) {
                operator delete(v123);
              }
            }
            else
            {
              *(_DWORD *)unint64_t v114 = v112;
              *(_DWORD *)(v114 + 4) = v110;
              unint64_t v115 = v114 + 16;
              *(double *)(v114 + 8) = v111;
            }
            *(void *)(v86 + 56) = v115;
            ++v108;
            if (WeakRetained[752])
            {
              LODWORD(v85) = v107[1];
              fprintf(*(FILE **)(v165 + 160), "%u %u:0x%llx %u %10u %10u %10u %10u %15f %15f %15f\n", v27, *(_DWORD *)(v115 - 16), *(void *)(v166 + 8), *(_DWORD *)(v115 - 12) >> 28, v89, *(_DWORD *)(v115 - 12) & 0xFFFFFFF, *(_DWORD *)(v86 + 16), v26[2], *(double *)(v115 - 8), v38, (double)*(unint64_t *)&v85 / v109);
            }
          }
          v107 += 4;
        }
        while (v107 != v106);
        if (!v108) {
          goto LABEL_190;
        }
        goto LABEL_187;
      }
      LODWORD(v84) = v26[2];
      double v127 = (double)(unint64_t)v84 / (double)v82;
      if (v127 > 2.22044605e-16)
      {
        if (v153 != 5)
        {
          if (v153 == 4)
          {
            unint64_t v128 = v165;
            if (!v26[5])
            {
              [WeakRetained _waitLatencyAdjustmentWithLimiterData:*(void *)(v165 + 152) forIndex:(*(_DWORD *)(v165 + 180) * v26[1]) withLimiterTypeIndexMap:v151];
              double v127 = v127 * v129;
            }
            unint64_t v130 = v148;
LABEL_203:
            uint64_t v132 = *(void *)(*(void *)(*(void *)(*(void *)v130 + 8) + 48)
                             + 24 * *(unsigned int *)(v128 + 168));
            *(double *)(v132 + 8 * (*v26 % *(_DWORD *)(v128 + 192))) = v127
                                                                                     + *(double *)(v132
                                                                                                 + 8
                                                                                                 * (*v26 % *(_DWORD *)(v128 + 192)));
          }
          int v133 = v26[3];
          unsigned int v134 = v171 & 0xFFFFFFF | v158;
          unint64_t v136 = *(void *)(v86 + 56);
          unint64_t v135 = *(void *)(v86 + 64);
          if (v136 >= v135)
          {
            uint64_t v138 = *(void *)(v86 + 48);
            uint64_t v139 = (uint64_t)(v136 - v138) >> 4;
            unint64_t v140 = v139 + 1;
            if ((unint64_t)(v139 + 1) >> 60) {
              abort();
            }
            uint64_t v141 = v135 - v138;
            if (v141 >> 3 > v140) {
              unint64_t v140 = v141 >> 3;
            }
            if ((unint64_t)v141 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v142 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v142 = v140;
            }
            if (v142) {
              unint64_t v142 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v142);
            }
            else {
              uint64_t v143 = 0;
            }
            unint64_t v144 = v142 + 16 * v139;
            *(_DWORD *)unint64_t v144 = v133;
            *(_DWORD *)(v144 + 4) = v134;
            *(double *)(v144 + 8) = v127;
            BOOL v146 = *(char **)(v86 + 48);
            BOOL v145 = *(char **)(v86 + 56);
            unint64_t v147 = v144;
            if (v145 != v146)
            {
              do
              {
                *(_OWORD *)(v147 - 16) = *((_OWORD *)v145 - 1);
                v147 -= 16;
                v145 -= 16;
              }
              while (v145 != v146);
              BOOL v145 = *(char **)(v86 + 48);
            }
            unint64_t v137 = v144 + 16;
            *(void *)(v86 + 48) = v147;
            *(void *)(v86 + 56) = v144 + 16;
            *(void *)(v86 + 64) = v142 + 16 * v143;
            if (v145) {
              operator delete(v145);
            }
          }
          else
          {
            *(_DWORD *)unint64_t v136 = v133;
            *(_DWORD *)(v136 + 4) = v134;
            unint64_t v137 = v136 + 16;
            *(double *)(v136 + 8) = v127;
          }
          *(void *)(v86 + 56) = v137;
          unsigned int v108 = 1;
LABEL_187:
          uint64_t v126 = *(void *)(v86 + 8);
          if (v126 && *(void *)(v126 + 8))
          {
            atomic_fetch_add((atomic_uint *volatile)(v126 + 40), v108);
            atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(*(void *)(v86 + 8) + 16)+ 24 * *(unsigned int *)(v165 + 184))+ 8 * *(unsigned int *)(v165 + 188)), v108);
          }
          goto LABEL_190;
        }
        if (v26[5])
        {
          unint64_t v130 = v149;
          unint64_t v128 = v165;
        }
        else
        {
          unint64_t v128 = v165;
          [WeakRetained _latencyAdjustmentFactorWithLimiterData:*(void *)(v165 + 152) forIndex:(*(_DWORD *)(v165 + 180) * v26[1]) withLimiterTypeIndexMap:v151 forLimiterType:4];
          double v127 = v127 * v131;
          unint64_t v130 = v149;
        }
        goto LABEL_203;
      }
LABEL_190:

      unint64_t v1 = v165;
      uint64_t v5 = v159;
      uint64_t v22 = v160;
LABEL_191:
      v26 += 10;
      uint64_t v27 = (v27 + 1);
      if (v26 == v164) {
        goto LABEL_36;
      }
    }
    *(void *)unsigned int v49 = *v60;
    unint64_t v1 = v165;
LABEL_113:
    *long long v60 = v49;
    goto LABEL_114;
  }
LABEL_221:
}

- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    unsigned int v4 = *a1;
    if (v3 != v2)
    {
      uint64_t v5 = (char *)a1[1];
      do
      {
        long long v7 = (void *)*((void *)v5 - 3);
        v5 -= 24;
        unsigned int v6 = v7;
        if (v7)
        {
          *((void *)v3 - 2) = v6;
          operator delete(v6);
        }
        uint64_t v3 = v5;
      }
      while (v5 != v2);
      unsigned int v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterTypeLoad:(unsigned int)a6 forLimiterTypeStore:(unsigned int)a7
{
  double v7 = a3[*(unsigned int *)(*(void *)a5 + 4 * a7) + a4] * 0.01;
  if (a3[*(unsigned int *)(*(void *)a5 + 4 * a6) + a4] * 0.01 >= v7) {
    double v7 = a3[*(unsigned int *)(*(void *)a5 + 4 * a6) + a4] * 0.01;
  }
  [(DYPMTLShaderProfilerHelper *)self _latencyAdjustmentEstimate:a3[*(unsigned int *)(*(void *)a5 + 4) + a4] * 0.01 withLimiter:v7];
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterDataWithLerp:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  [(DYPMTLShaderProfilerHelper *)self _latencyAdjustmentEstimate:a3[*(unsigned int *)(*(void *)a5 + 4) + a4] * 0.01 withLimiter:a3[*(unsigned int *)(*(void *)a5 + 4 * a6) + a4] * 0.01];
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  [(DYPMTLShaderProfilerHelper *)self _conservativeLatencyAdjustment:a3[*(unsigned int *)(*(void *)a5 + 4) + a4] * 0.01 withLimiter:a3[*(unsigned int *)(*(void *)a5 + 4 * a6) + a4] * 0.01];
  return result;
}

- (double)_latencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    unint64_t v7 = *(unsigned int *)(*(void *)a5 + v5) + a4;
    if (v6 < a3[v7]) {
      double v6 = a3[v7];
    }
    v5 += 4;
  }
  while (v5 != 40);
  double v8 = v6 * 0.01;
  double v9 = 1.0 - v8;
  BOOL v10 = v8 < 1.0;
  double result = 0.0;
  if (v10) {
    return v9;
  }
  return result;
}

- (double)_waitLatencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  double v5 = a3[*(unsigned int *)(*(void *)a5 + 8) + a4] * 0.01;
  if (a3[**(unsigned int **)a5 + a4] * 0.01 >= v5) {
    double v5 = a3[**(unsigned int **)a5 + a4] * 0.01;
  }
  [(DYPMTLShaderProfilerHelper *)self _latencyAdjustmentEstimate:a3[*(unsigned int *)(*(void *)a5 + 4) + a4] * 0.01 withLimiter:v5];
  return result;
}

- (double)_latencyAdjustmentEstimate:(double)a3 withLimiter:(double)a4
{
  double v5 = a3 / (a4 + 0.00001);
  if (v5 >= 1.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0 - v5;
  }
  -[DYPMTLShaderProfilerHelper _conservativeLatencyAdjustment:withLimiter:](self, "_conservativeLatencyAdjustment:withLimiter:", a3);
  return (1.0 - (a3 + (1.0 - a3) * 0.5)) * v7 + (a3 + (1.0 - a3) * 0.5) * v6;
}

- (double)_conservativeLatencyAdjustment:(double)a3 withLimiter:(double)a4
{
  double v4 = a3 / (a4 + 1.0 + 0.00001);
  double v5 = 1.0 - v4;
  BOOL v6 = v4 < 1.0;
  double result = 0.0;
  if (v6) {
    return v5;
  }
  return result;
}

- (void)setupDataForEvaluatingStreamingSamples:(id)a3 forRingBufferCount:(unsigned int)a4 forTargetIndex:(int)a5
{
  long long v241 = (id *)a3;
  unsigned int v251 = a4;
  objc_storeStrong((id *)self + 20, a3);
  double v9 = [v241 drawCallInfoList];
  unint64_t v10 = (unint64_t)[v9 count];
  unint64_t v11 = (void *)*((void *)self + 7);
  int8x8_t v12 = (void *)*((void *)self + 8);
  unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (v12 - v11);
  unint64_t v14 = v10 - v13;
  if (v10 > v13)
  {
    uint64_t v15 = *((void *)self + 9);
    if (0xAAAAAAAAAAAAAAABLL * ((v15 - (uint64_t)v12) >> 3) >= v14)
    {
      bzero(*((void **)self + 8), 24 * ((24 * v14 - 24) / 0x18) + 24);
      *((void *)self + 8) = &v12[3 * ((24 * v14 - 24) / 0x18) + 3];
      goto LABEL_25;
    }
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v15 - (uint64_t)v11) >> 3);
    uint64_t v17 = 2 * v16;
    if (2 * v16 <= v10) {
      uint64_t v17 = v10;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v18 = v17;
    }
    if (v18 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v19 = (char *)operator new(24 * v18);
    long long v20 = &v19[8 * (v12 - v11)];
    int v21 = &v19[24 * v18];
    size_t v22 = 24 * ((24 * v14 - 24) / 0x18) + 24;
    bzero(v20, v22);
    unsigned int v23 = &v20[v22];
    if (v12 == v11)
    {
      *((void *)self + 7) = v20;
      *((void *)self + 8) = v23;
      *((void *)self + 9) = v21;
      if (!v12) {
        goto LABEL_25;
      }
    }
    else
    {
      do
      {
        *((void *)v20 - 3) = 0;
        *((void *)v20 - 2) = 0;
        v20 -= 24;
        *((void *)v20 + 2) = 0;
        long long v24 = *(_OWORD *)(v12 - 3);
        v12 -= 3;
        *(_OWORD *)long long v20 = v24;
        *((void *)v20 + 2) = v12[2];
        void *v12 = 0;
        v12[1] = 0;
        v12[2] = 0;
      }
      while (v12 != v11);
      uint64_t v25 = (void *)*((void *)self + 7);
      int8x8_t v12 = (void *)*((void *)self + 8);
      *((void *)self + 7) = v20;
      *((void *)self + 8) = v23;
      *((void *)self + 9) = v21;
      if (v12 != v25)
      {
        do
        {
          v12 -= 3;
          *(void *)unsigned int v252 = v12;
          std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
        }
        while (v12 != v25);
        int8x8_t v12 = v25;
      }
      if (!v12) {
        goto LABEL_25;
      }
    }
    operator delete(v12);
    goto LABEL_25;
  }
  if (v10 < v13)
  {
    unint64_t v26 = &v11[3 * v10];
    while (v12 != v26)
    {
      v12 -= 3;
      *(void *)unsigned int v252 = v12;
      std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
    }
    *((void *)self + 8) = v26;
  }
LABEL_25:

  uint64_t v27 = [v241 drawCallInfoList];
  id v28 = [v27 count];
  unint64_t v29 = (unint64_t)v28 + 1;
  uint64_t v30 = *((void *)self + 10);
  uint64_t v31 = *((void *)self + 11);
  unint64_t v32 = 0xCCCCCCCCCCCCCCCDLL * ((v31 - v30) >> 3);
  unint64_t v33 = (unint64_t)v28 - v32 + 1;
  if ((unint64_t)v28 + 1 <= v32)
  {
    if ((unint64_t)v28 + 1 < v32)
    {
      uint64_t v53 = v30 + 40 * v29;
      while (v31 != v53)
      {
        v31 -= 40;
        std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>>>::~__hash_table(v31);
      }
      *((void *)self + 11) = v53;
    }
  }
  else
  {
    uint64_t v34 = *((void *)self + 12);
    if (0xCCCCCCCCCCCCCCCDLL * ((v34 - v31) >> 3) >= v33)
    {
      unint64_t v54 = v31 + 40 * v33;
      do
      {
        *(_OWORD *)uint64_t v31 = 0uLL;
        *(_OWORD *)(v31 + 16) = 0uLL;
        *(_DWORD *)(v31 + 32) = 1065353216;
        v31 += 40;
      }
      while (v31 != v54);
      *((void *)self + 11) = v54;
    }
    else
    {
      if (v29 > 0x666666666666666) {
        abort();
      }
      unint64_t v35 = 0xCCCCCCCCCCCCCCCDLL * ((v34 - v30) >> 3);
      uint64_t v36 = 2 * v35;
      if (2 * v35 <= v29) {
        uint64_t v36 = (uint64_t)v28 + 1;
      }
      if (v35 >= 0x333333333333333) {
        unint64_t v37 = 0x666666666666666;
      }
      else {
        unint64_t v37 = v36;
      }
      if (v37 > 0x666666666666666) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      double v38 = (char *)operator new(40 * v37);
      uint64_t v39 = &v38[8 * ((v31 - v30) >> 3)];
      int v40 = &v38[40 * v29];
      double v41 = v39;
      do
      {
        *(_OWORD *)double v41 = 0uLL;
        *((_OWORD *)v41 + 1) = 0uLL;
        *((_DWORD *)v41 + 8) = 1065353216;
        v41 += 40;
      }
      while (v41 != v40);
      int v42 = &v38[40 * v37];
      if (v31 != v30)
      {
        uint64_t v43 = 0;
        do
        {
          unint64_t v44 = &v39[v43];
          uint64_t v45 = v31 + v43;
          uint64_t v46 = *(void *)(v31 + v43 - 40);
          *(void *)(v45 - 40) = 0;
          *((void *)v44 - 5) = v46;
          *((void *)v44 - 4) = *(void *)(v31 + v43 - 32);
          *(void *)(v45 - 32) = 0;
          uint64_t v47 = *(void *)(v31 + v43 - 24);
          *(void *)&v39[v43 - 24] = v47;
          uint64_t v48 = *(void *)(v31 + v43 - 16);
          *((void *)v44 - 2) = v48;
          *((_DWORD *)v44 - 2) = *(_DWORD *)(v31 + v43 - 8);
          if (v48)
          {
            unint64_t v49 = *(void *)(v47 + 8);
            unint64_t v50 = *((void *)v44 - 4);
            if ((v50 & (v50 - 1)) != 0)
            {
              if (v49 >= v50) {
                v49 %= v50;
              }
            }
            else
            {
              v49 &= v50 - 1;
            }
            *(void *)(v46 + 8 * v49) = &v39[v43 - 24];
            *(void *)(v31 + v43 - 24) = 0;
            *(void *)(v31 + v43 - 16) = 0;
          }
          v43 -= 40;
        }
        while (v31 + v43 != v30);
        v39 += v43;
      }
      unint64_t v52 = (void *)*((void *)self + 10);
      uint64_t v51 = *((void *)self + 11);
      *((void *)self + 10) = v39;
      *((void *)self + 11) = v40;
      *((void *)self + 12) = v42;
      while ((void *)v51 != v52)
        uint64_t v51 = std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>>>::~__hash_table(v51 - 40);
      if (v52) {
        operator delete(v52);
      }
    }
  }

  uint64_t v55 = +[NSMutableArray arrayWithCapacity:v251];
  unint64_t v56 = (void *)*((void *)self + 21);
  *((void *)self + 21) = v55;

  uint64_t v57 = +[NSMutableArray arrayWithCapacity:v251];
  size_t v58 = (void *)*((void *)self + 22);
  *((void *)self + 22) = v57;

  uint64_t v59 = +[NSMutableArray arrayWithCapacity:v251];
  long long v60 = (void *)*((void *)self + 23);
  *((void *)self + 23) = v59;

  uint64_t v61 = +[NSMutableArray arrayWithCapacity:v251];
  unint64_t v62 = (void *)*((void *)self + 24);
  *((void *)self + 24) = v61;

  unint64_t v63 = v251;
  unint64_t v65 = (void *)*((void *)self + 25);
  float v64 = (void *)*((void *)self + 26);
  unint64_t v66 = 0xAAAAAAAAAAAAAAABLL * (v64 - v65);
  unint64_t v67 = v251 - v66;
  if (v251 > v66)
  {
    uint64_t v68 = *((void *)self + 27);
    if (0xAAAAAAAAAAAAAAABLL * ((v68 - (uint64_t)v64) >> 3) >= v67)
    {
      bzero(*((void **)self + 26), 24 * ((24 * v67 - 24) / 0x18) + 24);
      *((void *)self + 26) = &v64[3 * ((24 * v67 - 24) / 0x18) + 3];
      goto LABEL_82;
    }
    unint64_t v69 = 0xAAAAAAAAAAAAAAABLL * ((v68 - (uint64_t)v65) >> 3);
    unint64_t v70 = 0x5555555555555556 * ((v68 - (uint64_t)v65) >> 3);
    if (v70 > v251) {
      unint64_t v63 = v70;
    }
    if (v69 >= 0x555555555555555) {
      unint64_t v71 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v71 = v63;
    }
    if (v71 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_270;
    }
    BOOL v72 = (char *)operator new(24 * v71);
    uint64_t v73 = &v72[8 * (v64 - v65)];
    unint64_t v74 = &v72[24 * v71];
    size_t v75 = 24 * ((24 * v67 - 24) / 0x18) + 24;
    bzero(v73, v75);
    BOOL v76 = &v73[v75];
    if (v64 == v65)
    {
      *((void *)self + 25) = v73;
      *((void *)self + 26) = v76;
      *((void *)self + 27) = v74;
      if (!v64) {
        goto LABEL_82;
      }
    }
    else
    {
      do
      {
        *((void *)v73 - 3) = 0;
        *((void *)v73 - 2) = 0;
        v73 -= 24;
        *((void *)v73 + 2) = 0;
        long long v77 = *(_OWORD *)(v64 - 3);
        v64 -= 3;
        *(_OWORD *)uint64_t v73 = v77;
        *((void *)v73 + 2) = v64[2];
        *float v64 = 0;
        v64[1] = 0;
        v64[2] = 0;
      }
      while (v64 != v65);
      uint64_t v78 = (void *)*((void *)self + 25);
      float v64 = (void *)*((void *)self + 26);
      *((void *)self + 25) = v73;
      *((void *)self + 26) = v76;
      *((void *)self + 27) = v74;
      if (v64 != v78)
      {
        do
        {
          v64 -= 3;
          *(void *)unsigned int v252 = v64;
          std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
        }
        while (v64 != v78);
        float v64 = v78;
      }
      if (!v64) {
        goto LABEL_82;
      }
    }
    operator delete(v64);
    goto LABEL_82;
  }
  if (v251 < v66)
  {
    uint8x8_t v79 = &v65[3 * v251];
    while (v64 != v79)
    {
      v64 -= 3;
      *(void *)unsigned int v252 = v64;
      std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
    }
    *((void *)self + 26) = v79;
  }
LABEL_82:
  unint64_t v80 = v251;
  unsigned int v82 = (void *)*((void *)self + 28);
  unsigned int v81 = (void *)*((void *)self + 29);
  unint64_t v83 = 0xAAAAAAAAAAAAAAABLL * (v81 - v82);
  unint64_t v84 = v251 - v83;
  if (v251 <= v83)
  {
    if (v251 < v83)
    {
      int64_t v96 = &v82[3 * v251];
      while (v81 != v96)
      {
        v81 -= 3;
        *(void *)unsigned int v252 = v81;
        std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
      }
      *((void *)self + 29) = v96;
    }
    goto LABEL_105;
  }
  uint64_t v85 = *((void *)self + 30);
  if (0xAAAAAAAAAAAAAAABLL * ((v85 - (uint64_t)v81) >> 3) >= v84)
  {
    bzero(*((void **)self + 29), 24 * ((24 * v84 - 24) / 0x18) + 24);
    *((void *)self + 29) = &v81[3 * ((24 * v84 - 24) / 0x18) + 3];
    goto LABEL_105;
  }
  unint64_t v86 = 0xAAAAAAAAAAAAAAABLL * ((v85 - (uint64_t)v82) >> 3);
  unint64_t v87 = 0x5555555555555556 * ((v85 - (uint64_t)v82) >> 3);
  if (v87 > v251) {
    unint64_t v80 = v87;
  }
  if (v86 >= 0x555555555555555) {
    unint64_t v88 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v88 = v80;
  }
  if (v88 > 0xAAAAAAAAAAAAAAALL) {
LABEL_270:
  }
    std::__throw_bad_array_new_length[abi:nn180100]();
  unsigned int v89 = (char *)operator new(24 * v88);
  uint64_t v90 = &v89[8 * (v81 - v82)];
  unint64_t v91 = &v89[24 * v88];
  size_t v92 = 24 * ((24 * v84 - 24) / 0x18) + 24;
  bzero(v90, v92);
  uint64_t v93 = &v90[v92];
  if (v81 != v82)
  {
    do
    {
      *((void *)v90 - 3) = 0;
      *((void *)v90 - 2) = 0;
      v90 -= 24;
      *((void *)v90 + 2) = 0;
      long long v94 = *(_OWORD *)(v81 - 3);
      v81 -= 3;
      *(_OWORD *)uint64_t v90 = v94;
      *((void *)v90 + 2) = v81[2];
      *unsigned int v81 = 0;
      v81[1] = 0;
      v81[2] = 0;
    }
    while (v81 != v82);
    uint64_t v95 = (void *)*((void *)self + 28);
    unsigned int v81 = (void *)*((void *)self + 29);
    *((void *)self + 28) = v90;
    *((void *)self + 29) = v93;
    *((void *)self + 30) = v91;
    if (v81 != v95)
    {
      do
      {
        v81 -= 3;
        *(void *)unsigned int v252 = v81;
        std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
      }
      while (v81 != v95);
      unsigned int v81 = v95;
    }
    if (!v81) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  *((void *)self + 28) = v90;
  *((void *)self + 29) = v93;
  *((void *)self + 30) = v91;
  if (v81) {
LABEL_104:
  }
    operator delete(v81);
LABEL_105:
  unsigned int v97 = (void *)((char *)self + 248);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::resize((char **)self + 31, v251);
  unint64_t v98 = (void *)((char *)self + 272);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::resize((char **)self + 34, v251);
  *((_DWORD *)self + 182) = a5;
  unint64_t v240 = self;
  if (v251)
  {
    for (unint64_t i = 0; i < v251; ++i)
    {
      unsigned int v100 = (void *)*((void *)self + 21);
      uint64_t v101 = +[NSMutableArray arrayWithCapacity:20];
      [v100 addObject:v101];

      unint64_t v102 = (void *)*((void *)v240 + 22);
      unint64_t v103 = +[NSMutableArray arrayWithCapacity:20];
      [v102 addObject:v103];

      uint64_t v104 = (void *)*((void *)v240 + 23);
      uint64_t v105 = +[NSMutableArray arrayWithCapacity:20];
      [v104 addObject:v105];

      long long v106 = (void *)*((void *)v240 + 24);
      long long v107 = +[NSMutableArray arrayWithCapacity:20];
      [v106 addObject:v107];

      uint64_t v108 = *((void *)v240 + 25);
      double v109 = (char **)(v108 + 24 * i);
      unsigned int v110 = (uint64_t *)(v109 + 2);
      double v111 = *v109;
      if ((unint64_t)(v109[2] - *v109) <= 0x9F)
      {
        uint64_t v112 = v108 + 24 * i;
        uint64_t v115 = *(void *)(v112 + 8);
        unint64_t v113 = (char **)(v112 + 8);
        uint64_t v114 = v115;
        v253 = v109 + 2;
        uint64_t v116 = (char *)operator new(0xA0uLL);
        uint64_t v117 = *v113;
        unint64_t v118 = *v109;
        if (*v113 == *v109)
        {
          int64x2_t v121 = vdupq_n_s64((unint64_t)v117);
          uint64_t v119 = &v116[(v114 - (void)v111) & 0xFFFFFFFFFFFFFFF8];
        }
        else
        {
          uint64_t v119 = &v116[(v114 - (void)v111) & 0xFFFFFFFFFFFFFFF8];
          do
          {
            uint64_t v120 = *((void *)v117 - 1);
            v117 -= 8;
            *(void *)uint64_t v117 = 0;
            *((void *)v119 - 1) = v120;
            v119 -= 8;
          }
          while (v117 != v118);
          int64x2_t v121 = *(int64x2_t *)v109;
        }
        *double v109 = v119;
        char *v113 = &v116[(v114 - (void)v111) & 0xFFFFFFFFFFFFFFF8];
        *(int64x2_t *)&v252[8] = v121;
        uint64_t v122 = *v110;
        *unsigned int v110 = (uint64_t)(v116 + 160);
        *(void *)&v252[24] = v122;
        *(void *)unsigned int v252 = v121.i64[0];
        std::__split_buffer<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::~__split_buffer((uint64_t)v252);
      }
      std::vector<std::unique_ptr<std::vector<double>>>::reserve((int64x2_t *)(*v97 + 24 * i));
      std::vector<std::unique_ptr<std::vector<double>>>::reserve((int64x2_t *)(*v98 + 24 * i));
      self = v240;
      uint64_t v123 = *((void *)v240 + 28);
      long long v124 = (char **)(v123 + 24 * i);
      unint64_t v125 = (uint64_t *)(v124 + 2);
      uint64_t v126 = *v124;
      if ((unint64_t)(v124[2] - *v124) <= 0x9F)
      {
        uint64_t v127 = v123 + 24 * i;
        uint64_t v130 = *(void *)(v127 + 8);
        unint64_t v128 = (char **)(v127 + 8);
        uint64_t v129 = v130;
        v253 = v124 + 2;
        double v131 = (char *)operator new(0xA0uLL);
        uint64_t v132 = &v131[(v130 - (void)v126) & 0xFFFFFFFFFFFFFFF8];
        int v133 = *v128;
        unsigned int v134 = *v124;
        if (*v128 == *v124)
        {
          int64x2_t v137 = vdupq_n_s64((unint64_t)v133);
          unint64_t v135 = &v131[(v129 - (void)v126) & 0xFFFFFFFFFFFFFFF8];
        }
        else
        {
          unint64_t v135 = &v131[(v129 - (void)v126) & 0xFFFFFFFFFFFFFFF8];
          do
          {
            uint64_t v136 = *((void *)v133 - 1);
            v133 -= 8;
            *(void *)int v133 = 0;
            *((void *)v135 - 1) = v136;
            v135 -= 8;
          }
          while (v133 != v134);
          int64x2_t v137 = *(int64x2_t *)v124;
        }
        self = v240;
        char *v124 = v135;
        *unint64_t v128 = v132;
        *(int64x2_t *)&v252[8] = v137;
        uint64_t v138 = *v125;
        uint64_t *v125 = (uint64_t)(v131 + 160);
        *(void *)&v252[24] = v138;
        *(void *)unsigned int v252 = v137.i64[0];
        std::__split_buffer<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::~__split_buffer((uint64_t)v252);
      }
    }
  }
  uint64_t v139 = [v241 drawCallInfoList];
  id v238 = [v139 count];

  unint64_t v140 = [v241 programInfoList];
  uint64_t v141 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v140 count]);
  unint64_t v142 = (void *)*((void *)self + 19);
  *((void *)self + 19) = v141;

  unsigned int v143 = 0;
  int v250 = &v251;
  *((_DWORD *)self + 26) = 0;
  v239 = (void *)((char *)self + 16);
  while (1)
  {
    unint64_t v144 = [v241 drawCallInfoList];
    uint64_t v234 = v143;
    BOOL v145 = (unint64_t)[v144 count] > v143;

    if (!v145) {
      break;
    }
    BOOL v146 = [v241 drawCallInfoList];
    unint64_t v235 = [v146 objectAtIndexedSubscript:v234];

    unint64_t v147 = [v235 programInfo];
    if (v147)
    {
      unint64_t v148 = [v235 programInfo];
      BOOL v149 = [v148 programId] == (id)-1;

      if (v149) {
        goto LABEL_266;
      }
    }
    unsigned int v150 = *((_DWORD *)self + 26);
    uint64_t v151 = *((void *)self + 10);
    *((_DWORD *)self + 26) = v150 + 1;
    uint64_t v152 = *((void *)self + 7);
    std::string::size_type v247 = 0;
    std::string::basic_string[abi:nn180100]<0>(&__p, "");
    int v153 = (unint64_t *)(v152 + 24 * v150);
    unint64_t v155 = v153 + 1;
    unint64_t v154 = v153[1];
    unint64_t v156 = *v153;
    uint64_t v157 = v154 - *v153;
    if ((unint64_t)v157 > 0xBF)
    {
      if (v157 == 192) {
        goto LABEL_157;
      }
      unint64_t v175 = v156 + 192;
      while (v154 != v175)
      {
        if (*(char *)(v154 - 1) < 0) {
          operator delete(*(void **)(v154 - 24));
        }
        v154 -= 32;
      }
      goto LABEL_154;
    }
    uint64_t v158 = v157 >> 5;
    unint64_t v159 = 6 - (v157 >> 5);
    uint64_t v160 = v152 + 24 * v150;
    uint64_t v163 = *(void *)(v160 + 16);
    uint64_t v162 = (void *)(v160 + 16);
    uint64_t v161 = v163;
    if (v159 <= (uint64_t)(v163 - v154) >> 5)
    {
      unint64_t v175 = v154 + 32 * v159;
      unint64_t v176 = (std::string *)(v154 + 8);
      uint64_t v177 = 192 - 32 * v158;
      do
      {
        v176[-1].__r_.__value_.__r.__words[2] = v247;
        if (SHIBYTE(v249) < 0)
        {
          std::string::__init_copy_ctor_external(v176, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
        }
        else
        {
          long long v178 = __p;
          v176->__r_.__value_.__r.__words[2] = v249;
          *(_OWORD *)&v176->__r_.__value_.__l.__data_ = v178;
        }
        unint64_t v176 = (std::string *)((char *)v176 + 32);
        v177 -= 32;
      }
      while (v177);
LABEL_154:
      unint64_t *v155 = v175;
      goto LABEL_157;
    }
    uint64_t v164 = v161 - v156;
    uint64_t v165 = v164 >> 4;
    if ((unint64_t)(v164 >> 4) <= 6) {
      uint64_t v165 = 6;
    }
    if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v166 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v166 = v165;
    }
    v253 = v162;
    if (v166 >> 59) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    *(void *)unsigned int v252 = operator new(32 * v166);
    *(void *)&v252[8] = *(void *)v252 + 32 * v158;
    *(void *)&v252[16] = *(void *)&v252[8];
    *(void *)&v252[24] = *(void *)v252 + 32 * v166;
    uint64_t v167 = *(void *)v252 + 192;
    long long v168 = (std::string *)(*(void *)&v252[8] + 8);
    do
    {
      v168[-1].__r_.__value_.__r.__words[2] = v247;
      if (SHIBYTE(v249) < 0)
      {
        std::string::__init_copy_ctor_external(v168, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
      }
      else
      {
        *(_OWORD *)&v168->__r_.__value_.__l.__data_ = __p;
        v168->__r_.__value_.__r.__words[2] = v249;
      }
      ++v158;
      long long v168 = (std::string *)((char *)v168 + 32);
    }
    while (v158 != 6);
    *(void *)&v252[16] = v167;
    unint64_t v169 = *v155;
    unint64_t v170 = *v153;
    unint64_t v171 = *(void *)&v252[8];
    if (*v155 == *v153)
    {
      int64x2_t v174 = vdupq_n_s64(v169);
      self = v240;
    }
    else
    {
      self = v240;
      do
      {
        uint64_t v172 = *(void *)(v169 - 32);
        v169 -= 32;
        *(void *)(v171 - 32) = v172;
        v171 -= 32;
        long long v173 = *(_OWORD *)(v169 + 8);
        *(void *)(v171 + 24) = *(void *)(v169 + 24);
        *(_OWORD *)(v171 + 8) = v173;
        *(void *)(v169 + 16) = 0;
        *(void *)(v169 + 24) = 0;
        *(void *)(v169 + 8) = 0;
      }
      while (v169 != v170);
      int64x2_t v174 = *(int64x2_t *)v153;
    }
    unint64_t *v153 = v171;
    uint64_t v179 = *v162;
    long long v180 = *(_OWORD *)&v252[16];
    *(int64x2_t *)&v252[8] = v174;
    *(_OWORD *)unint64_t v155 = v180;
    *(void *)&v252[24] = v179;
    *(void *)unsigned int v252 = v174.i64[0];
    std::__split_buffer<std::pair<ShaderBinaryStatsInfo *,std::string>>::~__split_buffer((uint64_t)v252);
LABEL_157:
    if (SHIBYTE(v249) < 0) {
      operator delete((void *)__p);
    }
    unint64_t v181 = (void *)v235[1];
    v182 = [v241[30] objectForKeyedSubscript:v181];
    *(void *)(*v153 + 32) = -[DYPMTLShaderProfilerHelper setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:]::$_2::operator()((uint64_t)&v250, v181, v182, v239, *((void **)self + 19));

    v183 = (void *)v235[1];
    if (v183)
    {
      std::string::basic_string[abi:nn180100]<0>(v252, (char *)[v183 UTF8String]);
      uint64_t v184 = *v153 + 40;
      if (*(char *)(*v153 + 63) < 0) {
        operator delete(*(void **)v184);
      }
      *(_OWORD *)uint64_t v184 = *(_OWORD *)v252;
      *(void *)(v184 + 16) = *(void *)&v252[16];
      [(DYPMTLShaderProfilerHelper *)self _setupShaderBinaryInfo:*(void *)(*(void *)(*v153 + 32) + 8) withBinaryKey:*v153 + 40 andNumDraws:v238];
    }
    unsigned int v185 = (void *)v235[2];
    float v186 = [v241[31] objectForKeyedSubscript:v185];
    *(void *)(*v153 + 64) = -[DYPMTLShaderProfilerHelper setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:]::$_2::operator()((uint64_t)&v250, v185, v186, v239, *((void **)self + 19));

    float v187 = (void *)v235[2];
    if (v187)
    {
      std::string::basic_string[abi:nn180100]<0>(v252, (char *)[v187 UTF8String]);
      uint64_t v188 = *v153 + 72;
      if (*(char *)(*v153 + 95) < 0) {
        operator delete(*(void **)v188);
      }
      *(_OWORD *)uint64_t v188 = *(_OWORD *)v252;
      *(void *)(v188 + 16) = *(void *)&v252[16];
      [(DYPMTLShaderProfilerHelper *)self _setupShaderBinaryInfo:*(void *)(*(void *)(*v153 + 64) + 8) withBinaryKey:*v153 + 72 andNumDraws:v238];
    }
    unint64_t v189 = (void *)v235[3];
    unint64_t v190 = [v241[32] objectForKeyedSubscript:v189];
    *(void *)(*v153 + 96) = -[DYPMTLShaderProfilerHelper setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:]::$_2::operator()((uint64_t)&v250, v189, v190, v239, *((void **)self + 19));

    size_t v191 = (void *)v235[3];
    if (v191)
    {
      std::string::basic_string[abi:nn180100]<0>(v252, (char *)[v191 UTF8String]);
      uint64_t v192 = *v153 + 104;
      if (*(char *)(*v153 + 127) < 0) {
        operator delete(*(void **)v192);
      }
      *(_OWORD *)uint64_t v192 = *(_OWORD *)v252;
      *(void *)(v192 + 16) = *(void *)&v252[16];
      [(DYPMTLShaderProfilerHelper *)self _setupShaderBinaryInfo:*(void *)(*(void *)(*v153 + 96) + 8) withBinaryKey:*v153 + 104 andNumDraws:v238];
    }
    unint64_t v193 = [v235 allShaderKeys];
    BOOL v194 = v193 == 0;

    if (!v194)
    {
      long long v245 = 0u;
      long long v246 = 0u;
      long long v243 = 0u;
      long long v244 = 0u;
      obuint64_t j = [v235 allShaderKeys];
      id v195 = [obj countByEnumeratingWithState:&v243 objects:v254 count:16];
      if (v195)
      {
        uint64_t v196 = (uint64_t *)(v151 + 40 * v150);
        uint64_t v237 = *(void *)v244;
        unint64_t v197 = v196 + 2;
        do
        {
          id v242 = v195;
          for (uint64_t j = 0; j != v242; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v244 != v237) {
              objc_enumerationMutation(obj);
            }
            id v199 = *(id *)(*((void *)&v243 + 1) + 8 * (void)j);
            unint64_t v200 = strtoull((const char *)[v199 UTF8String], 0, 16);
            uint64_t v201 = [v241[33] objectForKeyedSubscript:v199];
            uint64_t v202 = -[DYPMTLShaderProfilerHelper setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:]::$_2::operator()((uint64_t)&v250, v199, v201, v239, *((void **)self + 19));
            id v203 = v199;
            unint64_t v204 = (char *)[v203 UTF8String];
            *(void *)unsigned int v252 = v202;
            std::string::basic_string[abi:nn180100]<0>(&v252[8], v204);
            unint64_t v205 = v196[1];
            if (v205)
            {
              uint8x8_t v206 = (uint8x8_t)vcnt_s8((int8x8_t)v205);
              v206.i16[0] = vaddlv_u8(v206);
              if (v206.u32[0] > 1uLL)
              {
                uint64_t v202 = v200;
                if (v200 >= v205) {
                  uint64_t v202 = v200 % v205;
                }
              }
              else
              {
                uint64_t v202 = (v205 - 1) & v200;
              }
              v207 = *(void **)(*v196 + 8 * v202);
              if (v207)
              {
                for (uint64_t k = (void *)*v207; k; uint64_t k = (void *)*k)
                {
                  unint64_t v209 = k[1];
                  if (v209 == v200)
                  {
                    if (k[2] == v200) {
                      goto LABEL_249;
                    }
                  }
                  else
                  {
                    if (v206.u32[0] > 1uLL)
                    {
                      if (v209 >= v205) {
                        v209 %= v205;
                      }
                    }
                    else
                    {
                      v209 &= v205 - 1;
                    }
                    if (v209 != v202) {
                      break;
                    }
                  }
                }
              }
            }
            v210 = operator new(0x38uLL);
            void *v210 = 0;
            v210[1] = v200;
            uint64_t v211 = *(void *)v252;
            v210[2] = v200;
            v210[3] = v211;
            *((_OWORD *)v210 + 2) = *(_OWORD *)&v252[8];
            v210[6] = *(void *)&v252[24];
            memset(&v252[8], 0, 24);
            float v212 = (float)(unint64_t)(v196[3] + 1);
            float v213 = *((float *)v196 + 8);
            if (!v205 || (float)(v213 * (float)v205) < v212)
            {
              BOOL v214 = (v205 & (v205 - 1)) != 0;
              if (v205 < 3) {
                BOOL v214 = 1;
              }
              unint64_t v215 = v214 | (2 * v205);
              unint64_t v216 = vcvtps_u32_f32(v212 / v213);
              if (v215 <= v216) {
                int8x8_t prime = (int8x8_t)v216;
              }
              else {
                int8x8_t prime = (int8x8_t)v215;
              }
              if (*(void *)&prime == 1)
              {
                int8x8_t prime = (int8x8_t)2;
              }
              else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
              {
                int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
              }
              unint64_t v205 = v196[1];
              if (*(void *)&prime <= v205)
              {
                if (*(void *)&prime < v205)
                {
                  unint64_t v224 = vcvtps_u32_f32((float)(unint64_t)v196[3] / *((float *)v196 + 8));
                  if (v205 < 3
                    || (uint8x8_t v225 = (uint8x8_t)vcnt_s8((int8x8_t)v205), v225.i16[0] = vaddlv_u8(v225), v225.u32[0] > 1uLL))
                  {
                    unint64_t v224 = std::__next_prime(v224);
                  }
                  else
                  {
                    uint64_t v226 = 1 << -(char)__clz(v224 - 1);
                    if (v224 >= 2) {
                      unint64_t v224 = v226;
                    }
                  }
                  if (*(void *)&prime <= v224) {
                    int8x8_t prime = (int8x8_t)v224;
                  }
                  if (*(void *)&prime >= v205)
                  {
                    unint64_t v205 = v196[1];
                  }
                  else
                  {
                    if (prime) {
                      goto LABEL_205;
                    }
                    unint64_t v232 = (void *)*v196;
                    *uint64_t v196 = 0;
                    if (v232) {
                      operator delete(v232);
                    }
                    unint64_t v205 = 0;
                    v196[1] = 0;
                  }
                }
              }
              else
              {
LABEL_205:
                if (*(void *)&prime >> 61) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v218 = operator new(8 * *(void *)&prime);
                unsigned int v219 = (void *)*v196;
                *uint64_t v196 = (uint64_t)v218;
                if (v219) {
                  operator delete(v219);
                }
                uint64_t v220 = 0;
                v196[1] = (uint64_t)prime;
                do
                  *(void *)(*v196 + 8 * v220++) = 0;
                while (*(void *)&prime != v220);
                uint64_t v221 = (void *)*v197;
                if (*v197)
                {
                  unint64_t v222 = v221[1];
                  uint8x8_t v223 = (uint8x8_t)vcnt_s8(prime);
                  v223.i16[0] = vaddlv_u8(v223);
                  if (v223.u32[0] > 1uLL)
                  {
                    if (v222 >= *(void *)&prime) {
                      v222 %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    v222 &= *(void *)&prime - 1;
                  }
                  *(void *)(*v196 + 8 * v222) = v197;
                  v227 = (void *)*v221;
                  if (*v221)
                  {
                    do
                    {
                      unint64_t v228 = v227[1];
                      if (v223.u32[0] > 1uLL)
                      {
                        if (v228 >= *(void *)&prime) {
                          v228 %= *(void *)&prime;
                        }
                      }
                      else
                      {
                        v228 &= *(void *)&prime - 1;
                      }
                      if (v228 != v222)
                      {
                        if (!*(void *)(*v196 + 8 * v228))
                        {
                          *(void *)(*v196 + 8 * v228) = v221;
                          goto LABEL_230;
                        }
                        *uint64_t v221 = *v227;
                        void *v227 = **(void **)(*v196 + 8 * v228);
                        **(void **)(*v196 + 8 * v228) = v227;
                        v227 = v221;
                      }
                      unint64_t v228 = v222;
LABEL_230:
                      uint64_t v221 = v227;
                      v227 = (void *)*v227;
                      unint64_t v222 = v228;
                    }
                    while (v227);
                  }
                }
                unint64_t v205 = (unint64_t)prime;
              }
              if ((v205 & (v205 - 1)) != 0)
              {
                if (v200 >= v205) {
                  uint64_t v202 = v200 % v205;
                }
                else {
                  uint64_t v202 = v200;
                }
              }
              else
              {
                uint64_t v202 = (v205 - 1) & v200;
              }
            }
            uint64_t v229 = *v196;
            unint64_t v230 = *(void **)(*v196 + 8 * v202);
            if (v230)
            {
              void *v210 = *v230;
LABEL_247:
              void *v230 = v210;
              goto LABEL_248;
            }
            void *v210 = *v197;
            *unint64_t v197 = v210;
            *(void *)(v229 + 8 * v202) = v197;
            if (*v210)
            {
              unint64_t v231 = *(void *)(*v210 + 8);
              if ((v205 & (v205 - 1)) != 0)
              {
                if (v231 >= v205) {
                  v231 %= v205;
                }
              }
              else
              {
                v231 &= v205 - 1;
              }
              unint64_t v230 = (void *)(*v196 + 8 * v231);
              goto LABEL_247;
            }
LABEL_248:
            ++v196[3];
LABEL_249:
            if ((v252[31] & 0x80000000) != 0) {
              operator delete(*(void **)&v252[8]);
            }
            self = v240;
            std::string::basic_string[abi:nn180100]<0>(v252, (char *)[v203 UTF8String]);
            [(DYPMTLShaderProfilerHelper *)v240 _setupShaderBinaryInfo:v201 withBinaryKey:v252 andNumDraws:v238];
            if ((v252[23] & 0x80000000) != 0) {
              operator delete(*(void **)v252);
            }
          }
          id v195 = [obj countByEnumeratingWithState:&v243 objects:v254 count:16];
        }
        while (v195);
      }
    }
LABEL_266:

    unsigned int v143 = v234 + 1;
  }
}

- (uint64_t)setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:
{
  id v8 = a2;
  unint64_t v9 = a3;
  id v10 = a5;
  unint64_t v11 = v10;
  if (v9)
  {
    if (v8) {
      [v10 setObject:v9 forKeyedSubscript:v8];
    }
    int8x8_t v12 = (int8x8_t)a4[1];
    if (!*(void *)&v12) {
      goto LABEL_21;
    }
    uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v14 = v9;
      if (*(void *)&v12 <= v9) {
        unint64_t v14 = v9 % *(void *)&v12;
      }
    }
    else
    {
      unint64_t v14 = (*(void *)&v12 - 1) & v9;
    }
    unint64_t v16 = *(void **)(*a4 + 8 * v14);
    if (!v16 || (uint64_t v17 = (void *)*v16) == 0) {
LABEL_21:
    }
      operator new();
    while (1)
    {
      unint64_t v18 = v17[1];
      if (v18 == v9)
      {
        if (v17[2] == v9)
        {
          uint64_t v15 = v17[3];
          goto LABEL_22;
        }
      }
      else
      {
        if (v13.u32[0] > 1uLL)
        {
          if (v18 >= *(void *)&v12) {
            v18 %= *(void *)&v12;
          }
        }
        else
        {
          v18 &= *(void *)&v12 - 1;
        }
        if (v18 != v14) {
          goto LABEL_21;
        }
      }
      uint64_t v17 = (void *)*v17;
      if (!v17) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v15 = 0;
LABEL_22:

  return v15;
}

- (void)_setupShaderBinaryInfo:(id)a3 withBinaryKey:(const void *)a4 andNumDraws:(unsigned int)a5
{
  id v8 = a3;
  double v7 = [v8 binary];

  if (v7
    && !std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]((void *)self + 14, (uint64_t)a4))
  {
    operator new();
  }
}

- (void)_processTracePackets:(unsigned int *)a3 forRenderIndex:(unsigned int)a4 andGenerateSampleList:(void *)a5 forTargetIndex:(int)a6 forLimiterIndex:(unsigned int)a7
{
  uint64_t v36 = self;
  unsigned int v34 = a7;
  unsigned int v35 = a4;
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  int v29 = 1;
  unsigned int v30 = -1;
  v28[0] = v32;
  v28[1] = &v30;
  v28[2] = v31;
  v28[3] = &v29;
  v28[4] = v33;
  v28[5] = &v35;
  v28[6] = &v34;
  v28[7] = &v36;
  v28[8] = a5;
  uint64_t v27 = 0;
  id v10 = operator new(0x1B0uLL);
  v26[2] = v10 + 27;
  *id v10 = 0u;
  v10[1] = 0u;
  v10[2] = 0u;
  v10[3] = 0u;
  v10[4] = 0u;
  v10[5] = 0u;
  v10[6] = 0u;
  v10[7] = 0u;
  v10[8] = 0u;
  v10[9] = 0u;
  v10[10] = 0u;
  v10[11] = 0u;
  v10[12] = 0u;
  v10[13] = 0u;
  v10[14] = 0u;
  v10[15] = 0u;
  v10[16] = 0u;
  v10[17] = 0u;
  v10[18] = 0u;
  v10[19] = 0u;
  v10[20] = 0u;
  v10[21] = 0u;
  v10[22] = 0u;
  v10[23] = 0u;
  v10[24] = 0u;
  v10[25] = 0u;
  v10[26] = 0u;
  v26[0] = v10;
  v26[1] = v10 + 27;
  memset(v24, 0, sizeof(v24));
  int v25 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v24, 0x24uLL);
  unint64_t v11 = 0;
  v23[0] = (unsigned int *)&v27 + 1;
  v23[1] = (unsigned int *)v32;
  void v23[2] = &v30;
  v23[3] = (unsigned int *)v31;
  v23[4] = (unsigned int *)&v29;
  v23[5] = (unsigned int *)&v27;
  v23[6] = (unsigned int *)v26;
  v23[7] = (unsigned int *)v24;
  v23[8] = (unsigned int *)v33;
  v23[9] = &v35;
  char v12 = 1;
  v23[10] = (unsigned int *)&v36;
  v23[11] = (unsigned int *)a5;
  do
  {
    unsigned int v13 = a3[v11];
    if (v13)
    {
      if (v11)
      {
        if (a6 > 1)
        {
          std::deque<ProfileEvent>::deque((uint64_t)v21, v33);
          uint64_t v15 = v21;
          -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator()(v23, v21);
        }
        else
        {
          std::deque<ProfileEvent>::deque((uint64_t)v22, v33);
          uint64_t v15 = v22;
          -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_0::operator()((uint64_t)v28, v22);
        }
        std::deque<ProfileEvent>::~deque[abi:nn180100](v15);
        char v12 = 1;
      }
      unsigned int v30 = a3[++v11];
    }
    else if ((a3[v11] & 3) == 2)
    {
      LODWORD(v20) = ((v13 << 26) | (v13 >> 5)) & 0x70000FFF;
      HIDWORD(v20) = -1;
      std::deque<ProfileEvent>::emplace_back<ProfileEvent&>(v33, &v20);
      if (v12)
      {
        unsigned int v14 = (v13 >> 5) & 0xFFF;
        if (v14 <= 1) {
          unsigned int v14 = 1;
        }
        int v29 = v14;
      }
      LODWORD(v20) = (v13 >> 20) & 0x8FFFFFFF | (((v13 >> 17) & 7) << 28);
      HIDWORD(v20) = -1;
      std::deque<ProfileEvent>::emplace_back<ProfileEvent&>(v33, &v20);
      char v12 = 0;
    }
  }
  while (v11++ < 7);
  if (a6 >= 2)
  {
    std::deque<ProfileEvent>::deque((uint64_t)v18, v33);
    uint64_t v17 = v18;
    -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator()(v23, v18);
  }
  else
  {
    std::deque<ProfileEvent>::deque((uint64_t)v19, v33);
    uint64_t v17 = v19;
    -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_0::operator()((uint64_t)v28, v19);
  }
  std::deque<ProfileEvent>::~deque[abi:nn180100](v17);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v24);
  v23[0] = (unsigned int *)v26;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v23);
  std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)v31);
  std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)v32);
  std::deque<ProfileEvent>::~deque[abi:nn180100](v33);
}

- (uint64_t)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:
{
  unsigned int v4 = **a1;
  memset(v122, 0, sizeof(v122));
  int v123 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v122, 0x24uLL);
  std::deque<unsigned int>::push_front((char **)a1[1], a1[2]);
  std::deque<unsigned int>::push_front((char **)a1[3], a1[4]);
  for (uint64_t i = a2[5]; i; uint64_t i = a2[5])
  {
    ++**a1;
    uint64_t v6 = *(void *)(*(void *)(a2[1] + ((a2[4] >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (a2[4] & 0x1FFLL));
    ++a2[4];
    a2[5] = i - 1;
    std::deque<ProfileEvent>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)a2);
    if (v6 >> 28)
    {
      if (v6 >> 28 == 2 && *a1[5] == 6) {
        LODWORD(v6) = v6 & 0xFFFFFFF | 0x80000000;
      }
      unsigned int v7 = v6 >> 28;
      unsigned int v8 = (v6 >> 28) - 3;
      if (v8 >= 6)
      {
        if (v7 == 2)
        {
          size_t v22 = a1[6];
          long long v24 = *(void **)v22;
          unsigned int v23 = (void *)*((void *)v22 + 1);
          while (v24 != v23)
          {
            int v25 = (_DWORD *)*v24;
            if (*v24 != v24[1] && *v25 >> 28 == 1)
            {
              std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v122, v25[1], v25[1]);
              *(_DWORD *)void *v24 = *(_DWORD *)*v24 & 0xFFFFFFF | 0x20000000;
              *(_DWORD *)(*v24 + 4) = **a1;
              break;
            }
            v24 += 3;
          }
        }
        else if (v7 == 1)
        {
          uint64_t v13 = **a1;
          uint64_t v15 = a1[5];
          unsigned int v14 = a1[6];
          unsigned int v16 = (*v15)++;
          uint64_t v17 = (void **)(*(void *)v14 + 24 * v16);
          uint64_t v19 = v17 + 1;
          unint64_t v18 = (unint64_t *)v17[1];
          unint64_t v20 = (unint64_t)v17[2];
          if ((unint64_t)v18 >= v20)
          {
            uint64_t v26 = ((char *)v18 - (unsigned char *)*v17) >> 3;
            if ((unint64_t)(v26 + 1) >> 61) {
              abort();
            }
            uint64_t v27 = v20 - (void)*v17;
            uint64_t v28 = v27 >> 2;
            if (v27 >> 2 <= (unint64_t)(v26 + 1)) {
              uint64_t v28 = v26 + 1;
            }
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v29 = v28;
            }
            if (v29) {
              unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v29);
            }
            else {
              uint64_t v30 = 0;
            }
            uint64_t v31 = (unint64_t *)(v29 + 8 * v26);
            unint64_t *v31 = v6 | (unint64_t)(v13 << 32);
            int v21 = v31 + 1;
            unint64_t v32 = (char *)*v19;
            unint64_t v33 = (char *)*v17;
            if (*v19 != *v17)
            {
              do
              {
                unint64_t v34 = *((void *)v32 - 1);
                v32 -= 8;
                *--uint64_t v31 = v34;
              }
              while (v32 != v33);
              unint64_t v32 = (char *)*v17;
            }
            *uint64_t v17 = v31;
            char *v19 = v21;
            v17[2] = (void *)(v29 + 8 * v30);
            if (v32) {
              operator delete(v32);
            }
          }
          else
          {
            unint64_t *v18 = v6 | (unint64_t)(v13 << 32);
            int v21 = v18 + 1;
          }
          char *v19 = v21;
        }
      }
      else
      {
        unint64_t v9 = (void *)(*(void *)a1[6] + 24 * v8);
        if (*v9 == v9[1])
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v122, **a1, **a1);
        }
        else
        {
          int v10 = *(_DWORD *)(*v9 + 4);
          uint64_t v11 = (uint64_t)a1[7];
          v119.i32[0] = v6 >> 28;
          *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v11, v7, &v119)+ 5) = v10;
          uint64_t v12 = *(void *)a1[6] + 24 * v8;
          *(void *)(v12 + 8) -= 8;
        }
      }
    }
  }
  for (uint64_t j = 0; j != 144; j += 24)
  {
    uint64_t v36 = (void *)(*(void *)a1[6] + j);
    if (*v36 != v36[1]) {
      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v122, *(_DWORD *)(*v36 + 4), *(_DWORD *)(*v36 + 4));
    }
  }
  long long v120 = 0u;
  long long v121 = 0u;
  int64x2_t v119 = 0u;
  memset(v117, 0, sizeof(v117));
  int v118 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v117, 0x24uLL);
  *a1[5] = 0;
  unint64_t v37 = a1[8];
  uint64_t v38 = *((void *)v37 + 5);
  if (v38)
  {
    uint64_t v39 = 0;
    unint64_t v40 = 0;
    unint64_t v114 = 0;
    uint64_t v41 = 0;
    int v42 = 0;
    while (1)
    {
      unint64_t v43 = *((void *)v37 + 4);
      ++v4;
      uint64_t v116 = *(void *)(*(void *)(*((void *)v37 + 1) + ((v43 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v43 & 0x1FF));
      unsigned int v44 = v116;
      *((void *)v37 + 4) = v43 + 1;
      *((void *)v37 + 5) = v38 - 1;
      std::deque<ProfileEvent>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v37);
      if ((v44 & 0xF0000000) == 0x10000000)
      {
        ++*a1[5];
        if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v122, v4))goto LABEL_44; {
      }
        }
      else if (v44 >> 28 {
             && !std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v122, v4))
      }
      {
        if ((v44 & 0xF0000000) == 0x20000000 && *a1[5] == 6)
        {
          LODWORD(v116) = v44 & 0xFFFFFFF | 0x80000000;
          unsigned int v44 = v116;
        }
LABEL_44:
        uint64_t v45 = v44 & 0xFFFFFFF;
        if (*((void *)&v121 + 1)) {
          v42 += (unint64_t)(v45 - v41) / *((void *)&v121 + 1);
        }
        int v115 = v44 & 0xFFFFFFF;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v117, v44 & 0xFFFFFFF, &v115)+ 5) = v42;
        unsigned int v46 = v44 >> 28;
        unsigned int v47 = (v44 >> 28) - 3;
        if (v47 >= 6)
        {
          if (v46 - 1 < 2)
          {
            HIDWORD(v116) = v4;
            std::deque<ProfileEvent>::emplace_back<ProfileEvent&>(&v119, &v116);
          }
        }
        else
        {
          uint64_t v48 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(a1[7], v46);
          if (v48)
          {
            if ((void)v120 != v119.i64[1])
            {
              unint64_t v49 = v119.i64[1] + 8 * ((unint64_t)v121 >> 9);
              unint64_t v50 = *(char **)v49;
              uint64_t v51 = (char *)(*(void *)v49 + 8 * (v121 & 0x1FF));
              uint64_t v52 = *(void *)(v119.i64[1] + (((*((void *)&v121 + 1) + (void)v121) >> 6) & 0x3FFFFFFFFFFFFF8))
                  + 8 * ((*((void *)&v121 + 1) + v121) & 0x1FF);
              if (v51 != (char *)v52)
              {
                while (*((_DWORD *)v51 + 1) != *((_DWORD *)v48 + 5))
                {
                  v51 += 8;
                  if (v51 - v50 == 4096)
                  {
                    uint64_t v53 = *(char **)(v49 + 8);
                    v49 += 8;
                    unint64_t v50 = v53;
                    uint64_t v51 = v53;
                  }
                  if (v51 == (char *)v52) {
                    goto LABEL_58;
                  }
                }
                unsigned int v54 = *(_DWORD *)v51;
                std::deque<ProfileEvent>::erase(&v119, (char *)v49, (uint64_t)v51);
                int v55 = v54 & 0xFFFFFFF;
                int v115 = v54 & 0xFFFFFFF;
                int v112 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v117, v54 & 0xFFFFFFF, &v115)+ 5);
                int v115 = v45;
                unint64_t v56 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v117, v45, &v115);
                uint64_t v57 = a1[1];
                unint64_t v58 = *((void *)v57 + 5);
                if (v58 < 2 || (v59 = a1[3], unint64_t v60 = *((void *)v59 + 5), v60 <= 1))
                {
                  unsigned int v67 = v54;
                  uint64_t v111 = (*a1[4] | (v58 << 36)) & 0x3000000FFFLL;
                  int v110 = 0;
                  int v61 = 0;
                }
                else
                {
                  int v61 = 0;
                  uint64_t v62 = *((void *)v57 + 4);
                  uint64_t v63 = *((void *)v57 + 1);
                  int v110 = *(_DWORD *)(*(void *)(v63 + (((unint64_t)(v62 + 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                                   + 4 * ((v62 + 1) & 0x3FF));
                  uint64_t v64 = *((void *)v59 + 4);
                  uint64_t v65 = *((void *)v59 + 1);
                  unint64_t v66 = (*a1[4] | (v58 << 36)) & 0x3000000FFFLL | ((unint64_t)(*(_DWORD *)(*(void *)(v65 + (((unint64_t)(v64 + 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                                                                + 4
                                                                                                * ((v64 + 1) & 0x3FF)) & 0xFFF) << 12);
                  if (v58 < 3 || v60 == 2)
                  {
                    unsigned int v67 = v54;
                  }
                  else
                  {
                    unsigned int v67 = v54;
                    int v61 = *(_DWORD *)(*(void *)(v63 + (((unint64_t)(v62 + 2) >> 7) & 0x1FFFFFFFFFFFFF8))
                                    + 4 * ((v62 + 2) & 0x3FF));
                    v66 |= (unint64_t)(*(_DWORD *)(*(void *)(v65
                                                                    + (((unint64_t)(v64 + 2) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                        + 4 * ((v64 + 2) & 0x3FF)) & 0xFFF) << 24;
                  }
                  uint64_t v111 = v66;
                }
                int v68 = *((_DWORD *)v56 + 5) - v112;
                int v69 = *a1[9];
                if (v69 == -1) {
                  BOOL v70 = v67 >> 28 == 2;
                }
                else {
                  BOOL v70 = v61;
                }
                int v71 = *a1[2];
                BOOL v74 = (v55 == 4095 || v45 == 4095) && *(unsigned char *)(*(void *)a1[10] + 752) != 0;
                if (v40 >= v114)
                {
                  int v107 = *a1[2];
                  BOOL v108 = v70;
                  BOOL v109 = v74;
                  int v113 = *((_DWORD *)v56 + 5) - v112;
                  unint64_t v75 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v40 - (void)v39) >> 3) + 1;
                  if (v75 > 0x666666666666666) {
                    abort();
                  }
                  if (0x999999999999999ALL * ((uint64_t)(v114 - (void)v39) >> 3) > v75) {
                    unint64_t v75 = 0x999999999999999ALL * ((uint64_t)(v114 - (void)v39) >> 3);
                  }
                  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v114 - (void)v39) >> 3) >= 0x333333333333333) {
                    unint64_t v76 = 0x666666666666666;
                  }
                  else {
                    unint64_t v76 = v75;
                  }
                  if (v76) {
                    unint64_t v76 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v76);
                  }
                  else {
                    uint64_t v77 = 0;
                  }
                  unint64_t v78 = v76 + 8 * ((uint64_t)(v40 - (void)v39) >> 3);
                  *(_DWORD *)unint64_t v78 = v69;
                  *(_DWORD *)(v78 + 4) = 0;
                  *(_DWORD *)(v78 + 8) = v113;
                  *(_DWORD *)(v78 + 12) = v107;
                  *(_DWORD *)(v78 + 16) = v110;
                  *(_DWORD *)(v78 + 20) = v108;
                  *(void *)(v78 + 24) = v111;
                  *(_DWORD *)(v78 + 32) = v47;
                  *(_DWORD *)(v78 + 36) = v109;
                  if ((void *)v40 == v39)
                  {
                    unsigned int v82 = (void *)(v76 + 8 * ((uint64_t)(v40 - (void)v39) >> 3));
                  }
                  else
                  {
                    unint64_t v79 = v76 + 8 * ((uint64_t)(v40 - (void)v39) >> 3);
                    do
                    {
                      long long v80 = *(_OWORD *)(v40 - 40);
                      long long v81 = *(_OWORD *)(v40 - 24);
                      unsigned int v82 = (void *)(v79 - 40);
                      *(void *)(v79 - 8) = *(void *)(v40 - 8);
                      *(_OWORD *)(v79 - 24) = v81;
                      *(_OWORD *)(v79 - 40) = v80;
                      v40 -= 40;
                      v79 -= 40;
                    }
                    while ((void *)v40 != v39);
                  }
                  unint64_t v114 = v76 + 40 * v77;
                  unint64_t v40 = v78 + 40;
                  if (v39) {
                    operator delete(v39);
                  }
                  uint64_t v39 = v82;
                }
                else
                {
                  *(_DWORD *)unint64_t v40 = v69;
                  *(_DWORD *)(v40 + 4) = 0;
                  *(_DWORD *)(v40 + 8) = v68;
                  *(_DWORD *)(v40 + 12) = v71;
                  *(_DWORD *)(v40 + 16) = v110;
                  *(_DWORD *)(v40 + 20) = v70;
                  *(void *)(v40 + 24) = v111;
                  *(_DWORD *)(v40 + 32) = v47;
                  *(_DWORD *)(v40 + 36) = v74;
                  v40 += 40;
                }
              }
            }
          }
        }
        goto LABEL_58;
      }
      uint64_t v45 = v41;
LABEL_58:
      unint64_t v37 = a1[8];
      uint64_t v38 = *((void *)v37 + 5);
      uint64_t v41 = v45;
      if (!v38) {
        goto LABEL_105;
      }
    }
  }
  uint64_t v39 = 0;
  unint64_t v40 = 0;
LABEL_105:
  unint64_t v83 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v40 - (void)v39) >> 3));
  if ((void *)v40 == v39) {
    uint64_t v84 = 0;
  }
  else {
    uint64_t v84 = v83;
  }
  std::__introsort<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator() const(std::queue<ProfileEvent>)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*,false>((unint64_t)v39, v40, v84, 1);
  if ((void *)v40 != v39)
  {
    int v85 = 0;
    unint64_t v86 = v39;
    do
    {
      v86[8] = v85++;
      v86 += 10;
    }
    while (v86 != (_DWORD *)v40);
    if ((void *)v40 != v39)
    {
      unint64_t v87 = (void **)a1[11];
      unint64_t v88 = (char *)v87[1];
      unsigned int v89 = v39;
      do
      {
        uint64_t v90 = (char *)v87[2];
        if (v88 >= v90)
        {
          unint64_t v93 = 0xCCCCCCCCCCCCCCCDLL * ((v88 - (unsigned char *)*v87) >> 3);
          unint64_t v94 = v93 + 1;
          if (v93 + 1 > 0x666666666666666) {
            abort();
          }
          unint64_t v95 = 0xCCCCCCCCCCCCCCCDLL * ((v90 - (unsigned char *)*v87) >> 3);
          if (2 * v95 > v94) {
            unint64_t v94 = 2 * v95;
          }
          if (v95 >= 0x333333333333333) {
            unint64_t v96 = 0x666666666666666;
          }
          else {
            unint64_t v96 = v94;
          }
          if (v96) {
            unint64_t v96 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v96);
          }
          else {
            uint64_t v97 = 0;
          }
          unint64_t v98 = v96 + 40 * v93;
          long long v99 = *v89;
          long long v100 = v89[1];
          *(void *)(v98 + 32) = *((void *)v89 + 4);
          *(_OWORD *)unint64_t v98 = v99;
          *(_OWORD *)(v98 + 16) = v100;
          unint64_t v102 = (char *)*v87;
          uint64_t v101 = (char *)v87[1];
          unint64_t v103 = (char *)v98;
          if (v101 != *v87)
          {
            do
            {
              long long v104 = *(_OWORD *)(v101 - 40);
              long long v105 = *(_OWORD *)(v101 - 24);
              *((void *)v103 - 1) = *((void *)v101 - 1);
              *(_OWORD *)(v103 - 24) = v105;
              *(_OWORD *)(v103 - 40) = v104;
              v103 -= 40;
              v101 -= 40;
            }
            while (v101 != v102);
            uint64_t v101 = (char *)*v87;
          }
          unint64_t v88 = (char *)(v98 + 40);
          *unint64_t v87 = v103;
          v87[1] = (void *)(v98 + 40);
          v87[2] = (void *)(v96 + 40 * v97);
          if (v101) {
            operator delete(v101);
          }
        }
        else
        {
          long long v91 = *v89;
          long long v92 = v89[1];
          *((void *)v88 + 4) = *((void *)v89 + 4);
          *(_OWORD *)unint64_t v88 = v91;
          *((_OWORD *)v88 + 1) = v92;
          v88 += 40;
        }
        v87[1] = v88;
        unsigned int v89 = (_OWORD *)((char *)v89 + 40);
      }
      while (v89 != (_OWORD *)v40);
    }
  }
  if (v39) {
    operator delete(v39);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v117);
  std::deque<ProfileEvent>::~deque[abi:nn180100](&v119);
  return std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v122);
}

- (void)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:
{
  while (2)
  {
    int v10 = (long long *)(a2 - 40);
    unint64_t v11 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v11;
          uint64_t v12 = a2 - v11;
          unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a2 - v11) >> 3);
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                if (*(_DWORD *)(a2 - 8) < *(_DWORD *)(v11 + 32))
                {
                  uint64_t v156 = *(void *)(v11 + 32);
                  long long v138 = *(_OWORD *)v11;
                  long long v147 = *(_OWORD *)(v11 + 16);
                  long long v56 = *v10;
                  long long v57 = *(_OWORD *)(a2 - 24);
                  *(void *)(v11 + 32) = *(void *)(a2 - 8);
                  *(_OWORD *)unint64_t v11 = v56;
                  *(_OWORD *)(v11 + 16) = v57;
                  *(void *)(a2 - 8) = v156;
                  *int v10 = v138;
                  *(_OWORD *)(a2 - 24) = v147;
                }
                break;
              case 3uLL:
                std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>((long long *)v11, (long long *)(v11 + 40), (long long *)(a2 - 40));
                break;
              case 4uLL:
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>(v11, v11 + 40, v11 + 80, a2 - 40);
                break;
              case 5uLL:
                unint64_t v58 = (long long *)(v11 + 40);
                uint64_t v59 = (long long *)(v11 + 80);
                unint64_t v60 = (long long *)(v11 + 120);
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>(v11, v11 + 40, v11 + 80, v11 + 120);
                if (*(_DWORD *)(a2 - 8) < *(_DWORD *)(v11 + 152))
                {
                  long long v61 = *v60;
                  long long v148 = *(_OWORD *)(v11 + 136);
                  uint64_t v62 = *(void *)(v11 + 152);
                  long long v64 = *v10;
                  long long v63 = *(_OWORD *)(a2 - 24);
                  *(void *)(v11 + 152) = *(void *)(a2 - 8);
                  *unint64_t v60 = v64;
                  *(_OWORD *)(v11 + 136) = v63;
                  *(void *)(a2 - 8) = v62;
                  *int v10 = v61;
                  *(_OWORD *)(a2 - 24) = v148;
                  if (*(_DWORD *)(v11 + 152) < *(_DWORD *)(v11 + 112))
                  {
                    uint64_t v65 = *(void *)(v11 + 112);
                    long long v67 = *v59;
                    long long v66 = *(_OWORD *)(v11 + 96);
                    long long v68 = *(_OWORD *)(v11 + 136);
                    long long *v59 = *v60;
                    *(_OWORD *)(v11 + 96) = v68;
                    *(void *)(v11 + 112) = *(void *)(v11 + 152);
                    *unint64_t v60 = v67;
                    *(_OWORD *)(v11 + 136) = v66;
                    *(void *)(v11 + 152) = v65;
                    if (*(_DWORD *)(v11 + 112) < *(_DWORD *)(v11 + 72))
                    {
                      uint64_t v69 = *(void *)(v11 + 72);
                      long long v71 = *v58;
                      long long v70 = *(_OWORD *)(v11 + 56);
                      long long v72 = *(_OWORD *)(v11 + 96);
                      *unint64_t v58 = *v59;
                      *(_OWORD *)(v11 + 56) = v72;
                      *(void *)(v11 + 72) = *(void *)(v11 + 112);
                      long long *v59 = v71;
                      *(_OWORD *)(v11 + 96) = v70;
                      *(void *)(v11 + 112) = v69;
                      if (*(_DWORD *)(v11 + 72) < *(_DWORD *)(v11 + 32))
                      {
                        uint64_t v157 = *(void *)(v11 + 32);
                        long long v139 = *(_OWORD *)v11;
                        long long v149 = *(_OWORD *)(v11 + 16);
                        long long v73 = *(_OWORD *)(v11 + 56);
                        *(_OWORD *)unint64_t v11 = *v58;
                        *(_OWORD *)(v11 + 16) = v73;
                        *(void *)(v11 + 32) = *(void *)(v11 + 72);
                        *unint64_t v58 = v139;
                        *(_OWORD *)(v11 + 56) = v149;
                        *(void *)(v11 + 72) = v157;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v12 <= 959)
          {
            BOOL v74 = (_OWORD *)(v11 + 40);
            BOOL v76 = v11 == a2 || v74 == (_OWORD *)a2;
            if (a4)
            {
              if (!v76)
              {
                uint64_t v77 = 0;
                unint64_t v78 = (_DWORD *)v11;
                do
                {
                  unint64_t v79 = v74;
                  unsigned int v80 = v78[18];
                  if (v80 < v78[8])
                  {
                    long long v140 = *v79;
                    long long v150 = v79[1];
                    int v81 = v78[19];
                    uint64_t v82 = v77;
                    while (1)
                    {
                      uint64_t v83 = v11 + v82;
                      long long v84 = *(_OWORD *)(v11 + v82 + 16);
                      *(_OWORD *)(v83 + 40) = *(_OWORD *)(v11 + v82);
                      *(_OWORD *)(v83 + 56) = v84;
                      *(void *)(v83 + 72) = *(void *)(v11 + v82 + 32);
                      if (!v82) {
                        break;
                      }
                      v82 -= 40;
                      if (v80 >= *(_DWORD *)(v83 - 8))
                      {
                        uint64_t v85 = v11 + v82 + 40;
                        goto LABEL_84;
                      }
                    }
                    uint64_t v85 = v11;
LABEL_84:
                    *(_OWORD *)uint64_t v85 = v140;
                    *(_OWORD *)(v85 + 16) = v150;
                    *(_DWORD *)(v85 + 32) = v80;
                    *(_DWORD *)(v85 + 36) = v81;
                  }
                  BOOL v74 = (_OWORD *)((char *)v79 + 40);
                  v77 += 40;
                  unint64_t v78 = v79;
                }
                while ((_OWORD *)((char *)v79 + 40) != (_OWORD *)a2);
              }
            }
            else if (!v76)
            {
              do
              {
                long long v124 = v74;
                unsigned int v125 = *(_DWORD *)(a1 + 72);
                if (v125 < *(_DWORD *)(a1 + 32))
                {
                  long long v143 = *v74;
                  long long v153 = v74[1];
                  int v126 = *(_DWORD *)(a1 + 76);
                  uint64_t v127 = v124;
                  do
                  {
                    long long v128 = *(_OWORD *)((char *)v127 - 24);
                    _OWORD *v127 = *(_OWORD *)((char *)v127 - 40);
                    v127[1] = v128;
                    *((void *)v127 + 4) = *((void *)v127 - 1);
                    unsigned int v129 = *((_DWORD *)v127 - 12);
                    uint64_t v127 = (_OWORD *)((char *)v127 - 40);
                  }
                  while (v125 < v129);
                  _OWORD *v127 = v143;
                  v127[1] = v153;
                  *((_DWORD *)v127 + 8) = v125;
                  *((_DWORD *)v127 + 9) = v126;
                }
                BOOL v74 = (_OWORD *)((char *)v124 + 40);
                a1 = (unint64_t)v124;
              }
              while ((_OWORD *)((char *)v124 + 40) != (_OWORD *)a2);
            }
            return;
          }
          if (!a3)
          {
            if (v11 != a2)
            {
              int64_t v86 = (v13 - 2) >> 1;
              int64_t v87 = v86;
              do
              {
                int64_t v88 = v87;
                if (v86 >= v87)
                {
                  uint64_t v89 = (2 * v87) | 1;
                  unint64_t v90 = v11 + 40 * v89;
                  if (2 * v88 + 2 < (uint64_t)v13)
                  {
                    unsigned int v91 = *(_DWORD *)(v11 + 40 * v89 + 32);
                    unsigned int v92 = *(_DWORD *)(v90 + 72);
                    v90 += 40 * (v91 < v92);
                    if (v91 < v92) {
                      uint64_t v89 = 2 * v88 + 2;
                    }
                  }
                  unsigned int v93 = *(_DWORD *)(v11 + 40 * v88 + 32);
                  if (*(_DWORD *)(v90 + 32) >= v93)
                  {
                    unint64_t v94 = v11 + 40 * v88;
                    long long v141 = *(_OWORD *)v94;
                    long long v151 = *(_OWORD *)(v94 + 16);
                    int v95 = *(_DWORD *)(v94 + 36);
                    do
                    {
                      unint64_t v96 = v94;
                      unint64_t v94 = v90;
                      long long v97 = *(_OWORD *)v90;
                      long long v98 = *(_OWORD *)(v90 + 16);
                      *(void *)(v96 + 32) = *(void *)(v90 + 32);
                      *(_OWORD *)unint64_t v96 = v97;
                      *(_OWORD *)(v96 + 16) = v98;
                      if (v86 < v89) {
                        break;
                      }
                      uint64_t v99 = (2 * v89) | 1;
                      unint64_t v90 = v11 + 40 * v99;
                      uint64_t v100 = 2 * v89 + 2;
                      if (v100 < (uint64_t)v13)
                      {
                        unsigned int v101 = *(_DWORD *)(v11 + 40 * v99 + 32);
                        unsigned int v102 = *(_DWORD *)(v90 + 72);
                        v90 += 40 * (v101 < v102);
                        if (v101 < v102) {
                          uint64_t v99 = v100;
                        }
                      }
                      uint64_t v89 = v99;
                    }
                    while (*(_DWORD *)(v90 + 32) >= v93);
                    *(_OWORD *)unint64_t v94 = v141;
                    *(_OWORD *)(v94 + 16) = v151;
                    *(_DWORD *)(v94 + 32) = v93;
                    *(_DWORD *)(v94 + 36) = v95;
                  }
                }
                int64_t v87 = v88 - 1;
              }
              while (v88);
              int64_t v103 = v12 / 0x28uLL;
              do
              {
                uint64_t v104 = 0;
                uint64_t v158 = *(void *)(v11 + 32);
                long long v142 = *(_OWORD *)v11;
                long long v152 = *(_OWORD *)(v11 + 16);
                unint64_t v105 = v11;
                do
                {
                  uint64_t v106 = v104 + 1;
                  unint64_t v107 = v105 + 40 * (v104 + 1);
                  uint64_t v108 = (2 * v104) | 1;
                  uint64_t v109 = 2 * v104 + 2;
                  if (v109 < v103)
                  {
                    unsigned int v110 = *(_DWORD *)(v105 + 40 * v106 + 32);
                    unsigned int v111 = *(_DWORD *)(v107 + 72);
                    v107 += 40 * (v110 < v111);
                    if (v110 < v111) {
                      uint64_t v108 = v109;
                    }
                  }
                  long long v112 = *(_OWORD *)v107;
                  long long v113 = *(_OWORD *)(v107 + 16);
                  *(void *)(v105 + 32) = *(void *)(v107 + 32);
                  *(_OWORD *)unint64_t v105 = v112;
                  *(_OWORD *)(v105 + 16) = v113;
                  unint64_t v105 = v107;
                  uint64_t v104 = v108;
                }
                while (v108 <= (uint64_t)((unint64_t)(v103 - 2) >> 1));
                a2 -= 40;
                if (v107 == a2)
                {
                  *(void *)(v107 + 32) = v158;
                  *(_OWORD *)unint64_t v107 = v142;
                  *(_OWORD *)(v107 + 16) = v152;
                }
                else
                {
                  long long v114 = *(_OWORD *)a2;
                  long long v115 = *(_OWORD *)(a2 + 16);
                  *(void *)(v107 + 32) = *(void *)(a2 + 32);
                  *(_OWORD *)unint64_t v107 = v114;
                  *(_OWORD *)(v107 + 16) = v115;
                  *(void *)(a2 + 32) = v158;
                  *(_OWORD *)a2 = v142;
                  *(_OWORD *)(a2 + 16) = v152;
                  uint64_t v116 = v107 - v11 + 40;
                  if (v116 >= 41)
                  {
                    unint64_t v117 = (v116 / 0x28uLL - 2) >> 1;
                    unsigned int v118 = *(_DWORD *)(v107 + 32);
                    if (*(_DWORD *)(v11 + 40 * v117 + 32) < v118)
                    {
                      long long v132 = *(_OWORD *)v107;
                      long long v135 = *(_OWORD *)(v107 + 16);
                      int v119 = *(_DWORD *)(v107 + 36);
                      do
                      {
                        unint64_t v120 = v107;
                        unint64_t v107 = v11 + 40 * v117;
                        long long v121 = *(_OWORD *)v107;
                        long long v122 = *(_OWORD *)(v107 + 16);
                        *(void *)(v120 + 32) = *(void *)(v107 + 32);
                        *(_OWORD *)unint64_t v120 = v121;
                        *(_OWORD *)(v120 + 16) = v122;
                        if (!v117) {
                          break;
                        }
                        unint64_t v117 = (v117 - 1) >> 1;
                      }
                      while (*(_DWORD *)(v11 + 40 * v117 + 32) < v118);
                      *(_OWORD *)unint64_t v107 = v132;
                      *(_OWORD *)(v107 + 16) = v135;
                      *(_DWORD *)(v107 + 32) = v118;
                      *(_DWORD *)(v107 + 36) = v119;
                    }
                  }
                }
              }
              while (v103-- > 2);
            }
            return;
          }
          unint64_t v14 = v13 >> 1;
          unint64_t v15 = v11 + 40 * (v13 >> 1);
          if ((unint64_t)v12 >= 0x1401)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>((long long *)a1, (long long *)(a1 + 40 * (v13 >> 1)), (long long *)(a2 - 40));
            uint64_t v16 = 5 * v14;
            uint64_t v17 = (long long *)(a1 + 40 * v14 - 40);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>((long long *)(a1 + 40), v17, (long long *)(a2 - 80));
            unint64_t v18 = (long long *)(a1 + 40 + 8 * v16);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>((long long *)(a1 + 80), v18, (long long *)(a2 - 120));
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>(v17, (long long *)v15, v18);
            uint64_t v154 = *(void *)(a1 + 32);
            long long v136 = *(_OWORD *)a1;
            long long v144 = *(_OWORD *)(a1 + 16);
            long long v19 = *(_OWORD *)v15;
            long long v20 = *(_OWORD *)(v15 + 16);
            *(void *)(a1 + 32) = *(void *)(v15 + 32);
            *(_OWORD *)a1 = v19;
            *(_OWORD *)(a1 + 16) = v20;
            *(void *)(v15 + 32) = v154;
            *(_OWORD *)unint64_t v15 = v136;
            *(_OWORD *)(v15 + 16) = v144;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>((long long *)(a1 + 40 * (v13 >> 1)), (long long *)a1, (long long *)(a2 - 40));
          }
          --a3;
          if (a4) {
            break;
          }
          unsigned int v21 = *(_DWORD *)(a1 + 32);
          if (*(_DWORD *)(a1 - 8) < v21) {
            goto LABEL_12;
          }
          long long v131 = *(_OWORD *)a1;
          long long v134 = *(_OWORD *)(a1 + 16);
          if (v21 >= *(_DWORD *)(a2 - 8))
          {
            unint64_t v43 = a1 + 40;
            do
            {
              unint64_t v11 = v43;
              if (v43 >= a2) {
                break;
              }
              unsigned int v44 = *(_DWORD *)(v43 + 32);
              v43 += 40;
            }
            while (v21 >= v44);
          }
          else
          {
            unint64_t v41 = a1;
            do
            {
              unint64_t v11 = v41 + 40;
              unsigned int v42 = *(_DWORD *)(v41 + 72);
              v41 += 40;
            }
            while (v21 >= v42);
          }
          unint64_t v45 = a2;
          if (v11 < a2)
          {
            unint64_t v46 = a2;
            do
            {
              unint64_t v45 = v46 - 40;
              unsigned int v47 = *(_DWORD *)(v46 - 8);
              v46 -= 40;
            }
            while (v21 < v47);
          }
          int v48 = *(_DWORD *)(a1 + 36);
          while (v11 < v45)
          {
            uint64_t v155 = *(void *)(v11 + 32);
            long long v137 = *(_OWORD *)v11;
            long long v146 = *(_OWORD *)(v11 + 16);
            long long v49 = *(_OWORD *)v45;
            long long v50 = *(_OWORD *)(v45 + 16);
            *(void *)(v11 + 32) = *(void *)(v45 + 32);
            *(_OWORD *)unint64_t v11 = v49;
            *(_OWORD *)(v11 + 16) = v50;
            *(void *)(v45 + 32) = v155;
            *(_OWORD *)unint64_t v45 = v137;
            *(_OWORD *)(v45 + 16) = v146;
            do
            {
              unsigned int v51 = *(_DWORD *)(v11 + 72);
              v11 += 40;
            }
            while (v21 >= v51);
            do
            {
              unsigned int v52 = *(_DWORD *)(v45 - 8);
              v45 -= 40;
            }
            while (v21 < v52);
          }
          uint64_t v53 = (long long *)(v11 - 40);
          BOOL v4 = v11 - 40 >= a1;
          BOOL v5 = v11 - 40 == a1;
          if (v11 - 40 != a1)
          {
            long long v54 = *v53;
            long long v55 = *(_OWORD *)(v11 - 24);
            *(void *)(a1 + 32) = *(void *)(v11 - 8);
            *(_OWORD *)a1 = v54;
            *(_OWORD *)(a1 + 16) = v55;
          }
          a4 = 0;
          *uint64_t v53 = v131;
          *(_OWORD *)(v11 - 24) = v134;
          *(_DWORD *)(v11 - 8) = v21;
          *(_DWORD *)(v11 - 4) = v48;
        }
        unsigned int v21 = *(_DWORD *)(a1 + 32);
LABEL_12:
        long long v130 = *(_OWORD *)a1;
        long long v133 = *(_OWORD *)(a1 + 16);
        int v22 = *(_DWORD *)(a1 + 36);
        unint64_t v23 = a1;
        do
        {
          unint64_t v24 = v23;
          v23 += 40;
        }
        while (*(_DWORD *)(v24 + 72) < v21);
        unint64_t v25 = a2;
        if (v24 == a1)
        {
          unint64_t v28 = a2;
          while (v23 < v28)
          {
            unint64_t v26 = v28 - 40;
            unsigned int v29 = *(_DWORD *)(v28 - 8);
            v28 -= 40;
            if (v29 < v21) {
              goto LABEL_22;
            }
          }
          unint64_t v26 = v28;
        }
        else
        {
          do
          {
            unint64_t v26 = v25 - 40;
            unsigned int v27 = *(_DWORD *)(v25 - 8);
            v25 -= 40;
          }
          while (v27 >= v21);
        }
LABEL_22:
        unint64_t v11 = v23;
        if (v23 < v26)
        {
          unint64_t v30 = v26;
          do
          {
            long long v31 = *(_OWORD *)v11;
            long long v145 = *(_OWORD *)(v11 + 16);
            uint64_t v32 = *(void *)(v11 + 32);
            long long v34 = *(_OWORD *)v30;
            long long v33 = *(_OWORD *)(v30 + 16);
            *(void *)(v11 + 32) = *(void *)(v30 + 32);
            *(_OWORD *)unint64_t v11 = v34;
            *(_OWORD *)(v11 + 16) = v33;
            *(void *)(v30 + 32) = v32;
            *(_OWORD *)unint64_t v30 = v31;
            *(_OWORD *)(v30 + 16) = v145;
            do
            {
              unsigned int v35 = *(_DWORD *)(v11 + 72);
              v11 += 40;
            }
            while (v35 < v21);
            do
            {
              unsigned int v36 = *(_DWORD *)(v30 - 8);
              v30 -= 40;
            }
            while (v36 >= v21);
          }
          while (v11 < v30);
        }
        unint64_t v37 = (long long *)(v11 - 40);
        if (v11 - 40 != a1)
        {
          long long v38 = *v37;
          long long v39 = *(_OWORD *)(v11 - 24);
          *(void *)(a1 + 32) = *(void *)(v11 - 8);
          *(_OWORD *)a1 = v38;
          *(_OWORD *)(a1 + 16) = v39;
        }
        long long *v37 = v130;
        *(_OWORD *)(v11 - 24) = v133;
        *(_DWORD *)(v11 - 8) = v21;
        *(_DWORD *)(v11 - 4) = v22;
        if (v23 >= v26) {
          break;
        }
LABEL_33:
        std::__introsort<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator() const(std::queue<ProfileEvent>)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*,false>(a1, v11 - 40, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v40 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator() const(std::queue<ProfileEvent>)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>(a1, v11 - 40);
      if (std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator() const(std::queue<ProfileEvent>)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>(v11, a2))
      {
        break;
      }
      if (!v40) {
        goto LABEL_33;
      }
    }
    a2 = v11 - 40;
    if (!v40) {
      continue;
    }
    break;
  }
}

- (unsigned)_computeSampleNormFactorForSample:(const ShaderProfilerUSCSampleInfo *)a3 forProgramStartAddress:(unint64_t)a4 forProgramEndAddress:(unint64_t)a5
{
  unint64_t var1 = a3->var6.var1;
  uint64_t v6 = (var1 >> 36) & 3;
  if (v6 == 3)
  {
    unint64_t var4 = a3->var4;
    if (var4 <= a4 || var4 >= a5) {
      goto LABEL_17;
    }
    unint64_t var0 = a3->var5.var0;
    BOOL v8 = var0 < a4 || var0 >= a5;
    unsigned int v9 = var1 >> 12;
    var1 >>= 24;
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_17;
    }
    unint64_t v7 = a3->var4;
    BOOL v8 = v7 < a5 && v7 >= a4;
    unsigned int v9 = var1 >> 12;
  }
  if (v8) {
    LOWORD(var1) = v9;
  }
LABEL_17:
  if ((var1 & 0xFFE) != 0) {
    return var1 & 0xFFF;
  }
  else {
    return 1;
  }
}

- (void)_cleanup
{
  if (*((void *)self + 5))
  {
    std::__hash_table<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::__unordered_map_hasher<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>>>::__deallocate_node(*((void **)self + 4));
    *((void *)self + 4) = 0;
    uint64_t v3 = *((void *)self + 3);
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*((void *)self + 2) + 8 * i) = 0;
    }
    *((void *)self + 5) = 0;
  }
  BOOL v5 = (void **)*((void *)self + 7);
  uint64_t v6 = (void **)*((void *)self + 8);
  while (v6 != v5)
  {
    v6 -= 3;
    unint64_t v30 = v6;
    std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((void *)self + 8) = v5;
  uint64_t v8 = *((void *)self + 10);
  for (uint64_t j = *((void *)self + 11);
        j != v8;
  *((void *)self + 11) = v8;
  if (*((void *)self + 17))
  {
    std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__deallocate_node(*((void **)self + 16));
    *((void *)self + 16) = 0;
    uint64_t v9 = *((void *)self + 15);
    if (v9)
    {
      for (uint64_t k = 0; k != v9; ++k)
        *(void *)(*((void *)self + 14) + 8 * k) = 0;
    }
    *((void *)self + 17) = 0;
  }
  unint64_t v11 = (void *)*((void *)self + 19);
  *((void *)self + 19) = 0;

  uint64_t v12 = (void *)*((void *)self + 20);
  *((void *)self + 20) = 0;

  [*((id *)self + 22) removeAllObjects];
  unint64_t v13 = (void *)*((void *)self + 22);
  *((void *)self + 22) = 0;

  [*((id *)self + 23) removeAllObjects];
  unint64_t v14 = (void *)*((void *)self + 23);
  *((void *)self + 23) = 0;

  [*((id *)self + 24) removeAllObjects];
  unint64_t v15 = (void *)*((void *)self + 24);
  *((void *)self + 24) = 0;

  uint64_t v16 = (void **)*((void *)self + 25);
  uint64_t v17 = (void **)*((void *)self + 26);
  while (v17 != v16)
  {
    v17 -= 3;
    unint64_t v30 = v17;
    std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((void *)self + 26) = v16;
  unint64_t v18 = (void **)*((void *)self + 28);
  long long v19 = (void **)*((void *)self + 29);
  while (v19 != v18)
  {
    v19 -= 3;
    unint64_t v30 = v19;
    std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((void *)self + 29) = v18;
  long long v20 = (void **)*((void *)self + 31);
  unsigned int v21 = (void **)*((void *)self + 32);
  while (v21 != v20)
  {
    v21 -= 3;
    unint64_t v30 = v21;
    std::vector<std::unique_ptr<std::vector<double>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((void *)self + 32) = v20;
  int v22 = (void **)*((void *)self + 34);
  unint64_t v23 = (void **)*((void *)self + 35);
  while (v23 != v22)
  {
    v23 -= 3;
    unint64_t v30 = v23;
    std::vector<std::unique_ptr<std::vector<double>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((void *)self + 35) = v22;
  uint64_t v25 = *((void *)self + 37);
  for (uint64_t m = *((void *)self + 38);
        m != v25;
  *((void *)self + 38) = v25;
  *((void *)self + 41) = *((void *)self + 40);
  unint64_t v26 = (char *)self + 344;
  do
  {
    *((void *)v26 + 1) = *(void *)v26;
    v26 += 24;
  }
  while (v26 != (char *)self + 416);
  unsigned int v27 = (void *)*((void *)self + 57);
  *((void *)self + 57) = 0;

  *((void *)self + 59) = *((void *)self + 58);
  unint64_t v28 = (void *)*((void *)self + 61);
  *((void *)self + 61) = 0;

  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear((void *)self + 62);
  [*((id *)self + 21) removeAllObjects];
  unsigned int v29 = (void *)*((void *)self + 21);
  *((void *)self + 21) = 0;
}

- (void)_dumpTraceBufferPacketsInFile:(__sFILE *)a3 usingTracePackets:(unsigned int *)a4 withExtractedSamples:(const void *)a5 withTraceBufferCount:(unsigned int)a6 forTargetIndex:(int)a7
{
  if ((*a4 & 3) != 1) {
    return;
  }
  uint64_t v7 = *(void *)&a7;
  fprintf(a3, "[%u]Trace Buffer\n", a6);
  std::string::basic_string[abi:nn180100]<0>(&v44, "");
  std::string::basic_string[abi:nn180100]<0>(v45, "");
  std::string::basic_string[abi:nn180100]<0>(v46, "");
  std::string::basic_string[abi:nn180100]<0>(&v47, "");
  std::string::basic_string[abi:nn180100]<0>(v48, "");
  std::string::basic_string[abi:nn180100]<0>(v49, "");
  std::string::basic_string[abi:nn180100]<0>(v50, "");
  std::string::basic_string[abi:nn180100]<0>(v51, "");
  v43[0] = (std::string *)operator new(0xC0uLL);
  v43[2] = v43[0] + 8;
  uint64_t v12 = 0;
  v43[1] = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(&v44, &v52, v43[0]);
  do
  {
    if (SHIBYTE(v51[v12 + 2]) < 0) {
      operator delete((void *)v51[v12]);
    }
    v12 -= 3;
  }
  while (v12 != -24);
  unint64_t v13 = [(DYPMTLShaderProfilerHelper *)self _eventTypesForTarget:v7];
  if (v13)
  {
    uint64_t v14 = 0;
    for (unint64_t i = 0; i < (unint64_t)[v13 count]; ++i)
    {
      id v16 = [v13 objectAtIndexedSubscript:i];
      std::string::assign(&v43[0][v14], (const std::string::value_type *)[v16 UTF8String]);

      ++v14;
    }
  }
  std::string::basic_string[abi:nn180100]<0>(&v44, "%1u %s %4u %4u");
  std::string::basic_string[abi:nn180100]<0>(v45, "%6u %4u %4u");
  std::string::basic_string[abi:nn180100]<0>(v46, "%d 0x%X %u,%u, %u,%u");
  v42[0] = (std::string *)operator new(0x48uLL);
  v42[2] = v42[0] + 3;
  uint64_t v17 = 0;
  v42[1] = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(&v44, &v47, v42[0]);
  do
  {
    if (SHIBYTE(v46[v17 + 2]) < 0) {
      operator delete((void *)v46[v17]);
    }
    v17 -= 3;
  }
  while (v17 != -9);
  unint64_t v18 = [(DYPMTLShaderProfilerHelper *)self _traceHeaders];
  uint64_t v19 = (uint64_t)v18;
  if (v18)
  {
    id v20 = [v18 objectAtIndexedSubscript:0];
    std::string::assign(v42[0], (const std::string::value_type *)[v20 UTF8String]);

    id v21 = [(id)v19 objectAtIndexedSubscript:1];
    std::string::assign(v42[0] + 1, (const std::string::value_type *)[v21 UTF8String]);

    id v22 = [(id)v19 objectAtIndexedSubscript:2];
    std::string::assign(v42[0] + 2, (const std::string::value_type *)[v22 UTF8String]);
  }
  unint64_t v41 = (void *)v19;
  LODWORD(v19) = 0;
  do
  {
    unint64_t v23 = a4[(int)v19];
    if ((v23 & 1) == 0)
    {
      if ((a4[(int)v19] & 3) == 2)
      {
        unint64_t v24 = &v43[0][(v23 >> 2) & 7];
        if (SHIBYTE(v24->__r_.__value_.__r.__words[2]) < 0) {
          unint64_t v24 = (std::string *)v24->__r_.__value_.__r.__words[0];
        }
        uint64_t v25 = &v43[0][(v23 >> 17) & 7];
        if (SHIBYTE(v25->__r_.__value_.__r.__words[2]) < 0) {
          uint64_t v25 = (std::string *)v25->__r_.__value_.__r.__words[0];
        }
        fprintf(a3, "A [%s %4u] : B [%s %4u]\n", (const char *)v24, (v23 >> 5) & 0xFFF, (const char *)v25, v23 >> 20);
      }
      else
      {
        fwrite("Invalid Packet Type\n", 0x14uLL, 1uLL, a3);
      }
      goto LABEL_39;
    }
    uint64_t v26 = (v23 >> 8) & 0x3FF;
    uint64_t v27 = (v23 >> 18) & 0x3FF;
    if ((int)v7 <= 0)
    {
      unsigned int data = v42[0];
      if (SHIBYTE(v42[0]->__r_.__value_.__r.__words[2]) < 0) {
        unsigned int data = (std::string *)v42[0]->__r_.__value_.__l.__data_;
      }
      uint64_t v30 = (v23 >> 4) & 1;
      unsigned int v31 = (v23 >> 5) & 3;
      uint64_t v32 = "CDM";
      if (v31 == 1) {
        uint64_t v32 = "PDM";
      }
      long long v33 = v31 ? (char *)v32 : "VDM";
      fprintf(a3, (const char *)data, v30, v33, v26, v27);
    }
    else
    {
      unint64_t v28 = v42[0] + 1;
      if (SHIBYTE(v42[0][1].__r_.__value_.__r.__words[2]) < 0) {
        unint64_t v28 = (std::string *)v28->__r_.__value_.__r.__words[0];
      }
      fprintf(a3, (const char *)v28, (v23 >> 22) & 0x3C0 | (v23 >> 2) & 0x1F | (((v23 >> 4) & 1) << 13), (v23 >> 8) & 0x3FF, (v23 >> 18) & 0x3FF, v40);
    }
    if ((int)v19 > 6) {
      break;
    }
    uint64_t v19 = (int)v19 + 1;
    fprintf(a3, "PC = 0x%X\n", a4[v19]);
LABEL_39:
    BOOL v34 = (int)v19 < 7;
    LODWORD(v19) = v19 + 1;
  }
  while (v34);
  unsigned int v35 = *(unsigned int **)a5;
  unsigned int v36 = (unsigned int *)*((void *)a5 + 1);
  if (*(unsigned int **)a5 != v36)
  {
    uint64_t v37 = 0;
    do
    {
      long long v38 = v42[0] + 2;
      if (SHIBYTE(v42[0][2].__r_.__value_.__r.__words[2]) < 0) {
        long long v38 = (std::string *)v38->__r_.__value_.__r.__words[0];
      }
      uint64_t v39 = (v37 + 1);
      fprintf(a3, (const char *)v38, v37, v35[3], v35[8], *v35, v35[2], v35[6] & 0xFFF, v41);
      v35 += 10;
      uint64_t v37 = v39;
    }
    while (v35 != v36);
  }

  *(void *)&long long v44 = v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v44);

  *(void *)&long long v44 = v43;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v44);
}

- (id)_costHeaders
{
  return &off_758C00;
}

- (id)_traceHeaders
{
  return &off_758BE8;
}

- (id)_eventTypesForTarget:(int)a3
{
  if (a3 >= 2) {
    return &off_758BD0;
  }
  else {
    return &off_758BB8;
  }
}

- (DYPMTLShaderProfilerHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)DYPMTLShaderProfilerHelper;
  id v2 = [(DYPMTLShaderProfilerHelper *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"GPUShaderProfilerIgnoreBlockSamplingBiasAdjustment"];

    if (v4) {
      *((unsigned char *)v2 + 8) = 1;
    }
    id v5 = objc_alloc_init((Class)NSOperationQueue);
    uint64_t v6 = (void *)*((void *)v2 + 92);
    *((void *)v2 + 92) = v5;

    [*((id *)v2 + 92) setName:@"gputools.GPUToolsDebugger.GPUToolsPlatform.ShaderProfiler.ParallelQueue"];
    [*((id *)v2 + 92) setMaxConcurrentOperationCount:std::thread::hardware_concurrency()];
    id v7 = objc_alloc_init((Class)NSOperationQueue);
    uint64_t v8 = (void *)*((void *)v2 + 93);
    *((void *)v2 + 93) = v7;

    [*((id *)v2 + 93) setName:@"gputools.GPUToolsDebugger.GPUToolsPlatform.ShaderProfiler.SerialQueue"];
    [*((id *)v2 + 93) setMaxConcurrentOperationCount:1];
  }
  return (DYPMTLShaderProfilerHelper *)v2;
}

@end