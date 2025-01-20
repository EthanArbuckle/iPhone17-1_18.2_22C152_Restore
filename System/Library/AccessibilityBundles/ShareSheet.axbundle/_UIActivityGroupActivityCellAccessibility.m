@interface _UIActivityGroupActivityCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilitySlotID;
@end

@implementation _UIActivityGroupActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIActivityGroupActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_UIActivityGroupActivityCell" isKindOfClass:@"UICollectionReusableView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIActivityGroupActivityCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionReusableView", @"reuseIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIActivityGroupActivityCell", @"activityProxy", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIHostActivityProxy", @"labelSlotID", "I", 0);
}

- (unsigned)_accessibilitySlotID
{
  v2 = [(_UIActivityGroupActivityCellAccessibility *)self safeValueForKey:@"activityProxy"];
  unsigned int v3 = [v2 safeUnsignedIntForKey:@"labelSlotID"];

  return v3;
}

- (id)accessibilityLabel
{
  if ([(_UIActivityGroupActivityCellAccessibility *)self _accessibilitySlotID])
  {
    id v3 = objc_alloc(MEMORY[0x263F21660]);
    v4 = accessibilityLocalizedString(@"sharing.activity");
    v5 = (void *)[v3 initWithString:v4];

    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_UIActivityGroupActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    [v5 setAttribute:v6 forKey:*MEMORY[0x263F21870]];
  }
  else
  {
    v6 = [(_UIActivityGroupActivityCellAccessibility *)self safeUIViewForKey:@"titleLabel"];
    v5 = [v6 accessibilityLabel];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityGroupActivityCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(_UIActivityGroupActivityCellAccessibility *)&v3 accessibilityTraits];
}

@end