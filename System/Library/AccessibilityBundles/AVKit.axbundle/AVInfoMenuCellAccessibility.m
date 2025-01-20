@interface AVInfoMenuCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (unint64_t)accessibilityTraits;
@end

@implementation AVInfoMenuCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVInfoMenuCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVInfoMenuCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVInfoMenuCell", @"floatingView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = _UIAccessibilityFocusedElements();
  int v4 = [v3 containsObject:self];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)AVInfoMenuCellAccessibility;
  return [(AVInfoMenuCellAccessibility *)&v6 isAccessibilityElement];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AVInfoMenuCellAccessibility;
  return *MEMORY[0x263F813F8] | [(AVInfoMenuCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilityFrameDelegate
{
  return (id)[(AVInfoMenuCellAccessibility *)self safeValueForKey:@"floatingView"];
}

@end