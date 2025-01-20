@interface MKPhotoSmallAttributionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation MKPhotoSmallAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPhotoSmallAttributionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end