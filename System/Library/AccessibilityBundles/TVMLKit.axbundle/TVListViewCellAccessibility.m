@interface TVListViewCellAccessibility
@end

@implementation TVListViewCellAccessibility

uint64_t __51___TVListViewCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Videosoffervie.isa);
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(&cfstr_Tvbutton.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end