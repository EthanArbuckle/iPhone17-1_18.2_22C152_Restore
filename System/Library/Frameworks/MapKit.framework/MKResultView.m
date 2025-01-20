@interface MKResultView
@end

@implementation MKResultView

uint64_t __34___MKResultView_setShowsDistance___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 441))
  {
    uint64_t v1 = result;
    v2 = objc_alloc_init(MKLocationManager);
    uint64_t v3 = *(void *)(v1 + 32);
    v4 = *(void **)(v3 + 456);
    *(void *)(v3 + 456) = v2;

    v5 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/LocationBundles/CoreParsec.framework"];
    [*(id *)(*(void *)(v1 + 32) + 456) setEffectiveBundle:v5];

    [*(id *)(*(void *)(v1 + 32) + 456) setDistanceFilter:100.0];
    [*(id *)(*(void *)(v1 + 32) + 456) setDesiredAccuracy:*MEMORY[0x1E4F1E6E8]];
    v6 = *(void **)(*(void *)(v1 + 32) + 456);
    return objc_msgSend(v6, "startLocationUpdateWithObserver:");
  }
  return result;
}

@end