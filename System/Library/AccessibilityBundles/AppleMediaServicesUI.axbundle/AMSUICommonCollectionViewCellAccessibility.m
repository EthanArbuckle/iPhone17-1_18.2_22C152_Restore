@interface AMSUICommonCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AMSUICommonCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AMSUICommonCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AMSUICommonCollectionViewCell", @"underlyingContentView", "@", 0);
  [v3 validateClass:@"AMSUICommonCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(AMSUICommonCollectionViewCellAccessibility *)self safeValueForKey:@"underlyingContentView"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  v2 = [(AMSUICommonCollectionViewCellAccessibility *)self safeValueForKey:@"underlyingContentView"];
  double v3 = [v2 accessibilityLabel];

  return v3;
}

@end