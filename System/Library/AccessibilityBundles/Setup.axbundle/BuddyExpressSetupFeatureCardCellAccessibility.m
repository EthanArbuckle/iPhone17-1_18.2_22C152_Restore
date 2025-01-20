@interface BuddyExpressSetupFeatureCardCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation BuddyExpressSetupFeatureCardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyExpressSetupFeatureCardCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyExpressSetupFeatureCardCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyExpressSetupFeatureCardCell", @"stateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyExpressSetupFeatureCardCell", @"subtitleLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(BuddyExpressSetupFeatureCardCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, stateLabel, subtitleLabel"];
}

@end