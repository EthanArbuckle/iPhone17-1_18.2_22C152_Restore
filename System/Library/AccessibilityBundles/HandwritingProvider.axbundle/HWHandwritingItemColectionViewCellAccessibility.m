@interface HWHandwritingItemColectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)_axDelete;
@end

@implementation HWHandwritingItemColectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HWHandwritingItemColectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWHandwritingItemColectionViewCell", @"editing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWHandwritingItemColectionViewCell", @"deleteButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = accessibilityLocalizedString(@"handwritten.item");
  if ([(HWHandwritingItemColectionViewCellAccessibility *)self safeBoolForKey:@"editing"])
  {
    v6 = accessibilityLocalizedString(@"editing");
    uint64_t v4 = __UIAXStringForVariables();

    id v3 = (void *)v4;
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(HWHandwritingItemColectionViewCellAccessibility *)self safeBoolForKey:@"editing"])v2 = @"handwritten.item.editing.hint"; {
  else
  }
    v2 = @"handwritten.item.hint";
  id v3 = accessibilityLocalizedString(v2);

  return v3;
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(HWHandwritingItemColectionViewCellAccessibility *)self safeBoolForKey:@"editing"])
  {
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    v5 = accessibilityLocalizedString(@"handwritten.item.delete.action");
    v6 = (void *)[v4 initWithName:v5 target:self selector:sel__axDelete];

    [v6 setSortPriority:*MEMORY[0x263F81158]];
    [v3 addObject:v6];
  }

  return v3;
}

- (void)_axDelete
{
  id v2 = [(HWHandwritingItemColectionViewCellAccessibility *)self safeValueForKey:@"deleteButton"];
  [v2 accessibilityActivate];
}

@end