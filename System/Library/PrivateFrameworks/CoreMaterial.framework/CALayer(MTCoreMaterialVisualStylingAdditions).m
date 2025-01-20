@interface CALayer(MTCoreMaterialVisualStylingAdditions)
- (uint64_t)mt_applyVisualStying:()MTCoreMaterialVisualStylingAdditions;
- (uint64_t)mt_removeAllVisualStyling;
- (void)mt_replaceAllVisualStylingWithStyling:()MTCoreMaterialVisualStylingAdditions;
@end

@implementation CALayer(MTCoreMaterialVisualStylingAdditions)

- (uint64_t)mt_removeAllVisualStyling
{
  [a1 setCompositingFilter:0];
  return [a1 setFilters:0];
}

- (uint64_t)mt_applyVisualStying:()MTCoreMaterialVisualStylingAdditions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__CALayer_MTCoreMaterialVisualStylingAdditions__mt_applyVisualStying___block_invoke;
  v4[3] = &unk_1E5F1B480;
  v4[4] = a1;
  return [a3 _applyToLayer:a1 withColorBlock:v4];
}

- (void)mt_replaceAllVisualStylingWithStyling:()MTCoreMaterialVisualStylingAdditions
{
  id v4 = a3;
  objc_msgSend(a1, "mt_removeAllVisualStyling");
  objc_msgSend(a1, "mt_applyVisualStying:", v4);
}

@end