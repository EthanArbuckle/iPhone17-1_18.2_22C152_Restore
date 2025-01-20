@interface MKPuckAnnotationViewInnerStaleColor
@end

@implementation MKPuckAnnotationViewInnerStaleColor

id ___MKPuckAnnotationViewInnerStaleColor_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 userInterfaceStyle] == 2)
  {
    v3 = [v2 traitCollectionByModifyingTraits:&__block_literal_global_22_0];
    v4 = [MEMORY[0x1E4F428B8] systemGray2Color];
    v5 = [v4 resolvedColorWithTraitCollection:v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }

  return v5;
}

uint64_t ___MKPuckAnnotationViewInnerStaleColor_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAccessibilityContrast:1];
}

@end