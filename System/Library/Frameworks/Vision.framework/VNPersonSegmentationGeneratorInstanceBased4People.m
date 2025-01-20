@interface VNPersonSegmentationGeneratorInstanceBased4People
+ (BOOL)inputMaskRequired;
+ (BOOL)rotateImageToMatchNetworkOrientation;
+ (NSArray)outputConfidenceBlobNames;
+ (NSArray)outputMaskBlobNames;
+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(uint64_t)a1 error:(void *)a2;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)inputImageBlobName;
+ (id)inputMaskBlobName;
+ (id)outputMaskBlobNameToRequestKey;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
- (BOOL)bindOutputConfidenceBuffersAndReturnError:(id *)a3;
- (BOOL)validateMaskForBlobName:(id)a3 options:(id)a4 maskConfidence:(float *)a5 maskAcceptable:(BOOL *)a6 error:(id *)a7;
- (id).cxx_construct;
@end

@implementation VNPersonSegmentationGeneratorInstanceBased4People

+ (BOOL)inputMaskRequired
{
  return 0;
}

+ (BOOL)rotateImageToMatchNetworkOrientation
{
  return 1;
}

+ (NSArray)outputConfidenceBlobNames
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v2 personInstanceMaskConfidencesOutput];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "name", (void)v11);
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = (void *)[v3 copy];

  return (NSArray *)v9;
}

+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(uint64_t)a1 error:(void *)a2
{
  self;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__28989;
  long long v11 = __Block_byref_object_dispose__28990;
  id v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VNPersonSegmentationGeneratorInstanceBased4People__inferenceDescriptorForModelConfiguredWithOptions_error___block_invoke;
  block[3] = &unk_1E5B20220;
  block[4] = &v7;
  if (+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::onceToken != -1) {
    dispatch_once(&+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::onceToken, block);
  }
  id v3 = (void *)+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  if (+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor)
  {
    id v4 = (id)+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  }
  else if (a2)
  {
    *a2 = (id) v8[5];
  }
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __109__VNPersonSegmentationGeneratorInstanceBased4People__inferenceDescriptorForModelConfiguredWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  uint64_t v2 = [MEMORY[0x1E4FB3EF0] personInstanceMaskV1AndReturnError:&obj];
  objc_storeStrong((id *)(v1 + 40), obj);
  id v3 = (void *)+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor = v2;
}

+ (id)outputMaskBlobNameToRequestKey
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 outputMaskBlobNames];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
  id v4 = (objc_class *)objc_opt_class();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = NSStringFromClass(v4);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9, (void)v13);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  long long v11 = (void *)[v3 copy];

  return v11;
}

+ (NSArray)outputMaskBlobNames
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v2 personInstanceMasksOutput];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "name", (void)v11);
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = (void *)[v3 copy];

  return (NSArray *)v9;
}

+ (id)inputMaskBlobName
{
  return 0;
}

+ (id)inputImageBlobName
{
  uint64_t v2 = +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 allInputNames];
    uint64_t v5 = [v4 firstObject];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  id v3 = +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  id v4 = [v3 onlyInputImage];
  uint64_t v5 = [v4 name];

  return v5;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  id v3 = +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  id v4 = [v3 onlyInputImage];
  unsigned int v5 = [v4 pixelFormatType];

  return v5;
}

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[VNValidationUtilities computeDeviceForKey:@"VNDetectorInternalOption_ModelComputeDevice" inOptions:v6 error:a4];
  if (v7)
  {
    v8 = +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, a4);
    uint64_t v9 = v8;
    if (v8)
    {
      v10 = [v8 modelPathForComputeDevice:v7 error:a4];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_DWORD *)self + 62) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
}

- (BOOL)bindOutputConfidenceBuffersAndReturnError:(id *)a3
{
  unsigned int v5 = [(id)objc_opt_class() outputConfidenceBlobNames];
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", [v5 count] == 1, @"VNSegmentationGenerator - internal error in number confidence buffer names");
  [v5 firstObject];
  uint64_t v20 = 0;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v6;
  uint64_t v7 = std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * {__strong},espresso_buffer_t>>((uint64_t)&self->_espressoConfidencesOutputBuffer, &v9, (uint64_t *)&v9);

  LOBYTE(a3) = [(VNEspressoModelFileBasedDetector *)self bindBuffer:v7 + 24 toNetworkOutputBlobName:*((void *)v7 + 2) error:a3];
  return (char)a3;
}

- (BOOL)validateMaskForBlobName:(id)a3 options:(id)a4 maskConfidence:(float *)a5 maskAcceptable:(BOOL *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  if (a5) {
    BOOL v13 = a6 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  uint64_t v14 = !v13;
  id v31 = v12;
  +[VNError VNAssert:v14, @"One or more of output parameters is/are NULL", v11 log];
  id v15 = v11;
  long long v16 = v15;
  if (!self)
  {

    goto LABEL_9;
  }
  +[VNError VNAssert:self->_espressoConfidencesOutputBuffer.__table_.__p2_.__value_ == 1 log:@"VNSegmentationGenerator - internal error in number confidence buffers"];
  uint64_t v17 = *((void *)self->_espressoConfidencesOutputBuffer.__table_.__p1_.__value_.__next_ + 3);
  id v18 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v18 setNumberStyle:1];
  long long v19 = [v16 componentsSeparatedByString:@":"];
  uint64_t v20 = [v19 firstObject];

  v21 = [v20 componentsSeparatedByString:@"_"];
  v22 = [v21 lastObject];

  v23 = [v18 numberFromString:v22];
  unint64_t v24 = [v23 unsignedIntegerValue] - 1;

  +[VNError VNAssert:v24 < 4 log:@"VNSegmentationGenerator - internal error calculating confidence index"];
  float v25 = *(float *)(v17 + 4 * v24);

  if (v25 < 0.5)
  {
LABEL_9:
    *a6 = 0;
    BOOL v26 = 1;
    v27 = v31;
    goto LABEL_15;
  }
  float v32 = 0.0;
  v27 = v31;
  BOOL v26 = +[VNValidationUtilities getFloatValue:&v32 forKey:@"VNSegmentationGeneratorProcessOption_MinimumConfidence" inOptions:v31 withDefaultValue:a7 error:0.0];
  if (v26)
  {
    if (v25 >= v32)
    {
      *a5 = v25;
      BOOL v28 = 1;
    }
    else
    {
      BOOL v28 = 0;
    }
    *a6 = v28;
  }
LABEL_15:

  return v26;
}

@end