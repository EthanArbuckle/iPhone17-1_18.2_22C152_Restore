@interface ABPK2DDetectionPostprocessGPU
- (ABPK2DDetectionPostprocessGPU)init;
- (ABPK2DDetectionPostprocessGPU)initWithNumberOfChannels:(unint64_t)a3;
- (uint64_t)process:(double)a3 counter:(uint64_t)a4 shape:(__IOSurface *)a5;
- (void)_copyToInputAsFloat16:(float *)a3 shape:(CGSize)a4;
- (void)dealloc;
@end

@implementation ABPK2DDetectionPostprocessGPU

- (ABPK2DDetectionPostprocessGPU)init
{
  return [(ABPK2DDetectionPostprocessGPU *)self initWithNumberOfChannels:19];
}

- (ABPK2DDetectionPostprocessGPU)initWithNumberOfChannels:(unint64_t)a3
{
  v27.receiver = self;
  v27.super_class = (Class)ABPK2DDetectionPostprocessGPU;
  v4 = [(ABPK2DDetectionPostprocessGPU *)&v27 init];
  v4->_nChannels = a3;
  v5 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v4->_device;
  v4->_device = v5;

  uint64_t v7 = [(MTLDevice *)v4->_device newCommandQueue];
  commandQueue = v4->_commandQueue;
  v4->_commandQueue = (MTLCommandQueue *)v7;

  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 URLForResource:@"default" withExtension:@"metallib"];
  v11 = v4->_device;
  id v26 = 0;
  uint64_t v12 = [(MTLDevice *)v11 newLibraryWithURL:v10 error:&v26];
  id v13 = v26;
  library = v4->_library;
  v4->_library = (MTLLibrary *)v12;

  v15 = (void *)[(MTLLibrary *)v4->_library newFunctionWithName:@"interpolateBicubic"];
  uint64_t v16 = [(MTLDevice *)v4->_device newComputePipelineStateWithFunction:v15 error:0];
  pipelineStateInterpolate = v4->_pipelineStateInterpolate;
  v4->_pipelineStateInterpolate = (MTLComputePipelineState *)v16;

  v18 = (void *)[(MTLLibrary *)v4->_library newFunctionWithName:@"maxFilter"];
  uint64_t v19 = [(MTLDevice *)v4->_device newComputePipelineStateWithFunction:v18 error:0];
  pipelineStateMaxFilter = v4->_pipelineStateMaxFilter;
  v4->_pipelineStateMaxFilter = (MTLComputePipelineState *)v19;

  uint64_t v21 = [(MTLDevice *)v4->_device newBufferWithLength:2 * width * height * scale * scale * v4->_nChannels + 16 options:32];
  intermediate = v4->_intermediate;
  v4->_intermediate = (MTLBuffer *)v21;

  uint64_t v23 = [(MTLDevice *)v4->_device newBufferWithLength:2 * width * height * scale * scale * v4->_nChannels + 16 options:0];
  output = v4->_output;
  v4->_output = (MTLBuffer *)v23;

  return v4;
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
  v6.super_class = (Class)ABPK2DDetectionPostprocessGPU;
  [(ABPK2DDetectionPostprocessGPU *)&v6 dealloc];
}

- (void)_copyToInputAsFloat16:(float *)a3 shape:(CGSize)a4
{
  unint64_t v5 = (unint64_t)(a4.height * (a4.width * (double)self->_nChannels * 0.125) * 0.125);
  for (i = (_WORD *)[(MTLBuffer *)self->_input contents]; v5; --v5)
  {
    int v7 = *(_DWORD *)a3++;
    _S0 = v7;
    __asm { FCVT            H0, S0 }
    *i++ = _S0;
  }
}

- (uint64_t)process:(double)a3 counter:(uint64_t)a4 shape:(__IOSurface *)a5
{
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 16), "newBufferWithIOSurface:");
  uint64_t v12 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v11;

  bzero((void *)[*(id *)(a1 + 64) contents], objc_msgSend(*(id *)(a1 + 64), "length"));
  id v13 = [*(id *)(a1 + 24) commandBuffer];
  [v13 setLabel:@"com.apple.abpk.2ddetectionpostprocessGPU.commandBuffer"];
  unint64_t v14 = (unint64_t)(a2 * 0.125);
  unint64_t v15 = (unint64_t)(a3 * 0.125);
  v35[0] = (a3 * 0.125);
  v35[1] = a3;
  v35[2] = IOSurfaceGetBytesPerRow(a5) >> 1;
  v35[3] = a2;
  uint64_t v16 = [v13 computeCommandEncoder];
  [v16 setLabel:@"com.apple.abpk.2ddetectionpostprocessGPU.interpolation"];
  [v16 setComputePipelineState:*(void *)(a1 + 32)];
  [v16 setBuffer:*(void *)(a1 + 48) offset:0 atIndex:0];
  [v16 setBuffer:*(void *)(a1 + 56) offset:0 atIndex:1];
  [v16 setBytes:&precomputedInterpolateBicubic length:96 atIndex:2];
  [v16 setBytes:v35 length:16 atIndex:3];
  unint64_t v17 = [*(id *)(a1 + 32) threadExecutionWidth];
  unint64_t v18 = [*(id *)(a1 + 32) maxTotalThreadsPerThreadgroup];
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v32 = scale * v14;
  uint64_t v33 = scale * v15;
  uint64_t v34 = v19;
  unint64_t v29 = v17;
  unint64_t v30 = v18 / v17;
  uint64_t v31 = 1;
  [v16 dispatchThreads:&v32 threadsPerThreadgroup:&v29];
  [v16 endEncoding];

  v20 = [v13 computeCommandEncoder];
  [v20 setLabel:@"com.apple.abpk.2ddetectionpostprocessGPU.maxfilter"];
  [v20 setComputePipelineState:*(void *)(a1 + 40)];
  [v20 setBuffer:*(void *)(a1 + 56) offset:0 atIndex:0];
  [v20 setBuffer:*(void *)(a1 + 64) offset:0 atIndex:1];
  uint64_t v21 = (void *)[*(id *)(a1 + 16) newBufferWithBytes:a6 length:4 options:0];
  [v20 setBuffer:v21 offset:0 atIndex:2];
  v22 = (void *)[*(id *)(a1 + 16) newBufferWithBytes:v35 length:16 options:0];
  [v20 setBuffer:v22 offset:0 atIndex:3];
  unint64_t v23 = [*(id *)(a1 + 40) threadExecutionWidth];
  unint64_t v24 = [*(id *)(a1 + 40) maxTotalThreadsPerThreadgroup];
  uint64_t v25 = *(void *)(a1 + 8);
  uint64_t v32 = scale * v14;
  uint64_t v33 = scale * v15;
  uint64_t v34 = v25;
  unint64_t v29 = v23;
  unint64_t v30 = v24 / v23;
  uint64_t v31 = 1;
  [v20 dispatchThreads:&v32 threadsPerThreadgroup:&v29];
  [v20 endEncoding];
  [v13 commit];
  [v13 waitUntilCompleted];
  id v26 = v21;
  memcpy(a6, (const void *)[v26 contents], objc_msgSend(v26, "length"));
  uint64_t v27 = [*(id *)(a1 + 64) contents];

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_intermediate, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_pipelineStateMaxFilter, 0);
  objc_storeStrong((id *)&self->_pipelineStateInterpolate, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end