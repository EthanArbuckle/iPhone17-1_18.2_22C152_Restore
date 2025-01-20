@interface VNANFDMultiDetector
+ (BOOL)producesObservationsForMultipleRequestClasses;
+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3;
+ (Class)anfdMultiDetectorClassToProcessRequest:(id)a3;
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (NSArray)knownAnimalIdentifiers;
+ (NSDictionary)detectedObjectClassToRequestKey;
+ (NSDictionary)detectedObjectRequestKeyToRequestInfo;
+ (NSDictionary)recognizedAnimalObjectClassToAnimalName;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)defaultFilterThresholdsForOptions:(id)a3 error:(id *)a4;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)requestInfoForRequest:(id)a3;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
+ (void)_printDebugInfo:(id)a3 detectedObjectsRaw:(id)a4 faceDetectorBGRAImage:(__CVBuffer *)a5 tempImage:(vImage_Buffer *)a6 session:(id)a7;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)isDetectedObject:(id)a3 ofAGivenObjectSubClass:(id)a4;
- (BOOL)processDetectedObject:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 imageBuffer:(id)a7 qosClass:(unsigned int)a8 session:(id)a9 warningRecorder:(id)a10 detectedObjectResults:(id)a11 error:(id *)a12;
- (VNShotflowDetector)VNShotflowDetector;
- (id)_alignFace:(id)a3 imageBuffer:(id)a4 qosClass:(unsigned int)a5 session:(id)a6 warningRecorder:(id)a7 error:(id *)a8;
- (id)applicableOptionKeyToShotflowKeyMappingsForOptions:(id)a3 error:(id *)a4;
- (id)filterThresholdsForOptions:(id)a3 error:(id *)a4;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)splitDetectedClassResultsIntoSubclasses:(id)a3;
- (void)processRecognizedObjectWithIdentifier:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 objectConfidence:(float)a7 detectedObjectResults:(id)a8;
@end

@implementation VNANFDMultiDetector

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  id v3 = a3;
  v4 = (void *)[(id)objc_opt_class() detectorClassForConfigurationOptions:v3 error:0];
  if (v4)
  {
    v5 = objc_msgSend((id)objc_msgSend(v4, "detectorClass"), "modelName");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (v6)
  {
    v7 = +[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap];
    v8 = (void *)[v7 objectForKeyedSubscript:v6];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else if (a4)
    {
      *a4 = +[VNError errorForUnsupportedRequestSpecifier:v6];
    }
  }
  else
  {
    v9 = 0;
  }

  return (Class)v9;
}

+ (Class)anfdMultiDetectorClassToProcessRequest:(id)a3
{
  id v3 = a3;
  v4 = +[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap];
  id v5 = [v3 specifier];
  v6 = [v4 objectForKeyedSubscript:v5];

  return (Class)v6;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VNANFDMultiDetector;
  if ([(VNEspressoModelFileBasedDetector *)&v25 completeInitializationForSession:v6 error:a4])
  {
    v7 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
    v8 = (void *)[(id)objc_opt_class() detectorClass];
    uint64_t v9 = [v7 network];
    objc_msgSend(v8, "processingDeviceDetectorWithEspressoNetwork:espressoPlan:", v9, v10, objc_msgSend(v7, "plan"));
    v11 = (VNShotflowDetector *)objc_claimAutoreleasedReturnValue();
    mMultiHeadedANFDDetector = self->_mMultiHeadedANFDDetector;
    self->_mMultiHeadedANFDDetector = v11;

    if (self->_mMultiHeadedANFDDetector)
    {
      v13 = objc_opt_class();
      if ([v13 isEqual:objc_opt_class()]) {
        goto LABEL_5;
      }
      v14 = [(VNDetector *)self configurationOptions];
      v15 = +[VNFaceBBoxAligner supportedComputeStageDevicesForOptions:v14 error:a4];
      v16 = (void *)[v14 mutableCopy];
      v26 = @"VNComputeStageMain";
      v17 = objc_msgSend(v15, "objectForKeyedSubscript:");
      v18 = [v17 firstObject];
      v27[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      [v16 setObject:v19 forKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];

      v20 = [v6 detectorOfType:@"VNFaceBoxAlignerType" configuredWithOptions:v16 error:a4];
      faceBBoxAligner = self->_faceBBoxAligner;
      self->_faceBBoxAligner = v20;

      BOOL v22 = self->_faceBBoxAligner == 0;
      if (!v22)
      {
LABEL_5:
        BOOL v23 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Failure to create multi-headed object detector."];
      BOOL v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    BOOL v23 = 0;
    goto LABEL_10;
  }
  BOOL v23 = 0;
LABEL_11:

  return v23;
}

+ (id)requestInfoForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [a1 detectedObjectRequestKeyToRequestInfo];
  id v6 = +[VNANFDMultiDetectorOriginalRequestInfo requestKeyFromRequest:v4];
  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

+ (void)_printDebugInfo:(id)a3 detectedObjectsRaw:(id)a4 faceDetectorBGRAImage:(__CVBuffer *)a5 tempImage:(vImage_Buffer *)a6 session:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v11 = a4;
  id v12 = a7;
  if (+[VNFaceDetector shouldDumpDebugIntermediates])
  {
    v29 = a5;
    uint64_t v36 = 0;
    unint64_t v37 = 0;
    unint64_t v38 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v48 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v33;
      int32x2_t v16 = vdup_n_s32(0x7FC00000u);
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
          std::string::basic_string[abi:ne180100]<0>(__p, "unknown");
          unint64_t v41 = (unint64_t)v16;
          int v45 = 0;
          char v46 = 0;
          int v47 = 0;
          unint64_t v42 = 0;
          uint64_t v43 = 0;
          __int16 v44 = 0;
          [v18 bounds];
          *(float *)&double v19 = v19;
          *(float *)&double v20 = v20;
          *(float *)&double v21 = v21;
          unint64_t v41 = __PAIR64__(LODWORD(v20), LODWORD(v19));
          *(float *)&double v19 = v22;
          unint64_t v42 = __PAIR64__(LODWORD(v19), LODWORD(v21));
          [v18 rotationAngle];
          LODWORD(v43) = v23;
          [v18 yawAngle];
          HIDWORD(v43) = v24;
          [v18 confidence];
          int v47 = v25;
          unint64_t v26 = v37;
          if (v37 >= v38)
          {
            uint64_t v27 = std::vector<vision::mod::DetectedObject>::__push_back_slow_path<vision::mod::DetectedObject const&>(&v36, (uint64_t)__p);
          }
          else
          {
            vision::mod::DetectedObject::DetectedObject(v37, (uint64_t)__p);
            uint64_t v27 = v26 + 80;
          }
          unint64_t v37 = v27;
          if (v40 < 0) {
            operator delete(__p[0]);
          }
          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v48 count:16];
      }
      while (v14);
    }

    long long v28 = *(_OWORD *)&a6->width;
    v31[0] = *(_OWORD *)&a6->data;
    v31[1] = v28;
    +[VNFaceDetector printDebugInfo:v30 facesDataRaw:&v36 faceDetectorBGRAImage:v29 tempImage:v31 session:v12];
    __p[0] = &v36;
    std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
}

+ (id)defaultFilterThresholdsForOptions:(id)a3 error:(id *)a4
{
  id v4 = objc_msgSend((id)objc_msgSend(a1, "detectorClass", a3, a4), "defaultFilterThresholds");

  return v4;
}

+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3
{
  return 1;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  id v3 = objc_msgSend((id)objc_msgSend(a1, "detectorClass", a3), "inputLayerName");

  return v3;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VNANFDMultiDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __60__VNANFDMultiDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)+[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (NSArray)knownAnimalIdentifiers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VNANFDMultiDetector_knownAnimalIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetector knownAnimalIdentifiers]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetector knownAnimalIdentifiers]::onceToken, block);
  }
  v2 = (void *)+[VNANFDMultiDetector knownAnimalIdentifiers]::knownAnimalIdentifiers;

  return (NSArray *)v2;
}

void __45__VNANFDMultiDetector_knownAnimalIdentifiers__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) recognizedAnimalObjectClassToAnimalName];
  v1 = [v4 allValues];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)+[VNANFDMultiDetector knownAnimalIdentifiers]::knownAnimalIdentifiers;
  +[VNANFDMultiDetector knownAnimalIdentifiers]::knownAnimalIdentifiers = v2;
}

+ (NSDictionary)recognizedAnimalObjectClassToAnimalName
{
  if (+[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::onceToken, &__block_literal_global_100);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::recognizedAnimalObjectClassToAnimalName;

  return (NSDictionary *)v2;
}

void __62__VNANFDMultiDetector_recognizedAnimalObjectClassToAnimalName__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7A77F0;
  v2[1] = &unk_1EF7A7808;
  v3[0] = @"Cat";
  v3[1] = @"Dog";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)+[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::recognizedAnimalObjectClassToAnimalName;
  +[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::recognizedAnimalObjectClassToAnimalName = v0;
}

+ (NSDictionary)detectedObjectRequestKeyToRequestInfo
{
  if (+[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::onceToken, &__block_literal_global_98);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;

  return (NSDictionary *)v2;
}

void __60__VNANFDMultiDetector_detectedObjectRequestKeyToRequestInfo__block_invoke()
{
  v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  uint64_t v2 = [(VNMultiDetectorOriginalRequestInfo *)[VNANFDMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNANFDMultiDetectorProcessingOption_HumanFaceDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:0];
  v17[0] = v2;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  objc_super v5 = [(VNMultiDetectorOriginalRequestInfo *)[VNANFDMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNANFDMultiDetectorProcessingOption_HumanHeadDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:1];
  v17[1] = v5;
  id v6 = [NSString alloc];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = (void *)[v6 initWithFormat:@"%@%@%@", v8, @"_", MEMORY[0x1E4F1CC38], v1, v4];
  v16[2] = v9;
  uint64_t v10 = [(VNMultiDetectorOriginalRequestInfo *)[VNANFDMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNANFDMultiDetectorProcessingOption_HumanDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:2];
  v17[2] = v10;
  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  v16[3] = v12;
  id v13 = [(VNMultiDetectorOriginalRequestInfo *)[VNANFDMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNANFDMultiDetectorProcessingOption_AnimalRecognitionOriginatingRequestSpecifier" originalRequestResultsIndex:3];
  v17[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  uint64_t v15 = (void *)+[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
  +[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo = v14;
}

+ (NSDictionary)detectedObjectClassToRequestKey
{
  if (+[VNANFDMultiDetector detectedObjectClassToRequestKey]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetector detectedObjectClassToRequestKey]::onceToken, &__block_literal_global_87);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetector detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;

  return (NSDictionary *)v2;
}

void __54__VNANFDMultiDetector_detectedObjectClassToRequestKey__block_invoke()
{
  v15[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v15[0] = v1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  v15[1] = v3;
  id v4 = [NSString alloc];
  objc_super v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v7 = (void *)[v4 initWithFormat:@"%@%@%@", v6, @"_", MEMORY[0x1E4F1CC38], &unk_1EF7A77A8, &unk_1EF7A77C0, &unk_1EF7A77D8];
  v15[2] = v7;
  v14[3] = &unk_1EF7A77F0;
  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  v15[3] = v9;
  v14[4] = &unk_1EF7A7808;
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  v15[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  id v13 = (void *)+[VNANFDMultiDetector detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
  +[VNANFDMultiDetector detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey = v12;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a1 networkRequiredInputImagePixelFormatForConfigurationOptions:v5];
  objc_msgSend((id)objc_msgSend(a1, "detectorClass"), "inputImageMinDimension");
  v8 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", v6, (unint64_t)v7, (unint64_t)v7, 1, [a1 inputImageAspectRatioHandlingForConfigurationOptions:v5], 0);
  v11[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBBoxAligner, 0);

  objc_storeStrong((id *)&self->_mMultiHeadedANFDDetector, 0);
}

- (VNShotflowDetector)VNShotflowDetector
{
  return self->_mMultiHeadedANFDDetector;
}

- (BOOL)isDetectedObject:(id)a3 ofAGivenObjectSubClass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v7 = [v5 labels];
    v8 = [v7 firstObject];
    uint64_t v9 = [v8 identifier];
    char v10 = [v9 containsString:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)splitDetectedClassResultsIntoSubclasses:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);

  return v4;
}

- (void)processRecognizedObjectWithIdentifier:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 objectConfidence:(float)a7 detectedObjectResults:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  double v20 = [VNClassificationObservation alloc];
  *(float *)&double v21 = a7;
  double v22 = [(VNClassificationObservation *)v20 initWithOriginatingRequestSpecifier:v17 identifier:v16 confidence:v21];
  int v23 = [VNRecognizedObjectObservation alloc];
  v27[0] = v22;
  int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  *(float *)&double v25 = a7;
  unint64_t v26 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v23, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v17, v24, 0, v18, x, y, width, height, v25);

  [v19 addObject:v26];
}

- (BOOL)processDetectedObject:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 imageBuffer:(id)a7 qosClass:(unsigned int)a8 session:(id)a9 warningRecorder:(id)a10 detectedObjectResults:(id)a11 error:(id *)a12
{
  uint64_t v13 = *(void *)&a8;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v65 = a4;
  id v23 = a6;
  id v61 = a7;
  id v62 = a9;
  id v63 = a10;
  id v24 = a11;
  double v25 = objc_opt_class();
  v64 = [v25 recognizedAnimalObjectClassToAnimalName];
  switch([v22 labelKey])
  {
    case 1u:
      v31 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNFaceObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v65, x, y, width, height);
      long long v32 = v31;
      if (v23) {
        -[VNDetectedObjectObservation setGroupId:]((uint64_t)v31, v23);
      }
      -[VNFaceObservation setUnalignedBoundingBox:](v32, "setUnalignedBoundingBox:", x, y, width, height);
      [v22 confidence];
      -[VNObservation setConfidence:](v32, "setConfidence:");
      [v22 rotationAngle];
      double v34 = (float)((float)(v33 * 3.1416) / 180.0);
      if (v34 > 3.14159265) {
        double v34 = v34 + -6.28318531;
      }
      if (v34 <= -3.14159265) {
        double v34 = v34 + 6.28318531;
      }
      *(float *)&double v34 = v34;
      long long v35 = [NSNumber numberWithFloat:v34];
      [(VNFaceObservation *)v32 setRoll:v35];

      uint64_t v36 = NSNumber;
      [v22 yawAngle];
      *(float *)&double v38 = (float)(v37 * 3.1416) / 180.0;
      v39 = [v36 numberWithFloat:v38];
      [(VNFaceObservation *)v32 setYaw:v39];

      char v40 = NSNumber;
      [v22 pitchAngle];
      *(float *)&double v42 = (float)(v41 * 3.1416) / 180.0;
      uint64_t v43 = [v40 numberWithFloat:v42];
      [(VNFaceObservation *)v32 setPitch:v43];

      if (![v25 shouldAlignFacesForRequestWithSpecifier:v65])
      {
        v70 = v32;
        id v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
LABEL_33:
        [v24 addObjectsFromArray:v45];

        goto LABEL_30;
      }
      __int16 v44 = [(VNANFDMultiDetector *)self _alignFace:v32 imageBuffer:v61 qosClass:v13 session:v62 warningRecorder:v63 error:a12];
      if (v44)
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v45 = v44;
        uint64_t v46 = [v45 countByEnumeratingWithState:&v66 objects:v71 count:16];
        if (v46)
        {
          uint64_t v47 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v67 != v47) {
                objc_enumerationMutation(v45);
              }
              uint64_t v49 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              [v49 alignedBoundingBoxAsCGRect];
              if (v49)
              {
                v49[12] = v50;
                v49[13] = v51;
                v49[14] = v52;
                v49[15] = v53;
              }
            }
            uint64_t v46 = [v45 countByEnumeratingWithState:&v66 objects:v71 count:16];
          }
          while (v46);
        }

        goto LABEL_33;
      }

LABEL_35:
      BOOL v59 = 0;
LABEL_31:

      return v59;
    case 2u:
      v54 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNDetectedObjectObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v65, x, y, width, height);
      uint64_t v27 = v54;
      if (v23) {
        -[VNDetectedObjectObservation setGroupId:]((uint64_t)v54, v23);
      }
      [v22 confidence];
      objc_msgSend(v27, "setConfidence:");
      [v24 addObject:v27];
      goto LABEL_29;
    case 3u:
      v55 = [VNHumanObservation alloc];
      [v22 confidence];
      LODWORD(v57) = v56;
      uint64_t v58 = -[VNHumanObservation initWithOriginatingRequestSpecifier:boundingBox:upperBodyOnly:confidence:](v55, "initWithOriginatingRequestSpecifier:boundingBox:upperBodyOnly:confidence:", v65, 1, x, y, width, height, v57);
      uint64_t v27 = (void *)v58;
      if (v23) {
        -[VNDetectedObjectObservation setGroupId:](v58, v23);
      }
      [v24 addObject:v27];
      goto LABEL_29;
    case 4u:
    case 5u:
      unint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v22, "labelKey"));
      uint64_t v27 = [v64 objectForKey:v26];

      [v22 confidence];
      LODWORD(v29) = v28;
      -[VNANFDMultiDetector processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:](self, "processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:", v27, v65, v23, v24, x, y, width, height, v29);
LABEL_29:

LABEL_30:
      BOOL v59 = 1;
      goto LABEL_31;
    default:
      if (a12)
      {
        id v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected label key for detected object: %d", objc_msgSend(v22, "labelKey"));
        *a12 = +[VNError errorForInternalErrorWithLocalizedDescription:v30];
      }
      goto LABEL_35;
  }
}

- (id)_alignFace:(id)a3 imageBuffer:(id)a4 qosClass:(unsigned int)a5 session:(id)a6 warningRecorder:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a5;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v33 = a6;
  id v34 = a7;
  uint64_t v15 = (void *)MEMORY[0x1A6257080]();
  id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v17 = [v13 originatingRequestSpecifier];
  v38[0] = v14;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  id v19 = objc_msgSend(v16, "initWithObjectsAndKeys:", v17, @"VNDetectorOption_OriginatingRequestSpecifier", v18, @"VNDetectorProcessOption_InputImageBuffers", 0);

  [v14 orientation];
  id v36 = 0;
  LOBYTE(v18) = VNSetFaceOrientationInOptionsDictionary(v13, v19, &v36);
  id v20 = v36;
  if (v18)
  {
    id v37 = v13;
    double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    [v19 setObject:v21 forKeyedSubscript:@"VNDetectorProcessOption_InputFaceObservations"];

    [v19 setObject:v33 forKeyedSubscript:@"VNDetectorProcessOption_Session"];
    faceBBoxAligner = self->_faceBBoxAligner;
    double v23 = *MEMORY[0x1E4F1DB20];
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    id v35 = v20;
    uint64_t v27 = -[VNFaceBBoxAligner internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](faceBBoxAligner, "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v10, v19, v34, &v35, 0, v23, v24, v25, v26);
    id v28 = v35;

    if (v27 && [v27 count] == 1 && objc_msgSend(v27, "count") != 1)
    {
      v31 = (void *)[[NSString alloc] initWithFormat:@"Unexpected number of aligned faces: %lu, should be 1", objc_msgSend(v27, "count")];
      id v20 = +[VNError errorForInternalErrorWithLocalizedDescription:v31];
    }
    else
    {
      id v20 = v28;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  if (v27)
  {
    id v29 = v27;
  }
  else if (a8)
  {
    *a8 = v20;
  }

  return v27;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v68 = a7;
  v73 = v15;
  long long v67 = +[VNValidationUtilities requiredSessionInOptions:v15 error:a8];
  if (!v67)
  {
    id v23 = 0;
    goto LABEL_59;
  }
  id v16 = [(VNDetector *)self validatedImageBufferFromOptions:v15 error:a8];
  id v17 = v16;
  id v65 = v16;
  if (v16)
  {
    uint64_t v60 = [v16 width];
    uint64_t v59 = [v17 height];
    id v18 = v15;
    if (self)
    {
      v74 = v18;
      id v19 = [(VNANFDMultiDetector *)self filterThresholdsForOptions:v18 error:a8];
      if (v19)
      {
        id v20 = [(id)objc_opt_class() filterThresholdsArrayForFilterThresholds:v19 error:a8];
        double v21 = v20;
        if (v20) {
          id v22 = v20;
        }
      }
      else
      {
        double v21 = 0;
      }

      id v62 = v21;
      if (v21)
      {
        uint64_t v58 = objc_opt_class();
        id v61 = [v58 detectedObjectRequestKeyToRequestInfo];
        uint64_t v24 = [v61 count];
        long long v66 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        uint64_t v72 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v24];
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        obuint64_t j = v61;
        uint64_t v25 = [obj countByEnumeratingWithState:&v102 objects:v107 count:16];
        if (v25)
        {
          uint64_t v70 = *(void *)v103;
          do
          {
            uint64_t v69 = v25;
            for (uint64_t i = 0; i != v69; ++i)
            {
              if (*(void *)v103 != v70) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = *(void *)(*((void *)&v102 + 1) + 8 * i);
              id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v72 addObject:v28];

              id v29 = [obj objectForKeyedSubscript:v27];
              if (!v29)
              {
                [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"The request info is not found for request class %@", v27 format];
LABEL_51:

                id v23 = 0;
                goto LABEL_54;
              }
              id v30 = +[VNANFDMultiDetectorOriginalRequestInfo requestClassNameFromRequestKey:v27];
              id v101 = 0;
              v31 = [v29 originatingRequestSpecifierKey];
              BOOL v32 = +[VNValidationUtilities getOptionalOriginatingRequestSpecifier:&v101 forKey:v31 inOptions:v74 specifyingRequestClass:NSClassFromString(v30) error:a8];
              id v33 = v101;

              if (!v32)
              {

                goto LABEL_51;
              }
              if (!v33) {
                goto LABEL_26;
              }
              id v34 = (objc_class *)objc_opt_class();
              id v35 = NSStringFromClass(v34);
              BOOL v36 = [(NSString *)v30 isEqualToString:v35];

              if (!v36)
              {
                [v66 setObject:v33 forKey:v27];
LABEL_26:

                continue;
              }
              char v100 = 1;
              if (+[VNValidationUtilities getBOOLValue:&v100 forKey:@"VNANFDMultiDetectorProcessingOption_HumanDetectorUpperBody" inOptions:v74 withDefaultValue:0 error:a8])
              {
                if (v100)
                {
                  id v37 = [NSString alloc];
                  double v38 = [NSNumber numberWithBool:1];
                  v39 = (void *)[v37 initWithFormat:@"%@", v38];

                  char v40 = +[VNANFDMultiDetectorOriginalRequestInfo requestPropertiesFromRequestKey:v27];
                  float v41 = [v40 objectAtIndexedSubscript:0];
                  int v42 = [v41 isEqualToString:v39];

                  if (v42) {
                    goto LABEL_31;
                  }
                }
                char v99 = 1;
                if (+[VNValidationUtilities getBOOLValue:&v99 forKey:@"VNANFDMultiDetectorProcessingOption_HumanDetectorFullBody" inOptions:v74 withDefaultValue:0 error:a8])
                {
                  if (!v99) {
                    goto LABEL_26;
                  }
                  id v43 = [NSString alloc];
                  __int16 v44 = [NSNumber numberWithBool:0];
                  v39 = (void *)[v43 initWithFormat:@"%@", v44];

                  char v40 = +[VNANFDMultiDetectorOriginalRequestInfo requestPropertiesFromRequestKey:v27];
                  id v45 = [v40 objectAtIndexedSubscript:0];
                  int v46 = [v45 isEqualToString:v39];

                  if (!v46)
                  {

                    goto LABEL_26;
                  }
LABEL_31:
                  [v66 setObject:v33 forKey:v27];

                  int v47 = 3;
                  goto LABEL_33;
                }
              }
              int v47 = 1;
LABEL_33:

              if (v47 != 3) {
                goto LABEL_51;
              }
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v102 objects:v107 count:16];
          }
          while (v25);
        }

        uint64_t v48 = [v58 detectorClass];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __121__VNANFDMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
        aBlock[3] = &unk_1E5B1F4B8;
        v89 = a4;
        aBlock[4] = self;
        id v81 = v62;
        v90 = v58;
        id v82 = v65;
        id v83 = v67;
        id v84 = v66;
        double v91 = x;
        double v92 = y;
        double v93 = width;
        double v94 = height;
        uint64_t v95 = v60;
        uint64_t v96 = v59;
        uint64_t v97 = v48;
        id v85 = obj;
        id v49 = v72;
        id v86 = v49;
        unsigned int v98 = a6;
        id v87 = v68;
        id v88 = v74;
        uint64_t v50 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
        if (v50[2](v50, a8, x, y, width, height))
        {
          if (+[VisionCoreRuntimeUtilities linkTimeOrRunTimeBeforeVersion:393216])
          {
            id v51 = &__block_literal_global_125;
            long long v76 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            id v52 = v49;
            uint64_t v53 = [v52 countByEnumeratingWithState:&v76 objects:v106 count:16];
            if (v53)
            {
              uint64_t v54 = *(void *)v77;
              do
              {
                for (uint64_t j = 0; j != v53; ++j)
                {
                  if (*(void *)v77 != v54) {
                    objc_enumerationMutation(v52);
                  }
                  [*(id *)(*((void *)&v76 + 1) + 8 * j) sortWithOptions:16 usingComparator:&__block_literal_global_125];
                }
                uint64_t v53 = [v52 countByEnumeratingWithState:&v76 objects:v106 count:16];
              }
              while (v53);
            }
          }
          id v23 = v49;
        }
        else
        {
          id v23 = 0;
        }

LABEL_54:
        int v56 = v62;
        goto LABEL_57;
      }
    }
    else
    {
    }
    int v56 = 0;
    id v23 = 0;
LABEL_57:

    goto LABEL_58;
  }
  id v23 = 0;
LABEL_58:

LABEL_59:

  return v23;
}

uint64_t __121__VNANFDMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 104));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 104));
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 104));
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 104));
  uint64_t v82 = 0;
  id v83 = &v82;
  uint64_t v84 = 0x3032000000;
  id v85 = __Block_byref_object_copy__31152;
  id v86 = __Block_byref_object_dispose__31153;
  id v87 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__VNANFDMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
  aBlock[3] = &unk_1E5B1F490;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  long long v77 = &v82;
  long long v78 = BaseAddress;
  aBlock[4] = v8;
  size_t v79 = Height;
  size_t v80 = Width;
  size_t v81 = BytesPerRow;
  id v76 = v9;
  uint64_t v58 = _Block_copy(aBlock);
  char v10 = VNExecuteBlock(v58, (uint64_t)a2);
  uint64_t v11 = v83[5];
  uint64_t v13 = *(void *)(a1 + 104);
  uint64_t v12 = *(void **)(a1 + 112);
  v74[0] = BaseAddress;
  v74[1] = Height;
  v74[2] = Width;
  v74[3] = BytesPerRow;
  [v12 _printDebugInfo:*(void *)(a1 + 48) detectedObjectsRaw:v11 faceDetectorBGRAImage:v13 tempImage:v74 session:*(void *)(a1 + 56)];
  if (v10)
  {
    if ([(id)v83[5] count])
    {
      id v62 = [*(id *)(a1 + 112) detectedObjectClassToRequestKey];
      id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      obuint64_t j = (id)v83[5];
      uint64_t v14 = [obj countByEnumeratingWithState:&v70 objects:v89 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v71;
        double v16 = (double)Height;
        double v17 = (float)Width;
        double v18 = (float)Height;
        unint64_t v19 = 0x1E4F28000uLL;
LABEL_5:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v71 != v15) {
            objc_enumerationMutation(obj);
          }
          double v21 = *(void **)(*((void *)&v70 + 1) + 8 * v20);
          id v22 = objc_msgSend(*(id *)(v19 + 3792), "numberWithInt:", objc_msgSend(v21, "labelKey"));
          id v65 = [v62 objectForKey:v22];

          id v63 = [*(id *)(a1 + 64) objectForKey:v65];
          if (v63)
          {
            if ([v21 groupId])
            {
              id v23 = objc_msgSend(*(id *)(v19 + 3792), "numberWithInt:", objc_msgSend(v21, "groupId"));
              v64 = [v61 objectForKey:v23];

              if (!v64)
              {
                id v24 = objc_alloc_init(MEMORY[0x1E4F29128]);
                uint64_t v25 = objc_msgSend(*(id *)(v19 + 3792), "numberWithInt:", objc_msgSend(v21, "groupId"));
                v64 = v24;
                [v61 setObject:v24 forKey:v25];
              }
            }
            else
            {
              v64 = 0;
            }
            [v21 bounds];
            unint64_t v30 = *(void *)(a1 + 152);
            double v31 = 0.0;
            double v32 = 0.0;
            double v33 = 0.0;
            if (v30)
            {
              float v34 = *(double *)(a1 + 136) / v17;
              double v35 = v34;
              double v32 = (*(double *)(a1 + 120) + v26 * v35) / (double)v30;
              double v33 = v28 * v35 / (double)v30;
            }
            unint64_t v36 = *(void *)(a1 + 160);
            double v37 = 0.0;
            if (v36)
            {
              double v38 = v16 - (v27 + v29);
              float v39 = *(double *)(a1 + 144) / v18;
              double v40 = v39;
              double v31 = (*(double *)(a1 + 128) + v38 * v40) / (double)v36;
              double v37 = v29 * v40 / (double)v36;
            }
            v92.origin.double x = 0.0;
            v92.origin.double y = 0.0;
            v92.size.double width = 1.0;
            v92.size.double height = 1.0;
            v91.origin.double x = v32;
            v91.origin.double y = v31;
            v91.size.double width = v33;
            v91.size.double height = v37;
            if (CGRectIntersectsRect(v91, v92))
            {
              float v41 = [*(id *)(a1 + 168) supportedLabelKeys];
              int v42 = objc_msgSend(*(id *)(v19 + 3792), "numberWithInt:", objc_msgSend(v21, "labelKey"));
              char v43 = [v41 containsObject:v42];

              if ((v43 & 1) == 0)
              {
                if (a2)
                {
                  v55 = objc_msgSend([NSString alloc], "initWithFormat:", @"Not supported object type: %d", objc_msgSend(v21, "labelKey"));
                  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:");
                  *a2 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_41;
                }
                goto LABEL_42;
              }
              __int16 v44 = [*(id *)(a1 + 72) objectForKeyedSubscript:v65];
              if (!v44)
              {
                if (a2)
                {
                  int v56 = (void *)[[NSString alloc] initWithFormat:@"The request info is not found for request class %@", v65];
                  *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:v56];
                }
                v55 = 0;
LABEL_41:

LABEL_42:
                uint64_t v54 = 0;
                goto LABEL_43;
              }
              uint64_t v59 = v44;
              id v45 = objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:", objc_msgSend(v44, "originalRequestResultsIndex"));
              char v46 = objc_msgSend(*(id *)(a1 + 32), "processDetectedObject:originatingRequestSpecifier:objectBoundingBox:objectGroupId:imageBuffer:qosClass:session:warningRecorder:detectedObjectResults:error:", v21, v63, v64, *(void *)(a1 + 48), *(unsigned int *)(a1 + 176), *(void *)(a1 + 56), v32, v31, v33, v37, *(void *)(a1 + 88), v45, a2);
              uint64_t v47 = v14;
              uint64_t v48 = v15;
              id v49 = a2;
              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v50 = v45;
              uint64_t v51 = [v50 countByEnumeratingWithState:&v66 objects:v88 count:16];
              if (v51)
              {
                uint64_t v52 = *(void *)v67;
                do
                {
                  for (uint64_t i = 0; i != v51; ++i)
                  {
                    if (*(void *)v67 != v52) {
                      objc_enumerationMutation(v50);
                    }
                    [*(id *)(a1 + 32) recordImageCropQuickLookInfoFromOptions:*(void *)(a1 + 96) toObservation:*(void *)(*((void *)&v66 + 1) + 8 * i)];
                  }
                  uint64_t v51 = [v50 countByEnumeratingWithState:&v66 objects:v88 count:16];
                }
                while (v51);
              }

              unint64_t v19 = 0x1E4F28000;
              a2 = v49;
              uint64_t v15 = v48;
              uint64_t v14 = v47;

              if ((v46 & 1) == 0)
              {
                v55 = v59;
                goto LABEL_41;
              }
            }
          }

          if (++v20 == v14)
          {
            uint64_t v14 = [obj countByEnumeratingWithState:&v70 objects:v89 count:16];
            if (v14) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
      uint64_t v54 = 1;
LABEL_43:
    }
    else
    {
      uint64_t v54 = 1;
    }
  }
  else
  {
    uint64_t v54 = 0;
  }

  _Block_object_dispose(&v82, 8);
  return v54;
}

uint64_t __121__VNANFDMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) detectAndProcessObjects:a1 + 7 filterThresholds:a1[5] inputIsBGR:1];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  unint64_t v19 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  uint64_t v20 = v19;
  if (v19)
  {
    unint64_t v21 = [v19 width];
    unint64_t v22 = [v20 height];
    if (v21 >= v22) {
      unint64_t v21 = v22;
    }
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "detectorClass"), "inputImageMinDimension");
    if (v21 < (unint64_t)v23) {
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)v23);
    }
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    CGRect v40 = CGRectIntegral(v39);
    double v24 = v40.origin.x;
    double v25 = v40.origin.y;
    double v26 = v40.size.width;
    double v27 = v40.size.height;
    objc_msgSend((id)objc_opt_class(), "getSuggestedImageSize:", (double)(unint64_t)v40.size.width, (double)(unint64_t)v40.size.height);
    BOOL v30 = v28 < (double)(unint64_t)v26;
    BOOL v31 = v29 < (double)(unint64_t)v27;
    if (v30 && v31) {
      unint64_t v32 = (unint64_t)v28;
    }
    else {
      unint64_t v32 = (unint64_t)v26;
    }
    if (v30 && v31) {
      unint64_t v33 = (unint64_t)v29;
    }
    else {
      unint64_t v33 = (unint64_t)v27;
    }
    id v38 = 0;
    float v34 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v32, v33, 1111970369, v17, a8, &v38, v24, v25, v26, v27);
    id v35 = v38;
    *a7 = v34;
    BOOL v36 = v34 != 0;
    if (v34) {
      [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v17 cacheKey:v35 imageBuffer:v20];
    }
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v16 = a4;
  id v148 = a6;
  id v146 = a8;
  v147 = v16;
  val = self;
  id v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a7];
  if (!v17)
  {
    id v125 = 0;
    goto LABEL_62;
  }
  uint64_t v217 = 0;
  unint64_t v218 = 0;
  v214 = 0;
  v215 = 0;
  uint64_t v216 = 0;
  id v133 = v17;
  uint64_t v18 = [v17 width];
  uint64_t v19 = [v133 height];
  LODWORD(v20) = 1050253722;
  LODWORD(v21) = 2.0;
  if (+[VNFaceDetector calculateTilesForRegionOfInterest:imageWidth:imageHeight:tileSizeInPixels:overlapFraction:aspectRatioThreshold:columns:rows:tiles:error:](VNFaceDetector, "calculateTilesForRegionOfInterest:imageWidth:imageHeight:tileSizeInPixels:overlapFraction:aspectRatioThreshold:columns:rows:tiles:error:", v18, v19, 3145728, &v218, &v217, &v214, x, y, width, height, v20, v21, a7))
  {
    VNRecordImageTilingWarning(v148, v218, v217);
    float v23 = v214;
    unint64_t v22 = v215;
    unint64_t v140 = v215 - v214;
    unint64_t v152 = (v215 - v214) >> 5;
    v143 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:");
    v132 = [(id)objc_opt_class() detectedObjectRequestKeyToRequestInfo];
    uint64_t v24 = [v132 count];
    uint64_t v208 = 0;
    v209 = &v208;
    uint64_t v210 = 0x3032000000;
    v211 = __Block_byref_object_copy__31152;
    v212 = __Block_byref_object_dispose__31153;
    for (id i = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v24]; v24; --v24)
    {
      double v25 = (void *)v209[5];
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v25 addObject:v26];
    }
    v206[0] = 0;
    v206[1] = v206;
    v206[2] = 0x3812000000;
    v206[3] = __Block_byref_object_copy__115;
    v206[4] = __Block_byref_object_dispose__116;
    v206[5] = "";
    int v207 = 0;
    objc_initWeak(&location, val);
    double v27 = objc_opt_class();
    int v137 = [v27 VNClassCode];
    v142 = [v27 detectorCropCreationAsyncTasksQueue];
    dispatch_group_t v145 = dispatch_group_create();
    v139 = [v27 detectorCropProcessingAsyncTasksQueue];
    v131 = a7;
    dispatch_group_t v144 = dispatch_group_create();
    kdebug_trace();
    VNValidatedLog(1, @"Start processing tilesProcessingGroup. currentDetector: %@", v28, v29, v30, v31, v32, v33, (uint64_t)val);
    if (v22 != v23)
    {
      uint64_t v40 = 0;
      float v41 = 0;
      uint64_t v42 = v152;
      if (v152 <= 1) {
        uint64_t v42 = 1;
      }
      uint64_t v134 = v42;
      do
      {
        uint64_t v160 = v40;
        long long v43 = *(_OWORD *)&v214[v40 + 16];
        long long v203 = *(_OWORD *)&v214[v40];
        long long v204 = v43;
        v201[0] = 0;
        v201[1] = v201;
        v201[2] = 0x3032000000;
        v201[3] = __Block_byref_object_copy__31152;
        v201[4] = __Block_byref_object_dispose__31153;
        id v202 = 0;
        v199[0] = 0;
        v199[1] = v199;
        v199[2] = 0x3032000000;
        v199[3] = __Block_byref_object_copy__31152;
        v199[4] = __Block_byref_object_dispose__31153;
        id v200 = 0;
        v198[0] = 0;
        v198[1] = v198;
        v198[2] = 0x2020000000;
        v198[3] = 0;
        __int16 v44 = (void *)[v147 mutableCopy];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
        block[3] = &unk_1E5B1FE38;
        objc_copyWeak(v192, &location);
        int v196 = v137;
        v190 = v201;
        v192[1] = v41;
        v156 = v145;
        v185 = v156;
        unsigned int v197 = a3;
        long long v193 = v203;
        long long v194 = v204;
        id v45 = v44;
        id v186 = v45;
        id v46 = v148;
        id v187 = v46;
        v191 = v198;
        id v47 = v146;
        id v189 = v47;
        unint64_t v195 = v152;
        id v154 = v142;
        id v188 = v154;
        dispatch_block_t v48 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
        v165[0] = MEMORY[0x1E4F143A8];
        v165[1] = 3221225472;
        v165[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
        v165[3] = &unk_1E5B1F3C8;
        objc_copyWeak(v178, &location);
        v173 = v201;
        unsigned int v182 = a3;
        id v49 = v48;
        int v183 = v137;
        id v171 = v49;
        v158 = v41;
        v178[1] = v41;
        id v50 = v144;
        v166 = v50;
        v174 = v199;
        v175 = v198;
        long long v179 = v203;
        long long v180 = v204;
        id v51 = v45;
        id v167 = v51;
        id v168 = v46;
        id v172 = v47;
        v176 = v206;
        v177 = &v208;
        id v169 = v143;
        unint64_t v181 = v152;
        id v52 = v139;
        id v170 = v52;
        uint64_t v59 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v165);
        if (v140 < 0x21)
        {
          VNValidatedLog(1, @"Performing createRegionOfInterestCropForProcessingBlock. currentDetector: %@", v53, v54, v55, v56, v57, v58, (uint64_t)val);
          v49[2](v49);
          VNValidatedLog(1, @"Performing processRegionOfInterestBlock. currentDetector: %@", v66, v67, v68, v69, v70, v71, (uint64_t)val);
          v59[2](v59);
          VNValidatedLog(1, @"Finish processing createRegionOfInterestCropForProcessingBlock and processRegionOfInterestBlock. currentDetector: %@", v72, v73, v74, v75, v76, v77, (uint64_t)val);
        }
        else
        {
          VNValidatedLog(1, @"Scheduling createRegionOfInterestCropForProcessingBlock. currentDetector: %@", v53, v54, v55, v56, v57, v58, (uint64_t)val);
          [v154 dispatchGroupAsyncByPreservingQueueCapacity:v156 block:v49];
          VNValidatedLog(1, @"Scheduling processRegionOfInterestBlock. currentDetector: %@", v60, v61, v62, v63, v64, v65, (uint64_t)val);
          [v52 dispatchGroupAsyncByPreservingQueueCapacity:v50 block:v59];
        }

        objc_destroyWeak(v178);
        objc_destroyWeak(v192);

        _Block_object_dispose(v198, 8);
        _Block_object_dispose(v199, 8);

        _Block_object_dispose(v201, 8);
        float v41 = v158 + 1;
        uint64_t v40 = v160 + 32;
      }
      while ((char *)v134 != v158 + 1);
    }
    if (v140 > 0x20)
    {
      VNValidatedLog(1, @"Waiting for tilesCropCreationGroup. currentDetector: %@; group: %@",
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        (uint64_t)val);
      if ([v142 dispatchGroupWait:v145 error:v131])
      {
        VNValidatedLog(1, @"Waiting for tilesCropProcessingGroup. currentDetector: %@ group: %@", v78, v79, v80, v81, v82, v83, (uint64_t)val);
        if ([v139 dispatchGroupWait:v144 error:v131])
        {
          VNValidatedLog(1, @"Finish processing tilesCropCreationGroup and tilesCropProcessingGroup. currentDetector: %@; cropCreationGroup: %@; cropProcessingGroup: %@",
            v78,
            v79,
            v80,
            v81,
            v82,
            v83,
            (uint64_t)val);
          goto LABEL_17;
        }
        v126 = @"Timed out waiting for tilesCropProcessingGroup when processing %lu anod tiles. currentDetector: %@ group: %@";
      }
      else
      {
        v126 = @"Timed out waiting for tilesCropCreationGroup when processing %lu anod tiles. currentDetector: %@; group: %@";
      }
      VNValidatedLog(4, (uint64_t)v126, v78, v79, v80, v81, v82, v83, v152);
      goto LABEL_55;
    }
LABEL_17:
    kdebug_trace();
    if (+[VNValidationUtilities validateAsyncStatusResults:v143 error:v131])
    {
      if (v140 >= 0x21)
      {
        id v136 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v135 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        for (unint64_t j = 0; j < [(id)v209[5] count]; ++j)
        {
          v138 = objc_msgSend((id)v209[5], "objectAtIndexedSubscript:");
          uint64_t v84 = [(VNANFDMultiDetector *)val splitDetectedClassResultsIntoSubclasses:v138];
          id v155 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v153 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          unint64_t v85 = 0;
          v151 = v84;
          while (v85 < [v84 count])
          {
            unint64_t v157 = v85;
            id v86 = [v84 objectAtIndexedSubscript:v85];
            id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v88 = v86;
            id v159 = v87;
            id v161 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            unint64_t v89 = [v88 count];
            if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved))
            {
              _ZZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved = [MEMORY[0x1E4F1CA98] null];
              __cxa_guard_release(&_ZGVZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved);
            }
            if (v89)
            {
              uint64_t v90 = 0;
              do
              {
                CGRect v91 = [v88 objectAtIndexedSubscript:v90];
                if ([v91 isEqual:_ZZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved])
                {
                  uint64_t v92 = v90 + 1;
                }
                else
                {
                  double v93 = (id *)objc_alloc_init(MEMORY[0x1E4F28E60]);
                  [v91 boundingBox];
                  CGFloat v95 = v94;
                  CGFloat v97 = v96;
                  double v99 = v98;
                  double v101 = v100;
                  to = v93;
                  id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  uint64_t v92 = v90 + 1;
                  if (v90 + 1 < v89)
                  {
                    uint64_t v103 = v90 + 1;
                    do
                    {
                      long long v104 = [v88 objectAtIndexedSubscript:v103];
                      if (([v104 isEqual:_ZZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved] & 1) == 0)
                      {
                        [v104 boundingBox];
                        v222.origin.double x = v105;
                        v222.origin.double y = v106;
                        double v108 = v107;
                        double v110 = v109;
                        v220.origin.double x = v95;
                        v220.origin.double y = v97;
                        v220.size.double width = v99;
                        v220.size.double height = v101;
                        v222.size.double width = v108;
                        v222.size.double height = v110;
                        CGRect v221 = CGRectIntersection(v220, v222);
                        *(float *)&v221.size.double width = v221.size.width
                                                   * v221.size.height
                                                   / (v99 * v101 + v108 * v110 - v221.size.width * v221.size.height);
                        if (*(float *)&v221.size.width >= 0.5)
                        {
                          float v111 = v99 * v101;
                          float v112 = v108 * v110;
                          if (v111 > v112) {
                            int v113 = v103;
                          }
                          else {
                            int v113 = v90;
                          }
                          uint64_t v114 = v113;
                          v115 = [v88 objectAtIndexedSubscript:v113];
                          [v102 addObject:v115];

                          if (v114 == v90)
                          {
                            v116 = [v88 objectAtIndexedSubscript:v103];
                            [v88 setObject:v116 atIndexedSubscript:v90];

                            v117 = [v88 objectAtIndexedSubscript:v90];

                            [v117 boundingBox];
                            CGFloat v95 = v118;
                            CGFloat v97 = v119;
                            double v99 = v120;
                            double v101 = v121;
                            CGRect v91 = v117;
                          }
                          [to addIndex:v103];
                          [v88 setObject:_ZZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved atIndexedSubscript:v103];
                        }
                      }

                      ++v103;
                    }
                    while (v89 != v103);
                  }
                  [v159 setObject:v102 forKey:v91];
                  [v161 addIndexes:to];
                }
                uint64_t v90 = v92;
              }
              while (v92 != v89);
            }
            v122 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v88, "count") - objc_msgSend(v161, "count"));
            if (v89)
            {
              for (uint64_t k = 0; k != v89; ++k)
              {
                if (([v161 containsIndex:k] & 1) == 0)
                {
                  v124 = [v88 objectAtIndexedSubscript:k];
                  [v122 addObject:v124];
                }
              }
            }
            [v88 setArray:v122];

            [v155 addObjectsFromArray:v88];
            [v153 addEntriesFromDictionary:v159];

            unint64_t v85 = v157 + 1;
            uint64_t v84 = v151;
          }
          [v155 sortUsingComparator:&__block_literal_global_31175];
          [v136 addObject:v155];
          [v135 addObject:v153];
        }
        v163[0] = MEMORY[0x1E4F143A8];
        v163[1] = 3221225472;
        v163[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_7;
        v163[3] = &unk_1E5B1F468;
        id v127 = v135;
        id v164 = v127;
        [v136 enumerateObjectsUsingBlock:v163];
        v128 = (void *)v209[5];
        v209[5] = (uint64_t)v136;
        id v129 = v136;
      }
      id v125 = (id)v209[5];
      goto LABEL_58;
    }
LABEL_55:
    id v125 = 0;
LABEL_58:

    objc_destroyWeak(&location);
    _Block_object_dispose(v206, 8);
    _Block_object_dispose(&v208, 8);

    goto LABEL_59;
  }
  id v125 = 0;
LABEL_59:
  if (v214)
  {
    v215 = v214;
    operator delete(v214);
  }
  id v17 = v133;
LABEL_62:

  return v125;
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
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
    aBlock[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E5B1FE10;
    int v41 = *(_DWORD *)(a1 + 148);
    id v9 = WeakRetained;
    id v34 = v9;
    long long v39 = *(_OWORD *)(a1 + 104);
    long long v40 = *(_OWORD *)(a1 + 120);
    id v35 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 80);
    id v36 = v10;
    uint64_t v38 = v11;
    id v37 = *(id *)(a1 + 64);
    uint64_t v12 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    double v13 = *(double *)(a1 + 104);
    double v14 = *(double *)(a1 + 112);
    double v15 = *(double *)(a1 + 120);
    double v16 = *(double *)(a1 + 128);
    id v32 = 0;
    uint64_t v17 = v12[2](v12, &v32, v13, v14, v15, v16);
    id v18 = v32;
    uint64_t v19 = [[VNAsyncStatus alloc] initWithStatus:v17 error:v18];
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    double v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@",
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v9);
    kdebug_trace();
    if (*(void *)(a1 + 136) >= 2uLL) {
      [*(id *)(a1 + 56) dispatchReportBlockCompletion];
    }
  }
  else
  {
    uint64_t v28 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v29 = [[VNAsyncStatus alloc] initWithStatus:0 error:v28];
    uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;
  }
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
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
    aBlock[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E5B1F3A0;
    id v39 = *(id *)(a1 + 72);
    id v10 = v9;
    int v46 = *(_DWORD *)(a1 + 188);
    uint64_t v11 = *(void *)(a1 + 136);
    id v35 = v10;
    uint64_t v43 = v11;
    id v36 = *(id *)(a1 + 32);
    int v47 = *(_DWORD *)(a1 + 184);
    long long v41 = *(_OWORD *)(a1 + 88);
    long long v12 = *(_OWORD *)(a1 + 160);
    long long v44 = *(_OWORD *)(a1 + 144);
    long long v45 = v12;
    uint64_t v42 = *(void *)(a1 + 104);
    id v37 = *(id *)(a1 + 40);
    id v38 = *(id *)(a1 + 48);
    id v40 = *(id *)(a1 + 80);
    double v13 = _Block_copy(aBlock);
    id v33 = 0;
    uint64_t v14 = VNExecuteBlock(v13, (uint64_t)&v33);
    id v15 = v33;
    double v16 = [[VNAsyncStatus alloc] initWithStatus:v14 error:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 48));
    uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count];
    if (v19)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        double v21 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) objectAtIndex:i];
        uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) objectAtIndex:i];
        [v22 addObjectsFromArray:v21];
      }
    }
    [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 48));
    VNValidatedLog(1, @"processRegionOfInterestBlock: finish processing; currentDetector: %@",
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      (uint64_t)v10);
    kdebug_trace();
    if (*(void *)(a1 + 176) >= 2uLL) {
      [*(id *)(a1 + 64) dispatchReportBlockCompletion];
    }
  }
  else
  {
    uint64_t v29 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v30 = [[VNAsyncStatus alloc] initWithStatus:0 error:v29];
    uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
    id v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 104) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_8;
  v5[3] = &unk_1E5B1F440;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a3;
  [a2 enumerateObjectsUsingBlock:v5];
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_9;
  v7[3] = &unk_1E5B1F418;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 40) != a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_10;
    v6[3] = &unk_1E5B1F3F0;
    id v7 = *(id *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "groupId", (void)v15);
        long long v12 = [*(id *)(a1 + 32) groupId];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {
          uint64_t v14 = [v10 groupId];
          -[VNDetectedObjectObservation setGroupId:]((uint64_t)v5, v14);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

BOOL __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, void *a2)
{
  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      uint64_t v4 = +[VNError errorForExecutionTimeoutWithLocalizedDescription:@"Timed out waiting for dependent task execution"];
LABEL_8:
      BOOL v15 = 0;
      *a2 = v4;
      return v15;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@",
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(void *)(a1 + 32));
  if (([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) completed] & 1) == 0)
  {
    if (a2)
    {
      uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) error];
      goto LABEL_8;
    }
    return 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
  aBlock[3] = &unk_1E5B1F378;
  id v11 = *(id *)(a1 + 32);
  int v27 = *(_DWORD *)(a1 + 144);
  uint64_t v12 = *(void *)(a1 + 104);
  id v18 = v11;
  uint64_t v24 = v12;
  id v19 = *(id *)(a1 + 40);
  int v28 = *(_DWORD *)(a1 + 148);
  long long v13 = *(_OWORD *)(a1 + 128);
  long long v25 = *(_OWORD *)(a1 + 112);
  long long v26 = v13;
  long long v23 = *(_OWORD *)(a1 + 88);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 72);
  uint64_t v14 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1uLL);
  [(id)objc_opt_class() runSuccessReportingBlockSynchronously:v14 detector:*(void *)(a1 + 32) qosClass:*(unsigned int *)(a1 + 148) error:a2];
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1uLL);
  BOOL v15 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) != 0;

  return v15;
}

BOOL __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, uint64_t a2)
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
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(void *)(a1 + 48), *(unsigned int *)(a1 + 132), *(void *)(a1 + 56), a2, *(void *)(a1 + 64), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
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
  return *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
}

uint64_t __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 104), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 24, a2, *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (id)applicableOptionKeyToShotflowKeyMappingsForOptions:(id)a3 error:(id *)a4
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"VNANFDMultiDetectorProcessingOption_HumanFacePrecisionRecallThresholdOverride";
  v6[1] = @"VNANFDMultiDetectorProcessingOption_HumanHeadPrecisionRecallThresholdOverride";
  v7[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v7[1] = @"VNShotflowDetectorFilterThresholdKey_HumanHead";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)filterThresholdsForOptions:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v6 = [(id)objc_opt_class() defaultFilterThresholdsForOptions:v26 error:a4];
  if (v6)
  {
    uint64_t v7 = [(VNANFDMultiDetector *)self applicableOptionKeyToShotflowKeyMappingsForOptions:v26 error:a4];
    long long v25 = v7;
    if (v7)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v8 = [v7 allKeys];
      obunint64_t j = v8;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v9)
      {
        uint64_t v24 = *(void *)v28;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v28 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
            uint64_t v12 = [v25 objectForKeyedSubscript:v11];
            id v13 = v6;
            id v14 = v12;
            id v15 = v11;
            id v16 = v26;
            if (self)
            {
              id v31 = 0;
              BOOL v17 = +[VNValidationUtilities getOptionalObject:&v31 ofClass:objc_opt_class() forKey:v15 inOptions:v16 error:a4];
              id v18 = v31;
              id v19 = v18;
              if (v17)
              {
                if (v18)
                {
                  id v6 = (id)[v13 mutableCopy];
                  [v6 setObject:v19 forKeyedSubscript:v14];
                }
                else
                {
                  id v6 = v13;
                }
              }
              else
              {
                id v6 = 0;
              }
            }
            else
            {
              id v6 = 0;
            }

            if (!v6)
            {

              id v6 = 0;
              goto LABEL_23;
            }
            ++v10;
          }
          while (v9 != v10);
          uint64_t v8 = obj;
          uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
          uint64_t v9 = v20;
        }
        while (v20);
      }

      id v6 = v6;
      id v21 = v6;
    }
    else
    {
LABEL_23:
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

@end