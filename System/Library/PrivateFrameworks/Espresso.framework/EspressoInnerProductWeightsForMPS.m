@interface EspressoInnerProductWeightsForMPS
- (BOOL)load;
- (BOOL)ready;
- (EspressoInnerProductWeightsForMPS)initWithParams:(inner_product_uniforms *)a3;
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

@implementation EspressoInnerProductWeightsForMPS

- (EspressoInnerProductWeightsForMPS)initWithParams:(inner_product_uniforms *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)EspressoInnerProductWeightsForMPS;
  v4 = [(EspressoInnerProductWeightsForMPS *)&v15 init];
  v5 = (EspressoInnerProductWeightsForMPS *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = *(_OWORD *)&a3->nC;
    long long v6 = *(_OWORD *)&a3->has_tanh;
    long long v7 = *(_OWORD *)&a3->is_lookup;
    long long v8 = *(_OWORD *)&a3->use_raw_buffers;
    *(_OWORD *)(v4 + 72) = *(_OWORD *)&a3->m;
    *(_OWORD *)(v4 + 56) = v8;
    *(_OWORD *)(v4 + 40) = v7;
    *(_OWORD *)(v4 + 24) = v6;
    long long v9 = *(_OWORD *)&a3->Bbytes;
    long long v10 = *(_OWORD *)&a3->n8_splitk;
    long long v11 = *(_OWORD *)&a3->sparse_block_size_y;
    *((_DWORD *)v4 + 34) = a3->disable_bnns_client_ptr;
    *(_OWORD *)(v4 + 120) = v11;
    *(_OWORD *)(v4 + 104) = v10;
    *(_OWORD *)(v4 + 88) = v9;
    *((_DWORD *)v4 + 60) = 268435488;
    v12 = (std::__shared_weak_count *)*((void *)v4 + 27);
    v5->quantization_ranges.__ptr_ = 0;
    v5->quantization_ranges.__cntrl_ = 0;
    if (v12) {
      nitro::nitro_function::nitro_function(v12);
    }
    cntrl = (std::__shared_weak_count *)v5->quantization_lut.__cntrl_;
    v5->quantization_lut.__ptr_ = 0;
    v5->quantization_lut.__cntrl_ = 0;
    if (cntrl) {
      nitro::nitro_function::nitro_function(cntrl);
    }
  }
  return v5;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 48) = 0;
  *((_DWORD *)self + 15) = -1;
  __asm { FMOV            V0.2S, #1.0 }
  *((void *)self + 8) = _D0;
  *(void *)((char *)self + 132) = 0;
  *(_OWORD *)((char *)self + 8) = xmmword_192DCA240;
  *((_DWORD *)self + 6) = 0;
  *(void *)((char *)self + 28) = _D0;
  *(void *)((char *)self + 92) = 0;
  *(void *)((char *)self + 36) = 0;
  *(void *)((char *)self + 52) = 0;
  *((_DWORD *)self + 11) = 0;
  *(void *)((char *)self + 108) = 0;
  *(void *)((char *)self + 124) = 0;
  *(void *)((char *)self + 116) = 0;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->quantization_lut.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v4 = self->quantization_ranges.__cntrl_;
  if (v4) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  }
  v5 = self->biases_blob.__cntrl_;
  if (v5) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v5);
  }
  long long v6 = self->quantized_weights_blob.__cntrl_;
  if (v6) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v6);
  }
  long long v7 = self->weights_f16_blob.__cntrl_;
  if (v7) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v7);
  }
  long long v8 = self->weights_blob.__cntrl_;
  if (v8)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [EspressoInnerProductWeightsForMPS alloc];
  long long v5 = *(_OWORD *)&self->params.Bbytes;
  long long v6 = *(_OWORD *)&self->params.sparse_block_size_y;
  v30[6] = *(_OWORD *)&self->params.n8_splitk;
  v30[7] = v6;
  int disable_bnns_client_ptr = self->params.disable_bnns_client_ptr;
  long long v7 = *(_OWORD *)&self->params.has_tanh;
  long long v8 = *(_OWORD *)&self->params.use_raw_buffers;
  v30[2] = *(_OWORD *)&self->params.is_lookup;
  v30[3] = v8;
  v30[4] = *(_OWORD *)&self->params.m;
  v30[5] = v5;
  v30[0] = *(_OWORD *)&self->params.nC;
  v30[1] = v7;
  uint64_t v9 = [(EspressoInnerProductWeightsForMPS *)v4 initWithParams:v30];
  uint64_t v10 = v9;
  ptr = self->weights_blob.__ptr_;
  cntrl = self->weights_blob.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v13 = *(std::__shared_weak_count **)(v9 + 152);
  *(void *)(v10 + 144) = ptr;
  *(void *)(v10 + 152) = cntrl;
  if (v13) {
    nitro::nitro_function::nitro_function(v13);
  }
  objc_super v15 = self->weights_f16_blob.__ptr_;
  v14 = self->weights_f16_blob.__cntrl_;
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v14 + 1, 1uLL, memory_order_relaxed);
  }
  v16 = *(std::__shared_weak_count **)(v10 + 168);
  *(void *)(v10 + 160) = v15;
  *(void *)(v10 + 168) = v14;
  if (v16) {
    nitro::nitro_function::nitro_function(v16);
  }
  v18 = self->quantized_weights_blob.__ptr_;
  v17 = self->quantized_weights_blob.__cntrl_;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v17 + 1, 1uLL, memory_order_relaxed);
  }
  v19 = *(std::__shared_weak_count **)(v10 + 184);
  *(void *)(v10 + 176) = v18;
  *(void *)(v10 + 184) = v17;
  if (v19) {
    nitro::nitro_function::nitro_function(v19);
  }
  v21 = self->biases_blob.__ptr_;
  v20 = self->biases_blob.__cntrl_;
  if (v20) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v20 + 1, 1uLL, memory_order_relaxed);
  }
  v22 = *(std::__shared_weak_count **)(v10 + 200);
  *(void *)(v10 + 192) = v21;
  *(void *)(v10 + 200) = v20;
  if (v22) {
    nitro::nitro_function::nitro_function(v22);
  }
  v24 = self->quantization_ranges.__ptr_;
  v23 = self->quantization_ranges.__cntrl_;
  if (v23) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
  }
  v25 = *(std::__shared_weak_count **)(v10 + 216);
  *(void *)(v10 + 208) = v24;
  *(void *)(v10 + 216) = v23;
  if (v25) {
    nitro::nitro_function::nitro_function(v25);
  }
  v27 = self->quantization_lut.__ptr_;
  v26 = self->quantization_lut.__cntrl_;
  if (v26) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v26 + 1, 1uLL, memory_order_relaxed);
  }
  v28 = *(std::__shared_weak_count **)(v10 + 232);
  *(void *)(v10 + 224) = v27;
  *(void *)(v10 + 232) = v26;
  if (v28) {
    nitro::nitro_function::nitro_function(v28);
  }
  *(_DWORD *)(v10 + 240) = self->data_type;
  return (id)v10;
}

- (BOOL)ready
{
  unsigned int data_type = self->data_type;
  if (data_type == 8)
  {
    if (self->biases_blob.__ptr_ && self->quantized_weights_blob.__ptr_)
    {
      if (self->quantization_ranges.__ptr_) {
        return 1;
      }
      uint64_t v3 = 224;
      return *(Class *)((char *)&self->super.isa + v3) != 0;
    }
    return 0;
  }
  if (data_type == 268435472)
  {
    if (self->biases_blob.__ptr_)
    {
      uint64_t v3 = 160;
      return *(Class *)((char *)&self->super.isa + v3) != 0;
    }
    return 0;
  }
  if (data_type != 268435488 || !self->biases_blob.__ptr_) {
    return 0;
  }
  uint64_t v3 = 144;
  return *(Class *)((char *)&self->super.isa + v3) != 0;
}

- (void)purge
{
  cntrl = self->weights_blob.__cntrl_;
  self->weights_blob.__ptr_ = 0;
  self->weights_blob.__cntrl_ = 0;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v4 = self->weights_f16_blob.__cntrl_;
  self->weights_f16_blob.__ptr_ = 0;
  self->weights_f16_blob.__cntrl_ = 0;
  if (v4) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  }
  long long v5 = self->biases_blob.__cntrl_;
  self->biases_blob.__ptr_ = 0;
  self->biases_blob.__cntrl_ = 0;
  if (v5) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v5);
  }
  long long v6 = self->quantization_ranges.__cntrl_;
  self->quantization_ranges.__ptr_ = 0;
  self->quantization_ranges.__cntrl_ = 0;
  if (v6) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v6);
  }
  long long v7 = self->quantization_lut.__cntrl_;
  self->quantization_lut.__ptr_ = 0;
  self->quantization_lut.__cntrl_ = 0;
  if (v7) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v7);
  }
  long long v8 = self->quantized_weights_blob.__cntrl_;
  self->quantized_weights_blob.__ptr_ = 0;
  self->quantized_weights_blob.__cntrl_ = 0;
  if (v8)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v8);
  }
}

- (float)biasTerms
{
  return (float *)*((void *)self->biases_blob.__ptr_ + 2);
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
  return *(void *)(*(void *)(a1 + 208) + 16);
}

- (void)weights
{
  ptr = self->weights_blob.__ptr_;
  if (!ptr)
  {
    ptr = self->weights_f16_blob.__ptr_;
    if (!ptr)
    {
      ptr = self->quantized_weights_blob.__ptr_;
      if (!ptr)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Null weights found");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
    }
  }
  return (void *)*((void *)ptr + 2);
}

- (BOOL)load
{
  return 1;
}

- (id)descriptor
{
  uint64_t v3 = 1;
  v4 = [MEMORY[0x1E4F353F0] cnnConvolutionDescriptorWithKernelWidth:1 kernelHeight:1 inputFeatureChannels:self->params.nB outputFeatureChannels:self->params.nC];
  long long v6 = v4;
  double v7 = 0.0;
  if (self->params.has_relu) {
    goto LABEL_2;
  }
  if (!self->params.has_tanh)
  {
    uint64_t v3 = 0;
LABEL_2:
    double v5 = 0.0;
    goto LABEL_5;
  }
  *(float *)&double v5 = self->params.tanh_alpha;
  *(float *)&double v7 = self->params.tanh_beta;
  uint64_t v3 = 5;
LABEL_5:
  [v4 setNeuronType:v3 parameterA:v5 parameterB:v7];

  return v6;
}

- (unsigned)dataType
{
  return self->data_type;
}

- (id)label
{
  return @"FC";
}

@end