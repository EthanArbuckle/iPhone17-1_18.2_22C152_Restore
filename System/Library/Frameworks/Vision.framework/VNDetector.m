@interface VNDetector
+ (BOOL)areExistingInitializationOptions:(id)a3 compatibleWithOptions:(id)a4;
+ (BOOL)isReentrant;
+ (BOOL)loadedInstanceWithBoundComputeStageDevices:(id)a3 canBeUsedForRequestedComputeStageDevices:(id)a4;
+ (BOOL)loadedInstanceWithComputeDevice:(id)a3 boundToComputeStage:(id)a4 canBeUsedForProcessingDeviceBridge:(id)a5;
+ (BOOL)producesObservationsForMultipleRequestClasses;
+ (BOOL)runSuccessReportingBlockSynchronously:(id)a3 detector:(id)a4 qosClass:(unsigned int)a5 error:(id *)a6;
+ (Class)detectorClassAndConfigurationOptions:(id *)a3 forDetectorType:(id)a4 options:(id)a5 error:(id *)a6;
+ (Class)detectorClassForDetectorType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5;
+ (Class)detectorClassForDetectorType:(id)a3 error:(id *)a4;
+ (VNControlledCapacityTasksQueue)detectorCropCreationAsyncTasksQueue;
+ (VNControlledCapacityTasksQueue)detectorCropProcessingAsyncTasksQueue;
+ (VNControlledCapacityTasksQueue)detectorInternalProcessingAsyncTasksQueue;
+ (id)_computeStageDeviceBindingsForConfiguration:(id)a3 error:(id *)a4;
+ (id)_detectorClassForDetectorType:(void *)a3 options:(void *)a4 detectorCreationOptions:(uint64_t)a5 error:;
+ (id)computeDeviceForComputeStage:(id)a3 configurationOptions:(id)a4 error:(id *)a5;
+ (id)computeDeviceForConfiguredProcessingDeviceBridge:(id)a3 computeStage:(id)a4 supportedComputeDevices:(id)a5 error:(id *)a6;
+ (id)computeStageDevicesForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)detectorKeyComponentForDetectorConfigurationOptionKey:(id)a3 value:(id)a4;
+ (id)detectorName;
+ (id)detectorWithConfigurationOptions:(id)a3 forSession:(id)a4 error:(id *)a5;
+ (id)fullyPopulatedConfigurationOptionsWithOverridingOptions:(id)a3;
+ (id)keyForDetectorWithConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForEspressoModelAtPath:(id)a3 inputImageBlobName:(id)a4 analysisPixelFormatType:(unsigned int)a5 error:(id *)a6;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
+ (unsigned)VNClassCode;
+ (void)fullyPopulateConfigurationOptions:(id)a3;
+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3;
- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)currentQueueIsSynchronizationQueue;
- (BOOL)getOptionalCanceller:(id *)a3 inOptions:(id)a4 error:(id *)a5;
- (BOOL)needsMetalContext;
- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (BOOL)useGPU;
- (BOOL)validateImageBuffer:(id)a3 error:(id *)a4;
- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (NSDictionary)boundComputeStageDevices;
- (NSDictionary)configurationOptions;
- (NSString)description;
- (VNControlledCapacityTasksQueue)synchronizationQueue;
- (VNDetector)initWithConfigurationOptions:(id)a3;
- (VNMetalContext)metalContext;
- (id)boundComputeDeviceForComputeStage:(id)a3 error:(id *)a4;
- (id)computeDeviceForComputeStage:(id)a3 processingOptions:(id)a4 error:(id *)a5;
- (id)computeDeviceOfTypes:(unint64_t)a3 forComputeStage:(id)a4 processingOptions:(id)a5 error:(id *)a6;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)newMetalContextForConfigurationOptions:(id)a3 error:(id *)a4;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)requiredCancellerInOptions:(id)a3 error:(id *)a4;
- (id)validatedImageBufferFromOptions:(id)a3 error:(id *)a4;
- (unint64_t)backingStore;
- (unint64_t)signPostAdditionalParameter;
- (void)dealloc;
- (void)produceObservationsWithRegionOfInterest:(CGRect)a3 detectorProcessingOptions:(NSDictionary *)a4 completionHandler:(id)a5;
- (void)recordImageCropQuickLookInfoFromOptions:(id)a3 toObservation:(id)a4;
- (void)recordImageCropQuickLookInfoFromOptionsSafe:(id)a3 toObservation:(id)a4;
- (void)recordImageCropQuickLookInfoToOptions:(id)a3 cacheKey:(id)a4 imageBuffer:(id)a5;
- (void)recordImageCropQuickLookInfoToOptionsSafe:(id)a3 cacheKey:(id)a4 imageBuffer:(id)a5;
- (void)setSynchronizationQueue:(id)a3;
@end

@implementation VNDetector

+ (Class)detectorClassAndConfigurationOptions:(id *)a3 forDetectorType:(id)a4 options:(id)a5 error:(id *)a6
{
  v6 = +[VNDetector _detectorClassForDetectorType:options:detectorCreationOptions:error:]((uint64_t)a1, a4, a5, a3, (uint64_t)a6);

  return (Class)v6;
}

+ (id)_detectorClassForDetectorType:(void *)a3 options:(void *)a4 detectorCreationOptions:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  v10 = (void *)[self detectorClassForDetectorType:v8 error:a5];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 fullyPopulatedConfigurationOptionsWithOverridingOptions:v9];
    v13 = (void *)[v11 detectorClassForConfigurationOptions:v12 error:a5];
    if (v13)
    {
      if (a4) {
        *a4 = v12;
      }
      id v14 = v13;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (Class)detectorClassForDetectorType:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (_detectorTypeToClassDictionary(void)::onceToken != -1) {
    dispatch_once(&_detectorTypeToClassDictionary(void)::onceToken, &__block_literal_global_546);
  }
  id v6 = (id)_detectorTypeToClassDictionary(void)::ourDetectorTypeToClassLookup;
  v7 = (void *)[v6 objectForKeyedSubscript:v5];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    v10 = [NSString stringWithFormat:@"unknown detector type '%@'", v5];
    *a4 = +[VNError errorForUnimplementedFunctionWithLocalizedDescription:v10];
  }

  return (Class)v8;
}

+ (id)fullyPopulatedConfigurationOptionsWithOverridingOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [a1 recordDefaultConfigurationOptionsInDictionary:v5];
  [v5 addEntriesFromDictionary:v4];
  [a1 fullyPopulateConfigurationOptions:v5];
  id v6 = [v5 objectForKeyedSubscript:@"VNDetectorInternalOption_ModelComputeDevice"];

  if (!v6)
  {
    v7 = [a1 computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v5 error:0];
    [v5 setObject:v7 forKeyedSubscript:@"VNDetectorInternalOption_ModelComputeDevice"];
  }

  return v5;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v3 = a3;
  [v3 setObject:&unk_1EF7A7238 forKeyedSubscript:@"VNDetectorInitOption_ModelBackingStore"];
  [v3 setObject:&unk_1EF7A7238 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];
  [v3 setObject:&unk_1EF7A7238 forKeyedSubscript:@"VNDetectorOption_RequestDetectionLevel"];
}

+ (void)fullyPopulateConfigurationOptions:(id)a3
{
  id v3 = a3;
  [v3 removeObjectForKey:@"VNDetectorProcessOption_InputImageBuffers"];
  [v3 removeObjectForKey:@"VNDetectorProcessOption_Canceller"];
}

+ (id)computeDeviceForComputeStage:(id)a3 configurationOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 supportedComputeStageDevicesForOptions:v9 error:a5];
  v11 = v10;
  if (!v10)
  {
    v17 = 0;
    goto LABEL_28;
  }
  v12 = [v10 objectForKeyedSubscript:v8];
  if ([v12 count])
  {
    v13 = [v9 objectForKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
    id v14 = [v13 objectForKeyedSubscript:v8];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ([v12 containsObject:v14])
        {
          id v18 = v14;
LABEL_20:
          id v14 = v18;
          v17 = v18;
          goto LABEL_25;
        }
        if (a5)
        {
          +[VNError errorForUnsupportedComputeDevice:v14];
          v17 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
LABEL_24:
        v17 = 0;
        goto LABEL_25;
      }
      id v15 = v14;
      id v14 = [a1 computeDeviceForConfiguredProcessingDeviceBridge:v15 computeStage:v8 supportedComputeDevices:v12 error:a5];

      if (!v14)
      {
LABEL_8:

        v17 = v14;
LABEL_25:

        goto LABEL_26;
      }
      if ([v12 containsObject:v14])
      {
        id v16 = v14;
        goto LABEL_8;
      }
    }
    v19 = +[VNComputeDeviceUtilities mostPerformantComputeDeviceOfComputeDevices:v12];

    if (v19)
    {
      id v18 = v19;
      goto LABEL_20;
    }
    if (a5)
    {
      id v20 = [NSString alloc];
      v21 = NSStringFromClass((Class)a1);
      v22 = (void *)[v20 initWithFormat:@"%@ could not resolve a compute device", v21];

      *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v22];
    }
    id v14 = 0;
    goto LABEL_24;
  }
  if (a5)
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"No available compute device for %@", v8];
    +[VNError errorForInvalidOperationWithLocalizedDescription:v13];
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  v17 = 0;
LABEL_27:

LABEL_28:

  return v17;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

+ (id)computeDeviceForConfiguredProcessingDeviceBridge:(id)a3 computeStage:(id)a4 supportedComputeDevices:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 computeDevice];
  v11 = +[VNComputeDeviceUtilities computeDeviceOfComputeDevices:v9 mostCompatibleWithComputeDevice:v10 options:3];
  if (!v11)
  {
    v11 = +[VNComputeDeviceUtilities mostPerformantComputeDeviceOfComputeDevices:v9];
    if (!v11)
    {
      if (a6)
      {
        v12 = [v8 processingDevice];
        *a6 = +[VNError errorForUnsupportedProcessingDevice:v12];
      }
      v11 = 0;
    }
  }

  return v11;
}

+ (unsigned)VNClassCode
{
  unsigned int v3 = 0;
  +[VNClassRegistrar getClassCode:&v3 forClass:a1 error:0];
  return v3;
}

+ (id)detectorWithConfigurationOptions:(id)a3 forSession:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (objc_class *)[a1 detectorClassForConfigurationOptions:v8 error:a5];
  if (!v10)
  {
    id v13 = 0;
    goto LABEL_10;
  }
  v11 = (void *)[[v10 alloc] initWithConfigurationOptions:v8];
  v12 = v11;
  if (!v11)
  {
    if (a5)
    {
      +[VNError errorForMemoryAllocationFailure];
      id v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    id v13 = 0;
    goto LABEL_9;
  }
  if (![v11 completeInitializationForSession:v9 error:a5]) {
    goto LABEL_8;
  }
  id v13 = v12;
LABEL_9:

LABEL_10:

  return v13;
}

- (VNDetector)initWithConfigurationOptions:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNDetector;
  id v5 = [(VNDetector *)&v14 init];
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    if (([(objc_class *)v6 isReentrant] & 1) == 0)
    {
      v7 = +[VNDetectorSyncTasksQueueCache sharedCache];
      id v8 = NSStringFromClass(v6);
      uint64_t v9 = [v7 queueWithUniqueAppendix:v8];
      synchronizationQueue = v5->_synchronizationQueue;
      v5->_synchronizationQueue = (VNControlledCapacityTasksQueue *)v9;
    }
    uint64_t v11 = [v4 copy];
    configurationOptions = v5->_configurationOptions;
    v5->_configurationOptions = (NSDictionary *)v11;

    v5->_detectorMultiSessionAccessLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

+ (BOOL)isReentrant
{
  return 0;
}

- (unint64_t)signPostAdditionalParameter
{
  return 0;
}

+ (BOOL)runSuccessReportingBlockSynchronously:(id)a3 detector:(id)a4 qosClass:(unsigned int)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__16832;
  v28 = __Block_byref_object_dispose__16833;
  id v29 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __76__VNDetector_runSuccessReportingBlockSynchronously_detector_qosClass_error___block_invoke;
  v19 = &unk_1E5B1D948;
  unsigned int v23 = a5;
  v21 = &v30;
  id v11 = v9;
  id v20 = v11;
  v22 = &v24;
  v12 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a5, 0, &v16);
  id v13 = objc_msgSend(v10, "synchronizationQueue", v16, v17, v18, v19);
  if (v13 && ([v10 currentQueueIsSynchronizationQueue] & 1) == 0) {
    [v13 dispatchSyncByPreservingQueueCapacity:v12];
  }
  else {
    v12[2](v12);
  }
  int v14 = *((unsigned __int8 *)v31 + 24);
  if (a6 && !*((unsigned char *)v31 + 24)) {
    *a6 = (id) v25[5];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14 != 0;
}

- (VNControlledCapacityTasksQueue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (BOOL)currentQueueIsSynchronizationQueue
{
  synchronizationQueue = self->_synchronizationQueue;
  if (synchronizationQueue) {
    LOBYTE(synchronizationQueue) = [(VNControlledCapacityTasksQueue *)synchronizationQueue currentQueueIsSynchronizationQueue];
  }
  return (char)synchronizationQueue;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = [(VNDetector *)self configurationOptions];
  v7 = [(id)objc_opt_class() _computeStageDeviceBindingsForConfiguration:v6 error:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = (NSDictionary *)[v7 copy];
    boundComputeStageDevices = self->_boundComputeStageDevices;
    self->_boundComputeStageDevices = v9;

    self->_backingStore = 0;
    id v11 = [v6 objectForKeyedSubscript:@"VNDetectorInitOption_ModelBackingStore"];
    v12 = v11;
    if (v11)
    {
      unint64_t v13 = [v11 unsignedIntegerValue];
      if (v13 < 3) {
        self->_backingStore = v13;
      }
    }
    BOOL v16 = 1;
    if ([(VNDetector *)self needsMetalContext])
    {
      int v14 = [(VNDetector *)self newMetalContextForConfigurationOptions:v6 error:a4];
      metalContext = self->_metalContext;
      self->_metalContext = v14;

      if (!self->_metalContext) {
        BOOL v16 = 0;
      }
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (NSDictionary)configurationOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)needsMetalContext
{
  v2 = [(VNDetector *)self configurationOptions];
  unsigned int v3 = [(id)objc_opt_class() computeStageDevicesForConfigurationOptions:v2 error:0];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"VNComputeStageMain"];
    if (v5) {
      BOOL v6 = +[VNComputeDeviceUtilities isGPUComputeDevice:v5];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)boundComputeDeviceForComputeStage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(VNDetector *)self boundComputeStageDevices];
  id v8 = [v7 objectForKey:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else if (a4)
  {
    id v11 = (void *)[[NSString alloc] initWithFormat:@"%@ was not bound to a compute device", v6];
    *a4 = +[VNError errorForInvalidModelWithLocalizedDescription:v11];
  }

  return v9;
}

- (NSDictionary)boundComputeStageDevices
{
  return self->_boundComputeStageDevices;
}

+ (id)computeStageDevicesForConfigurationOptions:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 supportedComputeStageDevicesForOptions:v6 error:a4];
  uint64_t v17 = v7;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          int v14 = [a1 computeDeviceForComputeStage:v13 configurationOptions:v6 error:a4];
          if (!v14)
          {

            id v15 = 0;
            goto LABEL_12;
          }
          [v8 setObject:v14 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v15 = v8;
LABEL_12:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)_computeStageDeviceBindingsForConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v16 = [a1 computeStagesToBindForConfigurationOptions:v6];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v16];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [a1 computeDeviceForComputeStage:v12 configurationOptions:v6 error:a4];
        if (!v13)
        {

          id v14 = 0;
          goto LABEL_11;
        }
        [v7 setObject:v13 forKey:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = v7;
LABEL_11:

  return v14;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  unsigned int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

void __76__VNDetector_runSuccessReportingBlockSynchronously_detector_qosClass_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = VNExecuteBlock(v2, (uint64_t)&obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  return 1;
}

+ (BOOL)areExistingInitializationOptions:(id)a3 compatibleWithOptions:(id)a4
{
  uint64_t v4 = sub_1A409602C();
  uint64_t v5 = sub_1A409602C();
  swift_getObjCClassMetadata();
  unsigned __int8 v6 = sub_1A3DAC798(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)produceObservationsWithRegionOfInterest:(CGRect)a3 detectorProcessingOptions:(NSDictionary *)a4 completionHandler:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95EF780);
  MEMORY[0x1F4188790](v12 - 8);
  id v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = _Block_copy(a5);
  BOOL v16 = (CGFloat *)swift_allocObject();
  v16[2] = x;
  v16[3] = y;
  v16[4] = width;
  v16[5] = height;
  *((void *)v16 + 6) = a4;
  *((void *)v16 + 7) = v15;
  *((void *)v16 + 8) = self;
  uint64_t v17 = sub_1A409649C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  long long v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E95EF790;
  v18[5] = v16;
  long long v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E95EF7A0;
  v19[5] = v18;
  long long v20 = a4;
  long long v21 = self;
  sub_1A3DAD230((uint64_t)v14, (uint64_t)&unk_1E95EF7B0, (uint64_t)v19);
  swift_release();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_configurationOptions, 0);

  objc_storeStrong((id *)&self->_boundComputeStageDevices, 0);
}

- (void)setSynchronizationQueue:(id)a3
{
}

- (unint64_t)backingStore
{
  return self->_backingStore;
}

- (VNMetalContext)metalContext
{
  return self->_metalContext;
}

- (NSString)description
{
  v15.receiver = self;
  v15.super_class = (Class)VNDetector;
  uint64_t v3 = [(VNDetector *)&v15 description];
  uint64_t v4 = [(VNDetector *)self boundComputeStageDevices];
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __25__VNDetector_description__block_invoke;
    uint64_t v13 = &unk_1E5B1D970;
    id v6 = v5;
    id v14 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:&v10];
    id v7 = [v6 componentsJoinedByString:@", "];
    uint64_t v8 = [v3 stringByAppendingFormat:@" bound to [%@]", v7, v10, v11, v12, v13];

    uint64_t v3 = (void *)v8;
  }

  return (NSString *)v3;
}

void __25__VNDetector_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = (void *)[[NSString alloc] initWithFormat:@"%@ --> %@", v7, v5];
  [*(id *)(a1 + 32) addObject:v6];
}

- (void)recordImageCropQuickLookInfoFromOptionsSafe:(id)a3 toObservation:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_detectorMultiSessionAccessLock);
  [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v7 toObservation:v6];
  os_unfair_lock_unlock(&self->_detectorMultiSessionAccessLock);
}

- (void)recordImageCropQuickLookInfoToOptionsSafe:(id)a3 cacheKey:(id)a4 imageBuffer:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_detectorMultiSessionAccessLock);
  [(VNDetector *)self recordImageCropQuickLookInfoToOptions:v10 cacheKey:v8 imageBuffer:v9];
  os_unfair_lock_unlock(&self->_detectorMultiSessionAccessLock);
}

- (void)recordImageCropQuickLookInfoFromOptions:(id)a3 toObservation:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v8 objectForKey:@"VNDetectorInternalProcessOption_CacheKeys"];
  [v5 setRequestImageBuffersCacheKeys:v6];
  id v7 = [v8 objectForKey:@"VNDetectorInternalProcessOption_ImageBuffers"];
  [v5 setRequestImageBuffers:v7];
}

- (void)recordImageCropQuickLookInfoToOptions:(id)a3 cacheKey:(id)a4 imageBuffer:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
  [v9 addPointer:v7];
  id v10 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  [v10 addPointer:v8];
  [v11 setObject:v9 forKey:@"VNDetectorInternalProcessOption_CacheKeys"];
  [v11 setObject:v10 forKey:@"VNDetectorInternalProcessOption_ImageBuffers"];
}

- (id)computeDeviceOfTypes:(unint64_t)a3 forComputeStage:(id)a4 processingOptions:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(VNDetector *)self computeDeviceForComputeStage:v10 processingOptions:v11 error:a6];
  if (!v12) {
    goto LABEL_6;
  }
  if (+[VNComputeDeviceUtilities computeDevice:v12 isOneTypeOfTypes:a3])
  {
    id v13 = v12;
    goto LABEL_7;
  }
  if (a6)
  {
    +[VNError errorForUnsupportedComputeDevice:v12];
    id v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    id v13 = 0;
  }
LABEL_7:

  return v13;
}

- (id)computeDeviceForComputeStage:(id)a3 processingOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(VNDetector *)self boundComputeStageDevices];
  id v11 = [v10 objectForKeyedSubscript:v8];
  uint64_t v12 = [v9 objectForKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
  id v13 = [v12 objectForKeyedSubscript:v8];
  if (!v13)
  {
    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_9:
    objc_super v15 = [(VNDetector *)self configurationOptions];
    BOOL v16 = (void *)[v15 mutableCopy];

    [v16 addEntriesFromDictionary:v9];
    id v14 = [(id)objc_opt_class() computeDeviceForComputeStage:v8 configurationOptions:v16 error:a5];

    goto LABEL_10;
  }
  if ([v11 isEqual:v13])
  {
LABEL_8:
    id v14 = v11;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  if (a5)
  {
    +[VNError errorForUnsupportedComputeDevice:v13];
    id v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }
LABEL_10:

  return v14;
}

- (id)requiredCancellerInOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNDetectorProcessOption_Canceller" inOptions:v5 error:a4];

  return v6;
}

- (BOOL)getOptionalCanceller:(id *)a3 inOptions:(id)a4 error:(id *)a5
{
  id v7 = a4;
  LOBYTE(a5) = +[VNValidationUtilities getOptionalObject:a3 ofClass:objc_opt_class() forKey:@"VNDetectorProcessOption_Canceller" inOptions:v7 error:a5];

  return (char)a5;
}

- (id)newMetalContextForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v5 error:a4];
  if (v6)
  {
    id v7 = +[VNComputeDeviceUtilities metalDeviceForComputeDevice:v6];
    id v8 = +[VNMetalContext metalContextForDevice:error:]((uint64_t)VNMetalContext, v7, a4);
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)validatedImageBufferFromOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  BOOL v7 = +[VNValidationUtilities getArray:&v13 forKey:@"VNDetectorProcessOption_InputImageBuffers" inOptions:v6 withElementsOfClass:objc_opt_class() requiredMinimumCount:1 allowedMaximumCount:1 error:a4];
  id v8 = v13;
  id v9 = v8;
  if (v7)
  {
    id v10 = [v8 firstObject];
    if ([(VNDetector *)self validateImageBuffer:v10 error:a4]) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  if (a8)
  {
    id v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = NSStringFromSelector(a2);
    objc_super v15 = [v11 stringWithFormat:@"%@ does not implement %@", v13, v14];
    *a8 = +[VNError errorWithCode:3 message:v15];
  }
  return 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  if (a8)
  {
    id v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = NSStringFromSelector(a2);
    objc_super v15 = [v11 stringWithFormat:@"%@ does not implement %@", v13, v14];
    *a8 = +[VNError errorWithCode:3 message:v15];
  }
  return 0;
}

- (BOOL)validateImageBuffer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 width];
  uint64_t v8 = [v6 height];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__VNDetector_validateImageBuffer_error___block_invoke;
  v10[3] = &unk_1E5B20040;
  v10[4] = self;
  LOBYTE(a4) = +[VNValidationUtilities validateNonZeroImageWidth:v7 height:v8 componentNameProvidingBlock:v10 error:a4];

  return (char)a4;
}

uint64_t __40__VNDetector_validateImageBuffer_error___block_invoke()
{
  v0 = objc_opt_class();

  return [v0 detectorName];
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  objc_initWeak(location, self);
  LODWORD(a8) = objc_msgSend((id)objc_opt_class(), "VNClassCode", v19, v18, v17);
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v61[3] = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__16832;
  v59 = __Block_byref_object_dispose__16833;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__16832;
  v53 = __Block_byref_object_dispose__16833;
  id v54 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
  block[3] = &unk_1E5B1D8A8;
  objc_copyWeak(v46, location);
  v44 = &v49;
  int v47 = (int)a8;
  unsigned int v48 = a3;
  v46[1] = *(id *)&x;
  v46[2] = *(id *)&y;
  v46[3] = *(id *)&width;
  v46[4] = *(id *)&height;
  id v20 = v17;
  id v41 = v20;
  id v21 = v18;
  id v42 = v21;
  v45 = v61;
  id v22 = v19;
  id v43 = v22;
  uint64_t v23 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
  v30[3] = &unk_1E5B1D920;
  objc_copyWeak(v37, location);
  unsigned int v38 = a3;
  int v39 = (int)a8;
  v34 = &v49;
  v35 = &v55;
  v37[1] = *(id *)&x;
  v37[2] = *(id *)&y;
  v37[3] = *(id *)&width;
  v37[4] = *(id *)&height;
  v36 = v61;
  id v24 = v20;
  id v31 = v24;
  id v25 = v21;
  id v32 = v25;
  id v26 = v22;
  id v33 = v26;
  v27 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v30);
  v23[2](v23);
  v27[2](v27);
  if (+[VNValidationUtilities validateAsyncStatusResult:v50[5] error:a7])
  {
    id v28 = (id)v56[5];
  }
  else
  {
    id v28 = 0;
  }

  objc_destroyWeak(v37);
  objc_destroyWeak(v46);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v61, 8);
  objc_destroyWeak(location);

  return v28;
}

void __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E5B1D880;
    int v38 = *(_DWORD *)(a1 + 116);
    id v9 = WeakRetained;
    id v31 = v9;
    long long v10 = *(_OWORD *)(a1 + 96);
    long long v36 = *(_OWORD *)(a1 + 80);
    long long v37 = v10;
    id v32 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 64);
    id v33 = v11;
    uint64_t v35 = v12;
    id v34 = *(id *)(a1 + 48);
    id v13 = _Block_copy(aBlock);
    id v29 = 0;
    uint64_t v14 = VNExecuteBlock(v13, (uint64_t)&v29);
    id v15 = v29;
    BOOL v16 = [[VNAsyncStatus alloc] initWithStatus:v14 error:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@",
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      (uint64_t)v9);
    kdebug_trace();
  }
  else
  {
    id v25 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    id v26 = [[VNAsyncStatus alloc] initWithStatus:0 error:v25];
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    id v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
}

void __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, @"processRegionOfInterestBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E5B1D8F8;
    id v10 = v9;
    id v29 = v10;
    int32x2_t v37 = vrev64_s32(*(int32x2_t *)(a1 + 120));
    long long v33 = *(_OWORD *)(a1 + 56);
    long long v35 = *(_OWORD *)(a1 + 88);
    long long v36 = *(_OWORD *)(a1 + 104);
    uint64_t v34 = *(void *)(a1 + 72);
    id v30 = *(id *)(a1 + 32);
    id v31 = *(id *)(a1 + 40);
    id v32 = *(id *)(a1 + 48);
    id v11 = _Block_copy(aBlock);
    id v27 = 0;
    uint64_t v12 = VNExecuteBlock(v11, (uint64_t)&v27);
    id v13 = v27;
    uint64_t v14 = [[VNAsyncStatus alloc] initWithStatus:v12 error:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    VNValidatedLog(1, @"processRegionOfInterestBlock: finish processing; currentDetector: %@",
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      (uint64_t)v10);
    kdebug_trace();
  }
  else
  {
    uint64_t v23 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v24 = [[VNAsyncStatus alloc] initWithStatus:0 error:v23];
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
}

BOOL __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, void *a2)
{
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@",
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(void *)(a1 + 32));
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) completed])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
    aBlock[3] = &unk_1E5B1D8D0;
    id v16 = *(id *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 120);
    long long v10 = *(_OWORD *)(a1 + 88);
    long long v22 = *(_OWORD *)(a1 + 104);
    long long v11 = *(_OWORD *)(a1 + 72);
    long long v21 = v10;
    long long v20 = v11;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    uint64_t v12 = _Block_copy(aBlock);
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), 1uLL);
    [(id)objc_opt_class() runSuccessReportingBlockSynchronously:v12 detector:*(void *)(a1 + 32) qosClass:*(unsigned int *)(a1 + 124) error:a2];
    CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), 1uLL);
    BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
  }
  else if (a2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error];
    BOOL v13 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v13;
}

BOOL __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterest Netto: start processing; currentDetector: %@",
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(void *)(a1 + 32));
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), *(void *)(a1 + 40), *(unsigned int *)(a1 + 116), *(void *)(a1 + 48), a2, *(void *)(a1 + 56), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  VNValidatedLog(1, @"processRegionOfInterest Netto: finish processing; currentDetector: %@",
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    *(void *)(a1 + 32));
  kdebug_trace();
  return *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
}

uint64_t __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 104), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 24, a2, *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (id)processUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  int v20 = [(id)objc_opt_class() VNClassCode];
  unint64_t v21 = [(VNDetector *)self signPostAdditionalParameter];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  unsigned int v48 = __Block_byref_object_copy__16832;
  uint64_t v49 = __Block_byref_object_dispose__16833;
  id v50 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__VNDetector_processUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E5B1D858;
  unsigned int v43 = a3;
  id v22 = v17;
  id v33 = v22;
  uint64_t v34 = self;
  int v44 = v20;
  int32x2_t v37 = &v45;
  unint64_t v38 = v21;
  CGFloat v39 = x;
  CGFloat v40 = y;
  CGFloat v41 = width;
  CGFloat v42 = height;
  id v23 = v18;
  id v35 = v23;
  id v24 = v19;
  id v36 = v24;
  uint64_t v25 = _Block_copy(aBlock);
  id v31 = 0;
  char v26 = VNExecuteBlock(v25, (uint64_t)&v31);
  id v27 = v31;
  id v28 = v27;
  if (v26)
  {
    id v29 = (id)v46[5];
  }
  else
  {
    id v29 = 0;
    if (a7) {
      *a7 = v27;
    }
  }

  _Block_object_dispose(&v45, 8);

  return v29;
}

BOOL __111__VNDetector_processUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v5 = kdebug_trace();
  uint64_t v6 = (void *)MEMORY[0x1A6257080](v5);
  uint64_t v7 = *(unsigned int *)(a1 + 112);
  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  double v10 = *(double *)(a1 + 96);
  double v11 = *(double *)(a1 + 104);
  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v21 = 0;
  uint64_t v14 = objc_msgSend(v12, "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v7, v4, v13, &v21, *(void *)(a1 + 56), v8, v9, v10, v11);
  id v15 = v21;
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  BOOL v19 = v18 != 0;
  if (a2 && !v18) {
    *a2 = v15;
  }

  kdebug_trace();
  return v19;
}

- (BOOL)useGPU
{
  return self->_metalContext != 0;
}

- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  return 0;
}

- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(objc_class *)a3 keyForDetectorWithConfigurationOptions:v6];
  double v8 = objc_opt_class();
  double v9 = [(VNDetector *)self configurationOptions];
  double v10 = [v8 keyForDetectorWithConfigurationOptions:v9];

  if ([v7 isEqual:v10])
  {
    double v11 = [(VNDetector *)self boundComputeStageDevices];
    BOOL v14 = 1;
    if (v11)
    {
      uint64_t v12 = [v6 objectForKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
      if (!v12
        || (char v13 = [(id)objc_opt_class() loadedInstanceWithBoundComputeStageDevices:v11 canBeUsedForRequestedComputeStageDevices:v12], v12, (v13 & 1) == 0))
      {
        BOOL v14 = 0;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  [(id)objc_opt_class() VNClassCode];
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)VNDetector;
  [(VNDetector *)&v3 dealloc];
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

+ (BOOL)loadedInstanceWithBoundComputeStageDevices:(id)a3 canBeUsedForRequestedComputeStageDevices:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v16);
        if (v12)
        {
          BOOL v14 = [v7 objectForKeyedSubscript:v11];
          LOBYTE(a1) = ([v14 isEqual:v12] & 1) != 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                    && ([a1 loadedInstanceWithComputeDevice:v12 boundToComputeStage:v11 canBeUsedForProcessingDeviceBridge:v14] & 1) != 0;

          char v13 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char v13 = 1;
LABEL_16:

  return (v13 | a1) & 1;
}

+ (BOOL)loadedInstanceWithComputeDevice:(id)a3 boundToComputeStage:(id)a4 canBeUsedForProcessingDeviceBridge:(id)a5
{
  id v6 = a5;
  unint64_t v7 = +[VNComputeDeviceUtilities typeOfComputeDevice:a3];
  uint64_t v8 = [v6 computeDevice];
  LOBYTE(v7) = v7 == +[VNComputeDeviceUtilities typeOfComputeDevice:v8];

  return v7;
}

+ (id)supportedImageSizeSetForEspressoModelAtPath:(id)a3 inputImageBlobName:(id)a4 analysisPixelFormatType:(unsigned int)a5 error:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  if (+[VNEspressoHelpers getWidth:&v12 height:&v11 ofBlobNamed:a4 forNetworkModelFileWithPath:a3 error:a6])
  {
    unint64_t v7 = [VNSupportedImageSize alloc];
    uint64_t v8 = [(VNSupportedImageSize *)v7 initWithIdealFormat:v6 width:v12 height:v11 orientation:1 aspectRatioHandling:0 orientationAgnostic:0];
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)detectorKeyComponentForDetectorConfigurationOptionKey:(id)a3 value:(id)a4
{
  id v4 = a4;

  return v4;
}

+ (id)keyForDetectorWithConfigurationOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = [a1 configurationOptionKeysForDetectorKey];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", (objc_msgSend(v15, "count") << 6) + 64);
  uint64_t v6 = NSStringFromClass((Class)a1);
  [v5 appendString:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v15;
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v4 objectForKeyedSubscript:v10];
        uint64_t v12 = [a1 detectorKeyComponentForDetectorConfigurationOptionKey:v10 value:v11];
        [v5 appendFormat:@":%@=%@", v10, v12];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  char v13 = (void *)[v5 copy];

  return v13;
}

+ (id)configurationOptionKeysForDetectorKey
{
  if (+[VNDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNDetector configurationOptionKeysForDetectorKey]::onceToken, &__block_literal_global_16904);
  }
  v2 = (void *)+[VNDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __51__VNDetector_configurationOptionKeysForDetectorKey__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"VNDetectorOption_EspressoPlanPriority";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v0];
  v2 = (void *)+[VNDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v1;
}

+ (id)detectorName
{
  v2 = NSStringFromClass((Class)a1);
  if ([v2 hasPrefix:@"VN"])
  {
    id v3 = [v2 substringFromIndex:2];
    id v4 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v3, "length") + 5);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
    char v7 = 0;
    while (([v6 isAtEnd] & 1) == 0)
    {
      id v14 = 0;
      int v8 = [v6 scanUpToCharactersFromSet:v4 intoString:&v14];
      id v9 = v14;
      if (v8) {
        [v5 appendString:v9];
      }
      id v13 = v9;
      int v10 = [v6 scanCharactersFromSet:v4 intoString:&v13];
      id v11 = v13;

      if (v10)
      {
        if (v7) {
          [v5 appendString:@" "];
        }
        [v5 appendString:v11];
        char v7 = 1;
      }
    }
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

+ (Class)detectorClassForDetectorType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v5 = +[VNDetector _detectorClassForDetectorType:options:detectorCreationOptions:error:]((uint64_t)a1, a3, a4, 0, (uint64_t)a5);

  return (Class)v5;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 0;
}

+ (VNControlledCapacityTasksQueue)detectorInternalProcessingAsyncTasksQueue
{
  id v3 = +[VNDetectorAsyncTasksQueueCache sharedCache];
  id v4 = NSStringFromClass((Class)a1);
  id v5 = [v3 queueWithUniqueAppendix:v4];

  if ([v5 maximumTasksCount] >= 5)
  {
    uint64_t v6 = [(id)objc_opt_class() maximumAllowedTasksInTheQueue];
    if (v6 >= 4) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = v6;
    }
    [v5 setMaximumTasksCount:v7];
  }

  return (VNControlledCapacityTasksQueue *)v5;
}

+ (VNControlledCapacityTasksQueue)detectorCropProcessingAsyncTasksQueue
{
  v2 = +[VNDetectorAsyncTasksQueueCache sharedCache];
  id v3 = [v2 queueWithUniqueAppendix:@"CropProcessing"];

  return (VNControlledCapacityTasksQueue *)v3;
}

+ (VNControlledCapacityTasksQueue)detectorCropCreationAsyncTasksQueue
{
  v2 = +[VNDetectorAsyncTasksQueueCache sharedCache];
  id v3 = [v2 queueWithUniqueAppendix:@"CropCreation"];

  return (VNControlledCapacityTasksQueue *)v3;
}

@end