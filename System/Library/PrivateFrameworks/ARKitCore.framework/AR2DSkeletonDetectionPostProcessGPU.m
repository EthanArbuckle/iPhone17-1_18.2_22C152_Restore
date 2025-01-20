@interface AR2DSkeletonDetectionPostProcessGPU
- (AR2DSkeletonDetectionPostProcessGPU)init;
- (uint64_t)process:(double)a3 counter:(uint64_t)a4 shape:(__IOSurface *)a5;
- (void)dealloc;
- (void)init;
@end

@implementation AR2DSkeletonDetectionPostProcessGPU

- (AR2DSkeletonDetectionPostProcessGPU)init
{
  v22.receiver = self;
  v22.super_class = (Class)AR2DSkeletonDetectionPostProcessGPU;
  v2 = [(AR2DSkeletonDetectionPostProcessGPU *)&v22 init];
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v2->_device;
  v2->_device = v3;

  uint64_t v5 = [(MTLDevice *)v2->_device newCommandQueue];
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v5;

  v7 = ARKitCoreBundle();
  uint64_t v8 = [v7 URLForResource:@"default" withExtension:@"metallib"];
  if (!v8) {
    -[AR2DSkeletonDetectionPostProcessGPU init]();
  }
  v9 = (void *)v8;
  v10 = (void *)[(MTLDevice *)v2->_device newLibraryWithURL:v8 error:0];
  v11 = (void *)[v10 newFunctionWithName:@"interpolateBicubic"];
  uint64_t v12 = [(MTLDevice *)v2->_device newComputePipelineStateWithFunction:v11 error:0];
  pipelineStateInterpolate = v2->_pipelineStateInterpolate;
  v2->_pipelineStateInterpolate = (MTLComputePipelineState *)v12;

  v14 = (void *)[v10 newFunctionWithName:@"maxFilter"];
  uint64_t v15 = [(MTLDevice *)v2->_device newComputePipelineStateWithFunction:v14 error:0];
  pipelineStateMaxFilter = v2->_pipelineStateMaxFilter;
  v2->_pipelineStateMaxFilter = (MTLComputePipelineState *)v15;

  uint64_t v17 = [(MTLDevice *)v2->_device newBufferWithLength:2 * width * height * scale * scale * nChannels + 16 options:32];
  intermediate = v2->_intermediate;
  v2->_intermediate = (MTLBuffer *)v17;

  uint64_t v19 = [(MTLDevice *)v2->_device newBufferWithLength:2 * width * height * scale * scale * nChannels + 16 options:0];
  output = v2->_output;
  v2->_output = (MTLBuffer *)v19;

  return v2;
}

- (void)dealloc
{
  input = self->_input;
  self->_input = 0;

  intermediate = self->_intermediate;
  self->_intermediate = 0;

  output = self->_output;
  self->_output = 0;

  v6.receiver = self;
  v6.super_class = (Class)AR2DSkeletonDetectionPostProcessGPU;
  [(AR2DSkeletonDetectionPostProcessGPU *)&v6 dealloc];
}

- (uint64_t)process:(double)a3 counter:(uint64_t)a4 shape:(__IOSurface *)a5
{
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 8), "newBufferWithIOSurface:");
  uint64_t v12 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v11;

  bzero((void *)[*(id *)(a1 + 56) contents], objc_msgSend(*(id *)(a1 + 56), "length"));
  v13 = [*(id *)(a1 + 16) commandBuffer];
  unint64_t v14 = (unint64_t)(a2 * 0.125);
  unint64_t v15 = (unint64_t)(a3 * 0.125);
  v33[0] = (a3 * 0.125);
  v33[1] = a3;
  v33[2] = IOSurfaceGetBytesPerRow(a5) >> 1;
  v33[3] = a2;
  v16 = [v13 computeCommandEncoder];
  [v16 setComputePipelineState:*(void *)(a1 + 24)];
  [v16 setBuffer:*(void *)(a1 + 40) offset:0 atIndex:0];
  [v16 setBuffer:*(void *)(a1 + 48) offset:0 atIndex:1];
  [v16 setBytes:&precomputedInterpolateBicubic length:96 atIndex:2];
  [v16 setBytes:v33 length:16 atIndex:3];
  unint64_t v17 = [*(id *)(a1 + 24) threadExecutionWidth];
  unint64_t v18 = [*(id *)(a1 + 24) maxTotalThreadsPerThreadgroup];
  uint64_t v30 = scale * v14;
  uint64_t v31 = scale * v15;
  uint64_t v32 = nChannels;
  unint64_t v27 = v17;
  unint64_t v28 = v18 / v17;
  uint64_t v29 = 1;
  [v16 dispatchThreads:&v30 threadsPerThreadgroup:&v27];
  [v16 endEncoding];

  uint64_t v19 = [v13 computeCommandEncoder];
  [v19 setComputePipelineState:*(void *)(a1 + 32)];
  [v19 setBuffer:*(void *)(a1 + 48) offset:0 atIndex:0];
  [v19 setBuffer:*(void *)(a1 + 56) offset:0 atIndex:1];
  v20 = (void *)[*(id *)(a1 + 8) newBufferWithBytes:a6 length:4 options:0];
  [v19 setBuffer:v20 offset:0 atIndex:2];
  v21 = (void *)[*(id *)(a1 + 8) newBufferWithBytes:v33 length:16 options:0];
  [v19 setBuffer:v21 offset:0 atIndex:3];
  unint64_t v22 = [*(id *)(a1 + 32) threadExecutionWidth];
  unint64_t v23 = [*(id *)(a1 + 32) maxTotalThreadsPerThreadgroup];
  uint64_t v30 = scale * v14;
  uint64_t v31 = scale * v15;
  uint64_t v32 = nChannels;
  unint64_t v27 = v22;
  unint64_t v28 = v23 / v22;
  uint64_t v29 = 1;
  [v19 dispatchThreads:&v30 threadsPerThreadgroup:&v27];
  [v19 endEncoding];
  [v13 commit];
  [v13 waitUntilCompleted];
  id v24 = v20;
  memcpy(a6, (const void *)[v24 contents], objc_msgSend(v24, "length"));
  uint64_t v25 = [*(id *)(a1 + 56) contents];

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_intermediate, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_pipelineStateMaxFilter, 0);
  objc_storeStrong((id *)&self->_pipelineStateInterpolate, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)init
{
  __assert_rtn("-[AR2DSkeletonDetectionPostProcessGPU init]", "AR2DSkeletonDetectionPostProcessGPU.m", 50, "url != nil");
}

@end