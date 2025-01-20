@interface TVListSectionViewCellAccessibility
@end

@implementation TVListSectionViewCellAccessibility

uint64_t __61___TVListSectionViewCellAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tvbutton.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end