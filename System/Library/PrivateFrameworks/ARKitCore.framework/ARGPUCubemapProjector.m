@interface ARGPUCubemapProjector
+ (id)createCubemap:(unint64_t)a3;
- (ARGPUCubemapProjector)init;
- (void)projectToCube:(float32x4_t)a3 transformWorldFromCube:(float32x4_t)a4 meshes:(float32x4_t)a5 blend:(uint64_t)a6;
@end

@implementation ARGPUCubemapProjector

+ (id)createCubemap:(unint64_t)a3
{
  v3 = [MEMORY[0x1E4F35330] textureCubeDescriptorWithPixelFormat:71 size:a3 mipmapped:0];
  [v3 setUsage:5];
  v4 = +[ARSharedGPUDevice sharedInstance];
  v5 = [v4 device];
  v6 = (void *)[v5 newTextureWithDescriptor:v3];

  return v6;
}

- (ARGPUCubemapProjector)init
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)ARGPUCubemapProjector;
  v2 = [(ARGPUCubemapProjector *)&v49 init];
  v3 = +[ARSharedGPUDevice sharedInstance];
  uint64_t v4 = [v3 device];
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  uint64_t v6 = [(MTLDevice *)v2->_device newCommandQueue];
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  [(MTLCommandQueue *)v2->_commandQueue setLabel:@"com.apple.arkit.cubemapprojector.queue"];
  v45 = ARKitCoreBundle();
  v8 = [v45 URLForResource:@"default" withExtension:@"metallib"];
  if (!v8) {
    __assert_rtn("-[ARGPUCubemapProjector init]", "ARGPUCubemapProjector.m", 53, "url != nil");
  }
  v9 = (void *)[(MTLDevice *)v2->_device newLibraryWithURL:v8 error:0];
  [v9 setLabel:@"com.apple.arkit.cubemapprojector.library"];
  v10 = (void *)[v9 newFunctionWithName:@"cubemapVertexShader"];
  v11 = (void *)[v9 newFunctionWithName:@"cubemapFragmentShader"];
  id v12 = objc_alloc_init(MEMORY[0x1E4F352F0]);
  [v12 setLabel:@"com.apple.arkit.cubemapprojector.srgbpipeline"];
  [v12 setVertexFunction:v10];
  [v12 setFragmentFunction:v11];
  v13 = [v12 colorAttachments];
  v14 = [v13 objectAtIndexedSubscript:0];
  [v14 setPixelFormat:81];

  [v12 setDepthAttachmentPixelFormat:252];
  v15 = v2->_device;
  id v48 = 0;
  uint64_t v16 = [(MTLDevice *)v15 newRenderPipelineStateWithDescriptor:v12 error:&v48];
  id v17 = v48;
  cubemapPipelineStateSRGB_BGRA = v2->_cubemapPipelineStateSRGB_BGRA;
  v2->_cubemapPipelineStateSRGB_BGRA = (MTLRenderPipelineState *)v16;

  if (!v2->_cubemapPipelineStateSRGB_BGRA)
  {
    v19 = _ARLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138543874;
      v51 = v21;
      __int16 v52 = 2048;
      v53 = v2;
      __int16 v54 = 2112;
      id v55 = v17;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map srgb pipeline state, error %@", buf, 0x20u);
    }
    if (!v2->_cubemapPipelineStateSRGB_BGRA) {
      __assert_rtn("-[ARGPUCubemapProjector init]", "ARGPUCubemapProjector.m", 78, "_cubemapPipelineStateSRGB_BGRA");
    }
  }
  v22 = [v12 colorAttachments];
  v23 = [v22 objectAtIndexedSubscript:0];
  [v23 setPixelFormat:71];

  v24 = v2->_device;
  id v47 = v17;
  uint64_t v25 = [(MTLDevice *)v24 newRenderPipelineStateWithDescriptor:v12 error:&v47];
  id v26 = v47;

  cubemapPipelineStateSRGB_RGBA = v2->_cubemapPipelineStateSRGB_RGBA;
  v2->_cubemapPipelineStateSRGB_RGBA = (MTLRenderPipelineState *)v25;

  v28 = v26;
  if (!v2->_cubemapPipelineStateSRGB_RGBA)
  {
    v29 = _ARLogGeneral();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138543874;
      v51 = v31;
      __int16 v52 = 2048;
      v53 = v2;
      __int16 v54 = 2112;
      id v55 = v28;
      _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map srgb pipeline state, error %@", buf, 0x20u);
    }
  }
  [v12 setLabel:@"com.apple.arkit.cubemapprojector.hdrpipeline"];
  v32 = [v12 colorAttachments];
  v33 = [v32 objectAtIndexedSubscript:0];
  [v33 setPixelFormat:115];

  v34 = v2->_device;
  id v46 = v28;
  uint64_t v35 = [(MTLDevice *)v34 newRenderPipelineStateWithDescriptor:v12 error:&v46];
  id v36 = v46;

  cubemapPipelineStateHDR = v2->_cubemapPipelineStateHDR;
  v2->_cubemapPipelineStateHDR = (MTLRenderPipelineState *)v35;

  if (!v2->_cubemapPipelineStateHDR)
  {
    v38 = _ARLogGeneral();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      *(_DWORD *)buf = 138543874;
      v51 = v40;
      __int16 v52 = 2048;
      v53 = v2;
      __int16 v54 = 2112;
      id v55 = v36;
      _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map HDR pipeline state, error %@", buf, 0x20u);
    }
    if (!v2->_cubemapPipelineStateHDR) {
      __assert_rtn("-[ARGPUCubemapProjector init]", "ARGPUCubemapProjector.m", 95, "_cubemapPipelineStateHDR");
    }
  }
  id v41 = objc_alloc_init(MEMORY[0x1E4F35218]);
  [v41 setDepthCompareFunction:1];
  [v41 setDepthWriteEnabled:1];
  uint64_t v42 = [(MTLDevice *)v2->_device newDepthStencilStateWithDescriptor:v41];
  cubemapDepthState = v2->_cubemapDepthState;
  v2->_cubemapDepthState = (MTLDepthStencilState *)v42;

  return v2;
}

- (void)projectToCube:(float32x4_t)a3 transformWorldFromCube:(float32x4_t)a4 meshes:(float32x4_t)a5 blend:(uint64_t)a6
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v77 = a7;
  id v71 = a8;
  unint64_t v11 = 0;
  char v94 = a9;
  long long v95 = xmmword_1B8A2B270;
  long long v96 = xmmword_1B8A2B0D0;
  long long v97 = xmmword_1B8A2B3D0;
  long long v98 = xmmword_1B8A2B050;
  do
  {
    v99.columns[v11 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v95 + v11))), a3, *(float32x2_t *)((char *)&v95 + v11), 1), a4, *(float32x4_t *)((char *)&v95 + v11), 2), a5, *(float32x4_t *)((char *)&v95 + v11), 3);
    v11 += 16;
  }
  while (v11 != 64);
  simd_float4x4 v103 = __invert_f4(v99);
  unint64_t v12 = 0;
  v101[0] = v103;
  long long v95 = xmmword_1B8A2B0E0;
  long long v96 = xmmword_1B8A2B0D0;
  long long v97 = xmmword_1B8A2B0C0;
  long long v98 = xmmword_1B8A2B050;
  do
  {
    v99.columns[v12 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v95 + v12))), a3, *(float32x2_t *)((char *)&v95 + v12), 1), a4, *(float32x4_t *)((char *)&v95 + v12), 2), a5, *(float32x4_t *)((char *)&v95 + v12), 3);
    v12 += 16;
  }
  while (v12 != 64);
  simd_float4x4 v104 = __invert_f4(v99);
  unint64_t v13 = 0;
  v101[1] = v104;
  long long v95 = xmmword_1B8A2B0C0;
  long long v96 = xmmword_1B8A2B270;
  long long v97 = xmmword_1B8A2B3E0;
  long long v98 = xmmword_1B8A2B050;
  do
  {
    v99.columns[v13 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v95 + v13))), a3, *(float32x2_t *)((char *)&v95 + v13), 1), a4, *(float32x4_t *)((char *)&v95 + v13), 2), a5, *(float32x4_t *)((char *)&v95 + v13), 3);
    v13 += 16;
  }
  while (v13 != 64);
  simd_float4x4 v105 = __invert_f4(v99);
  unint64_t v14 = 0;
  v101[2] = v105;
  long long v95 = xmmword_1B8A2B0C0;
  long long v96 = xmmword_1B8A2B0E0;
  long long v97 = xmmword_1B8A2B0D0;
  long long v98 = xmmword_1B8A2B050;
  do
  {
    v99.columns[v14 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v95 + v14))), a3, *(float32x2_t *)((char *)&v95 + v14), 1), a4, *(float32x4_t *)((char *)&v95 + v14), 2), a5, *(float32x4_t *)((char *)&v95 + v14), 3);
    v14 += 16;
  }
  while (v14 != 64);
  simd_float4x4 v106 = __invert_f4(v99);
  unint64_t v15 = 0;
  v101[3] = v106;
  long long v95 = xmmword_1B8A2B0C0;
  long long v96 = xmmword_1B8A2B0D0;
  long long v97 = xmmword_1B8A2B270;
  long long v98 = xmmword_1B8A2B050;
  do
  {
    v99.columns[v15 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v95 + v15))), a3, *(float32x2_t *)((char *)&v95 + v15), 1), a4, *(float32x4_t *)((char *)&v95 + v15), 2), a5, *(float32x4_t *)((char *)&v95 + v15), 3);
    v15 += 16;
  }
  while (v15 != 64);
  simd_float4x4 v107 = __invert_f4(v99);
  unint64_t v16 = 0;
  v101[4] = v107;
  long long v95 = xmmword_1B8A2B3D0;
  long long v96 = xmmword_1B8A2B0D0;
  long long v97 = xmmword_1B8A2B0E0;
  long long v98 = xmmword_1B8A2B050;
  do
  {
    v99.columns[v16 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v95 + v16))), a3, *(float32x2_t *)((char *)&v95 + v16), 1), a4, *(float32x4_t *)((char *)&v95 + v16), 2), a5, *(float32x4_t *)((char *)&v95 + v16), 3);
    v16 += 16;
  }
  while (v16 != 64);
  v101[5] = __invert_f4(v99);
  uint64_t v17 = [v77 width];
  uint64_t v72 = [v77 pixelFormat];
  v69 = [MEMORY[0x1E4F35330] textureCubeDescriptorWithPixelFormat:252 size:v17 mipmapped:0];
  [v69 setUsage:4];
  v73 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v69];
  [v73 setLabel:@"com.apple.arkit.cubemapprojector.depthtexture"];
  v74 = [*(id *)(a1 + 16) commandBuffer];
  [v74 setLabel:@"com.apple.arkit.cubemapprojector.commandbuffer"];
  uint64_t v18 = 0;
  int8x16_t v19 = (int8x16_t)a4;
  float32x4_t v20 = (float32x4_t)vextq_s8(v19, v19, 8uLL);
  int8x16_t v21 = (int8x16_t)a5;
  float32x4_t v22 = (float32x4_t)vextq_s8(v21, v21, 0xCuLL);
  float32x4_t v23 = (float32x4_t)vextq_s8(v19, v19, 0xCuLL);
  float32x4_t v24 = (float32x4_t)vextq_s8(v21, v21, 8uLL);
  float32x4_t v25 = (float32x4_t)vextq_s8(v21, v21, 4uLL);
  float32x4_t v26 = (float32x4_t)vextq_s8(v19, v19, 4uLL);
  int8x16_t v27 = (int8x16_t)vmulq_f32(a2, vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)a3, (int8x16_t)a3, 8uLL), vmlaq_f32(vmulq_f32(v22, vnegq_f32(v26)), v25, v23)), vmlaq_f32(vmulq_f32(v24, vnegq_f32(v23)), v22, v20), (float32x4_t)vextq_s8((int8x16_t)a3, (int8x16_t)a3, 4uLL)), vmlaq_f32(vmulq_f32(v25, vnegq_f32(v20)), v24, v26), (float32x4_t)vextq_s8((int8x16_t)a3, (int8x16_t)a3, 0xCuLL)));
  v20.i64[0] = vextq_s8(v27, v27, 8uLL).u64[0];
  if (vaddv_f32(vsub_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v27.i8, *(int32x2_t *)v20.f32), (float32x2_t)vzip2_s32(*(int32x2_t *)v27.i8, *(int32x2_t *)v20.f32))) <= 0.0)uint64_t v28 = 1; {
  else
  }
    uint64_t v28 = 2;
  uint64_t v70 = v28;
  do
  {
    v78 = objc_msgSend(v77, "newTextureViewWithPixelFormat:textureType:levels:slices:", v72, 2, 0, 1, v18, 1);
    uint64_t v76 = v18;
    v79 = objc_msgSend(v73, "newTextureViewWithPixelFormat:textureType:levels:slices:", 252, 2, 0, 1, v18, 1);
    v80 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
    v29 = [v80 colorAttachments];
    v30 = [v29 objectAtIndexedSubscript:0];
    [v30 setTexture:v78];

    if (v94) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = 2;
    }
    v32 = [v80 colorAttachments];
    v33 = [v32 objectAtIndexedSubscript:0];
    [v33 setLoadAction:v31];

    v34 = [v80 colorAttachments];
    uint64_t v35 = [v34 objectAtIndexedSubscript:0];
    [v35 setStoreAction:1];

    id v36 = [v80 colorAttachments];
    v37 = [v36 objectAtIndexedSubscript:0];
    objc_msgSend(v37, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    v38 = [v80 depthAttachment];
    [v38 setTexture:v79];

    v39 = [v80 depthAttachment];
    [v39 setLoadAction:2];

    v40 = [v80 depthAttachment];
    [v40 setStoreAction:0];

    id v41 = [v74 renderCommandEncoderWithDescriptor:v80];
    [v41 setLabel:@"com.apple.arkit.cubemapprojector.renderencoder"];
    [v41 setCullMode:v70];
    uint64_t v42 = [v77 pixelFormat];
    v43 = (void *)(a1 + 24);
    if (v42 != 81)
    {
      uint64_t v44 = [v77 pixelFormat];
      uint64_t v45 = 40;
      if (v44 == 71) {
        uint64_t v45 = 32;
      }
      v43 = (void *)(a1 + v45);
    }
    [v41 setRenderPipelineState:*v43];
    [v41 setDepthStencilState:*(void *)(a1 + 48)];
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v46 = v71;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v90 objects:v100 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v91;
      objc_super v49 = &v101[v76];
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v91 != v48) {
            objc_enumerationMutation(v46);
          }
          v51 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          __int16 v52 = [v51 vertexBuffer];
          [v41 setVertexBuffer:v52 offset:0 atIndex:0];

          v53 = [v51 uvBuffer];
          [v41 setVertexBuffer:v53 offset:0 atIndex:1];

          memset(&v89, 0, sizeof(v89));
          long long v86 = (__int128)v49->columns[1];
          long long v88 = (__int128)v49->columns[0];
          long long v82 = (__int128)v49->columns[3];
          long long v84 = (__int128)v49->columns[2];
          objc_msgSend(v51, "transform_world_from_primitive");
          unint64_t v58 = 0;
          long long v95 = v88;
          long long v96 = v86;
          long long v97 = v84;
          long long v98 = v82;
          do
          {
            v99.columns[v58 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, COERCE_FLOAT(*(long long *)((char *)&v95 + v58))), (float32x4_t)xmmword_1B8A2B0D0, *(float32x2_t *)((char *)&v95 + v58), 1), (float32x4_t)xmmword_1B8A52FA0, *(float32x4_t *)((char *)&v95 + v58), 2), (float32x4_t)xmmword_1B8A52FB0, *(float32x4_t *)((char *)&v95 + v58), 3);
            v58 += 16;
          }
          while (v58 != 64);
          unint64_t v59 = 0;
          float32x4_t v60 = (float32x4_t)v99.columns[0];
          float32x4_t v61 = (float32x4_t)v99.columns[1];
          float32x4_t v62 = (float32x4_t)v99.columns[2];
          float32x4_t v63 = (float32x4_t)v99.columns[3];
          long long v95 = v54;
          long long v96 = v55;
          long long v97 = v56;
          long long v98 = v57;
          do
          {
            v99.columns[v59 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, COERCE_FLOAT(*(long long *)((char *)&v95 + v59))), v61, *(float32x2_t *)((char *)&v95 + v59), 1), v62, *(float32x4_t *)((char *)&v95 + v59), 2), v63, *(float32x4_t *)((char *)&v95 + v59), 3);
            v59 += 16;
          }
          while (v59 != 64);
          simd_float4x4 v89 = v99;
          [v41 setVertexBytes:&v89 length:64 atIndex:2];
          [v41 setFragmentBytes:&v94 length:1 atIndex:0];
          v64 = [v51 texture];
          [v41 setFragmentTexture:v64 atIndex:0];

          uint64_t v65 = [v51 nIndices];
          v66 = [v51 indexBuffer];
          [v41 drawIndexedPrimitives:3 indexCount:v65 indexType:1 indexBuffer:v66 indexBufferOffset:0];
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v90 objects:v100 count:16];
      }
      while (v47);
    }

    [v41 endEncoding];
    uint64_t v18 = v76 + 1;
  }
  while (v76 != 5);
  v67 = v74;
  if ((unint64_t)[v77 mipmapLevelCount] >= 2)
  {
    v68 = [v74 blitCommandEncoder];
    [v68 generateMipmapsForTexture:v77];
    [v68 endEncoding];

    v67 = v74;
  }
  [v67 commit];
  [v67 waitUntilCompleted];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubemapDepthState, 0);
  objc_storeStrong((id *)&self->_cubemapPipelineStateHDR, 0);
  objc_storeStrong((id *)&self->_cubemapPipelineStateSRGB_RGBA, 0);
  objc_storeStrong((id *)&self->_cubemapPipelineStateSRGB_BGRA, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end