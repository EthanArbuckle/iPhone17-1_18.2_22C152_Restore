@interface VNTorsoprintGeneratorBase
+ (CGSize)torsoprintInputImageSizeForFaceOrientation:(int)a3;
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
@end

@implementation VNTorsoprintGeneratorBase

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((id)objc_opt_class() == a1)
  {
    v13 = @"VNComputeStageMain";
    v8 = +[VNComputeDeviceUtilities mostPerformantComputeDevice];
    v12 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v14[0] = v9;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___VNTorsoprintGeneratorBase;
    v7 = objc_msgSendSuper2(&v11, sel_supportedComputeStageDevicesForOptions_error_, v6, a4);
  }

  return v7;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (!v6)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_13;
  }
  if (![v6 specifiesRequestClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  uint64_t v7 = [v6 requestRevision];
  if (v7 <= 3737841670)
  {
    if (v7 == 1 || v7 == 3737841666 || v7 == 3737841670) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ((unint64_t)(v7 - 3737841671) >= 2)
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
LABEL_12:
  v8 = objc_opt_class();
LABEL_13:

  return (Class)v8;
}

+ (CGSize)torsoprintInputImageSizeForFaceOrientation:(int)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

@end