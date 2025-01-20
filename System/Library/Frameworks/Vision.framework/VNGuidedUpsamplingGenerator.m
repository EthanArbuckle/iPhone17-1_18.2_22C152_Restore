@interface VNGuidedUpsamplingGenerator
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)_renderCIImage:(id)a3 toBuffer:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 rowBytes:(unint64_t)a7 format:(unsigned int)a8 vnciContextManager:(id)a9 error:(id *)a10;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (__CVBuffer)_renderCIImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unsigned int)a6 vnciContextManager:(id)a7 error:(id *)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNGuidedUpsamplingGenerator

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allGPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (__CVBuffer)_renderCIImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unsigned int)a6 vnciContextManager:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a3;
  id v15 = a7;
  v16 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a8];
  if (v16)
  {
    v17 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4, a5, v10, a8);
    if (v17)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __91__VNGuidedUpsamplingGenerator__renderCIImage_width_height_format_vnciContextManager_error___block_invoke;
      v20[3] = &unk_1E5B1E4B8;
      id v21 = v14;
      v22 = v17;
      v18 = _Block_copy(v20);
      if ((-[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v15, v18, v16, a8) & 1) == 0)
      {
        CVPixelBufferRelease(v17);
        v17 = 0;
      }
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __91__VNGuidedUpsamplingGenerator__renderCIImage_width_height_format_vnciContextManager_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v3 = *(void **)(a2 + 8);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  [v4 render:*(void *)(a1 + 32) toCVPixelBuffer:*(void *)(a1 + 40)];

  return 1;
}

- (BOOL)_renderCIImage:(id)a3 toBuffer:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 rowBytes:(unint64_t)a7 format:(unsigned int)a8 vnciContextManager:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a9;
  v18 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a10];
  if (v18)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __109__VNGuidedUpsamplingGenerator__renderCIImage_toBuffer_width_height_rowBytes_format_vnciContextManager_error___block_invoke;
    v22[3] = &unk_1E5B1D570;
    v24 = a4;
    unint64_t v25 = a6;
    unint64_t v26 = a5;
    unint64_t v27 = a7;
    id v23 = v16;
    unsigned int v28 = a8;
    v19 = _Block_copy(v22);
    char v20 = -[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v17, v19, v18, a10);
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

uint64_t __109__VNGuidedUpsamplingGenerator__renderCIImage_toBuffer_width_height_rowBytes_format_vnciContextManager_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  return -[VNCIContext renderCIImage:buffer:format:error:](a2, v4, &v6, *(_DWORD *)(a1 + 72), a3);
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v63 = a7;
  id v64 = a9;
  v66 = v15;
  id v16 = +[VNValidationUtilities requiredArrayForKey:@"VNGuidedUpsamplingGeneratorOption_LowResImages" inOptions:v15 withElementsOfClass:objc_opt_class() error:a8];
  if (!v16)
  {
    id v49 = 0;
    goto LABEL_56;
  }
  id v17 = VNValidationUtilities;
  v61 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNGuidedUpsamplingGeneratorOption_OutputPixelFormat" inOptions:v15 error:a8];
  if (!v61)
  {
    id v49 = 0;
    goto LABEL_55;
  }
  std::vector<unsigned int>::size_type v18 = [v16 count];
  v59 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v66 error:a8];
  if (!v59)
  {
LABEL_46:
    id v49 = 0;
    goto LABEL_54;
  }
  unsigned int v19 = [v61 unsignedIntValue];
  if (v19 - 1278226488 > 0x30 || ((1 << (v19 - 56)) & 0x1400000000001) == 0)
  {
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"unsupported output pixel format"];
      id v49 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
    goto LABEL_46;
  }
  std::vector<unsigned int>::vector(&v79, v18);
  pixelBuffer = a4;
  v67 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18];
  if (v18)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      v79.__begin_[i] = v19;
      id v21 = [v16 objectAtIndexedSubscript:i];
      v22 = [v21 featureName];
      if (v22)
      {
        v9 = [v16 objectAtIndexedSubscript:i];
        uint64_t v23 = [(__objc2_class *)v9 featureName];
        uint64_t v10 = (void *)v23;
      }
      else
      {
        uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
        id v17 = (__objc2_class *)v23;
      }
      [v67 setObject:v23 atIndexedSubscript:i];
      v24 = v17;
      if (v22)
      {

        v24 = v9;
      }
    }
  }
  unint64_t v25 = +[VNValidationUtilities requiredSessionInOptions:v66 error:a8];
  if (!v25)
  {
    id v49 = 0;
    goto LABEL_52;
  }
  id v54 = v25;
  unint64_t v26 = [v25 vnciContextManager];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__VNGuidedUpsamplingGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E5B1D520;
  int v78 = 1278226534;
  aBlock[4] = self;
  id v58 = v26;
  id v77 = v58;
  unint64_t v27 = (uint64_t (**)(void *, void, id *))_Block_copy(aBlock);
  v65 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v16;
  uint64_t v28 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v73 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = (void *)v27[2](v27, *(void *)(*((void *)&v72 + 1) + 8 * j), a8);
        if (!v31) {
          goto LABEL_42;
        }
        [v65 addObject:v31];
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v28);
  }

  obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18];
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  if (v18)
  {
    size_t v34 = Height;
    std::vector<unsigned int>::size_type v35 = v18;
    while (1)
    {
      CVPixelBufferRef v36 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, v34, 1278226534, a8);
      if (!v36) {
        break;
      }
      [obj addObject:v36];

      if (!--v35) {
        goto LABEL_27;
      }
    }
LABEL_42:
    id v49 = 0;
    goto LABEL_51;
  }
LABEL_27:
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __129__VNGuidedUpsamplingGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
  v68[3] = &unk_1E5B1D548;
  v68[4] = self;
  id v69 = v65;
  id v56 = obj;
  id v70 = v56;
  v71 = pixelBuffer;
  v51 = _Block_copy(v68);
  if ((VNExecuteBlock(v51, (uint64_t)a8) & 1) == 0)
  {
    id v49 = 0;
    goto LABEL_50;
  }
  v55 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18];
  size_t v53 = CVPixelBufferGetWidth(pixelBuffer);
  size_t v52 = CVPixelBufferGetHeight(pixelBuffer);
  if (!v18)
  {
LABEL_39:
    v48 = v55;
    id v49 = v55;
    goto LABEL_49;
  }
  uint64_t v37 = 0;
  while (1)
  {
    v38 = [v56 objectAtIndexedSubscript:v37];

    OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v38);
    if (PixelFormatType != v79.__begin_[v37]) {
      break;
    }
    v40 = CVPixelBufferRetain((CVPixelBufferRef)v38);
LABEL_33:
    v42 = [VNPixelBufferObservation alloc];
    v43 = [v67 objectAtIndexedSubscript:v37];
    v44 = [MEMORY[0x1E4F1CA98] null];
    char v45 = [v43 isEqual:v44];
    if (v45)
    {
      v46 = 0;
    }
    else
    {
      pixelBuffer = [v67 objectAtIndexedSubscript:v37];
      v46 = pixelBuffer;
    }
    v47 = [(VNPixelBufferObservation *)v42 initWithOriginatingRequestSpecifier:v59 featureName:v46 CVPixelBuffer:v40];
    if ((v45 & 1) == 0) {

    }
    CVPixelBufferRelease(v40);
    [v55 addObject:v47];

    if (v18 == ++v37) {
      goto LABEL_39;
    }
  }
  v41 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:v38];
  v40 = [(VNGuidedUpsamplingGenerator *)self _renderCIImage:v41 width:v53 height:v52 format:v79.__begin_[v37] vnciContextManager:v58 error:a8];

  if (v40) {
    goto LABEL_33;
  }
  id v49 = 0;
  v48 = v55;
LABEL_49:

LABEL_50:
LABEL_51:

  unint64_t v25 = v54;
LABEL_52:

  if (v79.__begin_)
  {
    v79.__end_ = v79.__begin_;
    operator delete(v79.__begin_);
  }
LABEL_54:

LABEL_55:
LABEL_56:

  return v49;
}

__CVBuffer *__129__VNGuidedUpsamplingGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = (__CVBuffer *)[v5 pixelBuffer];
  long long v7 = v6;
  if (!v6)
  {
    if (a3)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"VNPixelBufferObservation missing pixel buffer"];
      long long v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    long long v7 = 0;
    goto LABEL_12;
  }
  if (CVPixelBufferGetPixelFormatType(v6) != *(_DWORD *)(a1 + 48))
  {
    uint64_t v8 = (void *)MEMORY[0x1A6257080]();
    v9 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v7];
    uint64_t v10 = *(void **)(a1 + 32);
    [v9 extent];
    double v12 = v11;
    [v9 extent];
    uint64_t v14 = *(unsigned int *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 40);
    id v18 = 0;
    long long v7 = (__CVBuffer *)[v10 _renderCIImage:v9 width:(unint64_t)v12 height:(unint64_t)v13 format:v14 vnciContextManager:v15 error:&v18];
    id v16 = v18;

    if (v7)
    {

      goto LABEL_12;
    }
    if (a3) {
      *a3 = v16;
    }

    goto LABEL_11;
  }
  CVPixelBufferRetain(v7);
LABEL_12:

  return v7;
}

BOOL __129__VNGuidedUpsamplingGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) metalContext];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = -[VNMetalContext bindPixelBuffersToTextures:error:](v4, *(void **)(a1 + 40), a2);
    if (v6)
    {
      long long v7 = -[VNMetalContext bindPixelBuffersToTextures:error:](v5, *(void **)(a1 + 48), a2);
      if (v7)
      {
        uint64_t v8 = -[VNMetalContext bindPixelBufferToMTL2DTexture:error:](v5, *(CVPixelBufferRef *)(a1 + 56), a2);
        if (v8)
        {
          v9 = -[VNMetalContext createGuidedFilterForTextures:referenceTexture:error:](v5, v6, v8, a2);
          if (v9) {
            BOOL v10 = -[VNMetalContext upsampleTextures:referenceTexture:constraintsTextures:upsampledTextures:filter:waitForCompletion:error:]((BOOL)v5, v6, v8, 0, v7, v9, 1, a2);
          }
          else {
            BOOL v10 = 0;
          }
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
    goto LABEL_17;
  }
  if (a2)
  {
    id v11 = [NSString alloc];
    double v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    uint64_t v6 = (void *)[v11 initWithFormat:@"%@ does not have a metal context", v13];

    +[VNError errorForInternalErrorWithLocalizedDescription:v6];
    BOOL v10 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  unsigned int v24 = 0;
  if (+[VNValidationUtilities getOSTypeValue:&v24 forKey:@"VNGuidedUpsamplingGeneratorOption_InputPixelFormat" inOptions:v16 error:a8])
  {
    id v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
    id v18 = v17;
    if (v17)
    {
      unint64_t v19 = [v17 width];
      unint64_t v20 = [v18 height];
      id v21 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(width * (double)v19), (unint64_t)(height * (double)v20), v24, v16, a8, x * (double)v19, y * (double)v20);
      *a7 = v21;
      BOOL v22 = v21 != 0;
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

@end