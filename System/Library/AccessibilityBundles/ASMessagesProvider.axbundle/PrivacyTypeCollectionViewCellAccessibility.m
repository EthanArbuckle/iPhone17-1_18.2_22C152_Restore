@interface PrivacyTypeCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PrivacyTypeCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.PrivacyTypeCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.PrivacyTypeCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.PrivacyTypeCollectionViewCell", @"accessibilityDetailLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.PrivacyTypeCollectionViewCell", @"accessibilityCategoryViews", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PrivacyTypeCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilityDetailLabel"];
  v4 = [(PrivacyTypeCollectionViewCellAccessibility *)self safeArrayForKey:@"accessibilityCategoryViews"];
  v7 = AXLabelForElements();
  v5 = __UIAXStringForVariables();

  return v5;
}

@end