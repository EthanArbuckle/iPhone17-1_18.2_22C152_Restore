@interface TVCollectionViewCellAccessibility
@end

@implementation TVCollectionViewCellAccessibility

Class __71___TVCollectionViewCellAccessibility__accessibilityAncestorFocusParcel__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Tvshelfview.isa);
  _accessibilityAncestorFocusParcel__TVShelfViewClass = (uint64_t)result;
  return result;
}

uint64_t __88___TVCollectionViewCellAccessibility__atvaccessibilityCollectionViewCellSemanticContext__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tvcardfloating.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end