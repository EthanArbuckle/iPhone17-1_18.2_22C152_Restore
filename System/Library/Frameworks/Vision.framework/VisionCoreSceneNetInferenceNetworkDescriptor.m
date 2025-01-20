@interface VisionCoreSceneNetInferenceNetworkDescriptor
@end

@implementation VisionCoreSceneNetInferenceNetworkDescriptor

BOOL __132__VisionCoreSceneNetInferenceNetworkDescriptor_VNPrivateAdditions__VNSceneprintFromOutputObjects_originatingRequestSpecifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) VNSceneprintFromData:v5 originatingRequestSpecifier:*(void *)(a1 + 40) error:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  BOOL v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v9;
}

@end