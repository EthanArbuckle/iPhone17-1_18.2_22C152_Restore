@interface VNE5RTBasedDetector
+ (BOOL)modelFullyANEResident;
+ (CGRect)normalizedScaledFaceBoundingBox:(id)a3;
+ (id)E5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)E5RTProgramLibraryCompilationOptionsForModelSource:(id)a3 configurationOptions:(id)a4 error:(id *)a5;
+ (id)E5RTProgramLibraryCustomCompilationOptionsForModelSource:(id)a3 configurationOptions:(id)a4 error:(id *)a5;
+ (id)E5RTProgramLibraryForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)classificationIdentifiersForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)createE5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
+ (unint64_t)E5RTVisionCoreComputeDeviceForConfigurationOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)imageCropAndScaleOption:(unint64_t *)a3 fromOptions:(id)a4 error:(id *)a5;
- (VisionCoreE5RTInferenceFunctionDescriptor)functionDescriptor;
- (id)_onlyInputImageDescriptorAndReturnError:(uint64_t)a1;
- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 configurationOptions:(id)a4 error:(id *)a5;
- (id)newE5RTExecutionInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 options:(id)a5 error:(id *)a6;
- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (unint64_t)defaultImageCropAndScaleOption;
@end

@implementation VNE5RTBasedDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionContext, 0);

  objc_storeStrong((id *)&self->_functionDescriptor, 0);
}

- (VisionCoreE5RTInferenceFunctionDescriptor)functionDescriptor
{
  return self->_functionDescriptor;
}

- (BOOL)imageCropAndScaleOption:(unint64_t *)a3 fromOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  +[VNError VNAssert:a3 != 0 log:@"cropAndScaleOptionPointer cannot be NULL"];
  unint64_t v12 = 0;
  id v9 = v8;
  if (self
    && +[VNValidationUtilities getNSUIntegerValue:&v12 forKey:@"VNDetectorProcessOption_ImageCropAndScaleOption" inOptions:v9 withDefaultValue:[(VNE5RTBasedDetector *)self defaultImageCropAndScaleOption] error:a5])
  {
    if (v12 == 2) {
      unint64_t v12 = 0;
    }

    *a3 = v12;
    BOOL v10 = 1;
  }
  else
  {

    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)defaultImageCropAndScaleOption
{
  return 0;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a5;
  v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
  if (v13)
  {
    id v14 = [(VNE5RTBasedDetector *)self newE5RTExecutionInputsForFunctionDescriptor:self->_functionDescriptor croppedPixelBuffer:a4 options:v12 error:a8];
    if (v14)
    {
      v15 = [(VisionCoreE5RTExecutionContext *)self->_executionContext executeWithInputObjects:v14 error:a8];
      if (v15)
      {
        v16 = [(VNE5RTBasedDetector *)self observationsFromE5RTExecutionOutputs:v15 forFunctionDescriptor:self->_functionDescriptor originatingRequestSpecifier:v13 options:v12 error:a8];
        v17 = v16;
        if (v16) {
          id v18 = v16;
        }
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  v19 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  v20 = v19;
  if (v19)
  {
    unint64_t v21 = [v19 width];
    unint64_t v22 = [v20 height];
    id v56 = 0;
    BOOL v23 = +[VNValidationUtilities getOptionalFaceObservation:&v56 inOptions:v17 error:a8];
    id v24 = v56;
    v25 = v24;
    if (v23)
    {
      if (v24)
      {
        [(id)objc_opt_class() normalizedScaledFaceBoundingBox:v24];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        unint64_t v34 = [v20 width];
        unint64_t v35 = [v20 height];
        LODWORD(v55) = -1;
        if (([v25 getFaceEXIFOrientation:&v55 error:a8] & 1) == 0) {
          goto LABEL_25;
        }
        v36 = [NSNumber numberWithInt:v55];
        [v17 setObject:v36 forKeyedSubscript:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight"];
        double v37 = v27 * (double)v34;
        double v38 = v31 * (double)v34;
        double v39 = v29 * (double)v35;
        double v40 = v33 * (double)v35;
      }
      else
      {
        double v37 = x * (double)v21;
        double v38 = width * (double)v21;
        double v39 = y * (double)v22;
        double v40 = height * (double)v22;
      }
      uint64_t v55 = 0;
      if ([(VNE5RTBasedDetector *)self imageCropAndScaleOption:&v55 fromOptions:v17 error:a8])
      {
        v42 = -[VNE5RTBasedDetector _onlyInputImageDescriptorAndReturnError:]((uint64_t)self, a8);
        v43 = v42;
        if (v42)
        {
          unint64_t v53 = [v42 pixelWidth];
          unint64_t v44 = [v43 pixelHeight];
          unint64_t v45 = v44;
          unint64_t v46 = v53;
          if (v53 >= v44) {
            unint64_t v46 = v44;
          }
          if (v38 >= v40) {
            double v47 = v40;
          }
          else {
            double v47 = v38;
          }
          if (v47 < (double)v46)
          {
            if (width >= height) {
              double v48 = height;
            }
            else {
              double v48 = width;
            }
            if (v48 <= 0.0) {
              double v48 = 1.0;
            }
            VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)((double)v46 / v48));
          }
          [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
          uint64_t v49 = [v43 pixelFormatType];
          id v54 = 0;
          v50 = (__CVBuffer *)objc_msgSend(v20, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", v53, v45, v49, v55, v17, a8, v37, v39, v38, v40, 0, 0, 0, &v54);
          id v51 = v54;
          *a7 = v50;
          BOOL v41 = v50 != 0;
          if (v50) {
            [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v17 cacheKey:v51 imageBuffer:v20];
          }
        }
        else
        {
          BOOL v41 = 0;
        }

        goto LABEL_26;
      }
    }
LABEL_25:
    BOOL v41 = 0;
LABEL_26:

    goto LABEL_27;
  }
  BOOL v41 = 0;
LABEL_27:

  return v41;
}

- (id)_onlyInputImageDescriptorAndReturnError:(uint64_t)a1
{
  if (a1)
  {
    v3 = [*(id *)(a1 + 56) onlyInputImage];
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else if (a2)
    {
      id v6 = [NSString alloc];
      v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = (void *)[v6 initWithFormat:@"%@ does not have a single input image", v8];

      *a2 = +[VNError errorForInvalidOperationWithLocalizedDescription:v9];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)VNE5RTBasedDetector;
  if (!-[VNDetector completeInitializationForSession:error:](&v14, sel_completeInitializationForSession_error_, a3)) {
    return 0;
  }
  id v6 = [(VNDetector *)self configurationOptions];
  v7 = [(id)objc_opt_class() E5RTFunctionDescriptorForConfigurationOptions:v6 error:a4];
  functionDescriptor = self->_functionDescriptor;
  self->_functionDescriptor = v7;

  id v9 = self->_functionDescriptor;
  if (v9)
  {
    BOOL v10 = [(VNE5RTBasedDetector *)self newE5RTExecutionContextForFunctionDescriptor:v9 configurationOptions:v6 error:a4];
    executionContext = self->_executionContext;
    self->_executionContext = v10;

    BOOL v12 = self->_executionContext != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  if (a7)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self, a5, a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)newE5RTExecutionInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 options:(id)a5 error:(id *)a6
{
  id v9 = objc_alloc_init(MEMORY[0x1E4FB3ED8]);
  if (!a4)
  {
LABEL_4:
    id v11 = v9;
    goto LABEL_6;
  }
  BOOL v10 = -[VNE5RTBasedDetector _onlyInputImageDescriptorAndReturnError:]((uint64_t)self, a6);
  id v11 = v10;
  if (v10)
  {
    BOOL v12 = [v10 name];
    char v13 = [v9 assignPixelBuffer:a4 toName:v12 error:a6];

    if ((v13 & 1) == 0)
    {
      id v11 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v11;
}

- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 configurationOptions:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB3E70]);
  id v8 = [v6 function];
  id v9 = (void *)[v8 newExecutionContextWithConfiguration:v7 error:a5];

  return v9;
}

+ (BOOL)modelFullyANEResident
{
  return 1;
}

+ (id)classificationIdentifiersForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(a1, "E5RTFunctionDescriptorForConfigurationOptions:error:", a3);
  if (v5)
  {
    id v6 = [v5 confidencesOutputOfClass:objc_opt_class() error:a4];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 sortedValidLabels];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 E5RTFunctionDescriptorForConfigurationOptions:v6 error:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 onlyInputImage];
    if (v9)
    {
      BOOL v10 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", [v9 pixelFormatType], objc_msgSend(v9, "pixelWidth"), objc_msgSend(v9, "pixelHeight"), 1, 0, 0);
      v16[0] = v10;
      a4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    }
    else if (a4)
    {
      id v11 = [NSString alloc];
      BOOL v12 = (objc_class *)objc_opt_class();
      char v13 = NSStringFromClass(v12);
      objc_super v14 = (void *)[v11 initWithFormat:@"%@ (%@) does not have an input image", v13, v8];

      *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v14 underlyingError:0];

      a4 = 0;
    }
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = [a1 E5RTFunctionDescriptorForConfigurationOptions:a3 error:a4];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 function];
    id v7 = [v6 programLibrary];
    id v11 = @"VNComputeStageMain";
    id v8 = +[VNComputeDeviceUtilities computeDevicesOfTypes:7];
    v12[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (CGRect)normalizedScaledFaceBoundingBox:(id)a3
{
  [a3 unalignedBoundingBox];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

+ (id)createE5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

+ (id)E5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __75__VNE5RTBasedDetector_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke;
  unint64_t v21 = &unk_1E5B20078;
  id v23 = a1;
  id v7 = v6;
  id v22 = v7;
  id v8 = _Block_copy(&aBlock);
  id v9 = [a1 modelURLForConfigurationOptions:v7 error:a4];
  if (v9)
  {
    id v10 = [NSString alloc];
    id v11 = NSStringFromClass((Class)a1);
    BOOL v12 = [a1 modelURLForConfigurationOptions:v7 error:0];
    char v13 = (void *)[v10 initWithFormat:@"%@:%@", v11, v12, aBlock, v19, v20, v21];

    objc_super v14 = +[VNFrameworkManager manager];
    v15 = [v14 detectorDescriptorsCache];
    v16 = [v15 objectForIdentifier:v13 creationBlock:v8 error:a4];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __75__VNE5RTBasedDetector_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 40) createE5RTFunctionDescriptorForConfigurationOptions:*(void *)(a1 + 32) error:a2];
  double v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (id)E5RTProgramLibraryCustomCompilationOptionsForModelSource:(id)a3 configurationOptions:(id)a4 error:(id *)a5
{
  return &stru_1EF75C0C0;
}

+ (id)E5RTProgramLibraryCompilationOptionsForModelSource:(id)a3 configurationOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4FB3E90]);
  id v11 = [a1 supportedComputeStageDevicesForOptions:v9 error:a5];
  BOOL v12 = [v11 objectForKey:@"VNComputeStageMain"];

  if (v12)
  {
    [v10 setComputeDeviceTypes:VNVisionCoreE5RTComputeDeviceTypesForMLComputeDevices(v12)];
    objc_msgSend(v10, "setFullyANEResident:", objc_msgSend((id)objc_opt_class(), "modelFullyANEResident"));
    char v13 = [a1 E5RTProgramLibraryCustomCompilationOptionsForModelSource:v8 configurationOptions:v9 error:a5];
    objc_super v14 = v13;
    if (v13)
    {
      if (([v13 isEqualToString:&stru_1EF75C0C0] & 1) == 0)
      {
        v15 = [v10 customCompilationOptions];

        if (v15)
        {
          v16 = [v10 customCompilationOptions];
          id v17 = [v16 stringByAppendingString:v14];
          [v10 setCustomCompilationOptions:v17];
        }
        else
        {
          [v10 setCustomCompilationOptions:v14];
        }
      }
      id v18 = v10;
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (unint64_t)E5RTVisionCoreComputeDeviceForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v4 = [a1 supportedComputeStageDevicesForOptions:a3 error:a4];
  double v5 = [v4 objectForKey:@"VNComputeStageMain"];

  if (v5) {
    unint64_t v6 = VNVisionCoreE5RTComputeDeviceTypesForMLComputeDevices(v5);
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)E5RTProgramLibraryForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 modelURLForConfigurationOptions:v6 error:a4];
  id v8 = v7;
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_17;
  }
  id v9 = [v7 URLByDeletingLastPathComponent];
  if (![MEMORY[0x1E4FB3E88] isProgramLibraryAtURL:v9])
  {
    if ([MEMORY[0x1E4FB3E80] isModelSourceURL:v8])
    {
      id v11 = [MEMORY[0x1E4FB3E80] modelSourceFromURL:v8 error:a4];
      if (v11)
      {
        BOOL v12 = [a1 E5RTProgramLibraryCompilationOptionsForModelSource:v11 configurationOptions:v6 error:a4];
        if (v12)
        {
          id v10 = [MEMORY[0x1E4FB3E88] compileModelSource:v11 options:v12 error:a4];
        }
        else
        {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      if (!a4)
      {
        id v10 = 0;
        goto LABEL_16;
      }
      id v13 = [NSString alloc];
      objc_super v14 = [v8 path];
      id v11 = (void *)[v13 initWithFormat:@"Could not open program library for %@", v14];

      +[VNError errorForInvalidArgumentWithLocalizedDescription:v11];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_16;
  }
  id v10 = [MEMORY[0x1E4FB3E88] programLibraryForURL:v9 error:a4];
LABEL_16:

LABEL_17:

  return v10;
}

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

@end