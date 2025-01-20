@interface VNOpticalFlowGenerator
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedOutputPixelFormatsForOptions:(id)a3 error:(id *)a4;
- (id)validatedImageBuffersFromOptions:(id)a3 error:(id *)a4;
@end

@implementation VNOpticalFlowGenerator

+ (id)supportedOutputPixelFormatsForOptions:(id)a3 error:(id *)a4
{
  if (+[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken != -1) {
    dispatch_once(&+[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken, &__block_literal_global_11994);
  }
  v4 = (void *)+[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;

  return v4;
}

void __70__VNOpticalFlowGenerator_supportedOutputPixelFormatsForOptions_error___block_invoke()
{
  v0 = (void *)+[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;
  +[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats = (uint64_t)&unk_1EF7A7D30;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VNOpticalFlowGenerator_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __63__VNOpticalFlowGenerator_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNOpticalFlowGenerator;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (!v6)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_13;
  }
  if ([v6 specifiesRequestClass:objc_opt_class()])
  {
    if ([v6 requestRevision] != 1) {
      goto LABEL_9;
    }
  }
  else if (![v6 specifiesRequestClass:objc_opt_class()] {
         || (uint64_t v7 = [v6 requestRevision], v7 != 1) && v7 != 2)
  }
  {
LABEL_9:
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:v6];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v8 = objc_opt_class();
LABEL_13:

  return (Class)v8;
}

- (id)validatedImageBuffersFromOptions:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = 0;
  BOOL v7 = +[VNValidationUtilities getArray:&v20 forKey:@"VNDetectorProcessOption_InputImageBuffers" inOptions:v6 withElementsOfClass:objc_opt_class() requiredMinimumCount:2 allowedMaximumCount:2 error:a4];
  id v8 = v20;
  v9 = v8;
  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          if (![(VNDetector *)self validateImageBuffer:*(void *)(*((void *)&v16 + 1) + 8 * i) error:a4])
          {

            goto LABEL_12;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v14 = v10;
  }
  else
  {
LABEL_12:
    id v14 = 0;
  }

  return v14;
}

@end