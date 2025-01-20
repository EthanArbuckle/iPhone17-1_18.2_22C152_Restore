@interface ARGPUSphericalBlur
- (ARGPUSphericalBlur)init;
- (id)blurCubemapTexture:(float32x4_t)a3 roughness:(float32x4_t)a4 rotation:(uint64_t)a5;
@end

@implementation ARGPUSphericalBlur

- (ARGPUSphericalBlur)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)ARGPUSphericalBlur;
  v2 = [(ARGPUSphericalBlur *)&v23 init];
  v3 = +[ARSharedGPUDevice sharedInstance];
  uint64_t v4 = [v3 device];
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  uint64_t v6 = [(MTLDevice *)v2->_device newCommandQueue];
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  [(MTLCommandQueue *)v2->_commandQueue setLabel:@"com.apple.arkit.gpusphericalblur.queue"];
  v2->_gpuFamilyAtleast4 = [(MTLDevice *)v2->_device supportsFamily:1004];
  v8 = ARKitCoreBundle();
  v9 = [v8 URLForResource:@"default" withExtension:@"metallib"];
  v10 = (void *)[(MTLDevice *)v2->_device newLibraryWithURL:v9 error:0];
  [v10 setLabel:@"com.apple.arkit.gpusphericalblur.library"];
  if (v2->_gpuFamilyAtleast4) {
    v11 = @"blur_cubemap";
  }
  else {
    v11 = @"blur_cubemap_views";
  }
  v12 = (void *)[v10 newFunctionWithName:v11];
  v13 = v2->_device;
  id v22 = 0;
  uint64_t v14 = [(MTLDevice *)v13 newComputePipelineStateWithFunction:v12 error:&v22];
  id v15 = v22;
  cubemapBlurPipelineState = v2->_cubemapBlurPipelineState;
  v2->_cubemapBlurPipelineState = (MTLComputePipelineState *)v14;

  if (!v2->_cubemapBlurPipelineState)
  {
    if (_ARLogGeneral_onceToken_1 != -1) {
      dispatch_once(&_ARLogGeneral_onceToken_1, &__block_literal_global_6);
    }
    v17 = (void *)_ARLogGeneral_logObj_1;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_1, OS_LOG_TYPE_ERROR))
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
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cubemap blur pipeline state, error %@", buf, 0x20u);
    }
  }

  return v2;
}

- (id)blurCubemapTexture:(float32x4_t)a3 roughness:(float32x4_t)a4 rotation:(uint64_t)a5
{
  float32x4_t v31 = a3;
  float32x4_t v32 = a4;
  float32x4_t v30 = a2;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a7;
  v11 = objc_msgSend(MEMORY[0x1E4F35330], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", objc_msgSend(v9, "pixelFormat"), objc_msgSend(v9, "width"), 1);
  [v11 setUsage:23];
  v12 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v11];
  [v12 setLabel:@"com.apple.arkit.gpusphericalblur.target"];
  v13 = [*(id *)(a1 + 16) commandBuffer];
  uint64_t v14 = [v13 computeCommandEncoder];
  [v14 setLabel:@"com.apple.arkit.gpusphericalblur.cubemapblur"];
  [v14 setComputePipelineState:*(void *)(a1 + 24)];
  [v14 setTexture:v9 atIndex:0];
  [v14 setTexture:v10 atIndex:1];
  uint64_t v15 = 0;
  long long v34 = xmmword_1B8A2B0C0;
  long long v35 = xmmword_1B8A2B0D0;
  long long v36 = xmmword_1B8A2B0E0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  do
  {
    *(long long *)((char *)&v37 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v30, COERCE_FLOAT(*(long long *)((char *)&v34 + v15))), v31, *(float32x2_t *)((char *)&v34 + v15), 1), v32, *(float32x4_t *)((char *)&v34 + v15), 2);
    v15 += 16;
  }
  while (v15 != 48);
  uint64_t v16 = 0;
  long long v34 = v37;
  long long v35 = v38;
  long long v36 = v39;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  do
  {
    *(long long *)((char *)&v37 + v16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, COERCE_FLOAT(*(long long *)((char *)&v34 + v16))), (float32x4_t)xmmword_1B8A2B0D0, *(float32x2_t *)((char *)&v34 + v16), 1), (float32x4_t)xmmword_1B8A2B0E0, *(float32x4_t *)((char *)&v34 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  v33[1] = DWORD2(v37);
  v33[3] = DWORD2(v38);
  v33[0] = v37;
  v33[2] = v38;
  v33[5] = DWORD2(v39);
  v33[4] = v39;
  [v14 setBytes:v33 length:48 atIndex:0];
  if (*(unsigned char *)(a1 + 32))
  {
    [v14 setTexture:v12 atIndex:2];
  }
  else
  {
    uint64_t v17 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    do
    {
      uint64_t v18 = objc_msgSend(v12, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v9, "pixelFormat", *(_OWORD *)&v30, *(_OWORD *)&v31, *(_OWORD *)&v32), 2, 0, 1, v17, 1);
      v19 = (void *)*((void *)&v37 + v17);
      *((void *)&v37 + v17) = v18;

      ++v17;
    }
    while (v17 != 6);
    objc_msgSend(v14, "setTextures:withRange:", &v37, 2, 6);
    for (uint64_t i = 40; i != -8; i -= 8)
  }
  unint64_t v21 = objc_msgSend(*(id *)(a1 + 24), "threadExecutionWidth", *(_OWORD *)&v30, *(_OWORD *)&v31, *(_OWORD *)&v32);
  unint64_t v22 = [v9 width];
  if (v21 >= v22) {
    unint64_t v21 = v22;
  }
  unint64_t v23 = [*(id *)(a1 + 24) maxTotalThreadsPerThreadgroup];
  unint64_t v24 = v21;
  do
  {
    unint64_t v25 = v24;
    unint64_t v26 = v24 * v21;
    v24 >>= 1;
  }
  while (v26 > v23);
  unint64_t v27 = (v21 + [v9 width] - 1) / v21;
  uint64_t v28 = [v9 height];
  *(void *)&long long v37 = v27;
  *((void *)&v37 + 1) = (v25 + v28 - 1) / v25;
  *(void *)&long long v38 = 6;
  *(void *)&long long v34 = v21;
  *((void *)&v34 + 1) = v25;
  *(void *)&long long v35 = 1;
  [v14 dispatchThreadgroups:&v37 threadsPerThreadgroup:&v34];
  [v14 endEncoding];
  [v13 commit];
  [v13 waitUntilCompleted];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubemapBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end