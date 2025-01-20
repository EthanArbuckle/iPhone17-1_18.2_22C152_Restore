@interface HMCameraClip
@end

@implementation HMCameraClip

void __71__HMCameraClip_HUAdditions__hu_accessibilityStringForSignificantEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "hu_accessibilityStringForSignificantEvent:inReferenceDate:", a2, *(void *)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 stringByAppendingString:v4];
}

@end