@interface VCPCNNModelEspresso
- ($FD4688982923A924290ECB669CAF1EC2)inputBlob;
- ($FD4688982923A924290ECB669CAF1EC2)outputBlob;
- (NSString)resConfig;
- (VCPCNNModelEspresso)initWithParameters:(id)a3 inputNames:(id)a4 outputNames:(id)a5 properties:(id)a6;
- (id).cxx_construct;
- (int)espressoForward:(float *)a3;
- (int)espressoForwardInputs:(vector<float *);
- (int)getPlanPhase;
- (int)prepareModelInput:(float *)a3;
- (int)prepareModelInputs:(vector<float *);
- (int)prepareModelWithConfig:(id)a3;
- (int)softmax;
- (vector<espresso_buffer_t,)inputBlobs;
- (vector<espresso_buffer_t,)outputBlobs;
- (void)dealloc;
- (void)getEspressoContext;
- (void)normalization:(float *)a3;
- (void)setInputBlob:(id *)a3;
- (void)setInputBlobs:()vector<espresso_buffer_t;
- (void)setOutputBlob:(id *)a3;
- (void)setOutputBlobs:()vector<espresso_buffer_t;
@end

@implementation VCPCNNModelEspresso

- (VCPCNNModelEspresso)initWithParameters:(id)a3 inputNames:(id)a4 outputNames:(id)a5 properties:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v44 = a4;
  id v45 = a5;
  id v11 = a6;
  v47.receiver = self;
  v47.super_class = (Class)VCPCNNModelEspresso;
  v12 = [(VCPCNNModelEspresso *)&v47 init];
  v13 = v12;
  if (v12)
  {
    p_netFileUrl = &v12->_netFileUrl;
    objc_storeStrong((id *)&v12->_netFileUrl, a3);
    objc_storeStrong((id *)&v13->_inputNames, a4);
    objc_storeStrong((id *)&v13->_outputNames, a5);
    resConfig = v13->_resConfig;
    v13->_resConfig = (NSString *)&stru_1F15A0D70;

    v15 = [v11 objectForKeyedSubscript:@"forceCPU"];
    v16 = v15;
    if (v15) {
      uint64_t v17 = [v15 BOOLValue];
    }
    else {
      uint64_t v17 = 0;
    }
    v19 = objc_msgSend(v11, "objectForKeyedSubscript:", @"forceNNGraph", p_netFileUrl, v44, v45);

    v20 = v19;
    if (v19) {
      uint64_t v21 = [v19 BOOLValue];
    }
    else {
      uint64_t v21 = 0;
    }
    v22 = [v11 objectForKeyedSubscript:@"sharedContext"];

    v23 = v22;
    if (v22) {
      uint64_t v24 = [v22 BOOLValue];
    }
    else {
      uint64_t v24 = 1;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = [v46 absoluteString];
        v27 = (void *)v26;
        v28 = @"shared ";
        if (!v24) {
          v28 = &stru_1F15A0D70;
        }
        *(_DWORD *)buf = 138412546;
        v49 = v28;
        __int16 v50 = 2112;
        *(void *)v51 = v26;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[CNNModelEspresso] Creating %@context for %@", buf, 0x16u);
      }
    }
    v29 = [[VCPCNNEspressoContext alloc] initWithForceCPU:v17 forceNNGraph:v21 shared:v24];
    context = v13->_context;
    v13->_context = v29;

    v31 = v13->_context;
    if (!v31) {
      goto LABEL_31;
    }
    [(VCPCNNEspressoContext *)v31 espressoContext];
    int default_storage_type = espresso_get_default_storage_type();
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v33 = VCPLogInstance();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v34 = "";
        *(_DWORD *)buf = 136315906;
        if (v24) {
          v34 = "shared ";
        }
        v49 = (void *)v34;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v17;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v21;
        __int16 v52 = 1024;
        int v53 = default_storage_type;
        _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEBUG, "[CNNModelEspresso] Created %scontext (CPU:%d, MPSGraph:%d)), storage type %d", buf, 0x1Eu);
      }
    }
    [(VCPCNNEspressoContext *)v13->_context espressoContext];
    v13->_plan = (void *)espresso_create_plan();
    v35 = [v11 objectForKeyedSubscript:@"planPriority"];
    BOOL v36 = v35 == 0;

    if (!v36)
    {
      v37 = [v11 objectForKeyedSubscript:@"planPriority"];
      [v37 intValue];

      espresso_plan_set_priority();
    }
    if (v13->_plan)
    {
      id v38 = [*v43 path];
      [v38 UTF8String];
      int v39 = espresso_plan_add_network();

      if (v39) {
        v18 = 0;
      }
      else {
        v18 = v13;
      }
    }
    else
    {
LABEL_31:
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  v40 = v18;

  return v40;
}

- (int)prepareModelWithConfig:(id)a3
{
  id v4 = a3;
  int v5 = [(NSArray *)self->_inputNames count];
  int v6 = [(NSArray *)self->_outputNames count];
  if ([(VCPCNNModelEspresso *)self getPlanPhase] == 2)
  {
    int v7 = -18;
    goto LABEL_16;
  }
  if ([(VCPCNNModelEspresso *)self getPlanPhase] == 1
    && [(NSString *)self->_resConfig isEqualToString:v4])
  {
LABEL_5:
    int v7 = 0;
    goto LABEL_16;
  }
  if ([(VCPCNNModelEspresso *)self getPlanPhase] || (int v7 = espresso_plan_build()) == 0)
  {
    if (![(NSString *)self->_resConfig isEqualToString:v4])
    {
      int v7 = espresso_plan_build_clean();
      if (v7) {
        goto LABEL_16;
      }
      id v8 = v4;
      [v8 UTF8String];
      int v7 = espresso_network_select_configuration();
      if (v7) {
        goto LABEL_16;
      }
      int v7 = espresso_plan_build();
      if (v7) {
        goto LABEL_16;
      }
      objc_storeStrong((id *)&self->_resConfig, v8);
    }
    if (v5 > 1)
    {
      std::vector<espresso_buffer_t>::resize((uint64_t)&self->_inputBlobs, v5);
      uint64_t v10 = 0;
      while (1)
      {
        id v11 = [(NSArray *)self->_inputNames objectAtIndexedSubscript:v10];
        [v11 UTF8String];
        int v7 = espresso_network_bind_buffer();

        if (v7) {
          break;
        }
        if (++v10 == v5) {
          goto LABEL_20;
        }
      }
    }
    else
    {
      int v7 = espresso_network_bind_buffer();
      if (v7) {
        goto LABEL_16;
      }
LABEL_20:
      if (v6 <= 1)
      {
        if (v6 == 1)
        {
          id v12 = [(NSArray *)self->_outputNames objectAtIndexedSubscript:0];
          [v12 UTF8String];
          int v7 = espresso_network_bind_buffer();

          if (v7) {
            goto LABEL_16;
          }
        }
        else
        {
          int v7 = espresso_network_bind_buffer();
          if (v7) {
            goto LABEL_16;
          }
        }
        goto LABEL_5;
      }
      std::vector<espresso_buffer_t>::resize((uint64_t)&self->_outputBlobs, v6);
      uint64_t v13 = 0;
      while (1)
      {
        id v14 = [(NSArray *)self->_outputNames objectAtIndexedSubscript:v13];
        [v14 UTF8String];
        int v7 = espresso_network_bind_buffer();

        if (v7) {
          break;
        }
        if (++v13 == v6) {
          goto LABEL_5;
        }
      }
    }
  }
LABEL_16:

  return v7;
}

- (int)prepareModelInput:(float *)a3
{
  if (!a3) {
    return -18;
  }
  memcpy(self->_inputBlob.data, a3, SLODWORD(self->_inputBlob.batch_number)* (uint64_t)SLODWORD(self->_inputBlob.sequence_length)* 4* (int)self->_inputBlob.channels* LODWORD(self->_inputBlob.height)* LODWORD(self->_inputBlob.width));
  return 0;
}

- (int)prepareModelInputs:(vector<float *)
{
  NSUInteger v5 = [(NSArray *)self->_inputNames count];
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = a3->__begin_[v7];
      if (!v8) {
        break;
      }
      v9 = (int64x2_t *)((char *)self->_inputBlobs.__begin_ + v6);
      int64x2_t v10 = vshlq_s64(vshlq_n_s64(v9[6], 0x20uLL), (int64x2_t)xmmword_1BC2812A0);
      memcpy((void *)v9->i64[0], v8, v10.i64[1] * v9[7].i32[0] * v10.i64[0] * v9[5].i32[0] * v9[5].i32[2]);
      ++v7;
      v6 += 168;
      if ([(NSArray *)self->_inputNames count] <= v7)
      {
        LODWORD(v5) = 0;
        return v5;
      }
    }
    LODWORD(v5) = -18;
  }
  return v5;
}

- (int)espressoForward:(float *)a3
{
  int result = [(VCPCNNModelEspresso *)self prepareModelInput:a3];
  if (!result)
  {
    return espresso_plan_execute_sync();
  }
  return result;
}

- (int)espressoForwardInputs:(vector<float *)
{
  __p = 0;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&__p, a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  int v4 = [(VCPCNNModelEspresso *)self prepareModelInputs:&__p];
  if (__p)
  {
    unint64_t v7 = __p;
    operator delete(__p);
  }
  if (!v4) {
    return espresso_plan_execute_sync();
  }
  return v4;
}

- (void)normalization:(float *)a3
{
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  NSUInteger v5 = [NSNumber numberWithUnsignedLong:self->_inputBlob.channels];
  [v19 addObject:v5];

  uint64_t v6 = [NSNumber numberWithUnsignedLong:self->_inputBlob.height];
  [v19 addObject:v6];

  unint64_t v7 = [NSNumber numberWithUnsignedLong:self->_inputBlob.width];
  [v19 addObject:v7];

  unint64_t v8 = 0;
  int v9 = 1;
  while ([v19 count] > v8)
  {
    int64x2_t v10 = [v19 objectAtIndexedSubscript:v8];
    v9 *= [v10 intValue];

    ++v8;
  }
  uint64_t v11 = v9;
  if (v9 < 1)
  {
    float v15 = 0.0;
    float v12 = 0.0;
  }
  else
  {
    float v12 = 0.0;
    uint64_t v13 = v9;
    id v14 = a3;
    float v15 = 0.0;
    do
    {
      float v16 = *v14++;
      float v15 = v15 + v16;
      float v12 = v12 + (float)(v16 * v16);
      --v13;
    }
    while (v13);
  }
  if (v9 >= 1)
  {
    float v17 = v15 / (float)v9;
    float v18 = fmaxf(sqrtf((float)(v12 / (float)v9) - (float)(v17 * v17)), 0.00000011921);
    do
    {
      *a3 = (float)(*a3 - v17) / v18;
      ++a3;
      --v11;
    }
    while (v11);
  }
}

- (int)softmax
{
  if (self->_outputBlob.width * self->_outputBlob.height != 1) {
    return -18;
  }
  uint64_t channels_low = LODWORD(self->_outputBlob.channels);
  if ((int)channels_low >= 1)
  {
    data = (float *)self->_outputBlob.data;
    float v4 = -1.0e10;
    uint64_t v5 = LODWORD(self->_outputBlob.channels);
    uint64_t v6 = data;
    do
    {
      float v7 = *v6++;
      float v8 = v7;
      if (v7 > v4) {
        float v4 = v8;
      }
      --v5;
    }
    while (v5);
    float v9 = 0.0;
    uint64_t v10 = LODWORD(self->_outputBlob.channels);
    uint64_t v11 = (float *)self->_outputBlob.data;
    do
    {
      float v12 = expf(*v11 - v4);
      *v11++ = v12;
      float v9 = v9 + v12;
      --v10;
    }
    while (v10);
    do
    {
      float *data = *data / v9;
      ++data;
      --channels_low;
    }
    while (channels_low);
  }
  return 0;
}

- (void)getEspressoContext
{
  return [(VCPCNNEspressoContext *)self->_context espressoContext];
}

- (int)getPlanPhase
{
  return MEMORY[0x1F4118848](self->_plan, a2);
}

- (void)dealloc
{
  if (self->_plan) {
    espresso_plan_destroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPCNNModelEspresso;
  [(VCPCNNModelEspresso *)&v3 dealloc];
}

- (vector<espresso_buffer_t,)inputBlobs
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<espresso_buffer_t, std::allocator<espresso_buffer_t>> *)std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(retstr, self->_inputBlobs.__begin_, (uint64_t)self->_inputBlobs.__end_, 0xCF3CF3CF3CF3CF3DLL* ((self->_inputBlobs.__end_- self->_inputBlobs.__begin_) >> 3));
}

- (void)setInputBlobs:()vector<espresso_buffer_t
{
  p_inputBlobs = (char *)&self->_inputBlobs;
  if (p_inputBlobs != (char *)a3) {
    std::vector<espresso_buffer_t>::__assign_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(p_inputBlobs, (char *)a3->__begin_, (uint64_t)a3->__end_, 0xCF3CF3CF3CF3CF3DLL * ((a3->__end_ - a3->__begin_) >> 3));
  }
}

- (vector<espresso_buffer_t,)outputBlobs
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<espresso_buffer_t, std::allocator<espresso_buffer_t>> *)std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(retstr, self->_outputBlobs.__begin_, (uint64_t)self->_outputBlobs.__end_, 0xCF3CF3CF3CF3CF3DLL* ((self->_outputBlobs.__end_- self->_outputBlobs.__begin_) >> 3));
}

- (void)setOutputBlobs:()vector<espresso_buffer_t
{
  p_outputBlobs = (char *)&self->_outputBlobs;
  if (p_outputBlobs != (char *)a3) {
    std::vector<espresso_buffer_t>::__assign_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(p_outputBlobs, (char *)a3->__begin_, (uint64_t)a3->__end_, 0xCF3CF3CF3CF3CF3DLL * ((a3->__end_ - a3->__begin_) >> 3));
  }
}

- ($FD4688982923A924290ECB669CAF1EC2)inputBlob
{
  long long v3 = *(_OWORD *)&self[1].var3[2];
  long long v4 = *(_OWORD *)&self[1].var4;
  *(void *)&retstr->var14 = self[1].var8;
  long long v5 = *(_OWORD *)&self[1].var0;
  long long v6 = *(_OWORD *)&self[1].var2[2];
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)self[1].var2;
  *(_OWORD *)&retstr->var4 = v6;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)self[1].var3;
  *(_OWORD *)&retstr->var8 = v3;
  long long v7 = *(_OWORD *)&self->var11;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var9;
  *(_OWORD *)retstr->var2 = v7;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self->var13;
  *(_OWORD *)retstr->var3 = v5;
  long long v8 = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr->var10 = v4;
  *(_OWORD *)&retstr->var12 = v8;
  return self;
}

- (void)setInputBlob:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->_inputBlob.dim[2] = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->_inputBlob.dim = v4;
  *(_OWORD *)&self->_inputBlob.data = v3;
  long long v5 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  long long v7 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_inputBlob.channels = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_inputBlob.width = v7;
  *(_OWORD *)&self->_inputBlob.stride[2] = v6;
  *(_OWORD *)self->_inputBlob.stride = v5;
  long long v8 = *(_OWORD *)&a3->var8;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v10 = *(_OWORD *)&a3->var12;
  *(void *)&self->_inputBlob.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_inputBlob.stride_batch_number = v10;
  *(_OWORD *)&self->_inputBlob.stride_height = v9;
  *(_OWORD *)&self->_inputBlob.sequence_length = v8;
}

- ($FD4688982923A924290ECB669CAF1EC2)outputBlob
{
  long long v3 = *(_OWORD *)&self[2].var6;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[2].var8;
  long long v4 = *(_OWORD *)&self[2].var2[2];
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)self[2].var2;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[2].var3[2];
  *(_OWORD *)&retstr->var6 = *(_OWORD *)self[2].var3;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)&self[1].var11;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var9;
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[1].var13;
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setOutputBlob:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->_outputBlob.dim = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->_outputBlob.dim[2] = v4;
  *(_OWORD *)&self->_outputBlob.data = v3;
  long long v5 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  long long v7 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_outputBlob.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_outputBlob.channels = v7;
  *(_OWORD *)self->_outputBlob.stride = v5;
  *(_OWORD *)&self->_outputBlob.stride[2] = v6;
  long long v8 = *(_OWORD *)&a3->var8;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v10 = *(_OWORD *)&a3->var12;
  *(void *)&self->_outputBlob.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_outputBlob.stride_height = v9;
  *(_OWORD *)&self->_outputBlob.stride_batch_number = v10;
  *(_OWORD *)&self->_outputBlob.sequence_length = v8;
}

- (NSString)resConfig
{
  return self->_resConfig;
}

- (void).cxx_destruct
{
  begin = self->_outputBlobs.__begin_;
  if (begin)
  {
    self->_outputBlobs.__end_ = begin;
    operator delete(begin);
  }
  long long v4 = self->_inputBlobs.__begin_;
  if (v4)
  {
    self->_inputBlobs.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_netFileUrl, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

@end