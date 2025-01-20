@interface PPKPDFIconCollectionViewCell_iOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation PPKPDFIconCollectionViewCell_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PPKPDFIconCollectionViewCell_iOS";
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