@interface WGWidgetListEditViewTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_axIsAddCell;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation WGWidgetListEditViewTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGWidgetListEditViewTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UILabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetListEditViewTableViewCell", @"showsDot", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellAccessibility", @"_accessibilityCellEditingControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellAccessibility", @"_accessibilityCellReorderControl", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = &stru_26F83BFA8;
  if ([(WGWidgetListEditViewTableViewCellAccessibility *)self _axIsAddCell])
  {
    accessibilityLocalizedString(@"add.widget");
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  v4 = [(WGWidgetListEditViewTableViewCellAccessibility *)self safeValueForKeyPath:@"textLabel.text"];
  __UIAccessibilityCastAsClass();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &stru_26F83BFA8;
  }
  v7 = v6;

  v8 = [NSString stringWithFormat:@"%@ %@", v3, v7];

  if ([(WGWidgetListEditViewTableViewCellAccessibility *)self safeBoolForKey:@"showsDot"])
  {
    v11 = accessibilityLocalizedString(@"new.widget");
    v9 = __UIAXStringForVariables();
  }
  else
  {
    v9 = __UIAXStringForVariables();
  }

  return v9;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  BOOL v3 = [(WGWidgetListEditViewTableViewCellAccessibility *)self _axIsAddCell];
  uint64_t v4 = *MEMORY[0x263F81380];
  if (v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if ([(WGWidgetListEditViewTableViewCellAccessibility *)self _axIsAddCell])
  {
    LOBYTE(v9) = 0;
    objc_opt_class();
    BOOL v3 = [(WGWidgetListEditViewTableViewCellAccessibility *)self safeValueForKey:@"_accessibilityCellEditingControl"];
    __UIAccessibilityCastAsClass();
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    [v4 sendActionsForControlEvents:64];
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(WGWidgetListEditViewTableViewCellAccessibility *)self _privateAccessibilityCustomActions];
    v7 = [v6 firstObject];

    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    id v4 = v7;
    AXPerformSafeBlock();
    BOOL v5 = *((unsigned char *)v10 + 24) != 0;

    _Block_object_dispose(&v9, 8);
  }

  return v5;
}

void __71__WGWidgetListEditViewTableViewCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _accessibilityCustomActionIdentifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 _accessibilityPerformCustomActionWithIdentifier:v3];
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(WGWidgetListEditViewTableViewCellAccessibility *)self safeValueForKey:@"_accessibilityCellEditingControl"];
  if (![(WGWidgetListEditViewTableViewCellAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    v6 = [(WGWidgetListEditViewTableViewCellAccessibility *)self safeValueForKey:@"_accessibilityCellReorderControl"];
    v7 = v6;
    if (!v6)
    {
      if (!v3)
      {
        v14.receiver = self;
        v14.super_class = (Class)WGWidgetListEditViewTableViewCellAccessibility;
        [(WGWidgetListEditViewTableViewCellAccessibility *)&v14 accessibilityActivationPoint];
        goto LABEL_11;
      }
      v6 = v3;
    }
    [v6 accessibilityActivationPoint];
LABEL_11:
    double v8 = v10;
    double v9 = v11;

    goto LABEL_12;
  }
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WGWidgetListEditViewTableViewCellAccessibility;
    [(WGWidgetListEditViewTableViewCellAccessibility *)&v15 accessibilityActivationPoint];
  }
  double v8 = v4;
  double v9 = v5;
LABEL_12:

  double v12 = v8;
  double v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)_axIsAddCell
{
  uint64_t v2 = [(WGWidgetListEditViewTableViewCellAccessibility *)self _privateAccessibilityCustomActions];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

@end