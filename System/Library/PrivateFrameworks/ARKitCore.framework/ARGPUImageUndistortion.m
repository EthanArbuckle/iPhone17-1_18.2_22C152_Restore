@interface ARGPUImageUndistortion
- (ARGPUImageUndistortion)init;
- (uint64_t)undistortFisheyeTexture:(float32x4_t)a3 withFisheyeIntrinsics:(float32x4_t)a4 withFisheyeRadialCoefficients:(float32x4_t)a5 toRectilinearImage:(__n128)a6 withRectilinearIntrinsics:(__n128)a7;
- (void)undistortFisheyeImage:(double)a3 withFisheyeIntrinsics:(double)a4 withFisheyeRadialCoefficients:(double)a5 toRectilinearImage:(double)a6 withRectilinearIntrinsics:(double)a7;
@end

@implementation ARGPUImageUndistortion

- (ARGPUImageUndistortion)init
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)ARGPUImageUndistortion;
  v2 = [(ARGPUImageUndistortion *)&v39 init];
  if (v2)
  {
    v3 = +[ARSharedGPUDevice sharedInstance];
    uint64_t v4 = [v3 device];
    device = v2->_device;
    v2->_device = (MTLDevice *)v4;

    uint64_t v6 = [(MTLDevice *)v2->_device newCommandQueue];
    commandQueue = v2->_commandQueue;
    v2->_commandQueue = (MTLCommandQueue *)v6;

    [(MTLCommandQueue *)v2->_commandQueue setLabel:@"com.apple.arkit.gpuimageundistortion.queue"];
    v8 = ARKitCoreBundle();
    v9 = [v8 URLForResource:@"default" withExtension:@"metallib"];
    v10 = (void *)[(MTLDevice *)v2->_device newLibraryWithURL:v9 error:0];
    [v10 setLabel:@"com.apple.arkit.gpuimageundistortion.library"];
    v11 = (void *)[v10 newFunctionWithName:@"compute_lut"];
    v12 = v2->_device;
    id v38 = 0;
    uint64_t v13 = [(MTLDevice *)v12 newComputePipelineStateWithFunction:v11 error:&v38];
    id v14 = v38;
    lutGenerationPipelineState = v2->_lutGenerationPipelineState;
    v2->_lutGenerationPipelineState = (MTLComputePipelineState *)v13;

    if (!v2->_lutGenerationPipelineState)
    {
      v16 = _ARLogGeneral_18();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138543874;
        v41 = v18;
        __int16 v42 = 2048;
        v43 = v2;
        __int16 v44 = 2112;
        id v45 = v14;
        _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create lut pipeline state, error %@", buf, 0x20u);
      }
    }

    v19 = (void *)[v10 newFunctionWithName:@"undistort_image_yuv"];
    v20 = (void *)[v10 newFunctionWithName:@"undistort_image"];
    v21 = v2->_device;
    id v37 = 0;
    uint64_t v22 = [(MTLDevice *)v21 newComputePipelineStateWithFunction:v19 error:&v37];
    id v23 = v37;
    yuvPipelineState = v2->_yuvPipelineState;
    v2->_yuvPipelineState = (MTLComputePipelineState *)v22;

    if (!v2->_yuvPipelineState)
    {
      v25 = _ARLogGeneral_18();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138543874;
        v41 = v27;
        __int16 v42 = 2048;
        v43 = v2;
        __int16 v44 = 2112;
        id v45 = v23;
        _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create image undistortion pipeline state, error %@", buf, 0x20u);
      }
    }
    v28 = v2->_device;
    id v36 = v23;
    uint64_t v29 = [(MTLDevice *)v28 newComputePipelineStateWithFunction:v20 error:&v36];
    id v30 = v36;

    rgbPipelineState = v2->_rgbPipelineState;
    v2->_rgbPipelineState = (MTLComputePipelineState *)v29;

    if (!v2->_rgbPipelineState)
    {
      v32 = _ARLogGeneral_18();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        *(_DWORD *)buf = 138543874;
        v41 = v34;
        __int16 v42 = 2048;
        v43 = v2;
        __int16 v44 = 2112;
        id v45 = v30;
        _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create image undistortion pipeline state, error %@", buf, 0x20u);
      }
    }
  }
  return v2;
}

- (void)undistortFisheyeImage:(double)a3 withFisheyeIntrinsics:(double)a4 withFisheyeRadialCoefficients:(double)a5 toRectilinearImage:(double)a6 withRectilinearIntrinsics:(double)a7
{
  v42[1] = *MEMORY[0x1E4F143B8];
  size_t Width = CVPixelBufferGetWidth(a10);
  size_t Height = CVPixelBufferGetHeight(a10);
  v16 = *a11;
  if (!*a11)
  {
    uint64_t v41 = *MEMORY[0x1E4F24D20];
    v42[0] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    CVPixelBufferCreate(0, Width, Height, 0x34323076u, v17, a11);

    v16 = *a11;
  }
  size_t v18 = CVPixelBufferGetWidth(v16);
  size_t v19 = CVPixelBufferGetHeight(*a11);
  v31 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:Width height:Height mipmapped:0];
  [v31 setUsage:3];
  v20 = (void *)[a1[1] newTextureWithDescriptor:v31 iosurface:CVPixelBufferGetIOSurface(a10) plane:0];
  [v20 setLabel:@"com.apple.arkit.gpuimageundistortion.srcY"];
  id v30 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:Width >> 1 height:Height >> 1 mipmapped:0];
  [v30 setUsage:1];
  v21 = (void *)[a1[1] newTextureWithDescriptor:v30 iosurface:CVPixelBufferGetIOSurface(a10) plane:1];
  [v21 setLabel:@"com.apple.arkit.gpuimageundistortion.srcCbCr"];
  uint64_t v22 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:v18 height:v19 mipmapped:0];
  [v22 setUsage:3];
  id v23 = (void *)[a1[1] newTextureWithDescriptor:v22 iosurface:CVPixelBufferGetIOSurface(*a11) plane:0];
  [v23 setLabel:@"com.apple.arkit.gpuimageundistortion.dstY"];
  v24 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:v18 >> 1 height:v19 >> 1 mipmapped:0];
  [v24 setUsage:3];
  v25 = (void *)[a1[1] newTextureWithDescriptor:v24 iosurface:CVPixelBufferGetIOSurface(*a11) plane:1];
  [v25 setLabel:@"com.apple.arkit.gpuimageundistortion.dstCbCr"];
  v26 = CVBufferRetain(a10);
  v40[0] = v20;
  v40[1] = v21;
  v27 = v20;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v39[0] = v23;
  v39[1] = v25;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  objc_msgSend(a1, "undistortFisheyeTexture:withFisheyeIntrinsics:withFisheyeRadialCoefficients:toRectilinearImage:withRectilinearIntrinsics:", v28, v29, a2, a3, a4, a5, a6, a7, a8);

  CVBufferRelease(v26);
}

- (uint64_t)undistortFisheyeTexture:(float32x4_t)a3 withFisheyeIntrinsics:(float32x4_t)a4 withFisheyeRadialCoefficients:(float32x4_t)a5 toRectilinearImage:(__n128)a6 withRectilinearIntrinsics:(__n128)a7
{
  *(__n128 *)&v55[16] = a7;
  *(__n128 *)&v55[32] = a8;
  *(__n128 *)v55 = a6;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  float32x4_t v62 = a2;
  float32x4_t v63 = a3;
  float32x4_t v64 = a4;
  id v13 = a10;
  float32x4_t v61 = a5;
  id v14 = a11;
  if ([v13 count]
    && (unint64_t)[v13 count] <= 2
    && (uint64_t v15 = [v13 count], v15 == objc_msgSend(v14, "count")))
  {
    uint64_t v50 = [v13 count];
    v16 = [v14 firstObject];
    uint64_t v17 = [v16 width];
    uint64_t v51 = [v16 height];
    size_t v18 = [*(id *)(a1 + 16) commandBuffer];
    [v18 setLabel:@"com.apple.arkit.gpuimageundistortion.commandBuffer"];
    size_t v19 = *(void **)(a1 + 48);
    if (!v19
      || [v19 width] != v17
      || [*(id *)(a1 + 48) height] != v51
      || (uint32x4_t v20 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 80), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 64), a2)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 96), a4)), v20.i32[3] = v20.i32[2], (vminvq_u32(v20) & 0x80000000) == 0)|| (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 112), a5)) & 0x80000000) == 0|| (v21 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 144), *(float32x4_t *)&v55[16]), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 128), *(float32x4_t *)v55)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 160), *(float32x4_t *)&v55[32])), v21.i32[3] = v21.i32[2], (vminvq_u32(v21) & 0x80000000) == 0))
    {
      float32x4_t v22 = v63;
      *(float32x4_t *)(a1 + 64) = v62;
      *(float32x4_t *)(a1 + 80) = v22;
      *(float32x4_t *)(a1 + 96) = v64;
      *(float32x4_t *)(a1 + 112) = a5;
      *(_OWORD *)(a1 + 128) = *(_OWORD *)v55;
      *(_OWORD *)(a1 + 144) = *(_OWORD *)&v55[16];
      *(_OWORD *)(a1 + 160) = *(_OWORD *)&v55[32];
      id v23 = *(void **)(a1 + 48);
      if (!v23 || [v23 width] != v17 || objc_msgSend(*(id *)(a1 + 48), "height") != v51)
      {
        v24 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:105 width:v17 height:v51 mipmapped:0];
        [v24 setUsage:3];
        uint64_t v25 = [*(id *)(a1 + 8) newTextureWithDescriptor:v24];
        v26 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v25;
      }
      v27 = [v18 computeCommandEncoder];
      [v27 setLabel:@"com.apple.arkit.gpuimageundistortion.lutgeneration"];
      [v27 setComputePipelineState:*(void *)(a1 + 40)];
      *(_OWORD *)&buf[16] = 0u;
      long long v66 = 0u;
      *(_OWORD *)buf = 0u;
      simd_float3x3 v68 = __invert_f3(*(simd_float3x3 *)v55);
      *(_DWORD *)&buf[8] = v68.columns[0].i32[2];
      *(_DWORD *)&buf[24] = v68.columns[1].i32[2];
      *(void *)buf = v68.columns[0].i64[0];
      *(void *)&buf[16] = v68.columns[1].i64[0];
      DWORD2(v66) = v68.columns[2].i32[2];
      *(void *)&long long v66 = v68.columns[2].i64[0];
      [v27 setTexture:*(void *)(a1 + 48) atIndex:0];
      [v27 setBytes:&v62 length:48 atIndex:0];
      [v27 setBytes:&v61 length:16 atIndex:1];
      [v27 setBytes:buf length:48 atIndex:2];
      unint64_t v28 = [*(id *)(a1 + 40) threadExecutionWidth];
      unint64_t v29 = [*(id *)(a1 + 40) maxTotalThreadsPerThreadgroup] / v28;
      id v30 = v18;
      uint64_t v31 = v17;
      unint64_t v32 = (v28 + [*(id *)(a1 + 48) width] - 1) / v28;
      uint64_t v33 = [*(id *)(a1 + 48) height];
      unint64_t v58 = v32;
      unint64_t v59 = (v29 + v33 - 1) / v29;
      uint64_t v17 = v31;
      size_t v18 = v30;
      uint64_t v60 = 1;
      v57[0] = v28;
      v57[1] = v29;
      v57[2] = 1;
      [v27 dispatchThreadgroups:&v58 threadsPerThreadgroup:v57];
      [v27 endEncoding];
    }
    v34 = [v18 computeCommandEncoder];
    [v34 setLabel:@"com.apple.arkit.gpuimageundistortion.textureundistort"];
    uint64_t v35 = 24;
    if (v50 == 1) {
      uint64_t v35 = 32;
    }
    id v36 = *(id *)(a1 + v35);
    [v34 setComputePipelineState:v36];
    id v37 = [v13 firstObject];
    [v34 setTexture:v37 atIndex:0];

    if (v50 == 1)
    {
      [v34 setTexture:*(void *)(a1 + 48) atIndex:1];
      id v38 = [v14 firstObject];
      objc_super v39 = v34;
      v40 = v38;
      uint64_t v41 = 2;
    }
    else
    {
      uint64_t v46 = [v13 lastObject];
      [v34 setTexture:v46 atIndex:1];

      [v34 setTexture:*(void *)(a1 + 48) atIndex:2];
      v47 = [v14 firstObject];
      [v34 setTexture:v47 atIndex:3];

      id v38 = [v14 lastObject];
      objc_super v39 = v34;
      v40 = v38;
      uint64_t v41 = 4;
    }
    [v39 setTexture:v40 atIndex:v41];

    unint64_t v48 = [v36 threadExecutionWidth];
    unint64_t v49 = [v36 maxTotalThreadsPerThreadgroup];
    *(void *)buf = (v17 + v48 - 1) / v48;
    *(void *)&buf[8] = (v51 + v49 / v48 - 1) / (v49 / v48);
    uint64_t v44 = 1;
    *(void *)&buf[16] = 1;
    unint64_t v58 = v48;
    unint64_t v59 = v49 / v48;
    uint64_t v60 = 1;
    [v34 dispatchThreadgroups:buf threadsPerThreadgroup:&v58];
    [v34 endEncoding];
    [v18 commit];
    [v18 waitUntilCompleted];
  }
  else
  {
    v16 = _ARLogGeneral_18();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Incorrect number of input/output textures", buf, 0x16u);
    }
    uint64_t v44 = 0;
  }

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lut, 0);
  objc_storeStrong((id *)&self->_lutGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_rgbPipelineState, 0);
  objc_storeStrong((id *)&self->_yuvPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end