@interface UILabelAccessibility
@end

@implementation UILabelAccessibility

uint64_t __71__UILabelAccessibility__ChatKit__UIKit__accessibilityIsNotFirstElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  objc_opt_class();
  *a3 = objc_opt_isKindOfClass() & 1;
  uint64_t v5 = [v4 _accessibilityIsNotFirstElement];

  return v5;
}

@end