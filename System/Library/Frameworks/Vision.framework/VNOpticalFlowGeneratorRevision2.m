@interface VNOpticalFlowGeneratorRevision2
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNOpticalFlowGeneratorRevision2

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__VNOpticalFlowGeneratorRevision2_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __72__VNOpticalFlowGeneratorRevision2_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNOpticalFlowGeneratorRevision2;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNOpticalFlowGeneratorOption_ComputationAccuracy"];
  [v2 addObject:@"VNOpticalFlowGeneratorInitOption_PortraitMode"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allGPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((_DWORD *)self + 20) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  v52[1] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  id v18 = v15;
  v19 = v18;
  if (self)
  {
    v20 = [v18 objectForKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_FromAndToPixelBuffers"];
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", [v20 count] == 2, @"Unexpected number of buffers for optical flow processing");
    v21 = [v20 objectAtIndexedSubscript:0];

    v22 = [v20 objectAtIndexedSubscript:1];

    v23 = [(VCPMotionFlowRequest *)self->_motionFlowRequest estimateMotionBetweenFirstImage:v21 andSecondImage:v22 withUpsample:0 withGuidedImage:0 error:a8];

    if (v23)
    {
      unsigned int v44 = 0;
      if (+[VNValidationUtilities getOSTypeValue:&v44 forKey:@"VNOpticalFlowGeneratorProcessOption_OutputPixelFormat" inOptions:v19 error:a8])
      {
        char v43 = 0;
        if (+[VNValidationUtilities getBOOLValue:&v43 forKey:@"VNOpticalFlowGeneratorProcessOption_KeepNetworkOutput" inOptions:v19 withDefaultValue:0 error:a8])
        {
          v24 = (__CVBuffer *)[v23 pixelBuffer];
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v24);
          size_t v26 = (unint64_t)height;
          BOOL v27 = PixelFormatType == v44
             && CVPixelBufferGetWidth(v24) == (unint64_t)width
             && CVPixelBufferGetHeight(v24) == v26;
          if (v43 || v27)
          {
            v29 = CVPixelBufferRetain(v24);
            goto LABEL_22;
          }
          unsigned int v38 = v44;
          id v42 = v19;
          v28 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a8];
          if (v28)
          {
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke;
            aBlock[3] = &unk_1E5B1F5E8;
            unint64_t v50 = (unint64_t)width;
            unint64_t v51 = (unint64_t)height;
            id v37 = v42;
            id v48 = v37;
            id v39 = v28;
            id v49 = v39;
            v40 = _Block_copy(aBlock);
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke_3;
            v45[3] = &__block_descriptor_36_e41_B32__0____CVBuffer__8____CVBuffer__16__24l;
            unsigned int v46 = v38;
            v41 = _Block_copy(v45);
            v29 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)width, v26, v38, a8);
            if (v29)
            {
              if (+[VNComputeDeviceUtilities isCPUComputeDevice:v39])
              {
                v30 = v41;
              }
              else
              {
                v30 = v40;
              }
              v31 = (uint64_t (**)(void *, __CVBuffer *, __CVBuffer *, id *))_Block_copy(v30);
              if ((v31[2](v31, v24, v29, a8) & 1) == 0)
              {
                CVPixelBufferRelease(v29);
                v29 = 0;
              }
            }
            if (!v29) {
              goto LABEL_30;
            }
LABEL_22:
            v32 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v19 error:a8];
            if (v32)
            {
              v33 = [[VNPixelBufferObservation alloc] initWithOriginatingRequestSpecifier:v32 featureName:0 CVPixelBuffer:v29];
              int v34 = 0;
            }
            else
            {
              v33 = 0;
              int v34 = 1;
            }

            CVPixelBufferRelease(v29);
            if (v34)
            {
              v35 = 0;
            }
            else
            {
              v52[0] = v33;
              v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
            }

            goto LABEL_31;
          }
        }
      }
    }
  }
  else
  {

    v23 = 0;
  }
LABEL_30:
  v35 = 0;
LABEL_31:

  return v35;
}

uint64_t __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke_2;
  v12[3] = &__block_descriptor_64_e25_B24__0__VNCIContext_8__16l;
  v12[4] = a2;
  long long v13 = *(_OWORD *)(a1 + 48);
  uint64_t v14 = a3;
  v6 = _Block_copy(v12);
  v7 = +[VNValidationUtilities requiredSessionInOptions:*(void *)(a1 + 32) error:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 vnciContextManager];
    uint64_t v10 = -[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v9, v6, *(void **)(a1 + 40), a4);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke_3(uint64_t a1, CVPixelBufferRef pixelBuffer, __CVBuffer *a3, void *a4)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if (!+[VNCVPixelBufferHelper lockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, pixelBuffer, 1uLL, a4)|| !+[VNCVPixelBufferHelper lockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, a3, 0, a4))
  {
    goto LABEL_21;
  }
  if (PixelFormatType == 843264102)
  {
    int v19 = *(_DWORD *)(a1 + 32);
    if (v19 == 843264102)
    {
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v25, pixelBuffer);
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v22, a3);
      if (!v27) {
        goto LABEL_34;
      }
      if (!v26) {
        goto LABEL_34;
      }
      unint64_t v10 = v24;
      if (!v24) {
        goto LABEL_34;
      }
      size_t v11 = iterations;
      if (!iterations) {
        goto LABEL_34;
      }
      float v12 = (float)v27 / (float)v24;
      float v13 = (float)v26 / (float)iterations;
      float v14 = 1.0;
      float v15 = 1.0 / v12;
      unint64_t v16 = v27 - 1;
      unint64_t v17 = v26 - 1;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      id v18 = ___Z21convertAndResizeImageI10Pixel_UFVFS0_EvRKN5apple6vision11ImageBufferIT_S4_EERKNS3_IT0_S8_EE_block_invoke;
      goto LABEL_33;
    }
    if (v19 == 843264104)
    {
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v25, pixelBuffer);
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v22, a3);
      if (!v27) {
        goto LABEL_34;
      }
      if (!v26) {
        goto LABEL_34;
      }
      unint64_t v10 = v24;
      if (!v24) {
        goto LABEL_34;
      }
      size_t v11 = iterations;
      if (!iterations) {
        goto LABEL_34;
      }
      float v12 = (float)v27 / (float)v24;
      float v13 = (float)v26 / (float)iterations;
      float v14 = 1.0;
      float v15 = 1.0 / v12;
      unint64_t v16 = v27 - 1;
      unint64_t v17 = v26 - 1;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      id v18 = ___Z21convertAndResizeImageI10Pixel_UFVF10Pixel_UHVHEvRKN5apple6vision11ImageBufferIT_S5_EERKNS4_IT0_S9_EE_block_invoke;
      goto LABEL_33;
    }
  }
  else if (PixelFormatType == 843264104)
  {
    int v9 = *(_DWORD *)(a1 + 32);
    if (v9 == 843264102)
    {
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v25, pixelBuffer);
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v22, a3);
      if (!v27) {
        goto LABEL_34;
      }
      if (!v26) {
        goto LABEL_34;
      }
      unint64_t v10 = v24;
      if (!v24) {
        goto LABEL_34;
      }
      size_t v11 = iterations;
      if (!iterations) {
        goto LABEL_34;
      }
      float v12 = (float)v27 / (float)v24;
      float v13 = (float)v26 / (float)iterations;
      float v14 = 1.0;
      float v15 = 1.0 / v12;
      unint64_t v16 = v27 - 1;
      unint64_t v17 = v26 - 1;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      id v18 = ___Z21convertAndResizeImageI10Pixel_UHVH10Pixel_UFVFEvRKN5apple6vision11ImageBufferIT_S5_EERKNS4_IT0_S9_EE_block_invoke;
      goto LABEL_33;
    }
    if (v9 == 843264104)
    {
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v25, pixelBuffer);
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v22, a3);
      if (!v27) {
        goto LABEL_34;
      }
      if (!v26) {
        goto LABEL_34;
      }
      unint64_t v10 = v24;
      if (!v24) {
        goto LABEL_34;
      }
      size_t v11 = iterations;
      if (!iterations) {
        goto LABEL_34;
      }
      float v12 = (float)v27 / (float)v24;
      float v13 = (float)v26 / (float)iterations;
      float v14 = 1.0;
      float v15 = 1.0 / v12;
      unint64_t v16 = v27 - 1;
      unint64_t v17 = v26 - 1;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      id v18 = ___Z21convertAndResizeImageI10Pixel_UHVHS0_EvRKN5apple6vision11ImageBufferIT_S4_EERKNS3_IT0_S8_EE_block_invoke;
LABEL_33:
      v30 = v18;
      v31 = &__block_descriptor_88_e8_v16__0Q8l;
      unint64_t v32 = v17;
      v33 = &v25;
      int v34 = &v22;
      unint64_t v35 = v10;
      float v37 = v13;
      float v38 = v12;
      unint64_t v36 = v16;
      float v39 = v15;
      float v40 = v14 / v13;
      dispatch_apply(v11, 0, &block);
LABEL_34:
      char v20 = 1;
      goto LABEL_22;
    }
  }
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Invalid pixel format combinations"];
    char v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_21:
    char v20 = 0;
  }
LABEL_22:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v20 & 1;
}

uint64_t __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a2;
  v4 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a1[4]];
  memset(&v19, 0, sizeof(v19));
  unint64_t v5 = a1[5];
  [v4 extent];
  double v7 = v6;
  unint64_t v8 = a1[6];
  [v4 extent];
  CGAffineTransformMakeScale(&v19, (double)v5 / v7, (double)v8 / v9);
  CGAffineTransform v18 = v19;
  unint64_t v10 = [v4 imageByApplyingTransform:&v18];

  size_t v11 = objc_alloc_init(VNCIMultiplicationFilter);
  [(VNCIFilter *)v11 setInputImage:v10];
  float v12 = [NSNumber numberWithDouble:v19.a];
  [(VNCIMultiplicationFilter *)v11 setInputFactor1:v12];

  float v13 = [NSNumber numberWithDouble:v19.d];
  [(VNCIMultiplicationFilter *)v11 setInputFactor2:v13];

  float v14 = [(VNCIMultiplicationFilter *)v11 outputImage];

  if (v3) {
    float v15 = (void *)v3[1];
  }
  else {
    float v15 = 0;
  }
  id v16 = v15;
  [v16 render:v14 toCVPixelBuffer:a1[7]];

  return 1;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v37 = a6;
  id v38 = a9;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __129__VNOpticalFlowGeneratorRevision2_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
  v43[3] = &unk_1E5B20040;
  v43[4] = self;
  if (+[VNValidationUtilities validateNonZeroImageWidth:(unint64_t)width height:(unint64_t)height componentNameProvidingBlock:v43 error:a8])
  {
    CGAffineTransform v18 = [(VNOpticalFlowGenerator *)self validatedImageBuffersFromOptions:v17 error:a8];
    CGAffineTransform v19 = v18;
    if (v18)
    {
      if ([v18 count] == 2)
      {
        char v20 = [v19 objectAtIndexedSubscript:0];
        uint64_t v21 = [v20 width];
        uint64_t v22 = [v19 objectAtIndexedSubscript:1];
        if (v21 == [v22 width])
        {
          v23 = [v19 objectAtIndexedSubscript:0];
          uint64_t v24 = [v23 height];
          uint64_t v25 = [v19 objectAtIndexedSubscript:1];
          LOBYTE(v24) = v24 == [v25 height];

          if (v24)
          {
            id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id obj = v19;
            uint64_t v26 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v40;
              while (2)
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v40 != v27) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v29 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                  [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
                  v30 = objc_msgSend(v29, "croppedBufferWithWidth:height:format:cropRect:options:error:", self->_preferredBufferSizeFormat.width, self->_preferredBufferSizeFormat.height, self->_preferredBufferSizeFormat.format, v17, a8, x, y, width, height);
                  if (!v30)
                  {
                    int v31 = 1;
                    goto LABEL_26;
                  }
                  [v36 addObject:v30];
                }
                uint64_t v26 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
            }
            int v31 = 0;
LABEL_26:

            if ([v36 count] != 2)
            {

              id v36 = 0;
            }
            BOOL v32 = v31 == 0;
            if (!v31) {
              [v17 setObject:v36 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_FromAndToPixelBuffers"];
            }

            goto LABEL_23;
          }
        }
        else
        {
        }
        if (a8)
        {
          id v33 = +[VNError errorForInvalidOperationWithLocalizedDescription:@"Optical flow cannot be performed on images with different dimensions"];
          goto LABEL_21;
        }
      }
      else if (a8)
      {
        id v33 = +[VNError errorForInvalidOperationWithLocalizedDescription:@"Optical flow incorrect number of images to compare"];
LABEL_21:
        BOOL v32 = 0;
        *a8 = v33;
LABEL_23:

        goto LABEL_24;
      }
    }
    BOOL v32 = 0;
    goto LABEL_23;
  }
  BOOL v32 = 0;
LABEL_24:

  return v32;
}

NSString *__129__VNOpticalFlowGeneratorRevision2_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)VNOpticalFlowGeneratorRevision2;
  if (-[VNDetector completeInitializationForSession:error:](&v36, sel_completeInitializationForSession_error_, a3))
  {
    double v6 = [(VNDetector *)self configurationOptions];
    unint64_t v35 = 0;
    if (!+[VNValidationUtilities getNSUIntegerValue:&v35 forKey:@"VNOpticalFlowGeneratorOption_ComputationAccuracy" inOptions:v6 error:a4])goto LABEL_27; {
    if (v35 >= 4)
    }
    {
      if (a4)
      {
        double v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        *a4 = +[VNError errorForInvalidOption:v7 named:@"VNOpticalFlowGeneratorOption_ComputationAccuracy"];
      }
      goto LABEL_27;
    }
    char v34 = 1;
    if (!+[VNValidationUtilities getBOOLValue:&v34 forKey:@"VNOpticalFlowGeneratorInitOption_PortraitMode" inOptions:v6 error:a4])
    {
LABEL_27:
      BOOL v8 = 0;
LABEL_28:

      return v8;
    }
    uint64_t v9 = 0;
    while (1)
    {
      unint64_t v10 = (char *)&getPortraitFrameSize(VNOpticalFlowGeneratorComputationAccuracy)::accuracyBufferSizes + v9;
      if (*(void *)((char *)&getPortraitFrameSize(VNOpticalFlowGeneratorComputationAccuracy)::accuracyBufferSizes + v9) == v35) {
        break;
      }
      v9 += 24;
      if (v9 == 96) {
        goto LABEL_25;
      }
    }
    if (v10 == "NSt3__120__shared_ptr_pointerIPfZN6vision3mod28readBinSerializedModelValuesEP7__sFILEPKcRKNS3_26BinSeria"
                "lizedModelFileInfoERNS3_11ModelValuesEbE3$_0NS_9allocatorIfEEEE")
    {
LABEL_25:
      if (!a4) {
        goto LABEL_27;
      }
      float v13 = [NSNumber numberWithUnsignedInteger:v35];
      +[VNError errorForInvalidOption:v13 named:@"VNOpticalFlowGeneratorOption_ComputationAccuracy"];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

      goto LABEL_28;
    }
    if (v34) {
      uint64_t v11 = *((void *)v10 + 2);
    }
    else {
      uint64_t v11 = *((void *)v10 + 1);
    }
    if (v34) {
      uint64_t v12 = *((void *)v10 + 1);
    }
    else {
      uint64_t v12 = *((void *)v10 + 2);
    }
    float v13 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a4];
    if (!v13)
    {
      BOOL v8 = 0;
      goto LABEL_37;
    }
    BOOL v14 = +[VNComputeDeviceUtilities isCPUComputeDevice:v13];
    BOOL v32 = getVCPRequestFrameWidthPropertyKey();
    v37[0] = v32;
    int v31 = [NSNumber numberWithUnsignedLong:v12];
    v38[0] = v31;
    v30 = getVCPRequestFrameHeightPropertyKey();
    v37[1] = v30;
    float v15 = [NSNumber numberWithUnsignedLong:v11];
    v38[1] = v15;
    id v16 = getVCPRequestMotionFlowComputationAccuracyPropertyKey();
    v37[2] = v16;
    id v17 = [NSNumber numberWithUnsignedInteger:v35];
    v38[2] = v17;
    CGAffineTransform v18 = getVCPRequestForceCPUPropertyKey();
    v37[3] = v18;
    CGAffineTransform v19 = [NSNumber numberWithBool:v14];
    v38[3] = v19;
    id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:4];

    char v20 = (VCPMotionFlowRequest *)[objc_alloc((Class)getVCPMotionFlowRequestClass()) initWithOptions:v33];
    motionFlowRequest = self->_motionFlowRequest;
    self->_motionFlowRequest = v20;

    uint64_t v22 = self->_motionFlowRequest;
    if (v22)
    {
      [(VCPMotionFlowRequest *)v22 preferredInputSizeWithOptions:0 error:a4];
      double v25 = v24;
      double v26 = v23;
      if (v24 != *MEMORY[0x1E4F1DB30] || v23 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        unsigned int v29 = [(VCPMotionFlowRequest *)self->_motionFlowRequest preferredPixelFormat];
        self->_preferredBufferSizeFormat.double width = (unint64_t)v25;
        self->_preferredBufferSizeFormat.double height = (unint64_t)v26;
        self->_preferredBufferSizeFormat.format = v29;
        BOOL v8 = 1;
        goto LABEL_36;
      }
      if (a4)
      {
        id v27 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to properly create motion flow estimator"];
LABEL_33:
        BOOL v8 = 0;
        *a4 = v27;
LABEL_36:

        goto LABEL_37;
      }
    }
    else if (a4)
    {
      id v27 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to create motion flow estimator"];
      goto LABEL_33;
    }
    BOOL v8 = 0;
    goto LABEL_36;
  }
  return 0;
}

@end