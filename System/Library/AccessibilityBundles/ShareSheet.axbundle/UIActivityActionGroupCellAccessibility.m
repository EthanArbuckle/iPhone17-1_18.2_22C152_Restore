@interface UIActivityActionGroupCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAXAttributedLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilitySlotID;
@end

@implementation UIActivityActionGroupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIActivityActionGroupCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIActivityActionGroupCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIActivityActionGroupCell", @"activityProxy", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIHostActivityProxy", @"labelSlotID", "I", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UIActivityActionGroupCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(UIActivityActionGroupCellAccessibility *)&v3 accessibilityTraits];
}

- (unsigned)_accessibilitySlotID
{
  v2 = [(UIActivityActionGroupCellAccessibility *)self safeValueForKey:@"activityProxy"];
  unsigned int v3 = [v2 safeUnsignedIntForKey:@"labelSlotID"];

  return v3;
}

- (id)_accessibilityAXAttributedLabel
{
  if ([(UIActivityActionGroupCellAccessibility *)self _accessibilitySlotID])
  {
    id v3 = objc_alloc(MEMORY[0x263F21660]);
    v4 = accessibilityLocalizedString(@"sharing.activity");
    v5 = (void *)[v3 initWithString:v4];

    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[UIActivityActionGroupCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    [v5 setAttribute:v6 forKey:*MEMORY[0x263F21870]];
  }
  else
  {
    v6 = [(UIActivityActionGroupCellAccessibility *)self safeUIViewForKey:@"titleLabel"];
    v5 = [v6 accessibilityLabel];
  }

  return v5;
}

@end