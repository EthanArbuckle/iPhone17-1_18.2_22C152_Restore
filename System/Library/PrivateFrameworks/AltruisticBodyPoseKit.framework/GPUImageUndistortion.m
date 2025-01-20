@interface GPUImageUndistortion
- (GPUImageUndistortion)init;
- (void)undistortFisheyeImage:(float32x4_t)a3 withFisheyeIntrinsics:(float32x4_t)a4 withFisheyeRadialCoefficients:(float32x4_t)a5 toRectilinearImage:(__n128)a6 withRectilinearIntrinsics:(__n128)a7;
@end

@implementation GPUImageUndistortion

- (GPUImageUndistortion)init
{
  v21.receiver = self;
  v21.super_class = (Class)GPUImageUndistortion;
  v2 = [(GPUImageUndistortion *)&v21 init];
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v2->_device;
  v2->_device = v3;

  uint64_t v5 = [(MTLDevice *)v2->_device newCommandQueue];
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v5;

  [(MTLCommandQueue *)v2->_commandQueue setLabel:@"com.apple.abpk.gpuimageundistortion.queue"];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 URLForResource:@"default" withExtension:@"metallib"];
  v9 = v2->_device;
  id v20 = 0;
  uint64_t v10 = [(MTLDevice *)v9 newLibraryWithURL:v8 error:&v20];
  id v11 = v20;
  library = v2->_library;
  v2->_library = (MTLLibrary *)v10;

  v13 = (void *)[(MTLLibrary *)v2->_library newFunctionWithName:@"compute_lut"];
  uint64_t v14 = [(MTLDevice *)v2->_device newComputePipelineStateWithFunction:v13 error:0];
  lutGenerationPipelineState = v2->_lutGenerationPipelineState;
  v2->_lutGenerationPipelineState = (MTLComputePipelineState *)v14;

  v16 = (void *)[(MTLLibrary *)v2->_library newFunctionWithName:@"undistort_image"];
  uint64_t v17 = [(MTLDevice *)v2->_device newComputePipelineStateWithFunction:v16 error:0];
  pipelineState = v2->_pipelineState;
  v2->_pipelineState = (MTLComputePipelineState *)v17;

  return v2;
}

- (void)undistortFisheyeImage:(float32x4_t)a3 withFisheyeIntrinsics:(float32x4_t)a4 withFisheyeRadialCoefficients:(float32x4_t)a5 toRectilinearImage:(__n128)a6 withRectilinearIntrinsics:(__n128)a7
{
  *(__n128 *)&v44[16] = a7;
  *(__n128 *)&v44[32] = a8;
  *(__n128 *)v44 = a6;
  v64[1] = *MEMORY[0x263EF8340];
  float32x4_t v61 = a3;
  float32x4_t v62 = a4;
  float32x4_t v59 = a5;
  float32x4_t v60 = a2;
  size_t Width = CVPixelBufferGetWidth(a10);
  size_t Height = CVPixelBufferGetHeight(a10);
  uint64_t v14 = *a11;
  if (!*a11)
  {
    uint64_t v63 = *MEMORY[0x263F04130];
    v64[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef v15 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
    CVPixelBufferCreate(0, Width, Height, 0x34323076u, v15, a11);

    uint64_t v14 = *a11;
  }
  size_t v16 = CVPixelBufferGetWidth(v14);
  size_t v17 = CVPixelBufferGetHeight(*a11);
  CFDictionaryRef pixelBufferAttributes = [*(id *)(a1 + 16) commandBuffer];
  [(__CFDictionary *)pixelBufferAttributes setLabel:@"com.apple.abpk.gpuimageundistortion.commandBuffer"];
  v18 = *(void **)(a1 + 40);
  if (!v18
    || [v18 width] != v16
    || [*(id *)(a1 + 40) height] != v17
    || (v19 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 64), v61), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 48), v60)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 80), v62)), v19.i32[3] = v19.i32[2], (vminvq_u32(v19) & 0x80000000) == 0)|| (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 96), v59)) & 0x80000000) == 0|| (uint32x4_t v20 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 128), *(float32x4_t *)&v44[16]), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 112), *(float32x4_t *)v44)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 144), *(float32x4_t *)&v44[32])), v20.i32[3] = v20.i32[2], (vminvq_u32(v20) & 0x80000000) == 0))
  {
    float32x4_t v21 = v61;
    float32x4_t v22 = v62;
    float32x4_t v23 = v59;
    *(float32x4_t *)(a1 + 48) = v60;
    *(float32x4_t *)(a1 + 64) = v21;
    *(float32x4_t *)(a1 + 80) = v22;
    *(float32x4_t *)(a1 + 96) = v23;
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v44;
    *(_OWORD *)(a1 + 128) = *(_OWORD *)&v44[16];
    *(_OWORD *)(a1 + 144) = *(_OWORD *)&v44[32];
    v24 = *(void **)(a1 + 40);
    if (!v24 || [v24 width] != v16 || objc_msgSend(*(id *)(a1 + 40), "height") != v17)
    {
      v25 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 105, v16, v17, 0, *(_OWORD *)v44);
      [v25 setUsage:3];
      uint64_t v26 = [*(id *)(a1 + 8) newTextureWithDescriptor:v25];
      v27 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v26;
    }
    v28 = [(__CFDictionary *)pixelBufferAttributes computeCommandEncoder];
    [v28 setLabel:@"com.apple.abpk.gpuimageundistortion.generatelut"];
    [v28 setComputePipelineState:*(void *)(a1 + 32)];
    size_t v29 = v17;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v56 = 0u;
    simd_float3x3 v65 = __invert_f3(*(simd_float3x3 *)v44);
    DWORD2(v56) = v65.columns[0].i32[2];
    DWORD2(v57) = v65.columns[1].i32[2];
    *(void *)&long long v56 = v65.columns[0].i64[0];
    *(void *)&long long v57 = v65.columns[1].i64[0];
    DWORD2(v58) = v65.columns[2].i32[2];
    *(void *)&long long v58 = v65.columns[2].i64[0];
    [v28 setTexture:*(void *)(a1 + 40) atIndex:0];
    [v28 setBytes:&v60 length:48 atIndex:0];
    [v28 setBytes:&v59 length:16 atIndex:1];
    [v28 setBytes:&v56 length:48 atIndex:2];
    unint64_t v30 = [*(id *)(a1 + 32) threadExecutionWidth];
    unint64_t v31 = [*(id *)(a1 + 32) maxTotalThreadsPerThreadgroup];
    uint64_t v32 = [*(id *)(a1 + 40) width];
    uint64_t v33 = [*(id *)(a1 + 40) height];
    v55[0] = (v30 + v32 - 1) / v30;
    v55[1] = (v31 / v30 + v33 - 1) / (v31 / v30);
    v55[2] = 1;
    v54[0] = v30;
    v54[1] = v31 / v30;
    v54[2] = 1;
    [v28 dispatchThreadgroups:v55 threadsPerThreadgroup:v54];
    [v28 endEncoding];

    size_t v17 = v29;
  }
  v46 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0, *(_OWORD *)v44);
  [v46 setUsage:3];
  v45 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v46 iosurface:CVPixelBufferGetIOSurface(a10) plane:0];
  [v45 setLabel:@"com.apple.abpk.gpuimageundistortion.srcY"];
  v49 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:30 width:Width >> 1 height:Height >> 1 mipmapped:0];
  [v49 setUsage:1];
  v34 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v49 iosurface:CVPixelBufferGetIOSurface(a10) plane:1];
  [v34 setLabel:@"com.apple.abpk.gpuimageundistortion.srcCbCr"];
  CVBufferRef v35 = CVBufferRetain(a10);
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __143__GPUImageUndistortion_undistortFisheyeImage_withFisheyeIntrinsics_withFisheyeRadialCoefficients_toRectilinearImage_withRectilinearIntrinsics___block_invoke;
  v53[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
  v53[4] = v35;
  [(__CFDictionary *)pixelBufferAttributes addCompletedHandler:v53];
  v36 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:v16 height:v17 mipmapped:0];
  [v36 setUsage:3];
  v37 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v36 iosurface:CVPixelBufferGetIOSurface(*a11) plane:0];
  [v37 setLabel:@"com.apple.abpk.gpuimageundistortion.dstY"];
  size_t v38 = v17;
  v39 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:30 width:v16 >> 1 height:v17 >> 1 mipmapped:0];
  [v39 setUsage:3];
  v40 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v39 iosurface:CVPixelBufferGetIOSurface(*a11) plane:1];
  [v40 setLabel:@"com.apple.abpk.gpuimageundistortion.dstCbCr"];
  v41 = [(__CFDictionary *)pixelBufferAttributes computeCommandEncoder];
  [v41 setLabel:@"com.apple.abpk.gpuimageundistortion.settexture"];
  [v41 setComputePipelineState:*(void *)(a1 + 24)];
  [v41 setTexture:v45 atIndex:0];
  [v41 setTexture:v34 atIndex:1];
  [v41 setTexture:*(void *)(a1 + 40) atIndex:2];
  [v41 setTexture:v37 atIndex:3];
  [v41 setTexture:v40 atIndex:4];
  unint64_t v42 = [*(id *)(a1 + 24) threadExecutionWidth];
  unint64_t v43 = [*(id *)(a1 + 24) maxTotalThreadsPerThreadgroup];
  v52[0] = (v16 + v42 - 1) / v42;
  v52[1] = (v38 + v43 / v42 - 1) / (v43 / v42);
  v52[2] = 1;
  v51[0] = v42;
  v51[1] = v43 / v42;
  v51[2] = 1;
  [v41 dispatchThreadgroups:v52 threadsPerThreadgroup:v51];
  [v41 endEncoding];
  [(__CFDictionary *)pixelBufferAttributes commit];
  [(__CFDictionary *)pixelBufferAttributes waitUntilCompleted];
}

void __143__GPUImageUndistortion_undistortFisheyeImage_withFisheyeIntrinsics_withFisheyeRadialCoefficients_toRectilinearImage_withRectilinearIntrinsics___block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_lut, 0);
  objc_storeStrong((id *)&self->_lutGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end