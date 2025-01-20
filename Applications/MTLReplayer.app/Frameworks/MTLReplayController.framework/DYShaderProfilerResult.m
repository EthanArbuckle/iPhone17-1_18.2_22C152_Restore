@interface DYShaderProfilerResult
- (DYShaderProfilerResult)init;
- (DYShaderProfilerTiming)computeTiming;
- (DYShaderProfilerTiming)fragmentTiming;
- (DYShaderProfilerTiming)timing;
- (DYShaderProfilerTiming)vertexTiming;
- (NSArray)blitTimeData;
- (NSDictionary)derivedCountersData;
- (NSDictionary)encoderIndexToLabelMap;
- (NSMutableArray)averagePerDrawKickDurations;
- (NSMutableArray)drawCallInfoList;
- (NSMutableArray)effectiveKickTimes;
- (NSMutableArray)effectivePerEncoderDrawKickTimes;
- (NSMutableArray)encoderFunctionIndexList;
- (NSMutableArray)encoderInfoList;
- (NSMutableArray)loadActionTimes;
- (NSMutableArray)perCommandBufferEncoderCount;
- (NSMutableArray)programInfoList;
- (NSMutableArray)programPipelineInfoList;
- (NSMutableArray)shaderProfilingFrameTimes;
- (NSMutableArray)storeActionTimes;
- (NSMutableDictionary)blitEncoderTimeInfo;
- (NSMutableDictionary)encoderFunctionIndexToEncoderIndexMap;
- (double)gpuTime;
- (double)shaderProfilingTime;
- (id).cxx_construct;
- (unint64_t)frameTime;
- (unsigned)commandBufferCount;
- (unsigned)deviceUtilization;
- (unsigned)encoderCount;
- (void)buildDrawCallIndexMap;
- (void)setAveragePerDrawKickDurations:(id)a3;
- (void)setBlitEncoderTimeInfo:(id)a3;
- (void)setBlitTimeData:(id)a3;
- (void)setCommandBufferCount:(unsigned int)a3;
- (void)setComputeTiming:(DYShaderProfilerTiming *)a3;
- (void)setDerivedCountersData:(id)a3;
- (void)setDeviceUtilization:(unsigned int)a3;
- (void)setDrawCallInfoList:(id)a3;
- (void)setEffectiveKickTimes:(id)a3;
- (void)setEffectivePerEncoderDrawKickTimes:(id)a3;
- (void)setEncoderCount:(unsigned int)a3;
- (void)setEncoderIndexToLabelMap:(id)a3;
- (void)setFragmentTiming:(DYShaderProfilerTiming *)a3;
- (void)setFrameTime:(unint64_t)a3;
- (void)setGpuTime:(double)a3;
- (void)setLoadActionTimes:(id)a3;
- (void)setPerCommandBufferEncoderCount:(id)a3;
- (void)setProgramPipelineInfoList:(id)a3;
- (void)setShaderProfilingFrameTimes:(id)a3;
- (void)setShaderProfilingTime:(double)a3;
- (void)setStoreActionTimes:(id)a3;
- (void)setTiming:(DYShaderProfilerTiming *)a3;
- (void)setVertexTiming:(DYShaderProfilerTiming *)a3;
@end

@implementation DYShaderProfilerResult

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 58) = 1065353216;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_DWORD *)self + 76) = 1065353216;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((_DWORD *)self + 86) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaderProfilingFrameTimes, 0);
  objc_storeStrong((id *)&self->_blitEncoderTimeInfo, 0);
  objc_storeStrong((id *)&self->_blitTimeData, 0);
  objc_storeStrong((id *)&self->_derivedCountersData, 0);
  objc_storeStrong((id *)&self->_encoderIndexToLabelMap, 0);
  objc_storeStrong((id *)&self->_perCommandBufferEncoderCount, 0);
  objc_storeStrong((id *)&self->_storeActionTimes, 0);
  objc_storeStrong((id *)&self->_loadActionTimes, 0);
  objc_storeStrong((id *)&self->_averagePerDrawKickDurations, 0);
  objc_storeStrong((id *)&self->_effectivePerEncoderDrawKickTimes, 0);
  objc_storeStrong((id *)&self->_effectiveKickTimes, 0);
  objc_storeStrong((id *)&self->_encoderFunctionIndexToEncoderIndexMap, 0);
  objc_storeStrong((id *)&self->_programPipelineInfoList, 0);
  objc_storeStrong((id *)&self->_programInfoList, 0);
  objc_storeStrong((id *)&self->_encoderFunctionIndexList, 0);
  objc_storeStrong((id *)&self->_encoderInfoList, 0);
  objc_storeStrong((id *)&self->_drawCallInfoList, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>>>::__deallocate_node((void *)self->_functionIndexToDrawCallIndexMap.__table_.__p1_.__value_.__next_);
  value = self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_perContextDrawCallCounterDY);
  objc_storeStrong((id *)&self->_allShaderBinaryInfo, 0);
  objc_storeStrong((id *)&self->_computeKernelBinaryInfo, 0);
  objc_storeStrong((id *)&self->_fragmentShaderBinaryInfo, 0);
  objc_storeStrong((id *)&self->_vertexShaderBinaryInfo, 0);

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_drawCallInfoIndexMap);
}

- (void)setShaderProfilingTime:(double)a3
{
  self->_shaderProfilingTime = a3;
}

- (double)shaderProfilingTime
{
  return self->_shaderProfilingTime;
}

- (void)setShaderProfilingFrameTimes:(id)a3
{
}

- (NSMutableArray)shaderProfilingFrameTimes
{
  return self->_shaderProfilingFrameTimes;
}

- (void)setTiming:(DYShaderProfilerTiming *)a3
{
  long long v3 = *(_OWORD *)&a3->_cycle.average;
  long long v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_timing._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_timing._cycle.max = v4;
  *(_OWORD *)&self->_timing._cycle.average = v3;
}

- (DYShaderProfilerTiming)timing
{
  long long v3 = *(_OWORD *)&self[3]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[3]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[3]._time.max;
  return self;
}

- (void)setBlitEncoderTimeInfo:(id)a3
{
}

- (NSMutableDictionary)blitEncoderTimeInfo
{
  return self->_blitEncoderTimeInfo;
}

- (void)setBlitTimeData:(id)a3
{
}

- (NSArray)blitTimeData
{
  return self->_blitTimeData;
}

- (void)setEncoderCount:(unsigned int)a3
{
  self->_encoderCount = a3;
}

- (unsigned)encoderCount
{
  return self->_encoderCount;
}

- (void)setGpuTime:(double)a3
{
  self->_gpuTime = a3;
}

- (double)gpuTime
{
  return self->_gpuTime;
}

- (void)setDeviceUtilization:(unsigned int)a3
{
  self->_deviceUtilization = a3;
}

- (unsigned)deviceUtilization
{
  return self->_deviceUtilization;
}

- (void)setFrameTime:(unint64_t)a3
{
  self->_frameTime = a3;
}

- (unint64_t)frameTime
{
  return self->_frameTime;
}

- (void)setDerivedCountersData:(id)a3
{
}

- (NSDictionary)derivedCountersData
{
  return self->_derivedCountersData;
}

- (void)setEncoderIndexToLabelMap:(id)a3
{
}

- (NSDictionary)encoderIndexToLabelMap
{
  return self->_encoderIndexToLabelMap;
}

- (void)setPerCommandBufferEncoderCount:(id)a3
{
}

- (NSMutableArray)perCommandBufferEncoderCount
{
  return self->_perCommandBufferEncoderCount;
}

- (void)setCommandBufferCount:(unsigned int)a3
{
  self->_commandBufferCount = a3;
}

- (unsigned)commandBufferCount
{
  return self->_commandBufferCount;
}

- (void)setStoreActionTimes:(id)a3
{
}

- (NSMutableArray)storeActionTimes
{
  return self->_storeActionTimes;
}

- (void)setLoadActionTimes:(id)a3
{
}

- (NSMutableArray)loadActionTimes
{
  return self->_loadActionTimes;
}

- (void)setAveragePerDrawKickDurations:(id)a3
{
}

- (NSMutableArray)averagePerDrawKickDurations
{
  return self->_averagePerDrawKickDurations;
}

- (void)setEffectivePerEncoderDrawKickTimes:(id)a3
{
}

- (NSMutableArray)effectivePerEncoderDrawKickTimes
{
  return self->_effectivePerEncoderDrawKickTimes;
}

- (void)setEffectiveKickTimes:(id)a3
{
}

- (NSMutableArray)effectiveKickTimes
{
  return self->_effectiveKickTimes;
}

- (void)setComputeTiming:(DYShaderProfilerTiming *)a3
{
  long long v3 = *(_OWORD *)&a3->_cycle.average;
  long long v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_computeTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_computeTiming._cycle.max = v4;
  *(_OWORD *)&self->_computeTiming._cycle.average = v3;
}

- (DYShaderProfilerTiming)computeTiming
{
  long long v3 = *(_OWORD *)&self[2]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[2]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[2]._time.max;
  return self;
}

- (void)setFragmentTiming:(DYShaderProfilerTiming *)a3
{
  long long v3 = *(_OWORD *)&a3->_cycle.average;
  long long v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_fragmentTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_fragmentTiming._cycle.max = v4;
  *(_OWORD *)&self->_fragmentTiming._cycle.average = v3;
}

- (DYShaderProfilerTiming)fragmentTiming
{
  long long v3 = *(_OWORD *)&self[1]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[1]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[1]._time.max;
  return self;
}

- (void)setVertexTiming:(DYShaderProfilerTiming *)a3
{
  long long v3 = *(_OWORD *)&a3->_cycle.average;
  long long v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_vertexTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_vertexTiming._cycle.max = v4;
  *(_OWORD *)&self->_vertexTiming._cycle.average = v3;
}

- (DYShaderProfilerTiming)vertexTiming
{
  long long v3 = *(_OWORD *)&self->_time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self->_cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self->_time.max;
  return self;
}

- (NSMutableDictionary)encoderFunctionIndexToEncoderIndexMap
{
  return self->_encoderFunctionIndexToEncoderIndexMap;
}

- (void)setProgramPipelineInfoList:(id)a3
{
}

- (NSMutableArray)programPipelineInfoList
{
  return self->_programPipelineInfoList;
}

- (NSMutableArray)programInfoList
{
  return self->_programInfoList;
}

- (NSMutableArray)encoderFunctionIndexList
{
  return self->_encoderFunctionIndexList;
}

- (NSMutableArray)encoderInfoList
{
  return self->_encoderInfoList;
}

- (void)setDrawCallInfoList:(id)a3
{
}

- (NSMutableArray)drawCallInfoList
{
  return self->_drawCallInfoList;
}

- (void)buildDrawCallIndexMap
{
  if (self->_functionIndexToDrawCallIndexMap.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>>>::__deallocate_node((void *)self->_functionIndexToDrawCallIndexMap.__table_.__p1_.__value_.__next_);
    self->_functionIndexToDrawCallIndexMap.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_functionIndexToDrawCallIndexMap.__table_.__p2_.__value_ = 0;
  }
  drawCallInfoList = self->_drawCallInfoList;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __47__DYShaderProfilerResult_buildDrawCallIndexMap__block_invoke;
  v6[3] = &unk_745B30;
  v6[4] = self;
  [(NSMutableArray *)drawCallInfoList enumerateObjectsUsingBlock:v6];
}

void __47__DYShaderProfilerResult_buildDrawCallIndexMap__block_invoke(unint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v67 = v5;
  unsigned int v7 = [v5 functionIndex];
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(v6 + 320);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      a1 = v7;
      if (v9 <= v7) {
        a1 = v7 % v9;
      }
    }
    else
    {
      a1 = (v9 - 1) & v7;
    }
    v11 = *(float ***)(*(void *)(v6 + 312) + 8 * a1);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = *(float **)i)
      {
        unint64_t v13 = *((void *)i + 1);
        if (v13 == v7)
        {
          if (*((void *)i + 2) == v7) {
            goto LABEL_74;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != a1) {
            break;
          }
        }
      }
    }
  }
  v14 = (char *)operator new(0x40uLL);
  v15 = (void *)(v6 + 328);
  v68[0] = v14;
  v68[1] = v6 + 328;
  *(void *)v14 = 0;
  *((void *)v14 + 1) = v8;
  *((void *)v14 + 2) = v8;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_OWORD *)(v14 + 40) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v69 = 1;
  float v16 = (float)(unint64_t)(*(void *)(v6 + 336) + 1);
  float v17 = *(float *)(v6 + 344);
  if (v9 && (float)(v17 * (float)v9) >= v16)
  {
    unint64_t v8 = a1;
    goto LABEL_64;
  }
  BOOL v18 = 1;
  if (v9 >= 3) {
    BOOL v18 = (v9 & (v9 - 1)) != 0;
  }
  unint64_t v19 = v18 | (2 * v9);
  unint64_t v20 = vcvtps_u32_f32(v16 / v17);
  if (v19 <= v20) {
    int8x8_t prime = (int8x8_t)v20;
  }
  else {
    int8x8_t prime = (int8x8_t)v19;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v9 = *(void *)(v6 + 320);
  }
  if (*(void *)&prime <= v9)
  {
    if (*(void *)&prime >= v9) {
      goto LABEL_60;
    }
    unint64_t v28 = vcvtps_u32_f32((float)*(unint64_t *)(v6 + 336) / *(float *)(v6 + 344));
    if (v9 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
    {
      unint64_t v28 = std::__next_prime(v28);
    }
    else
    {
      uint64_t v30 = 1 << -(char)__clz(v28 - 1);
      if (v28 >= 2) {
        unint64_t v28 = v30;
      }
    }
    if (*(void *)&prime <= v28) {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime >= v9)
    {
      unint64_t v9 = *(void *)(v6 + 320);
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      v65 = *(void **)(v6 + 312);
      *(void *)(v6 + 312) = 0;
      if (v65) {
        operator delete(v65);
      }
      unint64_t v9 = 0;
      *(void *)(v6 + 320) = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  v22 = operator new(8 * *(void *)&prime);
  v23 = *(void **)(v6 + 312);
  *(void *)(v6 + 312) = v22;
  if (v23) {
    operator delete(v23);
  }
  uint64_t v24 = 0;
  *(int8x8_t *)(v6 + 320) = prime;
  do
    *(void *)(*(void *)(v6 + 312) + 8 * v24++) = 0;
  while (*(void *)&prime != v24);
  v25 = (void *)*v15;
  if (*v15)
  {
    unint64_t v26 = v25[1];
    uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(void *)&prime) {
        v26 %= *(void *)&prime;
      }
    }
    else
    {
      v26 &= *(void *)&prime - 1;
    }
    *(void *)(*(void *)(v6 + 312) + 8 * v26) = v15;
    v31 = (void *)*v25;
    if (*v25)
    {
      do
      {
        unint64_t v32 = v31[1];
        if (v27.u32[0] > 1uLL)
        {
          if (v32 >= *(void *)&prime) {
            v32 %= *(void *)&prime;
          }
        }
        else
        {
          v32 &= *(void *)&prime - 1;
        }
        if (v32 != v26)
        {
          uint64_t v33 = *(void *)(v6 + 312);
          if (!*(void *)(v33 + 8 * v32))
          {
            *(void *)(v33 + 8 * v32) = v25;
            goto LABEL_56;
          }
          void *v25 = *v31;
          void *v31 = **(void **)(*(void *)(v6 + 312) + 8 * v32);
          **(void **)(*(void *)(v6 + 312) + 8 * v32) = v31;
          v31 = v25;
        }
        unint64_t v32 = v26;
LABEL_56:
        v25 = v31;
        v31 = (void *)*v31;
        unint64_t v26 = v32;
      }
      while (v31);
    }
  }
  unint64_t v9 = (unint64_t)prime;
LABEL_60:
  if ((v9 & (v9 - 1)) != 0)
  {
    if (v9 <= v8) {
      v8 %= v9;
    }
  }
  else
  {
    unint64_t v8 = (v9 - 1) & v8;
  }
LABEL_64:
  v34 = *(float ***)(*(void *)(v6 + 312) + 8 * v8);
  uint64_t i = (float *)v68[0];
  if (v34)
  {
    *(void *)v68[0] = *v34;
LABEL_72:
    *v34 = i;
    goto LABEL_73;
  }
  *(void *)v68[0] = *(void *)(v6 + 328);
  *(void *)(v6 + 328) = i;
  *(void *)(*(void *)(v6 + 312) + 8 * v8) = v15;
  if (*(void *)i)
  {
    unint64_t v35 = *(void *)(*(void *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v35 >= v9) {
        v35 %= v9;
      }
    }
    else
    {
      v35 &= v9 - 1;
    }
    v34 = (float **)(*(void *)(v6 + 312) + 8 * v35);
    goto LABEL_72;
  }
LABEL_73:
  v68[0] = 0;
  ++*(void *)(v6 + 336);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,void *>>>>::reset[abi:nn180100]((uint64_t)v68);
LABEL_74:
  signed int v36 = [v67 subCommandIndex];
  signed int v37 = v36;
  unint64_t v38 = v36;
  unint64_t v39 = *((void *)i + 4);
  if (v39)
  {
    uint8x8_t v40 = (uint8x8_t)vcnt_s8((int8x8_t)v39);
    v40.i16[0] = vaddlv_u8(v40);
    if (v40.u32[0] > 1uLL)
    {
      unint64_t v9 = v36;
      if (v39 <= v36) {
        unint64_t v9 = v36 % v39;
      }
    }
    else
    {
      unint64_t v9 = (v39 - 1) & v36;
    }
    v41 = *(void ***)(*((void *)i + 3) + 8 * v9);
    if (v41)
    {
      v42 = *v41;
      if (*v41)
      {
        do
        {
          unint64_t v43 = v42[1];
          if (v43 == v36)
          {
            if (*((_DWORD *)v42 + 4) == v36) {
              goto LABEL_147;
            }
          }
          else
          {
            if (v40.u32[0] > 1uLL)
            {
              if (v43 >= v39) {
                v43 %= v39;
              }
            }
            else
            {
              v43 &= v39 - 1;
            }
            if (v43 != v9) {
              break;
            }
          }
          v42 = (void *)*v42;
        }
        while (v42);
      }
    }
  }
  v42 = operator new(0x18uLL);
  void *v42 = 0;
  v42[1] = v38;
  *((_DWORD *)v42 + 4) = v37;
  *((_DWORD *)v42 + 5) = 0;
  float v44 = (float)(unint64_t)(*((void *)i + 6) + 1);
  float v45 = i[14];
  if (!v39 || (float)(v45 * (float)v39) < v44)
  {
    BOOL v46 = 1;
    if (v39 >= 3) {
      BOOL v46 = (v39 & (v39 - 1)) != 0;
    }
    unint64_t v47 = v46 | (2 * v39);
    unint64_t v48 = vcvtps_u32_f32(v44 / v45);
    if (v47 <= v48) {
      int8x8_t v49 = (int8x8_t)v48;
    }
    else {
      int8x8_t v49 = (int8x8_t)v47;
    }
    if (*(void *)&v49 == 1)
    {
      int8x8_t v49 = (int8x8_t)2;
    }
    else if ((*(void *)&v49 & (*(void *)&v49 - 1)) != 0)
    {
      int8x8_t v49 = (int8x8_t)std::__next_prime(*(void *)&v49);
    }
    unint64_t v39 = *((void *)i + 4);
    if (*(void *)&v49 > v39) {
      goto LABEL_103;
    }
    if (*(void *)&v49 < v39)
    {
      unint64_t v56 = vcvtps_u32_f32((float)*((unint64_t *)i + 6) / i[14]);
      if (v39 < 3 || (uint8x8_t v57 = (uint8x8_t)vcnt_s8((int8x8_t)v39), v57.i16[0] = vaddlv_u8(v57), v57.u32[0] > 1uLL))
      {
        unint64_t v56 = std::__next_prime(v56);
      }
      else
      {
        uint64_t v58 = 1 << -(char)__clz(v56 - 1);
        if (v56 >= 2) {
          unint64_t v56 = v58;
        }
      }
      if (*(void *)&v49 <= v56) {
        int8x8_t v49 = (int8x8_t)v56;
      }
      if (*(void *)&v49 >= v39)
      {
        unint64_t v39 = *((void *)i + 4);
      }
      else
      {
        if (v49)
        {
LABEL_103:
          if (*(void *)&v49 >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v50 = operator new(8 * *(void *)&v49);
          v51 = (void *)*((void *)i + 3);
          *((void *)i + 3) = v50;
          if (v51) {
            operator delete(v51);
          }
          uint64_t v52 = 0;
          *((int8x8_t *)i + 4) = v49;
          do
            *(void *)(*((void *)i + 3) + 8 * v52++) = 0;
          while (*(void *)&v49 != v52);
          v53 = (void *)*((void *)i + 5);
          if (v53)
          {
            unint64_t v54 = v53[1];
            uint8x8_t v55 = (uint8x8_t)vcnt_s8(v49);
            v55.i16[0] = vaddlv_u8(v55);
            if (v55.u32[0] > 1uLL)
            {
              if (v54 >= *(void *)&v49) {
                v54 %= *(void *)&v49;
              }
            }
            else
            {
              v54 &= *(void *)&v49 - 1;
            }
            *(void *)(*((void *)i + 3) + 8 * v54) = i + 10;
            v59 = (void *)*v53;
            if (*v53)
            {
              do
              {
                unint64_t v60 = v59[1];
                if (v55.u32[0] > 1uLL)
                {
                  if (v60 >= *(void *)&v49) {
                    v60 %= *(void *)&v49;
                  }
                }
                else
                {
                  v60 &= *(void *)&v49 - 1;
                }
                if (v60 != v54)
                {
                  uint64_t v61 = *((void *)i + 3);
                  if (!*(void *)(v61 + 8 * v60))
                  {
                    *(void *)(v61 + 8 * v60) = v53;
                    goto LABEL_128;
                  }
                  void *v53 = *v59;
                  void *v59 = **(void **)(*((void *)i + 3) + 8 * v60);
                  **(void **)(*((void *)i + 3) + 8 * v60) = v59;
                  v59 = v53;
                }
                unint64_t v60 = v54;
LABEL_128:
                v53 = v59;
                v59 = (void *)*v59;
                unint64_t v54 = v60;
              }
              while (v59);
            }
          }
          unint64_t v39 = (unint64_t)v49;
          goto LABEL_132;
        }
        v66 = (void *)*((void *)i + 3);
        *((void *)i + 3) = 0;
        if (v66) {
          operator delete(v66);
        }
        unint64_t v39 = 0;
        *((void *)i + 4) = 0;
      }
    }
LABEL_132:
    if ((v39 & (v39 - 1)) != 0)
    {
      if (v39 <= v38) {
        unint64_t v9 = v38 % v39;
      }
      else {
        unint64_t v9 = v38;
      }
    }
    else
    {
      unint64_t v9 = (v39 - 1) & v38;
    }
  }
  uint64_t v62 = *((void *)i + 3);
  v63 = *(void **)(v62 + 8 * v9);
  if (v63)
  {
    void *v42 = *v63;
LABEL_145:
    void *v63 = v42;
    goto LABEL_146;
  }
  void *v42 = *((void *)i + 5);
  *((void *)i + 5) = v42;
  *(void *)(v62 + 8 * v9) = i + 10;
  if (*v42)
  {
    unint64_t v64 = *(void *)(*v42 + 8);
    if ((v39 & (v39 - 1)) != 0)
    {
      if (v64 >= v39) {
        v64 %= v39;
      }
    }
    else
    {
      v64 &= v39 - 1;
    }
    v63 = (void *)(*((void *)i + 3) + 8 * v64);
    goto LABEL_145;
  }
LABEL_146:
  ++*((void *)i + 6);
LABEL_147:
  *((_DWORD *)v42 + 5) = a3;
}

- (DYShaderProfilerResult)init
{
  v15.receiver = self;
  v15.super_class = (Class)DYShaderProfilerResult;
  v2 = [(DYShaderProfilerResult *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    drawCallInfoList = v2->_drawCallInfoList;
    v2->_drawCallInfoList = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    programPipelineInfoList = v2->_programPipelineInfoList;
    v2->_programPipelineInfoList = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    encoderInfoList = v2->_encoderInfoList;
    v2->_encoderInfoList = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    encoderFunctionIndexToEncoderIndexMap = v2->_encoderFunctionIndexToEncoderIndexMap;
    v2->_encoderFunctionIndexToEncoderIndexMap = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    programInfoList = v2->_programInfoList;
    v2->_programInfoList = (NSMutableArray *)v11;

    unint64_t v13 = v2;
  }

  return v2;
}

@end