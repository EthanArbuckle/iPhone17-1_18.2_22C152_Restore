@interface _UIActivityUserDefaultsActivityCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unsigned)_accessibilitySlotID;
@end

@implementation _UIActivityUserDefaultsActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIActivityUserDefaultsActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_UIActivityUserDefaultsActivityCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIActivityUserDefaultsActivityCell", @"activityProxy", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIUserDefaultsActivityProxy", @"labelSlot", "@", 0);
}

- (unsigned)_accessibilitySlotID
{
  v2 = [(_UIActivityUserDefaultsActivityCellAccessibility *)self safeValueForKey:@"activityProxy"];
  unsigned int v3 = [v2 safeUnsignedIntForKey:@"labelSlot"];

  return v3;
}

- (id)accessibilityLabel
{
  if ([(_UIActivityUserDefaultsActivityCellAccessibility *)self _accessibilitySlotID])
  {
    id v3 = objc_alloc(MEMORY[0x263F21660]);
    v4 = accessibilityLocalizedString(@"sharing.activity");
    v5 = (void *)[v3 initWithString:v4];

    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_UIActivityUserDefaultsActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    [v5 setAttribute:v6 forKey:*MEMORY[0x263F21870]];
  }
  else
  {
    objc_opt_class();
    v6 = __UIAccessibilityCastAsClass();
    v7 = [v6 textLabel];
    v5 = [v7 text];
  }

  return v5;
}

@end