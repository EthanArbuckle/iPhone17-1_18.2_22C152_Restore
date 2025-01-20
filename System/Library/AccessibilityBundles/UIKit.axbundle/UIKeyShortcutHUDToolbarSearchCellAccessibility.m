@interface UIKeyShortcutHUDToolbarSearchCellAccessibility
@end

@implementation UIKeyShortcutHUDToolbarSearchCellAccessibility

uint64_t __73___UIKeyShortcutHUDToolbarSearchCellAccessibility_isAccessibilityElement__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] _accessibilityViewController];
  NSClassFromString(&cfstr_Uikeyshortcuth_12.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

@end