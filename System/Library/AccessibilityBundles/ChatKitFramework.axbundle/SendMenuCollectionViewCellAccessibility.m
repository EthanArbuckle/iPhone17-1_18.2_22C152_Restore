@interface SendMenuCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGRect)_accessibilityVisibleFrame:(BOOL)a3;
- (id)accessibilityHint;
@end

@implementation SendMenuCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.SendMenuCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"drag.drop.reorder.hint");
}

- (CGRect)_accessibilityVisibleFrame:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SendMenuCollectionViewCellAccessibility;
  [(SendMenuCollectionViewCellAccessibility *)&v7 _accessibilityVisibleFrame:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end