@interface SearchHintCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchHintCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.SearchHintCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.SearchHintCollectionViewCell", @"accessibilityHintView", "@", 0);
  [v3 validateClass:@"AppStoreKitInternal.DynamicTypeLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SearchHintCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityHintView"];
  id v3 = [v2 _accessibilityDescendantOfType:MEMORY[0x2456457F0](@"AppStoreKitInternal.DynamicTypeLabel")];
  v4 = [v3 accessibilityLabel];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchHintCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchHintCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end