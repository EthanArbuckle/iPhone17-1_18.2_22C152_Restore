@interface ARFrame
@end

@implementation ARFrame

BOOL __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) hitTestResult:v3 isPlaneOfType:32])
  {
    [*(id *)(a1 + 32) hitTestResultDistanceFromCamera:v3];
    BOOL v5 = v4 < *(float *)(a1 + 40);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) hitTestResult:v3 isPlaneOfType:16])
  {
    [*(id *)(a1 + 32) hitTestResultDistanceFromCamera:v3];
    BOOL v5 = v4 < *(float *)(a1 + 40);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 2)
  {
    [*(id *)(a1 + 32) hitTestResultDistanceFromCamera:v3];
    BOOL v5 = v4 < *(float *)(a1 + 40);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end