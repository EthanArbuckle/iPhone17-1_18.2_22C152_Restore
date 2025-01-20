@interface VNANFDMultiDetectorANSTv1
+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3;
+ (BOOL)supportsExecution;
+ (Class)detectorClass;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
@end

@implementation VNANFDMultiDetectorANSTv1

+ (Class)detectorClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allNeuralEngineComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

uint64_t __46__VNANFDMultiDetectorANSTv1_supportsExecution__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 lastPathComponent];
  if ([v3 hasPrefix:*(void *)(a1 + 32)]) {
    uint64_t v4 = [v3 containsString:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsExecution
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VNANFDMultiDetectorANSTv1_supportsExecution__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANSTv1 supportsExecution]::onceToken, block);
  }
  return +[VNANFDMultiDetectorANSTv1 supportsExecution]::supportsExecution;
}

void __46__VNANFDMultiDetectorANSTv1_supportsExecution__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "detectorClass"), "modelName");
  if ([v1 hasSuffix:@".espresso"])
  {
    v2 = [v1 stringByDeletingPathExtension];
    v3 = VNANEArchitectureName();
    if ([v3 length])
    {
      uint64_t v4 = VNFrameworkBundle();
      v5 = [v4 pathsForResourcesOfType:@"hwx" inDirectory:0];
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      v9 = __46__VNANFDMultiDetectorANSTv1_supportsExecution__block_invoke_2;
      v10 = &unk_1E5B1EFB8;
      id v11 = v2;
      id v12 = v3;
      v6 = [v5 indexesOfObjectsPassingTest:&v7];
      if (objc_msgSend(v6, "count", v7, v8, v9, v10)) {
        +[VNANFDMultiDetectorANSTv1 supportsExecution]::supportsExecution = 1;
      }
    }
  }
}

+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3
{
  return 0;
}

@end