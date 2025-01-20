@interface VNPersonSegmentationGeneratorLearnedMatting
+ (BOOL)inputMaskRequired;
+ (BOOL)rotateImageToMatchNetworkOrientation;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)inputImageBlobName;
+ (id)inputMaskBlobName;
+ (id)outputMaskBlobNameToRequestKey;
+ (id)outputMaskBlobNames;
@end

@implementation VNPersonSegmentationGeneratorLearnedMatting

+ (BOOL)inputMaskRequired
{
  return 1;
}

+ (BOOL)rotateImageToMatchNetworkOrientation
{
  return 1;
}

+ (id)outputMaskBlobNameToRequestKey
{
  if (+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::onceToken != -1) {
    dispatch_once(&+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::onceToken, &__block_literal_global_39_19909);
  }
  v2 = (void *)+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;

  return v2;
}

void __77__VNPersonSegmentationGeneratorLearnedMatting_outputMaskBlobNameToRequestKey__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = VNPersonSegmentationGeneratorLearnedMattingOutputBlobNameMask;
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = (void *)+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
  +[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey = v2;
}

+ (id)outputMaskBlobNames
{
  if (+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::onceToken != -1) {
    dispatch_once(&+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::onceToken, &__block_literal_global_19913);
  }
  uint64_t v2 = (void *)+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::outputMaskBlobNames;

  return v2;
}

void __66__VNPersonSegmentationGeneratorLearnedMatting_outputMaskBlobNames__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = VNPersonSegmentationGeneratorLearnedMattingOutputBlobNameMask;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::outputMaskBlobNames;
  +[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::outputMaskBlobNames = v0;
}

+ (id)inputMaskBlobName
{
  uint64_t v2 = @"alpha";
  return @"alpha";
}

+ (id)inputImageBlobName
{
  uint64_t v2 = @"image";
  return @"image";
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  v3 = objc_msgSend(a1, "inputImageBlobName", a3);

  return v3;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"learned-matting-1512x2016.espresso";
}

@end