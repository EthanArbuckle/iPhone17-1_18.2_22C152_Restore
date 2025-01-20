@interface LTMStatsCompute
- (LTMStatsCompute)initWithMetalContext:(id)a3;
- (float)calcExposureRatio:(const sRefDriverInputs *)a3;
- (int)allocateResources;
- (int)computeInputParametersForImageWidth:(id)a3 calcGlobalHistOnROI:(BOOL)a4 enableAntiAliasing:(BOOL)a5 with:(sRefDriverInputs *)a6 to:(id *)a7;
- (int)createShaders:(id)a3;
- (int)encodeLTMStatisticsCalculationOptimized:(id)a3 params:(id *)a4 globalHistogram:(id)a5 localHistogram:(id)a6 thumbnail:(id)a7;
- (int)encodeLTMStatisticsCalculationPrecise:(id)a3 paramsGlobalHist:(id *)a4 globalHistogram:(id)a5 localHistogram:(id)a6 thumbnail:(id)a7;
- (int)prewarmShaders;
- (int)purgeResources;
- (int)waitUntilCompleted;
@end

@implementation LTMStatsCompute

- (LTMStatsCompute)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LTMStatsCompute;
  v6 = [(LTMStatsCompute *)&v10 init];
  v7 = (int64x2_t *)v6;
  if (!v6)
  {
    FigSignalErrorAt();
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  if ([(int64x2_t *)v7 createShaders:v7->i64[1]])
  {
LABEL_6:
    v8 = 0;
    goto LABEL_4;
  }
  v7[4] = vdupq_n_s64(0x10uLL);
  v7[5].i64[0] = 1;
  v8 = v7;
LABEL_4:

  return v8;
}

- (int)createShaders:(id)a3
{
  id v4 = a3;
  id v5 = [v4 computePipelineStateFor:@"SoftLTM::localHistAndThumbKernel" constants:0];
  localHistAndThumKernelPipelineState = self->_localHistAndThumKernelPipelineState;
  self->_localHistAndThumKernelPipelineState = v5;

  if (!self->_localHistAndThumKernelPipelineState) {
    goto LABEL_8;
  }
  v7 = [v4 computePipelineStateFor:@"SoftLTM::globalHistKernel" constants:0];
  globalHistKernelPipelineState = self->_globalHistKernelPipelineState;
  self->_globalHistKernelPipelineState = v7;

  if (!self->_globalHistKernelPipelineState) {
    goto LABEL_8;
  }
  v9 = [v4 computePipelineStateFor:@"SoftLTM::collectLocalHistKernel" constants:0];
  collectLocalHistKernelPipelineState = self->_collectLocalHistKernelPipelineState;
  self->_collectLocalHistKernelPipelineState = v9;

  if (!self->_collectLocalHistKernelPipelineState) {
    goto LABEL_8;
  }
  v11 = [v4 computePipelineStateFor:@"SoftLTM::ltmStatisticsKernel" constants:0];
  calcLTMStatisticsPipelineState = self->_calcLTMStatisticsPipelineState;
  self->_calcLTMStatisticsPipelineState = v11;

  if (!self->_calcLTMStatisticsPipelineState) {
    goto LABEL_8;
  }
  v13 = [v4 computePipelineStateFor:@"SoftLTM::calcLocalHistogramShiftKernel" constants:0];
  calcLocalHistogramShift = self->_calcLocalHistogramShift;
  self->_calcLocalHistogramShift = v13;

  if (self->_calcLocalHistogramShift) {
    int v15 = 0;
  }
  else {
LABEL_8:
  }
    int v15 = FigSignalErrorAt();

  return v15;
}

- (int)encodeLTMStatisticsCalculationOptimized:(id)a3 params:(id *)a4 globalHistogram:(id)a5 localHistogram:(id)a6 thumbnail:(id)a7
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v70 = 0;
  v16 = [(FigMetalContext *)self->_metalContext commandQueue];

  if (!v16) {
    goto LABEL_26;
  }
  if (!v14) {
    goto LABEL_26;
  }
  if (!v13) {
    goto LABEL_26;
  }
  if (!v15) {
    goto LABEL_26;
  }
  v17 = [(FigMetalContext *)self->_metalContext device];
  v18 = (void *)[v17 newBufferWithLength:240448 options:0];
  id v70 = v18;

  if (!v18) {
    goto LABEL_26;
  }
  v19 = [(FigMetalContext *)self->_metalContext commandQueue];
  v20 = [v19 commandBuffer];
  cmdBuf = self->_cmdBuf;
  self->_cmdBuf = v20;

  v22 = self->_cmdBuf;
  if (!v22) {
    goto LABEL_26;
  }
  if (*MEMORY[0x263F00E10])
  {
    v23 = [(MTLCommandBuffer *)v22 commandQueue];
    v24 = [v23 commandBuffer];

    [v24 setLabel:@"KTRACE_MTLCMDBUF"];
    [v24 addCompletedHandler:&__block_literal_global_1];
    [v24 commit];
    [(MTLCommandBuffer *)self->_cmdBuf addCompletedHandler:&__block_literal_global_18];

    v22 = self->_cmdBuf;
  }
  v25 = [(MTLCommandBuffer *)v22 blitCommandEncoder];
  if (!v25)
  {
LABEL_26:
    unsigned int v69 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v26 = 0;
LABEL_27:
    v41 = 0;
    int v45 = -1;
    goto LABEL_25;
  }
  v26 = v25;
  objc_msgSend(v25, "fillBuffer:range:value:", v18, 0, objc_msgSend(v18, "length"), 0);
  objc_msgSend(v26, "fillBuffer:range:value:", v14, 0, objc_msgSend(v14, "length"), 0);
  objc_msgSend(v26, "fillBuffer:range:value:", v13, 0, objc_msgSend(v13, "length"), 0);
  objc_msgSend(v26, "fillBuffer:range:value:", v15, 0, objc_msgSend(v15, "length"), 0);
  [v26 endEncoding];
  v27 = [(MTLCommandBuffer *)self->_cmdBuf computeCommandEncoder];
  if (!v27)
  {
    unsigned int v69 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_27;
  }
  v28 = v27;
  id v57 = v14;
  id v58 = v13;
  [v27 setComputePipelineState:self->_localHistAndThumKernelPipelineState];
  unsigned int v29 = [(MTLComputePipelineState *)self->_localHistAndThumKernelPipelineState threadExecutionWidth];
  [v28 setTexture:v12 atIndex:0];
  p_var2 = &a4->var2;
  [v28 setBytes:&a4->var2 length:172 atIndex:0];
  [v28 setBytes:&a4->var3 length:40 atIndex:1];
  [v28 setBytes:a4 length:32 atIndex:2];
  [v28 setBuffer:v18 offset:0 atIndex:3];
  [v28 setBuffer:v15 offset:0 atIndex:4];
  uint64_t v67 = 1;
  uint64_t v64 = v29;
  int64x2_t v65 = vdupq_n_s64(1uLL);
  long long v66 = xmmword_23FF527F0;
  [v28 dispatchThreadgroups:&v66 threadsPerThreadgroup:&v64];
  [v28 endEncoding];
  v31 = [(MTLCommandBuffer *)self->_cmdBuf computeCommandEncoder];

  if (v31)
  {
    [v31 setComputePipelineState:self->_globalHistKernelPipelineState];
    [v31 setTexture:v12 atIndex:0];
    [v31 setBytes:&a4->var1 length:52 atIndex:0];
    [v31 setBytes:a4 length:32 atIndex:1];
    [v31 setBuffer:v58 offset:0 atIndex:2];
    unint64_t v32 = [(MTLComputePipelineState *)self->_globalHistKernelPipelineState threadExecutionWidth];
    uint64_t v33 = [v12 width];
    if (v32 >= [v12 height] * v33)
    {
      uint64_t v35 = [v12 width];
      unint64_t v34 = [v12 height] * v35;
    }
    else
    {
      unint64_t v34 = [(MTLComputePipelineState *)self->_globalHistKernelPipelineState threadExecutionWidth];
    }
    unint64_t v36 = [(MTLComputePipelineState *)self->_globalHistKernelPipelineState maxTotalThreadsPerThreadgroup]/ v34;
    uint64_t v37 = [v12 width];
    if (v36 >= [v12 height] * v37 / v34)
    {
      uint64_t v39 = [v12 width];
      unint64_t v38 = [v12 height] * v39;
    }
    else
    {
      unint64_t v38 = [(MTLComputePipelineState *)self->_globalHistKernelPipelineState maxTotalThreadsPerThreadgroup];
    }
    unint64_t v40 = v38 / v34;
    v63[0] = [v12 width];
    v63[1] = [v12 height];
    v63[2] = 1;
    v62[0] = v34;
    v62[1] = v40;
    v62[2] = 1;
    [v31 dispatchThreads:v63 threadsPerThreadgroup:v62];
    [v31 endEncoding];
    v41 = [(MTLCommandBuffer *)self->_cmdBuf computeCommandEncoder];

    if (v41)
    {
      [v41 setComputePipelineState:self->_collectLocalHistKernelPipelineState];
      [v41 setBuffer:v18 offset:0 atIndex:0];
      [v41 setBytes:p_var2 length:172 atIndex:1];
      id v14 = v57;
      [v41 setBuffer:v57 offset:0 atIndex:2];
      id v13 = v58;
      if ((unint64_t)[(MTLComputePipelineState *)self->_collectLocalHistKernelPipelineState threadExecutionWidth] > 0x2F)unint64_t v42 = 48; {
      else
      }
        unint64_t v42 = [(MTLComputePipelineState *)self->_collectLocalHistKernelPipelineState threadExecutionWidth];
      unint64_t v43 = [(MTLComputePipelineState *)self->_collectLocalHistKernelPipelineState maxTotalThreadsPerThreadgroup];
      unint64_t v44 = 0x30 / v42;
      if (v43 / v42 < 0x30 / v42) {
        unint64_t v44 = [(MTLComputePipelineState *)self->_collectLocalHistKernelPipelineState maxTotalThreadsPerThreadgroup]/ v42;
      }
      long long v60 = xmmword_23FF52800;
      uint64_t v61 = 1;
      v59[0] = v42;
      v59[1] = v44;
      v59[2] = 1;
      [v41 dispatchThreads:&v60 threadsPerThreadgroup:v59];
      int v45 = 0;
    }
    else
    {
      unsigned int v69 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v53 = v69;
      if (os_log_type_enabled(v52, type)) {
        unsigned int v54 = v53;
      }
      else {
        unsigned int v54 = v53 & 0xFFFFFFFE;
      }
      id v13 = v58;
      if (v54)
      {
        int v71 = 136315138;
        v72 = "-[LTMStatsCompute encodeLTMStatisticsCalculationOptimized:params:globalHistogram:localHistogram:thumbnail:]";
        LODWORD(v56) = 12;
        v55 = &v71;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v41 = 0;
      int v45 = -1;
      id v14 = v57;
    }
  }
  else
  {
    unsigned int v69 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v50 = v69;
    if (os_log_type_enabled(v49, type)) {
      unsigned int v51 = v50;
    }
    else {
      unsigned int v51 = v50 & 0xFFFFFFFE;
    }
    if (v51)
    {
      int v71 = 136315138;
      v72 = "-[LTMStatsCompute encodeLTMStatisticsCalculationOptimized:params:globalHistogram:localHistogram:thumbnail:]";
      LODWORD(v56) = 12;
      v55 = &v71;
      _os_log_send_and_compose_impl();
    }
    id v13 = v58;
    id v14 = v57;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v41 = 0;
    int v45 = -1;
  }
LABEL_25:
  objc_msgSend(v41, "endEncoding", v55, v56);
  [(MTLCommandBuffer *)self->_cmdBuf commit];
  FigMetalDecRef();

  return v45;
}

uint64_t __107__LTMStatsCompute_encodeLTMStatisticsCalculationOptimized_params_globalHistogram_localHistogram_thumbnail___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __107__LTMStatsCompute_encodeLTMStatisticsCalculationOptimized_params_globalHistogram_localHistogram_thumbnail___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)encodeLTMStatisticsCalculationPrecise:(id)a3 paramsGlobalHist:(id *)a4 globalHistogram:(id)a5 localHistogram:(id)a6 thumbnail:(id)a7
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(FigMetalContext *)self->_metalContext commandQueue];

  if (!v16) {
    goto LABEL_24;
  }
  if (!v13) {
    goto LABEL_24;
  }
  if (!v14) {
    goto LABEL_24;
  }
  if (!v15) {
    goto LABEL_24;
  }
  v17 = [(FigMetalContext *)self->_metalContext commandQueue];
  v18 = [v17 commandBuffer];
  cmdBuf = self->_cmdBuf;
  self->_cmdBuf = v18;

  v20 = self->_cmdBuf;
  if (!v20) {
    goto LABEL_24;
  }
  if (*MEMORY[0x263F00E10])
  {
    v21 = [(MTLCommandBuffer *)v20 commandQueue];
    v22 = [v21 commandBuffer];

    [v22 setLabel:@"KTRACE_MTLCMDBUF"];
    [v22 addCompletedHandler:&__block_literal_global_20];
    [v22 commit];
    [(MTLCommandBuffer *)self->_cmdBuf addCompletedHandler:&__block_literal_global_22];

    v20 = self->_cmdBuf;
  }
  v23 = [(MTLCommandBuffer *)v20 blitCommandEncoder];
  if (v23)
  {
    v24 = v23;
    objc_msgSend(v23, "fillBuffer:range:value:", v13, 0, objc_msgSend(v13, "length"), 0);
    objc_msgSend(v24, "fillBuffer:range:value:", v14, 0, objc_msgSend(v14, "length"), 0);
    objc_msgSend(v24, "fillBuffer:range:value:", v15, 0, objc_msgSend(v15, "length"), 0);
    [v24 endEncoding];
    v25 = [(MTLCommandBuffer *)self->_cmdBuf computeCommandEncoder];
    if (v25)
    {
      v26 = v25;
      [v25 setComputePipelineState:self->_calcLTMStatisticsPipelineState];
      [v26 setTexture:v12 atIndex:0];
      [v26 setBytes:&a4->var1 length:52 atIndex:0];
      p_var2 = &a4->var2;
      [v26 setBytes:&a4->var2 length:172 atIndex:1];
      [v26 setBytes:&a4->var3 length:40 atIndex:2];
      [v26 setBytes:a4 length:32 atIndex:3];
      [v26 setBuffer:v13 offset:0 atIndex:4];
      id v28 = v14;
      [v26 setBuffer:v14 offset:0 atIndex:5];
      id v52 = v15;
      [v26 setBuffer:v15 offset:0 atIndex:6];
      unint64_t v29 = [(MTLComputePipelineState *)self->_calcLTMStatisticsPipelineState threadExecutionWidth];
      uint64_t v30 = [v12 width];
      id v31 = v13;
      if (v29 >= [v12 height] * v30)
      {
        uint64_t v33 = [v12 width];
        unint64_t v32 = [v12 height] * v33;
      }
      else
      {
        unint64_t v32 = [(MTLComputePipelineState *)self->_calcLTMStatisticsPipelineState threadExecutionWidth];
      }
      unint64_t v34 = [(MTLComputePipelineState *)self->_calcLTMStatisticsPipelineState maxTotalThreadsPerThreadgroup]/ v32;
      uint64_t v35 = [v12 width];
      if (v34 >= [v12 height] * v35 / v32)
      {
        uint64_t v37 = [v12 width];
        unint64_t v36 = [v12 height] * v37;
      }
      else
      {
        unint64_t v36 = [(MTLComputePipelineState *)self->_calcLTMStatisticsPipelineState maxTotalThreadsPerThreadgroup];
      }
      unint64_t v38 = v36 / v32;
      v57[0] = [v12 width];
      v57[1] = [v12 height];
      v57[2] = 1;
      v56[0] = v32;
      v56[1] = v38;
      v56[2] = 1;
      [v26 dispatchThreads:v57 threadsPerThreadgroup:v56];
      [v26 endEncoding];
      uint64_t v39 = [(MTLCommandBuffer *)self->_cmdBuf computeCommandEncoder];

      if (v39)
      {
        [v39 setComputePipelineState:self->_calcLocalHistogramShift];
        [v39 setBytes:p_var2 length:172 atIndex:0];
        id v14 = v28;
        [v39 setBuffer:v28 offset:0 atIndex:1];
        if ((unint64_t)[(MTLComputePipelineState *)self->_calcLocalHistogramShift threadExecutionWidth] > 0xCBF)unint64_t v40 = 3264; {
        else
        }
          unint64_t v40 = [(MTLComputePipelineState *)self->_calcLocalHistogramShift threadExecutionWidth];
        id v13 = v31;
        unint64_t v41 = [(MTLComputePipelineState *)self->_calcLocalHistogramShift maxTotalThreadsPerThreadgroup];
        unint64_t v42 = 0xCC0 / v40;
        id v15 = v52;
        if (v41 / v40 < 0xCC0 / v40) {
          unint64_t v42 = [(MTLComputePipelineState *)self->_calcLocalHistogramShift maxTotalThreadsPerThreadgroup]/ v40;
        }
        long long v54 = xmmword_23FF52810;
        uint64_t v55 = 1;
        v53[0] = v40;
        v53[1] = v42;
        v53[2] = 1;
        [v39 dispatchThreads:&v54 threadsPerThreadgroup:v53];
        int v43 = 0;
      }
      else
      {
        unsigned int v59 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v48 = v59;
        if (os_log_type_enabled(v47, type)) {
          unsigned int v49 = v48;
        }
        else {
          unsigned int v49 = v48 & 0xFFFFFFFE;
        }
        id v14 = v28;
        if (v49)
        {
          int v60 = 136315138;
          uint64_t v61 = "-[LTMStatsCompute encodeLTMStatisticsCalculationPrecise:paramsGlobalHist:globalHistogram:localHistogram:thumbnail:]";
          LODWORD(v51) = 12;
          unsigned int v50 = &v60;
          _os_log_send_and_compose_impl();
        }
        id v13 = v31;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        uint64_t v39 = 0;
        int v43 = -1;
        id v15 = v52;
      }
    }
    else
    {
      unsigned int v59 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      uint64_t v39 = 0;
      int v43 = -1;
    }
  }
  else
  {
LABEL_24:
    unsigned int v59 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v24 = 0;
    uint64_t v39 = 0;
    int v43 = -1;
  }
  objc_msgSend(v39, "endEncoding", v50, v51);
  [(MTLCommandBuffer *)self->_cmdBuf commit];

  return v43;
}

uint64_t __115__LTMStatsCompute_encodeLTMStatisticsCalculationPrecise_paramsGlobalHist_globalHistogram_localHistogram_thumbnail___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __115__LTMStatsCompute_encodeLTMStatisticsCalculationPrecise_paramsGlobalHist_globalHistogram_localHistogram_thumbnail___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)waitUntilCompleted
{
  cmdBuf = self->_cmdBuf;
  if (cmdBuf)
  {
    [(MTLCommandBuffer *)cmdBuf waitUntilCompleted];
    id v4 = self->_cmdBuf;
    self->_cmdBuf = 0;
  }
  else
  {
    id v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

- (int)computeInputParametersForImageWidth:(id)a3 calcGlobalHistOnROI:(BOOL)a4 enableAntiAliasing:(BOOL)a5 with:(sRefDriverInputs *)a6 to:(id *)a7
{
  id v12 = a3;
  id v13 = v12;
  a7->var0.var0 = 11;
  float hardIspDGain = a6->hardIspDGain;
  if (hardIspDGain <= 0.0)
  {
    v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v59 = -1;
  }
  else
  {
    uint64_t v15 = 0;
    unsigned int v16 = vcvts_n_u32_f32(hardIspDGain, 0xBuLL);
    float v17 = (float)(float)(hardIspDGain * 2048.0);
    *(uint32x2_t *)a7->var0.var1 = vcvt_u32_f32(vmul_n_f32((float32x2_t)0x3F370A3D3E5A1CACLL, v17));
    a7->var0.var1[2] = (float)(v17 * 0.072);
    do
      a7->var0.var2[v15++] = v16;
    while (v15 != 3);
    a7->var0.var3 = 0;
    [v12 cropRect];
    float64_t v70 = v18;
    [v13 cropRect];
    float64_t v64 = v19;
    [v13 cropRect];
    float64_t v72 = v20;
    [v13 cropRect];
    float64_t v66 = v21;
    [v13 cropRect];
    float64_t v68 = v22;
    [v13 cropRect];
    a7->var2.var0 = 1;
    a7->var2.var1 = 2;
    v23.f64[0] = v70;
    v24.f64[0] = v66;
    v23.f64[1] = v64;
    __asm { FMOV            V4.2D, #0.5 }
    int32x4_t v30 = (int32x4_t)vcvtq_n_u64_f64(vrndmq_f64(vmulq_f64(vmulq_f64(vdivq_f64(v23, (float64x2_t)xmmword_23FF52820), _Q4), _Q4)), 2uLL);
    int32x2_t v71 = vmovn_s64((int64x2_t)v30);
    *(int32x2_t *)&v23.f64[0] = vmul_s32(v71, (int32x2_t)0xD00000011);
    v31.i64[0] = LODWORD(v23.f64[0]);
    v31.i64[1] = HIDWORD(v23.f64[0]);
    v24.f64[1] = v32;
    v33.f64[0] = v72;
    v33.f64[1] = v68;
    int32x2_t v34 = vmovn_s64((int64x2_t)vcvtq_n_u64_f64(vrndmq_f64(vmulq_f64(vaddq_f64(v33, vmulq_f64(vsubq_f64(v24, vcvtq_f64_u64(v31)), _Q4)), _Q4)), 1uLL));
    *(int32x2_t *)&v33.f64[0] = vadd_s32(*(int32x2_t *)&v23.f64[0], v34);
    int32x2_t v73 = v34;
    *(int32x2_t *)&v23.f64[0] = v34;
    float64x2_t v65 = _Q4;
    float64_t v67 = v33.f64[0];
    v23.f64[1] = v33.f64[0];
    int32x4_t v35 = vmulq_s32(vuzp1q_s32(v30, v30), (int32x4_t)xmmword_23FF52830);
    *(float64x2_t *)&a7->var2.var3 = v23;
    *(int32x4_t *)&a7->var2.var7 = v35;
    uint64_t v69 = v35.i64[0];
    *(void *)&a7->var2.var11 = 0x80000000000;
    a7->var2.var13 = 1;
    if (useLowerLocalHistogramThreshold()) {
      unsigned int v36 = 65471;
    }
    else {
      unsigned int v36 = 65472;
    }
    a7->var2.var16 = 3;
    a7->var2.var14 = v36;
    a7->var2.var15 = a5;
    a7->var2.var17 = 1;
    AuxCompute_CalcAntiAliasingSettings(&a7->var2.var17, &a7->var2.var16, a7->var2.var18, a6);
    +[LTMStatsCompute rewriteAntiAliasingCoefficients:a7->var2.var18];
    a7->var2.var2 = ((a7->var2.var10 * a7->var2.var9) & 0xFFFE0000) != 0;
    a7->var1.var0 = 1;
    if (a4)
    {
      *(int32x2_t *)&a7->var1.var2 = v73;
      a7->var1.var4 = LODWORD(v67);
      unsigned int v37 = HIDWORD(v67);
    }
    else
    {
      [v13 sourceRect];
      a7->var1.var2 = v38;
      [v13 sourceRect];
      a7->var1.var3 = v39;
      [v13 sourceRect];
      double v41 = v40;
      [v13 sourceRect];
      a7->var1.var4 = (v41 + v42);
      [v13 sourceRect];
      double v44 = v43;
      [v13 sourceRect];
      unsigned int v37 = (v44 + v45);
    }
    a7->var1.var5 = v37;
    [(LTMStatsCompute *)self calcExposureRatio:a6];
    *(void *)&a7->var1.var6[2] = 0;
    *(void *)a7->var1.var6 = 0;
    *(float *)v47.i32 = v46 * 256.0;
    *(int32x4_t *)a7->var1.var7 = vdupq_lane_s32(v47, 0);
    *(int32x2_t *)&a7->var3.var0 = v73;
    *(float64_t *)&a7->var3.var2 = v67;
    v48.i64[0] = v71.u32[0];
    v48.i64[1] = v71.u32[1];
    *(int32x2_t *)&a7->var3.var6 = vmovn_s64((int64x2_t)vcvtq_n_u64_f64(vrndmq_f64(vaddq_f64(vmulq_f64(vmulq_f64(vmulq_f64(vcvtq_f64_u64(v48), v65), v65), v65), v65)), 1uLL));
    a7->var3.var4 = (unsigned __int32)v71.i32[0] >> 1;
    a7->var3.var5 = (unsigned __int32)v71.i32[1] >> 1;
    a7->var3.var9 = vcvtms_u32_f32((float)(4295000000.0 / (float)((unsigned __int32)v71.i32[0] >> 1))/ (float)((unsigned __int32)v71.i32[1] >> 1));
    a7->var3.var8 = 1;
    [v13 inputTextureDownsampleRatio];
    a6->LTMGridConfigWidth = v49 * (float)v69;
    [v13 inputTextureDownsampleRatio];
    a6->LTMGridConfigHeight = v50 * (float)HIDWORD(v69);
    int32x2_t v51 = vadd_s32(v73, v71);
    unsigned int v74 = v51.u32[1];
    double v52 = (double)v51.u32[0];
    [v13 deepZoomOrigin];
    double v54 = v53 + v52;
    [v13 inputTextureDownsampleRatio];
    float v56 = v54 * v55;
    a6->LTMGridConfigX = v56;
    [v13 deepZoomOrigin];
    double v58 = v57 + (double)v74;
    [v13 inputTextureDownsampleRatio];
    int v59 = 0;
    float v61 = v58 * v60;
    a6->LTMGridConfigY = v61;
  }

  return v59;
}

- (float)calcExposureRatio:(const sRefDriverInputs *)a3
{
  if (a3->hdrRatio && a3->gainDigi && a3->ev0Ratio && a3->overflowDGain)
  {
    AuxCompute_CalcExposureRatio(a3);
  }
  else
  {
    id v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 1.0;
  }
  return result;
}

- (int)allocateResources
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)prewarmShaders
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmdBuf, 0);
  objc_storeStrong((id *)&self->_collectLocalHistKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_globalHistKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_localHistAndThumKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_calcLocalHistogramShift, 0);
  objc_storeStrong((id *)&self->_calcLTMStatisticsPipelineState, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end