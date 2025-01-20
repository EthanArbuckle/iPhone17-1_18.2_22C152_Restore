@interface SendMenuCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySubviewsForGettingElementsWithOptions:(id)a3;
@end

@implementation SendMenuCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.SendMenuCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySubviewsForGettingElementsWithOptions:(id)a3
{
  id v4 = a3;
  [v4 setShouldIncludeKeyboardObscuredElements:1];
  v7.receiver = self;
  v7.super_class = (Class)SendMenuCollectionViewAccessibility;
  v5 = [(SendMenuCollectionViewAccessibility *)&v7 _accessibilitySubviewsForGettingElementsWithOptions:v4];

  return v5;
}

@end