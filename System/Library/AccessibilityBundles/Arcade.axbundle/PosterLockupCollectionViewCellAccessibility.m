@interface PosterLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation PosterLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.PosterLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.PosterLockupCollectionViewCell", @"accessibilityFallbackTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.PosterLockupCollectionViewCell", @"accessibilityFooterView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.PosterLockupCollectionViewCell", @"accessibilityOfferButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PosterLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityFallbackTitle"];
  v6 = [(PosterLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityFooterView"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(PosterLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityOfferButton"];
  [v3 axSafelyAddObject:v4];

  return v3;
}

@end