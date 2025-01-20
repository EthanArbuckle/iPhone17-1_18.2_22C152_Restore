@interface VNPersonSegmentationGeneratorFast
+ (BOOL)inputMaskRequired;
+ (BOOL)rotateImageToMatchNetworkOrientation;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)inputImageBlobName;
+ (id)inputMaskBlobName;
+ (id)outputMaskBlobNameToRequestKey;
+ (id)outputMaskBlobNames;
@end

@implementation VNPersonSegmentationGeneratorFast

+ (BOOL)inputMaskRequired
{
  return 0;
}

+ (BOOL)rotateImageToMatchNetworkOrientation
{
  return 0;
}

+ (id)outputMaskBlobNameToRequestKey
{
  if (+[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::onceToken != -1) {
    dispatch_once(&+[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::onceToken, &__block_literal_global_39_23763);
  }
  v2 = (void *)+[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;

  return v2;
}

void __67__VNPersonSegmentationGeneratorFast_outputMaskBlobNameToRequestKey__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = VNPersonSegmentationGeneratorFastOutputBlobNameMask;
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = (void *)+[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
  +[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey = v2;
}

+ (id)outputMaskBlobNames
{
  if (+[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::onceToken != -1) {
    dispatch_once(&+[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::onceToken, &__block_literal_global_23767);
  }
  uint64_t v2 = (void *)+[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::outputMaskBlobNames;

  return v2;
}

void __56__VNPersonSegmentationGeneratorFast_outputMaskBlobNames__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = VNPersonSegmentationGeneratorFastOutputBlobNameMask;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)+[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::outputMaskBlobNames;
  +[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::outputMaskBlobNames = v0;
}

+ (id)inputMaskBlobName
{
  uint64_t v2 = @"prev_mask__0";
  return @"prev_mask__0";
}

+ (id)inputImageBlobName
{
  uint64_t v2 = @"input_data__0";
  return @"input_data__0";
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  v3 = objc_msgSend(a1, "inputImageBlobName", a3);

  return v3;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"personsegmentation-si-01.espresso";
}

@end