@interface NTK_PUPhotoEditAdjustmentCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation NTK_PUPhotoEditAdjustmentCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTK_PUPhotoEditAdjustmentCell";
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
  v3.receiver = self;
  v3.super_class = (Class)NTK_PUPhotoEditAdjustmentCellAccessibility;
  return UIAccessibilityTraitButton | [(NTK_PUPhotoEditAdjustmentCellAccessibility *)&v3 accessibilityTraits];
}

@end