@interface LKTFlowGPU
+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4;
- (BOOL)isBidirectional;
- (BOOL)isValid;
- (BOOL)useNonLocalRegularization;
- (CGSize)aux_size;
- (CGSize)ref_size;
- (LKTFlowGPU)initWithMetalContext:(id)a3 ICPtransform:(int64_t)a4 width:(int)a5 height:(int)a6 nscales:(int)a7 flowUpperMostScale:(int)a8;
- (LKTFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6;
- (MTLBuffer)keypoints;
- (__n64)_parametricTransformToMatrix3x3;
- (double)_matrix3x3ToParametricTransform:(__n128)a3;
- (float)nlreg_sigma_c;
- (float)nlreg_sigma_l;
- (float)nlreg_sigma_w;
- (int)_computeActiveThreadgroupsWithCommandBuffer:(id)a3;
- (int)_computeFeaturesAndTGSumWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeHomographyWithCommandBuffer:(id)a3 in_tex0:(id)a4 in_tex1:(id)a5 in_tex2:(id)a6 weight_tex:(id)a7 regularizer_term:(float)a8 decimation_factor:(unint64_t)a9 scale:(unint64_t)a10 nwarp:(unint64_t)a11;
- (int)_computeICPResiduals:(id)a3 flow:(id)a4;
- (int)_computeICPWeights:(id)a3 weights:(id)a4 flow:(id)a5;
- (int)_computeOpticalFlow;
- (int)_computeOpticalFlowBidirectional;
- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_pixelbuf:(__CVBuffer *)a4 I_idx:(int)a5;
- (int)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7;
- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11;
- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6;
- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 out_kpt_buf:(id)a6 block_size:(int)a7 bidirectional_error:(float)a8 out_num_keypoints:(unsigned __int16 *)a9;
- (int)_getICPNWarp:(int)a3 scale:(int)a4;
- (int)_initICPWeightsWithCommandBuffer:(id)a3;
- (int)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5;
- (int)_initMemoryICP:(int)a3;
- (int)_resampleTransformWithCommandBuffer:(id)a3 from:(id)a4 to:(id)a5;
- (int)_setupBuffer;
- (int)_setupBufferDerivatives;
- (int)_setupBufferICP;
- (int)_setupBufferLKT;
- (int)_setupBufferPyramids;
- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4;
- (int)computeKeypointsFromForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7;
- (int)decimation_factor_icp;
- (int)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4;
- (int)estimateFlowStream:(__CVBuffer *)a3;
- (int)flow_upper_most_scale;
- (int)getMaxNumberOfScales;
- (int)inputPixelFormat;
- (int)nlreg_padding;
- (int)nlreg_radius;
- (int)nscales;
- (int)nscales_icp;
- (int)nwarpings;
- (int)resetCurrentFrameIndex;
- (int)setICPWeights:(id)a3;
- (int)setOutputUV:(__CVBuffer *)a3;
- (int)setOutputUVForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4;
- (int)streamFrameCount;
- (int)warping_scheme_icp;
- (parametric_transform)p;
- (uint64_t)_panoRegistration:(double)a3 metadata:(double)a4;
- (uint64_t)_setParametricTransformFromGyro:(uint64_t)a3;
- (uint64_t)estimatePanoRegistration:(double)a3 metadata:(double)a4 initTForm:(uint64_t)a5;
- (uint64_t)getParametricTransform;
- (void)_computeICPThreadgroupsForActivation:(id *)a3;
- (void)_computeICPThreadgroupsForDecimation:(unint64_t)a3 threadsPerThreadgroupForUniform:(id *)a4 threadsPerThreadgroupForPass1:(id *)a5 threadgroupsPerGridForPass1:(id *)a6;
- (void)_computeICPThreadgroupsWithSize:(CGSize)a3 threadsPerThreadgroupForPass1:(id *)a4 threadgroupsPerGridForPass1:(id *)a5 threadsPerThreadgroupForPass2:(id *)a6 threadgroupsPerGridForPass2:(id *)a7 threadsPerThreadgroupForPass3:(id *)a8 threadgroupsPerGridForPass3:(id *)a9;
- (void)_computeICPThreadgroupsWithSize:(id *)a3 computePipeline:(id)a4 threadsPerThreadgroup:(id *)a5 threadgroupsPerGrid:(id *)a6 debug_string:(char *)a7;
- (void)_copyTransfromFromGPU;
- (void)_copyTransfromToGPU;
- (void)_resampleHomography:(id)a3 to:(id)a4;
- (void)_resampleTransform:(id)a3 to:(id)a4;
- (void)_resetLoss;
- (void)_setDefaultParameters;
- (void)_setDefaultParametersICP;
- (void)_setICPRegularizerTerms:(id)a3;
- (void)_setupPipelines;
- (void)dealloc;
- (void)reset;
- (void)setDecimation_factor_icp:(int)a3;
- (void)setFlow_upper_most_scale:(int)a3;
- (void)setInputPixelFormat:(int)a3;
- (void)setIsBidirectional:(BOOL)a3;
- (void)setNlreg_padding:(int)a3;
- (void)setNlreg_radius:(int)a3;
- (void)setNlreg_sigma_c:(float)a3;
- (void)setNlreg_sigma_l:(float)a3;
- (void)setNlreg_sigma_w:(float)a3;
- (void)setNwarpings:(int)a3;
- (void)setP:(parametric_transform *)a3;
- (void)setPreset:(int64_t)a3;
- (void)setPresetICP:(int64_t)a3 withRegularizerTerms:(id)a4 decimation_factor:(int)a5;
- (void)setUseNonLocalRegularization:(BOOL)a3;
- (void)setWarping_scheme_icp:(int)a3;
- (void)waitUntilCompleted;
@end

@implementation LKTFlowGPU

- (LKTFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  v31.receiver = self;
  v31.super_class = (Class)LKTFlowGPU;
  v12 = [(LKTFlowGPU *)&v31 init];
  v13 = v12;
  if (!v12 || ((v7 | v8) & 1) != 0)
  {
    v29 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v12->_mtlContext, a3);
    uint64_t v17 = objc_msgSend_commandQueue(v11, v14, v15, v16);
    commandQueue = v13->_commandQueue;
    v13->_commandQueue = (MTLCommandQueue *)v17;

    objc_msgSend__setDefaultParameters(v13, v19, v20, v21);
    objc_msgSend__initMemory_height_nscales_(v13, v22, v8, v7, v6);
    objc_msgSend__setupPipelines(v13, v23, v24, v25);
    objc_msgSend__setupBuffer(v13, v26, v27, v28);
    v29 = v13;
  }

  return v29;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_G0_pxbuf);
  CVPixelBufferRelease(self->_G1_pxbuf);
  CVPixelBufferRelease(self->_C0_pxbuf);
  CVPixelBufferRelease(self->_C1_pxbuf);
  CVPixelBufferRelease(self->_w_pxbuf);
  CVPixelBufferRelease(self->_uv_fwd_pxbuf[0]);
  CVPixelBufferRelease(self->_uv_fwd_pxbuf[1]);
  v3.receiver = self;
  v3.super_class = (Class)LKTFlowGPU;
  [(LKTFlowGPU *)&v3 dealloc];
}

- (void)reset
{
  *(void *)&self->_current_frame_index = 0;
}

- (void)waitUntilCompleted
{
  objc_msgSend_commandBuffer(self->_commandQueue, a2, v2, v3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v12, v4, @"LKT:waitUntilCompleted", v5);
  objc_msgSend_commit(v12, v6, v7, v8);
  objc_msgSend_waitUntilCompleted(v12, v9, v10, v11);
}

- (BOOL)isBidirectional
{
  return self->_uv_bwd_tex_user_ref != 0;
}

- (MTLBuffer)keypoints
{
  return self->_kpt_buf;
}

- (void)setPreset:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      objc_msgSend__setDefaultParameters(self, a2, a3, v3);
      return;
    case 1:
      int v4 = 1;
      goto LABEL_8;
    case 2:
      int v4 = 3;
      goto LABEL_8;
    case 3:
      int v4 = 5;
LABEL_8:
      self->_nwarpings = v4;
      self->_useNonLocalRegularization = 0;
      break;
    case 4:
      self->_nwarpings = 6;
      self->_useNonLocalRegularization = 1;
      *(void *)&self->_nlreg_radius = 0x200000004;
      *(void *)&self->_nlreg_sigma_l = 0x4040000040C00000;
      self->_nlreg_sigma_w = 0.25;
      break;
    default:
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, @"Invalid parameter", @"Unknown preset", 0);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
  }
}

- (int)setOutputUV:(__CVBuffer *)a3
{
  return MEMORY[0x270F9A6D0](self, sel_setOutputUVForward_backward_, a3, 0);
}

- (int)setOutputUVForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4
{
  if (a3)
  {
    int Width = CVPixelBufferGetWidth(a3);
    double Height = (double)(int)CVPixelBufferGetHeight(a3);
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v9, (uint64_t)a3, 65, 7, 0, (double)Width, Height);
    uint64_t v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
    self->_uv_fwd_tex_user_ref = v10;

    if (!self->_uv_fwd_tex_user_ref) {
      return -12786;
    }
    if (a4)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v12, (uint64_t)a4, 65, 7, 0, (double)Width, Height);
      v13 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      uv_bwd_tex_user_ref = self->_uv_bwd_tex_user_ref;
      self->_uv_bwd_tex_user_ref = v13;

      if (!self->_uv_bwd_tex_user_ref) {
        return -12786;
      }
    }
    else
    {
      uint64_t v17 = self->_uv_bwd_tex_user_ref;
      self->_uv_bwd_tex_user_ref = 0;
    }
    int result = 0;
    self->_isValid = 1;
  }
  else
  {
    uint64_t v16 = self->_uv_fwd_tex_user_ref;
    self->_uv_fwd_tex_user_ref = 0;

    return 0;
  }
  return result;
}

- (int)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4
{
  if (!self->_isValid || self->_streamFrameCount) {
    return -12782;
  }
  uint64_t v8 = objc_msgSend_commandBuffer(self->_commandQueue, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_setLabel_(v8, v9, @"LKT::Pyramid", v10);
  objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v11, (uint64_t)v8, (uint64_t)self->_uv_bwd_pxbuf[self->_nscales + 1]);
  if (objc_msgSend_isBidirectional(self, v12, v13, v14)) {
    objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v15, (uint64_t)v8, (uint64_t)self->_uv_fwd_tex[1][self->_nscales + 9]);
  }
  objc_msgSend__createImagePyramidWithCommandBuffer_in_pixelbuf_I_idx_(self, v15, (uint64_t)v8, (uint64_t)a3, 0);
  objc_msgSend__createImagePyramidWithCommandBuffer_in_pixelbuf_I_idx_(self, v16, (uint64_t)v8, (uint64_t)a4, 1);
  objc_msgSend_commit(v8, v17, v18, v19);

  *(void *)&self->_current_frame_index = 0;
  if (objc_msgSend_isBidirectional(self, v20, v21, v22)) {
    objc_msgSend__computeOpticalFlowBidirectional(self, v23, v24, v25);
  }
  else {
    objc_msgSend__computeOpticalFlow(self, v23, v24, v25);
  }
  return 0;
}

- (int)estimateFlowStream:(__CVBuffer *)a3
{
  if (!self->_isValid) {
    return -12782;
  }
  uint64_t v6 = objc_msgSend_commandBuffer(self->_commandQueue, a2, (uint64_t)a3, v3);
  objc_msgSend_setLabel_(v6, v7, @"LKT::Pyramid", v8);
  objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v9, (uint64_t)v6, (uint64_t)self->_uv_bwd_pxbuf[self->_nscales + 1]);
  if (objc_msgSend_isBidirectional(self, v10, v11, v12)) {
    objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v13, (uint64_t)v6, (uint64_t)self->_uv_fwd_tex[1][self->_nscales + 9]);
  }
  objc_msgSend__createImagePyramidWithCommandBuffer_in_pixelbuf_I_idx_(self, v13, (uint64_t)v6, (uint64_t)a3, self->_current_frame_index);
  objc_msgSend_commit(v6, v14, v15, v16);

  self->_current_frame_index ^= 1u;
  if (self->_streamFrameCount >= 1)
  {
    if (objc_msgSend_isBidirectional(self, v17, v18, v19)) {
      objc_msgSend__computeOpticalFlowBidirectional(self, v20, v21, v22);
    }
    else {
      objc_msgSend__computeOpticalFlow(self, v20, v21, v22);
    }
  }
  int result = 0;
  ++self->_streamFrameCount;
  return result;
}

- (int)computeKeypointsFromForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v12 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_mtlContext, a2, (uint64_t)a3, 65, 7, 0);
  uint64_t v14 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_mtlContext, v13, (uint64_t)a4, 65, 7, 0);
  uint64_t v18 = objc_msgSend_commandBuffer(self->_commandQueue, v15, v16, v17);
  objc_msgSend_setLabel_(v18, v19, @"LKT::KeypointsFromFlow", v20);
  *(float *)&double v21 = a5;
  objc_msgSend__enqueueKeypointsFromFlowWithCommandBuffer_in_uv_fwd_tex_in_uv_bwd_tex_out_kpt_buf_block_size_bidirectional_error_out_num_keypoints_(self, v22, (uint64_t)v18, (uint64_t)v12, v14, self->_kpt_buf, v8, a7, v21);
  objc_msgSend_commit(v18, v23, v24, v25);

  return 0;
}

- (void)_setDefaultParameters
{
  self->_nwarpings = 3;
  self->_useNonLocalRegularization = 0;
  *(void *)&self->_nlreg_radius = 0x200000004;
  *(void *)&self->_nlreg_sigma_l = 0x4040000040C00000;
  self->_nlreg_sigma_w = 0.25;
}

- (int)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5
{
  int v6 = 0;
  self->_isValid = 0;
  if (a3 >= 8 && a4 >= 8)
  {
    int v6 = 0;
    int v7 = a4;
    int v8 = a3;
    do
    {
      int v9 = (v8 & 1) + v8;
      if (v9 >= 0) {
        int v10 = v9;
      }
      else {
        int v10 = v9 + 1;
      }
      int v11 = v10 >> 1;
      int v12 = v9 + 1;
      if (v11 >= 0) {
        int v13 = v11 & 1;
      }
      else {
        int v13 = -(v11 & 1);
      }
      int v14 = (v7 & 1) + v7;
      if (v14 >= 0) {
        int v15 = v14;
      }
      else {
        int v15 = v14 + 1;
      }
      int v16 = v15 >> 1;
      int v17 = v14 + 1;
      if (v16 >= 0) {
        int v18 = v16 & 1;
      }
      else {
        int v18 = -(v16 & 1);
      }
      int v19 = v12 + 2 * v13;
      int v8 = v19 >> 1;
      int v20 = v17 + 2 * v18;
      int v7 = v20 >> 1;
      ++v6;
    }
    while (v19 >= 16 && v20 > 15);
  }
  self->_ref_size.width = (double)a3;
  self->_ref_size.height = (double)a4;
  self->_aux_size.width = (double)a3;
  self->_aux_size.height = (double)a4;
  if (a5 >= 0) {
    int v22 = a5;
  }
  else {
    int v22 = v6;
  }
  self->_int nscales = v22;
  self->_maxThreadExecutionint Width = 0;
  self->_w_pxbuf = 0;
  *(_OWORD *)&self->_G0_pxbuf = 0u;
  *(_OWORD *)&self->_C0_pxbuf = 0u;
  uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
  self->_uv_fwd_tex_user_ref = 0;

  *(void *)&self->_current_frame_index = 0;
  *(_OWORD *)self->_uv_fwd_pxbuf = 0u;
  *(_OWORD *)self->_uv_bwd_pxbuf = 0u;
  int nscales = self->_nscales;
  if (nscales <= 9) {
    int v25 = -12780;
  }
  else {
    int v25 = 0;
  }
  if (nscales <= v6) {
    return v25;
  }
  else {
    return 0;
  }
}

- (void)_setupPipelines
{
  uint64_t v3 = 0;
  computePipelines = self->_computePipelines;
  do
  {
    id v5 = [NSString alloc];
    int v8 = objc_msgSend_initWithUTF8String_(v5, v6, (uint64_t)off_264C64E08[v3], v7);
    int v10 = objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v9, (uint64_t)v8, 0);
    objc_storeStrong((id *)&computePipelines[v3], v10);
    unint64_t v17 = objc_msgSend_threadExecutionWidth(v10, v11, v12, v13);
    maxThreadExecutionint Width = self->_maxThreadExecutionWidth;
    if (v17 > maxThreadExecutionWidth) {
      maxThreadExecutionint Width = objc_msgSend_threadExecutionWidth(v10, v14, v15, v16);
    }
    self->_maxThreadExecutionint Width = maxThreadExecutionWidth;

    ++v3;
  }
  while (v3 != 22);
}

- (int)_setupBuffer
{
  uint64_t width = (int)self->_ref_size.width;
  height = (const char *)(int)self->_ref_size.height;
  double v5 = self->_aux_size.width;
  double v6 = self->_aux_size.height;
  maxThreadExecutionint Width = self->_maxThreadExecutionWidth;
  int v8 = (__CVBuffer *)sub_2359EBB70((int)self->_ref_size.width, height, 0x32433068u);
  self->_G0_pxbuf = v8;
  if (v8)
  {
    int v9 = (__CVBuffer *)sub_2359EBB70((int)v5, (const char *)(int)v6, 0x32433068u);
    self->_G1_pxbuf = v9;
    if (v9)
    {
      int v10 = (__CVBuffer *)sub_2359EBB70(width, height, 0x52476841u);
      self->_C0_pxbuf = v10;
      if (v10)
      {
        int v11 = (__CVBuffer *)sub_2359EBB70((int)v5, (const char *)(int)v6, 0x52476841u);
        self->_C1_pxbuf = v11;
        if (v11)
        {
          uint64_t v12 = (__CVBuffer *)sub_2359EBB70(width, height, 0x4C303068u);
          self->_w_pxbuf = v12;
          if (v12)
          {
            uint64_t v16 = 0;
            int v17 = ((int)width + (int)maxThreadExecutionWidth - 1)
                / (int)maxThreadExecutionWidth
                * maxThreadExecutionWidth
                * height;
            uint64_t v160 = 8 * v17;
            Adiagb_buf = self->_Adiagb_buf;
            int v157 = v17;
            uint64_t v19 = 2 * v17;
            Ixy_buf = self->_Ixy_buf;
            uv_fwd_pxbuf = self->_uv_fwd_pxbuf;
            char v22 = 1;
            while (1)
            {
              v23 = height;
              uint64_t v24 = width;
              char v25 = v22;
              v26 = objc_msgSend_device(self->_mtlContext, v13, v14, v15);
              uint64_t v28 = objc_msgSend_newBufferWithLength_options_(v26, v27, v160, 0);
              v29 = Adiagb_buf[v16];
              Adiagb_buf[v16] = (MTLBuffer *)v28;

              if (!Adiagb_buf[v16]) {
                break;
              }
              v33 = objc_msgSend_device(self->_mtlContext, v30, v31, v32);
              uint64_t v35 = objc_msgSend_newBufferWithLength_options_(v33, v34, v19, 0);
              v36 = Ixy_buf[v16];
              Ixy_buf[v16] = (MTLBuffer *)v35;

              if (!Ixy_buf[v16]) {
                break;
              }
              uint64_t width = v24;
              int v37 = v24;
              height = v23;
              v38 = (__CVBuffer *)sub_2359EBB70(v37, v23, 0x32433068u);
              uv_fwd_pxbuf[v16] = v38;
              if (!v38) {
                break;
              }
              char v22 = 0;
              uint64_t v16 = 1;
              if ((v25 & 1) == 0)
              {
                v39 = objc_msgSend_device(self->_mtlContext, v13, v14, v15);
                v41 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v39, v40, 4 * v157, 0);
                idt_buf = self->_idt_buf;
                self->_idt_buf = v41;

                if (!self->_idt_buf) {
                  return -12786;
                }
                if (self->_nscales < 1) {
                  return 0;
                }
                uint64_t v44 = 0;
                int32x2_t v45 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_aux_size));
                G1_tex = self->_G1_tex;
                G0_tex = self->_G0_tex;
                C1_tex = self->_C1_tex;
                C0_tex = self->_C0_tex;
                I_tex = self->_I_tex;
                w_tex = self->_w_tex;
                int32x2_t v46 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_ref_size));
                v146 = self->_I_tex[1];
                I_u32_alias_tex = self->_I_u32_alias_tex;
                v145 = self->_I_u32_alias_tex[1];
LABEL_14:
                int v47 = v46.i32[0];
                double v48 = (double)v46.i32[0];
                int v161 = v46.i32[1];
                double v49 = (double)v46.i32[1];
                int v50 = v45.i32[0];
                double v51 = (double)v45.i32[0];
                int v52 = v45.i32[1];
                double v53 = (double)v45.i32[1];
                v54 = &self->_ref_pyr_size[v44];
                v54->uint64_t width = (double)v46.i32[0];
                v54->height = (double)v46.i32[1];
                v55 = &self->_aux_pyr_size[v44];
                v55->uint64_t width = (double)v45.i32[0];
                v55->height = (double)v45.i32[1];
                uint64_t v56 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v43, (uint64_t)self->_G0_pxbuf, 65, 7, 0, (double)v46.i32[0], (double)v46.i32[1]);
                v57 = G0_tex[v44];
                G0_tex[v44] = (MTLTexture *)v56;

                if (G0_tex[v44])
                {
                  uint64_t v59 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v58, (uint64_t)self->_G1_pxbuf, 65, 7, 0, v51, v53);
                  v60 = G1_tex[v44];
                  G1_tex[v44] = (MTLTexture *)v59;

                  if (G1_tex[v44])
                  {
                    uint64_t v62 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v61, (uint64_t)self->_C0_pxbuf, 115, 7, 0, v48, v49);
                    v63 = C0_tex[v44];
                    C0_tex[v44] = (MTLTexture *)v62;

                    if (C0_tex[v44])
                    {
                      uint64_t v65 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v64, (uint64_t)self->_C1_pxbuf, 115, 7, 0, v51, v53);
                      v66 = C1_tex[v44];
                      C1_tex[v44] = (MTLTexture *)v65;

                      if (C1_tex[v44])
                      {
                        int v156 = v50;
                        int v158 = v52;
                        uint64_t v68 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v67, (uint64_t)self->_w_pxbuf, 25, 7, 0, v48, v49);
                        v69 = w_tex[v44];
                        w_tex[v44] = (MTLTexture *)v68;

                        uint64_t v71 = 0;
                        char v72 = 1;
                        while (1)
                        {
                          char v73 = v72;
                          uint64_t v74 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v70, (uint64_t)uv_fwd_pxbuf[v71], 65, 7, 0, v48, v49);
                          v75 = self->_uv_fwd_tex[v71];
                          v76 = v75[v44];
                          v75[v44] = (MTLTexture *)v74;

                          v79 = v75[v44];
                          if (!v79) {
                            break;
                          }
                          uint64_t v80 = objc_msgSend_newTextureViewWithPixelFormat_(v79, v77, 53, v78);
                          v81 = self->_uv_fwd_u32_alias_tex[v71];
                          v82 = v81[v44];
                          v81[v44] = (MTLTexture *)v80;

                          char v72 = 0;
                          uint64_t v71 = 1;
                          if ((v73 & 1) == 0)
                          {
                            v154 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v70, 70, v47, v161, 0);
                            objc_msgSend_setUsage_(v154, v83, 19, v84);
                            v88 = objc_msgSend_device(self->_mtlContext, v85, v86, v87);
                            uint64_t v91 = objc_msgSend_newTextureWithDescriptor_(v88, v89, (uint64_t)v154, v90);
                            v92 = (*I_tex)[v44];
                            (*I_tex)[v44] = (MTLTexture *)v91;

                            uint64_t v95 = objc_msgSend_newTextureViewWithPixelFormat_((*I_tex)[v44], v93, 53, v94);
                            v96 = (*I_u32_alias_tex)[v44];
                            (*I_u32_alias_tex)[v44] = (MTLTexture *)v95;

                            int v97 = v47 & 1;
                            if (v47 < 0) {
                              int v97 = -v97;
                            }
                            int v98 = v161 & 1;
                            if (v161 < 0) {
                              int v98 = -v98;
                            }
                            int v99 = v97 + v47;
                            if (v99 >= 0) {
                              int v100 = v99;
                            }
                            else {
                              int v100 = v99 + 1;
                            }
                            int v101 = v100 >> 1;
                            if (v101 >= 0) {
                              int v102 = v101 & 1;
                            }
                            else {
                              int v102 = -(v101 & 1);
                            }
                            int v103 = v98 + v161;
                            if (v103 >= 0) {
                              int v104 = v103;
                            }
                            else {
                              int v104 = v103 + 1;
                            }
                            int v105 = v104 >> 1;
                            if (v105 >= 0) {
                              int v106 = v105 & 1;
                            }
                            else {
                              int v106 = -(v105 & 1);
                            }
                            int v107 = v99 + 2 * v102;
                            if (v107 + 1 >= 0) {
                              int v108 = v107 + 1;
                            }
                            else {
                              int v108 = v107 + 2;
                            }
                            int v109 = v108 >> 1;
                            int v110 = v103 + 2 * v106;
                            if (v110 + 1 >= 0) {
                              int v111 = v110 + 1;
                            }
                            else {
                              int v111 = v110 + 2;
                            }
                            v112.i32[0] = v109;
                            v112.i32[1] = v111 >> 1;
                            int32x2_t v162 = v112;

                            v155 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v113, 70, v156, v158, 0);
                            objc_msgSend_setUsage_(v155, v114, 19, v115);
                            v119 = objc_msgSend_device(self->_mtlContext, v116, v117, v118);
                            uint64_t v122 = objc_msgSend_newTextureWithDescriptor_(v119, v120, (uint64_t)v155, v121);
                            v123 = v146[v44];
                            v146[v44] = (MTLTexture *)v122;

                            uint64_t v126 = objc_msgSend_newTextureViewWithPixelFormat_(v146[v44], v124, 53, v125);
                            v127 = v145[v44];
                            v145[v44] = (MTLTexture *)v126;

                            int v128 = v156 & 1;
                            if (v156 < 0) {
                              int v128 = -v128;
                            }
                            int v129 = v158 & 1;
                            if (v158 < 0) {
                              int v129 = -v129;
                            }
                            int v130 = v128 + v156;
                            if (v130 >= 0) {
                              int v131 = v130;
                            }
                            else {
                              int v131 = v130 + 1;
                            }
                            int v132 = v131 >> 1;
                            if (v132 >= 0) {
                              int v133 = v132 & 1;
                            }
                            else {
                              int v133 = -(v132 & 1);
                            }
                            int v134 = v129 + v158;
                            if (v134 >= 0) {
                              int v135 = v134;
                            }
                            else {
                              int v135 = v134 + 1;
                            }
                            int v136 = v135 >> 1;
                            if (v136 >= 0) {
                              int v137 = v136 & 1;
                            }
                            else {
                              int v137 = -(v136 & 1);
                            }
                            int v138 = v130 + 2 * v133;
                            if (v138 + 1 >= 0) {
                              int v139 = v138 + 1;
                            }
                            else {
                              int v139 = v138 + 2;
                            }
                            int v140 = v139 >> 1;
                            int v141 = v134 + 2 * v137;
                            if (v141 + 1 >= 0) {
                              int v142 = v141 + 1;
                            }
                            else {
                              int v142 = v141 + 2;
                            }
                            v143.i32[0] = v140;
                            v143.i32[1] = v142 >> 1;
                            int32x2_t v159 = v143;

                            int32x2_t v45 = v159;
                            int32x2_t v46 = v162;
                            if (++v44 < self->_nscales) {
                              goto LABEL_14;
                            }
                            return 0;
                          }
                        }
                      }
                    }
                  }
                }
                return -12786;
              }
            }
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_computeOpticalFlow
{
  int nscales = self->_nscales;
  uint64_t v3 = (nscales - 1);
  if (nscales >= 1)
  {
    double v5 = 0;
    uint64_t v6 = 0;
    I_tex = self->_I_tex;
    G0_tex = self->_G0_tex;
    C0_tex = self->_C0_tex;
    G1_tex = self->_G1_tex;
    uv_fwd_tex = self->_uv_fwd_tex;
    p_uv_fwd_tex_user_ref = &self->_uv_fwd_tex_user_ref;
    C1_tex = self->_C1_tex;
    w_tex = self->_w_tex;
    I_u32_alias_tex = self->_I_u32_alias_tex;
    uv_fwd_u32_alias_tex = self->_uv_fwd_u32_alias_tex;
    int v8 = nscales - 1;
    do
    {
      int v9 = v5;
      int v10 = I_tex[self->_current_frame_index][v3];
      int v11 = I_tex[self->_current_frame_index ^ 1][v3];
      double v5 = objc_msgSend_commandBuffer(self->_commandQueue, v12, v13, v14);

      int v17 = objc_msgSend_stringWithFormat_(NSString, v15, @"LKT:ComputeFlow level %d", v16, v3);
      objc_msgSend_setLabel_(v5, v18, (uint64_t)v17, v19);

      objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(self, v20, (uint64_t)v5, (uint64_t)v10, G0_tex[v3]);
      objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(self, v21, (uint64_t)v5, (uint64_t)v11, G1_tex[v3]);
      objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(self, v22, (uint64_t)v5, (uint64_t)G0_tex[v3], C0_tex[v3]);
      objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(self, v23, (uint64_t)v5, (uint64_t)G1_tex[v3], C1_tex[v3]);
      int nwarpings = self->_nwarpings;
      if (nwarpings < 1)
      {
        v29 = 0;
      }
      else
      {
        v41 = v11;
        v42 = v10;
        int v28 = 0;
        v29 = 0;
        do
        {
          int v30 = v28 + 1;
          if (v3 || v30 != nwarpings || (uint64_t v31 = (id *)p_uv_fwd_tex_user_ref, self->_useNonLocalRegularization)) {
            uint64_t v31 = (id *)&uv_fwd_tex[v6 ^ 1][v3];
          }
          id v33 = *v31;
          if (self->_useNonLocalRegularization && v30 == self->_nwarpings)
          {
            v34 = w_tex[v3];

            v29 = v34;
          }
          objc_msgSend__doSolverWithCommandBuffer_scale_in_uv_tex_in_G0_tex_in_G1_tex_in_C0_tex_in_C1_tex_out_uv_tex_out_w_tex_(self, v32, (uint64_t)v5, v3, uv_fwd_tex[v6][v8], G0_tex[v3], G1_tex[v3], C0_tex[v3], C1_tex[v3], v33, v29);
          v6 ^= 1uLL;

          int nwarpings = self->_nwarpings;
          ++v28;
          int v8 = v3;
        }
        while (v28 < nwarpings);
        int v8 = v3;
        int v11 = v41;
        int v10 = v42;
      }
      if (self->_useNonLocalRegularization)
      {
        uint64_t v35 = &uv_fwd_tex[v6 ^ 1][v3];
        if (!v3) {
          uint64_t v35 = p_uv_fwd_tex_user_ref;
        }
        objc_msgSend__doNLRegularizationWithCommandBuffer_in_uv_tex_join_tex_w_tex_out_uv_tex_(self, v24, (uint64_t)v5, (uint64_t)uv_fwd_u32_alias_tex[v6][v3], I_u32_alias_tex[self->_current_frame_index][v3], v29, *v35);
        v6 ^= 1uLL;
      }
      objc_msgSend_commit(v5, v24, v25, v26);
    }
    while (v3-- > 0);
  }
  return 0;
}

- (int)_computeOpticalFlowBidirectional
{
  uint64_t v2 = self;
  uint64_t v3 = self->_nscales - 1;
  uv_fwd_tex = self->_uv_fwd_tex;
  uint64_t v71 = self->_uv_fwd_tex[0][v3];
  uv_bwd_tex = v2->_uv_bwd_tex;
  v70 = v2->_uv_bwd_tex[0][v3];
  if (v2->_uv_bwd_tex_user_ref)
  {
    uint64_t nscales = v2->_nscales;
    if ((int)nscales < 1)
    {
      double v5 = 0;
    }
    else
    {
      double v5 = 0;
      uint64_t v6 = 0;
      I_tex = v2->_I_tex;
      G1_tex = v2->_G1_tex;
      G0_tex = v2->_G0_tex;
      C1_tex = v2->_C1_tex;
      C0_tex = v2->_C0_tex;
      p_uv_fwd_tex_user_ref = &v2->_uv_fwd_tex_user_ref;
      p_uv_bwd_tex_user_ref = &v2->_uv_bwd_tex_user_ref;
      double v51 = v2->_uv_bwd_tex[1];
      int v58 = v3;
      int v57 = v3;
      do
      {
        uint64_t v7 = v5;
        uint64_t v50 = nscales;
        uint64_t v8 = nscales - 1;
        int v9 = I_tex[v2->_current_frame_index][(nscales - 1)];
        int v10 = I_tex[v2->_current_frame_index ^ 1][v8];
        uint64_t v14 = objc_msgSend_commandBuffer(v2->_commandQueue, v11, v12, v13);

        int v17 = objc_msgSend_stringWithFormat_(NSString, v15, @"LKT:ComputeFlow level %d", v16, v8);
        objc_msgSend_setLabel_(v14, v18, (uint64_t)v17, v19);

        double v49 = v9;
        objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(v2, v20, (uint64_t)v14, (uint64_t)v9, G0_tex[v8]);
        double v48 = v10;
        objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(v2, v21, (uint64_t)v14, (uint64_t)v10, G1_tex[v8]);
        objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(v2, v22, (uint64_t)v14, (uint64_t)G0_tex[v8], C0_tex[v8]);
        uint64_t v65 = v14;
        objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(v2, v23, (uint64_t)v14, (uint64_t)G1_tex[v8], C1_tex[v8]);
        uint64_t v64 = v8;
        if (v2->_nwarpings >= 1)
        {
          int v27 = 0;
          uint64_t v59 = v8;
          v55 = (id *)&(*uv_bwd_tex)[v8];
          do
          {
            if ((v27 + 1))
            {
              uint64_t v68 = G0_tex[v59];
              v67 = G1_tex[v59];
              v66 = C0_tex[v59];
              int v28 = C1_tex[v59];
              v40 = uv_fwd_tex[v6];
              v29 = v40[v58];
              uint64_t v69 = v6 ^ 1;
              int v30 = uv_fwd_tex[v6 ^ 1][v59];
              uint64_t v31 = v64;
              if (v64) {
                BOOL v41 = 1;
              }
              else {
                BOOL v41 = v27 + 3 <= v2->_nwarpings;
              }
              v42 = (id *)&v40[v59];
              if (!v41) {
                v42 = (id *)p_uv_fwd_tex_user_ref;
              }
              id v43 = *v42;
              uint64_t v35 = v2;
              v36 = v70;
              int v37 = (MTLTexture *)v43;

              v39 = v37;
              int v58 = v64;
              v70 = v36;
            }
            else
            {
              uint64_t v68 = G1_tex[v59];
              v67 = G0_tex[v59];
              v66 = C1_tex[v59];
              int v28 = C0_tex[v59];
              v29 = (*uv_bwd_tex)[v57];
              int v30 = v51[v59];
              uint64_t v31 = v64;
              if (v64) {
                BOOL v32 = 1;
              }
              else {
                BOOL v32 = v27 + 3 <= v2->_nwarpings;
              }
              id v33 = (id *)p_uv_bwd_tex_user_ref;
              if (v32) {
                id v33 = v55;
              }
              id v34 = *v33;
              uint64_t v35 = v2;
              v36 = v71;
              int v37 = (MTLTexture *)v34;

              uint64_t v69 = v6 ^ 1;
              int v57 = v64;
              v70 = v37;
              v39 = v36;
            }
            uint64_t v71 = v39;
            objc_msgSend__enqueueFlowConsistencyWithCommandBuffer_in_uv0_tex_in_uv1_tex_out_uv_tex_(v35, v38, (uint64_t)v65, (uint64_t)v36, v29, v30);
            objc_msgSend__doSolverWithCommandBuffer_scale_in_uv_tex_in_G0_tex_in_G1_tex_in_C0_tex_in_C1_tex_out_uv_tex_out_w_tex_(v35, v44, (uint64_t)v65, v31, v30, v68, v67, v66, v28, v37, 0);

            ++v27;
            uint64_t v2 = v35;
            uint64_t v6 = v69;
          }
          while (v27 < v35->_nwarpings);
        }
        double v5 = v65;
        objc_msgSend_commit(v65, v24, v25, v26);

        uint64_t nscales = v64;
      }
      while (v50 > 1);
    }
    int v45 = 0;
  }
  else
  {
    double v5 = 0;
    int v45 = -12780;
  }

  return v45;
}

- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_pixelbuf:(__CVBuffer *)a4 I_idx:(int)a5
{
  id v9 = a3;
  int inputPixelFormat = self->_inputPixelFormat;
  if (inputPixelFormat)
  {
    if (inputPixelFormat == 2)
    {
      uint64_t v44 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_mtlContext, v8, (uint64_t)a4, 10, 7, 0);
      int v45 = (char *)self + 80 * a5;
      int32x2_t v46 = (void *)*((void *)v45 + 66);
      *((void *)v45 + 66) = v44;
    }
    else if (inputPixelFormat == 1)
    {
      int v11 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_mtlContext, v8, (uint64_t)a4, 70, 7, 0);
      uint64_t v15 = objc_msgSend_computeCommandEncoder(v9, v12, v13, v14);
      objc_msgSend_setComputePipelineState_(v15, v16, (uint64_t)self->_computePipelines[0], v17);
      objc_msgSend_setTexture_atIndex_(v15, v18, (uint64_t)v11, 0);
      objc_msgSend_setTexture_atIndex_(v15, v19, (uint64_t)self->_I_tex[a5][0], 1);
      int v23 = objc_msgSend_threadExecutionWidth(self->_computePipelines[0], v20, v21, v22);
      int v27 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[0], v24, v25, v26) / v23;
      v57[0] = (int)(v23 + objc_msgSend_width(v11, v28, v29, v30) - 1) / v23;
      v57[1] = (int)(v27 + objc_msgSend_height(v11, v31, v32, v33) - 1) / v27;
      v57[2] = 1;
      v56[0] = v23;
      v56[1] = v27;
      v56[2] = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v15, v34, (uint64_t)v57, (uint64_t)v56);
      objc_msgSend_endEncoding(v15, v35, v36, v37);
    }
  }
  else
  {
    uint64_t Width = (int)CVPixelBufferGetWidth(a4);
    uint64_t Height = (int)CVPixelBufferGetHeight(a4);
    memset(v55, 0, 24);
    CVPixelBufferLockBaseAddress(a4, 0);
    v40 = self->_I_tex[a5][0];
    BaseAddress = CVPixelBufferGetBaseAddress(a4);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
    v55[3] = Width;
    v55[4] = Height;
    v55[5] = 1;
    objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(v40, v43, (uint64_t)v55, 0, BaseAddress, BytesPerRow);
    CVPixelBufferUnlockBaseAddress(a4, 0);
  }
  if (self->_nscales >= 2)
  {
    uint64_t v47 = 0;
    double v48 = (char *)self + 80 * a5;
    do
    {
      double v49 = &v48[8 * v47];
      uint64_t v50 = *((void *)v49 + 67);
      id v51 = *((id *)v49 + 66);
      objc_msgSend__downscale2XWithCommandBuffer_in_tex_out_tex_(self, v52, (uint64_t)v9, (uint64_t)v51, v50);

      uint64_t v53 = v47 + 2;
      ++v47;
    }
    while (v53 < self->_nscales);
  }

  return 0;
}

- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v6 = a4;
  int v10 = objc_msgSend_computeCommandEncoder(a3, v7, v8, v9);
  objc_msgSend_setComputePipelineState_(v10, v11, (uint64_t)self->_computePipelines[1], v12);
  objc_msgSend_setTexture_atIndex_(v10, v13, (uint64_t)v6, 0);
  int v17 = objc_msgSend_threadExecutionWidth(self->_computePipelines[1], v14, v15, v16);
  int v21 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[1], v18, v19, v20) / v17;
  int v25 = (int)(v17 + objc_msgSend_width(v6, v22, v23, v24) - 1) / v17;
  LODWORD(self) = objc_msgSend_height(v6, v26, v27, v28);

  v35[0] = v25;
  v35[1] = (v21 + (int)self - 1) / v21;
  v35[2] = 1;
  v34[0] = v17;
  v34[1] = v21;
  v34[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v10, v29, (uint64_t)v35, (uint64_t)v34);
  objc_msgSend_endEncoding(v10, v30, v31, v32);

  return 0;
}

- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_computePipelines[2], v15);
  objc_msgSend_setTexture_atIndex_(v13, v16, (uint64_t)v9, 0);

  objc_msgSend_setTexture_atIndex_(v13, v17, (uint64_t)v8, 1);
  LODWORD(a3) = objc_msgSend_threadExecutionWidth(self->_computePipelines[2], v18, v19, v20);
  int v24 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[2], v21, v22, v23) / (int)a3;
  int v28 = (int)(a3 + objc_msgSend_width(v8, v25, v26, v27) - 1) / (int)a3;
  LODWORD(self) = objc_msgSend_height(v8, v29, v30, v31);

  v38[0] = v28;
  v38[1] = (v24 + (int)self - 1) / v24;
  v38[2] = 1;
  v37[0] = (int)a3;
  v37[1] = v24;
  v37[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v13, v32, (uint64_t)v38, (uint64_t)v37);
  objc_msgSend_endEncoding(v13, v33, v34, v35);

  return 0;
}

- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_computePipelines[3], v15);
  objc_msgSend_setTexture_atIndex_(v13, v16, (uint64_t)v9, 0);
  objc_msgSend_setTexture_atIndex_(v13, v17, (uint64_t)v8, 1);

  LODWORD(a3) = objc_msgSend_threadExecutionWidth(self->_computePipelines[3], v18, v19, v20);
  LODWORD(v8) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[3], v21, v22, v23) / (int)a3;
  int v27 = (int)(a3 + objc_msgSend_width(v9, v24, v25, v26) - 1) / (int)a3;
  LODWORD(self) = objc_msgSend_height(v9, v28, v29, v30);

  v37[0] = v27;
  v37[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v37[2] = 1;
  v36[0] = (int)a3;
  v36[1] = (int)v8;
  v36[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v13, v31, (uint64_t)v37, (uint64_t)v36);
  objc_msgSend_endEncoding(v13, v32, v33, v34);

  return 0;
}

- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_computePipelines[5], v15);
  objc_msgSend_setTexture_atIndex_(v13, v16, (uint64_t)v9, 0);
  objc_msgSend_setTexture_atIndex_(v13, v17, (uint64_t)v8, 1);

  LODWORD(a3) = objc_msgSend_threadExecutionWidth(self->_computePipelines[5], v18, v19, v20);
  LODWORD(v8) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[5], v21, v22, v23) / (int)a3;
  int v27 = (int)(a3 + objc_msgSend_width(v9, v24, v25, v26) - 1) / (int)a3;
  LODWORD(self) = objc_msgSend_height(v9, v28, v29, v30);

  v37[0] = v27;
  v37[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v37[2] = 1;
  v36[0] = (int)a3;
  v36[1] = (int)v8;
  v36[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v13, v31, (uint64_t)v37, (uint64_t)v36);
  objc_msgSend_endEncoding(v13, v32, v33, v34);

  return 0;
}

- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11
{
  id v114 = a11;
  id v17 = a10;
  id v112 = a9;
  id v111 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  LODWORD(a3) = objc_msgSend_width(v17, v22, v23, v24);
  int v28 = objc_msgSend_height(v17, v25, v26, v27);
  int v113 = a3 - 1;
  LODWORD(a6) = ((int)a3 - 1 + LODWORD(self->_maxThreadExecutionWidth))
              / SLODWORD(self->_maxThreadExecutionWidth)
              * LODWORD(self->_maxThreadExecutionWidth);
  v128[0] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v127 = _D0;
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTFlowGPU, v35, (uint64_t)v20, (uint64_t)v17, &v127, v128);
  v121[0] = a3;
  v121[1] = v28;
  uint64_t v122 = a6;
  uint64_t v123 = v127;
  uint64_t v124 = 0;
  uint64_t v34 = (const float *)v128;
  float32x2_t v36 = vld1_dup_f32(v34);
  float32x2_t v125 = v36;
  uint64_t v126 = 0;
  v40 = objc_msgSend_computeCommandEncoder(v21, v37, v38, v39);
  objc_msgSend_setComputePipelineState_(v40, v41, (uint64_t)self->_computePipelines[16], v42);
  objc_msgSend_setTexture_atIndex_(v40, v43, (uint64_t)v20, 0);
  objc_msgSend_setTexture_atIndex_(v40, v44, (uint64_t)v19, 1);

  objc_msgSend_setTexture_atIndex_(v40, v45, (uint64_t)v18, 2);
  objc_msgSend_setTexture_atIndex_(v40, v46, (uint64_t)v111, 3);

  objc_msgSend_setTexture_atIndex_(v40, v47, (uint64_t)v112, 4);
  objc_msgSend_setBuffer_offset_atIndex_(v40, v48, (uint64_t)self->_Adiagb_buf[0], 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v40, v49, (uint64_t)self->_Ixy_buf[0], 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v40, v50, (uint64_t)self->_idt_buf, 0, 2);
  objc_msgSend_setBytes_length_atIndex_(v40, v51, (uint64_t)v121, 48, 3);
  LODWORD(v19) = objc_msgSend_threadExecutionWidth(self->_computePipelines[16], v52, v53, v54);
  int v58 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[16], v55, v56, v57);
  v120[0] = (v113 + (int)v19) / (int)v19;
  v120[1] = (v28 - 1 + v58 / (int)v19) / (v58 / (int)v19);
  v120[2] = 1;
  v119[0] = (int)v19;
  v119[1] = v58 / (int)v19;
  v119[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v40, v59, (uint64_t)v120, (uint64_t)v119);
  objc_msgSend_endEncoding(v40, v60, v61, v62);

  v63 = v21;
  v67 = objc_msgSend_computeCommandEncoder(v21, v64, v65, v66);
  objc_msgSend_setComputePipelineState_(v67, v68, (uint64_t)self->_computePipelines[17], v69);
  objc_msgSend_setBuffer_offset_atIndex_(v67, v70, (uint64_t)self->_Adiagb_buf[0], 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v67, v71, (uint64_t)self->_Ixy_buf[0], 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v67, v72, (uint64_t)self->_Adiagb_buf[1], 0, 2);
  objc_msgSend_setBuffer_offset_atIndex_(v67, v73, (uint64_t)self->_Ixy_buf[1], 0, 3);
  objc_msgSend_setBytes_length_atIndex_(v67, v74, (uint64_t)v121, 48, 4);
  LODWORD(v19) = objc_msgSend_threadExecutionWidth(self->_computePipelines[17], v75, v76, v77);
  int v81 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[17], v78, v79, v80);
  v118[0] = (v113 + (int)v19) / (int)v19;
  v118[1] = (v28 - 1 + v81 / (int)v19) / (v81 / (int)v19);
  v118[2] = 1;
  v117[0] = (int)v19;
  v117[1] = v81 / (int)v19;
  v117[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v67, v82, (uint64_t)v118, (uint64_t)v117);
  objc_msgSend_endEncoding(v67, v83, v84, v85);

  v89 = objc_msgSend_computeCommandEncoder(v63, v86, v87, v88);

  objc_msgSend_setComputePipelineState_(v89, v90, (uint64_t)self->_computePipelines[18], v91);
  objc_msgSend_setBuffer_offset_atIndex_(v89, v92, (uint64_t)self->_Adiagb_buf[1], 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v89, v93, (uint64_t)self->_Ixy_buf[1], 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v89, v94, (uint64_t)self->_idt_buf, 0, 2);
  objc_msgSend_setTexture_atIndex_(v89, v95, (uint64_t)v20, 0);

  objc_msgSend_setTexture_atIndex_(v89, v96, (uint64_t)v17, 1);
  objc_msgSend_setTexture_atIndex_(v89, v97, (uint64_t)v114, 2);

  objc_msgSend_setBytes_length_atIndex_(v89, v98, (uint64_t)v121, 48, 3);
  LODWORD(v19) = objc_msgSend_threadExecutionWidth(self->_computePipelines[18], v99, v100, v101);
  int v105 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[18], v102, v103, v104);
  v116[0] = (v113 + (int)v19) / (int)v19;
  v116[1] = (v28 - 1 + v105 / (int)v19) / (v105 / (int)v19);
  v116[2] = 1;
  v115[0] = (int)v19;
  v115[1] = v105 / (int)v19;
  v115[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v89, v106, (uint64_t)v116, (uint64_t)v115);
  objc_msgSend_endEncoding(v89, v107, v108, v109);

  return 0;
}

- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  LODWORD(a5) = objc_msgSend_width(v10, v14, v15, v16);
  int v20 = objc_msgSend_height(v10, v17, v18, v19);
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v69 = _D0;
  uint64_t v70 = _D0;
  int v68 = 1065353216;
  int v67 = 1065353216;
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTFlowGPU, v27, (uint64_t)v12, (uint64_t)v10, &v70, &v68);
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTFlowGPU, v28, (uint64_t)v11, (uint64_t)v10, &v69, &v67);
  uint64_t v62 = 0;
  v61[0] = a5;
  v61[1] = v20;
  uint64_t v63 = v70;
  uint64_t v64 = v69;
  uint64_t v26 = (const float *)&v68;
  float32x2_t v29 = vld1_dup_f32(v26);
  float32x2_t v30 = vld1_dup_f32((const float *)&v67);
  float32x2_t v65 = v29;
  float32x2_t v66 = v30;
  uint64_t v34 = objc_msgSend_computeCommandEncoder(v13, v31, v32, v33);

  objc_msgSend_setComputePipelineState_(v34, v35, (uint64_t)self->_computePipelines[19], v36);
  objc_msgSend_setTexture_atIndex_(v34, v37, (uint64_t)v12, 0);

  objc_msgSend_setTexture_atIndex_(v34, v38, (uint64_t)v11, 1);
  objc_msgSend_setTexture_atIndex_(v34, v39, (uint64_t)v10, 2);
  objc_msgSend_setBytes_length_atIndex_(v34, v40, (uint64_t)v61, 48, 0);
  LODWORD(v11) = objc_msgSend_threadExecutionWidth(self->_computePipelines[19], v41, v42, v43);
  LODWORD(v13) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[19], v44, v45, v46) / (int)v11;
  int v50 = (int)(v11 + objc_msgSend_width(v10, v47, v48, v49) - 1) / (int)v11;
  LODWORD(self) = objc_msgSend_height(v10, v51, v52, v53);

  v60[0] = v50;
  v60[1] = ((int)v13 + (int)self - 1) / (int)v13;
  v60[2] = 1;
  v59[0] = (int)v11;
  v59[1] = (int)v13;
  v59[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v34, v54, (uint64_t)v60, (uint64_t)v59);
  objc_msgSend_endEncoding(v34, v55, v56, v57);

  return 0;
}

- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 out_kpt_buf:(id)a6 block_size:(int)a7 bidirectional_error:(float)a8 out_num_keypoints:(unsigned __int16 *)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a3;
  int v23 = (int)objc_msgSend_width(v16, v20, v21, v22) / a7;
  int v27 = (int)objc_msgSend_height(v16, v24, v25, v26) / a7;
  int v54 = a7;
  __int16 v56 = v27;
  __int16 v55 = v23;
  uint64_t v57 = LODWORD(a8);
  uint64_t v31 = objc_msgSend_computeCommandEncoder(v19, v28, v29, v30);

  if (v27 * v23 > 0x8000)
  {
    int v50 = -12780;
  }
  else
  {
    objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)self->_computePipelines[20], v33);
    objc_msgSend_setTexture_atIndex_(v31, v34, (uint64_t)v16, 0);
    objc_msgSend_setTexture_atIndex_(v31, v35, (uint64_t)v17, 1);
    objc_msgSend_setBuffer_offset_atIndex_(v31, v36, (uint64_t)v18, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v31, v37, (uint64_t)&v54, 16, 1);
    int v41 = objc_msgSend_threadExecutionWidth(self->_computePipelines[20], v38, v39, v40);
    int v45 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[20], v42, v43, v44);
    v53[0] = (v23 + v41 - 1) / v41;
    v53[1] = (v27 + v45 / v41 - 1) / (v45 / v41);
    v53[2] = 1;
    v52[0] = v41;
    v52[1] = v45 / v41;
    v52[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v31, v46, (uint64_t)v53, (uint64_t)v52);
    objc_msgSend_endEncoding(v31, v47, v48, v49);
    int v50 = 0;
    *a9 = v27 * v23;
  }

  return v50;
}

- (int)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  v59[1] = 0;
  v59[0] = *(void *)&self->_nlreg_radius;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&long long v17 = vdiv_f32(_D1, vadd_f32(*(float32x2_t *)&self->_nlreg_sigma_l, *(float32x2_t *)&self->_nlreg_sigma_l));
  DWORD2(v17) = DWORD1(v17);
  *((float *)&v17 + 3) = 1.0 / (float)(self->_nlreg_sigma_w + self->_nlreg_sigma_w);
  long long v60 = v17;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  uint64_t v25 = objc_msgSend_computeCommandEncoder(a3, v22, v23, v24);
  objc_msgSend_setComputePipelineState_(v25, v26, (uint64_t)self->_computePipelines[21], v27);
  objc_msgSend_setTexture_atIndex_(v25, v28, (uint64_t)v21, 0);
  objc_msgSend_setTexture_atIndex_(v25, v29, (uint64_t)v20, 1);

  objc_msgSend_setTexture_atIndex_(v25, v30, (uint64_t)v19, 2);
  objc_msgSend_setTexture_atIndex_(v25, v31, (uint64_t)v18, 3);

  objc_msgSend_setBytes_length_atIndex_(v25, v32, (uint64_t)v59, 32, 0);
  int v36 = objc_msgSend_threadExecutionWidth(self->_computePipelines[21], v33, v34, v35);
  int v40 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[21], v37, v38, v39) / v36;
  int v44 = objc_msgSend_width(v21, v41, v42, v43);
  if (v44 >= 0) {
    int v48 = v44;
  }
  else {
    int v48 = v44 + 1;
  }
  int v49 = (v36 + (v48 >> 1) - 1) / v36;
  int v50 = objc_msgSend_height(v21, v45, v46, v47);

  if (v50 >= 0) {
    int v52 = v50;
  }
  else {
    int v52 = v50 + 1;
  }
  v58[0] = v49;
  v58[1] = (v40 + (v52 >> 1) - 1) / v40;
  v58[2] = 1;
  v57[0] = v36;
  v57[1] = v40;
  v57[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v51, (uint64_t)v58, (uint64_t)v57);
  objc_msgSend_endEncoding(v25, v53, v54, v55);

  return 0;
}

+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4
{
  id v6 = v5;
  uint64_t v7 = v4;
  id v49 = a3;
  id v9 = a4;
  float v13 = (float)(unint64_t)objc_msgSend_width(v9, v10, v11, v12);
  float v17 = v13 / (float)(unint64_t)objc_msgSend_width(v49, v14, v15, v16);
  uint64_t v21 = objc_msgSend_height(v9, v18, v19, v20);
  uint64_t v25 = objc_msgSend_height(v49, v22, v23, v24);
  LODWORD(v29) = 1.5;
  *(float *)&double v30 = (float)(unint64_t)v21 / (float)(unint64_t)v25;
  if (v17 <= 1.5 || *(float *)&v30 <= 1.5)
  {
    uint64_t v32 = objc_msgSend_width(v9, v26, v27, v28, v29, v30);
    if (v32 != objc_msgSend_width(v49, v33, v34, v35)
      || (uint64_t v39 = objc_msgSend_height(v9, v36, v37, v38), v39 != objc_msgSend_height(v49, v40, v41, v42)))
    {
      sub_235A0E208();
    }
    __asm { FMOV            V0.2S, #1.0 }
    float v48 = 1.0;
  }
  else
  {
    _D0 = 0x3F0000003F000000;
    float v48 = 2.0;
  }
  *id v6 = v48;
  *uint64_t v7 = _D0;
}

- (LKTFlowGPU)initWithMetalContext:(id)a3 ICPtransform:(int64_t)a4 width:(int)a5 height:(int)a6 nscales:(int)a7 flowUpperMostScale:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  int v12 = a4;
  id v15 = a3;
  v49.receiver = self;
  v49.super_class = (Class)LKTFlowGPU;
  uint64_t v16 = [(LKTFlowGPU *)&v49 init];
  float v17 = v16;
  if (!v16 || ((v10 | v11) & 1) != 0)
  {
    uint64_t v47 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v16->_mtlContext, a3);
    uint64_t v21 = objc_msgSend_commandQueue(v15, v18, v19, v20);
    commandQueue = v17->_commandQueue;
    v17->_commandQueue = (MTLCommandQueue *)v21;

    v17->_p.length_params = v12;
    objc_msgSend__setDefaultParameters(v17, v23, v24, v25);
    objc_msgSend__initMemory_height_nscales_(v17, v26, v11, v10, v9);
    objc_msgSend__setDefaultParametersICP(v17, v27, v28, v29);
    objc_msgSend__initMemoryICP_(v17, v30, v8, v31);
    objc_msgSend__setupPipelines(v17, v32, v33, v34);
    objc_msgSend__setupBufferPyramids(v17, v35, v36, v37);
    objc_msgSend__setupBufferDerivatives(v17, v38, v39, v40);
    objc_msgSend__setupBufferLKT(v17, v41, v42, v43);
    objc_msgSend__setupBufferICP(v17, v44, v45, v46);
    uint64_t v47 = v17;
  }

  return v47;
}

- (int)setICPWeights:(id)a3
{
  if (self->_w_icp_tex_user_ref) {
    return 0;
  }
  else {
    return -12780;
  }
}

- (void)setPresetICP:(int64_t)a3 withRegularizerTerms:(id)a4 decimation_factor:(int)a5
{
  uint64_t v19 = (char *)a4;
  switch(a3)
  {
    case 1:
      int nscales = self->_nscales;
      BOOL v11 = __OFSUB__(nscales, 2);
      int v12 = nscales - 2;
      if ((v12 < 0) ^ v11 | (v12 == 0)) {
        int v12 = 0;
      }
      self->_nscales_icp = v12;
      int v13 = 1;
      goto LABEL_17;
    case 2:
      int v15 = self->_nscales;
      BOOL v11 = __OFSUB__(v15, 2);
      int v16 = v15 - 2;
      if ((v16 < 0) ^ v11 | (v16 == 0)) {
        int v16 = 0;
      }
      goto LABEL_11;
    case 3:
      int v16 = self->_nscales;
LABEL_11:
      self->_nscales_icp = v16;
      int v13 = 2;
      goto LABEL_17;
    case 4:
      self->_nscales_icp = self->_nscales;
      int v13 = 4;
      goto LABEL_17;
    case 5:
      int v17 = self->_nscales;
      BOOL v11 = __OFSUB__(v17, 2);
      int v18 = v17 - 2;
      if ((v18 < 0) ^ v11 | (v18 == 0)) {
        int v18 = 0;
      }
      self->_nscales_icp = v18;
      int v13 = 1000;
LABEL_17:
      self->_warping_scheme_icp = v13;
      objc_msgSend__setICPRegularizerTerms_(self, v19, (uint64_t)v19, v9);
      break;
    default:
      objc_msgSend__setDefaultParameters(self, v19, v8, v9);
      objc_msgSend__setICPRegularizerTerms_(self, v19, (uint64_t)v19, v14);
      break;
  }
  self->_decimation_factor_icp = a5;
}

- (uint64_t)estimatePanoRegistration:(double)a3 metadata:(double)a4 initTForm:(uint64_t)a5
{
  id v12 = a7;
  if (*(unsigned char *)(a1 + 2168))
  {
    int v13 = objc_msgSend_commandBuffer(*(void **)(a1 + 16), v9, v10, v11);
    objc_msgSend_setLabel_(v13, v14, @"LKT::Pyramid", v15);
    objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_((void *)a1, v16, (uint64_t)v13, *(void *)(a1 + 8 * *(int *)(a1 + 2176) + 1352));
    objc_msgSend__createImagePyramidWithCommandBuffer_in_pixelbuf_I_idx_((void *)a1, v17, (uint64_t)v13, a6, *(unsigned int *)(a1 + 2000));
    objc_msgSend_commit(v13, v18, v19, v20);

    *(_DWORD *)(a1 + 2000) ^= 1u;
    if (*(int *)(a1 + 2004) < 1)
    {
      uint64_t v25 = objc_msgSend_commandBuffer(*(void **)(a1 + 16), v21, v22, v23);
      objc_msgSend_setLabel_(v25, v26, @"ICP::Init weights", v27);
      objc_msgSend__initICPWeightsWithCommandBuffer_((void *)a1, v28, (uint64_t)v25, v29);
      objc_msgSend_commit(v25, v30, v31, v32);
      objc_msgSend__setParametricTransformFromGyro_((void *)a1, v33, v34, v35, a2, a3, a4);
      objc_msgSend__resetLoss((void *)a1, v36, v37, v38);
    }
    else
    {
      objc_msgSend__panoRegistration_metadata_((void *)a1, v21, (uint64_t)v12, v23, a2, a3, a4);
    }
    uint64_t v24 = 0;
    ++*(_DWORD *)(a1 + 2004);
  }
  else
  {
    uint64_t v24 = 4294954514;
  }

  return v24;
}

- (int)resetCurrentFrameIndex
{
  self->_current_frame_index ^= 1u;
  return 0;
}

- (uint64_t)getParametricTransform
{
  return MEMORY[0x270F9A6D0](a1, sel__parametricTransformToMatrix3x3, a3, a4);
}

- (int)getMaxNumberOfScales
{
  return 10;
}

- (int)_initMemoryICP:(int)a3
{
  self->_flow_upper_most_scale = a3;
  icp_reduc_buf = self->_icp_reduc_buf;
  self->_icp_reduc_buf = 0;

  w_icp_tex_user_ref = self->_w_icp_tex_user_ref;
  self->_w_icp_tex_user_ref = 0;

  *(void *)&self->_icp_regularizer_term[8] = 0;
  *(_OWORD *)self->_icp_regularizer_term = 0u;
  *(_OWORD *)&self->_icp_regularizer_term[4] = 0u;
  return 0;
}

- (int)_setupBufferPyramids
{
  if (self->_nscales >= 1)
  {
    uint64_t v3 = 0;
    int32x2_t v75 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_aux_size));
    int32x2_t v4 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_ref_size));
    aux_pyr_size = self->_aux_pyr_size;
    I_tex = self->_I_tex;
    do
    {
      v7.i64[0] = v4.i32[0];
      v7.i64[1] = v4.i32[1];
      aux_pyr_size[-10] = (CGSize)vcvtq_f64_s64(v7);
      v7.i64[0] = v75.i32[0];
      v7.i64[1] = v75.i32[1];
      *(float64x2_t *)aux_pyr_size = vcvtq_f64_s64(v7);
      int v8 = v4.i32[0];
      int v9 = v4.i32[1];
      uint64_t v10 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, 70, v4.i32[0], v4.i32[1], 0, v74);
      objc_msgSend_setUsage_(v10, v11, 19, v12);
      int v16 = objc_msgSend_device(self->_mtlContext, v13, v14, v15);
      uint64_t v19 = objc_msgSend_newTextureWithDescriptor_(v16, v17, (uint64_t)v10, v18);
      uint64_t v20 = (*I_tex)[0];
      (*I_tex)[0] = (MTLTexture *)v19;

      uint64_t v23 = objc_msgSend_newTextureViewWithPixelFormat_((*I_tex)[0], v21, 53, v22);
      uint64_t v24 = (*I_tex)[20];
      (*I_tex)[20] = (MTLTexture *)v23;

      int v26 = v8 & 1;
      if (v8 < 0) {
        int v26 = -v26;
      }
      int v27 = v9 & 1;
      if (v9 < 0) {
        int v27 = -v27;
      }
      int v28 = v26 + v8;
      if (v28 >= 0) {
        int v29 = v28;
      }
      else {
        int v29 = v28 + 1;
      }
      int v30 = v29 >> 1;
      if (v30 >= 0) {
        int v31 = v30 & 1;
      }
      else {
        int v31 = -(v30 & 1);
      }
      int v32 = v27 + v9;
      if (v32 >= 0) {
        int v33 = v32;
      }
      else {
        int v33 = v32 + 1;
      }
      int v34 = v33 >> 1;
      if (v34 >= 0) {
        int v35 = v34 & 1;
      }
      else {
        int v35 = -(v34 & 1);
      }
      int v36 = v28 + 2 * v31;
      if (v36 + 1 >= 0) {
        int v37 = v36 + 1;
      }
      else {
        int v37 = v36 + 2;
      }
      int v38 = v37 >> 1;
      int v39 = v32 + 2 * v35;
      if (v39 + 1 >= 0) {
        int v40 = v39 + 1;
      }
      else {
        int v40 = v39 + 2;
      }
      LODWORD(v25) = v38;
      DWORD1(v25) = v40 >> 1;
      long long v74 = v25;

      uint64_t v42 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v41, 70, v75.i32[0], v75.i32[1], 0);
      objc_msgSend_setUsage_(v42, v43, 19, v44);
      float v48 = objc_msgSend_device(self->_mtlContext, v45, v46, v47);
      uint64_t v51 = objc_msgSend_newTextureWithDescriptor_(v48, v49, (uint64_t)v42, v50);
      int v52 = (*I_tex)[10];
      (*I_tex)[10] = (MTLTexture *)v51;

      uint64_t v55 = objc_msgSend_newTextureViewWithPixelFormat_((*I_tex)[10], v53, 53, v54);
      __int16 v56 = (*I_tex)[30];
      (*I_tex)[30] = (MTLTexture *)v55;

      int v57 = v75.i8[0] & 1;
      if (v75.i32[0] < 0) {
        int v57 = -v57;
      }
      int v58 = v75.i8[4] & 1;
      if (v75.i32[1] < 0) {
        int v58 = -v58;
      }
      int v59 = v57 + v75.i32[0];
      if (v59 >= 0) {
        int v60 = v59;
      }
      else {
        int v60 = v59 + 1;
      }
      int v61 = v60 >> 1;
      if (v61 >= 0) {
        int v62 = v61 & 1;
      }
      else {
        int v62 = -(v61 & 1);
      }
      int v63 = v58 + v75.i32[1];
      if (v63 >= 0) {
        int v64 = v63;
      }
      else {
        int v64 = v63 + 1;
      }
      int v65 = v64 >> 1;
      if (v65 >= 0) {
        int v66 = v65 & 1;
      }
      else {
        int v66 = -(v65 & 1);
      }
      int v67 = v59 + 2 * v62;
      if (v67 + 1 >= 0) {
        int v68 = v67 + 1;
      }
      else {
        int v68 = v67 + 2;
      }
      int v69 = v68 >> 1;
      int v70 = v63 + 2 * v66;
      if (v70 + 1 >= 0) {
        int v71 = v70 + 1;
      }
      else {
        int v71 = v70 + 2;
      }
      v72.i32[0] = v69;
      v72.i32[1] = v71 >> 1;
      int32x2_t v75 = v72;

      int32x2_t v4 = (int32x2_t)v74;
      ++v3;
      ++aux_pyr_size;
      I_tex = (MTLTexture *(*)[10])((char *)I_tex + 8);
    }
    while (v3 < self->_nscales);
  }
  return 0;
}

- (int)_setupBufferDerivatives
{
  int width = (int)self->_ref_size.width;
  height = (const char *)(int)self->_ref_size.height;
  double v5 = self->_aux_size.width;
  double v6 = self->_aux_size.height;
  int64x2_t v7 = (__CVBuffer *)sub_2359EBB70(width, height, 0x32433068u);
  self->_G0_pxbuf = v7;
  if (v7)
  {
    int v8 = (__CVBuffer *)sub_2359EBB70((int)v5, (const char *)(int)v6, 0x32433068u);
    self->_G1_pxbuf = v8;
    if (v8)
    {
      int v9 = (__CVBuffer *)sub_2359EBB70(width, height, 0x52476841u);
      self->_C0_pxbuf = v9;
      if (v9)
      {
        uint64_t v10 = (__CVBuffer *)sub_2359EBB70((int)v5, (const char *)(int)v6, 0x52476841u);
        self->_C1_pxbuf = v10;
        if (v10)
        {
          if (self->_nscales < 1) {
            return 0;
          }
          uint64_t v12 = 0;
          C1_tex = self->_C1_tex;
          for (i = &self->_aux_pyr_size[0].height; ; i += 2)
          {
            double v15 = *(i - 21);
            double v16 = *(i - 20);
            double v17 = *(i - 1);
            double v18 = *i;
            uint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v11, (uint64_t)self->_G0_pxbuf, 65, 7, 0, v15, v16);
            uint64_t v20 = *(C1_tex - 32);
            *(C1_tex - 32) = (MTLTexture *)v19;

            if (!*(C1_tex - 32)) {
              break;
            }
            uint64_t v22 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v21, (uint64_t)self->_G1_pxbuf, 65, 7, 0, v17, v18);
            uint64_t v23 = *(C1_tex - 22);
            *(C1_tex - 22) = (MTLTexture *)v22;

            if (!*(C1_tex - 22)) {
              break;
            }
            uint64_t v25 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v24, (uint64_t)self->_C0_pxbuf, 115, 7, 0, v15, v16);
            int v26 = *(C1_tex - 10);
            *(C1_tex - 10) = (MTLTexture *)v25;

            if (!*(C1_tex - 10)) {
              break;
            }
            uint64_t v28 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v27, (uint64_t)self->_C1_pxbuf, 115, 7, 0, v17, v18);
            int v29 = *C1_tex;
            *C1_tex = (MTLTexture *)v28;

            if (!*C1_tex) {
              break;
            }
            ++v12;
            ++C1_tex;
            if (v12 >= self->_nscales) {
              return 0;
            }
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_setupBufferLKT
{
  int width = (int)self->_ref_size.width;
  int height = (int)self->_ref_size.height;
  int flow_upper_most_scale = self->_flow_upper_most_scale;
  if (width >= 0) {
    int v8 = (int)self->_ref_size.width;
  }
  else {
    int v8 = width + 1;
  }
  unsigned int v9 = v8 >> 1;
  if (height >= 0) {
    int v10 = (int)self->_ref_size.height;
  }
  else {
    int v10 = height + 1;
  }
  unsigned int v11 = v10 >> 1;
  if (flow_upper_most_scale >= 1) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = width;
  }
  if (flow_upper_most_scale >= 1) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = height;
  }
  maxThreadExecutionuint64_t Width = self->_maxThreadExecutionWidth;
  if (!self->_useNonLocalRegularization
    || (double v15 = (__CVBuffer *)sub_2359EBB70(v12, (const char *)v13, 0x4C303068u), (self->_w_pxbuf = v15) != 0))
  {
    uint64_t v16 = 0;
    int v17 = ((int)v12 + maxThreadExecutionWidth - 1) / maxThreadExecutionWidth * maxThreadExecutionWidth * v13;
    uint64_t v62 = v17;
    uint64_t v63 = 8 * v17;
    Adiagb_buf = self->_Adiagb_buf;
    uint64_t v19 = 2 * v17;
    Ixy_buf = self->_Ixy_buf;
    uv_fwd_pxbuf = self->_uv_fwd_pxbuf;
    char v22 = 1;
    while (1)
    {
      uint64_t v23 = v12;
      char v24 = v22;
      uint64_t v25 = objc_msgSend_device(self->_mtlContext, a2, v2, v3, v62);
      uint64_t v27 = objc_msgSend_newBufferWithLength_options_(v25, v26, v63, 0);
      uint64_t v28 = Adiagb_buf[v16];
      Adiagb_buf[v16] = (MTLBuffer *)v27;

      if (!Adiagb_buf[v16]) {
        break;
      }
      int v32 = objc_msgSend_device(self->_mtlContext, v29, v30, v31);
      uint64_t v34 = objc_msgSend_newBufferWithLength_options_(v32, v33, v19, 0);
      int v35 = Ixy_buf[v16];
      Ixy_buf[v16] = (MTLBuffer *)v34;

      if (!Ixy_buf[v16]) {
        break;
      }
      uint64_t v12 = v23;
      int v36 = (__CVBuffer *)sub_2359EBB70(v23, (const char *)v13, 0x32433068u);
      uv_fwd_pxbuf[v16] = v36;
      if (!v36) {
        break;
      }
      char v22 = 0;
      uint64_t v16 = 1;
      if ((v24 & 1) == 0)
      {
        int v37 = objc_msgSend_device(self->_mtlContext, a2, v2, v3);
        int v39 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v37, v38, 4 * v62, 0);
        idt_buf = self->_idt_buf;
        self->_idt_buf = v39;

        if (!self->_idt_buf) {
          return -12786;
        }
        uint64_t v42 = self->_flow_upper_most_scale;
        if ((int)v42 >= self->_nscales) {
          return 0;
        }
        w_tex = self->_w_tex;
LABEL_23:
        uint64_t v44 = &self->_ref_pyr_size[v42];
        double v45 = v44->width;
        double v46 = v44->height;
        if (self->_useNonLocalRegularization)
        {
          uint64_t v47 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v41, (uint64_t)self->_w_pxbuf, 25, 7, 0, v45, v46);
          float v48 = w_tex[v42];
          w_tex[v42] = (MTLTexture *)v47;
        }
        uint64_t v49 = 0;
        char v50 = 1;
        while (1)
        {
          char v51 = v50;
          uint64_t v52 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v41, (uint64_t)uv_fwd_pxbuf[v49], 65, 23, 0, v45, v46);
          uint64_t v53 = self->_uv_fwd_tex[v49];
          uint64_t v54 = v53[v42];
          v53[v42] = (MTLTexture *)v52;

          int v57 = v53[v42];
          if (!v57) {
            return -12786;
          }
          uint64_t v58 = objc_msgSend_newTextureViewWithPixelFormat_(v57, v55, 53, v56);
          int v59 = self->_uv_fwd_u32_alias_tex[v49];
          int v60 = v59[v42];
          v59[v42] = (MTLTexture *)v58;

          char v50 = 0;
          uint64_t v49 = 1;
          if ((v51 & 1) == 0)
          {
            if (++v42 < self->_nscales) {
              goto LABEL_23;
            }
            return 0;
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_setupBufferICP
{
  int width = (int)self->_ref_size.width;
  int height = (int)self->_ref_size.height;
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  memset(v61, 0, sizeof(v61));
  objc_msgSend__computeICPThreadgroupsWithSize_threadsPerThreadgroupForPass1_threadgroupsPerGridForPass1_threadsPerThreadgroupForPass2_threadgroupsPerGridForPass2_threadsPerThreadgroupForPass3_threadgroupsPerGridForPass3_(self, a2, 0, (uint64_t)&v62, 0, v61, 0, 0, (double)width, (double)height);
  if ((unint64_t)(192 * v62 * v63) <= 0x7D0) {
    uint64_t v8 = 2000;
  }
  else {
    uint64_t v8 = 192 * v62 * v63;
  }
  unsigned int v9 = objc_msgSend_device(self->_mtlContext, v5, v6, v7);
  unsigned int v11 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v9, v10, v8, 0);
  icp_reduc_buf = self->_icp_reduc_buf;
  self->_icp_reduc_buf = v11;

  if (!self->_icp_reduc_buf) {
    goto LABEL_13;
  }
  uint64_t v16 = objc_msgSend_device(self->_mtlContext, v13, v14, v15);
  double v18 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v16, v17, 4 * self->_p.length_params, 0);
  icp_param_tform_buf = self->_icp_param_tform_buf;
  self->_icp_param_tform_buf = v18;

  if (!self->_icp_param_tform_buf
    || (objc_msgSend_device(self->_mtlContext, v20, v21, v22),
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v23, v24, 4 * self->_p.length_params, 0),
        icp_param_tform_extra_buf = self->_icp_param_tform_extra_buf,
        self->_icp_param_tform_extra_buf = v25,
        icp_param_tform_extra_buf,
        v23,
        !self->_icp_param_tform_extra_buf))
  {
LABEL_13:
    uint64_t v28 = 0;
    goto LABEL_14;
  }
  uint64_t v28 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v27, 25, (int)v62, (int)v63, 0);
  objc_msgSend_setUsage_(v28, v29, 3, v30);
  uint64_t v34 = objc_msgSend_device(self->_mtlContext, v31, v32, v33);
  int v37 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v34, v35, (uint64_t)v28, v36);
  icp_derivatives_tg_sum = self->_icp_derivatives_tg_sum;
  self->_icp_derivatives_tg_sum = v37;

  if (!self->_icp_derivatives_tg_sum)
  {
LABEL_14:
    int v59 = -12786;
    goto LABEL_12;
  }
  objc_msgSend__computeICPThreadgroupsForDecimation_threadsPerThreadgroupForUniform_threadsPerThreadgroupForPass1_threadgroupsPerGridForPass1_(self, v39, 2, 0, 0, &v62);
  uint64_t v41 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v40, 63, (int)v62, (int)v63, 0);

  objc_msgSend_setUsage_(v41, v42, 3, v43);
  uint64_t v47 = objc_msgSend_device(self->_mtlContext, v44, v45, v46);
  char v50 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v47, v48, (uint64_t)v41, v49);
  icp_active_tg_indices_tex = self->_icp_active_tg_indices_tex;
  self->_icp_active_tg_indices_tex = v50;

  if (self->_icp_active_tg_indices_tex
    && (objc_msgSend_device(self->_mtlContext, v52, v53, v54),
        uint64_t v55 = objc_claimAutoreleasedReturnValue(),
        int v57 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v55, v56, 168, 0),
        icp_loss_buf = self->_icp_loss_buf,
        self->_icp_loss_buf = v57,
        icp_loss_buf,
        v55,
        self->_icp_loss_buf))
  {
    int v59 = 0;
  }
  else
  {
    int v59 = -12786;
  }
  uint64_t v28 = v41;
LABEL_12:

  return v59;
}

- (void)_setDefaultParametersICP
{
}

- (void)_setICPRegularizerTerms:(id)a3
{
  id v20 = a3;
  if ((unint64_t)objc_msgSend_count(v20, v4, v5, v6) > 0xA) {
    unint64_t v10 = 10;
  }
  else {
    unint64_t v10 = objc_msgSend_count(v20, v7, v8, v9);
  }
  unint64_t nscales_icp = self->_nscales_icp;
  if (v10 < nscales_icp)
  {
    if ((unint64_t)objc_msgSend_count(v20, v7, v8, v9) > 0xA)
    {
      unint64_t v13 = v20;
      if (!v20) {
        goto LABEL_15;
      }
      unint64_t nscales_icp = 10;
      goto LABEL_11;
    }
    unint64_t nscales_icp = objc_msgSend_count(v20, v7, v12, v9);
  }
  unint64_t v13 = v20;
  if (!v20) {
    goto LABEL_15;
  }
  if (!nscales_icp) {
    goto LABEL_14;
  }
LABEL_11:
  for (uint64_t i = 0; i != nscales_icp; ++i)
  {
    uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(v20, v7, i, v9);
    objc_msgSend_floatValue(v15, v16, v17, v18);
    self->_icp_regularizer_term[i] = v19;

    unint64_t v13 = v20;
  }
  if (nscales_icp <= 9)
  {
LABEL_14:
    bzero(&self->_icp_regularizer_term[nscales_icp], 40 - 4 * nscales_icp);
    unint64_t v13 = v20;
  }
LABEL_15:
}

- (int)_initICPWeightsWithCommandBuffer:(id)a3
{
  uint64_t v5 = objc_msgSend_computeCommandEncoder(a3, a2, (uint64_t)a3, v3);
  objc_msgSend_setComputePipelineState_(v5, v6, (uint64_t)self->_computePipelines[11], v7);
  objc_msgSend_setTexture_atIndex_(v5, v8, (uint64_t)self->_w_icp_tex_user_ref, 0);
  int v12 = objc_msgSend_threadExecutionWidth(self->_computePipelines[11], v9, v10, v11);
  int v16 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[11], v13, v14, v15) / v12;
  int v20 = v12 + objc_msgSend_width(self->_w_icp_tex_user_ref, v17, v18, v19) - 1;
  w_icp_tex_user_ref = self->_w_icp_tex_user_ref;
  v31[0] = v20 / v12;
  v31[1] = (int)(v16 + objc_msgSend_height(w_icp_tex_user_ref, v22, v23, v24) - 1) / v16;
  v31[2] = 1;
  v30[0] = v12;
  v30[1] = v16;
  v30[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v5, v25, (uint64_t)v31, (uint64_t)v30);
  objc_msgSend_endEncoding(v5, v26, v27, v28);

  return 0;
}

- (int)_computeFeaturesAndTGSumWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  unint64_t v13 = objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_computePipelines[4], v15);
  objc_msgSend_setTexture_atIndex_(v13, v16, (uint64_t)v9, 0);
  objc_msgSend_setTexture_atIndex_(v13, v17, (uint64_t)v8, 1);

  objc_msgSend_setTexture_atIndex_(v13, v18, (uint64_t)self->_w_icp_tex_user_ref, 2);
  objc_msgSend_setTexture_atIndex_(v13, v19, (uint64_t)self->_icp_derivatives_tg_sum, 3);
  LODWORD(a3) = objc_msgSend_threadExecutionWidth(self->_computePipelines[4], v20, v21, v22);
  LODWORD(v8) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[4], v23, v24, v25) / (int)a3;
  int v29 = (int)(a3 + objc_msgSend_width(v9, v26, v27, v28) - 1) / (int)a3;
  LODWORD(self) = objc_msgSend_height(v9, v30, v31, v32);

  v39[0] = v29;
  v39[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v39[2] = 1;
  v38[0] = (int)a3;
  v38[1] = (int)v8;
  v38[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v13, v33, (uint64_t)v39, (uint64_t)v38);
  objc_msgSend_endEncoding(v13, v34, v35, v36);

  return 0;
}

- (int)_resampleTransformWithCommandBuffer:(id)a3 from:(id)a4 to:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  unint64_t v13 = objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  v39[0] = objc_msgSend_width(v9, v14, v15, v16);
  LODWORD(a3) = objc_msgSend_height(v9, v17, v18, v19);

  v39[1] = a3;
  v39[2] = objc_msgSend_width(v8, v20, v21, v22);
  LODWORD(a3) = objc_msgSend_height(v8, v23, v24, v25);

  void v39[3] = a3;
  objc_msgSend_setComputePipelineState_(v13, v26, (uint64_t)self->_computePipelines[10], v27);
  objc_msgSend_setBuffer_offset_atIndex_(v13, v28, (uint64_t)self->_icp_param_tform_buf, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v13, v29, (uint64_t)v39, 96, 1);
  int64x2_t v37 = vdupq_n_s64(1uLL);
  uint64_t v38 = 1;
  int64x2_t v35 = v37;
  uint64_t v36 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v13, v30, (uint64_t)&v37, (uint64_t)&v35);
  objc_msgSend_endEncoding(v13, v31, v32, v33);

  return 0;
}

- (void)_computeICPThreadgroupsWithSize:(id *)a3 computePipeline:(id)a4 threadsPerThreadgroup:(id *)a5 threadgroupsPerGrid:(id *)a6 debug_string:(char *)a7
{
  unint64_t var0 = a3->var0;
  unint64_t var1 = a3->var1;
  id v11 = a4;
  unint64_t v15 = (int)objc_msgSend_threadExecutionWidth(v11, v12, v13, v14);
  int v19 = objc_msgSend_maxTotalThreadsPerThreadgroup(v11, v16, v17, v18);

  unint64_t v20 = v19 / v15;
  if (a5)
  {
    a5->unint64_t var0 = v15;
    a5->unint64_t var1 = v20;
    a5->var2 = 1;
  }
  if (a6)
  {
    a6->unint64_t var0 = (var0 + v15 - 1) / v15;
    a6->unint64_t var1 = (var1 + v20 - 1) / v20;
    a6->var2 = 1;
  }
}

- (void)_computeICPThreadgroupsWithSize:(CGSize)a3 threadsPerThreadgroupForPass1:(id *)a4 threadgroupsPerGridForPass1:(id *)a5 threadsPerThreadgroupForPass2:(id *)a6 threadgroupsPerGridForPass2:(id *)a7 threadsPerThreadgroupForPass3:(id *)a8 threadgroupsPerGridForPass3:(id *)a9
{
  uint64_t v16 = self->_computePipelines[6];
  *(void *)&long long v21 = (unint64_t)a3.width;
  *((void *)&v21 + 1) = (unint64_t)a3.height;
  unint64_t var2 = 1;
  objc_msgSend__computeICPThreadgroupsWithSize_computePipeline_threadsPerThreadgroup_threadgroupsPerGrid_debug_string_(self, a2, (uint64_t)&v21, (uint64_t)v16, a4, a5, "pass1");
  if (!a4 || a4->var0 == 32 && a4->var1 == 32)
  {
    uint64_t v18 = self->_computePipelines[7];
    long long v21 = *(_OWORD *)&a5->var0;
    unint64_t var2 = a5->var2;
    objc_msgSend__computeICPThreadgroupsWithSize_computePipeline_threadsPerThreadgroup_threadgroupsPerGrid_debug_string_(self, v17, (uint64_t)&v21, (uint64_t)v18, a6, a7, "pass2");
    int v19 = self->_computePipelines[7];
    long long v21 = *(_OWORD *)&a7->var0;
    unint64_t var2 = a7->var2;
    objc_msgSend__computeICPThreadgroupsWithSize_computePipeline_threadsPerThreadgroup_threadgroupsPerGrid_debug_string_(self, v20, (uint64_t)&v21, (uint64_t)v19, a8, a9, "pass3");
  }
}

- (void)_computeICPThreadgroupsForDecimation:(unint64_t)a3 threadsPerThreadgroupForUniform:(id *)a4 threadsPerThreadgroupForPass1:(id *)a5 threadgroupsPerGridForPass1:(id *)a6
{
  if (a3)
  {
    if (a6) {
      a6->var1 /= a3;
    }
    if (a4)
    {
      if (a5) {
        *(_OWORD *)&a4->unint64_t var0 = *(_OWORD *)&a5->var0;
      }
    }
  }
  else if (a4)
  {
    a4->unint64_t var0 = 0;
    a4->unint64_t var1 = 0;
  }
}

- (void)_computeICPThreadgroupsForActivation:(id *)a3
{
  if (a3)
  {
    a3->unint64_t var0 = (unint64_t)objc_msgSend_width(self->_icp_derivatives_tg_sum, a2, (uint64_t)a3, v3) >> 1;
    a3->unint64_t var1 = (unint64_t)objc_msgSend_height(self->_icp_derivatives_tg_sum, v6, v7, v8) >> 1;
    a3->unint64_t var2 = 1;
  }
}

- (int)_getICPNWarp:(int)a3 scale:(int)a4
{
  if (a4 < 2) {
    int v4 = 2;
  }
  else {
    int v4 = 3;
  }
  if (a3 == 1000) {
    return v4;
  }
  else {
    return a3;
  }
}

- (uint64_t)_panoRegistration:(double)a3 metadata:(double)a4
{
  id v7 = a6;
  objc_msgSend__setParametricTransformFromGyro_((void *)a1, v8, v9, v10, a2, a3, a4);
  objc_msgSend__copyTransfromToGPU((void *)a1, v11, v12, v13);
  int v17 = *(_DWORD *)(a1 + 2176);
  uint64_t v18 = (v17 - 1);
  if (v17 >= 1)
  {
    id v86 = v7;
    int v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = a1 + 864;
    uint64_t v98 = a1 + 1040;
    uint64_t v90 = a1 + 1120;
    uint64_t v91 = a1 + 528;
    uint64_t v103 = a1 + 1360;
    v96 = (id *)(a1 + 2008);
    uint64_t v97 = a1 + 1248;
    uint64_t v87 = a1 + 688;
    uint64_t v88 = a1 + 1680;
    uint64_t v107 = a1;
    uint64_t v89 = a1 + 2104;
    int v105 = v17 - 1;
    uint64_t v99 = a1 + 864;
    uint64_t v100 = a1 + 944;
    do
    {
      uint64_t v22 = v19;
      id v23 = *(id *)(v91 + 80 * *(int *)(v107 + 2000) + 8 * v18);
      id v24 = *(id *)(v91 + 80 * (*(_DWORD *)(v107 + 2000) ^ 1) + 8 * v18);
      uint64_t v28 = objc_msgSend_commandBuffer(*(void **)(v107 + 16), v25, v26, v27);

      uint64_t v31 = objc_msgSend_stringWithFormat_(NSString, v29, @"Panorama:panoRegistration level %d", v30, v18);
      objc_msgSend_setLabel_(v28, v32, (uint64_t)v31, v33);

      if (v18 || (uint64_t v36 = *(int *)(v107 + 2192), !v36))
      {
        objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_((void *)v107, v34, (uint64_t)v28, (uint64_t)v23, *(void *)(v21 + 8 * v18));
        char v92 = 0;
        uint64_t v36 = 0;
      }
      else
      {
        objc_msgSend__computeFeaturesAndTGSumWithCommandBuffer_in_tex_out_tex_((void *)v107, v34, (uint64_t)v28, (uint64_t)v23, *(void *)(v107 + 864));
        char v92 = 1;
      }
      objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_((void *)v107, v35, (uint64_t)v28, (uint64_t)v24, *(void *)(v100 + 8 * v18));
      objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_((void *)v107, v37, (uint64_t)v28, *(void *)(v21 + 8 * v18), *(void *)(v98 + 8 * v18));
      objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_((void *)v107, v38, (uint64_t)v28, *(void *)(v100 + 8 * v18), *(void *)(v90 + 8 * v18));
      uint64_t v42 = v107;
      uint64_t v94 = v24;
      uint64_t v95 = v23;
      if (v18 >= *(int *)(v107 + 2196))
      {
        int v44 = *(_DWORD *)(v107 + 2180);
        if (v44 < 1)
        {
          uint64_t v101 = 0;
        }
        else
        {
          uint64_t v45 = (uint64_t)v28;
          int v46 = 0;
          uint64_t v101 = 0;
          do
          {
            if (v46 + 1 != v44 || v18 != *(_DWORD *)(v42 + 2196) || (uint64_t v47 = v96, *(unsigned char *)(v42 + 2169))) {
              uint64_t v47 = (id *)(v103 + 80 * (v20 ^ 1) + 8 * v18);
            }
            id v49 = *v47;
            if (*(unsigned char *)(v107 + 2169) && v46 + 1 == *(_DWORD *)(v107 + 2180))
            {
              id v50 = *(id *)(v97 + 8 * v18);

              uint64_t v101 = v50;
            }
            objc_msgSend__doSolverWithCommandBuffer_scale_in_uv_tex_in_G0_tex_in_G1_tex_in_C0_tex_in_C1_tex_out_uv_tex_out_w_tex_((void *)v107, v48, v45, v18, *(void *)(v103 + 80 * v20 + 8 * v105), *(void *)(v99 + 8 * v18), *(void *)(v100 + 8 * v18), *(void *)(v98 + 8 * v18), *(void *)(v90 + 8 * v18), v49, v101);
            v20 ^= 1uLL;

            uint64_t v42 = v107;
            int v44 = *(_DWORD *)(v107 + 2180);
            ++v46;
            int v105 = v18;
          }
          while (v46 < v44);
          int v105 = v18;
          uint64_t v28 = (void *)v45;
        }
        if (*(unsigned char *)(v42 + 2169))
        {
          uint64_t v51 = v20 ^ 1;
          uint64_t v52 = v96;
          if (v18 != *(_DWORD *)(v42 + 2196)) {
            uint64_t v52 = (id *)(v103 + 80 * (v20 ^ 1) + 8 * v18);
          }
          uint64_t v53 = *(void *)(v88 + 80 * v20 + 8 * v18);
          long long v43 = v28;
          objc_msgSend__doNLRegularizationWithCommandBuffer_in_uv_tex_join_tex_w_tex_out_uv_tex_((void *)v107, v39, (uint64_t)v28, v53, *(void *)(v87 + 80 * *(int *)(v42 + 2000) + 8 * v18), v101, *v52);
          uint64_t v42 = v107;
          uint64_t v93 = v51;
        }
        else
        {
          uint64_t v93 = v20;
          long long v43 = v28;
        }
      }
      else
      {
        uint64_t v93 = v20;
        long long v43 = v28;
        uint64_t v101 = 0;
      }
      uint64_t v54 = *(int *)(v42 + 2184);
      uint64_t v55 = v99;
      if (v18 < v54)
      {
        if (v18 < v54 - 1)
        {
          uint64_t v56 = (void *)(v91 + 80 * *(int *)(v107 + 2000) + 8 * v18);
          objc_msgSend__resampleTransformWithCommandBuffer_from_to_((void *)v107, v39, (uint64_t)v43, v56[1], *v56);
        }
        char v57 = v92 ^ 1;
        if (v18) {
          char v57 = 1;
        }
        uint64_t v58 = v107;
        if ((v57 & 1) == 0)
        {
          objc_msgSend__computeActiveThreadgroupsWithCommandBuffer_((void *)v107, v39, (uint64_t)v43, v41);
          uint64_t v58 = v107;
        }
        int ICPNWarp_scale = objc_msgSend__getICPNWarp_scale_((void *)v58, v39, *(unsigned int *)(v58 + 2188), v18);
        uint64_t v55 = v99;
        uint64_t v61 = v100;
        if (ICPNWarp_scale >= 1)
        {
          uint64_t v62 = (ICPNWarp_scale + 1);
          uint64_t v63 = 1;
          do
          {
            uint64_t v64 = *(void *)(v61 + 8 * v18);
            LODWORD(v60) = *(_DWORD *)(v89 + 4 * v18);
            uint64_t v65 = v61;
            uint64_t v66 = v55;
            objc_msgSend__computeHomographyWithCommandBuffer_in_tex0_in_tex1_in_tex2_weight_tex_regularizer_term_decimation_factor_scale_nwarp_((void *)v58, v39, (uint64_t)v43, *(void *)(v55 + 8 * v18), v64, *(void *)(v98 + 8 * v18), *(void *)(v58 + 2144), v36, v60, v18, v63);
            uint64_t v55 = v66;
            uint64_t v61 = v65;
            ++v63;
          }
          while (v62 != v63);
        }
      }
      uint64_t v21 = v55;
      objc_msgSend_commit(v43, v39, v40, v41);

      BOOL v67 = v18-- <= 0;
      int v19 = v43;
      uint64_t v20 = v93;
    }
    while (!v67);

    id v7 = v86;
    a1 = v107;
  }
  int v68 = objc_msgSend_commandBuffer(*(void **)(a1 + 16), v14, v15, v16);
  int v71 = objc_msgSend_stringWithFormat_(NSString, v69, @"Fang weights and residuals", v70);
  objc_msgSend_setLabel_(v68, v72, (uint64_t)v71, v73);

  objc_msgSend__computeICPWeights_weights_flow_((void *)a1, v74, (uint64_t)v68, *(void *)(a1 + 2144), *(void *)(a1 + 2008));
  objc_msgSend__computeICPResiduals_flow_((void *)a1, v75, (uint64_t)v68, *(void *)(a1 + 2008));
  objc_msgSend_commit(v68, v76, v77, v78);
  objc_msgSend_waitUntilCompleted(v68, v79, v80, v81);
  objc_msgSend__copyTransfromFromGPU((void *)a1, v82, v83, v84);

  return 0;
}

- (int)_computeICPWeights:(id)a3 weights:(id)a4 flow:(id)a5
{
  v120[1] = *MEMORY[0x263EF8340];
  v120[0] = 0x4220000041200000;
  if (self->_flow_upper_most_scale >= 1) {
    v120[0] = 0x41A0000040A00000;
  }
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_computeCommandEncoder(v10, v11, v12, v13);
  objc_msgSend_setComputePipelineState_(v14, v15, (uint64_t)self->_computePipelines[12], v16);
  objc_msgSend_setTexture_atIndex_(v14, v17, (uint64_t)v9, 0);
  objc_msgSend_setTexture_atIndex_(v14, v18, (uint64_t)v8, 1);

  objc_msgSend_setBuffer_offset_atIndex_(v14, v19, (uint64_t)self->_icp_param_tform_extra_buf, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v14, v20, (uint64_t)v120, 8, 1);
  LODWORD(v8) = objc_msgSend_threadExecutionWidth(self->_computePipelines[12], v21, v22, v23);
  int v27 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[12], v24, v25, v26) / (int)v8;
  v119[0] = (int)(v8 + objc_msgSend_width(v9, v28, v29, v30) - 1) / (int)v8;
  v119[1] = (int)(v27 + objc_msgSend_height(v9, v31, v32, v33) - 1) / v27;
  v119[2] = 1;
  v118[0] = (int)v8;
  v118[1] = v27;
  v118[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v14, v34, (uint64_t)v119, (uint64_t)v118);
  objc_msgSend_endEncoding(v14, v35, v36, v37);
  v116[0] = 256;
  memset(&v116[1], 0, 24);
  __asm { FMOV            V0.4S, #1.0 }
  long long v117 = _Q0;
  id v43 = objc_alloc(MEMORY[0x263F13298]);
  uint64_t v47 = objc_msgSend_device(self->_mtlContext, v44, v45, v46);
  id v49 = objc_msgSend_initWithDevice_histogramInfo_(v43, v48, (uint64_t)v47, (uint64_t)v116);

  uint64_t v53 = objc_msgSend_pixelFormat(v9, v50, v51, v52);
  uint64_t v56 = objc_msgSend_histogramSizeForSourceFormat_(v49, v54, v53, v55);
  double v60 = objc_msgSend_device(self->_mtlContext, v57, v58, v59);
  uint64_t v62 = objc_msgSend_newBufferWithLength_options_(v60, v61, v56, 0);

  objc_msgSend_encodeToCommandBuffer_sourceTexture_histogram_histogramOffset_(v49, v63, (uint64_t)v10, (uint64_t)v9, v62, 0);
  BOOL v67 = objc_msgSend_device(self->_mtlContext, v64, v65, v66);
  int v69 = objc_msgSend_newBufferWithLength_options_(v67, v68, 4, 0);

  uint64_t v73 = objc_msgSend_computeCommandEncoder(v10, v70, v71, v72);

  objc_msgSend_setComputePipelineState_(v73, v74, (uint64_t)self->_computePipelines[13], v75);
  objc_msgSend_setBuffer_offset_atIndex_(v73, v76, (uint64_t)v62, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v73, v77, (uint64_t)v116, 8, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v73, v78, (uint64_t)v69, 0, 2);
  int64x2_t v114 = vdupq_n_s64(1uLL);
  uint64_t v115 = 1;
  int64x2_t v112 = v114;
  uint64_t v113 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v73, v79, (uint64_t)&v114, (uint64_t)&v112);
  objc_msgSend_endEncoding(v73, v80, v81, v82);
  id v86 = objc_msgSend_computeCommandEncoder(v10, v83, v84, v85);

  objc_msgSend_setComputePipelineState_(v86, v87, (uint64_t)self->_computePipelines[14], v88);
  objc_msgSend_setTexture_atIndex_(v86, v89, (uint64_t)v9, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v86, v90, (uint64_t)v69, 0, 0);
  LODWORD(v10) = objc_msgSend_threadExecutionWidth(self->_computePipelines[14], v91, v92, v93);
  LODWORD(v73) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[14], v94, v95, v96) / (int)v10;
  int v100 = (int)(v10 + objc_msgSend_width(v9, v97, v98, v99) - 1) / (int)v10;
  int v104 = objc_msgSend_height(v9, v101, v102, v103);

  v111[0] = v100;
  v111[1] = ((int)v73 + v104 - 1) / (int)v73;
  v111[2] = 1;
  v110[0] = (int)v10;
  v110[1] = (int)v73;
  v110[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v86, v105, (uint64_t)v111, (uint64_t)v110);
  objc_msgSend_endEncoding(v86, v106, v107, v108);

  return 0;
}

- (int)_computeICPResiduals:(id)a3 flow:(id)a4
{
  id v6 = a4;
  id v10 = objc_msgSend_computeCommandEncoder(a3, v7, v8, v9);
  objc_msgSend_setComputePipelineState_(v10, v11, (uint64_t)self->_computePipelines[15], v12);
  objc_msgSend_setTexture_atIndex_(v10, v13, (uint64_t)v6, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v10, v14, (uint64_t)self->_icp_param_tform_extra_buf, 0, 0);
  int v18 = objc_msgSend_threadExecutionWidth(self->_computePipelines[15], v15, v16, v17);
  int v22 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[15], v19, v20, v21) / v18;
  int v26 = (int)(v18 + objc_msgSend_width(v6, v23, v24, v25) - 1) / v18;
  LODWORD(self) = objc_msgSend_height(v6, v27, v28, v29);

  v36[0] = v26;
  v36[1] = (v22 + (int)self - 1) / v22;
  v36[2] = 1;
  v35[0] = v18;
  v35[1] = v22;
  v35[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v10, v30, (uint64_t)v36, (uint64_t)v35);
  objc_msgSend_endEncoding(v10, v31, v32, v33);

  return 0;
}

- (int)_computeActiveThreadgroupsWithCommandBuffer:(id)a3
{
  uint64_t v5 = objc_msgSend_computeCommandEncoder(a3, a2, (uint64_t)a3, v3);
  long long v23 = 0uLL;
  uint64_t v24 = 0;
  objc_msgSend__computeICPThreadgroupsForActivation_(self, v6, (uint64_t)&v23, v7);
  memset(v22, 0, sizeof(v22));
  LODWORD(v22[0]) = self->_decimation_factor_icp;
  DWORD2(v22[0]) = v23;
  objc_msgSend_setComputePipelineState_(v5, v8, (uint64_t)self->_computePipelines[8], v9);
  objc_msgSend_setTexture_atIndex_(v5, v10, (uint64_t)self->_icp_derivatives_tg_sum, 0);
  objc_msgSend_setTexture_atIndex_(v5, v11, (uint64_t)self->_icp_active_tg_indices_tex, 1);
  objc_msgSend_setBytes_length_atIndex_(v5, v12, (uint64_t)v22, 96, 0);
  int64x2_t v20 = vdupq_n_s64(1uLL);
  uint64_t v21 = 1;
  long long v18 = v23;
  uint64_t v19 = v24;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v5, v13, (uint64_t)&v20, (uint64_t)&v18);
  objc_msgSend_endEncoding(v5, v14, v15, v16);

  return 0;
}

- (int)_computeHomographyWithCommandBuffer:(id)a3 in_tex0:(id)a4 in_tex1:(id)a5 in_tex2:(id)a6 weight_tex:(id)a7 regularizer_term:(float)a8 decimation_factor:(unint64_t)a9 scale:(unint64_t)a10 nwarp:(unint64_t)a11
{
  id v18 = a4;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  uint64_t v25 = objc_msgSend_computeCommandEncoder(a3, v22, v23, v24);
  int32x4_t v127 = 0uLL;
  uint64_t v128 = 0;
  int32x4_t v125 = 0uLL;
  uint64_t v126 = 0;
  int32x4_t v123 = 0uLL;
  uint64_t v124 = 0;
  int32x4_t v121 = 0uLL;
  uint64_t v122 = 0;
  long long v119 = 0uLL;
  uint64_t v120 = 0;
  int32x4_t v117 = 0uLL;
  uint64_t v118 = 0;
  double v29 = (double)(unint64_t)objc_msgSend_width(v18, v26, v27, v28);
  uint64_t v33 = objc_msgSend_height(v18, v30, v31, v32);
  objc_msgSend__computeICPThreadgroupsWithSize_threadsPerThreadgroupForPass1_threadgroupsPerGridForPass1_threadsPerThreadgroupForPass2_threadgroupsPerGridForPass2_threadsPerThreadgroupForPass3_threadgroupsPerGridForPass3_(self, v34, (uint64_t)&v127, (uint64_t)&v125, &v123, &v121, &v119, &v117, v29, (double)(unint64_t)v33);
  int32x4_t v115 = 0uLL;
  uint64_t v116 = 0;
  objc_msgSend__computeICPThreadgroupsForDecimation_threadsPerThreadgroupForUniform_threadsPerThreadgroupForPass1_threadgroupsPerGridForPass1_(self, v35, a9, (uint64_t)&v115, &v127, &v125);
  int32x4_t v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  int32x4_t v112 = 0u;
  *(_OWORD *)&v110[8] = 0u;
  v109[0] = objc_msgSend_width(v18, v36, v37, v38);
  v109[1] = objc_msgSend_height(v18, v39, v40, v41);
  *(int32x4_t *)int v110 = vuzp1q_s32(v125, v115);
  int32x4_t v87 = *(int32x4_t *)(MEMORY[0x263EF89A0] + 16);
  int32x4_t v88 = *(int32x4_t *)MEMORY[0x263EF89A0];
  long long v111 = *MEMORY[0x263EF89A0];
  int32x4_t v112 = v87;
  int32x4_t v86 = *(int32x4_t *)(MEMORY[0x263EF89A0] + 32);
  int32x4_t v113 = v86;
  LODWORD(v114) = 0;
  objc_msgSend_setComputePipelineState_(v25, v42, (uint64_t)self->_computePipelines[6], v43);
  objc_msgSend_setTexture_atIndex_(v25, v44, (uint64_t)v18, 0);
  objc_msgSend_setTexture_atIndex_(v25, v45, (uint64_t)v21, 1);

  objc_msgSend_setTexture_atIndex_(v25, v46, (uint64_t)v20, 2);
  objc_msgSend_setTexture_atIndex_(v25, v47, (uint64_t)v19, 3);

  objc_msgSend_setTexture_atIndex_(v25, v48, (uint64_t)self->_icp_active_tg_indices_tex, 4);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v49, (uint64_t)self->_icp_reduc_buf, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v25, v50, (uint64_t)v109, 96, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v51, (uint64_t)self->_icp_param_tform_buf, 0, 2);
  objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v52, 1024, 0);
  int32x4_t v103 = v125;
  v104.i64[0] = v126;
  int32x4_t v95 = v127;
  *(void *)&long long v96 = v128;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v53, (uint64_t)&v103, (uint64_t)&v95);
  int32x4_t v57 = 0uLL;
  if (v125.i64[1] * v125.i64[0] >= 2uLL)
  {
    int32x4_t v103 = vuzp1q_s32(v125, v121);
    int32x4_t v104 = 0uLL;
    v104.i32[1] = 0;
    int32x4_t v105 = v88;
    int32x4_t v106 = v87;
    int32x4_t v107 = v86;
    int32x4_t v108 = 0uLL;
    objc_msgSend_setComputePipelineState_(v25, v54, (uint64_t)self->_computePipelines[7], v56);
    objc_msgSend_setBuffer_offset_atIndex_(v25, v58, (uint64_t)self->_icp_reduc_buf, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v25, v59, (uint64_t)&v103, 96, 1);
    objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v60, 5120, 0);
    objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v61, 1024, 1);
    int32x4_t v95 = v121;
    *(void *)&long long v96 = v122;
    int32x4_t v101 = v123;
    uint64_t v102 = v124;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v62, (uint64_t)&v95, (uint64_t)&v101);
    if (v121.i64[1] * v121.i64[0] >= 2uLL)
    {
      int32x4_t v95 = vuzp1q_s32(v121, v117);
      long long v96 = 0u;
      DWORD1(v96) = 0;
      int32x4_t v97 = v88;
      int32x4_t v98 = v87;
      int32x4_t v99 = v86;
      long long v100 = 0u;
      objc_msgSend_setComputePipelineState_(v25, v54, (uint64_t)self->_computePipelines[7], v56);
      objc_msgSend_setBuffer_offset_atIndex_(v25, v63, (uint64_t)self->_icp_reduc_buf, 0, 0);
      objc_msgSend_setBytes_length_atIndex_(v25, v64, (uint64_t)&v95, 96, 1);
      objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v65, 5120, 0);
      objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v66, 1024, 1);
      int32x4_t v101 = v117;
      uint64_t v102 = v118;
      long long v93 = v119;
      uint64_t v94 = v120;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v67, (uint64_t)&v101, (uint64_t)&v93);
    }
    int32x4_t v57 = 0uLL;
  }
  int32x4_t v107 = v57;
  int32x4_t v108 = v57;
  int32x4_t v105 = v57;
  int32x4_t v106 = v57;
  int32x4_t v103 = v57;
  int32x4_t v104 = v57;
  uint64_t v68 = objc_msgSend_width(v18, v54, v55, v56);
  *(float *)v108.i32 = (float)(unint64_t)(objc_msgSend_height(v18, v69, v70, v71) * v68) * a8;
  v95.i16[0] = a10;
  v95.i16[1] = a11 - 1;
  objc_msgSend_setComputePipelineState_(v25, v72, (uint64_t)self->_computePipelines[9], v73);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v74, (uint64_t)self->_icp_reduc_buf, 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v75, (uint64_t)self->_icp_param_tform_buf, 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v76, (uint64_t)self->_icp_param_tform_extra_buf, 0, 2);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v77, (uint64_t)self->_icp_loss_buf, 0, 3);
  objc_msgSend_setBytes_length_atIndex_(v25, v78, (uint64_t)&v103, 96, 4);
  objc_msgSend_setBytes_length_atIndex_(v25, v79, (uint64_t)&self->_flow_upper_most_scale, 4, 5);
  objc_msgSend_setBytes_length_atIndex_(v25, v80, (uint64_t)&v95, 4, 6);
  int64x2_t v91 = vdupq_n_s64(1uLL);
  uint64_t v92 = 1;
  int64x2_t v89 = v91;
  uint64_t v90 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v25, v81, (uint64_t)&v91, (uint64_t)&v89);
  objc_msgSend_endEncoding(v25, v82, v83, v84);

  return 0;
}

- (uint64_t)_setParametricTransformFromGyro:(uint64_t)a3
{
  uint64_t result = objc_msgSend__matrix3x3ToParametricTransform_(a1, a2, a3, a4);
  if (a1[546] >= 2)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = (uint64_t)&a1[20 * a1[500] + 2 * v7++];
      uint64_t result = objc_msgSend__resampleTransform_to_(a1, v6, *(void *)(v8 + 528), *(void *)(v8 + 536));
    }
    while (v7 < a1[546] - 1);
  }
  return result;
}

- (double)_matrix3x3ToParametricTransform:(__n128)a3
{
  uint64_t v4 = 0;
  __n128 v12 = a2;
  __n128 v13 = a3;
  __n128 v14 = a4;
  do
  {
    int v5 = 0;
    id v6 = &v12.n128_u64[2 * v4];
    long long v7 = *(_OWORD *)v6;
    do
    {
      long long v11 = v7;
      *(float *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3))) = *(float *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)))
                                                                                   / v14.n128_f32[2];
      long long v7 = v11;
      *((_DWORD *)v6 + 2) = DWORD2(v11);
      *id v6 = v7;
      ++v5;
    }
    while (v5 != 3);
    ++v4;
  }
  while (v4 != 3);
  if (*(_DWORD *)(a1 + 2064) == 8)
  {
    int8x16_t v8 = (int8x16_t)v12;
    __n128 v9 = v13;
    *(float *)(a1 + 2032) = v12.n128_f32[0] + -1.0;
    *(int8x8_t *)(a1 + 2036) = vext_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), 4uLL);
    *(_DWORD *)(a1 + 2044) = v9.n128_u32[0];
    *(float *)(a1 + 2048) = v9.n128_f32[1] + -1.0;
    *(_DWORD *)(a1 + 2052) = v9.n128_u32[2];
    *(void *)&long long v7 = v14.n128_u64[0];
    *(void *)(a1 + 2056) = v14.n128_u64[0];
  }
  return *(double *)&v7;
}

- (__n64)_parametricTransformToMatrix3x3
{
  if (*(_DWORD *)(a1 + 2064) == 8)
  {
    result.n64_f32[0] = *(float *)(a1 + 2032) + 1.0;
    result.n64_u32[1] = *(_DWORD *)(a1 + 2036);
    __asm { FMOV            V2.4S, #1.0 }
  }
  else
  {
    return (__n64)1065353216;
  }
  return result;
}

- (void)_resampleTransform:(id)a3 to:(id)a4
{
  if (self->_p.length_params == 8) {
    MEMORY[0x270F9A6D0](self, sel__resampleHomography_to_, a3, a4);
  }
}

- (void)_resampleHomography:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  float v11 = (float)(unint64_t)objc_msgSend_width(v6, v8, v9, v10);
  float32_t v30 = v11 / (float)(unint64_t)objc_msgSend_width(v7, v12, v13, v14);
  uint64_t v18 = objc_msgSend_height(v6, v15, v16, v17);

  uint64_t v22 = objc_msgSend_height(v7, v19, v20, v21);
  v23.f32[0] = (float)(unint64_t)v22;
  self->_p.params[2] = v30 * self->_p.params[2];
  __asm { FMOV            V1.2S, #1.0 }
  _D1.f32[0] = (float)(unint64_t)v18;
  v23.f32[1] = v30;
  float32x2_t v29 = vdiv_f32(_D1, v23);
  *(float32x2_t *)&self->_p.params[5] = vmul_f32(v29, *(float32x2_t *)&self->_p.params[5]);
  self->_p.params[7] = (float)(1.0 / v29.f32[0]) * self->_p.params[7];
}

- (void)_copyTransfromFromGPU
{
  int v5 = (float *)objc_msgSend_contents(self->_icp_param_tform_buf, a2, v2, v3);
  uint64_t length_params = self->_p.length_params;
  if ((int)length_params >= 1)
  {
    p_p = &self->_p;
    do
    {
      float v8 = *v5++;
      p_p->params[0] = v8;
      p_p = (parametric_transform *)((char *)p_p + 4);
      --length_params;
    }
    while (length_params);
  }
}

- (void)_copyTransfromToGPU
{
  int v5 = (float *)objc_msgSend_contents(self->_icp_param_tform_buf, a2, v2, v3);
  uint64_t length_params = self->_p.length_params;
  if ((int)length_params >= 1)
  {
    p_p = &self->_p;
    do
    {
      float v8 = p_p->params[0];
      p_p = (parametric_transform *)((char *)p_p + 4);
      *v5++ = v8;
      --length_params;
    }
    while (length_params);
  }
}

- (void)_resetLoss
{
  uint64_t v4 = objc_msgSend_contents(self->_icp_loss_buf, a2, v2, v3);
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_OWORD *)(v4 + 128) = 0u;
  *(_OWORD *)(v4 + 144) = 0u;
  *(void *)(v4 + 160) = 0;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (int)inputPixelFormat
{
  return self->_inputPixelFormat;
}

- (void)setInputPixelFormat:(int)a3
{
  self->_int inputPixelFormat = a3;
}

- (CGSize)ref_size
{
  double width = self->_ref_size.width;
  double height = self->_ref_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)aux_size
{
  double width = self->_aux_size.width;
  double height = self->_aux_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)nscales
{
  return self->_nscales;
}

- (int)streamFrameCount
{
  return self->_streamFrameCount;
}

- (int)nwarpings
{
  return self->_nwarpings;
}

- (void)setNwarpings:(int)a3
{
  self->_int nwarpings = a3;
}

- (int)nscales_icp
{
  return self->_nscales_icp;
}

- (int)warping_scheme_icp
{
  return self->_warping_scheme_icp;
}

- (void)setWarping_scheme_icp:(int)a3
{
  self->_warping_scheme_icp = a3;
}

- (int)decimation_factor_icp
{
  return self->_decimation_factor_icp;
}

- (void)setDecimation_factor_icp:(int)a3
{
  self->_decimation_factor_icp = a3;
}

- (int)flow_upper_most_scale
{
  return self->_flow_upper_most_scale;
}

- (void)setFlow_upper_most_scale:(int)a3
{
  self->_int flow_upper_most_scale = a3;
}

- (BOOL)useNonLocalRegularization
{
  return self->_useNonLocalRegularization;
}

- (void)setUseNonLocalRegularization:(BOOL)a3
{
  self->_useNonLocalRegularization = a3;
}

- (int)nlreg_radius
{
  return self->_nlreg_radius;
}

- (void)setNlreg_radius:(int)a3
{
  self->_nlreg_radius = a3;
}

- (int)nlreg_padding
{
  return self->_nlreg_padding;
}

- (void)setNlreg_padding:(int)a3
{
  self->_nlreg_padding = a3;
}

- (float)nlreg_sigma_l
{
  return self->_nlreg_sigma_l;
}

- (void)setNlreg_sigma_l:(float)a3
{
  self->_nlreg_sigma_l = a3;
}

- (float)nlreg_sigma_c
{
  return self->_nlreg_sigma_c;
}

- (void)setNlreg_sigma_c:(float)a3
{
  self->_nlreg_sigma_c = a3;
}

- (float)nlreg_sigma_w
{
  return self->_nlreg_sigma_w;
}

- (void)setNlreg_sigma_w:(float)a3
{
  self->_nlreg_sigma_w = a3;
}

- (parametric_transform)p
{
  long long v3 = *(_OWORD *)&self[56].length_params;
  *(_OWORD *)retstr->params = *(_OWORD *)&self[56].params[4];
  *(_OWORD *)&retstr->params[4] = v3;
  retstr->uint64_t length_params = LODWORD(self[57].params[3]);
  return self;
}

- (void)setP:(parametric_transform *)a3
{
  long long v3 = *(_OWORD *)a3->params;
  long long v4 = *(_OWORD *)&a3->params[4];
  self->_p.uint64_t length_params = a3->length_params;
  *(_OWORD *)&self->_p.params[4] = v4;
  *(_OWORD *)self->_p.params = v3;
}

- (void)setIsBidirectional:(BOOL)a3
{
  self->_isBidirectional = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icp_active_tg_indices_tex, 0);
  objc_storeStrong((id *)&self->_icp_derivatives_tg_sum, 0);
  objc_storeStrong((id *)&self->_w_icp_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_icp_reduc_buf, 0);
  objc_storeStrong((id *)&self->_icp_loss_buf, 0);
  objc_storeStrong((id *)&self->_icp_param_tform_extra_buf, 0);
  objc_storeStrong((id *)&self->_icp_param_tform_buf, 0);
  objc_storeStrong((id *)&self->_kpt_buf, 0);
  objc_storeStrong((id *)&self->_uv_bwd_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_uv_fwd_tex_user_ref, 0);
  for (uint64_t i = 0; i != -20; --i)
    objc_storeStrong((id *)&self->_uv_bwd_u32_alias_tex[1][i + 9], 0);
  for (uint64_t j = 0; j != -20; --j)
    objc_storeStrong((id *)&self->_uv_fwd_u32_alias_tex[1][j + 9], 0);
  for (uint64_t k = 0; k != -20; --k)
    objc_storeStrong((id *)&self->_uv_bwd_tex[1][k + 9], 0);
  for (uint64_t m = 0; m != -20; --m)
    objc_storeStrong((id *)&self->_uv_fwd_tex[1][m + 9], 0);
  for (uint64_t n = 0; n != -10; --n)
    objc_storeStrong((id *)&self->_w_tex[n + 9], 0);
  objc_storeStrong((id *)&self->_idt_buf, 0);
  for (iuint64_t i = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_Ixy_buf[ii + 1], 0);
  for (juint64_t j = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_Adiagb_buf[jj + 1], 0);
  for (kuint64_t k = 0; kk != -10; --kk)
    objc_storeStrong((id *)&self->_C1_tex[kk + 9], 0);
  for (muint64_t m = 0; mm != -10; --mm)
    objc_storeStrong((id *)&self->_C0_tex[mm + 9], 0);
  for (nuint64_t n = 0; nn != -10; --nn)
    objc_storeStrong((id *)&self->_G1_tex[nn + 9], 0);
  for (uint64_t i1 = 0; i1 != -10; --i1)
    objc_storeStrong((id *)&self->_G0_tex[i1 + 9], 0);
  for (uint64_t i2 = 0; i2 != -20; --i2)
    objc_storeStrong((id *)&self->_I_u32_alias_tex[1][i2 + 9], 0);
  for (uint64_t i3 = 0; i3 != -20; --i3)
    objc_storeStrong((id *)&self->_I_tex[1][i3 + 9], 0);
  for (uint64_t i4 = 192; i4 != 16; i4 -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i4), 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end