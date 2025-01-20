@interface AVxOverlayToolCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation AVxOverlayToolCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVxOverlayToolCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = _UIAccessibilityFocusedElements();
  int v4 = [v3 containsObject:self];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)AVxOverlayToolCellAccessibility;
  return [(AVxOverlayToolCellAccessibility *)&v6 isAccessibilityElement];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end