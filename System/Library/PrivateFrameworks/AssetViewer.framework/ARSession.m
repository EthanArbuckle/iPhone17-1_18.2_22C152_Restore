@interface ARSession
@end

@implementation ARSession

BOOL __85__ARSession_SmartRaycast__smartRaycastResultForImagePoint_assetPosition_maxDistance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 target] != 2)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"ARSession+SmartRaycast.m", 35, @"Expected ARRaycastResult.target == ARRaycastTargetEstimatedPlane, but got %ld", objc_msgSend(v3, "target") object file lineNumber description];
  }
  [*(id *)(a1 + 32) raycastResultDistanceFromCamera:v3];
  BOOL v5 = v4 < *(float *)(a1 + 48);

  return v5;
}

@end