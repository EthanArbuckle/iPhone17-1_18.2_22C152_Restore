@interface BannerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation BannerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.BannerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = [(BannerCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityMessageTextView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];

  return v5;
}

- (BOOL)accessibilityActivate
{
  v2 = [(BannerCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityMessageTextView"];
  char v3 = [v2 accessibilityActivate];

  return v3;
}

@end