@interface PrivacyCategoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PrivacyCategoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.PrivacyCategoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.PrivacyCategoryView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.PrivacyCategoryView", @"accessibilityDataTypesLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(PrivacyCategoryViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilityDataTypesLabel"];
}

@end