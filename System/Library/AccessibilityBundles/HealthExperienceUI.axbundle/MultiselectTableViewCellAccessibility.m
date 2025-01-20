@interface MultiselectTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MultiselectTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.MultiselectTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HealthExperienceUI.MultiselectTableViewCell" hasSwiftField:@"accessoryIsSelected" withSwiftType:"Bool"];
  [v3 validateClass:@"HealthExperienceUI.MultiselectTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"detailTextLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MultiselectTableViewCellAccessibility *)self safeUIViewForKey:@"textLabel"];
  v6 = [(MultiselectTableViewCellAccessibility *)self safeUIViewForKey:@"detailTextLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)MultiselectTableViewCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(MultiselectTableViewCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(MultiselectTableViewCellAccessibility *)self safeSwiftBoolForKey:@"accessoryIsSelected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end