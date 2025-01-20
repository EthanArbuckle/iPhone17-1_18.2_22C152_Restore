@interface MetalFAST9BRIEF
+ (id)_createMTLBufferFromRectRegionsDesiredKeypoints:(id)a3 device:(id)a4 storageMode:(unint64_t)a5 maxAllowedDescriptors:(unint64_t *)a6;
+ (id)_createMTLBufferFromRects:(id)a3 device:(id)a4 storageMode:(unint64_t)a5 maxRectWidth:(unint64_t *)a6 maxRectHeight:(unint64_t *)a7;
- (BOOL)didFinishInitializationWithTimeout:(double)a3;
- (MTLCommandQueue)queue;
- (MTLDevice)device;
- (MetalFAST9BRIEF)init;
- (__CVMetalTextureCache)textureCache;
- (id)_textureFromPixelBuffer:(__CVBuffer *)a3 forcedMetalPixelFormat:(unint64_t)a4 forcedWidthDivisior:(int)a5;
- (void)ORBDescriptorsFromPixelBuffer_metal:(id)a3 inputBuffer:(__CVBuffer *)a4 descriptorBuffer:(id)a5 refinedKeypointsBuffer:(id)a6 responseBuffer:(id)a7 cumulativeKeypointsPerRegionBuffer:(id)a8 intermediateBuffers:(id)a9;
- (void)_ORBDescriptorsFromTextures_part1_metal:(id)a3 inputTexture_RGBA8Uint:(id)a4 inputTexture_R8Unorm:(id)a5 responseBuffer:(id)a6 cumulativeKeypointsPerRegionBuffer:(id)a7 intermediateBuffers:(id)a8;
- (void)_ORBDescriptorsFromTextures_part2_metal:(id)a3 inputTexture_RGBA8Uint:(id)a4 inputTexture_R8Unorm:(id)a5 descriptorBuffer:(id)a6 refinedKeypointsBuffer:(id)a7 cumulativeKeypointsPerRegionBuffer:(id)a8 intermediateBuffers:(id)a9 keypointCount:(int)a10;
- (void)_boxBlur_metal:(id)a3 inputImageTexture:(id)a4 boxBlurredTexture:(id)a5;
- (void)_computeResponseMap_metal:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5 garbagePixelCount:(unsigned int)a6;
- (void)_cumulativeSum_metal:(id)a3 expectedPointsBuffer:(id)a4 cumulativePointsBuffer:(id)a5 regionCountBuffer:(id)a6 keypointCountBuffer:(id)a7 regionCount:(unint64_t)a8;
- (void)_extractORB_metal:(id)a3 boxBlurredTexture:(id)a4 keypointLocationsBuffer:(id)a5 outputORBDescriptorBuffer:(id)a6 keypointCountBuffer:(id)a7 keypointCount:(unint64_t)a8;
- (void)_gaussianishBlur_metal:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5 offset:(CGPoint)a6;
- (void)_generateHistograms_metal:(id)a3 suppressedTexture:(id)a4 tileBuffer:(id)a5 desiredKeypointCountsBuffer:(id)a6 thresholdsBuffer:(id)a7 histogramBuffer:(id)a8 thresholdRangeBuffer:(id)a9 keypointsAtChosenThresholdBuffer:(id)a10 truncatedRegionsBuffer:(id)a11 tileCount:(unint64_t)a12 maxTileHeight:(unint64_t)a13;
- (void)_listKeypoints2_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 maxRegionHeight:(double)a12;
- (void)_listKeypoints3_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 maxRegionHeight:(double)a12 maxRegionWidth:(double)a13;
- (void)_listKeypointsSimple_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 desiredKeypointsBuffer:(id)a12 indexBuffer:(id)a13;
- (void)_refineKeypoints_metal:(id)a3 inputImageTexture:(id)a4 keypointLocationsBuffer:(id)a5 refinedLocationsBuffer:(id)a6 keypointCountBuffer:(id)a7 keypointCount:(unint64_t)a8 debugIntermediatesBuffer:(id)a9 cumulativePointsBuffer:(id)a10 tileCountBuffer:(id)a11;
- (void)_suppressResponseMap_metal:(id)a3 unsuppressedTexture:(id)a4 suppressedTexture:(id)a5 garbagePixelCount:(unsigned int)a6;
- (void)dealloc;
@end

@implementation MetalFAST9BRIEF

- (__CVMetalTextureCache)textureCache
{
  return self->_textureCache;
}

- (MetalFAST9BRIEF)init
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)MetalFAST9BRIEF;
  v2 = [(MetalFAST9BRIEF *)&v71 init];
  if (!v2) {
    goto LABEL_19;
  }
  size_t v72 = 50;
  v3 = malloc_type_malloc(0x32uLL, 0xCA10BF4BuLL);
  *(void *)v74 = 0x100000006;
  if (sysctl(v74, 2u, v3, &v72, 0, 0))
  {
    v4 = 0;
  }
  else
  {
    v4 = [NSString stringWithUTF8String:v3];
  }
  free(v3);
  if (([&unk_1F38B5840 containsObject:v4] & 1) == 0)
  {
    if (qword_1EBE80580 != -1) {
      dispatch_once(&qword_1EBE80580, &unk_1F38B08B0);
    }
    if (dword_1EBE80578 <= 0)
    {
      v6 = (MTLDevice *)MTLCreateSystemDefaultDevice();
      device = v2->_device;
      v2->_device = v6;

      uint64_t v8 = [(MTLDevice *)v2->_device newCommandQueue];
      queue = v2->_queue;
      v2->_queue = (MTLCommandQueue *)v8;

      dispatch_data_t v10 = dispatch_data_create(&inertiaCamMetalLibStart, &inertiaCamMetalLibEnd - &inertiaCamMetalLibStart, 0, 0);
      v11 = v2->_device;
      id v70 = 0;
      uint64_t v12 = [(MTLDevice *)v11 newLibraryWithData:v10 error:&v70];
      id v13 = v70;
      library = v2->_library;
      v2->_library = (MTLLibrary *)v12;

      if (!v12)
      {
        v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v16 = [v15 pathForResource:@"InertiaCamMetalLib" ofType:@"metallib"];

        if (!v16)
        {
          v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v16 = [v17 pathForResource:@"default" ofType:@"metallib"];
        }
        v18 = v2->_device;
        id v69 = v13;
        uint64_t v19 = [(MTLDevice *)v18 newLibraryWithFile:v16 error:&v69];
        id v20 = v69;

        v21 = v2->_library;
        v2->_library = (MTLLibrary *)v19;

        id v13 = v20;
      }
      uint64_t v22 = [(MTLLibrary *)v2->_library newFunctionWithName:@"computeResponseMap"];
      responseMapKernel = v2->_responseMapKernel;
      v2->_responseMapKernel = (MTLFunction *)v22;

      uint64_t v24 = [(MTLLibrary *)v2->_library newFunctionWithName:@"computeResponseMap4"];
      response4MapKernel = v2->_response4MapKernel;
      v2->_response4MapKernel = (MTLFunction *)v24;

      uint64_t v26 = [(MTLLibrary *)v2->_library newFunctionWithName:@"suppressResponseMap"];
      suppressMapKernel = v2->_suppressMapKernel;
      v2->_suppressMapKernel = (MTLFunction *)v26;

      uint64_t v28 = [(MTLLibrary *)v2->_library newFunctionWithName:@"suppressResponseMap4"];
      suppress4MapKernel = v2->_suppress4MapKernel;
      v2->_suppress4MapKernel = (MTLFunction *)v28;

      uint64_t v30 = [(MTLLibrary *)v2->_library newFunctionWithName:@"computeHistograms"];
      computeHistogramKernel = v2->_computeHistogramKernel;
      v2->_computeHistogramKernel = (MTLFunction *)v30;

      uint64_t v32 = [(MTLLibrary *)v2->_library newFunctionWithName:@"computeHistograms4"];
      compute4HistogramKernel = v2->_compute4HistogramKernel;
      v2->_compute4HistogramKernel = (MTLFunction *)v32;

      uint64_t v34 = [(MTLLibrary *)v2->_library newFunctionWithName:@"histogramThreshold"];
      histogramThresholdKernel = v2->_histogramThresholdKernel;
      v2->_histogramThresholdKernel = (MTLFunction *)v34;

      uint64_t v36 = [(MTLLibrary *)v2->_library newFunctionWithName:@"cumulativeSumSimple"];
      cumulativeSumSimpleKernel = v2->_cumulativeSumSimpleKernel;
      v2->_cumulativeSumSimpleKernel = (MTLFunction *)v36;

      uint64_t v38 = [(MTLLibrary *)v2->_library newFunctionWithName:@"compactMPSBuffers"];
      compactMPSBuffersKernel = v2->_compactMPSBuffersKernel;
      v2->_compactMPSBuffersKernel = (MTLFunction *)v38;

      uint64_t v40 = [(MTLLibrary *)v2->_library newFunctionWithName:@"listKeypoints_simple"];
      listKeypointsSimpleKernel = v2->_listKeypointsSimpleKernel;
      v2->_listKeypointsSimpleKernel = (MTLFunction *)v40;

      uint64_t v42 = [(MTLLibrary *)v2->_library newFunctionWithName:@"listKeypoints"];
      listKeypointsKernel = v2->_listKeypointsKernel;
      v2->_listKeypointsKernel = (MTLFunction *)v42;

      uint64_t v44 = [(MTLLibrary *)v2->_library newFunctionWithName:@"listKeypoints2"];
      listKeypoints2Kernel = v2->_listKeypoints2Kernel;
      v2->_listKeypoints2Kernel = (MTLFunction *)v44;

      uint64_t v46 = [(MTLLibrary *)v2->_library newFunctionWithName:@"listKeypoints4"];
      listKeypoints3Kernel = v2->_listKeypoints3Kernel;
      v2->_listKeypoints3Kernel = (MTLFunction *)v46;

      uint64_t v48 = [(MTLLibrary *)v2->_library newFunctionWithName:@"refineKeypoints"];
      refineKeypointKernel = v2->_refineKeypointKernel;
      v2->_refineKeypointKernel = (MTLFunction *)v48;

      uint64_t v50 = [(MTLLibrary *)v2->_library newFunctionWithName:@"ORB_img"];
      extractORBKernel = v2->_extractORBKernel;
      v2->_extractORBKernel = (MTLFunction *)v50;

      uint64_t v52 = [(MTLLibrary *)v2->_library newFunctionWithName:@"diameter5BoxBlur_2y"];
      boxBlurKernel = v2->_boxBlurKernel;
      v2->_boxBlurKernel = (MTLFunction *)v52;

      uint64_t v54 = [(MTLLibrary *)v2->_library newFunctionWithName:@"diameter5BoxBlur0"];
      boxBlurKernel_R8 = v2->_boxBlurKernel_R8;
      v2->_boxBlurKernel_R8 = (MTLFunction *)v54;

      uint64_t v56 = [(MTLLibrary *)v2->_library newFunctionWithName:@"gaussianishConvolve3x3"];
      gaussianishBlurKernel = v2->_gaussianishBlurKernel;
      v2->_gaussianishBlurKernel = (MTLFunction *)v56;

      id v58 = objc_alloc_init(MEMORY[0x1E4F35300]);
      [v58 setRAddressMode:0];
      [v58 setSAddressMode:0];
      [v58 setTAddressMode:0];
      [v58 setMinFilter:1];
      [v58 setMagFilter:1];
      [v58 setMipFilter:0];
      [v58 setNormalizedCoordinates:0];
      uint64_t v59 = [(MTLDevice *)v2->_device newSamplerStateWithDescriptor:v58];
      clampedLinearNonNormSamplerState = v2->_clampedLinearNonNormSamplerState;
      v2->_clampedLinearNonNormSamplerState = (MTLSamplerState *)v59;

      v61 = [MEMORY[0x1E4F1CA48] array];
      v62 = v2->_suppress4MapKernel;
      v73[0] = v2->_response4MapKernel;
      v73[1] = v62;
      v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
      [v61 addObjectsFromArray:v63];

      [v61 addObject:v2->_gaussianishBlurKernel];
      uint64_t v64 = sub_1DD4CA0EC(v2->_device, v61);
      pipelineStates = v2->_pipelineStates;
      v2->_pipelineStates = (PipelineStatePromise *)v64;

      size_t v72 = 0;
      uint64_t v66 = CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F1CC08], v2->_device, MEMORY[0x1E4F1CC08], (CVMetalTextureCacheRef *)&v72);
      if (v66)
      {
        NSLog(&cfstr_Cvmetaltexture.isa, v66);
        int v67 = 1;
      }
      else
      {
        int v67 = 0;
        v2->_textureCache = (__CVMetalTextureCache *)v72;
      }

      if (v67) {
        goto LABEL_10;
      }
LABEL_19:
      v5 = v2;
      goto LABEL_20;
    }
  }

LABEL_10:
  v5 = 0;
LABEL_20:

  return v5;
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  v4.receiver = self;
  v4.super_class = (Class)MetalFAST9BRIEF;
  [(MetalFAST9BRIEF *)&v4 dealloc];
}

- (BOOL)didFinishInitializationWithTimeout:(double)a3
{
  return ![(PipelineStatePromise *)self->_pipelineStates timesOutWaitingForPipelineStates:a3]&& [(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful];
}

- (id)_textureFromPixelBuffer:(__CVBuffer *)a3 forcedMetalPixelFormat:(unint64_t)a4 forcedWidthDivisior:(int)a5
{
  unint64_t v8 = a5;
  uint64_t v9 = a5 - 1;
  if (CVPixelBufferIsPlanar(a3))
  {
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  }
  else
  {
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
    size_t WidthOfPlane = CVPixelBufferGetWidth(a3);
    size_t HeightOfPlane = CVPixelBufferGetHeight(a3);
  }
  size_t v13 = HeightOfPlane;
  size_t v14 = (v9 + WidthOfPlane) / v8;
  if (a4) {
    goto LABEL_15;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  a4 = 13;
  if (PixelFormatType > 1111970368)
  {
    if (PixelFormatType == 1380401729)
    {
LABEL_13:
      a4 = 73;
      goto LABEL_15;
    }
    if (PixelFormatType == 1278226488) {
      goto LABEL_15;
    }
    int v16 = 1111970369;
  }
  else
  {
    if (PixelFormatType == 875704422 || PixelFormatType == 875704438) {
      goto LABEL_15;
    }
    int v16 = 1094862674;
  }
  if (PixelFormatType == v16) {
    goto LABEL_13;
  }
  a4 = 0;
LABEL_15:
  CVMetalTextureRef image = 0;
  if (CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_textureCache, a3, MEMORY[0x1E4F1CC08], (MTLPixelFormat)a4, v14, v13, 0, &image))
  {
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = image == 0;
  }
  if (v17
    || (CFAutorelease(image), CVMetalTextureGetTexture(image),
                              (v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v18 = 0;
    if (!CVPixelBufferLockBaseAddress(a3, 0))
    {
      if (CVPixelBufferIsPlanar(a3)) {
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      }
      else {
        BaseAddressOfPlane = CVPixelBufferGetBaseAddress(a3);
      }
      id v20 = BaseAddressOfPlane;
      v21 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a4 width:v14 height:v13 mipmapped:0];
      device = self->_device;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1DD4CAD6C;
      v25[3] = &unk_1E6CC89D8;
      v25[4] = a3;
      v23 = (void *)[(MTLDevice *)device newBufferWithBytesNoCopy:v20 length:v13 * BytesPerRowOfPlane options:0 deallocator:v25];
      [v21 setStorageMode:0];
      v18 = (void *)[v23 newTextureWithDescriptor:v21 offset:0 bytesPerRow:BytesPerRowOfPlane];
    }
  }
  return v18;
}

- (void)_computeResponseMap_metal:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5 garbagePixelCount:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v21 = a6;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v18);
  }
  size_t v13 = [v10 computeCommandEncoder];
  size_t v14 = [(PipelineStatePromise *)self->_pipelineStates pipelineStateForFunction:self->_response4MapKernel];
  [v13 setComputePipelineState:v14];
  [v13 setTexture:v11 atIndex:0];
  [v13 setTexture:v12 atIndex:1];
  [v13 setBytes:&v21 length:4 atIndex:0];
  unint64_t v15 = [v14 threadExecutionWidth];
  unint64_t v16 = [v14 maxTotalThreadsPerThreadgroup];
  unint64_t v17 = v16 / [v14 threadExecutionWidth];
  v20[0] = (v15 + [v11 width] - 1) / v15;
  v20[1] = (v17 + [v11 height] - 1) / v17;
  v20[2] = 1;
  v19[0] = v15;
  v19[1] = v17;
  v19[2] = 1;
  [v13 dispatchThreadgroups:v20 threadsPerThreadgroup:v19];
  [v13 endEncoding];
}

- (void)_suppressResponseMap_metal:(id)a3 unsuppressedTexture:(id)a4 suppressedTexture:(id)a5 garbagePixelCount:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v21 = a6;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v18);
  }
  size_t v13 = [v10 computeCommandEncoder];
  size_t v14 = [(PipelineStatePromise *)self->_pipelineStates pipelineStateForFunction:self->_suppress4MapKernel];
  [v13 setComputePipelineState:v14];
  [v13 setTexture:v11 atIndex:0];
  [v13 setTexture:v12 atIndex:2];
  [v13 setBytes:&v21 length:4 atIndex:0];
  unint64_t v15 = [v14 threadExecutionWidth];
  unint64_t v16 = [v14 maxTotalThreadsPerThreadgroup];
  unint64_t v17 = v16 / [v14 threadExecutionWidth];
  v20[0] = (v15 + [v11 width] - 1) / v15;
  v20[1] = (v17 + [v11 height] - 1) / v17;
  v20[2] = 1;
  v19[0] = v15;
  v19[1] = v17;
  v19[2] = 1;
  [v13 dispatchThreadgroups:v20 threadsPerThreadgroup:v19];
  [v13 endEncoding];
}

- (void)_generateHistograms_metal:(id)a3 suppressedTexture:(id)a4 tileBuffer:(id)a5 desiredKeypointCountsBuffer:(id)a6 thresholdsBuffer:(id)a7 histogramBuffer:(id)a8 thresholdRangeBuffer:(id)a9 keypointsAtChosenThresholdBuffer:(id)a10 truncatedRegionsBuffer:(id)a11 tileCount:(unint64_t)a12 maxTileHeight:(unint64_t)a13
{
  id v19 = a3;
  id v20 = a4;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v21 = a8;
  id v30 = a9;
  id v29 = a10;
  id v28 = a11;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v26);
  }
  uint64_t v22 = [v19 blitCommandEncoder];
  objc_msgSend(v22, "fillBuffer:range:value:", v21, 0, objc_msgSend(v21, "length"), 0);
  [v22 endEncoding];
  v23 = [v19 computeCommandEncoder];
  uint64_t v24 = [(PipelineStatePromise *)self->_pipelineStates pipelineStateForFunction:self->_computeHistogramKernel];
  [v23 setComputePipelineState:v24];

  [v23 setTexture:v20 atIndex:0];
  [v23 setBuffer:v33 offset:0 atIndex:0];
  [v23 setBuffer:v21 offset:0 atIndex:1];
  int64x2_t v27 = vdupq_n_s64(1uLL);
  unint64_t v40 = a12;
  int64x2_t v41 = v27;
  long long v38 = xmmword_1DD511D90;
  uint64_t v39 = 1;
  [v23 dispatchThreadgroups:&v40 threadsPerThreadgroup:&v38];
  [v23 endEncoding];
  v25 = [v19 computeCommandEncoder];
  [v25 setComputePipelineState:self->_histogramThresholdPipelineState];
  [v25 setBuffer:v32 offset:0 atIndex:0];
  [v25 setBuffer:v21 offset:0 atIndex:1];
  [v25 setBuffer:v31 offset:0 atIndex:2];
  [v25 setBuffer:v30 offset:0 atIndex:3];
  [v25 setBuffer:v29 offset:0 atIndex:4];
  [v25 setBuffer:v28 offset:0 atIndex:5];
  int64x2_t v37 = v27;
  int64x2_t v34 = v27;
  uint64_t v35 = 1;
  unint64_t v36 = a12;
  [v25 dispatchThreadgroups:&v36 threadsPerThreadgroup:&v34];
  [v25 endEncoding];
}

- (void)_cumulativeSum_metal:(id)a3 expectedPointsBuffer:(id)a4 cumulativePointsBuffer:(id)a5 regionCountBuffer:(id)a6 keypointCountBuffer:(id)a7 regionCount:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v19);
  }
  id v18 = [v13 computeCommandEncoder];
  [v18 setComputePipelineState:self->_cumulativeSumSimplePipelineState];
  [v18 setBuffer:v14 offset:0 atIndex:0];
  [v18 setBuffer:v15 offset:0 atIndex:1];
  [v18 setBuffer:v16 offset:0 atIndex:2];
  [v18 setBuffer:v17 offset:0 atIndex:3];
  int64x2_t v22 = vdupq_n_s64(1uLL);
  uint64_t v23 = 1;
  int64x2_t v20 = v22;
  uint64_t v21 = 1;
  [v18 dispatchThreadgroups:&v22 threadsPerThreadgroup:&v20];
  [v18 endEncoding];
}

- (void)_listKeypointsSimple_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 desiredKeypointsBuffer:(id)a12 indexBuffer:(id)a13
{
  id v48 = a3;
  id v39 = a4;
  id v19 = a5;
  id v40 = a6;
  id v47 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  v25 = self;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v38 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v38);
  }
  id v26 = v39;
  int64x2_t v27 = v48;
  v43 = v25;
  uint64_t v44 = v24;
  v45 = v23;
  uint64_t v46 = v20;
  if (a7)
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    int64x2_t v41 = vdupq_n_s64(1uLL);
    id v42 = v19;
    do
    {
      unint64_t v50 = a7;
      id v31 = v26;
      id v32 = v22;
      id v33 = v19;
      uint64_t v34 = [v33 contents];
      unint64_t v49 = ((unint64_t)(*(_DWORD *)(v34 + 4 * (v30 + 3))
                                            * *(_DWORD *)(v34 + 4 * (v30 + 2)))
           + 511) >> 9;
      uint64_t v35 = [v27 blitCommandEncoder];
      objc_msgSend(v35, "fillBuffer:range:value:", v44, 0, objc_msgSend(v44, "length"), 0);
      [v35 endEncoding];
      unint64_t v36 = [v27 computeCommandEncoder];
      [v36 setComputePipelineState:v43->_listKeypointsSimplePipelineState];
      [v36 setBuffer:v45 offset:v28 atIndex:0];
      id v37 = v33;
      id v22 = v32;
      id v26 = v31;
      [v36 setBuffer:v37 offset:v29 atIndex:1];
      [v36 setBuffer:v47 offset:v30 atIndex:2];
      [v36 setBuffer:v22 offset:0 atIndex:3];
      [v36 setBuffer:v21 offset:0 atIndex:4];
      [v36 setBuffer:v46 offset:v30 atIndex:5];
      [v36 setBuffer:v44 offset:0 atIndex:6];
      [v36 setTexture:v31 atIndex:0];
      unint64_t v53 = v49;
      id v19 = v42;
      int64x2_t v54 = v41;
      long long v51 = xmmword_1DD511DA0;
      uint64_t v52 = 1;
      [v36 dispatchThreadgroups:&v53 threadsPerThreadgroup:&v51];
      [v36 endEncoding];

      int64x2_t v27 = v48;
      v30 += 4;
      v29 += 16;
      v28 += 12;
      a7 = v50 - 1;
    }
    while (v50 != 1);
  }
}

- (void)_listKeypoints2_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 maxRegionHeight:(double)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v26);
  }
  v25 = [v17 computeCommandEncoder];
  [v25 setComputePipelineState:self->_listKeypoints2PipelineState];
  [v25 setThreadgroupMemoryLength:128 atIndex:0];
  [v25 setBuffer:v19 offset:0 atIndex:0];
  [v25 setBuffer:v21 offset:0 atIndex:1];
  [v25 setBuffer:v24 offset:0 atIndex:2];
  [v25 setBuffer:v23 offset:0 atIndex:3];
  [v25 setBuffer:v22 offset:0 atIndex:4];
  [v25 setBuffer:v20 offset:0 atIndex:5];
  [v25 setTexture:v18 atIndex:0];
  uint64_t v29 = 1;
  unint64_t v30 = a7;
  int64x2_t v31 = vdupq_n_s64(1uLL);
  long long v28 = xmmword_1DD511D90;
  [v25 dispatchThreadgroups:&v30 threadsPerThreadgroup:&v28];
  [v25 endEncoding];
}

- (void)_listKeypoints3_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 maxRegionHeight:(double)a12 maxRegionWidth:(double)a13
{
  id v20 = a3;
  id v31 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v28);
  }
  [v20 computeCommandEncoder];
  int64x2_t v27 = v29 = v20;
  [v27 setComputePipelineState:self->_listKeypoints3PipelineState];
  [v27 setThreadgroupMemoryLength:256 atIndex:0];
  [v27 setBuffer:v21 offset:0 atIndex:0];
  [v27 setBuffer:v23 offset:0 atIndex:1];
  [v27 setBuffer:v26 offset:0 atIndex:2];
  [v27 setBuffer:v25 offset:0 atIndex:3];
  [v27 setBuffer:v24 offset:0 atIndex:4];
  [v27 setBuffer:v22 offset:0 atIndex:5];
  [v27 setTexture:v31 atIndex:0];
  v34[0] = (unint64_t)((int)a13 + 31) >> 5;
  v34[1] = (unint64_t)((int)a12 + 1) >> 1;
  v34[2] = a7;
  long long v32 = xmmword_1DD511DB0;
  uint64_t v33 = 1;
  [v27 dispatchThreadgroups:v34 threadsPerThreadgroup:&v32];
  [v27 endEncoding];
}

- (void)_refineKeypoints_metal:(id)a3 inputImageTexture:(id)a4 keypointLocationsBuffer:(id)a5 refinedLocationsBuffer:(id)a6 keypointCountBuffer:(id)a7 keypointCount:(unint64_t)a8 debugIntermediatesBuffer:(id)a9 cumulativePointsBuffer:(id)a10 tileCountBuffer:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v25);
  }
  id v24 = [v16 computeCommandEncoder];
  [v24 setComputePipelineState:self->_refineKeypointPipelineState];
  [v24 setTexture:v17 atIndex:0];
  [v24 setBuffer:v18 offset:0 atIndex:0];
  [v24 setBuffer:v19 offset:0 atIndex:1];
  [v24 setBuffer:v20 offset:0 atIndex:2];
  [v24 setBuffer:v22 offset:0 atIndex:3];
  [v24 setBuffer:v23 offset:0 atIndex:4];
  [v24 setBuffer:v21 offset:0 atIndex:5];
  [v24 setSamplerState:self->_clampedLinearNonNormSamplerState atIndex:0];
  if (a8)
  {
    *(void *)uint64_t v29 = (a8 + 31) >> 5;
    *(int64x2_t *)&v29[8] = vdupq_n_s64(1uLL);
    long long v27 = xmmword_1DD511D90;
    uint64_t v28 = 1;
    [v24 dispatchThreadgroups:v29 threadsPerThreadgroup:&v27];
  }
  else
  {
    *(_OWORD *)uint64_t v29 = xmmword_1DD511D90;
    *(void *)&v29[16] = 1;
    [v24 dispatchThreadgroupsWithIndirectBuffer:v20 indirectBufferOffset:4 threadsPerThreadgroup:v29];
  }
  [v24 endEncoding];
}

- (void)_extractORB_metal:(id)a3 boxBlurredTexture:(id)a4 keypointLocationsBuffer:(id)a5 outputORBDescriptorBuffer:(id)a6 keypointCountBuffer:(id)a7 keypointCount:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v20);
  }
  id v19 = [v14 computeCommandEncoder];
  [v19 setComputePipelineState:self->_extractORBPipelineState];
  [v19 setTexture:v15 atIndex:0];
  [v19 setBuffer:v18 offset:0 atIndex:0];
  [v19 setBuffer:v16 offset:0 atIndex:1];
  [v19 setBuffer:v17 offset:0 atIndex:2];
  if (a8)
  {
    *(void *)id v23 = (a8 + 31) >> 5;
    *(int64x2_t *)&v23[8] = vdupq_n_s64(1uLL);
    long long v21 = xmmword_1DD511D90;
    uint64_t v22 = 1;
    [v19 dispatchThreadgroups:v23 threadsPerThreadgroup:&v21];
  }
  else
  {
    *(_OWORD *)id v23 = xmmword_1DD511D90;
    *(void *)&v23[16] = 1;
    [v19 dispatchThreadgroupsWithIndirectBuffer:v18 indirectBufferOffset:4 threadsPerThreadgroup:v23];
  }
  [v19 endEncoding];
}

- (void)_boxBlur_metal:(id)a3 inputImageTexture:(id)a4 boxBlurredTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v14);
  }
  unint64_t v11 = (((unint64_t)([v10 width] + 3) >> 2) + 7) >> 3;
  unint64_t v12 = (((unint64_t)([v10 height] + 1) >> 1) + 1) >> 1;
  id v13 = [v8 computeCommandEncoder];
  [v13 setComputePipelineState:self->_boxBlurPipelineState];
  [v13 setTexture:v9 atIndex:0];
  [v13 setTexture:v10 atIndex:1];
  v17[0] = v11;
  v17[1] = v12;
  v17[2] = 1;
  long long v15 = xmmword_1DD511DC0;
  uint64_t v16 = 1;
  [v13 dispatchThreadgroups:v17 threadsPerThreadgroup:&v15];
  [v13 endEncoding];
}

- (void)_ORBDescriptorsFromTextures_part1_metal:(id)a3 inputTexture_RGBA8Uint:(id)a4 inputTexture_R8Unorm:(id)a5 responseBuffer:(id)a6 cumulativeKeypointsPerRegionBuffer:(id)a7 intermediateBuffers:(id)a8
{
  id v14 = a8;
  id v38 = a7;
  id v39 = a6;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = -(int)[a5 width] & 3;
  id v18 = [v14 responseTexture];
  id v37 = self;
  id v40 = v16;
  [(MetalFAST9BRIEF *)self _computeResponseMap_metal:v16 inputTexture:v15 outputTexture:v18 garbagePixelCount:v17];

  id v19 = [v14 responseTexture];
  id v20 = objc_msgSend(v14, "suppressedResponseTexture_RGBA8Uint");
  [(MetalFAST9BRIEF *)self _suppressResponseMap_metal:v16 unsuppressedTexture:v19 suppressedTexture:v20 garbagePixelCount:v17];

  long long v21 = objc_msgSend(v14, "suppressedResponseTexture_R8Unorm");
  uint64_t v22 = [v14 rectRegionsBuffer];
  id v23 = [v14 rectRegionsDesiredKeypoints];
  id v24 = [v14 thresholdsBuffer];
  id v25 = [v14 histogramsBuffer];
  id v26 = [v14 thresholdRangeBuffer];
  long long v27 = [v14 countOfKeypointsPerRegion];
  uint64_t v28 = [v14 truncatedRegionsBuffer];
  -[MetalFAST9BRIEF _generateHistograms_metal:suppressedTexture:tileBuffer:desiredKeypointCountsBuffer:thresholdsBuffer:histogramBuffer:thresholdRangeBuffer:keypointsAtChosenThresholdBuffer:truncatedRegionsBuffer:tileCount:maxTileHeight:](v37, "_generateHistograms_metal:suppressedTexture:tileBuffer:desiredKeypointCountsBuffer:thresholdsBuffer:histogramBuffer:thresholdRangeBuffer:keypointsAtChosenThresholdBuffer:truncatedRegionsBuffer:tileCount:maxTileHeight:", v40, v21, v22, v23, v24, v25, v26, v27, v28, (int)[v14 countOfRectRegions], (int)objc_msgSend(v14, "maxRegionHeight"));

  uint64_t v29 = [v14 countOfKeypointsPerRegion];
  unint64_t v30 = [v14 rectRegionCount];
  id v31 = [v14 keypointCountBuffer];
  [(MetalFAST9BRIEF *)v37 _cumulativeSum_metal:v40 expectedPointsBuffer:v29 cumulativePointsBuffer:v38 regionCountBuffer:v30 keypointCountBuffer:v31 regionCount:0];

  objc_msgSend(v14, "suppressedResponseTexture_R8Uint");
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  long long v32 = [v14 rectRegionsBuffer];
  uint64_t v33 = [v14 rectRegionCount];
  uint64_t v34 = (int)[v14 countOfRectRegions];
  uint64_t v35 = [v14 thresholdsBuffer];
  unint64_t v36 = [v14 compactKeypointsBuffer];
  LODWORD(v22) = [v14 maxRegionHeight];

  [(MetalFAST9BRIEF *)v37 _listKeypoints2_metal:v40 suppressedResponseMapTexture:v41 tileBuffer:v32 tileCountBuffer:v33 tileCount:v34 thresholdsBuffer:v35 cumulativePointsBuffer:(double)v22 keypointLocationsBuffer:v38 keypointResponsesBuffer:v36 maxRegionHeight:v39];
}

- (void)_ORBDescriptorsFromTextures_part2_metal:(id)a3 inputTexture_RGBA8Uint:(id)a4 inputTexture_R8Unorm:(id)a5 descriptorBuffer:(id)a6 refinedKeypointsBuffer:(id)a7 cumulativeKeypointsPerRegionBuffer:(id)a8 intermediateBuffers:(id)a9 keypointCount:(int)a10
{
  id v16 = a9;
  id v17 = a8;
  id v27 = a7;
  id v28 = a6;
  id v18 = a5;
  id v29 = a4;
  id v19 = a3;
  id v20 = [v16 compactKeypointsBuffer];
  long long v21 = [v16 keypointCountBuffer];
  uint64_t v22 = [v16 refinementIntermediatesBuffer];
  id v23 = [v16 rectRegionCount];
  [(MetalFAST9BRIEF *)self _refineKeypoints_metal:v19 inputImageTexture:v18 keypointLocationsBuffer:v20 refinedLocationsBuffer:v27 keypointCountBuffer:v21 keypointCount:a10 debugIntermediatesBuffer:v22 cumulativePointsBuffer:v17 tileCountBuffer:v23];

  id v24 = objc_msgSend(v16, "boxBlurredTexture_R8Uint");
  [(MetalFAST9BRIEF *)self _boxBlur_metal:v19 inputImageTexture:v29 boxBlurredTexture:v24];

  objc_msgSend(v16, "boxBlurredTexture_R8Uint");
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = [v16 keypointCountBuffer];

  [(MetalFAST9BRIEF *)self _extractORB_metal:v19 boxBlurredTexture:v30 keypointLocationsBuffer:v27 outputORBDescriptorBuffer:v28 keypointCountBuffer:v25 keypointCount:a10];
}

- (void)ORBDescriptorsFromPixelBuffer_metal:(id)a3 inputBuffer:(__CVBuffer *)a4 descriptorBuffer:(id)a5 refinedKeypointsBuffer:(id)a6 responseBuffer:(id)a7 cumulativeKeypointsPerRegionBuffer:(id)a8 intermediateBuffers:(id)a9
{
  id v15 = a3;
  id v32 = a5;
  id v16 = a6;
  id v33 = a7;
  id v17 = a8;
  id v18 = a9;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v30);
  }
  id v19 = [(MetalFAST9BRIEF *)self _textureFromPixelBuffer:a4 forcedMetalPixelFormat:10 forcedWidthDivisior:1];
  char v20 = [(MTLDevice *)self->_device supportsFeatureSet:4];
  id v34 = v15;
  long long v21 = v34;
  if ((v20 & 1) == 0)
  {
    long long v21 = [(MTLCommandQueue *)self->_queue commandBuffer];
  }
  uint64_t v22 = v16;
  CGRect CleanRect = CVImageBufferGetCleanRect(a4);
  CGFloat x = CleanRect.origin.x;
  float v24 = CVImageBufferGetEncodedSize(a4).height - (CleanRect.origin.y + CleanRect.size.height);
  id v25 = objc_msgSend(v18, "gaussianBlurredTexture_R8Unorm");
  *(float *)&CGFloat x = x;
  -[MetalFAST9BRIEF _gaussianishBlur_metal:inputTexture:outputTexture:offset:](self, "_gaussianishBlur_metal:inputTexture:outputTexture:offset:", v21, v19, v25, *(float *)&x, v24);

  id v26 = objc_msgSend(v18, "gaussianBlurredTexture_RGBA8Uint");
  id v27 = objc_msgSend(v18, "gaussianBlurredTexture_R8Unorm");
  [(MetalFAST9BRIEF *)self _ORBDescriptorsFromTextures_part1_metal:v21 inputTexture_RGBA8Uint:v26 inputTexture_R8Unorm:v27 responseBuffer:v33 cumulativeKeypointsPerRegionBuffer:v17 intermediateBuffers:v18];
  if (v20)
  {
    int v28 = 0;
  }
  else
  {
    [v21 commit];
    [v21 waitUntilCompleted];
    id v29 = [v18 keypointCountBuffer];
    int v28 = *(_DWORD *)[v29 contents];
  }
  LODWORD(v31) = v28;
  [(MetalFAST9BRIEF *)self _ORBDescriptorsFromTextures_part2_metal:v34 inputTexture_RGBA8Uint:v26 inputTexture_R8Unorm:v27 descriptorBuffer:v32 refinedKeypointsBuffer:v22 cumulativeKeypointsPerRegionBuffer:v17 intermediateBuffers:v18 keypointCount:v31];
}

- (void)_gaussianishBlur_metal:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5 offset:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (![(PipelineStatePromise *)self->_pipelineStates groupWasSuccessful])
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Failed to create compute pipeline state" userInfo:0];
    objc_exception_throw(v19);
  }
  id v14 = [v11 computeCommandEncoder];
  v22[0] = rint(x);
  v22[1] = rint(y);
  uint64_t v23 = 0;
  id v15 = [(PipelineStatePromise *)self->_pipelineStates pipelineStateForFunction:self->_gaussianishBlurKernel];
  [v14 setComputePipelineState:v15];
  [v14 setTexture:v12 atIndex:0];
  [v14 setTexture:v13 atIndex:1];
  [v14 setBytes:v22 length:16 atIndex:0];
  unint64_t v16 = [v15 threadExecutionWidth];
  unint64_t v17 = [v15 maxTotalThreadsPerThreadgroup];
  unint64_t v18 = v17 / [v15 threadExecutionWidth];
  v21[0] = (v16 + [v13 width] - 1) / v16;
  v21[1] = (v18 + [v13 height] - 1) / v18;
  v21[2] = 1;
  v20[0] = v16;
  v20[1] = v18;
  v20[2] = 1;
  [v14 dispatchThreadgroups:v21 threadsPerThreadgroup:v20];
  [v14 endEncoding];
}

+ (id)_createMTLBufferFromRects:(id)a3 device:(id)a4 storageMode:(unint64_t)a5 maxRectWidth:(unint64_t *)a6 maxRectHeight:(unint64_t *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = objc_msgSend(v12, "newBufferWithLength:options:", 48 * objc_msgSend(v11, "count"), 16 * a5);
  uint64_t v14 = [v13 contents];
  if ([v11 count])
  {
    unint64_t v15 = 0;
    int32x4_t v22 = 0u;
    do
    {
      unint64_t v16 = objc_msgSend(v11, "objectAtIndex:", v15, v22.i64[0]);
      float64x2_t v23 = 0u;
      float64x2_t v24 = 0u;
      [v16 getValue:&v23 size:32];
      int32x4_t v17 = (int32x4_t)vcvtq_u64_f64(v24);
      uint32x2_t v18 = (uint32x2_t)vmovn_s64((int64x2_t)v17);
      *(int32x4_t *)(v14 + 16 * v15) = vuzp1q_s32((int32x4_t)vcvtq_u64_f64(v23), v17);
      v17.i64[1] = v22.i64[1];
      *(uint32x2_t *)v17.i8 = vmax_u32(*(uint32x2_t *)v22.i8, v18);
      int32x4_t v22 = v17;

      ++v15;
    }
    while ([v11 count] > v15);
    *(void *)&long long v19 = v22.u32[0];
    *((void *)&v19 + 1) = v22.u32[1];
    long long v20 = v19;
    if (a6) {
      goto LABEL_5;
    }
  }
  else
  {
    long long v20 = 0uLL;
    if (a6) {
LABEL_5:
    }
      *a6 = v20;
  }
  if (a7) {
    *a7 = *((void *)&v20 + 1);
  }

  return v13;
}

+ (id)_createMTLBufferFromRectRegionsDesiredKeypoints:(id)a3 device:(id)a4 storageMode:(unint64_t)a5 maxAllowedDescriptors:(unint64_t *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(v9, "newBufferWithLength:options:", 12 * objc_msgSend(v8, "count"), 16 * a5);
  uint64_t v11 = [v10 contents];
  if ((unint64_t)[v8 count] >= 2)
  {
    unsigned int v13 = 0;
    unint64_t v14 = 0;
    unint64_t v12 = 0;
    uint64_t v15 = 1;
    do
    {
      unint64_t v16 = [v8 objectAtIndex:v15 - 1];
      *(_DWORD *)(v11 + 4 * v13) = [v16 unsignedIntValue];

      int32x4_t v17 = [v8 objectAtIndex:v15];
      *(_DWORD *)(v11 + 4 * (v13 + 1)) = [v17 unsignedIntValue];

      uint64_t v18 = (*(_DWORD *)(v11 + 4 * (v13 + 1)) + *(_DWORD *)(v11 + 4 * v13));
      *(_DWORD *)(v11 + 4 * (v13 + 2)) = v18;
      v12 += v18;
      ++v14;
      v13 += 3;
      v15 += 2;
    }
    while (v14 < (unint64_t)[v8 count] >> 1);
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (a6) {
    *a6 = v12;
  }

  return v10;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 8, 1);
}

- (MTLCommandQueue)queue
{
  return (MTLCommandQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineStates, 0);
  objc_storeStrong((id *)&self->_clampedLinearNonNormSamplerState, 0);
  objc_storeStrong((id *)&self->_gaussianishBlurKernel, 0);
  objc_storeStrong((id *)&self->_boxBlurR8PipelineState, 0);
  objc_storeStrong((id *)&self->_boxBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_extractORBPipelineState, 0);
  objc_storeStrong((id *)&self->_refineKeypointPipelineState, 0);
  objc_storeStrong((id *)&self->_boxBlurKernel_R8, 0);
  objc_storeStrong((id *)&self->_boxBlurKernel, 0);
  objc_storeStrong((id *)&self->_extractORBKernel, 0);
  objc_storeStrong((id *)&self->_refineKeypointKernel, 0);
  objc_storeStrong((id *)&self->_listKeypoints3PipelineState, 0);
  objc_storeStrong((id *)&self->_listKeypoints2PipelineState, 0);
  objc_storeStrong((id *)&self->_listKeypointsPipelineState, 0);
  objc_storeStrong((id *)&self->_listKeypointsSimplePipelineState, 0);
  objc_storeStrong((id *)&self->_listKeypoints3Kernel, 0);
  objc_storeStrong((id *)&self->_listKeypoints2Kernel, 0);
  objc_storeStrong((id *)&self->_listKeypointsKernel, 0);
  objc_storeStrong((id *)&self->_listKeypointsSimpleKernel, 0);
  objc_storeStrong((id *)&self->_compactMPSBuffersPipelineState, 0);
  objc_storeStrong((id *)&self->_cumulativeSumSimplePipelineState, 0);
  objc_storeStrong((id *)&self->_histogramThresholdPipelineState, 0);
  objc_storeStrong((id *)&self->_compactMPSBuffersKernel, 0);
  objc_storeStrong((id *)&self->_cumulativeSumSimpleKernel, 0);
  objc_storeStrong((id *)&self->_histogramThresholdKernel, 0);
  objc_storeStrong((id *)&self->_computeHistogramKernel, 0);
  objc_storeStrong((id *)&self->_suppressMapKernel, 0);
  objc_storeStrong((id *)&self->_responseMapKernel, 0);
  objc_storeStrong((id *)&self->_compute4HistogramKernel, 0);
  objc_storeStrong((id *)&self->_suppress4MapKernel, 0);
  objc_storeStrong((id *)&self->_response4MapKernel, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end