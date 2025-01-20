@interface BRShareSettingsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BRShareSettingsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BRShareSettingsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BRShareSettingsButton", @"titleLabel", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BRShareSettingsButton", @"detailLabel", "v", 0);
}

- (id)accessibilityLabel
{
  return (id)[(BRShareSettingsButtonAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, detailLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end