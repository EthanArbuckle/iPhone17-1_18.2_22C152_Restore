@interface NTKCFaceDetailRowActionLabelCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NTKCFaceDetailRowActionLabelCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailRowActionLabelCell";
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
  return (id)_UIAXStringForAllChildren(self, a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailRowActionLabelCellAccessibility;
  return UIAccessibilityTraitButton | [(NTKCFaceDetailRowActionLabelCellAccessibility *)&v3 accessibilityTraits];
}

@end