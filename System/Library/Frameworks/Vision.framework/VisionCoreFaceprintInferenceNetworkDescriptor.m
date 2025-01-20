@interface VisionCoreFaceprintInferenceNetworkDescriptor
@end

@implementation VisionCoreFaceprintInferenceNetworkDescriptor

BOOL __132__VisionCoreFaceprintInferenceNetworkDescriptor_VNPrivateAdditions__VNFaceprintFromOutputObjects_originatingRequestSpecifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  LODWORD(v6) = *(_DWORD *)(a1 + 56);
  uint64_t v7 = [*(id *)(a1 + 32) VNFaceprintFromData:v5 confidence:*(void *)(a1 + 40) originatingRequestSpecifier:a3 error:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v10;
}

@end