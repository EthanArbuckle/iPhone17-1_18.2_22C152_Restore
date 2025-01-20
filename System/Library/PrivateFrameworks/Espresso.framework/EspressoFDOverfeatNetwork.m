@interface EspressoFDOverfeatNetwork
- (BOOL)needRetiling:(int)a3;
- (BOOL)useGPUScaler;
- (EspressoFDOverfeatNetwork)init;
- (NSString)basename;
- (NSString)weights;
- (double)getScale:(int)a3;
- (float)maxScale;
- (id).cxx_construct;
- (id)errorForLayers;
- (int)cpin;
- (int)default_retile_outputs;
- (int)forceMaxNScales;
- (int)getNumScales;
- (int)mode;
- (int)resizerCount;
- (int)scaleConfig;
- (int)scalingMode;
- (net_strides_configuration)strideConfiguration;
- (shared_ptr<Espresso::abstract_context>)context_cpu;
- (shared_ptr<Espresso::abstract_context>)context_metal;
- (shared_ptr<Espresso::blob<float,)boxBlobForScale:(int)a3;
- (shared_ptr<Espresso::blob<float,)probBlobForScale:(int)a3;
- (shared_ptr<Espresso::fast_pyramid_resizer>)resizerAtIndex:(int)a3;
- (shared_ptr<Espresso::net>)cpu_net:(int)a3;
- (shared_ptr<Espresso::net>)gpu_net:(int)a3;
- (void)autoResizeForAspectRatio:(float)a3 useLowPriorityMode:(BOOL)a4 gpuPriority:(unsigned int)a5;
- (void)autoSetupNetBaseName:(id)a3 weights:(id)a4 scaleConfig:(int)a5 setupMode:(int)a6 computePath:(int)a7 autoAspectRatio:(float)a8 forceReset:(BOOL)a9 useLowPriorityMode:(BOOL)a10 gpuPriority:(unsigned int)a11;
- (void)dealloc;
- (void)forward_cpu_network_at_index:(int)a3 pyr:(const void *)a4;
- (void)generatePyramid:(const void *)a3 tex:(id)a4;
- (void)processBlob:(const void *)a3 tex:(id)a4;
- (void)processBlobNoRotation:(const void *)a3 tex:(id)a4 doBGRA2RGBA:(BOOL)a5;
- (void)processPyramid:(shared_ptr<Espresso:(id)a4 :fast_pyramid_resizer>)a3 gpu_resizer:;
- (void)processPyramid:(shared_ptr<Espresso::fast_pyramid_resizer>)a3;
- (void)processVimageNoRotation:(const vImage_Buffer *)a3 tex:(id)a4 doBGRA2RGBA:(BOOL)a5;
- (void)reset;
- (void)retile_and_forward_espresso_gpu_network_at_index:(int)a3 net:(const void *)a4 pyr:(const void *)a5;
- (void)setBasename:(id)a3;
- (void)setContextCpu:(id)a3;
- (void)setContextMetal:(id)a3;
- (void)setContext_cpu:(shared_ptr<Espresso::abstract_context>)a3;
- (void)setContext_metal:(shared_ptr<Espresso::abstract_context>)a3;
- (void)setCpin:(int)a3;
- (void)setForceMaxNScales:(int)a3;
- (void)setMaxScale:(float)a3;
- (void)setMode:(int)a3;
- (void)setScaleConfig:(int)a3;
- (void)setScalingMode:(int)a3;
- (void)setUseGPUScaler:(BOOL)a3;
- (void)setWeights:(id)a3;
- (void)setup_retile;
- (void)wipeLayersMemory;
@end

@implementation EspressoFDOverfeatNetwork

- (id).cxx_construct
{
  *((void *)self + 27) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 39) = 0;
  *((void *)self + 42) = 0;
  *((void *)self + 43) = 0;
  *((void *)self + 41) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_context_cpu.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_context_metal.__cntrl_;
  if (v4) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_basename, 0);
  objc_storeStrong((id *)&self->cpu_semaphore, 0);
  objc_storeStrong((id *)&self->cpu_queue_0, 0);
  begin = self->retile_n_outputs_v.__begin_;
  if (begin)
  {
    self->retile_n_outputs_v.__end_ = begin;
    operator delete(begin);
  }
  v6 = self->strideConf.pad.__begin_;
  if (v6)
  {
    self->strideConf.pad.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->strideConf.stride.__begin_;
  if (v7)
  {
    self->strideConf.stride.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->strideConf.kernel_size.__begin_;
  if (v8)
  {
    self->strideConf.kernel_size.__end_ = v8;
    operator delete(v8);
  }
  objc_storeStrong((id *)&self->_errorForLayers, 0);
  p_begin = &self->boxBlobs.__begin_;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->probBlobs.__begin_;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  if (self->resizers_for_batching.__begin_)
  {
    std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__clear[abi:ne180100]((uint64_t *)&self->resizers_for_batching);
    operator delete(self->resizers_for_batching.__begin_);
  }
  v9 = self->scalesc.__begin_;
  if (v9)
  {
    self->scalesc.__end_ = v9;
    operator delete(v9);
  }
  v10 = self->full_scales.__begin_;
  if (v10)
  {
    self->full_scales.__end_ = v10;
    operator delete(v10);
  }
  v11 = self->net_scales.__begin_;
  if (v11)
  {
    self->net_scales.__end_ = v11;
    operator delete(v11);
  }
  p_begin = &self->ecpu_nets.__begin_;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->gpu_nets.__begin_;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
}

- (void)setContext_cpu:(shared_ptr<Espresso::abstract_context>)a3
{
  v4 = *(abstract_context **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_context_cpu.__cntrl_;
  self->_context_cpu.__ptr_ = v4;
  self->_context_cpu.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<Espresso::abstract_context>)context_cpu
{
  cntrl = self->_context_cpu.__cntrl_;
  *v2 = self->_context_cpu.__ptr_;
  v2[1] = (abstract_context *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (abstract_context *)self;
  return result;
}

- (void)setContext_metal:(shared_ptr<Espresso::abstract_context>)a3
{
  v4 = *(abstract_context **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_context_metal.__cntrl_;
  self->_context_metal.__ptr_ = v4;
  self->_context_metal.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<Espresso::abstract_context>)context_metal
{
  cntrl = self->_context_metal.__cntrl_;
  *v2 = self->_context_metal.__ptr_;
  v2[1] = (abstract_context *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (abstract_context *)self;
  return result;
}

- (void)setCpin:(int)a3
{
  self->_cpin = a3;
}

- (int)cpin
{
  return self->_cpin;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setScaleConfig:(int)a3
{
  self->_scaleConfig = a3;
}

- (int)scaleConfig
{
  return self->_scaleConfig;
}

- (void)setWeights:(id)a3
{
}

- (NSString)weights
{
  return self->_weights;
}

- (void)setBasename:(id)a3
{
}

- (NSString)basename
{
  return self->_basename;
}

- (void)setForceMaxNScales:(int)a3
{
  self->_forceMaxNScales = a3;
}

- (int)forceMaxNScales
{
  return self->_forceMaxNScales;
}

- (void)setMaxScale:(float)a3
{
  self->_maxScale = a3;
}

- (float)maxScale
{
  return self->_maxScale;
}

- (void)setScalingMode:(int)a3
{
  self->_scalingMode = a3;
}

- (int)scalingMode
{
  return self->_scalingMode;
}

- (void)setUseGPUScaler:(BOOL)a3
{
  self->_useGPUScaler = a3;
}

- (BOOL)useGPUScaler
{
  return self->_useGPUScaler;
}

- (void)setContextCpu:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 ctx];
    shared_ptr<Espresso::abstract_context> v6 = v8;
  }
  else
  {
    shared_ptr<Espresso::abstract_context> v6 = (shared_ptr<Espresso::abstract_context>)0;
  }
  cntrl = self->_context_cpu.__cntrl_;
  self->_context_cpu = v6;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (void)setContextMetal:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 ctx];
    shared_ptr<Espresso::abstract_context> v6 = v8;
  }
  else
  {
    shared_ptr<Espresso::abstract_context> v6 = (shared_ptr<Espresso::abstract_context>)0;
  }
  cntrl = self->_context_metal.__cntrl_;
  self->_context_metal = v6;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (id)errorForLayers
{
  return self->_errorForLayers;
}

- (BOOL)needRetiling:(int)a3
{
  begin = self->full_scales.__begin_;
  id v4 = self->net_scales.__begin_;
  return begin[2 * a3] != v4[2 * a3] || begin[2 * a3 + 1] != v4[2 * a3 + 1];
}

- (void)forward_cpu_network_at_index:(int)a3 pyr:(const void *)a4
{
  uint64_t v23 = 0;
  v24 = 0;
  id v4 = (uint64_t *)((char *)self->ecpu_nets.__begin_ + 16 * a3);
  uint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v7 = *(void *)&a3;
    std::string::basic_string[abi:ne180100]<0>(&__p, "data");
    p_p = &__p;
    v9 = (void **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v5 + 136, (unsigned __int8 *)&__p, (long long **)&p_p);
    (*(void (**)(uint64_t *__return_ptr))(*v9[5] + 56))(&v21);
    if (v20 < 0) {
      operator delete(__p);
    }
    if ([(EspressoFDOverfeatNetwork *)self needRetiling:v7])
    {
      [(EspressoFDOverfeatNetwork *)self retile_and_forward_espresso_network_at_index:v7 net:v4 pyr:a4];
    }
    else
    {
      Espresso::fast_pyramid_resizer::get_f32_level(*(uint64_t **)a4, v7, &v23);
      v10 = (char *)self->net_scales.__begin_ + 16 * (int)v7;
      uint64_t v11 = 16 * (int)v7;
      memcpy(*(void **)(v21 + 24), *(const void **)(v23 + 24), 12 * *v10 * v10[1]);
      uint64_t v12 = *(void *)((char *)self->ecpu_nets.__begin_ + v11);
      std::string::basic_string[abi:ne180100]<0>(&__p, "data");
      p_p = &__p;
      uint64_t v13 = *((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v12 + 136, (unsigned __int8 *)&__p, (long long **)&p_p)+ 5);
      p_p = 0;
      v17 = 0;
      (*(void (**)(uint64_t, void ***, uint64_t *))(*(void *)v13 + 48))(v13, &p_p, &v21);
      if (v17) {
        nitro::nitro_function::nitro_function(v17);
      }
      if (v20 < 0) {
        operator delete(__p);
      }
      v14 = v24;
      uint64_t v23 = 0;
      v24 = 0;
      if (v14) {
        nitro::nitro_function::nitro_function(v14);
      }
      uint64_t v15 = *(void *)((char *)self->ecpu_nets.__begin_ + v11);
      __p = 0;
      v19 = 0;
      Espresso::net::__forward(v15, &__p, 0, 0xFFFFFFFFLL);
      if (v19) {
        nitro::nitro_function::nitro_function(v19);
      }
    }
    if (v22) {
      nitro::nitro_function::nitro_function(v22);
    }
  }
}

- (void)retile_and_forward_espresso_gpu_network_at_index:(int)a3 net:(const void *)a4 pyr:(const void *)a5
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "You ended up in an unsupported path, the legacy low memory mode");
  __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
}

- (void)setup_retile
{
  uint64_t v3 = +[EspressoMetalSingleton shared];
  char v4 = objc_msgSend(v3, "is_memory_tight");

  if ((v4 & 4) != 0)
  {
    end = (unint64_t *)self->full_scales.__end_;
    if (end == self->full_scales.__begin_)
    {
      unint64_t v7 = 0;
    }
    else
    {
      unint64_t v6 = 0;
      do
      {
        self->retile_n_outputs_v.__begin_[v6++] = [(EspressoFDOverfeatNetwork *)self default_retile_outputs];
        end = (unint64_t *)self->full_scales.__begin_;
        unint64_t v7 = ((char *)self->full_scales.__end_ - (char *)end) >> 4;
      }
      while (v7 > v6);
      if (v7)
      {
        unint64_t v8 = 0;
        begin = self->retile_n_outputs_v.__begin_;
        int retile_tile_sz = self->retile_tile_sz;
        int retile_stride = self->retile_stride;
        uint64_t v12 = end + 1;
        uint64_t v13 = ((char *)self->full_scales.__end_ - (char *)end) >> 4;
        while (1)
        {
          v14 = v12 - 1;
          unint64_t v15 = *(v12 - 1);
          int v16 = begin[v8];
          int v17 = retile_tile_sz + retile_stride * (v16 - 1);
          double v18 = (double)v15;
          double v19 = (double)v17 * 1.2;
          if (v19 >= (double)v15)
          {
            if (v8 >= 3)
            {
              unint64_t v20 = *v12;
              double v21 = (double)*v12;
              if (v19 < v21) {
                goto LABEL_12;
              }
            }
          }
          else if (v8 >= 3)
          {
            unint64_t v20 = *v12;
            double v21 = (double)*v12;
LABEL_12:
            int v22 = retile_stride * v16;
            if (v7 <= (int)v13) {
              LODWORD(v13) = v8;
            }
            BOOL v23 = v15 > v20;
            if (v15 < v20) {
              v14 = v12;
            }
            unint64_t v24 = retile_tile_sz
                - retile_stride
                + v22
                + v22 * ((retile_stride + ~retile_tile_sz + *(_DWORD *)v14) / v22);
            float v25 = v18 / v21;
            unint64_t v26 = (unint64_t)(float)(v25 * (float)v24);
            float v27 = v21 / v18;
            if (v23) {
              unint64_t v26 = v24;
            }
            if (v23) {
              unint64_t v24 = (unint64_t)(float)(v27 * (float)v24);
            }
            *(v12 - 1) = v26;
            *uint64_t v12 = v24;
            *((int64x2_t *)self->net_scales.__begin_ + v8) = vdupq_n_s64(v17);
          }
          ++v8;
          v12 += 2;
          if (v7 == v8) {
            goto LABEL_27;
          }
        }
      }
    }
    LODWORD(v13) = 0;
LABEL_27:
    if (v7 > (int)v13)
    {
      unint64_t v28 = v7 - (int)v13;
      v29 = &self->scalesc.__begin_[(int)v13 - 1];
      v30 = &end[2 * (int)v13];
      do
      {
        unint64_t v31 = *v30;
        if (*v30 <= v30[1]) {
          unint64_t v31 = v30[1];
        }
        float v32 = (float)v31;
        unint64_t v33 = *(v30 - 2);
        if (v33 <= *(v30 - 1)) {
          unint64_t v33 = *(v30 - 1);
        }
        *v29++ = (float)(v32 / (float)v33);
        v30 += 2;
        --v28;
      }
      while (v28);
    }
  }
}

- (int)default_retile_outputs
{
  if ([(EspressoFDOverfeatNetwork *)self mode]) {
    return 14;
  }
  else {
    return 9;
  }
}

- (void)processPyramid:(shared_ptr<Espresso:(id)a4 :fast_pyramid_resizer>)a3 gpu_resizer:
{
  var0 = a3.var0;
  unint64_t v6 = a3.var1;
  unint64_t v7 = +[EspressoMetalSingleton shared];
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v100, "> processPyramid", v8);
  uint64_t v9 = *(void *)var0;
  uint64_t v10 = (*(void *)(*(void *)var0 + 56) - *(void *)(*(void *)var0 + 48)) >> 4;
  int forceMaxNScales = self->_forceMaxNScales;
  if (forceMaxNScales > (int)v10 || forceMaxNScales < 1) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = forceMaxNScales;
  }
  cpu_queue_0 = self->cpu_queue_0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __56__EspressoFDOverfeatNetwork_processPyramid_gpu_resizer___block_invoke;
  block[3] = &unk_1EE38EDD8;
  int v99 = v13;
  unint64_t v15 = (std::__shared_weak_count *)*((void *)var0 + 1);
  block[5] = v9;
  v98 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[4] = self;
  dispatch_async(cpu_queue_0, block);
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x4812000000;
  v93 = __Block_byref_object_copy__32288;
  v94 = __Block_byref_object_dispose__32289;
  v95 = "";
  std::vector<std::shared_ptr<Espresso::blob<float,4>>>::vector(v96, (int)v13);
  v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x4812000000;
  v86 = __Block_byref_object_copy__32288;
  v87 = __Block_byref_object_dispose__32289;
  v88 = "";
  std::vector<std::shared_ptr<Espresso::blob<float,4>>>::vector(v89, (int)v13);
  begin = self->gpu_nets.__begin_;
  end = self->gpu_nets.__end_;
  uint64_t v19 = end - (unsigned char *)begin;
  if (end != (unsigned char *)begin)
  {
    char v20 = 0;
    unint64_t v21 = v19 >> 4;
    if (v21 <= 1) {
      unint64_t v21 = 1;
    }
    do
    {
      uint64_t v22 = *begin;
      begin += 2;
      v20 |= v22 != 0;
      --v21;
    }
    while (v21);
    if (v20)
    {
      Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v82, ">> GPU layers", v16);
      if ((objc_msgSend(v7, "is_memory_tight") & 4) != 0 && (int)v13 >= 1)
      {
        uint64_t v23 = 0;
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)((char *)self->gpu_nets.__begin_ + v23)
            && [(EspressoFDOverfeatNetwork *)self needRetiling:i])
          {
            [(EspressoFDOverfeatNetwork *)self retile_and_forward_espresso_gpu_network_at_index:i net:(char *)self->gpu_nets.__begin_ + v23 pyr:var0];
          }
          v23 += 16;
        }
      }
      ptr = self->_context_metal.__ptr_;
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3321888768;
      v79[2] = __56__EspressoFDOverfeatNetwork_processPyramid_gpu_resizer___block_invoke_74;
      v79[3] = &unk_1EE38F040;
      int v81 = v13;
      uint64_t v27 = *(void *)var0;
      unint64_t v26 = (std::__shared_weak_count *)*((void *)var0 + 1);
      v79[4] = self;
      v79[7] = v27;
      v80 = v26;
      if (v26) {
        atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v79[5] = &v90;
      v79[6] = &v83;
      Espresso::abstract_context::compute_batch_sync(ptr, v79);
      if (v80) {
        nitro::nitro_function::nitro_function(v80);
      }
      Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v82);
    }
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->cpu_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v28 = +[EspressoMetalSingleton shared];
  char v29 = objc_msgSend(v28, "is_memory_tight");

  if (v29)
  {
    uint64_t v31 = *(void *)var0;
    float v32 = +[EspressoMetalSingleton shared];
    char v33 = objc_msgSend(v32, "is_memory_tight");

    if (v33) {
      std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__clear[abi:ne180100]((uint64_t *)(v31 + 48));
    }
  }
  v68 = v6;
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v82, ">> prob", v30);
  if ((int)v13 >= 1)
  {
    uint64_t v34 = 0;
    unint64_t v35 = 0;
    uint64_t v69 = 16 * v13;
    while (1)
    {
      uint64_t v36 = *(void *)(v91[6] + v35);
      if (v36)
      {
        std::allocate_shared[abi:ne180100]<Espresso::blob<float,3>,std::allocator<Espresso::blob<float,3>>,int const*&,void>(&__p, v36 + 8);
        v38 = (void **)__p;
        v37 = v75;
      }
      else
      {
        v38 = 0;
        v37 = 0;
      }
      v39 = v84[6][v35 / 8];
      if (v39)
      {
        std::allocate_shared[abi:ne180100]<Espresso::blob<float,3>,std::allocator<Espresso::blob<float,3>>,int const*&,void>(&__p, (uint64_t)v39 + 8);
        v41 = (void **)__p;
        v40 = v75;
      }
      else
      {
        v41 = 0;
        v40 = 0;
      }
      uint64_t v42 = *(void *)(v91[6] + v35);
      if (v42) {
        memcpy(v38[3], *(const void **)(v42 + 24), 4 * *((int *)v38 + 2) * (uint64_t)*((int *)v38 + 3) * *((int *)v38 + 4));
      }
      v43 = (const void **)v84[6][v35 / 8];
      if (v43) {
        memcpy(v41[3], v43[3], 4 * *((int *)v41 + 2) * (uint64_t)*((int *)v41 + 3) * *((int *)v41 + 4));
      }
      if (v38)
      {
        v44 = v37;
      }
      else
      {
        v45 = (void ***)((char *)self->probBlobs.__begin_ + v35);
        v38 = *v45;
        v44 = (std::__shared_weak_count *)v45[1];
        if (v44) {
          atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v37) {
          nitro::nitro_function::nitro_function(v37);
        }
      }
      if (v41)
      {
        v46 = v40;
      }
      else
      {
        v47 = (void ***)((char *)self->boxBlobs.__begin_ + v35);
        v41 = *v47;
        v46 = (std::__shared_weak_count *)v47[1];
        if (v46) {
          atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v40) {
          nitro::nitro_function::nitro_function(v40);
        }
      }
      if (*(void *)((char *)self->ecpu_nets.__begin_ + v35)) {
        break;
      }
      v49 = v44;
      v51 = v46;
LABEL_89:
      v62 = (char *)self->probBlobs.__begin_;
      if (v49) {
        atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v63 = (void ***)&v62[v35];
      v64 = (std::__shared_weak_count *)v63[1];
      *v63 = v38;
      v63[1] = (void **)&v49->__vftable;
      if (v64) {
        nitro::nitro_function::nitro_function(v64);
      }
      v65 = (char *)self->boxBlobs.__begin_;
      if (v51) {
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v66 = (void ***)&v65[v35];
      v67 = (std::__shared_weak_count *)v66[1];
      *v66 = v41;
      v66[1] = (void **)&v51->__vftable;
      if (v67) {
        nitro::nitro_function::nitro_function(v67);
      }
      if (v51) {
        nitro::nitro_function::nitro_function(v51);
      }
      if (v49) {
        nitro::nitro_function::nitro_function(v49);
      }
      v35 += 16;
      uint64_t v34 = (v34 + 1);
      if (v69 == v35) {
        goto LABEL_102;
      }
    }
    v48 = (void ***)((char *)self->probBlobs.__begin_ + v35);
    v38 = *v48;
    v49 = (std::__shared_weak_count *)v48[1];
    if (v49) {
      atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v44) {
      nitro::nitro_function::nitro_function(v44);
    }
    v50 = (void ***)((char *)self->boxBlobs.__begin_ + v35);
    v41 = *v50;
    v51 = (std::__shared_weak_count *)v50[1];
    if (v51) {
      atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v46) {
      nitro::nitro_function::nitro_function(v46);
    }
    if ([(EspressoFDOverfeatNetwork *)self needRetiling:v34]) {
      goto LABEL_89;
    }
    uint64_t v52 = *(void *)((char *)self->ecpu_nets.__begin_ + v35);
    std::string::basic_string[abi:ne180100]<0>(&__p, "prob_student");
    p_p = (const void **)&__p;
    v53 = (void **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v52 + 136, (unsigned __int8 *)&__p, (long long **)&p_p);
    (*(void (**)(uint64_t *__return_ptr))(*v53[5] + 56))(&v77);
    if (v76 < 0) {
      operator delete(__p);
    }
    uint64_t v54 = *(void *)((char *)self->ecpu_nets.__begin_ + v35);
    std::string::basic_string[abi:ne180100]<0>(&__p, "fc4-conv_student");
    v70 = &__p;
    v55 = (void **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v54 + 136, (unsigned __int8 *)&__p, (long long **)&v70);
    (*(void (**)(const void ***__return_ptr))(*v55[5] + 56))(&p_p);
    if (v76 < 0) {
      operator delete(__p);
    }
    uint64_t v56 = *(void *)((char *)self->ecpu_nets.__begin_ + v35);
    std::string::basic_string[abi:ne180100]<0>(&__p, "prob_student");
    v70 = &__p;
    uint64_t v57 = *((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v56 + 136, (unsigned __int8 *)&__p, (long long **)&v70)+ 5);
    v70 = 0;
    v71 = 0;
    (*(void (**)(uint64_t, void ***, uint64_t *))(*(void *)v57 + 40))(v57, &v70, &v77);
    if (v71) {
      nitro::nitro_function::nitro_function(v71);
    }
    if (v76 < 0) {
      operator delete(__p);
    }
    uint64_t v58 = *(void *)((char *)self->ecpu_nets.__begin_ + v35);
    std::string::basic_string[abi:ne180100]<0>(&__p, "fc4-conv_student");
    v70 = &__p;
    uint64_t v59 = *((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v58 + 136, (unsigned __int8 *)&__p, (long long **)&v70)+ 5);
    v70 = 0;
    v71 = 0;
    (*(void (**)(uint64_t, void ***, const void ***))(*(void *)v59 + 40))(v59, &v70, &p_p);
    if (v71) {
      nitro::nitro_function::nitro_function(v71);
    }
    if (v76 < 0)
    {
      operator delete(__p);
      if (v38)
      {
LABEL_75:
        if (v41)
        {
LABEL_85:
          memcpy(v38[3], *(const void **)(v77 + 24), 4 * *((int *)v38 + 2) * (uint64_t)*((int *)v38 + 3) * *((int *)v38 + 4));
          memcpy(v41[3], p_p[3], 4 * *((int *)v41 + 2) * (uint64_t)*((int *)v41 + 3) * *((int *)v41 + 4));
          if (v73) {
            nitro::nitro_function::nitro_function(v73);
          }
          if (v78) {
            nitro::nitro_function::nitro_function(v78);
          }
          goto LABEL_89;
        }
LABEL_82:
        std::allocate_shared[abi:ne180100]<Espresso::blob<float,3>,std::allocator<Espresso::blob<float,3>>,int const*&,void>(&__p, (uint64_t)(p_p + 1));
        v41 = (void **)__p;
        v61 = v75;
        if (v51) {
          nitro::nitro_function::nitro_function(v51);
        }
        v51 = v61;
        goto LABEL_85;
      }
    }
    else if (v38)
    {
      goto LABEL_75;
    }
    std::allocate_shared[abi:ne180100]<Espresso::blob<float,3>,std::allocator<Espresso::blob<float,3>>,int const*&,void>(&__p, v77 + 8);
    v38 = (void **)__p;
    v60 = v75;
    if (v49) {
      nitro::nitro_function::nitro_function(v49);
    }
    v49 = v60;
    if (v41) {
      goto LABEL_85;
    }
    goto LABEL_82;
  }
LABEL_102:
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v82);
  _Block_object_dispose(&v83, 8);
  v82[0] = (void **)v89;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](v82);
  _Block_object_dispose(&v90, 8);
  v83 = (void **)v96;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&v83);
  if (v98) {
    nitro::nitro_function::nitro_function(v98);
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v100);
}

intptr_t __56__EspressoFDOverfeatNetwork_processPyramid_gpu_resizer___block_invoke(uint64_t a1, double a2)
{
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v9, ">> CPU layers", a2);
  int v3 = *(_DWORD *)(a1 + 56);
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 40;
    do
    {
      uint64_t v7 = *(void *)(*(void *)v6 + 48);
      if (v5 < (int)((unint64_t)(*(void *)(*(void *)v6 + 56) - v7) >> 4) && *(void *)(v7 + v4))
      {
        objc_msgSend(*(id *)(a1 + 32), "forward_cpu_network_at_index:pyr:", v5, a1 + 40);
        int v3 = *(_DWORD *)(a1 + 56);
      }
      ++v5;
      v4 += 16;
    }
    while (v5 < v3);
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v9);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 368));
}

void __56__EspressoFDOverfeatNetwork_processPyramid_gpu_resizer___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (*(int *)(a1 + 72) >= 1)
  {
    v2 = a2;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void **)(a1 + 32);
      if (*(void *)(v6[1] + v4) && ([v6 needRetiling:v5] & 1) == 0)
      {
        uint64_t v44 = 0;
        v45 = 0;
        Espresso::fast_pyramid_resizer::get_f32_level(*(uint64_t **)(a1 + 56), v5, &v44);
        uint64_t v7 = v44;
        __p = *(void **)(v44 + 8);
        LODWORD(v48) = *(_DWORD *)(v44 + 16);
        double v8 = (std::__shared_weak_count *)operator new(0x60uLL);
        v8->__shared_owners_ = 0;
        v8->__shared_weak_owners_ = 0;
        v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE3899C8;
        uint64_t v9 = *(std::__shared_weak_count_vtbl **)(v7 + 24);
        *(_OWORD *)&v8[2].__shared_weak_owners_ = 0u;
        *(_OWORD *)&v8[3].__shared_owners_ = 0u;
        int v10 = (int)v48;
        uint64_t v11 = __p;
        v8[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE36BF10;
        v8[1].__shared_owners_ = (uint64_t)v11;
        LODWORD(v8[1].__shared_weak_owners_) = v10;
        HIDWORD(v8[1].__shared_weak_owners_) = 1;
        v8[2].__vftable = v9;
        LOBYTE(v8[2].__shared_owners_) = 0;
        uint64_t v42 = v8 + 1;
        v43 = v8;
        uint64_t v12 = (void *)*v2;
        uint64_t v13 = v45;
        if (v45) {
          atomic_fetch_add_explicit(&v45->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        unint64_t v14 = v12[22];
        unint64_t v15 = (void *)v12[21];
        if ((unint64_t)v15 >= v14)
        {
          uint64_t v17 = v12[20];
          uint64_t v18 = ((uint64_t)v15 - v17) >> 4;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 60) {
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v20 = v14 - v17;
          if (v20 >> 3 > v19) {
            unint64_t v19 = v20 >> 3;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v19;
          }
          v51 = v12 + 22;
          uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v21);
          uint64_t v23 = &v22[16 * v18];
          __p = v22;
          v48 = v23;
          v50 = &v22[16 * v24];
          *(void *)uint64_t v23 = v7;
          *((void *)v23 + 1) = v13;
          v49 = v23 + 16;
          std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__swap_out_circular_buffer(v12 + 20, &__p);
          double v16 = (void *)v12[21];
          std::__split_buffer<std::shared_ptr<Espresso::abstract_blob_container>>::~__split_buffer((uint64_t)&__p);
        }
        else
        {
          *unint64_t v15 = v7;
          v15[1] = v13;
          double v16 = v15 + 2;
          v12[21] = v15 + 2;
        }
        v12[21] = v16;
        uint64_t v25 = **(void **)(**(void **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + v4) + 32) + 80);
        (*(void (**)(uint64_t, void *, std::__shared_weak_count **))(*(void *)v25 + 48))(v25, a2, &v42);
        Espresso::net::__forward(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + v4), a2, 0, 0xFFFFFFFFLL);
        uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + v4);
        std::string::basic_string[abi:ne180100]<0>(&__p, "prob_student");
        p_p = &__p;
        uint64_t v27 = (void **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v26 + 136, (unsigned __int8 *)&__p, (long long **)&p_p);
        (*(void (**)(long long *__return_ptr))(*v27[5] + 56))(&v41);
        uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) + v4;
        long long v29 = v41;
        long long v41 = 0uLL;
        double v30 = *(std::__shared_weak_count **)(v28 + 8);
        *(_OWORD *)uint64_t v28 = v29;
        if (v30) {
          nitro::nitro_function::nitro_function(v30);
        }
        if (*((void *)&v41 + 1)) {
          nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v41 + 1));
        }
        if (SHIBYTE(v49) < 0) {
          operator delete(__p);
        }
        uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + v4);
        std::string::basic_string[abi:ne180100]<0>(&__p, "fc4-conv_student");
        p_p = &__p;
        float v32 = (void **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v31 + 136, (unsigned __int8 *)&__p, (long long **)&p_p);
        (*(void (**)(long long *__return_ptr))(*v32[5] + 56))(&v41);
        uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48) + v4;
        long long v34 = v41;
        long long v41 = 0uLL;
        unint64_t v35 = *(std::__shared_weak_count **)(v33 + 8);
        *(_OWORD *)uint64_t v33 = v34;
        if (v35) {
          nitro::nitro_function::nitro_function(v35);
        }
        if (*((void *)&v41 + 1)) {
          nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v41 + 1));
        }
        if (SHIBYTE(v49) < 0) {
          operator delete(__p);
        }
        uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + v4);
        std::string::basic_string[abi:ne180100]<0>(&__p, "prob_student");
        *(void *)&long long v41 = &__p;
        v37 = (void **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v36 + 136, (unsigned __int8 *)&__p, (long long **)&v41);
        (*(void (**)(void *, void *, uint64_t))(*v37[5] + 40))(v37[5], a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) + v4);
        if (SHIBYTE(v49) < 0) {
          operator delete(__p);
        }
        uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + v4);
        std::string::basic_string[abi:ne180100]<0>(&__p, "fc4-conv_student");
        *(void *)&long long v41 = &__p;
        v39 = (void **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v38 + 136, (unsigned __int8 *)&__p, (long long **)&v41);
        v2 = a2;
        (*(void (**)(void *, void *, uint64_t))(*v39[5] + 40))(v39[5], a2, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48) + v4);
        if (SHIBYTE(v49) < 0) {
          operator delete(__p);
        }
        if (v43) {
          nitro::nitro_function::nitro_function(v43);
        }
        if (v13) {
          nitro::nitro_function::nitro_function(v13);
        }
      }
      ++v5;
      v4 += 16;
    }
    while (v5 < *(int *)(a1 + 72));
  }
}

- (void)processPyramid:(shared_ptr<Espresso::fast_pyramid_resizer>)a3
{
  int v3 = (std::__shared_weak_count *)*((void *)a3.var0 + 1);
  uint64_t v4 = *(void *)a3.var0;
  uint64_t v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(EspressoFDOverfeatNetwork *)self processPyramid:&v4 gpu_resizer:0];
  if (v5) {
    nitro::nitro_function::nitro_function(v5);
  }
}

- (void)processBlobNoRotation:(const void *)a3 tex:(id)a4 doBGRA2RGBA:(BOOL)a5
{
  BOOL v6 = a5;
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v20, "processBlob", v5);
  uint64_t v10 = *(void *)self->resizers_for_batching.__begin_;
  uint64_t v11 = *(void *)a3;
  uint64_t v12 = (std::__shared_weak_count *)*((void *)a3 + 1);
  int v13 = 4 * *(_DWORD *)(v11 + 8);
  v19[0] = v11;
  v19[1] = (uint64_t)v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::fast_pyramid_resizer::build_pyramid(v10, v13, v19, 0, v6, v9);
  if (v12) {
    nitro::nitro_function::nitro_function(v12);
  }
  begin = (uint64_t *)self->resizers_for_batching.__begin_;
  uint64_t v16 = *begin;
  unint64_t v15 = (std::__shared_weak_count *)begin[1];
  uint64_t v17 = v16;
  uint64_t v18 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(EspressoFDOverfeatNetwork *)self processPyramid:&v17];
  if (v18) {
    nitro::nitro_function::nitro_function(v18);
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v20);
}

- (void)processVimageNoRotation:(const vImage_Buffer *)a3 tex:(id)a4 doBGRA2RGBA:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  vImagePixelCount width = a3->width;
  if (a3->rowBytes == 4 * width)
  {
    uint64_t v10 = (char *)operator new(0x58uLL);
    *((void *)v10 + 1) = 0;
    *((void *)v10 + 2) = 0;
    *(void *)uint64_t v10 = &unk_1EE3897D0;
    data = a3->data;
    vImagePixelCount height = a3->height;
    *((void *)v10 + 3) = &unk_1EE36BDF0;
    *(_OWORD *)(v10 + 56) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *((_DWORD *)v10 + 8) = width;
    *((_DWORD *)v10 + 9) = height;
    *((void *)v10 + 5) = data;
    v10[48] = 0;
    *(void *)&long long v21 = v10 + 24;
    *((void *)&v21 + 1) = v10;
  }
  else
  {
    int v13 = (char *)operator new(0x58uLL);
    *((void *)v13 + 1) = 0;
    *((void *)v13 + 2) = 0;
    *(void *)int v13 = &unk_1EE3897D0;
    vImagePixelCount v14 = a3->height;
    *((void *)v13 + 3) = &unk_1EE36BDF0;
    *(_OWORD *)(v13 + 56) = 0u;
    *(_OWORD *)(v13 + 72) = 0u;
    *((_DWORD *)v13 + 8) = width;
    *((_DWORD *)v13 + 9) = v14;
    size_t v15 = (int)v14 * 4 * (int)width;
    uint64_t v16 = (char *)Espresso::kern_alloc_uninitialized((Espresso *)v15);
    bzero(v16, v15);
    *((void *)v13 + 5) = v16;
    v13[48] = 1;
    *(void *)&long long v17 = v13 + 24;
    *((void *)&v17 + 1) = v13;
    long long v21 = v17;
    if (SLODWORD(a3->height) >= 1)
    {
      int v18 = 0;
      unint64_t v19 = (char *)a3->data;
      vImagePixelCount v20 = a3->width;
      do
      {
        memcpy(v16, v19, 4 * v20);
        vImagePixelCount v20 = a3->width;
        v16 += 4 * v20;
        v19 += a3->rowBytes;
        ++v18;
      }
      while (v18 < SLODWORD(a3->height));
    }
  }
  [(EspressoFDOverfeatNetwork *)self processBlobNoRotation:&v21 tex:v8 doBGRA2RGBA:v5];
  if (*((void *)&v21 + 1)) {
    nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v21 + 1));
  }
}

- (void)processBlob:(const void *)a3 tex:(id)a4
{
  id v6 = a4;
  Espresso::print_mem_stats((Espresso *)[(EspressoFDOverfeatNetwork *)self generatePyramid:a3 tex:v6]);
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v13, "processBlob", v7);
  begin = (uint64_t *)self->resizers_for_batching.__begin_;
  uint64_t v10 = *begin;
  double v9 = (std::__shared_weak_count *)begin[1];
  uint64_t v11 = v10;
  uint64_t v12 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(EspressoFDOverfeatNetwork *)self processPyramid:&v11];
  if (v12) {
    nitro::nitro_function::nitro_function(v12);
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v13);
}

- (void)generatePyramid:(const void *)a3 tex:(id)a4
{
  uint64_t v5 = *(void *)self->resizers_for_batching.__begin_;
  id v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
  int v7 = 4 * *(_DWORD *)(*(void *)a3 + 8);
  v8[0] = *(void *)a3;
  v8[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::fast_pyramid_resizer::build_pyramid(v5, v7, v8, 1, 1, v4);
  if (v6)
  {
    nitro::nitro_function::nitro_function(v6);
  }
}

- (shared_ptr<Espresso::blob<float,)boxBlobForScale:(int)a3
{
  long long v4 = *((_OWORD *)self->boxBlobs.__begin_ + a3);
  *int v3 = v4;
  if (*((void *)&v4 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v4 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = self;
  return result;
}

- (shared_ptr<Espresso::blob<float,)probBlobForScale:(int)a3
{
  long long v4 = *((_OWORD *)self->probBlobs.__begin_ + a3);
  *int v3 = v4;
  if (*((void *)&v4 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v4 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = self;
  return result;
}

- (int)getNumScales
{
  int forceMaxNScales = self->_forceMaxNScales;
  if (forceMaxNScales >= (int)((unint64_t)((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4)) {
    int v3 = (unint64_t)((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4;
  }
  else {
    int v3 = self->_forceMaxNScales;
  }
  if (forceMaxNScales <= 0) {
    return (unint64_t)((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4;
  }
  else {
    return v3;
  }
}

- (void)autoSetupNetBaseName:(id)a3 weights:(id)a4 scaleConfig:(int)a5 setupMode:(int)a6 computePath:(int)a7 autoAspectRatio:(float)a8 forceReset:(BOOL)a9 useLowPriorityMode:(BOOL)a10 gpuPriority:(unsigned int)a11
{
  BOOL v11 = a9;
  uint64_t v13 = *(void *)&a6;
  uint64_t v14 = *(void *)&a5;
  *((void *)&v268 + 1) = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v223 = a4;
  [(EspressoFDOverfeatNetwork *)self reset];
  int v18 = [(EspressoFDOverfeatNetwork *)self basename];
  int v19 = [v18 isEqualToString:v17];

  if (v223
    || ([(EspressoFDOverfeatNetwork *)self weights],
        vImagePixelCount v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    if (!v19)
    {
LABEL_9:
      BOOL v23 = 0;
      goto LABEL_12;
    }
    long long v21 = [(EspressoFDOverfeatNetwork *)self weights];
    char v22 = [v21 isEqualToString:v223];

    if ((v22 & 1) == 0)
    {
      LOBYTE(v19) = 0;
      goto LABEL_9;
    }
  }
  else if (!v19)
  {
    goto LABEL_9;
  }
  BOOL v23 = [(EspressoFDOverfeatNetwork *)self mode] == v13
     && [(EspressoFDOverfeatNetwork *)self cpin] == a7;
  LOBYTE(v19) = 1;
LABEL_12:
  [(EspressoFDOverfeatNetwork *)self setBasename:v17];
  [(EspressoFDOverfeatNetwork *)self setWeights:v223];
  [(EspressoFDOverfeatNetwork *)self setScaleConfig:v14];
  [(EspressoFDOverfeatNetwork *)self setMode:v13];
  [(EspressoFDOverfeatNetwork *)self setCpin:a7];
  id v24 = v17;
  std::string::basic_string[abi:ne180100]<0>(&v261, (char *)[v24 UTF8String]);
  uint64_t v25 = operator new(0x14uLL);
  v259 = v25 + 5;
  v260 = (char *)(v25 + 5);
  v25[4] = 1;
  *(_OWORD *)uint64_t v25 = xmmword_192E046B0;
  v258 = v25;
  uint64_t v26 = operator new(0x14uLL);
  char v232 = v19;
  v256 = v26 + 5;
  v257 = (char *)(v26 + 5);
  v26[4] = 0;
  *(_OWORD *)uint64_t v26 = xmmword_192E0480C;
  v255 = v26;
  *(_OWORD *)__src = xmmword_192E04688;
  *(_OWORD *)&__src[16] = unk_192E04698;
  *(void *)&__src[32] = 0x4000000000000000;
  p_scalesc = (char *)&self->scalesc;
  std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>((char *)&self->scalesc, __src, (uint64_t)&__src[40]);
  HIDWORD(v28) = v14;
  LODWORD(v28) = v14 - 2;
  unsigned int v27 = v28 >> 1;
  if (v27 <= 7 && ((1 << v27) & 0x8B) != 0)
  {
    switch((int)v13)
    {
      case 0:
        memset(__src, 0, 20);
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_192E06E0C;
        *(_DWORD *)&__src[16] = 1;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        break;
      case 1:
      case 7:
        *(_DWORD *)&__src[16] = 1;
        *(_OWORD *)__src = xmmword_192E04790;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_192E047A4;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        break;
      case 2:
        *(_DWORD *)&__src[16] = 0;
        *(_OWORD *)__src = xmmword_192E046D8;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_192E046D8;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        break;
      case 5:
        *(_DWORD *)&__src[16] = 1;
        *(_OWORD *)__src = xmmword_192E046B0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_192E0480C;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        break;
      case 6:
        *(_DWORD *)&__src[16] = 1;
        *(_OWORD *)__src = xmmword_192E046C4;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_192E046D8;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        break;
      default:
        break;
    }
    self->_maxScale = 16.0;
    switch(v27)
    {
      case 0u:
        uint64_t v33 = v255;
        *((_DWORD *)v255 + 4) = 0;
        long long v34 = v258;
        *((_DWORD *)v258 + 4) = 0;
        v33[3] = 0;
        v34[3] = 0;
        v33[2] = 0;
        if (v13 == 7 || v13 == 1)
        {
          *(_DWORD *)&__src[16] = 0;
          *(_OWORD *)__src = xmmword_192E046EC;
          std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
          *(_OWORD *)__src = xmmword_192E0473C;
          *(_DWORD *)&__src[16] = 0;
          std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        }
        break;
      case 1u:
        unint64_t v35 = v255;
        *((_DWORD *)v255 + 4) = 0;
        uint64_t v36 = v258;
        *((_DWORD *)v258 + 4) = 0;
        v35[3] = 0;
        v36[3] = 0;
        if (v13 == 7 || v13 == 1)
        {
          *(_DWORD *)&__src[16] = 0;
          *(_OWORD *)__src = xmmword_192E04728;
          std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
          *(_OWORD *)__src = xmmword_192E0473C;
          *(_DWORD *)&__src[16] = 0;
          std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        }
        break;
      case 3u:
        v37 = v255;
        *((_DWORD *)v255 + 4) = 0;
        uint64_t v38 = v258;
        *((_DWORD *)v258 + 4) = 0;
        if (v13 == 7 || v13 == 1)
        {
          v38[2] = 1;
          v37[2] = 0;
        }
        break;
      case 4u:
        goto LABEL_29;
      default:
        break;
    }
    if (v14 != 9)
    {
      if (v14 == 20) {
        goto LABEL_38;
      }
      int v29 = 0;
      goto LABEL_40;
    }
LABEL_46:
    *(void *)&__src[32] = 0x4000000000000000;
    *(_OWORD *)__src = xmmword_192E047D0;
    *(_OWORD *)&__src[16] = unk_192E047E0;
    std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
    *(_OWORD *)__src = xmmword_192E047B8;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
    *(_OWORD *)__src = xmmword_192E0480C;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
    int v31 = 0;
    int v29 = 0;
    self->_maxScale = 10.0;
    int v30 = 1;
    goto LABEL_47;
  }
  *(_DWORD *)&__src[16] = 0;
  *(_OWORD *)__src = xmmword_192E047F8;
  std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
  *(_OWORD *)__src = xmmword_192E0480C;
  *(_DWORD *)&__src[16] = 0;
  std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
  *(_OWORD *)__src = xmmword_192E04700;
  *(_OWORD *)&__src[16] = unk_192E04710;
  *(void *)&__src[32] = 0x4000000000000000;
  std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
  int v29 = 0;
  self->_maxScale = 12.0;
  if ((int)v14 > 9)
  {
    switch(v14)
    {
      case 0xA:
LABEL_29:
        *(void *)&__src[32] = 0x4000000000000000;
        *(_OWORD *)__src = xmmword_192E04768;
        *(_OWORD *)&__src[16] = unk_192E04778;
        std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
        *(_OWORD *)__src = xmmword_192E04750;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_192E047A4;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        self->_maxScale = 10.0;
        int v29 = 1;
        break;
      case 0x14:
LABEL_38:
        *(void *)&__src[32] = 0x4000000000000000;
        *(_OWORD *)__src = xmmword_192E04768;
        *(_OWORD *)&__src[16] = unk_192E04778;
        std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
        *(_OWORD *)__src = xmmword_192E04790;
        *(_DWORD *)&__src[16] = 1;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_192E047A4;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
        int v31 = 0;
        int v29 = 0;
        int v30 = 0;
        float v32 = 20.0;
        goto LABEL_42;
      case 0x18:
        int v29 = 0;
        int v30 = 0;
        int v31 = 1;
        *((_DWORD *)v258 + 4) = 1;
        *((_DWORD *)v255 + 4) = 0;
        float v32 = 24.0;
LABEL_42:
        self->_maxScale = v32;
        goto LABEL_47;
    }
    goto LABEL_40;
  }
  if (v14 == 6)
  {
    *(_DWORD *)&__src[16] = 0;
    *(_OWORD *)__src = xmmword_192E04728;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
    *(_OWORD *)__src = xmmword_192E0473C;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
    int v31 = 0;
    int v29 = 0;
    int v30 = 0;
    float v32 = 6.0;
    goto LABEL_42;
  }
  if (v14 == 9) {
    goto LABEL_46;
  }
LABEL_40:
  if (v14 == 18)
  {
    *(void *)&__src[32] = 0x4000000000000000;
    *(_OWORD *)__src = xmmword_192E047D0;
    *(_OWORD *)&__src[16] = unk_192E047E0;
    std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
    *(_OWORD *)__src = xmmword_192E047F8;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v258, __src, (uint64_t)&__src[20], 5uLL);
    *(_OWORD *)__src = xmmword_192E0480C;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v255, __src, (uint64_t)&__src[20], 5uLL);
    int v31 = 0;
    int v30 = 0;
    float v32 = 18.0;
    goto LABEL_42;
  }
  int v31 = 0;
  int v30 = 0;
LABEL_47:
  if (v13 == 8)
  {
    v45 = v255;
    v40 = v258;
    if (v256 != v255)
    {
      unint64_t v46 = (v256 - (unsigned char *)v255) >> 2;
      if (v46 <= 1) {
        unint64_t v46 = 1;
      }
      v47 = v255;
      do
      {
        if (*v47++) {
          _DWORD *v40 = 1;
        }
        ++v40;
        --v46;
      }
      while (v46);
      v40 = v258;
    }
    uint64_t v44 = v259;
    goto LABEL_66;
  }
  if (!v13)
  {
    v39 = v255;
    v40 = v258;
    if (v256 != v255)
    {
      unint64_t v41 = (v256 - (unsigned char *)v255) >> 2;
      if (v41 <= 1) {
        unint64_t v41 = 1;
      }
      uint64_t v42 = v258;
      do
      {
        if (*v42++) {
          _DWORD *v39 = 1;
        }
        ++v39;
        --v41;
      }
      while (v41);
    }
    uint64_t v44 = v259;
    v45 = v40;
LABEL_66:
    if (v44 != v40)
    {
      unint64_t v49 = v44 - v40;
      if (v49 <= 1) {
        unint64_t v49 = 1;
      }
      bzero(v45, 4 * v49);
    }
  }
  if (!v23 || v11)
  {
    std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__clear[abi:ne180100]((uint64_t *)&self->ecpu_nets);
    std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__clear[abi:ne180100]((uint64_t *)&self->gpu_nets);
  }
  self->_maxScale = (float)v14;
  p_ecpu_nets = &self->ecpu_nets;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::resize((uint64_t *)&self->ecpu_nets, (v256 - (unsigned char *)v255) >> 2);
  p_gpu_nets = &self->gpu_nets;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::resize((uint64_t *)&self->gpu_nets, (v259 - (unsigned char *)v258) >> 2);
  p_pad = &self->strideConf.pad;
  ptr = self->_context_metal.__ptr_;
  p_context_metal = &self->_context_metal;
  if (ptr) {
    goto LABEL_74;
  }
  if (!self->_mode) {
    goto LABEL_75;
  }
  LODWORD(v243) = 20000;
  Espresso::create_context((int *)&v243, __src);
  shared_ptr<Espresso::abstract_context> v70 = *(shared_ptr<Espresso::abstract_context> *)__src;
  *(void *)__src = 0;
  *(void *)&__src[8] = 0;
  cntrl = self->_context_metal.__cntrl_;
  shared_ptr<Espresso::abstract_context> *p_context_metal = v70;
  if (!cntrl)
  {
    ptr = v70.__ptr_;
    if (!v70.__ptr_) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  if (*(void *)&__src[8]) {
    nitro::nitro_function::nitro_function(*(std::__shared_weak_count **)&__src[8]);
  }
  ptr = p_context_metal->__ptr_;
  if (p_context_metal->__ptr_)
  {
LABEL_74:
    (*(void (**)(void *, BOOL, void, float))(*(void *)v52 + 16))(v52, a10, a11, 4.0);
  }
LABEL_75:
  p_context_cpu = &self->_context_cpu;
  if (!self->_context_cpu.__ptr_)
  {
    LODWORD(v243) = 0;
    Espresso::create_context((int *)&v243, __src);
    shared_ptr<Espresso::abstract_context> v72 = *(shared_ptr<Espresso::abstract_context> *)__src;
    *(void *)__src = 0;
    *(void *)&__src[8] = 0;
    v73 = self->_context_cpu.__cntrl_;
    shared_ptr<Espresso::abstract_context> *p_context_cpu = v72;
    if (v73)
    {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v73);
      if (*(void *)&__src[8]) {
        nitro::nitro_function::nitro_function(*(std::__shared_weak_count **)&__src[8]);
      }
    }
  }
  id v226 = v24;
  if ((v232 & 1) == 0)
  {
    id v53 = v226;
    uint64_t v54 = std::string::basic_string[abi:ne180100]<0>(__src, (char *)[v53 UTF8String]);
    Espresso::load_network((uint64_t)v54, p_context_cpu, 0, 0, (uint64_t *)&v243);
    if ((__src[23] & 0x80000000) != 0) {
      operator delete(*(void **)__src);
    }
    v55 = self->_context_cpu.__cntrl_;
    v253 = self->_context_cpu.__ptr_;
    v254 = v55;
    if (v55) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v55 + 1, 1uLL, memory_order_relaxed);
    }
    [(EspressoFDOverfeatNetwork *)self retryLoadingCaffeNet:&v243 name:v53 weights:v223 context:&v253 cp:0];
    if (v254) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v254);
    }
    uint64_t v56 = v243;
    std::string::basic_string[abi:ne180100]<0>(__p, "prob_student");
    Espresso::net::get_stride_configuration((uint64_t)v56, (unsigned __int8 *)__p, (uint64_t)__src);
    begin = self->strideConf.kernel_size.__begin_;
    self->strideConf.num_layer = *(_DWORD *)__src;
    if (begin)
    {
      self->strideConf.kernel_size.__end_ = begin;
      operator delete(begin);
      self->strideConf.kernel_size.__begin_ = 0;
      self->strideConf.kernel_size.__end_ = 0;
      self->strideConf.kernel_size.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&self->strideConf.kernel_size.__begin_ = *(_OWORD *)&__src[8];
    self->strideConf.kernel_size.__end_cap_.__value_ = *(int **)&__src[24];
    memset(&__src[8], 0, 24);
    uint64_t v58 = self->strideConf.stride.__begin_;
    if (v58)
    {
      self->strideConf.stride.__end_ = v58;
      operator delete(v58);
      self->strideConf.stride.__begin_ = 0;
      self->strideConf.stride.__end_ = 0;
      self->strideConf.stride.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&self->strideConf.stride.__begin_ = *(_OWORD *)&__src[32];
    self->strideConf.stride.__end_cap_.__value_ = *(int **)&__src[48];
    memset(&__src[32], 0, 24);
    uint64_t v59 = self->strideConf.pad.__begin_;
    if (v59)
    {
      self->strideConf.pad.__end_ = v59;
      operator delete(v59);
      p_pad->__begin_ = 0;
      self->strideConf.pad.__end_ = 0;
      self->strideConf.pad.__end_cap_.__value_ = 0;
      uint64_t v59 = *(int **)&__src[32];
    }
    *(_OWORD *)&p_pad->__begin_ = v266;
    self->strideConf.pad.__end_cap_.__value_ = v267;
    v267 = 0;
    long long v266 = 0uLL;
    if (v59)
    {
      *(void *)&__src[40] = v59;
      operator delete(v59);
    }
    if (*(void *)&__src[8])
    {
      *(void *)&__src[16] = *(void *)&__src[8];
      operator delete(*(void **)&__src[8]);
    }
    if (v252 < 0) {
      operator delete(__p[0]);
    }
    Espresso::abstract_blob_container::shape(__src, **(void **)(**((void **)v243 + 4) + 80));
    self->uint64_t tile_w_1 = *(_DWORD *)__src;
    if (*(void *)&__src[40])
    {
      *(void *)&__src[48] = *(void *)&__src[40];
      operator delete(*(void **)&__src[40]);
    }
    Espresso::abstract_blob_container::shape(__src, **(void **)(**((void **)v243 + 4) + 80));
    self->float tile_h_1 = *(_DWORD *)&__src[4];
    if (*(void *)&__src[40])
    {
      *(void *)&__src[48] = *(void *)&__src[40];
      operator delete(*(void **)&__src[40]);
    }
    if (v244) {
      nitro::nitro_function::nitro_function(v244);
    }
  }
  uint64_t tile_w_1 = self->tile_w_1;
  if (a8 <= 1.0)
  {
    float v62 = (float)(int)tile_w_1;
    float tile_h_1 = (float)(int)tile_w_1 * a8;
  }
  else
  {
    float tile_h_1 = (float)self->tile_h_1;
    float v62 = tile_h_1 / a8;
  }
  if (v14 <= 0x18 && ((1 << v14) & 0x1001040) != 0)
  {
    uint64_t v63 = self->tile_h_1;
    *(void *)__src = self->tile_w_1;
    *(void *)&__src[8] = v63;
    *(void *)&__src[16] = (unint64_t)(float)(v62 * 3.0);
    *(void *)&__src[24] = (unint64_t)(float)(tile_h_1 * 3.0);
    *(void *)&__src[32] = (unint64_t)(float)(v62 * 6.0);
    *(void *)&__src[40] = (unint64_t)(float)(tile_h_1 * 6.0);
    p_net_scales = &self->net_scales;
    std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long> const*,std::pair<unsigned long long,unsigned long long> const*>(&self->net_scales.__begin_, (long long *)__src, (long long *)&__src[48], 3uLL);
    if (v14 == 24 || v14 == 12)
    {
      unint64_t v65 = (unint64_t)(float)(v62 * 12.0);
      unint64_t v66 = (unint64_t)(float)(tile_h_1 * 12.0);
      end = (char *)self->net_scales.__end_;
      value = (char *)self->net_scales.__end_cap_.__value_;
      if (end >= value)
      {
        v75 = (char *)p_net_scales->__begin_;
        uint64_t v76 = (end - (char *)p_net_scales->__begin_) >> 4;
        unint64_t v77 = v76 + 1;
        if ((unint64_t)(v76 + 1) >> 60) {
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v78 = value - v75;
        if (v78 >> 3 > v77) {
          unint64_t v77 = v78 >> 3;
        }
        BOOL v79 = (unint64_t)v78 >= 0x7FFFFFFFFFFFFFF0;
        unint64_t v80 = 0xFFFFFFFFFFFFFFFLL;
        if (!v79) {
          unint64_t v80 = v77;
        }
        if (v80)
        {
          unint64_t v80 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v80);
          v75 = (char *)self->net_scales.__begin_;
          end = (char *)self->net_scales.__end_;
        }
        else
        {
          uint64_t v81 = 0;
        }
        v83 = (unint64_t *)(v80 + 16 * v76);
        v84 = (void *)(v80 + 16 * v81);
        unint64_t *v83 = v65;
        v83[1] = v66;
        uint64_t v69 = v83 + 2;
        if (end != v75)
        {
          do
          {
            *((_OWORD *)v83 - 1) = *((_OWORD *)end - 1);
            v83 -= 2;
            end -= 16;
          }
          while (end != v75);
          v75 = (char *)p_net_scales->__begin_;
        }
        self->net_scales.__begin_ = v83;
        self->net_scales.__end_ = v69;
        self->net_scales.__end_cap_.__value_ = v84;
        if (v75) {
          operator delete(v75);
        }
      }
      else
      {
        *(void *)end = v65;
        *((void *)end + 1) = v66;
        uint64_t v69 = end + 16;
      }
      self->net_scales.__end_ = v69;
    }
    if (!v31) {
      goto LABEL_157;
    }
    unint64_t v85 = (unint64_t)(float)(v62 * 24.0);
    unint64_t v86 = (unint64_t)(float)(tile_h_1 * 24.0);
    v88 = (char *)self->net_scales.__end_;
    v87 = (char *)self->net_scales.__end_cap_.__value_;
    if (v88 < v87)
    {
      *(void *)v88 = v85;
      *((void *)v88 + 1) = v86;
      v89 = v88 + 16;
LABEL_156:
      self->net_scales.__end_ = v89;
      goto LABEL_157;
    }
    uint64_t v90 = (char *)p_net_scales->__begin_;
    uint64_t v91 = (v88 - (char *)p_net_scales->__begin_) >> 4;
    unint64_t v92 = v91 + 1;
    if ((unint64_t)(v91 + 1) >> 60) {
      std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v93 = v87 - v90;
    if (v93 >> 3 > v92) {
      unint64_t v92 = v93 >> 3;
    }
    BOOL v79 = (unint64_t)v93 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v94 = 0xFFFFFFFFFFFFFFFLL;
    if (!v79) {
      unint64_t v94 = v92;
    }
    if (v94)
    {
      unint64_t v94 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v94);
      uint64_t v90 = (char *)self->net_scales.__begin_;
      v88 = (char *)self->net_scales.__end_;
    }
    else
    {
      uint64_t v95 = 0;
    }
    v96 = (unint64_t *)(v94 + 16 * v91);
    v97 = (void *)(v94 + 16 * v95);
    unint64_t *v96 = v85;
    v96[1] = v86;
    v89 = v96 + 2;
    if (v88 != v90)
    {
      do
      {
        *((_OWORD *)v96 - 1) = *((_OWORD *)v88 - 1);
        v96 -= 2;
        v88 -= 16;
      }
      while (v88 != v90);
      uint64_t v90 = (char *)p_net_scales->__begin_;
    }
    self->net_scales.__begin_ = v96;
    goto LABEL_154;
  }
  if (v29)
  {
    uint64_t v74 = self->tile_h_1;
    *(void *)__src = self->tile_w_1;
    *(void *)&__src[8] = v74;
    *(void *)&__src[16] = 2 * tile_w_1;
    *(void *)&__src[24] = 2 * v74;
    *(void *)&__src[32] = (unint64_t)(float)(v62 * 5.0);
    *(void *)&__src[40] = (unint64_t)(float)(tile_h_1 * 5.0);
    *(void *)&__src[48] = (unint64_t)(float)(v62 * 10.0);
    *(void *)&long long v266 = (unint64_t)(float)(tile_h_1 * 10.0);
    *((void *)&v266 + 1) = (unint64_t)(float)(v62 * 20.0);
    v267 = (int *)(float)(tile_h_1 * 20.0);
    std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long> const*,std::pair<unsigned long long,unsigned long long> const*>(&self->net_scales.__begin_, (long long *)__src, &v268, 5uLL);
  }
  else
  {
    if (!v30)
    {
      uint64_t v197 = self->tile_h_1;
      *(void *)__src = self->tile_w_1;
      *(void *)&__src[8] = v197;
      *(void *)&__src[16] = 2 * (int)tile_w_1;
      *(void *)&__src[24] = 2 * v197;
      *(void *)&__src[32] = vcvts_n_u32_f32(v62, 2uLL);
      *(void *)&__src[40] = vcvts_n_u32_f32(tile_h_1, 2uLL);
      v198 = &self->net_scales;
      std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long> const*,std::pair<unsigned long long,unsigned long long> const*>(&self->net_scales.__begin_, (long long *)__src, (long long *)&__src[48], 3uLL);
      if (v14 != 16 && v14 != 8) {
        goto LABEL_157;
      }
      unint64_t v199 = vcvts_n_u32_f32(v62, 3uLL);
      unint64_t v200 = vcvts_n_u32_f32(tile_h_1, 3uLL);
      v202 = (char *)self->net_scales.__end_;
      v201 = (char *)self->net_scales.__end_cap_.__value_;
      if (v202 >= v201)
      {
        v204 = v198->__begin_;
        uint64_t v205 = (v202 - (char *)v198->__begin_) >> 4;
        unint64_t v206 = v205 + 1;
        if ((unint64_t)(v205 + 1) >> 60) {
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v207 = v201 - v204;
        if (v207 >> 3 > v206) {
          unint64_t v206 = v207 >> 3;
        }
        BOOL v79 = (unint64_t)v207 >= 0x7FFFFFFFFFFFFFF0;
        unint64_t v208 = 0xFFFFFFFFFFFFFFFLL;
        if (!v79) {
          unint64_t v208 = v206;
        }
        if (v208)
        {
          unint64_t v208 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v208);
          v204 = self->net_scales.__begin_;
          v202 = (char *)self->net_scales.__end_;
        }
        else
        {
          uint64_t v209 = 0;
        }
        v210 = (unint64_t *)(v208 + 16 * v205);
        v211 = (void *)(v208 + 16 * v209);
        unint64_t *v210 = v199;
        v210[1] = v200;
        v203 = (char *)(v210 + 2);
        if (v202 != v204)
        {
          do
          {
            *((_OWORD *)v210 - 1) = *((_OWORD *)v202 - 1);
            v210 -= 2;
            v202 -= 16;
          }
          while (v202 != v204);
          v204 = v198->__begin_;
        }
        self->net_scales.__begin_ = v210;
        self->net_scales.__end_ = v203;
        self->net_scales.__end_cap_.__value_ = v211;
        if (v204) {
          operator delete(v204);
        }
      }
      else
      {
        *(void *)v202 = v199;
        *((void *)v202 + 1) = v200;
        v203 = v202 + 16;
      }
      self->net_scales.__end_ = v203;
      if (v14 != 16) {
        goto LABEL_157;
      }
      unint64_t v212 = vcvts_n_u32_f32(v62, 4uLL);
      unint64_t v213 = vcvts_n_u32_f32(tile_h_1, 4uLL);
      v214 = (char *)self->net_scales.__end_cap_.__value_;
      if (v203 < v214)
      {
        *(void *)v203 = v212;
        *((void *)v203 + 1) = v213;
        v89 = v203 + 16;
        goto LABEL_156;
      }
      uint64_t v90 = (char *)v198->__begin_;
      uint64_t v215 = (v203 - (char *)v198->__begin_) >> 4;
      unint64_t v216 = v215 + 1;
      if ((unint64_t)(v215 + 1) >> 60) {
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v217 = v214 - v90;
      if (v217 >> 3 > v216) {
        unint64_t v216 = v217 >> 3;
      }
      BOOL v79 = (unint64_t)v217 >= 0x7FFFFFFFFFFFFFF0;
      unint64_t v218 = 0xFFFFFFFFFFFFFFFLL;
      if (!v79) {
        unint64_t v218 = v216;
      }
      if (v218)
      {
        unint64_t v218 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v218);
        uint64_t v90 = (char *)self->net_scales.__begin_;
        v203 = (char *)self->net_scales.__end_;
      }
      else
      {
        uint64_t v219 = 0;
      }
      v220 = (unint64_t *)(v218 + 16 * v215);
      v97 = (void *)(v218 + 16 * v219);
      unint64_t *v220 = v212;
      v220[1] = v213;
      v89 = v220 + 2;
      if (v203 != v90)
      {
        do
        {
          *((_OWORD *)v220 - 1) = *((_OWORD *)v203 - 1);
          v220 -= 2;
          v203 -= 16;
        }
        while (v203 != v90);
        uint64_t v90 = (char *)v198->__begin_;
      }
      self->net_scales.__begin_ = v220;
LABEL_154:
      self->net_scales.__end_ = v89;
      self->net_scales.__end_cap_.__value_ = v97;
      if (v90) {
        operator delete(v90);
      }
      goto LABEL_156;
    }
    uint64_t v82 = self->tile_h_1;
    *(void *)__src = self->tile_w_1;
    *(void *)&__src[8] = v82;
    *(void *)&__src[16] = (unint64_t)(float)(v62 * 3.0);
    *(void *)&__src[24] = (unint64_t)(float)(tile_h_1 * 3.0);
    *(void *)&__src[32] = (unint64_t)(float)(v62 * 9.0);
    *(void *)&__src[40] = (unint64_t)(float)(tile_h_1 * 9.0);
    *(void *)&__src[48] = (unint64_t)(float)(v62 * 18.0);
    *(void *)&long long v266 = (unint64_t)(float)(tile_h_1 * 18.0);
    std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long> const*,std::pair<unsigned long long,unsigned long long> const*>(&self->net_scales.__begin_, (long long *)__src, (long long *)((char *)&v266 + 8), 4uLL);
  }
LABEL_157:
  v98 = (long long *)self->net_scales.__begin_;
  int v99 = (long long *)self->net_scales.__end_;
  if (v98 != v99)
  {
    int8x16_t v100 = (int8x16_t)vdupq_n_s64(0x1CuLL);
    v101 = (uint64x2_t *)self->net_scales.__begin_;
    do
    {
      *(int8x16_t *)v101 = vbslq_s8((int8x16_t)vcgtq_u64(*v101, (uint64x2_t)v100), *(int8x16_t *)v101, v100);
      ++v101;
    }
    while (v101 != (uint64x2_t *)v99);
  }
  std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>(&self->full_scales.__begin_, v98, v99, v99 - v98);
  [(EspressoFDOverfeatNetwork *)self strideConfiguration];
  v102 = *(void **)&__src[8];
  memset(&__src[8], 0, 24);
  if ((void)v266)
  {
    *((void *)&v266 + 1) = v266;
    operator delete((void *)v266);
  }
  if (*(void *)&__src[32])
  {
    *(void *)&__src[40] = *(void *)&__src[32];
    operator delete(*(void **)&__src[32]);
  }
  if (*(void *)&__src[8])
  {
    *(void *)&__src[16] = *(void *)&__src[8];
    operator delete(*(void **)&__src[8]);
  }
  [(EspressoFDOverfeatNetwork *)self strideConfiguration];
  v103 = *(int **)&__src[32];
  memset(&__src[32], 0, 24);
  if ((void)v266)
  {
    *((void *)&v266 + 1) = v266;
    operator delete((void *)v266);
    if (*(void *)&__src[32])
    {
      *(void *)&__src[40] = *(void *)&__src[32];
      operator delete(*(void **)&__src[32]);
    }
  }
  if (*(void *)&__src[8])
  {
    *(void *)&__src[16] = *(void *)&__src[8];
    operator delete(*(void **)&__src[8]);
  }
  [(EspressoFDOverfeatNetwork *)self strideConfiguration];
  v267 = 0;
  v104 = (void *)v266;
  long long v266 = 0uLL;
  if (*(void *)&__src[32])
  {
    *(void *)&__src[40] = *(void *)&__src[32];
    operator delete(*(void **)&__src[32]);
  }
  if (*(void *)&__src[8])
  {
    *(void *)&__src[16] = *(void *)&__src[8];
    operator delete(*(void **)&__src[8]);
  }
  [(EspressoFDOverfeatNetwork *)self strideConfiguration];
  uint64_t v105 = *(unsigned int *)__src;
  if ((void)v266)
  {
    *((void *)&v266 + 1) = v266;
    operator delete((void *)v266);
  }
  if (*(void *)&__src[32])
  {
    *(void *)&__src[40] = *(void *)&__src[32];
    operator delete(*(void **)&__src[32]);
  }
  if (*(void *)&__src[8])
  {
    *(void *)&__src[16] = *(void *)&__src[8];
    operator delete(*(void **)&__src[8]);
  }
  int v106 = 1;
  if ((int)v105 >= 1)
  {
    v107 = v103;
    do
    {
      int v108 = *v107++;
      v106 *= v108;
      --v105;
    }
    while (v105);
  }
  self->int retile_stride = v106;
  self->int retile_tile_sz = self->tile_w_1;
  std::vector<int>::resize((std::vector<int> *)&self->retile_n_outputs_v, ((char *)self->full_scales.__end_ - (char *)self->full_scales.__begin_) >> 4);
  if (v104) {
    operator delete(v104);
  }
  if (v103) {
    operator delete(v103);
  }
  if (v102) {
    operator delete(v102);
  }
  [(EspressoFDOverfeatNetwork *)self setup_retile];
  self->cropDims.first = (unint64_t)v62;
  self->cropDims.second = (unint64_t)tile_h_1;
  p_resizers_for_batching = &self->resizers_for_batching;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__clear[abi:ne180100]((uint64_t *)&self->resizers_for_batching);
  int v109 = 0;
  self->n_resizers_for_batching = 8;
  do
  {
    v110 = (char *)operator new(0xB8uLL);
    *((void *)v110 + 1) = 0;
    *((void *)v110 + 2) = 0;
    *(void *)v110 = &unk_1EE386E40;
    *(_OWORD *)(v110 + 24) = 0u;
    *(_OWORD *)(v110 + 40) = 0u;
    *(_OWORD *)(v110 + 56) = 0u;
    *(_OWORD *)(v110 + 72) = 0u;
    *(_OWORD *)(v110 + 88) = 0u;
    *(_OWORD *)(v110 + 104) = 0u;
    *(_OWORD *)(v110 + 120) = 0u;
    *(_OWORD *)(v110 + 136) = 0u;
    *((void *)v110 + 19) = 0;
    v110[176] = 1;
    *((_DWORD *)v110 + 40) = 0;
    *((void *)v110 + 21) = 0;
    if (v110 + 96 != (char *)&self->full_scales) {
      std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>((void *)v110 + 12, (long long *)self->full_scales.__begin_, (long long *)self->full_scales.__end_, ((char *)self->full_scales.__end_ - (char *)self->full_scales.__begin_) >> 4);
    }
    v112 = (char *)self->resizers_for_batching.__end_;
    v111 = (char *)self->resizers_for_batching.__end_cap_.__value_;
    if (v112 < v111)
    {
      *(void *)v112 = v110 + 24;
      *((void *)v112 + 1) = v110;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v110 + 1, 1uLL, memory_order_relaxed);
      v113 = v112 + 16;
      self->resizers_for_batching.__end_ = v112 + 16;
      goto LABEL_211;
    }
    v114 = (char *)p_resizers_for_batching->__begin_;
    uint64_t v115 = (v112 - (char *)p_resizers_for_batching->__begin_) >> 4;
    unint64_t v116 = v115 + 1;
    if ((unint64_t)(v115 + 1) >> 60) {
      std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v117 = v111 - v114;
    if (v117 >> 3 > v116) {
      unint64_t v116 = v117 >> 3;
    }
    if ((unint64_t)v117 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v118 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v118 = v116;
    }
    if (v118 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    v119 = (char *)operator new(16 * v118);
    *(void *)&long long v120 = v110 + 24;
    *((void *)&v120 + 1) = v110;
    v121 = &v119[16 * v115];
    v122 = &v119[16 * v118];
    *(_OWORD *)v121 = v120;
    v113 = v121 + 16;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v110 + 1, 1uLL, memory_order_relaxed);
    if (v112 == v114)
    {
      self->resizers_for_batching.__begin_ = v121;
      self->resizers_for_batching.__end_ = v113;
      self->resizers_for_batching.__end_cap_.__value_ = v122;
      if (v112) {
        goto LABEL_210;
      }
    }
    else
    {
      do
      {
        long long v123 = *((_OWORD *)v112 - 1);
        v112 -= 16;
        *((_OWORD *)v121 - 1) = v123;
        v121 -= 16;
        *(void *)v112 = 0;
        *((void *)v112 + 1) = 0;
      }
      while (v112 != v114);
      v124 = (char *)self->resizers_for_batching.__begin_;
      v112 = (char *)self->resizers_for_batching.__end_;
      self->resizers_for_batching.__begin_ = v121;
      self->resizers_for_batching.__end_ = v113;
      self->resizers_for_batching.__end_cap_.__value_ = v122;
      if (v112 != v124)
      {
        do
        {
          v125 = (std::__shared_weak_count *)*((void *)v112 - 1);
          if (v125) {
            nitro::nitro_function::nitro_function(v125);
          }
          v112 -= 16;
        }
        while (v112 != v124);
        v112 = v124;
      }
      if (v112) {
LABEL_210:
      }
        operator delete(v112);
    }
LABEL_211:
    self->resizers_for_batching.__end_ = v113;
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v110);
    ++v109;
  }
  while (v109 < self->n_resizers_for_batching);
  std::vector<std::shared_ptr<Espresso::blob<float,3>>>::resize((uint64_t)&self->probBlobs, ((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4);
  std::vector<std::shared_ptr<Espresso::blob<float,3>>>::resize((uint64_t)&self->boxBlobs, ((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4);
  v126 = (char *)self->net_scales.__begin_;
  if (self->net_scales.__end_ == v126)
  {
    int v233 = 1;
  }
  else
  {
    unint64_t v127 = 0;
    int v224 = -1;
    uint64_t v128 = 8;
    int v129 = -1;
    int v233 = 1;
    do
    {
      *(void *)&long long v266 = 0;
      memset(&__src[24], 0, 32);
      *(int32x2_t *)__src = vmovn_s64(*(int64x2_t *)&v126[v128 - 8]);
      *(_OWORD *)&__src[8] = xmmword_192DCA8C0;
      if (*((_DWORD *)v258 + v127))
      {
        v130 = (char *)p_gpu_nets->__begin_;
        v131 = (char *)p_gpu_nets->__begin_ + v128;
        uint64_t v133 = *((void *)v131 - 1);
        v132 = (uint64_t *)(v131 - 8);
        if (!v133)
        {
          v134 = [v226 pathExtension];
          int v135 = [v134 isEqualToString:@"net"];

          if (v135)
          {
            std::string::basic_string[abi:ne180100]<0>(&v249, (char *)[v226 UTF8String]);
            v244 = 0;
            unint64_t v245 = 0;
            v247 = 0;
            uint64_t v248 = 0;
            v243 = &v244;
            v246 = &v247;
            std::string::basic_string[abi:ne180100]<0>(v263, "json");
            Espresso::load_network_layers(&v249, p_context_metal, (uint64_t)&v243, a7, v263, (uint64_t *)&v250);
            long long v136 = v250;
            long long v250 = 0uLL;
            v137 = *(std::__shared_weak_count **)&v130[v128];
            *(_OWORD *)v132 = v136;
            if (v137) {
              nitro::nitro_function::nitro_function(v137);
            }
            if (v264 < 0) {
              operator delete(*(void **)v263);
            }
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v246, v247);
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v243, (char *)v244);
            if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v249.__r_.__value_.__l.__data_);
            }
          }
          if (!*v132)
          {
            std::string::basic_string[abi:ne180100]<0>(&v249, (char *)[v226 UTF8String]);
            std::string::basic_string[abi:ne180100]<0>(v263, "");
            v244 = 0;
            unint64_t v245 = 0;
            v247 = 0;
            uint64_t v248 = 0;
            v243 = &v244;
            v246 = &v247;
            Espresso::load_network_layers_binserializer((uint64_t)&v249, (const void **)v263, p_context_metal, (uint64_t)&v243, a7, v129 != -1, (uint64_t *)&v250);
            long long v138 = v250;
            long long v250 = 0uLL;
            v139 = *(std::__shared_weak_count **)&v130[v128];
            *(_OWORD *)v132 = v138;
            if (v139) {
              nitro::nitro_function::nitro_function(v139);
            }
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v246, v247);
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v243, (char *)v244);
            if (v264 < 0) {
              operator delete(*(void **)v263);
            }
            if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v249.__r_.__value_.__l.__data_);
            }
          }
          v140 = self->_context_metal.__cntrl_;
          v241 = self->_context_metal.__ptr_;
          v242 = v140;
          if (v140) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v140 + 1, 1uLL, memory_order_relaxed);
          }
          [(EspressoFDOverfeatNetwork *)self retryLoadingCaffeNet:v132 name:v226 weights:v223 context:&v241 cp:a7];
          if (v242) {
            nitro::nitro_function::nitro_function((std::__shared_weak_count *)v242);
          }
        }
        v141 = *(std::__shared_weak_count **)&v130[v128];
        v240[0] = *v132;
        v240[1] = (uint64_t)v141;
        if (v141) {
          atomic_fetch_add_explicit(&v141->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        Espresso::compute_network_shape_starting_from_data_shape(v240, (long long *)__src, (uint64_t)&v243);
        if (v141) {
          nitro::nitro_function::nitro_function(v141);
        }
        float v142 = (float)*(int *)__src / (float)*(int *)&__src[4];
        v143 = (unint64_t *)((char *)self->net_scales.__begin_ + v128);
        unint64_t v145 = *(v143 - 1);
        unint64_t v144 = *v143;
        if (v145 <= v144) {
          int v146 = v144;
        }
        else {
          int v146 = v145;
        }
        if (fabsf(v142) <= 1.2)
        {
          if (v142 >= 0.83333)
          {
            MEMORY[0x192FF0F50](*v132 + 424, "");
            int v152 = 0;
          }
          else
          {
            std::to_string(&v249, v146);
            v153 = std::string::insert(&v249, 0, "fd-");
            std::string::size_type v154 = v153->__r_.__value_.__r.__words[0];
            *(void *)v263 = v153->__r_.__value_.__l.__size_;
            *(void *)&v263[7] = *(std::string::size_type *)((char *)&v153->__r_.__value_.__r.__words[1] + 7);
            char v155 = HIBYTE(v153->__r_.__value_.__r.__words[2]);
            v153->__r_.__value_.__l.__size_ = 0;
            v153->__r_.__value_.__r.__words[2] = 0;
            v153->__r_.__value_.__r.__words[0] = 0;
            uint64_t v156 = *v132;
            if (*(char *)(*v132 + 447) < 0) {
              operator delete(*(void **)(v156 + 424));
            }
            uint64_t v157 = *(void *)v263;
            *(void *)(v156 + 424) = v154;
            *(void *)(v156 + 432) = v157;
            *(void *)(v156 + 439) = *(void *)&v263[7];
            *(unsigned char *)(v156 + 447) = v155;
            if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v249.__r_.__value_.__l.__data_);
            }
            int v152 = 1;
          }
        }
        else
        {
          std::to_string(&v249, v146);
          v147 = std::string::insert(&v249, 0, "fd-");
          std::string::size_type v148 = v147->__r_.__value_.__r.__words[0];
          *(void *)v263 = v147->__r_.__value_.__l.__size_;
          *(void *)&v263[7] = *(std::string::size_type *)((char *)&v147->__r_.__value_.__r.__words[1] + 7);
          char v149 = HIBYTE(v147->__r_.__value_.__r.__words[2]);
          v147->__r_.__value_.__l.__size_ = 0;
          v147->__r_.__value_.__r.__words[2] = 0;
          v147->__r_.__value_.__r.__words[0] = 0;
          uint64_t v150 = *v132;
          if (*(char *)(*v132 + 447) < 0) {
            operator delete(*(void **)(v150 + 424));
          }
          uint64_t v151 = *(void *)v263;
          *(void *)(v150 + 424) = v148;
          *(void *)(v150 + 432) = v151;
          *(void *)(v150 + 439) = *(void *)&v263[7];
          *(unsigned char *)(v150 + 447) = v149;
          if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v249.__r_.__value_.__l.__data_);
          }
          int v152 = 0;
        }
        uint64_t v158 = *v132;
        *(_DWORD *)(v158 + 496) = v152;
        *(unsigned char *)(v158 + 500) = 0;
        v159 = *(atomic_ullong **)&v130[v128];
        v239[0] = (Espresso::net *)v158;
        v239[1] = (Espresso::net *)v159;
        if (v159) {
          atomic_fetch_add_explicit(v159 + 1, 1uLL, memory_order_relaxed);
        }
        Espresso::prepare_network_reshape_graph_coloring(v239, (uint64_t)&v243);
        if (v159) {
          nitro::nitro_function::nitro_function((std::__shared_weak_count *)v159);
        }
        if (v129 == -1) {
          int v129 = v127;
        }
        else {
          Espresso::net::share_weights(*v132, (uint64_t)p_gpu_nets->__begin_ + 16 * v129);
        }
        v160 = (char *)p_gpu_nets->__begin_;
        uint64_t v161 = *v132;
        uint64_t v162 = *(void *)&v130[v128];
        if (v162) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v162 + 8), 1uLL, memory_order_relaxed);
        }
        *(void *)&v160[v128 - 8] = v161;
        v163 = *(std::__shared_weak_count **)&v160[v128];
        *(void *)&v160[v128] = v162;
        if (v163) {
          nitro::nitro_function::nitro_function(v163);
        }
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v246, v247);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v243, (char *)v244);
      }
      if (*((_DWORD *)v255 + v127))
      {
        v164 = (char *)p_ecpu_nets->__begin_;
        v165 = (char *)p_ecpu_nets->__begin_ + v128;
        uint64_t v167 = *((void *)v165 - 1);
        v166 = (uint64_t *)(v165 - 8);
        if (!v167)
        {
          id v168 = v226;
          std::string::basic_string[abi:ne180100]<0>(&v243, (char *)[v168 UTF8String]);
          Espresso::load_network((uint64_t)&v243, p_context_cpu, a7, 0, (uint64_t *)&v249);
          v169 = *(std::__shared_weak_count **)&v164[v128];
          *(_OWORD *)v166 = *(_OWORD *)&v249.__r_.__value_.__l.__data_;
          if (v169) {
            nitro::nitro_function::nitro_function(v169);
          }
          if (SHIBYTE(v245) < 0) {
            operator delete(v243);
          }
          v170 = self->_context_cpu.__cntrl_;
          v237 = self->_context_cpu.__ptr_;
          v238 = v170;
          if (v170) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v170 + 1, 1uLL, memory_order_relaxed);
          }
          [(EspressoFDOverfeatNetwork *)self retryLoadingCaffeNet:v166 name:v168 weights:v223 context:&v237 cp:a7];
          if (v238) {
            nitro::nitro_function::nitro_function((std::__shared_weak_count *)v238);
          }
        }
        v171 = *(std::__shared_weak_count **)&v164[v128];
        v236[0] = *v166;
        v236[1] = (uint64_t)v171;
        if (v171) {
          atomic_fetch_add_explicit(&v171->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        Espresso::compute_network_shape_starting_from_data_shape(v236, (long long *)__src, (uint64_t)&v243);
        if (v171) {
          nitro::nitro_function::nitro_function(v171);
        }
        v172 = (Espresso *)*v166;
        *(unsigned char *)(*v166 + 500) = 0;
        v173 = *(std::__shared_weak_count **)&v164[v128];
        if (v173) {
          atomic_fetch_add_explicit(&v173->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        Espresso::shape_network_recursive(v172, (Espresso::net *)&v243, 0, 0);
        if (v173) {
          nitro::nitro_function::nitro_function(v173);
        }
        if (v224 == -1)
        {
          int v224 = v127;
          v174 = &self->ecpu_nets;
        }
        else
        {
          v174 = &self->ecpu_nets;
          Espresso::net::share_weights(*v166, (uint64_t)p_ecpu_nets->__begin_ + 16 * v224);
        }
        v175 = (char *)v174->__begin_;
        uint64_t v176 = *v166;
        uint64_t v177 = *(void *)&v164[v128];
        if (v177) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v177 + 8), 1uLL, memory_order_relaxed);
        }
        *(void *)&v175[v128 - 8] = v176;
        v178 = *(std::__shared_weak_count **)&v175[v128];
        *(void *)&v175[v128] = v177;
        if (v178) {
          nitro::nitro_function::nitro_function(v178);
        }
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v246, v247);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v243, (char *)v244);
      }
      double v179 = *(double *)(*(void *)p_scalesc + 8 * v127);
      if (*(void *)&__src[40])
      {
        *(void *)&__src[48] = *(void *)&__src[40];
        operator delete(*(void **)&__src[40]);
      }
      int v233 = (int)(v179 * (double)v233);
      ++v127;
      v126 = (char *)self->net_scales.__begin_;
      v128 += 16;
    }
    while (v127 < ((char *)self->net_scales.__end_ - (char *)v126) >> 4);
  }
  v243 = 0;
  v244 = 0;
  unint64_t v245 = 0;
  v180 = (char *)self->gpu_nets.__begin_;
  for (uint64_t i = (char *)self->gpu_nets.__end_; v180 != i; v180 += 16)
  {
    std::__shared_count v182 = *(std::__shared_count *)v180;
    v183 = (std::__shared_weak_count *)*((void *)v180 + 1);
    if (v183) {
      atomic_fetch_add_explicit(&v183->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v182.__vftable)
    {
      BYTE4(v182.__vftable[20].__on_zero_shared) = 0;
      v184 = v244;
      if ((unint64_t)v244 >= v245)
      {
        std::__shared_count v231 = v182;
        int64_t v186 = ((char *)v244 - (unsigned char *)v243) >> 4;
        unint64_t v187 = v186 + 1;
        if ((unint64_t)(v186 + 1) >> 60) {
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v188 = v245 - (void)v243;
        if ((uint64_t)(v245 - (void)v243) >> 3 > v187) {
          unint64_t v187 = v188 >> 3;
        }
        if ((unint64_t)v188 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v189 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v189 = v187;
        }
        *(void *)&__src[32] = &v245;
        v190 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v189);
        v191 = &v190[16 * v186];
        *(void *)__src = v190;
        *(void *)&__src[8] = v191;
        *(void *)&__src[24] = &v190[16 * v192];
        *(std::__shared_count *)v191 = v231;
        if (v183) {
          atomic_fetch_add_explicit(&v183->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        *(void *)&__src[16] = v191 + 16;
        std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__swap_out_circular_buffer(&v243, __src);
        p_shared_weak_owners = (char *)v244;
        std::__split_buffer<std::shared_ptr<Espresso::abstract_blob_container>>::~__split_buffer((uint64_t)__src);
      }
      else
      {
        v244->std::__shared_count = v182;
        if (v183) {
          atomic_fetch_add_explicit(&v183->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        p_shared_weak_owners = (char *)&v184->__shared_weak_owners_;
      }
      v244 = (std::__shared_weak_count *)p_shared_weak_owners;
    }
    if (v183) {
      nitro::nitro_function::nitro_function(v183);
    }
  }
  *(void *)&__src[8] = 0;
  *(void *)&__src[16] = 0;
  *(void *)__src = &unk_1EE3500B0;
  v193 = (std::__shared_weak_count *)operator new(0x30uLL);
  v193->__shared_owners_ = 0;
  v193->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE388618;
  v193[1].__shared_weak_owners_ = 0;
  v193->__shared_weak_owners_ = 0;
  v193[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE35F440;
  v193[1].__shared_owners_ = 0x100000003;
  atomic_fetch_add_explicit(&v193->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v193->__shared_owners_, 1uLL, memory_order_relaxed);
  *(void *)&__src[8] = v193 + 1;
  *(void *)&__src[16] = v193;
  nitro::nitro_function::nitro_function(v193);
  v195 = (Espresso::net **)v243;
  v196 = v244;
  while (v195 != (Espresso::net **)v196)
  {
    Espresso::pass_graph_coloring::run_on_network((Espresso::pass_graph_coloring *)__src, *v195, (uint64_t)v234);
    if (v235) {
      nitro::nitro_function::nitro_function(v235);
    }
    v195 += 2;
  }
  *(float *)&double v194 = (float)v233;
  Espresso::print_mem_stats((Espresso *)[(EspressoFDOverfeatNetwork *)self setMaxScale:v194]);
  nitro::nitro_function::nitro_function(v193);
  *(void *)__src = &unk_1EE3719B0;
  if (*(void *)&__src[16]) {
    nitro::nitro_function::nitro_function(*(std::__shared_weak_count **)&__src[16]);
  }
  *(void *)__src = &v243;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100]((void ***)__src);

  if (v255)
  {
    v256 = v255;
    operator delete(v255);
  }
  if (v258)
  {
    v259 = v258;
    operator delete(v258);
  }
  if (v262 < 0) {
    operator delete(v261);
  }
}

- (void)wipeLayersMemory
{
  begin = (char *)self->gpu_nets.__begin_;
  for (uint64_t i = (char *)self->gpu_nets.__end_; begin != i; begin += 16)
  {
    uint64_t v5 = *(Espresso::net **)begin;
    id v6 = (std::__shared_weak_count *)*((void *)begin + 1);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v5) {
      Espresso::net::wipe_layers_blobs(v5);
    }
    if (v6) {
      nitro::nitro_function::nitro_function(v6);
    }
  }
  id v8 = (char *)self->ecpu_nets.__begin_;
  for (j = (char *)self->ecpu_nets.__end_; v8 != j; v8 += 16)
  {
    double v9 = *(Espresso::net **)v8;
    uint64_t v10 = (std::__shared_weak_count *)*((void *)v8 + 1);
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v9) {
      Espresso::net::wipe_layers_blobs(v9);
    }
    if (v10) {
      nitro::nitro_function::nitro_function(v10);
    }
  }
}

- (void)reset
{
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__clear[abi:ne180100]((uint64_t *)&self->probBlobs);

  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__clear[abi:ne180100]((uint64_t *)&self->boxBlobs);
}

- (void)autoResizeForAspectRatio:(float)a3 useLowPriorityMode:(BOOL)a4 gpuPriority:(unsigned int)a5
{
  id v15 = [(EspressoFDOverfeatNetwork *)self basename];
  double v9 = [(EspressoFDOverfeatNetwork *)self weights];
  uint64_t v10 = [(EspressoFDOverfeatNetwork *)self scaleConfig];
  uint64_t v11 = [(EspressoFDOverfeatNetwork *)self mode];
  uint64_t v12 = [(EspressoFDOverfeatNetwork *)self cpin];
  HIDWORD(v14) = a5;
  LOBYTE(v14) = a4;
  *(float *)&double v13 = a3;
  -[EspressoFDOverfeatNetwork autoSetupNetBaseName:weights:scaleConfig:setupMode:computePath:autoAspectRatio:forceReset:useLowPriorityMode:gpuPriority:](self, "autoSetupNetBaseName:weights:scaleConfig:setupMode:computePath:autoAspectRatio:forceReset:useLowPriorityMode:gpuPriority:", v15, v9, v10, v11, v12, 0, v13, v14);
}

- (net_strides_configuration)strideConfiguration
{
  retstr->num_layer = self->strideConf.num_layer;
  retstr->kernel_size.__begin_ = 0;
  retstr->kernel_size.__end_ = 0;
  retstr->kernel_size.__end_cap_.__value_ = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&retstr->kernel_size.__begin_, self->strideConf.kernel_size.__begin_, (uint64_t)self->strideConf.kernel_size.__end_, self->strideConf.kernel_size.__end_ - self->strideConf.kernel_size.__begin_);
  retstr->stride.__begin_ = 0;
  retstr->stride.__end_ = 0;
  retstr->stride.__end_cap_.__value_ = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&retstr->stride.__begin_, self->strideConf.stride.__begin_, (uint64_t)self->strideConf.stride.__end_, self->strideConf.stride.__end_ - self->strideConf.stride.__begin_);
  retstr->pad.__begin_ = 0;
  retstr->pad.__end_ = 0;
  retstr->pad.__end_cap_.__value_ = 0;
  return (net_strides_configuration *)std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&retstr->pad.__begin_, self->strideConf.pad.__begin_, (uint64_t)self->strideConf.pad.__end_, self->strideConf.pad.__end_ - self->strideConf.pad.__begin_);
}

- (double)getScale:(int)a3
{
  return self->scalesc.__begin_[a3];
}

- (void)dealloc
{
  CGColorSpaceRelease(self->colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)EspressoFDOverfeatNetwork;
  [(EspressoFDOverfeatNetwork *)&v3 dealloc];
}

- (EspressoFDOverfeatNetwork)init
{
  v9.receiver = self;
  v9.super_class = (Class)EspressoFDOverfeatNetwork;
  v2 = [(EspressoFDOverfeatNetwork *)&v9 init];
  if (v2)
  {
    v2->colorSpace = CGColorSpaceCreateDeviceRGB();
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    cpu_semaphore = v2->cpu_semaphore;
    v2->cpu_semaphore = (OS_dispatch_semaphore *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.espresso.cpu_queue_0", 0);
    cpu_queue_0 = v2->cpu_queue_0;
    v2->cpu_queue_0 = (OS_dispatch_queue *)v5;

    int v7 = v2;
  }

  return v2;
}

- (shared_ptr<Espresso::net>)cpu_net:(int)a3
{
  long long v4 = *((_OWORD *)self->ecpu_nets.__begin_ + a3);
  *dispatch_semaphore_t v3 = v4;
  if (*((void *)&v4 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v4 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (net *)self;
  return result;
}

- (shared_ptr<Espresso::net>)gpu_net:(int)a3
{
  long long v4 = *((_OWORD *)self->gpu_nets.__begin_ + a3);
  *dispatch_semaphore_t v3 = v4;
  if (*((void *)&v4 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v4 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (net *)self;
  return result;
}

- (int)resizerCount
{
  return (unint64_t)((char *)self->resizers_for_batching.__end_ - (char *)self->resizers_for_batching.__begin_) >> 4;
}

- (shared_ptr<Espresso::fast_pyramid_resizer>)resizerAtIndex:(int)a3
{
  long long v4 = *((_OWORD *)self->resizers_for_batching.__begin_ + a3);
  *dispatch_semaphore_t v3 = v4;
  if (*((void *)&v4 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v4 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (fast_pyramid_resizer *)self;
  return result;
}

@end