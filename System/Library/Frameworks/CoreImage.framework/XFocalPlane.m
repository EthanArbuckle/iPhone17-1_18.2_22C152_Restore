@interface XFocalPlane
- ($599F175E452E455E49EC8439362DB023)config;
- (MTLBuffer)minMaxAtomic_buf;
- (MTLBuffer)minMaxResult_buf;
- (MTLBuffer)zeroShiftResult_buf;
- (XFocalPlane)initWithDevice:(id)a3 library:(id)a4;
- (int)_compileShadersWithLibrary:(id)a3;
- (int)allocateResources;
- (int)encodeDisparityRefinementPreprocessingOn:(id)a3 alphaTexture:(id)a4 inputDisparityTexture:(id)a5 outputDisparityTexture:(id)a6 configuration:(id *)a7;
- (int)encodeFocalPlaneCalcOn:(id)a3 disparityTexture:(id)a4;
- (int)encodeMinMaxOn:(id)a3 inputTexture:(id)a4;
- (void)dealloc;
- (void)releaseResources;
- (void)setConfig:(id *)a3;
@end

@implementation XFocalPlane

- (XFocalPlane)initWithDevice:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XFocalPlane;
  v9 = [(XFocalPlane *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
  }

  return v10;
}

- (int)allocateResources
{
  int v3 = [(XFocalPlane *)self _compileShadersWithLibrary:self->_library];
  v4 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:8 options:32];
  minMaxAtomic_buf = self->_minMaxAtomic_buf;
  self->_minMaxAtomic_buf = v4;

  if (!self->_minMaxAtomic_buf) {
    goto LABEL_7;
  }
  v6 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:16 options:32];
  minMaxResult_buf = self->_minMaxResult_buf;
  self->_minMaxResult_buf = v6;

  if (!self->_minMaxResult_buf
    || (id v8 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:4 options:0], zeroShiftResult_buf = self->_zeroShiftResult_buf, self->_zeroShiftResult_buf = v8, zeroShiftResult_buf, !self->_zeroShiftResult_buf))
  {
LABEL_7:
    int v3 = -12786;
    goto LABEL_5;
  }
  if (v3) {
LABEL_5:
  }
    [(XFocalPlane *)self releaseResources];
  return v3;
}

- (void)dealloc
{
  [(XFocalPlane *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)XFocalPlane;
  [(XFocalPlane *)&v3 dealloc];
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 newFunctionWithName:@"disparityRefinementPreprocessing"];
  v6 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  disparityRefinementPreprocessingKernel = self->_disparityRefinementPreprocessingKernel;
  self->_disparityRefinementPreprocessingKernel = v6;

  if (!self->_disparityRefinementPreprocessingKernel) {
    goto LABEL_8;
  }
  id v8 = (void *)[v4 newFunctionWithName:@"fpr_slm_shiftmap_calcminmax0"];

  v9 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v8 error:0];
  minMax0_kernel = self->_minMax0_kernel;
  self->_minMax0_kernel = v9;

  if (!self->_minMax0_kernel) {
    goto LABEL_9;
  }
  v5 = (void *)[v4 newFunctionWithName:@"fpr_slm_shiftmap_calcminmax1"];

  v11 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  minMax1_kernel = self->_minMax1_kernel;
  self->_minMax1_kernel = v11;

  if (!self->_minMax1_kernel)
  {
LABEL_8:
    int v17 = -12786;
    goto LABEL_7;
  }
  id v8 = (void *)[v4 newFunctionWithName:@"fpr_slm_shiftmap_calcminmax2"];

  v13 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v8 error:0];
  minMax2_kernel = self->_minMax2_kernel;
  self->_minMax2_kernel = v13;

  if (!self->_minMax2_kernel)
  {
LABEL_9:
    int v17 = -12786;
    v5 = v8;
    goto LABEL_7;
  }
  v5 = (void *)[v4 newFunctionWithName:@"fpr_slm_calc"];

  v15 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  calc_kernel = self->_calc_kernel;
  self->_calc_kernel = v15;

  if (!self->_calc_kernel) {
    goto LABEL_8;
  }
  int v17 = 0;
LABEL_7:

  return v17;
}

- (void)releaseResources
{
  disparityRefinementPreprocessingKernel = self->_disparityRefinementPreprocessingKernel;
  self->_disparityRefinementPreprocessingKernel = 0;

  minMax0_kernel = self->_minMax0_kernel;
  self->_minMax0_kernel = 0;

  minMax1_kernel = self->_minMax1_kernel;
  self->_minMax1_kernel = 0;

  minMax2_kernel = self->_minMax2_kernel;
  self->_minMax2_kernel = 0;

  calc_kernel = self->_calc_kernel;
  self->_calc_kernel = 0;

  minMaxAtomic_buf = self->_minMaxAtomic_buf;
  self->_minMaxAtomic_buf = 0;

  minMaxResult_buf = self->_minMaxResult_buf;
  self->_minMaxResult_buf = 0;

  zeroShiftResult_buf = self->_zeroShiftResult_buf;
  self->_zeroShiftResult_buf = 0;
}

- (int)encodeDisparityRefinementPreprocessingOn:(id)a3 alphaTexture:(id)a4 inputDisparityTexture:(id)a5 outputDisparityTexture:(id)a6 configuration:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  self->_config.zeroShiftPercentile = a7->var0;
  int v16 = [(XFocalPlane *)self encodeFocalPlaneCalcOn:v12 disparityTexture:v14];
  if (v16)
  {
    int v21 = v16;
  }
  else
  {
    int v17 = [v12 computeCommandEncoder];
    if (v17)
    {
      v18 = v17;
      [v17 setLabel:@"encoder _disparityRefinementPreprocessingKernel"];
      [v18 setComputePipelineState:self->_disparityRefinementPreprocessingKernel];
      [v18 setTexture:v13 atIndex:0];
      [v18 setTexture:v14 atIndex:1];
      [v18 setTexture:v15 atIndex:2];
      [v18 setBytes:a7 length:44 atIndex:0];
      [v18 setBytes:&self->_config length:20 atIndex:1];
      [v18 setBuffer:self->_zeroShiftResult_buf offset:0 atIndex:2];
      int v19 = [(MTLComputePipelineState *)self->_disparityRefinementPreprocessingKernel threadExecutionWidth];
      int v20 = (int)[(MTLComputePipelineState *)self->_disparityRefinementPreprocessingKernel maxTotalThreadsPerThreadgroup]/ v19;
      v24[0] = (int)(v19 + [v15 width] - 1) / v19;
      v24[1] = (int)(v20 + [v15 height] - 1) / v20;
      v24[2] = 1;
      v23[0] = v19;
      v23[1] = v20;
      v23[2] = 1;
      [v18 dispatchThreadgroups:v24 threadsPerThreadgroup:v23];
      [v18 endEncoding];

      int v21 = 0;
    }
    else
    {
      int v21 = -1;
    }
  }

  return v21;
}

- (int)encodeMinMaxOn:(id)a3 inputTexture:(id)a4
{
  id v6 = a4;
  id v7 = [a3 computeCommandEncoder];
  id v8 = v7;
  if (v7)
  {
    [v7 setLabel:@"encoder _minMax_kernels"];
    [v8 setComputePipelineState:self->_minMax0_kernel];
    [v8 setBuffer:self->_minMaxAtomic_buf offset:0 atIndex:0];
    int64x2_t v13 = vdupq_n_s64(1uLL);
    int64x2_t v22 = v13;
    uint64_t v23 = 1;
    int64x2_t v20 = v13;
    uint64_t v21 = 1;
    [v8 dispatchThreadgroups:&v22 threadsPerThreadgroup:&v20];
    [v8 setComputePipelineState:self->_minMax1_kernel];
    [v8 setTexture:v6 atIndex:0];
    [v8 setBuffer:self->_minMaxAtomic_buf offset:0 atIndex:0];
    int v9 = [(MTLComputePipelineState *)self->_minMax1_kernel threadExecutionWidth];
    int v10 = (int)[(MTLComputePipelineState *)self->_minMax1_kernel maxTotalThreadsPerThreadgroup]/ v9;
    v19[0] = (int)(v9 + [v6 width] - 1) / v9;
    v19[1] = (int)(v10 + [v6 height] - 1) / v10;
    v19[2] = 1;
    v18[0] = v9;
    v18[1] = v10;
    v18[2] = 1;
    [v8 dispatchThreadgroups:v19 threadsPerThreadgroup:v18];
    [v8 setComputePipelineState:self->_minMax2_kernel];
    [v8 setBuffer:self->_minMaxAtomic_buf offset:0 atIndex:0];
    [v8 setBuffer:self->_minMaxResult_buf offset:0 atIndex:1];
    int64x2_t v16 = v13;
    uint64_t v17 = 1;
    int64x2_t v14 = v13;
    uint64_t v15 = 1;
    [v8 dispatchThreadgroups:&v16 threadsPerThreadgroup:&v14];
    [v8 endEncoding];
    int v11 = 0;
  }
  else
  {
    int v11 = -1;
  }

  return v11;
}

- (int)encodeFocalPlaneCalcOn:(id)a3 disparityTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(XFocalPlane *)self encodeMinMaxOn:v6 inputTexture:v7];
  if (v8)
  {
    int v11 = v8;
  }
  else
  {
    int v9 = [v6 computeCommandEncoder];
    if (v9)
    {
      int v10 = v9;
      [v9 setLabel:@"encode slm_calc_kernel"];
      [v10 setComputePipelineState:self->_calc_kernel];
      [v10 setBytes:&self->_config length:20 atIndex:0];
      [v10 setBuffer:self->_minMaxResult_buf offset:0 atIndex:1];
      [v10 setBuffer:self->_zeroShiftResult_buf offset:0 atIndex:2];
      [v10 setTexture:v7 atIndex:0];
      [v10 setThreadgroupMemoryLength:1024 atIndex:0];
      int64x2_t v15 = vdupq_n_s64(1uLL);
      uint64_t v16 = 1;
      long long v13 = xmmword_1939545C0;
      uint64_t v14 = 1;
      [v10 dispatchThreadgroups:&v15 threadsPerThreadgroup:&v13];
      [v10 endEncoding];

      int v11 = 0;
    }
    else
    {
      int v11 = -1;
    }
  }

  return v11;
}

- ($599F175E452E455E49EC8439362DB023)config
{
  objc_copyStruct(retstr, &self->_config, 20, 1, 0);
  return result;
}

- (void)setConfig:(id *)a3
{
}

- (MTLBuffer)minMaxAtomic_buf
{
  return (MTLBuffer *)objc_getProperty(self, a2, 64, 1);
}

- (MTLBuffer)minMaxResult_buf
{
  return (MTLBuffer *)objc_getProperty(self, a2, 72, 1);
}

- (MTLBuffer)zeroShiftResult_buf
{
  return (MTLBuffer *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroShiftResult_buf, 0);
  objc_storeStrong((id *)&self->_minMaxResult_buf, 0);
  objc_storeStrong((id *)&self->_minMaxAtomic_buf, 0);
  objc_storeStrong((id *)&self->_calc_kernel, 0);
  objc_storeStrong((id *)&self->_minMax2_kernel, 0);
  objc_storeStrong((id *)&self->_minMax1_kernel, 0);
  objc_storeStrong((id *)&self->_minMax0_kernel, 0);
  objc_storeStrong((id *)&self->_disparityRefinementPreprocessingKernel, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end