@interface VUITVLockupViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VUITVLockupViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUITVLockupViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(VUITVLockupViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_5];
  v3 = AXLabelForElements();

  return v3;
}

uint64_t __54__VUITVLockupViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VUILabel");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end