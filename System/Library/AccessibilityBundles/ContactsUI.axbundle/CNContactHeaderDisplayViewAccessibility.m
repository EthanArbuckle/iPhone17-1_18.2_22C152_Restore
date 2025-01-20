@interface CNContactHeaderDisplayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPerformCopyAction:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNContactHeaderDisplayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactHeaderDisplayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactHeaderDisplayView", @"copy:", "v", "@", 0);
  [v3 validateClass:@"CNContactHeaderDisplayView" isKindOfClass:@"CNContactHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactHeaderView", @"nameLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CNContactHeaderDisplayViewAccessibility;
  [(CNContactHeaderDisplayViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CNContactHeaderDisplayViewAccessibility *)self safeValueForKey:@"nameLabel"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF18]];
  id v4 = objc_alloc(MEMORY[0x263F1C390]);
  v5 = accessibilityLocalizedString(@"copy.name.action");
  v6 = (void *)[v4 initWithName:v5 target:self selector:sel__accessibilityPerformCopyAction_];

  v9[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v3 setAccessibilityCustomActions:v7];
}

- (BOOL)_accessibilityPerformCopyAction:(id)a3
{
  return 1;
}

uint64_t __75__CNContactHeaderDisplayViewAccessibility__accessibilityPerformCopyAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) copy:0];
}

@end