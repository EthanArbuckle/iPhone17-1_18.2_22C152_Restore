@interface BuddyExpressSetupFeatureCardPrimaryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilityExpandedStatus;
- (void)setExpanded:(BOOL)a3;
@end

@implementation BuddyExpressSetupFeatureCardPrimaryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyExpressSetupFeatureCardPrimaryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyExpressSetupFeatureCardPrimaryCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyExpressSetupFeatureCardPrimaryCell", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyExpressSetupFeatureCardPrimaryCell", @"setExpanded:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyExpressSetupFeatureCardPrimaryCell", @"isExpanded", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(BuddyExpressSetupFeatureCardPrimaryCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, subtitleLabel"];
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(BuddyExpressSetupFeatureCardPrimaryCellAccessibility *)self safeBoolForKey:@"isExpanded"])return 1; {
  else
  }
    return 2;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (void)setExpanded:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BuddyExpressSetupFeatureCardPrimaryCellAccessibility;
  [(BuddyExpressSetupFeatureCardPrimaryCellAccessibility *)&v3 setExpanded:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end