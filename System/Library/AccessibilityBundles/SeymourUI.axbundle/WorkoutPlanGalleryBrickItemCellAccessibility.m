@interface WorkoutPlanGalleryBrickItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation WorkoutPlanGalleryBrickItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WorkoutPlanGalleryBrickItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)WorkoutPlanGalleryBrickItemCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(WorkoutPlanGalleryBrickItemCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end