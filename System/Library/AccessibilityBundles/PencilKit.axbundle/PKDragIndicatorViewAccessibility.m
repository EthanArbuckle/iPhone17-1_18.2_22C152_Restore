@interface PKDragIndicatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKDragIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKDragIndicatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(@"tool.palette.drag.indicator.label");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81380];
}

- (id)accessibilityHint
{
  return accessibilityPencilKitLocalizedString(@"tool.palette.drag.indicator.hint");
}

@end