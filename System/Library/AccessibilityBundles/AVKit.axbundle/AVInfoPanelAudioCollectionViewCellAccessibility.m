@interface AVInfoPanelAudioCollectionViewCellAccessibility
@end

@implementation AVInfoPanelAudioCollectionViewCellAccessibility

void __74__tvOS_AVInfoPanelAudioCollectionViewCellAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  id v6 = [*(id *)(a1 + 32) safeValueForKey:@"route"];
  uint64_t v3 = [v2 _imageForRoute:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __83__tvOS_AVInfoPanelAudioCollectionViewCellAccessibility_accessibilityHeaderElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Avinfopanelcol.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end