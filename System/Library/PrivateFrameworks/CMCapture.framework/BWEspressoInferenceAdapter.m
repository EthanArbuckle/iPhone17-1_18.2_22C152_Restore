@interface BWEspressoInferenceAdapter
+ ($2ACC23B9A21F50F5CC728381CA870116)findAvailableVersion:(id)a3 defaultOverrideKey:(id)a4 versionLocator:(id)a5 e5Bundle:(BOOL)a6;
+ (BOOL)allowE5ForInferenceType:(int)a3;
+ (id)espressoNetworkURLForPlatformedResourceBaseName:(id)a3 embedPlatformOrDeviceID:(BOOL)a4;
+ (id)locateNetworkFileFromFormat:(id)a3 defaultOverrideKey:(id)a4 version:(id)a5 e5Bundle:(BOOL)a6;
+ (uint64_t)espressoNetworkURLForPlatformedResourceBaseName:(int)a3 embedPlatformOrDeviceID:(int)a4 e5Bundle:;
+ (void)initialize;
- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7;
- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7;
@end

@implementation BWEspressoInferenceAdapter

+ (uint64_t)espressoNetworkURLForPlatformedResourceBaseName:(int)a3 embedPlatformOrDeviceID:(int)a4 e5Bundle:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  self;
  if (!a2) {
    return 0;
  }
  if (espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__onceToken == -1)
  {
    if (a3) {
      goto LABEL_4;
    }
LABEL_28:
    v19 = (void *)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__imagingNetworksBaseURL;
    BOOL v20 = a4 == 0;
    goto LABEL_29;
  }
  dispatch_once(&espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__onceToken, &__block_literal_global_84);
  if (!a3) {
    goto LABEL_28;
  }
LABEL_4:
  int v23 = a4;
  if (a4) {
    v7 = @".E5.espresso.bundle";
  }
  else {
    v7 = @".espresso.net";
  }
  v8 = &espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformRegExpForV1;
  if (a4) {
    v8 = &espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformRegExpForE5;
  }
  v24 = (void *)*v8;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = (void *)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__availableImagingNetworks;
  uint64_t v10 = [(id)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__availableImagingNetworks countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v10)
  {
LABEL_24:
    if (FigCapturePlatformIdentifier() == 4)
    {
      v19 = (void *)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__imagingNetworksBaseURL;
      BOOL v20 = v23 == 0;
LABEL_29:
      if (v20) {
        v21 = @"espresso.net";
      }
      else {
        v21 = @"E5.espresso.bundle";
      }
      v22 = objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", objc_msgSend(a2, "stringByAppendingPathExtension:", v21), 0);
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v22, "path")))return (uint64_t)v22; {
      else
      }
        return 0;
    }
    return 0;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v26;
LABEL_11:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v26 != v12) {
      objc_enumerationMutation(v9);
    }
    v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
    v15 = (void *)[v14 stringByReplacingOccurrencesOfString:v7 withString:&stru_1EFA403E0];
    uint64_t v16 = [v15 length];
    if (v16 != [v14 length])
    {
      uint64_t v17 = [v15 rangeOfString:@"." options:4];
      if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
        v15 = (void *)[v15 substringToIndex:v17];
      }
      if ([v15 isEqualToString:a2]
        && objc_msgSend(v24, "numberOfMatchesInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length")))
      {
        break;
      }
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
  }
  if (!v14) {
    goto LABEL_24;
  }
  return [(id)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__imagingNetworksBaseURL URLByAppendingPathComponent:v14 isDirectory:0];
}

uint64_t __101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) bindEspressoOutput:a2 asMetadataUsingKeys:a3];
}

+ (id)locateNetworkFileFromFormat:(id)a3 defaultOverrideKey:(id)a4 version:(id)a5 e5Bundle:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5.var0;
  id v8 = a3;
  int v9 = objc_msgSend(a3, "containsString:", @"PLATFORM", a4);
  if (v9)
  {
    if (![v8 hasSuffix:@".PLATFORM"]) {
      return 0;
    }
    uint64_t v10 = [v8 rangeOfString:@".PLATFORM"];
    uint64_t v12 = v11;
    if (v10 != [v8 length] - 9 || v12 != 9) {
      return 0;
    }
    id v8 = (id)objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 9);
  }
  uint64_t v13 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", @"MAJOR", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v7), "description"));
  v14 = objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", @"MINOR", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedShort:", WORD1(v7)), "description"));
  v15 = objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", @"PATCH", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedShort:", WORD2(v7)), "description"));
  return (id)+[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, v15, v9, v6);
}

uint64_t __111__BWEspressoInferenceAdapter_espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle___block_invoke()
{
  v18[16] = *MEMORY[0x1E4F143B8];
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__imagingNetworksBaseURL = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/System/Library/ImagingNetworks/"];
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformID = (uint64_t)(id)FigCapturePlatformIdentifierString();
  int Variant = FigCapturePlatformGetVariant();
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__deviceID = (uint64_t)(id)FigCaptureGetModelSpecificName();
  v1 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = 0;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", @"/System/Library/ImagingNetworks/", &v17);
  if (v2)
  {
    v3 = v2;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v8 hasSuffix:@".net"] & 1) != 0
            || [v8 hasSuffix:@".bundle"])
          {
            [v1 addObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v5);
    }
  }
  if ([v1 count]) {
    int v9 = v1;
  }
  else {
    int v9 = 0;
  }
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__availableImagingNetworks = (uint64_t)(id)[v9 copy];
  v18[0] = 0;
  uint64_t v10 = [NSString stringWithFormat:@"^.+(\\.|_)(%@|%@)(\\.|_).+$", espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformID, espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__deviceID];
  uint64_t v11 = v10;
  if (Variant == 3) {
    uint64_t v11 = [NSString stringWithFormat:@"^.+(\\.|_)(%@G|%@)(\\.|_).+$", espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformID, espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__deviceID];
  }
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformRegExpForV1 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v10 options:1 error:v18];
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v11 options:1 error:v18];
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformRegExpForE5 = result;
  return result;
}

- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v10 = *(void *)&a4.var0;
  uint64_t v11 = *(void *)&a3;
  v41[1] = *MEMORY[0x1E4F143B8];
  v38 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v11 != 161)
  {
    id v16 = [(BWEspressoInferenceAdapter *)self inferenceProviderForType:v11 version:v10 & 0xFFFFFFFFFFFFLL configuration:a5 resourceProvider:a6 status:a7];
    if (v16) {
      [v38 addObject:v16];
    }
    return v38;
  }
  uint64_t v39 = 0;
  id v13 = objc_alloc((Class)getVNResourceVersionClass());
  if ((unsigned __int16)v10 == 2)
  {
    uint64_t v14 = 4;
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v14 = 3;
    uint64_t v15 = 1;
  }
  id v17 = (id)[v13 initWithMajor:v14 minor:v15 micro:0];
  VNProcessingDescriptorClass = (void *)getVNProcessingDescriptorClass();
  v19 = (void *)[VNProcessingDescriptorClass descriptorForIdentifier:getVNInferenceNetworkIdentifierFaceprint() version:v17 error:&v39];
  uint64_t v37 = [v19 ANESpecificURL];
  if (!v37)
  {
    int v21 = -31701;
    if (!a7) {
      return v38;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v21 = -31701;
  if (!a5 || (isKindOfClass & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v36 = [a6 espressoContextForExecutionTarget:3];
  v22 = (void *)[v19 onlyInputImage];
  int v23 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v23, "setWidth:", [v22 pixelWidth]);
  -[BWVideoFormatRequirements setHeight:](v23, "setHeight:", [v22 pixelHeight]);
  v35 = v22;
  v41[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v22, "pixelFormatType"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v23, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1]);
  [(BWVideoFormatRequirements *)v23 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v23 setDeviceOriented:1];
  uint64_t v24 = [a5 maximumNumberOfFaces];
  long long v25 = (void *)[v19 faceprintOutput];
  uint64_t v34 = [v25 storageByteCount];
  v33 = (void *)[v19 confidencesOutput];
  if (!v24)
  {
    int v21 = 0;
LABEL_18:
    if (!a7) {
      return v38;
    }
LABEL_19:
    *a7 = v21;
    return v38;
  }
  uint64_t v26 = 0;
  while (1)
  {
    [(BWInferenceVideoFormatRequirements *)v23 setCropDescriptor:[[BWInferenceVisionFaceObservationsCropDescriptor alloc] initWithFaceIndex:v26]];
    v40 = v23;
    id v27 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1]);
    long long v28 = [BWEspressoInferenceProvider alloc];
    uint64_t v29 = [a5 priority];
    LODWORD(v32) = 0;
    uint64_t v30 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v28, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 161, v37, 0, v36, 3, v29, [MEMORY[0x1E4F1CAD0] set], a6, v32, 1);
    if (!-[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v30, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", [v35 name], @"PrimaryFormat", v27))break; {
    -[BWEspressoInferenceProvider setPropagatable:](v30, "setPropagatable:", -[BWEspressoInferenceFaceprintPropagator initWithFaceprintRequirement:faceprintSizeBytes:confidenceRequirement:maxFaces:faceIndex:]([BWEspressoInferenceFaceprintPropagator alloc], "initWithFaceprintRequirement:faceprintSizeBytes:confidenceRequirement:maxFaces:faceIndex:", -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v30, "bindEspressoOutput:asMetadataUsingKey:", [v25 name], 0x1EFA6A740), v34, -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v30, "bindEspressoOutput:asMetadataUsingKey:", objc_msgSend(v33, "name"), 0x1EFA6A760), v24, v26));
    }
    [v38 addObject:v30];
    if (v24 == ++v26)
    {
      int v21 = 0;
      goto LABEL_15;
    }
  }
  int v21 = -31711;
LABEL_15:
  if (a7) {
    goto LABEL_19;
  }
  return v38;
}

- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v10 = *(void *)&a4.var0;
  v266[1] = *MEMORY[0x1E4F143B8];
  int v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = [(id)objc_opt_class() allowE5ForInferenceType:*(void *)&a3];
  switch(a3)
  {
    case 101:
      v230 = a7;
      if (self)
      {
        if (+[BWInferenceEngine isNeuralEngineSupported]) {
          uint64_t v16 = 3;
        }
        else {
          uint64_t v16 = 1;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      uint64_t v17 = [a6 espressoContextForExecutionTarget:v16];
      unsigned int v18 = 0;
      if (self && v16 == 3) {
        unsigned int v18 = +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:3];
      }
      id v19 = (*((id (**)(uint64_t, uint64_t, uint64_t))BWInferenceSmartCameraNetworkForVersion + 2))((uint64_t)BWInferenceSmartCameraNetworkForVersion, v10 & 0xFFFFFFFFFFFFLL, v15);
      if (!v19) {
        goto LABEL_208;
      }
      id v20 = v19;
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"BlurryInputBuffer", @"FilteredInputBuffer", 0);
      LODWORD(v225) = v18;
      if (v15) {
        v22 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:]([BWE5InferenceProvider alloc], "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 101, v20, 0, v17, v16, [a5 priority], v21, a6, v225);
      }
      else {
        v22 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:]([BWEspressoInferenceProvider alloc], "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 101, v20, 0, v17, v16, [a5 priority], v21, a6, v225, 1);
      }
      uint64_t v14 = v22;
      id v156 = +[BWInferenceVideoFormatRequirements defaultEspressoFormatRequirementsWithWidth:256 height:256];
      [v156 setVideoContentMode:1];
      objc_msgSend(v156, "setCropDescriptor:", +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:](BWInferenceFinalRectCropDescriptor, "finalCropRectDescriptorWithName:", @"SmartCam"));
      v266[0] = v156;
      id v157 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v266 count:1]);
      a7 = v230;
      if (!v157) {
        goto LABEL_218;
      }
      if ((v10 & 0xFFFC) != 0) {
        v158 = @"image";
      }
      else {
        v158 = @"data";
      }
      [(BWE5InferenceProvider *)v14 bindEspressoInput:v158 fromAttachedMediaUsingKey:@"PrimaryFormat" withVideoFormat:v157];
      v159 = BWInferenceSmartCameraOutputs(v10);
      v236[0] = MEMORY[0x1E4F143A8];
      v236[1] = 3221225472;
      v236[2] = __101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke;
      v236[3] = &unk_1E5C29AF8;
      v236[4] = v14;
      [v159 enumerateKeysAndObjectsUsingBlock:v236];
      goto LABEL_203;
    case 102:
      uint64_t v14 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:@"personsegmentation-u8" embedPlatformOrDeviceID:1];
      if (!v14) {
        goto LABEL_212;
      }
      BOOL v92 = +[BWInferenceEngine isNeuralEngineSupported];
      if (v92) {
        uint64_t v93 = 3;
      }
      else {
        uint64_t v93 = 1;
      }
      if (v92) {
        uint64_t v94 = 1278226536;
      }
      else {
        uint64_t v94 = 1278226534;
      }
      uint64_t v95 = [a6 espressoContextForExecutionTarget:v93];
      v96 = [BWEspressoInferenceProvider alloc];
      uint64_t v97 = [a5 priority];
      LODWORD(v225) = 0;
      uint64_t v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v96, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 102, v14, 0, v95, v93, v97, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
      v98 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v98 setWidth:512];
      [(BWVideoFormatRequirements *)v98 setHeight:384];
      [(BWVideoFormatRequirements *)v98 setSupportedPixelFormats:&unk_1EFB03CC8];
      [(BWVideoFormatRequirements *)v98 setBytesPerRowAlignment:64];
      [(BWInferenceVideoFormatRequirements *)v98 setDeviceOriented:0];
      v265 = v98;
      id v99 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v265 count:1]);

      [(BWE5InferenceProvider *)v14 bindEspressoInput:@"rgb_float__0" fromAttachedMediaUsingKey:@"PrimaryFormat" withVideoFormat:v99];
      v100 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v100 setWidth:512];
      [(BWVideoFormatRequirements *)v100 setHeight:384];
      uint64_t v264 = [NSNumber numberWithUnsignedInt:v94];
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v100, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v264 count:1]);
      [(BWVideoFormatRequirements *)v100 setBytesPerRowAlignment:64];
      [(BWInferenceVideoFormatRequirements *)v100 setDeviceOriented:0];
      v263 = v100;
      id v101 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v263 count:1]);

      v40 = @"LowResPersonSegmentationMask";
      v41 = @"test__output_float__0";
      goto LABEL_74;
    case 103:
      uint64_t v30 = v10 & 0xFFFF00000000;
      if ((unsigned __int16)v10 == 1 && WORD1(v10) == 1 && !v30)
      {
        uint64_t v14 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:@"rgbbasedpersonsegmentation-u8" embedPlatformOrDeviceID:1];
        if (!v14) {
          goto LABEL_212;
        }
        uint64_t v31 = [a6 espressoContextForExecutionTarget:3];
        uint64_t v32 = [BWEspressoInferenceProvider alloc];
        uint64_t v33 = [a5 priority];
        LODWORD(v225) = 0;
        uint64_t v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v32, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 103, v14, 0, v31, 3, v33, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
        uint64_t v34 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v34 setWidth:256];
        [(BWVideoFormatRequirements *)v34 setHeight:256];
        [(BWVideoFormatRequirements *)v34 setSupportedPixelFormats:&unk_1EFB03CE0];
        [(BWInferenceVideoFormatRequirements *)v34 setDeviceOriented:1];
        v262 = v34;
        id v35 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v262 count:1]);

        [(BWE5InferenceProvider *)v14 bindEspressoInput:@"input_2__0" fromAttachedMediaUsingKey:@"PrimaryFormat" withVideoFormat:v35];
        uint64_t v36 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v36 setWidth:256];
        [(BWVideoFormatRequirements *)v36 setHeight:256];
        [(BWVideoFormatRequirements *)v36 setSupportedPixelFormats:&unk_1EFB03CF8];
        [(BWInferenceVideoFormatRequirements *)v36 setDeviceOriented:1];
        v261 = v36;
        id v37 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v261 count:1]);

        [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"lambda_1__strided_slice__0" asAttachedMediaUsingKey:0x1EFA744E0 withVideoFormat:v37];
        v38 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v38 setWidth:256];
        [(BWVideoFormatRequirements *)v38 setHeight:256];
        [(BWVideoFormatRequirements *)v38 setSupportedPixelFormats:&unk_1EFB03D10];
        [(BWInferenceVideoFormatRequirements *)v38 setDeviceOriented:1];
        v260 = v38;
        id v39 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v260 count:1]);

        v40 = @"RGBBasedPersonSegmentationMaskConfidence";
        v41 = @"lambda_2__strided_slice__0";
LABEL_126:
        v121 = v14;
        id v122 = v39;
        goto LABEL_127;
      }
      int v13 = 0;
      uint64_t v14 = 0;
      if ((unsigned __int16)v10 == 1 && !WORD1(v10) && !v30)
      {
        uint64_t v14 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:@"rgbbasedpersonsegmentation-30-u8" embedPlatformOrDeviceID:0];
        if (!v14) {
          goto LABEL_212;
        }
        uint64_t v140 = [a6 espressoContextForExecutionTarget:1];
        v141 = [BWEspressoInferenceProvider alloc];
        uint64_t v142 = [a5 priority];
        LODWORD(v225) = 0;
        uint64_t v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v141, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 103, v14, 0, v140, 1, v142, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
        v143 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v143 setWidth:256];
        [(BWVideoFormatRequirements *)v143 setHeight:256];
        [(BWVideoFormatRequirements *)v143 setSupportedPixelFormats:&unk_1EFB03D28];
        [(BWInferenceVideoFormatRequirements *)v143 setDeviceOriented:1];
        v259 = v143;
        id v144 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v259 count:1]);

        [(BWE5InferenceProvider *)v14 bindEspressoInput:@"input_6" fromAttachedMediaUsingKey:@"PrimaryFormat" withVideoFormat:v144];
        v145 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v145 setWidth:256];
        [(BWVideoFormatRequirements *)v145 setHeight:256];
        [(BWVideoFormatRequirements *)v145 setSupportedPixelFormats:&unk_1EFB03D40];
        [(BWInferenceVideoFormatRequirements *)v145 setDeviceOriented:1];
        v258 = v145;
        id v39 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v258 count:1]);

        v40 = @"RGBBasedPersonSegmentationMask";
        v41 = @"flow0_plussigmoid/Sigmoid";
        goto LABEL_126;
      }
      goto LABEL_204;
    case 104:
      if (!+[BWInferenceEngine isNeuralEngineSupported]) {
        goto LABEL_211;
      }
      unsigned int v42 = (unsigned __int16)v10;
      if ((unsigned __int16)v10 < 3u)
      {
        uint64_t v14 = 0;
        int v13 = -31702;
        goto LABEL_204;
      }
      uint64_t v14 = (BWE5InferenceProvider *)+[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, objc_msgSend(NSString, "stringWithFormat:", @"personsemantics-u8-v%u", (unsigned __int16)v10), 1, v15);
      if (v14)
      {
        uint64_t v43 = [a6 espressoContextForExecutionTarget:3];
        if (v15)
        {
          v44 = [BWE5InferenceProvider alloc];
          uint64_t v45 = [a5 priority];
          LODWORD(v225) = 0;
          uint64_t v46 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:](v44, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 104, v14, 0, v43, 3, v45, [MEMORY[0x1E4F1CAD0] set], a6, v225);
        }
        else
        {
          v178 = [BWEspressoInferenceProvider alloc];
          uint64_t v179 = [a5 priority];
          LODWORD(v225) = 0;
          uint64_t v46 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v178, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 104, v14, 0, v43, 3, v179, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
        }
        uint64_t v14 = (BWE5InferenceProvider *)v46;
        if (a5)
        {
          v180 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v180 setWidth:512];
          [(BWVideoFormatRequirements *)v180 setHeight:384];
          [(BWVideoFormatRequirements *)v180 setSupportedPixelFormats:&unk_1EFB03DA0];
          [(BWVideoFormatRequirements *)v180 setBytesPerRowAlignment:64];
          [(BWInferenceVideoFormatRequirements *)v180 setDeviceOriented:0];
          if ([a5 appliesFinalCropRect]) {
            id v181 = +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:@"PersonSemantics"];
          }
          else {
            id v181 = 0;
          }
          [(BWInferenceVideoFormatRequirements *)v180 setCropDescriptor:v181];
          v254 = v180;
          id v182 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v254 count:1]);

          v183 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v183 setWidth:512];
          [(BWVideoFormatRequirements *)v183 setHeight:384];
          [(BWVideoFormatRequirements *)v183 setSupportedPixelFormats:&unk_1EFB03DB8];
          [(BWVideoFormatRequirements *)v183 setBytesPerRowAlignment:64];
          [(BWInferenceVideoFormatRequirements *)v183 setDeviceOriented:0];
          v253 = v183;
          id v184 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v253 count:1]);

          char v185 = [a5 enabledSemantics];
          v186 = (void *)[MEMORY[0x1E4F1CA48] array];
          uint64_t v187 = [MEMORY[0x1E4F1CA48] array];
          [(BWE5InferenceProvider *)v14 bindEspressoInput:@"image:0" fromAttachedMediaUsingKey:@"PrimaryFormat" withVideoFormat:v182];
          uint64_t v188 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"person:0" asAttachedMediaUsingKey:0x1EFA6A200 withVideoFormat:v184];
          if (v185) {
            [v186 addObject:v188];
          }
          uint64_t v189 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"hair:0" asAttachedMediaUsingKey:0x1EFA6A220 withVideoFormat:v184];
          if ((v185 & 2) != 0) {
            [v186 addObject:v189];
          }
          uint64_t v190 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"skin:0" asAttachedMediaUsingKey:0x1EFA6A260 withVideoFormat:v184];
          if ((v185 & 8) != 0) {
            [v186 addObject:v190];
          }
          uint64_t v191 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"teeth:0" asAttachedMediaUsingKey:0x1EFA6A280 withVideoFormat:v184];
          if ((v185 & 0x10) != 0) {
            [v186 addObject:v191];
          }
          if (v42 < 4)
          {
            if ((v185 & 0xE0) == 0) {
              goto LABEL_201;
            }
          }
          else
          {
            uint64_t v192 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"semantics-estimator/split_channels_1__2" asAttachedMediaUsingKey:0x1EFA6A240 withVideoFormat:v184];
            if ((v185 & 4) != 0) {
              [v186 addObject:v192];
            }
            uint64_t v193 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"glasses:0" asAttachedMediaUsingKey:0x1EFA6A2A0 withVideoFormat:v184];
            if ((v185 & 0x20) != 0) {
              [v186 addObject:v193];
            }
            uint64_t v194 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"sky:0" asAttachedMediaUsingKey:0x1EFA6A2C0 withVideoFormat:v184];
            if ((v185 & 0x40) != 0) {
              [v186 addObject:v194];
            }
            if (v42 >= 5)
            {
              v227 = (void *)v187;
              uint64_t v195 = 1;
              do
              {
                uint64_t v196 = objc_msgSend(NSString, "stringWithFormat:", @"person_instances_%d:0", v195);
                uint64_t v197 = -[BWE5InferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v196, [NSString stringWithFormat:@"%@%d", 0x1EFA6A360, v195], v184);
                if (v185 < 0) {
                  [v186 addObject:v197];
                }
                uint64_t v195 = (v195 + 1);
              }
              while (v195 <= 4);
              uint64_t v187 = (uint64_t)v227;
              uint64_t v222 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"person_instance_confidences:0" asMetadataUsingKey:0x1EFA6A380];
              if (v185 < 0)
              {
                [v227 addObject:v222];
                objc_msgSend(v227, "addObject:", -[BWE5InferenceProvider bindEspressoOutput:asMetadataUsingKey:](v14, "bindEspressoOutput:asMetadataUsingKey:", @"person_instance_boxes:0", 0x1EFA6A3A0));
              }
              else
              {
                [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"person_instance_boxes:0" asMetadataUsingKey:0x1EFA6A3A0];
              }
LABEL_201:
              v223 = [BWInferenceSampleBufferPropagator alloc];
              uint64_t v29 = [(BWInferenceSampleBufferPropagator *)v223 initWithVideoRequirements:v186 cloneRequirements:MEMORY[0x1E4F1CBF0] metadataRequirements:v187];
              [(BWE5InferenceProvider *)v14 setPropagatable:v29];
LABEL_202:

              goto LABEL_203;
            }
            if ((v185 & 0x80) == 0) {
              goto LABEL_201;
            }
          }
          int v13 = -31782;
          goto LABEL_204;
        }
      }
      goto LABEL_212;
    case 105:
      if (self) {
        unsigned int v47 = +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:3];
      }
      else {
        unsigned int v47 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v146 = a5;
      }
      else {
        id v146 = 0;
      }
      v147 = NSString;
      int v148 = [v146 useLowFrameRateOptimizedNetwork];
      v149 = &stru_1EFA403E0;
      if (v148) {
        v149 = @"-lowfps";
      }
      uint64_t v150 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, (void *)[v147 stringWithFormat:@"personsemantics-preview%@", v149], 1, v15);
      if (!v150) {
        goto LABEL_211;
      }
      uint64_t v151 = v150;
      uint64_t v152 = [a6 espressoContextForExecutionTarget:3];
      if (v15)
      {
        v153 = [BWE5InferenceProvider alloc];
        uint64_t v154 = [a5 priority];
        LODWORD(v225) = v47;
        uint64_t v155 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:](v153, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 105, v151, 0, v152, 3, v154, [MEMORY[0x1E4F1CAD0] set], a6, v225);
      }
      else
      {
        v160 = [BWEspressoInferenceProvider alloc];
        uint64_t v161 = [a5 priority];
        LODWORD(v225) = v47;
        uint64_t v155 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v160, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 105, v151, 0, v152, 3, v161, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
      }
      uint64_t v14 = (BWE5InferenceProvider *)v155;
      v162 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v162 setWidth:256];
      [(BWVideoFormatRequirements *)v162 setHeight:192];
      [(BWVideoFormatRequirements *)v162 setSupportedPixelFormats:&unk_1EFB03D58];
      [(BWInferenceVideoFormatRequirements *)v162 setDeviceOriented:0];
      -[BWInferenceVideoFormatRequirements setRotationDegrees:](v162, "setRotationDegrees:", [v146 inputRotationAngle]);
      if ([v146 cropColorInputToPrimaryCaptureRect]) {
        [(BWInferenceVideoFormatRequirements *)v162 setCropDescriptor:objc_alloc_init(BWInferencePrimaryCaptureRectDescriptor)];
      }
      v257 = v162;
      id v163 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v257 count:1]);

      uint64_t v164 = [(BWE5InferenceProvider *)v14 bindEspressoInput:@"image__Placeholder__0" fromAttachedMediaUsingKey:@"PrimaryFormat" withVideoFormat:v163];
      if ([v146 propagateColorInput]) {
        [(BWE5InferenceProvider *)v14 bindOutputByCloningInputRequirement:v164 toAttachedMediaUsingKey:0x1EFA6A420];
      }
      v165 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v165 setWidth:256];
      [(BWVideoFormatRequirements *)v165 setHeight:192];
      [(BWVideoFormatRequirements *)v165 setSupportedPixelFormats:&unk_1EFB03D70];
      [(BWInferenceVideoFormatRequirements *)v165 setDeviceOriented:0];
      v256 = v165;
      id v166 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v256 count:1]);

      uint64_t v167 = [v146 alternativeStreamingPersonSegmentationMaskKey];
      if (v167) {
        uint64_t v168 = v167;
      }
      else {
        uint64_t v168 = 0x1EFA74460;
      }
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"person:0" asAttachedMediaUsingKey:v168 withVideoFormat:v166];
      v169 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v169 setWidth:256];
      [(BWVideoFormatRequirements *)v169 setHeight:192];
      [(BWVideoFormatRequirements *)v169 setSupportedPixelFormats:&unk_1EFB03D88];
      [(BWInferenceVideoFormatRequirements *)v169 setDeviceOriented:0];
      v255 = v169;
      id v39 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v255 count:1]);

      uint64_t v170 = [v146 alternativeStreamingSkinSegmentationMaskKey];
      if (v170) {
        v40 = (__CFString *)v170;
      }
      else {
        v40 = @"StreamingSkinSegmentationMask";
      }
      v41 = @"skin:0";
      goto LABEL_126;
    case 106:
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v14 = 0;
      int v13 = -31701;
      if (!a5) {
        goto LABEL_204;
      }
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_204;
      }
      uint64_t v103 = [a5 depthPrioritization];
      id v104 = (id)[objc_alloc((Class)getADMonocularPipelineParametersClass()) init];
      v105 = objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADMonocularPipelineClass()), "initWithInputPrioritization:andParameters:", v103, v104), "inferenceDescriptor");
      uint64_t v14 = (BWE5InferenceProvider *)[v105 networkURL];
      if (!v14) {
        goto LABEL_204;
      }
      uint64_t v106 = [v105 configurationNameForLayout:1];
      if (!v106)
      {
        uint64_t v14 = 0;
        int v13 = -31710;
        goto LABEL_204;
      }
      uint64_t v107 = v106;
      uint64_t v108 = [a6 espressoContextForExecutionTarget:3];
      v109 = [BWEspressoInferenceProvider alloc];
      uint64_t v110 = [a5 priority];
      LODWORD(v225) = 0;
      uint64_t v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v109, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 106, v14, v107, v108, 3, v110, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "colorInput"), "imageDescriptor"), "sizeForLayout:", 1);
      double v112 = v111;
      double v114 = v113;
      v115 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v115 setWidth:(unint64_t)v112];
      [(BWVideoFormatRequirements *)v115 setHeight:(unint64_t)v114];
      uint64_t v251 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "colorInput"), "imageDescriptor"), "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v115, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v251 count:1]);
      [(BWInferenceVideoFormatRequirements *)v115 setDeviceOriented:0];
      v250 = v115;
      -[BWE5InferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", objc_msgSend((id)objc_msgSend(v105, "colorInput"), "name"), @"PrimaryFormat", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v250, 1)));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "depthOutput"), "imageDescriptor"), "sizeForLayout:", 1);
      double v117 = v116;
      double v119 = v118;
      v120 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v120 setWidth:(unint64_t)v117];
      [(BWVideoFormatRequirements *)v120 setHeight:(unint64_t)v119];
      uint64_t v249 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "depthOutput"), "imageDescriptor"), "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v120, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v249 count:1]);
      [(BWInferenceVideoFormatRequirements *)v120 setDeviceOriented:0];
      v248 = v120;
      id v101 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v248 count:1]);

      v41 = (__CFString *)objc_msgSend((id)objc_msgSend(v105, "depthOutput"), "name");
      v40 = @"Depth";
LABEL_74:
      v121 = v14;
      id v122 = v101;
LABEL_127:
      [(BWE5InferenceProvider *)v121 bindEspressoOutput:v41 asAttachedMediaUsingKey:v40 withVideoFormat:v122];
      goto LABEL_203;
    case 107:
    case 110:
    case 112:
    case 113:
    case 114:
    case 115:
    case 117:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
      goto LABEL_204;
    case 108:
      objc_opt_class();
      char v48 = objc_opt_isKindOfClass();
      uint64_t v14 = 0;
      int v13 = -31701;
      if (!a5 || (v48 & 1) == 0) {
        goto LABEL_204;
      }
      if (!+[BWInferenceEngine isNeuralEngineSupported]) {
        goto LABEL_172;
      }
      v230 = a7;
      v49 = objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADStereoPipelineClass()), "initWithInputAlignment:andPrioritization:", (int)objc_msgSend(a5, "fsdNetStereoImagesAlignment"), objc_msgSend(a5, "disparityPrioritization")), "inferenceDescriptor");
      uint64_t v50 = [v49 networkURL];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = objc_msgSend((id)objc_msgSend(v49, "referenceInput"), "name");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "referenceInput"), "imageDescriptor"), "sizeForLayout:", 255);
        double v54 = v53;
        double v56 = v55;
        int v57 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "referenceInput"), "imageDescriptor"), "pixelFormat");
        uint64_t v58 = objc_msgSend((id)objc_msgSend(v49, "auxiliaryInput"), "name");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "auxiliaryInput"), "imageDescriptor"), "sizeForLayout:", 255);
        double v60 = v59;
        double v62 = v61;
        int v63 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "auxiliaryInput"), "imageDescriptor"), "pixelFormat");
        uint64_t v228 = objc_msgSend((id)objc_msgSend(v49, "disparityOutput"), "name");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "disparityOutput"), "imageDescriptor"), "sizeForLayout:", 255);
        double v65 = v64;
        double v67 = v66;
        int v68 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "disparityOutput"), "imageDescriptor"), "pixelFormat");
        uint64_t v14 = 0;
        int v13 = -31711;
        if (v57 == 1380411457 && v63 == 1380411457)
        {
          a7 = v230;
          if (v68 != 1751411059) {
            goto LABEL_204;
          }
          uint64_t v69 = [a6 espressoContextForExecutionTarget:3];
          v70 = [BWEspressoInferenceProvider alloc];
          uint64_t v71 = [a5 priority];
          LODWORD(v225) = 0;
          uint64_t v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v70, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 108, v51, 0, v69, 3, v71, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
          v72 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v72 setWidth:(unint64_t)v54];
          [(BWVideoFormatRequirements *)v72 setHeight:(unint64_t)v56];
          uint64_t v247 = [NSNumber numberWithUnsignedInt:1380411457];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v72, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v247 count:1]);
          [(BWVideoFormatRequirements *)v72 setBytesPerRowAlignment:64];
          [(BWInferenceVideoFormatRequirements *)v72 setDeviceOriented:0];
          v246 = v72;
          id v73 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v246 count:1]);

          v74 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v74 setWidth:(unint64_t)v60];
          [(BWVideoFormatRequirements *)v74 setHeight:(unint64_t)v62];
          uint64_t v245 = [NSNumber numberWithUnsignedInt:1380411457];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v74, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v245 count:1]);
          [(BWVideoFormatRequirements *)v74 setBytesPerRowAlignment:64];
          [(BWInferenceVideoFormatRequirements *)v74 setDeviceOriented:0];
          v244 = v74;
          id v75 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v244 count:1]);

          v76 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          [(BWVideoFormatRequirements *)v76 setWidth:(unint64_t)v65];
          [(BWVideoFormatRequirements *)v76 setHeight:(unint64_t)v67];
          uint64_t v243 = [NSNumber numberWithUnsignedInt:1751411059];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v76, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v243 count:1]);
          [(BWVideoFormatRequirements *)v76 setBytesPerRowAlignment:64];
          [(BWInferenceVideoFormatRequirements *)v76 setDeviceOriented:0];
          v242 = v76;
          id v77 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v242 count:1]);

          if ([(BWE5InferenceProvider *)v14 bindEspressoInput:v52 fromAttachedMediaUsingKey:0x1EFA6A3C0 withVideoFormat:v73])
          {
            int v13 = -31711;
            if ([(BWE5InferenceProvider *)v14 bindEspressoInput:v58 fromAttachedMediaUsingKey:0x1EFA6A3E0 withVideoFormat:v75])
            {
              if ([(BWE5InferenceProvider *)v14 bindEspressoOutput:v228 asAttachedMediaUsingKey:0x1EFA6A400 withVideoFormat:v77])
              {
                int v13 = 0;
              }
              else
              {
                int v13 = -31711;
              }
            }
          }
          else
          {
            int v13 = -31711;
          }
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      goto LABEL_41;
    case 109:
      objc_opt_class();
      char v123 = objc_opt_isKindOfClass();
      uint64_t v14 = 0;
      int v13 = -31701;
      if (!a5 || (v123 & 1) == 0) {
        goto LABEL_204;
      }
      uint64_t v124 = [a6 espressoContextForExecutionTarget:3];
      int v125 = [a5 videoDepthLayout];
      if (v125 == 1)
      {
        uint64_t v126 = 1;
      }
      else
      {
        if (v125) {
          goto LABEL_172;
        }
        uint64_t v126 = 3;
      }
      unsigned int v198 = [a5 videoDepthAlgorithm];
      if (v198 <= 3)
      {
        v199 = objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADPCEDisparityColorPipelineClass()), "initForInputSource:metalDevice:", qword_1A5F0CA28[v198], 0), "inferenceDescriptor");
        uint64_t v200 = [v199 networkURL];
        uint64_t v201 = [v199 configurationNameForLayout:v126];
        uint64_t v202 = [a5 concurrencyWidth] + 1;
        v203 = [BWEspressoInferenceProvider alloc];
        uint64_t v204 = [a5 priority];
        LODWORD(v225) = 0;
        uint64_t v205 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v203, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 109, v200, v201, v124, 3, v204, [MEMORY[0x1E4F1CAD0] set], a6, v225, v202);
        uint64_t v14 = (BWE5InferenceProvider *)v205;
        if (!v200) {
          goto LABEL_212;
        }
        v231[0] = MEMORY[0x1E4F143A8];
        v231[1] = 3221225472;
        v232 = __101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_221;
        v233 = &unk_1E5C29B20;
        uint64_t v234 = v205;
        uint64_t v235 = v126;
        if (__101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_221((uint64_t)v231, (void *)[v199 disparityInput], 1751411059, 1, 0x1EFA6A520, 0, 0))
        {
          uint64_t v206 = [v199 prevDisparityInput];
          if (v232((uint64_t)v231, (void *)v206, 1751411059, 1, 0x1EFA6A4E0, 0, 0))
          {
            uint64_t v207 = [v199 colorInput];
            if (v232((uint64_t)v231, (void *)v207, 1111970369, 1, 0x1EFA6A600, 0, (uint64_t)&unk_1EFB03DE8))
            {
              uint64_t v208 = [v199 disparityOutput];
              if (v232((uint64_t)v231, (void *)v208, 1751411059, 0, 0x1EFA6A540, 0x1EFA6A5E0, 0))
              {
                uint64_t v209 = [v199 prevFeaturesInput];
                int v13 = -31711;
                if (v232((uint64_t)v231, (void *)v209, 1278226536, 1, 0x1EFA6A620, 0, 0))
                {
                  uint64_t v210 = [v199 featuresOutput];
                  int v86 = v232((uint64_t)v231, (void *)v210, 1278226536, 0, 0x1EFA6A640, 0, 0);
LABEL_169:
                  if (v86) {
                    int v13 = 0;
                  }
                  else {
                    int v13 = -31711;
                  }
                }
                goto LABEL_204;
              }
            }
          }
        }
LABEL_218:
        int v13 = -31711;
        goto LABEL_204;
      }
LABEL_172:
      uint64_t v14 = 0;
      goto LABEL_204;
    case 111:
      objc_opt_class();
      char v78 = objc_opt_isKindOfClass();
      uint64_t v14 = 0;
      int v13 = -31701;
      if (!a5 || (v78 & 1) == 0) {
        goto LABEL_204;
      }
      uint64_t v79 = [a5 concurrencyWidth] + 1;
      uint64_t v80 = [a6 espressoContextForExecutionTarget:3];
      id v81 = (id)[objc_alloc((Class)getADStereoV2PipelineParametersClass()) init];
      v82 = objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADStereoV2PipelineClass()), "initWithParameters:", v81), "inferenceDescriptor");
      v83 = [BWEspressoInferenceProvider alloc];
      uint64_t v84 = [v82 networkURL];
      uint64_t v85 = [a5 priority];
      LODWORD(v225) = 0;
      uint64_t v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v83, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 109, v84, 0, v80, 3, v85, [MEMORY[0x1E4F1CAD0] set], a6, v225, v79);
      if (!bweia_addRequirement((void *)[v82 referenceInput], @"refInput", (uint64_t)&unk_1EFB03DD0, v14, objc_msgSend(a5, "concurrencyWidth"))|| !bweia_addRequirement(objc_msgSend(v82, "auxiliaryInput"), @"auxInput", (uint64_t)&unk_1EFB03DD0, v14, objc_msgSend(a5, "concurrencyWidth"))|| !bweia_addRequirement(objc_msgSend(v82, "prevColorFeaturesInput"), @"colorFeaturesIn", 0, v14, 1)|| !bweia_addRequirement(objc_msgSend(v82, "colorFeaturesOutput"),
              @"colorFeaturesOut",
              0,
              v14,
              1)
        || !bweia_addRequirement((void *)[v82 prevDepthFeaturesInput], @"depthFeaturesIn", 0, v14, 1)|| !bweia_addRequirement(objc_msgSend(v82, "depthFeaturesOutput"), @"depthFeaturesOut", 0, v14, 1)|| !bweia_addRequirement(objc_msgSend(v82, "disparityOutput"), @"espressoOutput", 0, v14, objc_msgSend(a5, "concurrencyWidth")))
      {
        goto LABEL_218;
      }
      int v13 = -31711;
      if (!bweia_addRequirement((void *)[v82 temporalSmoothingCurrentFeaturesRatioMinInput], @"currentFeaturesMin", 0, v14, 1))goto LABEL_204; {
      int v86 = bweia_addRequirement((void *)[v82 temporalSmoothingPreviousFeaturesRatioMinInput], @"previousFeaturesMin", 0, v14, 1);
      }
      goto LABEL_169;
    case 116:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v230 = a7;
        if (+[BWInferenceEngine isNeuralEngineSupported])
        {
          unsigned int v127 = (unsigned __int16)[a5 version];
          if (v127 != (unsigned __int16)v10
            || (unsigned int v128 = [a5 version], v129 = HIWORD(v128), HIWORD(v128) != WORD1(v10))
            || (unsigned int v130 = v128, (unsigned __int16)((unint64_t)[a5 version] >> 32) != WORD2(v10)))
          {
            uint64_t v14 = 0;
            int v13 = 0;
LABEL_41:
            a7 = v230;
            goto LABEL_204;
          }
          uint64_t v14 = (BWE5InferenceProvider *)(*((id (**)(uint64_t, uint64_t, uint64_t))BWInferenceTextLocalizationNetworkForVersion
                                          + 2))((uint64_t)BWInferenceTextLocalizationNetworkForVersion, v10 & 0xFFFFFFFFFFFFLL, v15);
          if (v14)
          {
            if (v127 == 1 && v130 < 0x10000)
            {
              v226 = 0;
              v131 = 0;
              char v229 = 1;
              double v132 = 384.0;
              double v133 = 512.0;
              v134 = @"image";
              if (self)
              {
LABEL_89:
                unsigned int v135 = +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:3];
LABEL_188:
                uint64_t v213 = [a6 espressoContextForExecutionTarget:3];
                v214 = [BWEspressoInferenceProvider alloc];
                uint64_t v215 = [a5 priority];
                LODWORD(v225) = v135;
                uint64_t v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v214, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 116, v14, 0, v213, 3, v215, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
                id v216 = +[BWInferenceVideoFormatRequirements defaultEspressoFormatRequirementsWithWidth:(uint64_t)v133 height:(uint64_t)v132];
                [v216 setVideoContentMode:0];
                [v216 setCropDescriptor:objc_alloc_init(BWInferencePrimaryCaptureRectDescriptor)];
                if ([a5 inferenceInputUsesPortraitOrientation]) {
                  [v216 setRotationDegrees:90];
                }
                [v216 setDeviceOriented:0];
                id v252 = v216;
                id v217 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v252 count:1]);
                a7 = v230;
                if (v217)
                {
                  [(BWE5InferenceProvider *)v14 bindEspressoInput:v134 fromAttachedMediaUsingKey:@"PrimaryFormat" withVideoFormat:v217];
                  uint64_t v218 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"pred_boxes" asMetadataUsingKeys:0];
                  uint64_t v219 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"scores" asMetadataUsingKeys:0];
                  if (v131) {
                    uint64_t v220 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:v131 asMetadataUsingKeys:0];
                  }
                  else {
                    uint64_t v220 = 0;
                  }
                  if (v229) {
                    uint64_t v221 = 0;
                  }
                  else {
                    uint64_t v221 = [(BWE5InferenceProvider *)v14 bindEspressoOutput:v226 asMetadataUsingKeys:0];
                  }
                  [(BWE5InferenceProvider *)v14 setPropagatable:[[BWEspressoInferenceBoundingBoxPropagator alloc] initWithBoxRequirement:v218 scoreRequirement:v219 angularOffsetRequirement:v220 fontSizeRequirement:v221 configuration:a5 toInferenceResultKey:0x1EFA6A1E0]];
LABEL_203:
                  int v13 = 0;
                  goto LABEL_204;
                }
                fig_log_get_emitter();
                FigDebugAssert3();
                goto LABEL_218;
              }
            }
            else
            {
              if (v127 > 1 || v127 == 1 && (v129 == 3 || v130 >= 0x50000)) {
                v131 = @"P3rotation";
              }
              else {
                v131 = 0;
              }
              BOOL v211 = v127 == 1;
              if ((v130 & 0xFFFC0000) == 0) {
                BOOL v211 = 0;
              }
              if (v127 > 1) {
                BOOL v211 = 1;
              }
              char v229 = !v211;
              if (v211) {
                v212 = @"P3font_size";
              }
              else {
                v212 = 0;
              }
              v226 = v212;
              v134 = @"input_image";
              double v132 = 448.0;
              double v133 = 608.0;
              if (self) {
                goto LABEL_89;
              }
            }
            unsigned int v135 = 0;
            goto LABEL_188;
          }
        }
        else
        {
LABEL_208:
          uint64_t v14 = 0;
        }
        int v13 = -31701;
        goto LABEL_41;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_211:
      uint64_t v14 = 0;
LABEL_212:
      int v13 = -31701;
LABEL_204:
      if (a7) {
        *a7 = v13;
      }
      return v14;
    case 118:
      if (!+[BWInferenceEngine isNeuralEngineSupported]) {
        goto LABEL_211;
      }
      uint64_t v14 = (BWE5InferenceProvider *)+[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, @"anst_refiner256-v1.1", 1, v15);
      if (!v14) {
        goto LABEL_212;
      }
      uint64_t v136 = [a6 espressoContextForExecutionTarget:3];
      if (v15)
      {
        v137 = [BWE5InferenceProvider alloc];
        uint64_t v138 = [a5 priority];
        LODWORD(v225) = 0;
        uint64_t v139 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:](v137, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 118, v14, 0, v136, 3, v138, [MEMORY[0x1E4F1CAD0] set], a6, v225);
      }
      else
      {
        v171 = [BWEspressoInferenceProvider alloc];
        uint64_t v172 = [a5 priority];
        LODWORD(v225) = 0;
        uint64_t v139 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v171, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 118, v14, 0, v136, 3, v172, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
      }
      uint64_t v14 = (BWE5InferenceProvider *)v139;
      v173 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v173 setWidth:256];
      [(BWVideoFormatRequirements *)v173 setHeight:192];
      [(BWVideoFormatRequirements *)v173 setSupportedPixelFormats:&unk_1EFB03E18];
      [(BWVideoFormatRequirements *)v173 setBytesPerRowAlignment:64];
      [(BWInferenceVideoFormatRequirements *)v173 setIncludesInvalidContent:1];
      v240 = v173;
      -[BWE5InferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", @"input_image", @"PrimaryFormat", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v240 count:1]));
      v174 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v174 setWidth:256];
      [(BWVideoFormatRequirements *)v174 setHeight:192];
      [(BWVideoFormatRequirements *)v174 setSupportedPixelFormats:&unk_1EFB03E30];
      [(BWVideoFormatRequirements *)v174 setBytesPerRowAlignment:64];
      v239 = v174;
      id v175 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v239 count:1]);
      [(BWE5InferenceProvider *)v14 bindEspressoInput:@"input_mask_person" fromAttachedMediaUsingKey:0x1EFA6A780 withVideoFormat:v175];
      [(BWE5InferenceProvider *)v14 bindEspressoInput:@"input_mask_hair" fromAttachedMediaUsingKey:0x1EFA6A7A0 withVideoFormat:v175];
      [(BWE5InferenceProvider *)v14 bindEspressoInput:@"input_mask_skin" fromAttachedMediaUsingKey:0x1EFA6A7C0 withVideoFormat:v175];
      [(BWE5InferenceProvider *)v14 bindEspressoInput:@"last_mask" fromAttachedMediaUsingKey:0x1EFA6A780 withVideoFormat:v175];
      v176 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v176 setWidth:256];
      [(BWVideoFormatRequirements *)v176 setHeight:192];
      [(BWVideoFormatRequirements *)v174 setBytesPerRowAlignment:64];
      [(BWVideoFormatRequirements *)v176 setSupportedPixelFormats:&unk_1EFB03E48];
      v238 = v176;
      id v177 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v238 count:1]);
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"person@output" asAttachedMediaUsingKey:0x1EFA6A7E0 withVideoFormat:v177];
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"hair@output" asAttachedMediaUsingKey:0x1EFA6A800 withVideoFormat:v177];
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"skin@output" asAttachedMediaUsingKey:0x1EFA6A820 withVideoFormat:v177];

      goto LABEL_203;
    case 130:
      uint64_t v87 = [MEMORY[0x1E4F1CB10] URLWithString:@"/System/Library/PrivateFrameworks/VisualIntelligence.framework/assets_581/ObjectDetectionModel.bundle"];
      if (self)
      {
        if (+[BWInferenceEngine isNeuralEngineSupported]) {
          uint64_t v88 = 3;
        }
        else {
          uint64_t v88 = 1;
        }
      }
      else
      {
        uint64_t v88 = 0;
      }
      uint64_t v89 = [a6 espressoContextForExecutionTarget:v88];
      unsigned int v90 = 0;
      if (self && v88 == 3) {
        unsigned int v90 = +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:3];
      }
      LODWORD(v225) = v90;
      uint64_t v14 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:]([BWE5InferenceProvider alloc], "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 130, v87, 0, v89, v88, [a5 priority], objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObject:", @"BlurryInputBuffer"), a6, v225);
      id v91 = +[BWInferenceVideoFormatRequirements defaultEspressoFormatRequirementsWithWidth:512 height:512];
      objc_msgSend(v91, "setCropDescriptor:", +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:](BWInferenceFinalRectCropDescriptor, "finalCropRectDescriptorWithName:", @"VisualIntelligenceObjectDetection"));
      [v91 setVideoContentMode:0];
      id v237 = v91;
      -[BWE5InferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", @"image", @"PrimaryFormat", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v237 count:1]));
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"nmsScores" asMetadataUsingKey:@"nmsScores"];
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"nmsBoxes" asMetadataUsingKey:@"nmsBoxes"];
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"nmsNumBoxes" asMetadataUsingKey:@"nmsNumBoxes"];
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"nmsBoxIdices" asMetadataUsingKey:@"nmsBoxIdices"];
      [(BWE5InferenceProvider *)v14 bindEspressoOutput:@"tag_scores" asMetadataUsingKey:@"tag_scores"];
      goto LABEL_203;
    default:
      if (a3 != 151) {
        goto LABEL_204;
      }
      if (!+[BWInferenceEngine isNeuralEngineSupported]) {
        goto LABEL_211;
      }
      id v23 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:@"vcp_human_pose_lite_v2" embedPlatformOrDeviceID:1];
      if (!v23) {
        goto LABEL_211;
      }
      id v24 = v23;
      uint64_t v25 = [a6 espressoContextForExecutionTarget:3];
      uint64_t v26 = [BWEspressoInferenceProvider alloc];
      LODWORD(v225) = 0;
      uint64_t v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v26, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 151, v24, @"res_256x160", v25, 3, 0, [MEMORY[0x1E4F1CAD0] set], a6, v225, 1);
      id v27 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v27 setWidth:256];
      [(BWVideoFormatRequirements *)v27 setHeight:160];
      [(BWVideoFormatRequirements *)v27 setSupportedPixelFormats:&unk_1EFB03E00];
      [(BWVideoFormatRequirements *)v27 setBytesPerRowAlignment:64];
      [(BWInferenceVideoFormatRequirements *)v27 setDeviceOriented:0];
      v241 = v27;
      id v28 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v241 count:1]);

      if (![(BWE5InferenceProvider *)v14 bindEspressoInput:@"input" fromAttachedMediaUsingKey:@"PrimaryFormat" withVideoFormat:v28])goto LABEL_218; {
      uint64_t v29 = [[BWInferenceHumanPosePropagator alloc] initWithOutputRequirement:[(BWE5InferenceProvider *)v14 bindEspressoOutput:@"output" asMetadataUsingKey:0x1EFA6A5C0]];
      }
      [(BWE5InferenceProvider *)v14 setPropagatable:v29];
      [(BWE5InferenceProvider *)v14 setTensorMemoryProvider:v29];
      goto LABEL_202;
  }
}

+ (BOOL)allowE5ForInferenceType:(int)a3
{
  return ((a3 - 101) < 5) & (0x19u >> (a3 - 101));
}

+ (void)initialize
{
}

+ (id)espressoNetworkURLForPlatformedResourceBaseName:(id)a3 embedPlatformOrDeviceID:(BOOL)a4
{
  return (id)+[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, a3, a4, 0);
}

uint64_t __101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_221(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  int v14 = objc_msgSend((id)objc_msgSend(a2, "imageDescriptor"), "pixelFormat");
  uint64_t v15 = [a2 name];
  if (v14 != a3) {
    return 0;
  }
  uint64_t v16 = v15;
  objc_msgSend((id)objc_msgSend(a2, "imageDescriptor"), "sizeForLayout:", *(void *)(a1 + 40));
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v21 setWidth:(unint64_t)v18];
  [(BWVideoFormatRequirements *)v21 setHeight:(unint64_t)v20];
  v27[0] = [NSNumber numberWithUnsignedInt:a3];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1]);
  [(BWVideoFormatRequirements *)v21 setSupportedColorSpaceProperties:a7];
  [(BWInferenceVideoFormatRequirements *)v21 setDeviceOriented:0];
  [(BWVideoFormatRequirements *)v21 setBytesPerRowAlignment:64];
  uint64_t v26 = v21;
  id v22 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1]);
  id v23 = *(void **)(a1 + 32);
  uint64_t v24 = a4
      ? [v23 bindEspressoInput:v16 fromAttachedMediaUsingKey:a5 withVideoFormat:v22]
      : [v23 bindEspressoOutput:v16 asAttachedMediaUsingKey:a5 withVideoFormat:v22];
  if (!v24) {
    return 0;
  }
  if (a6) {
    [*(id *)(a1 + 32) bindOutputByCloningInputRequirement:v24 toAttachedMediaUsingKey:a6];
  }
  return 1;
}

+ ($2ACC23B9A21F50F5CC728381CA870116)findAvailableVersion:(id)a3 defaultOverrideKey:(id)a4 versionLocator:(id)a5 e5Bundle:(BOOL)a6
{
  if (![a3 count])
  {
    fig_log_get_emitter();
LABEL_7:
    FigDebugAssert3();
    uint64_t v9 = 0;
    int v8 = 0;
    unsigned __int16 v7 = 0;
    return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMake(v7, v8, v9);
  }
  unsigned __int16 v12 = 0;
  int v11 = 0;
  if ((BWVersionMakeWithObject([a3 objectAtIndexedSubscript:0], &v11) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_7;
  }
  unsigned __int16 v7 = v11;
  int v8 = HIWORD(v11);
  uint64_t v9 = v12;
  return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMake(v7, v8, v9);
}

@end