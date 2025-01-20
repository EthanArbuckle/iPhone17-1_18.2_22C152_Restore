@interface VNHomeAppFaceAnalyzerMultiDetectorANFRv4_MD2
+ (const)modelVersionForOptions:(id)a3;
+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(id)a3 error:(id *)a4;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3;
@end

@implementation VNHomeAppFaceAnalyzerMultiDetectorANFRv4_MD2

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[VNValidationUtilities computeDeviceForKey:@"VNDetectorInternalOption_ModelComputeDevice" inOptions:v6 error:a4];
  if (v7)
  {
    v8 = [a1 _inferenceDescriptorForModelConfiguredWithOptions:v6 error:a4];
    v9 = v8;
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

+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(id)a3 error:(id *)a4
{
  v4 = objc_msgSend(MEMORY[0x1E4FB3EA8], "FPrev4_0FArev1_4_MD2AndReturnError:", a4);

  return v4;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  v3 = [a1 _inferenceDescriptorForModelConfiguredWithOptions:a3 error:0];
  v4 = [v3 onlyInputImage];
  v5 = [v4 name];

  return v5;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  v3 = [a1 _inferenceDescriptorForModelConfiguredWithOptions:a3 error:0];
  v4 = [v3 onlyInputImage];
  unsigned int v5 = [v4 pixelFormatType];

  return v5;
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::FaceprintAndAttributes::modelVersion_fp4_0_fa1_4_md2_2;
}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  return 0;
}

@end