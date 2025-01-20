@interface TPSlidingButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TPSlidingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSlidingButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSlidingButton", @"type", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSlidingButton", @"delegate", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(TPSlidingButtonAccessibility *)self accessibilityUserDefinedLabel];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_3:
    v6 = v5;
    goto LABEL_4;
  }
  v8 = [(TPSlidingButtonAccessibility *)self safeValueForKey:@"type"];
  int v9 = [v8 integerValue];

  if ((v9 & 0xFFFFFFFD) == 0)
  {
    accessibilityLocalizedString(@"phone.action.answer");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v13.receiver = self;
  v13.super_class = (Class)TPSlidingButtonAccessibility;
  v6 = [(TPSlidingButtonAccessibility *)&v13 accessibilityLabel];
  v10 = [(TPSlidingButtonAccessibility *)self safeValueForKey:@"_acceptButton"];

  if (v10)
  {
    v11 = [(TPSlidingButtonAccessibility *)self safeValueForKey:@"_acceptButton"];
    uint64_t v12 = [v11 accessibilityLabel];

    v6 = (void *)v12;
  }
LABEL_4:

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  v2 = [(TPSlidingButtonAccessibility *)self safeValueForKey:@"_acceptButton"];
  char v3 = [v2 accessibilityActivate];

  return v3;
}

@end