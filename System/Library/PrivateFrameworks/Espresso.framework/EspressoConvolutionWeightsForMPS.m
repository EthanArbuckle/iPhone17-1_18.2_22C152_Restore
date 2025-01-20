@interface EspressoConvolutionWeightsForMPS
- (BOOL)load;
- (BOOL)ready;
- (EspressoConvolutionWeightsForMPS)initWithParams:(convolution_uniforms *)a3;
- (float)biasTerms;
- (float)lookupTableForUInt8Kernel;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptor;
- (id)label;
- (uint64_t)rangesForUInt8Kernel;
- (unsigned)dataType;
- (void)purge;
- (void)weights;
@end

@implementation EspressoConvolutionWeightsForMPS

- (EspressoConvolutionWeightsForMPS)initWithParams:(convolution_uniforms *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)EspressoConvolutionWeightsForMPS;
  v4 = [(EspressoConvolutionWeightsForMPS *)&v18 init];
  v5 = (EspressoConvolutionWeightsForMPS *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->W;
    long long v7 = *(_OWORD *)&a3->start_channel_low_priority_split;
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->has_biases;
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    long long v8 = *(_OWORD *)&a3->Nx;
    long long v9 = *(_OWORD *)&a3->fused_activation_alpha;
    long long v10 = *(_OWORD *)&a3->pad.l;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&a3->dilation_x;
    *(_OWORD *)(v4 + 88) = v10;
    *(_OWORD *)(v4 + 72) = v9;
    *(_OWORD *)(v4 + 56) = v8;
    long long v11 = *(_OWORD *)&a3->has_batch_norm;
    long long v12 = *(_OWORD *)&a3->total_channel_bottom;
    long long v13 = *(_OWORD *)&a3->low_precision_accumulation;
    *(void *)(v4 + 165) = *(void *)((char *)&a3->stride_t + 1);
    *(_OWORD *)(v4 + 152) = v13;
    *(_OWORD *)(v4 + 136) = v12;
    *(_OWORD *)(v4 + 120) = v11;
    *((_DWORD *)v4 + 72) = 268435488;
    v14 = (std::__shared_weak_count *)*((void *)v4 + 35);
    v5->scale_factor_batch_norm.__ptr_ = 0;
    v5->scale_factor_batch_norm.__cntrl_ = 0;
    if (v14) {
      nitro::nitro_function::nitro_function(v14);
    }
    cntrl = (std::__shared_weak_count *)v5->quantization_ranges.__cntrl_;
    v5->quantization_ranges.__ptr_ = 0;
    v5->quantization_ranges.__cntrl_ = 0;
    if (cntrl) {
      nitro::nitro_function::nitro_function(cntrl);
    }
    v16 = (std::__shared_weak_count *)v5->quantization_lut.__cntrl_;
    v5->quantization_lut.__ptr_ = 0;
    v5->quantization_lut.__cntrl_ = 0;
    if (v16) {
      nitro::nitro_function::nitro_function(v16);
    }
  }
  return v5;
}

- (id).cxx_construct
{
  self->quantization_lut = 0u;
  self->scale_factor_batch_norm = 0u;
  self->biases_blob = 0u;
  self->quantization_ranges = 0u;
  self->weights_blob = 0u;
  self->weights_f16_blob = 0u;
  self->quantized_weights_blob = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->scale_factor_batch_norm.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v4 = self->quantization_lut.__cntrl_;
  if (v4) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  }
  v5 = self->quantization_ranges.__cntrl_;
  if (v5) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v5);
  }
  long long v6 = self->biases_blob.__cntrl_;
  if (v6) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v6);
  }
  long long v7 = self->weights_f16_blob.__cntrl_;
  if (v7) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v7);
  }
  long long v8 = self->weights_blob.__cntrl_;
  if (v8) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v8);
  }
  long long v9 = self->quantized_weights_blob.__cntrl_;
  if (v9)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [EspressoConvolutionWeightsForMPS alloc];
  long long v5 = *(_OWORD *)&self->params.has_batch_norm;
  long long v6 = *(_OWORD *)&self->params.low_precision_accumulation;
  v34[8] = *(_OWORD *)&self->params.total_channel_bottom;
  v34[9] = v6;
  uint64_t v35 = *(void *)&self->params.disable_bnns_client_ptr;
  long long v7 = *(_OWORD *)&self->params.Nx;
  long long v8 = *(_OWORD *)&self->params.pad.l;
  v34[4] = *(_OWORD *)&self->params.fused_activation_alpha;
  v34[5] = v8;
  v34[6] = *(_OWORD *)&self->params.dilation_x;
  v34[7] = v5;
  long long v9 = *(_OWORD *)&self->params.start_channel_low_priority_split;
  v34[0] = *(_OWORD *)&self->params.W;
  v34[1] = v9;
  v34[2] = *(_OWORD *)&self->params.has_biases;
  v34[3] = v7;
  uint64_t v10 = [(EspressoConvolutionWeightsForMPS *)v4 initWithParams:v34];
  uint64_t v11 = v10;
  ptr = self->quantized_weights_blob.__ptr_;
  cntrl = self->quantized_weights_blob.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v14 = *(std::__shared_weak_count **)(v10 + 184);
  *(void *)(v11 + 176) = ptr;
  *(void *)(v11 + 184) = cntrl;
  if (v14) {
    nitro::nitro_function::nitro_function(v14);
  }
  v16 = self->weights_blob.__ptr_;
  v15 = self->weights_blob.__cntrl_;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v15 + 1, 1uLL, memory_order_relaxed);
  }
  v17 = *(std::__shared_weak_count **)(v11 + 200);
  *(void *)(v11 + 192) = v16;
  *(void *)(v11 + 200) = v15;
  if (v17) {
    nitro::nitro_function::nitro_function(v17);
  }
  v19 = self->weights_f16_blob.__ptr_;
  objc_super v18 = self->weights_f16_blob.__cntrl_;
  if (v18) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v18 + 1, 1uLL, memory_order_relaxed);
  }
  v20 = *(std::__shared_weak_count **)(v11 + 216);
  *(void *)(v11 + 208) = v19;
  *(void *)(v11 + 216) = v18;
  if (v20) {
    nitro::nitro_function::nitro_function(v20);
  }
  v22 = self->biases_blob.__ptr_;
  v21 = self->biases_blob.__cntrl_;
  if (v21) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v21 + 1, 1uLL, memory_order_relaxed);
  }
  v23 = *(std::__shared_weak_count **)(v11 + 232);
  *(void *)(v11 + 224) = v22;
  *(void *)(v11 + 232) = v21;
  if (v23) {
    nitro::nitro_function::nitro_function(v23);
  }
  v25 = self->quantization_ranges.__ptr_;
  v24 = self->quantization_ranges.__cntrl_;
  if (v24) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v24 + 1, 1uLL, memory_order_relaxed);
  }
  v26 = *(std::__shared_weak_count **)(v11 + 248);
  *(void *)(v11 + 240) = v25;
  *(void *)(v11 + 248) = v24;
  if (v26) {
    nitro::nitro_function::nitro_function(v26);
  }
  v28 = self->quantization_lut.__ptr_;
  v27 = self->quantization_lut.__cntrl_;
  if (v27) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v27 + 1, 1uLL, memory_order_relaxed);
  }
  v29 = *(std::__shared_weak_count **)(v11 + 264);
  *(void *)(v11 + 256) = v28;
  *(void *)(v11 + 264) = v27;
  if (v29) {
    nitro::nitro_function::nitro_function(v29);
  }
  v31 = self->scale_factor_batch_norm.__ptr_;
  v30 = self->scale_factor_batch_norm.__cntrl_;
  if (v30) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v30 + 1, 1uLL, memory_order_relaxed);
  }
  v32 = *(std::__shared_weak_count **)(v11 + 280);
  *(void *)(v11 + 272) = v31;
  *(void *)(v11 + 280) = v30;
  if (v32) {
    nitro::nitro_function::nitro_function(v32);
  }
  *(_DWORD *)(v11 + 288) = self->data_type;
  return (id)v11;
}

- (id)label
{
  return @"Conv";
}

- (BOOL)ready
{
  unsigned int data_type = self->data_type;
  if (data_type == 268435488)
  {
    if (!self->biases_blob.__ptr_) {
      return 0;
    }
    uint64_t v4 = 192;
    return *(Class *)((char *)&self->super.isa + v4) != 0;
  }
  if (data_type == 268435472)
  {
    if (!self->biases_blob.__ptr_) {
      return 0;
    }
    uint64_t v4 = 208;
    return *(Class *)((char *)&self->super.isa + v4) != 0;
  }
  if (data_type == 8 && self->biases_blob.__ptr_ && self->quantized_weights_blob.__ptr_)
  {
    if (self->quantization_ranges.__ptr_) {
      return 1;
    }
    uint64_t v4 = 256;
    return *(Class *)((char *)&self->super.isa + v4) != 0;
  }
  return 0;
}

- (float)lookupTableForUInt8Kernel
{
  ptr = self->quantization_lut.__ptr_;
  if (ptr) {
    return (float *)*((void *)ptr + 2);
  }
  else {
    return 0;
  }
}

- (uint64_t)rangesForUInt8Kernel
{
  return *(void *)(*(void *)(a1 + 240) + 16);
}

- (void)purge
{
  cntrl = self->quantization_ranges.__cntrl_;
  self->quantization_ranges.__ptr_ = 0;
  self->quantization_ranges.__cntrl_ = 0;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->scale_factor_batch_norm.__cntrl_;
  self->scale_factor_batch_norm.__ptr_ = 0;
  self->scale_factor_batch_norm.__cntrl_ = 0;
  if (v4) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  }
  long long v5 = self->quantization_lut.__cntrl_;
  self->quantization_lut.__ptr_ = 0;
  self->quantization_lut.__cntrl_ = 0;
  if (v5) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v5);
  }
  long long v6 = self->quantized_weights_blob.__cntrl_;
  self->quantized_weights_blob.__ptr_ = 0;
  self->quantized_weights_blob.__cntrl_ = 0;
  if (v6) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v6);
  }
  long long v7 = self->weights_blob.__cntrl_;
  self->weights_blob.__ptr_ = 0;
  self->weights_blob.__cntrl_ = 0;
  if (v7) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v7);
  }
  long long v8 = self->biases_blob.__cntrl_;
  self->biases_blob.__ptr_ = 0;
  self->biases_blob.__cntrl_ = 0;
  if (v8) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v8);
  }
  long long v9 = self->weights_f16_blob.__cntrl_;
  self->weights_f16_blob.__ptr_ = 0;
  self->weights_f16_blob.__cntrl_ = 0;
  if (v9)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v9);
  }
}

- (float)biasTerms
{
  return (float *)*((void *)self->biases_blob.__ptr_ + 2);
}

- (void)weights
{
  ptr = self->quantized_weights_blob.__ptr_;
  if (!ptr)
  {
    ptr = self->weights_blob.__ptr_;
    if (!ptr)
    {
      ptr = self->weights_f16_blob.__ptr_;
      if (!ptr)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Null weights found");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
    }
  }
  return (void *)*((void *)ptr + 3);
}

- (BOOL)load
{
  return 1;
}

- (id)descriptor
{
  uint64_t Nx = self->params.Nx;
  uint64_t Ny = self->params.Ny;
  int K = self->params.K;
  if (self->params.n_groups != K || K < 2)
  {
    long long v7 = [MEMORY[0x1E4F353F0] cnnConvolutionDescriptorWithKernelWidth:Nx kernelHeight:Ny inputFeatureChannels:K outputFeatureChannels:self->params.C];
    uint64_t v10 = v7;
    int n_groups = self->params.n_groups;
    if (n_groups <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = n_groups;
    }
    [v7 setGroups:v9];
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F35428], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", Nx, Ny);
    [v10 setGroups:1];
  }
  if (self->params.fused_relu)
  {
    double v11 = 0.0;
    uint64_t v13 = 1;
  }
  else
  {
    if (self->params.fused_tanh) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 0;
    }
    LODWORD(v11) = 1.0;
    HIDWORD(v12) = 0;
    if (!self->params.fused_tanh) {
      *(float *)&double v11 = 0.0;
    }
  }
  int fused_activation_mode = self->params.fused_activation_mode;
  LODWORD(v12) = LODWORD(v11);
  if (fused_activation_mode != -1)
  {
    if (fused_activation_mode != 24) {
      Espresso::throw_exception_selector<Espresso::not_implemented_error>("Only ACTIVATION_LEAKY_RELU_CLAMPED is accessible as a fused neuron for MPSCNNConvolution.");
    }
    *(float *)&double v11 = self->params.fused_activation_alpha;
    *(float *)&double v12 = self->params.fused_activation_beta;
    uint64_t v13 = 11;
  }
  [v10 setNeuronType:v13 parameterA:v11 parameterB:v12];
  if (self->params.dilation_x > 1 || self->params.dilation_y >= 2)
  {
    objc_msgSend(v10, "setDilationRateX:");
    [v10 setDilationRateY:self->params.dilation_y];
  }
  int stride_x = self->params.stride_x;
  if (stride_x <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = stride_x;
  }
  [v10 setStrideInPixelsX:v16];
  int stride_y = self->params.stride_y;
  if (stride_y <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = stride_y;
  }
  [v10 setStrideInPixelsY:v18];

  return v10;
}

- (unsigned)dataType
{
  return self->data_type;
}

@end