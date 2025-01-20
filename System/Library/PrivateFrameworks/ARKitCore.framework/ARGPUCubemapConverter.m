@interface ARGPUCubemapConverter
- (ARGPUCubemapConverter)init;
- (id)cubemapTextureFromEquirectangularTexture:(__n128)a3 rotation:(__n128)a4 size:(uint64_t)a5;
- (id)equirectangularTextureFromCubemapTexture:(float32x4_t)a3 rotation:(float32x4_t)a4 width:(uint64_t)a5 height:(void *)a6;
@end

@implementation ARGPUCubemapConverter

- (ARGPUCubemapConverter)init
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)ARGPUCubemapConverter;
  v2 = [(ARGPUCubemapConverter *)&v31 init];
  v3 = +[ARSharedGPUDevice sharedInstance];
  uint64_t v4 = [v3 device];
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  uint64_t v6 = [(MTLDevice *)v2->_device newCommandQueue];
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  [(MTLCommandQueue *)v2->_commandQueue setLabel:@"com.apple.arkit.cubemapconverter.queue"];
  v2->_gpuFamilyAtleast4 = [(MTLDevice *)v2->_device supportsFamily:1004];
  v8 = ARKitCoreBundle();
  v9 = [v8 URLForResource:@"default" withExtension:@"metallib"];
  v10 = (void *)[(MTLDevice *)v2->_device newLibraryWithURL:v9 error:0];
  [v10 setLabel:@"com.apple.cubemapconverter.library"];
  v11 = (void *)[v10 newFunctionWithName:@"compute_latlong_from_cubemap"];
  v12 = v2->_device;
  id v30 = 0;
  uint64_t v13 = [(MTLDevice *)v12 newComputePipelineStateWithFunction:v11 error:&v30];
  id v14 = v30;
  cubemapToLatLongPipelineState = v2->_cubemapToLatLongPipelineState;
  v2->_cubemapToLatLongPipelineState = (MTLComputePipelineState *)v13;

  if (!v2->_cubemapToLatLongPipelineState)
  {
    v16 = _ARLogGeneral_20();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543874;
      v33 = v18;
      __int16 v34 = 2048;
      v35 = v2;
      __int16 v36 = 2112;
      id v37 = v14;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map conversion pipeline state, error %@", buf, 0x20u);
    }
  }

  if (v2->_gpuFamilyAtleast4) {
    v19 = @"compute_cubemap_from_latlong";
  }
  else {
    v19 = @"compute_cubemap_from_latlong_views";
  }
  v20 = (void *)[v10 newFunctionWithName:v19];
  v21 = v2->_device;
  id v29 = 0;
  uint64_t v22 = [(MTLDevice *)v21 newComputePipelineStateWithFunction:v20 error:&v29];
  id v23 = v29;
  latLongToCubemapPipelineState = v2->_latLongToCubemapPipelineState;
  v2->_latLongToCubemapPipelineState = (MTLComputePipelineState *)v22;

  if (!v2->_latLongToCubemapPipelineState)
  {
    v25 = _ARLogGeneral_20();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138543874;
      v33 = v27;
      __int16 v34 = 2048;
      v35 = v2;
      __int16 v36 = 2112;
      id v37 = v23;
      _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map conversion pipeline state, error %@", buf, 0x20u);
    }
  }

  return v2;
}

- (id)equirectangularTextureFromCubemapTexture:(float32x4_t)a3 rotation:(float32x4_t)a4 width:(uint64_t)a5 height:(void *)a6
{
  id v11 = a6;
  v12 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v11, "pixelFormat"), a7, a8, 0);
  [v12 setUsage:3];
  uint64_t v13 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v12];
  [v13 setLabel:@"com.apple.arkit.cubemapconverter.latlongtexture"];
  id v14 = [*(id *)(a1 + 16) commandBuffer];
  v15 = [v14 computeCommandEncoder];
  [v15 setLabel:@"com.apple.arkit.gpucubemapconverter.computelatlong"];
  [v15 setComputePipelineState:*(void *)(a1 + 24)];
  uint64_t v16 = 0;
  int64x2_t v27 = (int64x2_t)xmmword_1B8A2B0C0;
  long long v28 = xmmword_1B8A2B0D0;
  long long v29 = xmmword_1B8A2B0E0;
  int64x2_t v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v30 + v16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)((char *)&v27 + v16))), a3, *(float32x2_t *)&v27.i8[v16], 1), a4, *(float32x4_t *)((char *)&v27 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  uint64_t v17 = 0;
  int64x2_t v27 = v30;
  long long v28 = v31;
  long long v29 = v32;
  int64x2_t v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v30 + v17) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, COERCE_FLOAT(*(_OWORD *)((char *)&v27 + v17))), (float32x4_t)xmmword_1B8A2B0D0, *(float32x2_t *)&v27.i8[v17], 1), (float32x4_t)xmmword_1B8A2B0E0, *(float32x4_t *)((char *)&v27 + v17), 2);
    v17 += 16;
  }
  while (v17 != 48);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  DWORD2(v24) = v30.i32[2];
  DWORD2(v25) = DWORD2(v31);
  *(void *)&long long v24 = v30.i64[0];
  *(void *)&long long v25 = v31;
  DWORD2(v26) = DWORD2(v32);
  *(void *)&long long v26 = v32;
  [v15 setBytes:&v24 length:48 atIndex:0];
  [v15 setTexture:v11 atIndex:0];
  [v15 setTexture:v13 atIndex:1];
  uint64_t v18 = [v12 width];
  uint64_t v19 = [v12 height];
  v30.i64[0] = v18;
  v30.i64[1] = v19;
  *(void *)&long long v31 = 1;
  int64x2_t v27 = vdupq_n_s64(1uLL);
  *(void *)&long long v28 = 1;
  [v15 dispatchThreadgroups:&v30 threadsPerThreadgroup:&v27];
  [v15 endEncoding];
  [v14 commit];
  [v14 waitUntilCompleted];

  return v13;
}

- (id)cubemapTextureFromEquirectangularTexture:(__n128)a3 rotation:(__n128)a4 size:(uint64_t)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  v10 = v9;
  if (a7 >= 0x800) {
    a7 = 2048;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F35330], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", objc_msgSend(v9, "pixelFormat", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4), a7, 0);
  [v11 setUsage:23];
  v12 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v11];
  [v12 setLabel:@"com.apple.arkit.cubemapconverter.cubemaptexture"];
  uint64_t v13 = [*(id *)(a1 + 16) commandBuffer];
  id v14 = *(id *)(a1 + 32);
  v15 = [v13 computeCommandEncoder];
  [v15 setComputePipelineState:v14];
  uint64_t v16 = 0;
  long long v38 = xmmword_1B8A2B0C0;
  long long v39 = xmmword_1B8A2B0D0;
  long long v40 = xmmword_1B8A2B0E0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  do
  {
    *(long long *)((char *)&v41 + v16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(*(long long *)((char *)&v38 + v16))), v34, *(float32x2_t *)((char *)&v38 + v16), 1), v36, *(float32x4_t *)((char *)&v38 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  uint64_t v17 = 0;
  long long v38 = v41;
  long long v39 = v42;
  long long v40 = v43;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  do
  {
    *(long long *)((char *)&v41 + v17) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, COERCE_FLOAT(*(long long *)((char *)&v38 + v17))), (float32x4_t)xmmword_1B8A2B0D0, *(float32x2_t *)((char *)&v38 + v17), 1), (float32x4_t)xmmword_1B8A2B0E0, *(float32x4_t *)((char *)&v38 + v17), 2);
    v17 += 16;
  }
  while (v17 != 48);
  v37[1] = DWORD2(v41);
  v37[3] = DWORD2(v42);
  v37[0] = v41;
  v37[2] = v42;
  v37[5] = DWORD2(v43);
  v37[4] = v43;
  [v15 setBytes:v37 length:48 atIndex:0];
  [v15 setTexture:v10 atIndex:0];
  if (*(unsigned char *)(a1 + 40))
  {
    [v15 setTexture:v12 atIndex:1];
  }
  else
  {
    uint64_t v18 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v41 = 0u;
    do
    {
      uint64_t v19 = objc_msgSend(v12, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v12, "pixelFormat"), 2, 0, 1, v18, 1);
      v20 = (void *)*((void *)&v41 + v18);
      *((void *)&v41 + v18) = v19;

      ++v18;
    }
    while (v18 != 6);
    objc_msgSend(v15, "setTextures:withRange:", &v41, 1, 6);
    for (uint64_t i = 40; i != -8; i -= 8)
  }
  unint64_t v22 = [v14 threadExecutionWidth];
  unint64_t v23 = [v12 width];
  if (v22 >= v23) {
    unint64_t v22 = v23;
  }
  unint64_t v24 = [v14 maxTotalThreadsPerThreadgroup];
  unint64_t v25 = v22;
  do
  {
    unint64_t v26 = v25;
    unint64_t v27 = v25 * v22;
    v25 >>= 1;
  }
  while (v27 > v24);
  unint64_t v28 = (v22 + [v12 width] - 1) / v22;
  uint64_t v29 = [v12 height];
  *(void *)&long long v41 = v28;
  *((void *)&v41 + 1) = (v26 + v29 - 1) / v26;
  *(void *)&long long v42 = 6;
  *(void *)&long long v38 = v22;
  *((void *)&v38 + 1) = v26;
  *(void *)&long long v39 = 1;
  [v15 dispatchThreadgroups:&v41 threadsPerThreadgroup:&v38];
  [v15 endEncoding];
  [v13 commit];
  [v13 waitUntilCompleted];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latLongToCubemapPipelineState, 0);
  objc_storeStrong((id *)&self->_cubemapToLatLongPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end