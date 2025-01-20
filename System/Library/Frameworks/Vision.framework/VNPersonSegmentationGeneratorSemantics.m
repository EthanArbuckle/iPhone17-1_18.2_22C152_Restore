@interface VNPersonSegmentationGeneratorSemantics
+ (BOOL)inputMaskRequired;
+ (BOOL)rotateImageToMatchNetworkOrientation;
+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(id)a3 error:(id *)a4;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)inputImageBlobName;
+ (id)inputMaskBlobName;
+ (id)outputMaskBlobNameToFeatureName;
+ (id)outputMaskBlobNameToRequestKey;
+ (id)outputMaskBlobNames;
@end

@implementation VNPersonSegmentationGeneratorSemantics

+ (BOOL)inputMaskRequired
{
  return 0;
}

+ (BOOL)rotateImageToMatchNetworkOrientation
{
  return 1;
}

+ (id)outputMaskBlobNameToFeatureName
{
  if (+[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::onceToken != -1) {
    dispatch_once(&+[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::onceToken, &__block_literal_global_24673);
  }
  v2 = (void *)+[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName;

  return v2;
}

void __73__VNPersonSegmentationGeneratorSemantics_outputMaskBlobNameToFeatureName__block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB3F20] objectClassOutputNameForObjectClassID:4 error:0];
  v6[0] = v0;
  v7[0] = @"human_attribute_skin";
  v1 = [MEMORY[0x1E4FB3F20] objectClassOutputNameForObjectClassID:8 error:0];
  v6[1] = v1;
  v7[1] = @"human_attribute_hair";
  v2 = [MEMORY[0x1E4FB3F20] objectClassOutputNameForObjectClassID:16 error:0];
  v6[2] = v2;
  v7[2] = @"human_attribute_facial_hair";
  v3 = [MEMORY[0x1E4FB3F20] objectClassOutputNameForObjectClassID:32 error:0];
  v6[3] = v3;
  v7[3] = @"human_attribute_teeth";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)+[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName;
  +[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName = v4;
}

+ (id)outputMaskBlobNameToRequestKey
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _inferenceDescriptorForModelConfiguredWithOptions:0 error:0];
  v3 = [v2 humanAttributesMasksOutput];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count") + 3);
  v5 = (objc_class *)objc_opt_class();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v11 = NSStringFromClass(v5);
        v12 = objc_msgSend(v10, "name", (void)v27);
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v15 = [v2 personsMaskOutput];
  v16 = [v15 name];
  [v4 setObject:v14 forKeyedSubscript:v16];

  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v19 = [v2 skyMaskOutput];
  v20 = [v19 name];
  [v4 setObject:v18 forKeyedSubscript:v20];

  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = [v2 glassesMaskOutput];
  v24 = [v23 name];
  [v4 setObject:v22 forKeyedSubscript:v24];

  v25 = (void *)[v4 copy];

  return v25;
}

+ (id)outputMaskBlobNames
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _inferenceDescriptorForModelConfiguredWithOptions:0 error:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [v2 humanAttributesMasksOutput];
  v5 = (void *)[v4 mutableCopy];

  id v6 = [v2 personsMaskOutput];
  [v5 addObject:v6];

  uint64_t v7 = [v2 skyMaskOutput];
  [v5 addObject:v7];

  uint64_t v8 = [v2 glassesMaskOutput];
  [v5 addObject:v8];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "name", (void)v16);
        [v3 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = (void *)[v3 copy];

  return v14;
}

+ (id)inputMaskBlobName
{
  return 0;
}

+ (id)inputImageBlobName
{
  v2 = [a1 _inferenceDescriptorForModelConfiguredWithOptions:0 error:0];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 allInputNames];
    v5 = [v4 firstObject];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  id v3 = objc_msgSend(a1, "inputImageBlobName", a3);

  return v3;
}

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[VNValidationUtilities computeDeviceForKey:@"VNDetectorInternalOption_ModelComputeDevice" inOptions:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = [a1 _inferenceDescriptorForModelConfiguredWithOptions:v6 error:a4];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 modelPathForComputeDevice:v7 error:a4];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__24684;
  v14 = __Block_byref_object_dispose__24685;
  id v15 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VNPersonSegmentationGeneratorSemantics__inferenceDescriptorForModelConfiguredWithOptions_error___block_invoke;
  block[3] = &unk_1E5B20220;
  block[4] = &v10;
  if (+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::onceToken != -1) {
    dispatch_once(&+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::onceToken, block);
  }
  id v6 = (void *)+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  if (+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor)
  {
    id v7 = (id)+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  }
  else if (a4)
  {
    *a4 = (id) v11[5];
  }
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __98__VNPersonSegmentationGeneratorSemantics__inferenceDescriptorForModelConfiguredWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  uint64_t v2 = [MEMORY[0x1E4FB3F20] semanticSegmentationV4AndReturnError:&obj];
  objc_storeStrong((id *)(v1 + 40), obj);
  id v3 = (void *)+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  +[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor = v2;
}

@end