@interface ARGPUCubemapHistogram
- (ARGPUCubemapHistogram)init;
- (ARLabHistogram)colorHistogramForCubemap:(SEL)a3;
@end

@implementation ARGPUCubemapHistogram

- (ARGPUCubemapHistogram)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)ARGPUCubemapHistogram;
  v2 = [(ARGPUCubemapHistogram *)&v23 init];
  v3 = +[ARSharedGPUDevice sharedInstance];
  uint64_t v4 = [v3 device];
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  uint64_t v6 = [(MTLDevice *)v2->_device newCommandQueue];
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  [(MTLCommandQueue *)v2->_commandQueue setLabel:@"com.apple.arkit.cubemaphistogram.queue"];
  v2->_gpuFamilyAtleast4 = [(MTLDevice *)v2->_device supportsFamily:1004];
  v8 = ARKitCoreBundle();
  v9 = [v8 URLForResource:@"default" withExtension:@"metallib"];
  v10 = (void *)[(MTLDevice *)v2->_device newLibraryWithURL:v9 error:0];
  [v10 setLabel:@"com.apple.arkit.cubemaphistogram.library"];
  if (v2->_gpuFamilyAtleast4) {
    v11 = @"cubemap_color_histogram_lab";
  }
  else {
    v11 = @"cubemap_color_histogram_lab_views";
  }
  v12 = (void *)[v10 newFunctionWithName:v11];
  v13 = v2->_device;
  id v22 = 0;
  uint64_t v14 = [(MTLDevice *)v13 newComputePipelineStateWithFunction:v12 error:&v22];
  id v15 = v22;
  cubemapHistogramPipelineState = v2->_cubemapHistogramPipelineState;
  v2->_cubemapHistogramPipelineState = (MTLComputePipelineState *)v14;

  if (!v2->_cubemapHistogramPipelineState)
  {
    if (_ARLogGeneral_onceToken_23 != -1) {
      dispatch_once(&_ARLogGeneral_onceToken_23, &__block_literal_global_57);
    }
    v17 = (void *)_ARLogGeneral_logObj_23;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_23, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543874;
      v25 = v20;
      __int16 v26 = 2048;
      v27 = v2;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map histogram pipeline state, error %@", buf, 0x20u);
    }
  }

  return v2;
}

- (ARLabHistogram)colorHistogramForCubemap:(SEL)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  v8 = self->_cubemapHistogramPipelineState;
  v9 = [v7 computeCommandEncoder];
  [v9 setLabel:@"com.apple.arkit.gpucubemaphistogram.cubemapcolorhistogram"];
  [v9 setComputePipelineState:v8];
  bzero(v37, 0x400uLL);
  v10 = (void *)[(MTLDevice *)self->_device newBufferWithBytes:v37 length:1024 options:0];
  [v10 setLabel:@"com.apple.arkit.cubemaphistogram.histogrambuffer"];
  [v9 setBuffer:v10 offset:0 atIndex:0];
  unsigned int v33 = 0;
  v11 = (void *)[(MTLDevice *)self->_device newBufferWithBytes:&v33 length:4 options:0];
  [v11 setLabel:@"com.apple.arkit.cubemaphistogram.countbuffer"];
  [v9 setBuffer:v11 offset:0 atIndex:1];
  if (self->_gpuFamilyAtleast4)
  {
    [v9 setTexture:v6 atIndex:0];
  }
  else
  {
    uint64_t v12 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    do
    {
      uint64_t v13 = objc_msgSend(v6, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v6, "pixelFormat"), 2, 0, 1, v12, 1);
      uint64_t v14 = (void *)*((void *)&v34 + v12);
      *((void *)&v34 + v12) = v13;

      ++v12;
    }
    while (v12 != 6);
    objc_msgSend(v9, "setTextures:withRange:", &v34, 1, 6);
    for (uint64_t i = 40; i != -8; i -= 8)
  }
  unint64_t v16 = [(MTLComputePipelineState *)v8 threadExecutionWidth];
  unint64_t v17 = [v6 width];
  if (v16 >= v17) {
    unint64_t v16 = v17;
  }
  unint64_t v18 = [(MTLComputePipelineState *)v8 maxTotalThreadsPerThreadgroup];
  unint64_t v19 = v16;
  do
  {
    unint64_t v20 = v19;
    unint64_t v21 = v19 * v16;
    v19 >>= 1;
  }
  while (v21 > v18);
  unint64_t v22 = (v16 + [v6 width] - 1) / v16;
  uint64_t v23 = [v6 height];
  *(void *)&long long v34 = v22;
  *((void *)&v34 + 1) = (v20 + v23 - 1) / v20;
  *(void *)&long long v35 = 6;
  v32[0] = v16;
  v32[1] = v20;
  v32[2] = 1;
  [v9 dispatchThreadgroups:&v34 threadsPerThreadgroup:v32];
  [v9 endEncoding];
  [v7 commit];
  [v7 waitUntilCompleted];
  id v24 = v11;
  [v24 contents];
  [v24 length];
  __memcpy_chk();
  id v25 = v10;
  [v25 contents];
  [v25 length];
  __memcpy_chk();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1[0][0][3] = 0u;
  *(_OWORD *)&retstr->var1[0][0][7] = 0u;
  *(_OWORD *)&retstr->var1[0][1][3] = 0u;
  *(_OWORD *)&retstr->var1[0][1][7] = 0u;
  *(_OWORD *)&retstr->var1[0][2][3] = 0u;
  *(_OWORD *)&retstr->var1[0][2][7] = 0u;
  *(_OWORD *)&retstr->var1[0][3][3] = 0u;
  *(_OWORD *)&retstr->var1[0][3][7] = 0u;
  *(_OWORD *)&retstr->var1[0][4][3] = 0u;
  *(_OWORD *)&retstr->var1[0][4][7] = 0u;
  *(_OWORD *)&retstr->var1[0][5][3] = 0u;
  *(_OWORD *)&retstr->var1[0][5][7] = 0u;
  *(_OWORD *)&retstr->var1[0][6][3] = 0u;
  *(_OWORD *)&retstr->var1[0][6][7] = 0u;
  *(_OWORD *)&retstr->var1[0][7][3] = 0u;
  *(_OWORD *)&retstr->var1[0][7][7] = 0u;
  *(_OWORD *)&retstr->var1[1][0][3] = 0u;
  *(_OWORD *)&retstr->var1[1][0][7] = 0u;
  *(_OWORD *)&retstr->var1[1][1][3] = 0u;
  *(_OWORD *)&retstr->var1[1][1][7] = 0u;
  *(_OWORD *)&retstr->var1[1][2][3] = 0u;
  *(_OWORD *)&retstr->var1[1][2][7] = 0u;
  *(_OWORD *)&retstr->var1[1][3][3] = 0u;
  *(_OWORD *)&retstr->var1[1][3][7] = 0u;
  *(_OWORD *)&retstr->var1[1][4][3] = 0u;
  *(_OWORD *)&retstr->var1[1][4][7] = 0u;
  *(_OWORD *)&retstr->var1[1][5][3] = 0u;
  *(_OWORD *)&retstr->var1[1][5][7] = 0u;
  *(_OWORD *)&retstr->var1[1][6][3] = 0u;
  *(_OWORD *)&retstr->var1[1][6][7] = 0u;
  *(_OWORD *)&retstr->var1[1][7][3] = 0u;
  ARLabHistogramCreate(retstr);
  if (v33)
  {
    uint64_t v27 = 0;
    *(float *)v26.i32 = (float)v33;
    float32x4_t v28 = (float32x4_t)vdupq_lane_s32(v26, 0);
    do
    {
      *(float32x4_t *)&retstr->var1[0][0][v27] = vdivq_f32(vcvtq_f32_u32(*(uint32x4_t *)&v37[v27 * 4]), v28);
      v27 += 4;
    }
    while (v27 != 256);
  }
  uint64_t v29 = [v6 width];
  uint64_t v30 = [v6 height];
  retstr->var0 = (float)v33 / (float)((float)(unint64_t)(v30 * v29) * 6.0);

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubemapHistogramPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end