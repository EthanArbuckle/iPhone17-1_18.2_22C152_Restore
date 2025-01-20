@interface VNLKTOpticalFlowGPU
- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 in_pixelbuf:(__CVBuffer *)a4 I_idx:(int)a5 error:(id *)a6;
- (BOOL)_setupBufferAndReturnError:(id *)a3;
- (BOOL)_setupPipelinesReturnError:(id *)a3;
- (BOOL)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4 error:(id *)a5;
- (BOOL)estimateFlowStream:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)setOutputUV:(__CVBuffer *)a3 error:(id *)a4;
- (VNLKTOpticalFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 numScales:(int)a6 error:(id *)a7;
- (void)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (void)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (void)_computeOpticalFlow;
- (void)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7;
- (void)_doSolverWithCommandBuffer:(VNLKTOpticalFlowGPU *)self scale:(SEL)a2 scale_xy_inv:(id)a3 coeff:(int)a4 in_uv_tex:(id)a5 out_uv_tex:(id)a6 out_w_tex:(id)a7;
- (void)_downscale2XWithCommandBuffer:(id)a3 in_u32_alias_tex:(id)a4 out_u32_alias_tex:(id)a5;
- (void)_initMemory:(int)a3 height:(int)a4 numScales:(int)a5;
- (void)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4;
- (void)dealloc;
- (void)waitUntilCompleted;
@end

@implementation VNLKTOpticalFlowGPU

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uv_tex_user_ref, 0);
  for (uint64_t i = 19; i != -1; --i)
    objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][i], 0);
  for (uint64_t j = 19; j != -1; --j)
    objc_storeStrong((id *)&self->_uv_tex[0][j], 0);
  for (uint64_t k = 9; k != -1; --k)
    objc_storeStrong((id *)&self->_w_tex[k], 0);
  for (uint64_t m = 1; m != -1; --m)
    objc_storeStrong((id *)&self->_Ixy_buf[m], 0);
  for (uint64_t n = 1; n != -1; --n)
    objc_storeStrong((id *)&self->_Adiagb_buf[n], 0);
  for (iuint64_t i = 9; ii != -1; --ii)
    objc_storeStrong((id *)&self->_C1_tex[ii], 0);
  for (juint64_t j = 9; jj != -1; --jj)
    objc_storeStrong((id *)&self->_C0_tex[jj], 0);
  for (kuint64_t k = 9; kk != -1; --kk)
    objc_storeStrong((id *)&self->_G1_tex[kk], 0);
  for (muint64_t m = 9; mm != -1; --mm)
    objc_storeStrong((id *)&self->_G0_tex[mm], 0);
  for (nuint64_t n = 19; nn != -1; --nn)
    objc_storeStrong((id *)&self->_I_u32_alias_tex[0][nn], 0);
  for (uint64_t i1 = 19; i1 != -1; --i1)
    objc_storeStrong((id *)&self->_I_tex[0][i1], 0);
  for (uint64_t i2 = 8; i2 != -1; --i2)
    objc_storeStrong((id *)&self->_computePipelines[i2], 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_mtlContext, 0);
}

- (void)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v43 = 0;
  int v41 = [(VNLKTOpticalFlow *)self nlreg_radius];
  uint64_t v42 = [(VNLKTOpticalFlow *)self nlreg_padding];
  [(VNLKTOpticalFlow *)self nlreg_sigma_l];
  float v18 = v17;
  [(VNLKTOpticalFlow *)self nlreg_sigma_c];
  float v20 = v19;
  [(VNLKTOpticalFlow *)self nlreg_sigma_c];
  unsigned int v38 = v21;
  [(VNLKTOpticalFlow *)self nlreg_sigma_w];
  *(float *)&long long v22 = 1.0 / (float)(v18 + v18);
  __asm { FMOV            V3.2S, #1.0 }
  *((float *)&v22 + 1) = 1.0 / (float)(v20 + v20);
  *((float32x2_t *)&v22 + 1) = vdiv_f32(_D3, vadd_f32((float32x2_t)__PAIR64__(v23, v38), (float32x2_t)__PAIR64__(v23, v38)));
  long long v44 = v22;
  v29 = [v12 computeCommandEncoder];
  computePipelines = self->_computePipelines;
  [v29 setComputePipelineState:self->_computePipelines[8]];
  [v29 setTexture:v13 atIndex:0];
  [v29 setTexture:v14 atIndex:1];
  [v29 setTexture:v15 atIndex:2];
  [v29 setTexture:v16 atIndex:3];
  [v29 setBytes:&v41 length:32 atIndex:0];
  int v31 = [(MTLComputePipelineState *)self->_computePipelines[8] threadExecutionWidth];
  LODWORD(computePipelines) = [(MTLComputePipelineState *)computePipelines[8] maxTotalThreadsPerThreadgroup];
  int v32 = [v13 width];
  int v33 = [v13 height];
  int v34 = (int)computePipelines / v31;
  if (v32 >= 0) {
    int v35 = v32;
  }
  else {
    int v35 = v32 + 1;
  }
  int v36 = (v31 + (v35 >> 1) - 1) / v31;
  if (v33 >= 0) {
    int v37 = v33;
  }
  else {
    int v37 = v33 + 1;
  }
  v40[0] = v36;
  v40[1] = (v34 + (v37 >> 1) - 1) / v34;
  v40[2] = 1;
  v39[0] = v31;
  v39[1] = v34;
  v39[2] = 1;
  [v29 dispatchThreadgroups:v40 threadsPerThreadgroup:v39];
  [v29 endEncoding];
}

- (void)_doSolverWithCommandBuffer:(VNLKTOpticalFlowGPU *)self scale:(SEL)a2 scale_xy_inv:(id)a3 coeff:(int)a4 in_uv_tex:(id)a5 out_uv_tex:(id)a6 out_w_tex:(id)a7
{
  uint64_t v12 = v8;
  uint64_t v13 = v7;
  id v16 = a3;
  id v17 = a5;
  id v32 = a6;
  id v31 = a7;
  int maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  int32x2_t v19 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_pyramid_size[a4]));
  __int32 v20 = v19.i32[0] - 1;
  __int32 v30 = v19.i32[1];
  v39[0] = v19;
  v39[1] = ((v19.i32[0] - 1 + maxThreadExecutionWidth) / maxThreadExecutionWidth * maxThreadExecutionWidth);
  v39[2] = v13;
  void v39[3] = v12;
  unsigned int v21 = [v16 computeCommandEncoder];
  computePipelines = (id *)self->_computePipelines;
  [v21 setComputePipelineState:self->_computePipelines[5]];
  [v21 setTexture:v17 atIndex:0];
  [v21 setTexture:self->_G0_tex[a4] atIndex:1];
  [v21 setTexture:self->_G1_tex[a4] atIndex:2];
  [v21 setTexture:self->_C0_tex[a4] atIndex:3];
  [v21 setTexture:self->_C1_tex[a4] atIndex:4];
  Adiagb_buf = self->_Adiagb_buf;
  [v21 setBuffer:self->_Adiagb_buf[0] offset:0 atIndex:0];
  Ixy_buf = self->_Ixy_buf;
  [v21 setBuffer:self->_Ixy_buf[0] offset:0 atIndex:1];
  [v21 setBytes:v39 length:32 atIndex:2];
  LODWORD(self) = [(MTLComputePipelineState *)self->_computePipelines[5] threadExecutionWidth];
  int v25 = [computePipelines[5] maxTotalThreadsPerThreadgroup];
  v38[0] = (v20 + (int)self) / (int)self;
  v38[1] = (v30 - 1 + v25 / (int)self) / (v25 / (int)self);
  v38[2] = 1;
  v37[0] = (int)self;
  v37[1] = v25 / (int)self;
  v37[2] = 1;
  [v21 dispatchThreadgroups:v38 threadsPerThreadgroup:v37];
  [v21 endEncoding];

  v26 = [v16 computeCommandEncoder];
  [v26 setComputePipelineState:computePipelines[6]];
  [v26 setBuffer:*Adiagb_buf offset:0 atIndex:0];
  [v26 setBuffer:*Ixy_buf offset:0 atIndex:1];
  [v26 setBuffer:Adiagb_buf[1] offset:0 atIndex:2];
  [v26 setBuffer:Ixy_buf[1] offset:0 atIndex:3];
  [v26 setBytes:v39 length:32 atIndex:4];
  LODWORD(self) = [computePipelines[6] threadExecutionWidth];
  int v27 = [computePipelines[6] maxTotalThreadsPerThreadgroup];
  v36[0] = (v20 + (int)self) / (int)self;
  v36[1] = (v30 - 1 + v27 / (int)self) / (v27 / (int)self);
  v36[2] = 1;
  v35[0] = (int)self;
  v35[1] = v27 / (int)self;
  v35[2] = 1;
  [v26 dispatchThreadgroups:v36 threadsPerThreadgroup:v35];
  [v26 endEncoding];

  v28 = [v16 computeCommandEncoder];
  [v28 setComputePipelineState:computePipelines[7]];
  [v28 setBuffer:Adiagb_buf[1] offset:0 atIndex:0];
  [v28 setBuffer:Ixy_buf[1] offset:0 atIndex:1];
  [v28 setTexture:v17 atIndex:0];
  [v28 setTexture:v32 atIndex:1];
  [v28 setTexture:v31 atIndex:2];
  [v28 setBytes:v39 length:32 atIndex:2];
  LODWORD(self) = [computePipelines[7] threadExecutionWidth];
  int v29 = [computePipelines[7] maxTotalThreadsPerThreadgroup];
  v34[0] = (v20 + (int)self) / (int)self;
  v34[1] = (v30 - 1 + v29 / (int)self) / (v29 / (int)self);
  v34[2] = 1;
  v33[0] = (int)self;
  v33[1] = v29 / (int)self;
  v33[2] = 1;
  [v28 dispatchThreadgroups:v34 threadsPerThreadgroup:v33];
  [v28 endEncoding];
}

- (void)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 computeCommandEncoder];
  computePipelines = self->_computePipelines;
  [v10 setComputePipelineState:self->_computePipelines[4]];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  LODWORD(self) = [(MTLComputePipelineState *)self->_computePipelines[4] threadExecutionWidth];
  LODWORD(computePipelines) = [(MTLComputePipelineState *)computePipelines[4] maxTotalThreadsPerThreadgroup];
  v13[0] = (int)(self + [v8 width] - 1) / (int)self;
  v13[1] = (int)((int)computePipelines / (int)self + [v8 height] - 1)
         / ((int)computePipelines
          / (int)self);
  v13[2] = 1;
  v12[0] = (int)self;
  v12[1] = (int)computePipelines / (int)self;
  v12[2] = 1;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:v12];
  [v10 endEncoding];
}

- (void)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 computeCommandEncoder];
  computePipelines = self->_computePipelines;
  [v10 setComputePipelineState:self->_computePipelines[3]];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  LODWORD(self) = [(MTLComputePipelineState *)self->_computePipelines[3] threadExecutionWidth];
  LODWORD(computePipelines) = [(MTLComputePipelineState *)computePipelines[3] maxTotalThreadsPerThreadgroup];
  v13[0] = (int)(self + [v8 width] - 1) / (int)self;
  v13[1] = (int)((int)computePipelines / (int)self + [v8 height] - 1)
         / ((int)computePipelines
          / (int)self);
  v13[2] = 1;
  v12[0] = (int)self;
  v12[1] = (int)computePipelines / (int)self;
  v12[2] = 1;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:v12];
  [v10 endEncoding];
}

- (void)_downscale2XWithCommandBuffer:(id)a3 in_u32_alias_tex:(id)a4 out_u32_alias_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 computeCommandEncoder];
  computePipelines = self->_computePipelines;
  [v10 setComputePipelineState:self->_computePipelines[2]];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  LODWORD(self) = [(MTLComputePipelineState *)self->_computePipelines[2] threadExecutionWidth];
  LODWORD(computePipelines) = [(MTLComputePipelineState *)computePipelines[2] maxTotalThreadsPerThreadgroup];
  v13[0] = (int)(self + [v9 width] - 1) / (int)self;
  v13[1] = (int)((int)computePipelines / (int)self + [v9 height] - 1)
         / ((int)computePipelines
          / (int)self);
  v13[2] = 1;
  v12[0] = (int)self;
  v12[1] = (int)computePipelines / (int)self;
  v12[2] = 1;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:v12];
  [v10 endEncoding];
}

- (void)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 computeCommandEncoder];
  [v7 setComputePipelineState:self->_computePipelines[1]];
  [v7 setTexture:v6 atIndex:0];
  int v8 = [(MTLComputePipelineState *)self->_computePipelines[1] threadExecutionWidth];
  int v9 = [(MTLComputePipelineState *)self->_computePipelines[1] maxTotalThreadsPerThreadgroup];
  v11[0] = (v8 + [(VNLKTOpticalFlow *)self width] - 1) / v8;
  v11[1] = (v9 / v8 + [(VNLKTOpticalFlow *)self height] - 1) / (v9 / v8);
  v11[2] = 1;
  v10[0] = v8;
  v10[1] = v9 / v8;
  v10[2] = 1;
  [v7 dispatchThreadgroups:v11 threadsPerThreadgroup:v10];
  [v7 endEncoding];
}

- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 in_pixelbuf:(__CVBuffer *)a4 I_idx:(int)a5 error:(id *)a6
{
  id v10 = a3;
  int v11 = [(VNLKTOpticalFlow *)self width];
  int v12 = [(VNLKTOpticalFlow *)self height];
  uint64_t v13 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](self->_mtlContext, a4, 80, a6);
  if (v13)
  {
    id v14 = [v10 computeCommandEncoder];
    [v14 setComputePipelineState:self->_computePipelines[0]];
    [v14 setTexture:v13 atIndex:0];
    [v14 setTexture:self->_I_tex[a5][0] atIndex:1];
    int v15 = [(MTLComputePipelineState *)self->_computePipelines[0] threadExecutionWidth];
    int v16 = [(MTLComputePipelineState *)self->_computePipelines[0] maxTotalThreadsPerThreadgroup];
    v23[0] = (v11 + v15 - 1) / v15;
    v23[1] = (v12 + v16 / v15 - 1) / (v16 / v15);
    v23[2] = 1;
    v22[0] = v15;
    v22[1] = v16 / v15;
    v22[2] = 1;
    [v14 dispatchThreadgroups:v23 threadsPerThreadgroup:v22];
    [v14 endEncoding];

    int v17 = [(VNLKTOpticalFlow *)self numScales];
    if (v17 >= 2)
    {
      int v18 = a5;
      uint64_t v19 = v17 - 1;
      __int32 v20 = &self->_I_u32_alias_tex[v18][1];
      do
      {
        [(VNLKTOpticalFlowGPU *)self _downscale2XWithCommandBuffer:v10 in_u32_alias_tex:*(v20 - 1) out_u32_alias_tex:*v20];
        ++v20;
        --v19;
      }
      while (v19);
    }
  }

  return v13 != 0;
}

- (void)_computeOpticalFlow
{
  int v3 = [(VNLKTOpticalFlow *)self numScales];
  int v4 = [(VNLKTOpticalFlow *)self numWarpings];
  BOOL v5 = [(VNLKTOpticalFlow *)self useNonLocalRegularization];
  _VF = __OFSUB__(v3, 1);
  uint64_t v7 = (v3 - 1);
  if ((int)v7 < 0 == _VF)
  {
    char v8 = v5;
    int v9 = 0;
    uint64_t v10 = 0;
    I_tex = self->_I_tex;
    char v40 = !v5;
    __asm
    {
      FMOV            V10.2S, #1.0
      FMOV            V11.2S, #-1.0
    }
    uint64_t v15 = v7;
    int v16 = v7;
    uint64_t v36 = v7;
    do
    {
      v39 = I_tex[self->_current_frame_index][v15];
      unsigned int v38 = I_tex[self->_current_frame_index ^ 1][v15];
      double v17 = _D10;
      double v18 = _D10;
      if (v15 != v7)
      {
        uint64_t v19 = (float64x2_t *)&self->_pyramid_size[v15];
        float32x2_t v20 = vcvt_f32_f64(*v19);
        float32x2_t v21 = vcvt_f32_f64(v19[1]);
        double v18 = COERCE_DOUBLE(vdiv_f32(v20, v21));
        double v17 = COERCE_DOUBLE(vdiv_f32(vadd_f32(v21, _D11), vadd_f32(v20, _D11)));
      }
      id v41 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

      long long v22 = objc_msgSend(NSString, "stringWithFormat:", @"LKT:ComputeFlow level %d", v15);
      [v41 setLabel:v22];

      -[VNLKTOpticalFlowGPU _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:");
      -[VNLKTOpticalFlowGPU _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:");
      -[VNLKTOpticalFlowGPU _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:");
      -[VNLKTOpticalFlowGPU _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:");
      int v23 = v4;
      if (v4 < 1)
      {
        int v25 = 0;
        int v29 = 0;
      }
      else
      {
        v24 = 0;
        int v25 = 0;
        do
        {
          if (v15) {
            _ZF = 0;
          }
          else {
            _ZF = v23 == 1;
          }
          if (_ZF) {
            char v27 = v8;
          }
          else {
            char v27 = 1;
          }
          if (v27) {
            p_uv_tex_user_ref = &self->_uv_tex[v10 ^ 1][v15];
          }
          else {
            p_uv_tex_user_ref = &self->_uv_tex_user_ref;
          }
          int v29 = *p_uv_tex_user_ref;

          char v30 = v40;
          if (v23 != 1) {
            char v30 = 1;
          }
          if ((v30 & 1) == 0)
          {
            id v31 = self->_w_tex[v15];

            int v25 = v31;
          }
          [(VNLKTOpticalFlowGPU *)self _doSolverWithCommandBuffer:v41 scale:v15 scale_xy_inv:self->_uv_tex[v10][v16] coeff:v29 in_uv_tex:v25 out_uv_tex:v17 out_w_tex:v18];
          v10 ^= 1uLL;
          v24 = v29;
          double v18 = _D10;
          double v17 = _D10;
          int v16 = v15;
          --v23;
        }
        while (v23);
        int v16 = v15;
      }
      uint64_t v7 = v36;
      id v32 = v41;
      if (v8)
      {
        if (v15) {
          int v33 = &self->_uv_tex[v10 ^ 1][v15];
        }
        else {
          int v33 = &self->_uv_tex_user_ref;
        }
        int v34 = *v33;

        [(VNLKTOpticalFlowGPU *)self _doNLRegularizationWithCommandBuffer:v41 in_uv_tex:self->_uv_u32_alias_tex[v10][v15] join_tex:self->_I_u32_alias_tex[self->_current_frame_index][v15] w_tex:v25 out_uv_tex:v34];
        v10 ^= 1uLL;
        id v32 = v41;
      }
      else
      {
        int v34 = v29;
      }
      [v32 commit];

      int v9 = v41;
    }
    while (v15-- > 0);
  }
}

- (BOOL)_setupBufferAndReturnError:(id *)a3
{
  int maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  if (!maxThreadExecutionWidth) {
    return 0;
  }
  int v6 = [(VNLKTOpticalFlow *)self width];
  int v7 = [(VNLKTOpticalFlow *)self height];
  int v8 = [(VNLKTOpticalFlow *)self numScales];
  size_t v9 = v6;
  size_t v10 = v7;
  int v11 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 843264104, a3);
  self->_G0_pxbuf = v11;
  if (!v11) {
    return 0;
  }
  int v74 = v8;
  int v12 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 843264104, a3);
  self->_G1_pxbuf = v12;
  if (!v12) {
    return 0;
  }
  uint64_t v13 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 1380411457, a3);
  self->_C0_pxbuf = v13;
  if (!v13) {
    return 0;
  }
  id v14 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 1380411457, a3);
  self->_C1_pxbuf = v14;
  if (!v14) {
    return 0;
  }
  uint64_t v15 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 1278226536, a3);
  self->_w_pxbuf = v15;
  if (!v15) {
    return 0;
  }
  int v16 = (maxThreadExecutionWidth + v6 - 1) / maxThreadExecutionWidth * maxThreadExecutionWidth;
  mtlContext = self->_mtlContext;
  int v72 = v6;
  if (mtlContext) {
    mtlContext = (VNMetalContext *)mtlContext->_device;
  }
  v75 = mtlContext;
  uint64_t v18 = 0;
  int v70 = v7;
  uint64_t v19 = 8 * v16 * v7;
  uint64_t v20 = 2 * v16 * v7;
  char v21 = 1;
  do
  {
    char v22 = v21;
    int v23 = (MTLBuffer *)[(VNMetalContext *)v75 newBufferWithLength:v19 options:0];
    v24 = self->_Adiagb_buf[v18];
    self->_Adiagb_buf[v18] = v23;

    if (!self->_Adiagb_buf[v18]
      || (int v25 = (MTLBuffer *)[(VNMetalContext *)v75 newBufferWithLength:v20 options:0], v26 = self->_Ixy_buf[v18], self->_Ixy_buf[v18] = v25, v26, !self->_Ixy_buf[v18]))
    {
      if (a3)
      {
        +[VNError errorForMemoryAllocationFailure];
        BOOL v68 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    char v27 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v9, v10, 843264104, a3);
    self->_uv_pxbuf[v18] = v27;
    if (!v27) {
      goto LABEL_34;
    }
    char v21 = 0;
    uint64_t v18 = 1;
  }
  while ((v22 & 1) != 0);
  int v28 = v72;
  if (v74 >= 1)
  {
    uint64_t v29 = 0;
    pyramid_size = self->_pyramid_size;
    int v31 = v70;
LABEL_16:
    double v32 = (double)v28;
    int v71 = v31;
    double v33 = (double)v31;
    p_width = &pyramid_size[v29].width;
    double *p_width = (double)v28;
    p_width[1] = (double)v31;
    -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_G0_pxbuf, 65, a3, (double)v28, (double)v31);
    int v35 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = self->_G0_tex[v29];
    self->_G0_tex[v29] = v35;

    if (self->_G0_tex[v29])
    {
      -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_G1_pxbuf, 65, a3, (double)v28, (double)v31);
      int v37 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      unsigned int v38 = self->_G1_tex[v29];
      self->_G1_tex[v29] = v37;

      if (self->_G1_tex[v29])
      {
        -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_C0_pxbuf, 115, a3, (double)v28, (double)v31);
        v39 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        char v40 = self->_C0_tex[v29];
        self->_C0_tex[v29] = v39;

        if (self->_C0_tex[v29])
        {
          -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_C1_pxbuf, 115, a3, (double)v28, (double)v31);
          id v41 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          uint64_t v42 = self->_C1_tex[v29];
          self->_C1_tex[v29] = v41;

          if (self->_C1_tex[v29])
          {
            int v73 = v28;
            -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_w_pxbuf, 25, a3, (double)v28, (double)v31);
            int v43 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
            long long v44 = self->_w_tex[v29];
            self->_w_tex[v29] = v43;

            if (self->_w_tex[v29])
            {
              uint64_t v45 = 0;
              char v46 = 1;
              while (1)
              {
                char v47 = v46;
                uint64_t v48 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_uv_pxbuf[v45], 65, a3, v32, v33);
                v49 = self->_uv_tex[v45];
                v50 = v49[v29];
                v49[v29] = (MTLTexture *)v48;

                v51 = v49[v29];
                if (!v51) {
                  break;
                }
                uint64_t v52 = [(MTLTexture *)v51 newTextureViewWithPixelFormat:53];
                v53 = self->_uv_u32_alias_tex[v45];
                v54 = v53[v29];
                v53[v29] = (MTLTexture *)v52;

                char v46 = 0;
                uint64_t v45 = 1;
                if ((v47 & 1) == 0)
                {
                  v55 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:70 width:v73 height:v71 mipmapped:0];
                  [v55 setUsage:19];
                  v56 = (MTLTexture *)[(VNMetalContext *)v75 newTextureWithDescriptor:v55];
                  v57 = self->_I_tex[0][v29];
                  self->_I_tex[0][v29] = v56;

                  uint64_t v58 = [(VNMetalContext *)v75 newTextureWithDescriptor:v55];
                  v59 = (char *)self->_I_tex + 8 * v29;
                  v60 = (void *)*((void *)v59 + 10);
                  v59 += 80;
                  *(void *)v59 = v58;

                  v61 = (MTLTexture *)[(MTLTexture *)self->_I_tex[0][v29] newTextureViewWithPixelFormat:53];
                  v62 = self->_I_u32_alias_tex[0][v29];
                  self->_I_u32_alias_tex[0][v29] = v61;

                  uint64_t v63 = [*(id *)v59 newTextureViewWithPixelFormat:53];
                  v64 = (char *)self->_I_u32_alias_tex + 8 * v29;
                  v65 = (void *)*((void *)v64 + 10);
                  *((void *)v64 + 10) = v63;

                  int v66 = v73 + 2;
                  if (v73 >= -1) {
                    int v66 = v73 + 1;
                  }
                  int v67 = v71 + 2;
                  if (v71 >= -1) {
                    int v67 = v71 + 1;
                  }
                  int v28 = ((v66 >> 1) & 1) + (v66 >> 1);
                  int v31 = ((v67 >> 1) & 1) + (v67 >> 1);

                  ++v29;
                  BOOL v68 = 1;
                  pyramid_size = self->_pyramid_size;
                  if (v29 != v74) {
                    goto LABEL_16;
                  }
                  goto LABEL_35;
                }
              }
            }
          }
        }
      }
    }
LABEL_34:
    BOOL v68 = 0;
    goto LABEL_35;
  }
  BOOL v68 = 1;
LABEL_35:

  return v68;
}

- (BOOL)_setupPipelinesReturnError:(id *)a3
{
  int v4 = -[VNMetalContext libraryReturnError:]((os_unfair_lock_s *)self->_mtlContext, (uint64_t)a3);
  if (v4)
  {
    mtlContext = self->_mtlContext;
    if (mtlContext) {
      mtlContext = (VNMetalContext *)mtlContext->_device;
    }
    int v6 = mtlContext;
    uint64_t v7 = 0;
    int v8 = 0;
    do
    {
      size_t v9 = (void *)[[NSString alloc] initWithUTF8String:kKernelNames[v7]];
      size_t v10 = (void *)[v4 newFunctionWithName:v9];

      int v11 = (void *)[(VNMetalContext *)v6 newComputePipelineStateWithFunction:v10 error:0];
      objc_storeStrong((id *)&self->_computePipelines[v7], v11);
      unint64_t v12 = [v11 threadExecutionWidth];
      unint64_t maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
      if (v12 > maxThreadExecutionWidth) {
        unint64_t maxThreadExecutionWidth = [v11 threadExecutionWidth];
      }
      self->_unint64_t maxThreadExecutionWidth = maxThreadExecutionWidth;

      ++v7;
      int v8 = v10;
    }
    while (v7 != 9);
  }
  return v4 != 0;
}

- (void)_initMemory:(int)a3 height:(int)a4 numScales:(int)a5
{
  self->_unint64_t maxThreadExecutionWidth = 0;
  self->_G0_pxbuf = 0;
  self->_G1_pxbuf = 0;
  self->_C0_pxbuf = 0;
  self->_C1_pxbuf = 0;
  self->_w_pxbuf = 0;
  uv_tex_user_ref = self->_uv_tex_user_ref;
  self->_uv_tex_user_ref = 0;

  self->_uv_pxbuf[0] = 0;
  self->_uv_pxbuf[1] = 0;
}

- (BOOL)estimateFlowStream:(__CVBuffer *)a3 error:(id *)a4
{
  if ([(VNLKTOpticalFlow *)self isValid])
  {
    int v7 = [(VNLKTOpticalFlow *)self numScales];
    int v8 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v8 setLabel:@"LKT::Pyramid"];
    [(VNLKTOpticalFlowGPU *)self _zeroFlowWithCommandBuffer:v8 uv_tex:self->_uv_pxbuf[v7 + 1]];
    if ([(VNLKTOpticalFlowGPU *)self _createImagePyramidWithCommandBuffer:v8 in_pixelbuf:a3 I_idx:self->_current_frame_index error:a4])
    {
      [v8 commit];

      self->_current_frame_index ^= 1u;
      [(VNLKTOpticalFlowGPU *)self _computeOpticalFlow];
      return 1;
    }
  }
  else if (a4)
  {
    id v10 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Optical flow estimation invalid state"];
    BOOL result = 0;
    *a4 = v10;
    return result;
  }
  return 0;
}

- (BOOL)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4 error:(id *)a5
{
  if ([(VNLKTOpticalFlow *)self isValid])
  {
    int v9 = [(VNLKTOpticalFlow *)self numScales];
    id v10 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v10 setLabel:@"LKT::Pyramid"];
    [(VNLKTOpticalFlowGPU *)self _zeroFlowWithCommandBuffer:v10 uv_tex:self->_uv_pxbuf[v9 + 1]];
    if ([(VNLKTOpticalFlowGPU *)self _createImagePyramidWithCommandBuffer:v10 in_pixelbuf:a3 I_idx:0 error:a5]&& [(VNLKTOpticalFlowGPU *)self _createImagePyramidWithCommandBuffer:v10 in_pixelbuf:a4 I_idx:1 error:a5])
    {
      [v10 commit];

      self->_current_frame_index = 0;
      [(VNLKTOpticalFlowGPU *)self _computeOpticalFlow];
      return 1;
    }
  }
  else if (a5)
  {
    id v12 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Optical flow estimation invalid state"];
    BOOL result = 0;
    *a5 = v12;
    return result;
  }
  return 0;
}

- (BOOL)setOutputUV:(__CVBuffer *)a3 error:(id *)a4
{
  if (!a3)
  {
    uv_tex_user_ref = self->_uv_tex_user_ref;
    self->_uv_tex_user_ref = 0;

    [(VNLKTOpticalFlow *)self setIsValid:0];
    return 1;
  }
  if (!-[VNLKTOpticalFlow _validateOutputImage:error:](self, "_validateOutputImage:error:")) {
    return 0;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 843264104)
  {
    uint64_t v8 = 65;
    goto LABEL_8;
  }
  if (PixelFormatType != 843264102)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Unhandled metal pixel format"];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    return 0;
  }
  uint64_t v8 = 105;
LABEL_8:
  int v11 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, a3, v8, a4, self->_pyramid_size[0].width, self->_pyramid_size[0].height);
  BOOL v10 = v11 != 0;
  if (v11)
  {
    objc_storeStrong((id *)&self->_uv_tex_user_ref, v11);
    [(VNLKTOpticalFlow *)self setIsValid:1];
  }
  else if (a4)
  {
    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Could not bind pixel buffer to texture"];
  }

  return v10;
}

- (void)waitUntilCompleted
{
  id v2 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v2 setLabel:@"LKT:waitUntilCompleted"];
  [v2 commit];
  [v2 waitUntilCompleted];
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_G0_pxbuf);
  CVPixelBufferRelease(self->_G1_pxbuf);
  CVPixelBufferRelease(self->_C0_pxbuf);
  CVPixelBufferRelease(self->_C1_pxbuf);
  CVPixelBufferRelease(self->_w_pxbuf);
  CVPixelBufferRelease(self->_uv_pxbuf[0]);
  CVPixelBufferRelease(self->_uv_pxbuf[1]);
  v3.receiver = self;
  v3.super_class = (Class)VNLKTOpticalFlowGPU;
  [(VNLKTOpticalFlowGPU *)&v3 dealloc];
}

- (VNLKTOpticalFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 numScales:(int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v13 = (os_unfair_lock_s *)a3;
  v20.receiver = self;
  v20.super_class = (Class)VNLKTOpticalFlowGPU;
  id v14 = [(VNLKTOpticalFlow *)&v20 initWithWidth:v10 height:v9 numScales:v8];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_5;
  }
  v14->_current_frame_index = 0;
  objc_storeStrong((id *)&v14->_mtlContext, a3);
  uint64_t v16 = -[VNMetalContext commandQueueReturnError:](v13, a7);
  commandQueue = v15->_commandQueue;
  v15->_commandQueue = (MTLCommandQueue *)v16;

  if (!v15->_commandQueue) {
    goto LABEL_6;
  }
  [(VNLKTOpticalFlowGPU *)v15 _initMemory:v10 height:v9 numScales:v8];
  if ([(VNLKTOpticalFlowGPU *)v15 _setupPipelinesReturnError:a7]
    && [(VNLKTOpticalFlowGPU *)v15 _setupBufferAndReturnError:a7])
  {
LABEL_5:
    uint64_t v18 = v15;
  }
  else
  {
LABEL_6:
    uint64_t v18 = 0;
  }

  return v18;
}

@end