@interface SketchSurfaceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SketchSurfaceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.SketchSurface";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"RECTANGLE_DIAGRAM");
}

@end