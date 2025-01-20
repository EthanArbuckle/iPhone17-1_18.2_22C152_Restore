@interface HUViewControllerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBecomeFocused;
@end

@implementation HUViewControllerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUViewControllerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end