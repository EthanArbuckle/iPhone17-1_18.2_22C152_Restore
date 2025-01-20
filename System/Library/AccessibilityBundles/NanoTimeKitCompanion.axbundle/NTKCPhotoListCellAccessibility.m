@interface NTKCPhotoListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation NTKCPhotoListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCPhotoListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end