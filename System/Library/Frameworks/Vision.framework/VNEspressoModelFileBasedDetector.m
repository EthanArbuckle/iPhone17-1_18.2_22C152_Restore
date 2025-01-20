@interface VNEspressoModelFileBasedDetector
+ (id)configurationOptionKeysForDetectorKey;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)espressoModelWeightsFilePathInfoForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 bindPtr:(int)a6 error:(id *)a7;
- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 bindPtr:(int)a6 forModel:(id)a7 error:(id *)a8;
- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 error:(id *)a6;
- (BOOL)_loadEspressoModelWithConfigurationOptions:(id)a3 error:(id *)a4;
- (BOOL)bindBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5;
- (BOOL)bindBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6;
- (BOOL)bindBuffer:(id *)a3 toNetworkOutputBlobName:(id)a4 error:(id *)a5;
- (BOOL)bindBuffer:(id *)a3 toNetworkOutputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6;
- (BOOL)bindClientBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5;
- (BOOL)bindClientBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6;
- (BOOL)bindLockedPixelBuffer:(__CVBuffer *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5;
- (BOOL)bindLockedPixelBuffer:(__CVBuffer *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6;
- (BOOL)bindPixelBuffer:(__CVBuffer *)a3 toNetworkBlobName:(id)a4 error:(id *)a5;
- (BOOL)bindPixelBuffer:(__CVBuffer *)a3 toNetworkBlobName:(id)a4 forModel:(id)a5 error:(id *)a6;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)executePlanAndReturnError:(id *)a3;
- (BOOL)executePlanForModel:(id)a3 error:(id *)a4;
- (BOOL)getWidth:(unint64_t *)a3 height:(unint64_t *)a4 ofEspressoModelNetworkBlobNamed:(id)a5 error:(id *)a6;
- (VNEspressoResources)espressoResources;
- (int)espressoModelNetworkLayersStorageTypeForConfigurationOptions:(id)a3;
- (unint64_t)inputImageAspectRatioHandling;
- (unint64_t)networkRequiredInputImageHeight;
- (unint64_t)networkRequiredInputImageWidth;
@end

@implementation VNEspressoModelFileBasedDetector

BOOL __81__VNEspressoModelFileBasedDetector_supportedComputeStageDevicesForOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1A6257080]();
  v5 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [v5 setObject:v3 forKeyedSubscript:@"VNDetectorInternalOption_ModelComputeDevice"];
  v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  v8 = [v6 espressoModelWeightsFilePathInfoForConfigurationOptions:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (!v8)
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  if (([v8 weightsFileExists] & 1) == 0)
  {
    if (([v8 weightsFileExists] & 1) != 0 || (objc_msgSend(v8, "isRegularWeightsFile") & 1) == 0)
    {
      BOOL v9 = +[VNComputeDeviceUtilities isNeuralEngineComputeDevice:v3];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  v6 = [a1 espressoModelFileNameForConfigurationOptions:a3];
  if (v6)
  {
    a4 = +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:v6 error:a4];
  }
  else if (a4)
  {
    id v7 = [NSString alloc];
    v8 = NSStringFromClass((Class)a1);
    BOOL v9 = (void *)[v7 initWithFormat:@"%@ did not provide a valid model file name", v8];

    *a4 = +[VNError errorForInvalidModelWithLocalizedDescription:v9];

    a4 = 0;
  }

  return a4;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[VNComputeDeviceUtilities allComputeDevices];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__29190;
  v24 = __Block_byref_object_dispose__29191;
  id v25 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __81__VNEspressoModelFileBasedDetector_supportedComputeStageDevicesForOptions_error___block_invoke;
  v16 = &unk_1E5B1EE48;
  id v8 = v6;
  v18 = &v20;
  id v19 = a1;
  id v17 = v8;
  BOOL v9 = [v7 indexesOfObjectsPassingTest:&v13];
  if (objc_msgSend(v9, "count", v13, v14, v15, v16))
  {
    v26 = @"VNComputeStageMain";
    v10 = [v7 objectsAtIndexes:v9];
    v27[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  }
  else
  {
    v11 = 0;
    if (a4) {
      *a4 = (id) v21[5];
    }
  }

  _Block_object_dispose(&v20, 8);

  return v11;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  id v4 = a3;
  if ((id)objc_opt_class() == a1
    || !+[VisionCoreRuntimeUtilities item:a1 overridesClassSelector:sel_espressoModelPathForConfigurationOptions_error_])
  {
    id v8 = 0;
  }
  else
  {
    id v11 = 0;
    v5 = [a1 espressoModelPathForConfigurationOptions:v4 error:&v11];
    id v6 = v11;
    id v7 = [v6 localizedDescription];
    +[VNError VNAssert:v5 != 0 log:v7];

    if (v5)
    {
      id v8 = [v5 lastPathComponent];
      if ([v8 hasSuffix:@".espresso.net"])
      {
        uint64_t v9 = [v8 stringByDeletingPathExtension];

        id v8 = (void *)v9;
      }
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNEspressoModelFileBasedDetector;
  if (!-[VNDetector completeInitializationForSession:error:](&v9, sel_completeInitializationForSession_error_, a3)) {
    return 0;
  }
  id v6 = [(VNDetector *)self configurationOptions];
  BOOL v7 = [(VNEspressoModelFileBasedDetector *)self _loadEspressoModelWithConfigurationOptions:v6 error:a4];

  return v7;
}

- (BOOL)_loadEspressoModelWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a4];
  if (v7)
  {
    id v8 = (void *)[v6 mutableCopy];
    v28 = [(id)objc_opt_class() espressoModelPathForConfigurationOptions:v8 error:a4];
    if (!v28
      || ([v6 objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"],
          objc_super v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 BOOLValue],
          v9,
          unsigned int v30 = 0,
          !+[VNValidationUtilities getEspressoPriority:&v30 forKey:@"VNDetectorOption_EspressoPlanPriority" inOptions:v6 withDefaultValue:0 error:a4]))
    {
      BOOL v20 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v27 = v8;
    id v11 = [v6 objectForKeyedSubscript:@"VNDetectorInitOption_MemoryPoolId"];
    unsigned int v26 = v10;
    uint64_t v12 = [v11 unsignedLongLongValue];

    uint64_t v13 = v30;
    uint64_t v14 = [v6 objectForKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_InputBlobNames"];
    v15 = [v6 objectForKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_OutputBlobNames"];
    v16 = [v6 objectForKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_NetworkConfiguration"];
    id v29 = 0;
    LOBYTE(v12) = +[VNEspressoHelpers createSingleNetworkPlanFromModelPath:v28 forComputeDevice:v7 lowPriorityMode:v26 priority:v13 inputBlobNames:v14 outputBlobNames:v15 networkConfiguration:v16 memoryPoolId:v12 espressoResources:&v29 error:a4];
    id v17 = v29;
    id v18 = v29;

    if ((v12 & 1) == 0)
    {
      BOOL v20 = 0;
LABEL_19:
      id v8 = v27;

      goto LABEL_20;
    }
    objc_storeStrong((id *)&self->_espressoResources, v17);
    id v19 = [(id)objc_opt_class() espressoModelInputImageDimensionsBlobNameForConfigurationOptions:v6];
    if (v19)
    {
      if ([(VNEspressoModelFileBasedDetector *)self getWidth:&self->_networkRequiredInputImageWidth height:&self->_networkRequiredInputImageHeight ofEspressoModelNetworkBlobNamed:v19 error:a4])
      {
        if (self->_networkRequiredInputImageWidth && self->_networkRequiredInputImageHeight)
        {
          BOOL v20 = 1;
LABEL_18:

          goto LABEL_19;
        }
        if (a4)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected network input image size"];
          BOOL v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
    }
    else if (a4)
    {
      v21 = NSString;
      uint64_t v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      v24 = [v21 stringWithFormat:@"%@ did not provide a valid model input image dimensions blob name", v23];

      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v24];
    }
    BOOL v20 = 0;
    goto LABEL_18;
  }
  BOOL v20 = 0;
LABEL_21:

  return v20;
}

- (BOOL)getWidth:(unint64_t *)a3 height:(unint64_t *)a4 ofEspressoModelNetworkBlobNamed:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  [v11 network];
  if ([v10 length]) {
    [v10 UTF8String];
  }
  uint64_t blob_dimensions = espresso_network_query_blob_dimensions();

  if (blob_dimensions)
  {
    if (a6)
    {
      uint64_t v13 = [NSString stringWithFormat:@"could not obtain the dimensions of \"%@\"", v10];
      *a6 = +[VNError errorForEspressoReturnStatus:blob_dimensions localizedDescription:v13];
    }
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
  }

  return blob_dimensions == 0;
}

- (VNEspressoResources)espressoResources
{
  return self->_espressoResources;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 0;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return 0;
}

+ (id)espressoModelWeightsFilePathInfoForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [a1 espressoModelPathForConfigurationOptions:v6 error:a4];
  if (v7)
  {
    if (+[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathInfoForConfigurationOptions:error:]::onceToken != -1) {
      dispatch_once(&+[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathInfoForConfigurationOptions:error:]::onceToken, &__block_literal_global_29091);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__VNEspressoModelFileBasedDetector_espressoModelWeightsFilePathInfoForConfigurationOptions_error___block_invoke_2;
    aBlock[3] = &unk_1E5B1EE70;
    id v8 = v7;
    id v13 = v8;
    objc_super v9 = _Block_copy(aBlock);
    id v10 = [(id)+[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathInfoForConfigurationOptions:error:]::weightsFilePathInfoCache objectForIdentifier:v8 creationBlock:v9 error:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

VNEspressoModelWeightsFileInfo *__98__VNEspressoModelFileBasedDetector_espressoModelWeightsFilePathInfoForConfigurationOptions_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = +[VNEspressoHelpers weightsFilePathForEspressoNetworkModelFilePath:*(void *)(a1 + 32) error:a2];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = -[VNEspressoModelWeightsFileInfo initWithFilePath:exists:isRegular:]([VNEspressoModelWeightsFileInfo alloc], "initWithFilePath:exists:isRegular:", v3, [v4 fileExistsAtPath:*(void *)(a1 + 32)], objc_msgSend(*(id *)(a1 + 32), "hasSuffix:", @".espresso.weights"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __98__VNEspressoModelFileBasedDetector_espressoModelWeightsFilePathInfoForConfigurationOptions_error___block_invoke()
{
  +[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathInfoForConfigurationOptions:error:]::weightsFilePathInfoCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4FB3EE8]);

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

- (unint64_t)inputImageAspectRatioHandling
{
  return self->_inputImageAspectRatioHandling;
}

- (unint64_t)networkRequiredInputImageHeight
{
  return self->_networkRequiredInputImageHeight;
}

- (unint64_t)networkRequiredInputImageWidth
{
  return self->_networkRequiredInputImageWidth;
}

- (BOOL)executePlanForModel:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 plan];
  uint64_t v6 = espresso_plan_execute_sync();
  int v7 = v6;
  if (a4 && v6)
  {
    *a4 = +[VNError errorForEspressoReturnStatus:v6 localizedDescription:@"inference plan failed to execute"];
  }

  return v7 == 0;
}

- (BOOL)executePlanAndReturnError:(id *)a3
{
  id v5 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  LOBYTE(a3) = [(VNEspressoModelFileBasedDetector *)self executePlanForModel:v5 error:a3];

  return (char)a3;
}

- (BOOL)bindPixelBuffer:(__CVBuffer *)a3 toNetworkBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  id v8 = a4;
  id v9 = a5;
  [v9 network];
  id v10 = v8;
  [v10 UTF8String];
  uint64_t v11 = espresso_network_bind_cvpixelbuffer();
  int v12 = v11;
  if (a6 && v11)
  {
    *a6 = +[VNError errorForEspressoReturnStatus:v11 localizedDescription:@"failed to bind pixel buffer to network"];
  }

  return v12 == 0;
}

- (BOOL)bindPixelBuffer:(__CVBuffer *)a3 toNetworkBlobName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  LOBYTE(a5) = [(VNEspressoModelFileBasedDetector *)self bindPixelBuffer:a3 toNetworkBlobName:v8 forModel:v9 error:a5];

  return (char)a5;
}

- (BOOL)bindLockedPixelBuffer:(__CVBuffer *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  id v8 = a4;
  id v9 = a5;
  [v9 network];
  id v10 = v8;
  [v10 UTF8String];
  uint64_t v11 = espresso_network_bind_input_cvpixelbuffer();
  int v12 = v11;
  if (a6 && v11)
  {
    *a6 = +[VNError errorForEspressoReturnStatus:v11 localizedDescription:@"failed to bind pixel buffer to network"];
  }

  return v12 == 0;
}

- (BOOL)bindLockedPixelBuffer:(__CVBuffer *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  LOBYTE(a5) = [(VNEspressoModelFileBasedDetector *)self bindPixelBuffer:a3 toNetworkBlobName:v8 forModel:v9 error:a5];

  return (char)a5;
}

- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 bindPtr:(int)a6 forModel:(id)a7 error:(id *)a8
{
  id v10 = a4;
  id v11 = a7;
  [v11 network];
  id v12 = v10;
  [v12 UTF8String];
  uint64_t v13 = espresso_network_bind_buffer();
  int v14 = v13;
  if (a8 && v13)
  {
    *a8 = +[VNError errorForEspressoReturnStatus:v13 localizedDescription:@"failed to bind buffer to network"];
  }

  return v14 == 0;
}

- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 bindPtr:(int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  uint64_t v13 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  LOBYTE(a7) = [(VNEspressoModelFileBasedDetector *)self _bindBuffer:a3 toNetworkBlobName:v12 bindMode:v9 bindPtr:v8 forModel:v13 error:a7];

  return (char)a7;
}

- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  LOBYTE(a6) = [(VNEspressoModelFileBasedDetector *)self _bindBuffer:a3 toNetworkBlobName:v10 bindMode:v7 bindPtr:0x10000 forModel:v11 error:a6];

  return (char)a6;
}

- (BOOL)bindBuffer:(id *)a3 toNetworkOutputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  return [(VNEspressoModelFileBasedDetector *)self _bindBuffer:a3 toNetworkBlobName:a4 bindMode:0x20000 bindPtr:0x10000 forModel:a5 error:a6];
}

- (BOOL)bindBuffer:(id *)a3 toNetworkOutputBlobName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  LOBYTE(a5) = [(VNEspressoModelFileBasedDetector *)self _bindBuffer:a3 toNetworkBlobName:v8 bindMode:0x20000 bindPtr:0x10000 forModel:v9 error:a5];

  return (char)a5;
}

- (BOOL)bindClientBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  return [(VNEspressoModelFileBasedDetector *)self _bindBuffer:a3 toNetworkBlobName:a4 bindMode:0x10000 bindPtr:0x20000 forModel:a5 error:a6];
}

- (BOOL)bindClientBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  LOBYTE(a5) = [(VNEspressoModelFileBasedDetector *)self bindClientBuffer:a3 toNetworkInputBlobName:v8 forModel:v9 error:a5];

  return (char)a5;
}

- (BOOL)bindBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  return [(VNEspressoModelFileBasedDetector *)self _bindBuffer:a3 toNetworkBlobName:a4 bindMode:0x10000 bindPtr:0x10000 forModel:a5 error:a6];
}

- (BOOL)bindBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  LOBYTE(a5) = [(VNEspressoModelFileBasedDetector *)self bindBuffer:a3 toNetworkInputBlobName:v8 forModel:v9 error:a5];

  return (char)a5;
}

- (int)espressoModelNetworkLayersStorageTypeForConfigurationOptions:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v3 error:0];
  int v5 = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:v4];

  return v5;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  id v19 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  if (v19)
  {
    unint64_t v20 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageWidth];
    unint64_t v21 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageHeight];
    double v22 = (double)(unint64_t)[v19 width];
    double v23 = width * v22;
    double v24 = (double)(unint64_t)[v19 height];
    double v25 = height * v24;
    if (v23 >= v25) {
      double v26 = v25;
    }
    else {
      double v26 = v23;
    }
    if (v20 >= v21) {
      uint64_t v27 = v21;
    }
    else {
      uint64_t v27 = v20;
    }
    if (v26 < (double)(unint64_t)v27) {
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, v27);
    }
    v28 = [(VNDetector *)self configurationOptions];
    id v29 = (__CVBuffer *)objc_msgSend(v19, "croppedBufferWithWidth:height:format:cropRect:options:error:", v20, v21, objc_msgSend((id)objc_opt_class(), "networkRequiredInputImagePixelFormatForConfigurationOptions:", v28), v17, a8, x * v22, y * v24, v23, v25);
    *a7 = v29;
    BOOL v30 = v29 != 0;
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v6 error:a4];
  if (v7)
  {
    id v8 = (void *)[v6 mutableCopy];
    [v8 setObject:v7 forKeyedSubscript:@"VNDetectorInternalOption_ModelComputeDevice"];
    uint64_t v9 = [a1 espressoModelPathForConfigurationOptions:v8 error:a4];
    if (v9)
    {
      id v10 = [a1 espressoModelInputImageDimensionsBlobNameForConfigurationOptions:v6];
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      if (+[VNEspressoHelpers getWidth:&v17 height:&v16 ofBlobNamed:v10 forNetworkModelFileWithPath:v9 error:a4])
      {
        uint64_t v11 = [a1 networkRequiredInputImagePixelFormatForConfigurationOptions:v6];
        id v12 = [VNSupportedImageSize alloc];
        uint64_t v13 = [(VNSupportedImageSize *)v12 initWithIdealFormat:v11 width:v17 height:v16 orientation:1 aspectRatioHandling:0 orientationAgnostic:0];
        v18[0] = v13;
        int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      }
      else
      {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__VNEspressoModelFileBasedDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __73__VNEspressoModelFileBasedDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNEspressoModelFileBasedDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorOption_OriginatingRequestSpecifier"];
  [v2 addObject:@"VNEspressoModelFileBasedDetectorOption_InputBlobNames"];
  [v2 addObject:@"VNEspressoModelFileBasedDetectorOption_OutputBlobNames"];
  [v2 addObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)+[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

@end