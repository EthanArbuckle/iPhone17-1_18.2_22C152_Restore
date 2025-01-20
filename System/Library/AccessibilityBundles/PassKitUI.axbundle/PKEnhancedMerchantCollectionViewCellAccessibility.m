@interface PKEnhancedMerchantCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKEnhancedMerchantCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKEnhancedMerchantCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKEnhancedMerchantCollectionViewCell", @"enhancedMerchant", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKAccountEnhancedMerchant", @"name", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKEnhancedMerchantCollectionViewCellAccessibility *)self safeValueForKey:@"enhancedMerchant"];
  id v3 = [v2 safeStringForKey:@"name"];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end