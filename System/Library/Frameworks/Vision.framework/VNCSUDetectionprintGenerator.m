@interface VNCSUDetectionprintGenerator
+ (BOOL)_getCSUDetectionprintNetworkConfiguration:(id *)a3 forConfigurationOptions:(id)a4 error:(id *)a5;
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
+ (int64_t)detectionPrintConfigurationRevisionForConfigurationOptions:(id)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)needsMetalContext;
- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)_observationsFromNetworkOutput:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNCSUDetectionprintGenerator

- (void).cxx_destruct
{
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a5;
  v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
  v14 = v13;
  if (v13)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__15250;
    v33 = __Block_byref_object_dispose__15251;
    id v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__15250;
    network = self->_network;
    v27 = __Block_byref_object_dispose__15251;
    id v28 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __130__VNCSUDetectionprintGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    v19[3] = &unk_1E5B1D778;
    v21 = &v23;
    v22 = &v29;
    v19[4] = self;
    id v20 = v13;
    [(CSUDetectionPrintNetwork *)network runOnInputImage:a4 completion:v19];
    v16 = (void *)v30[5];
    if (v16)
    {
      id v17 = v16;
    }
    else if (a8)
    {
      *a8 = (id) v24[5];
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __130__VNCSUDetectionprintGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    id v13 = 0;
    uint64_t v10 = [v8 _observationsFromNetworkOutput:v5 originatingRequestSpecifier:v9 error:&v13];
    id v7 = v13;
    uint64_t v11 = *(void *)(a1[7] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
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
  id v20 = v19;
  if (v19)
  {
    unint64_t v21 = [v19 width];
    double v22 = (double)(unint64_t)[v20 height];
    double v23 = width * (double)v21;
    double v24 = height * v22;
    if (v23 >= v24) {
      double v25 = v24;
    }
    else {
      double v25 = v23;
    }
    if (self->_inputImageMinimumDimension > (unint64_t)v25) {
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)v25);
    }
    [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
    unint64_t inputImagePixelWidth = self->_inputImagePixelWidth;
    unint64_t inputImagePixelHeight = self->_inputImagePixelHeight;
    uint64_t inputImagePixelFormat = self->_inputImagePixelFormat;
    id v33 = 0;
    uint64_t v29 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", inputImagePixelWidth, inputImagePixelHeight, inputImagePixelFormat, v17, a8, &v33, x * (double)v21, y * v22, v23, v24);
    id v30 = v33;
    *a7 = v29;
    BOOL v31 = v29 != 0;
    if (v29) {
      [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v17 cacheKey:v30 imageBuffer:v20];
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNCSUDetectionprintGenerator;
  if ([(VNDetector *)&v12 warmUpSession:v8 withOptions:v9 error:a5]) {
    char v10 = [(CSUDetectionPrintNetwork *)self->_network loadResourcesAndReturnError:a5];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)VNCSUDetectionprintGenerator;
  if (!-[VNDetector completeInitializationForSession:error:](&v16, sel_completeInitializationForSession_error_, a3)) {
    return 0;
  }
  id v6 = [(VNDetector *)self configurationOptions];
  id v15 = 0;
  char v7 = [(id)objc_opt_class() _getCSUDetectionprintNetworkConfiguration:&v15 forConfigurationOptions:v6 error:a4];
  id v8 = v15;
  if (v7)
  {
    id v9 = (CSUDetectionPrintNetwork *)[objc_alloc(MEMORY[0x1E4F5D060]) initWithConfiguration:v8];
    network = self->_network;
    self->_network = v9;

    uint64_t v11 = [v8 inputPixelBufferDescriptor];
    self->_uint64_t inputImagePixelFormat = [v11 pixelFormat];
    self->_unint64_t inputImagePixelWidth = [v11 width];
    unint64_t v12 = [v11 height];
    self->_unint64_t inputImagePixelHeight = v12;
    unint64_t inputImagePixelWidth = self->_inputImagePixelWidth;
    if (inputImagePixelWidth >= v12) {
      unint64_t inputImagePixelWidth = v12;
    }
    self->_inputImageMinimumDimension = inputImagePixelWidth;
  }
  return v7;
}

- (BOOL)needsMetalContext
{
  return 0;
}

- (id)_observationsFromNetworkOutput:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v20 = a4;
  v28[0] = @"6316";
  v28[1] = @"5637";
  v29[0] = @"VNDetectionprintTensorKeyStride8FeatureMap";
  v29[1] = @"VNDetectionprintTensorKeyStride16FeatureMap";
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v21 availableTapPointNames];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = (VNDetectionprint *)(id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [(VNDetectionprint *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v7 objectForKeyedSubscript:v12];
        if (v13)
        {
          v14 = [v21 detectionPrintFeatureForTapPointName:v12 error:a5];
          if (!v14) {
            goto LABEL_14;
          }
          id v15 = +[VNDetectionprintTensor tensorFromCSUBuffer:v14 originatingRequestSpecifier:v20 error:a5];
          if (!v15)
          {

LABEL_14:
            id v17 = 0;
            objc_super v16 = v8;
            goto LABEL_15;
          }
          [v19 setObject:v15 forKeyedSubscript:v13];
        }
      }
      uint64_t v9 = [(VNDetectionprint *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  objc_super v16 = [[VNDetectionprint alloc] initWithTensorsDictionary:v19 originatingRequestSpecifier:v20];
  id v13 = [[VNDetectionprintObservation alloc] initWithOriginatingRequestSpecifier:v20 detectionprint:v16];
  v26 = v13;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
LABEL_15:

  return v17;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  int v4 = [a1 _getCSUDetectionprintNetworkConfiguration:&v11 forConfigurationOptions:a3 error:a4];
  id v5 = v11;
  id v6 = v5;
  if (v4)
  {
    char v7 = [v5 inputPixelBufferDescriptor];
    id v8 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", [v7 pixelFormat], objc_msgSend(v7, "width"), objc_msgSend(v7, "height"), 1, 0, 0);
    v12[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 detectionPrintConfigurationRevisionForConfigurationOptions:v6];
  id v8 = [MEMORY[0x1E4F5D068] detectionPrintConfigurationForRevision:v7 error:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    id v13 = @"VNComputeStageMain";
    uint64_t v10 = [v8 supportedComputeDevices];
    v14[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)_getCSUDetectionprintNetworkConfiguration:(id *)a3 forConfigurationOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a1 computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v8 error:a5];
  if (v9)
  {
    uint64_t v10 = [a1 detectionPrintConfigurationRevisionForConfigurationOptions:v8];
    id v11 = [MEMORY[0x1E4F5D068] detectionPrintConfigurationForRevision:v10 error:a5];
    uint64_t v12 = v11;
    BOOL v13 = v11 != 0;
    if (v11)
    {
      [v11 setComputeDevice:v9];
      *a3 = v12;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (int64_t)detectionPrintConfigurationRevisionForConfigurationOptions:(id)a3
{
  return 2;
}

@end