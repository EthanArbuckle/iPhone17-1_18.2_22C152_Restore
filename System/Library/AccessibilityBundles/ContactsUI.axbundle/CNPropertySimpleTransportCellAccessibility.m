@interface CNPropertySimpleTransportCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CNPropertySimpleTransportCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertySimpleTransportCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertySimpleTransportCell", @"shouldShowStar", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertySimpleTransportCell", @"shouldShowBadge", "B", 0);
}

- (id)accessibilityLabel
{
  v10.receiver = self;
  v10.super_class = (Class)CNPropertySimpleTransportCellAccessibility;
  id v3 = [(CNPropertySimpleTransportCellAccessibility *)&v10 accessibilityLabel];
  if ([(CNPropertySimpleTransportCellAccessibility *)self safeBoolForKey:@"shouldShowStar"])
  {
    v7 = accessibilityLocalizedString(@"vip.badge");
    v9 = @"__AXStringForVariablesSentinel";
    uint64_t v4 = __UIAXStringForVariables();

    id v3 = (void *)v4;
  }
  if ([(CNPropertySimpleTransportCellAccessibility *)self safeBoolForKey:@"shouldShowBadge", v7, v9])
  {
    v8 = accessibilityLocalizedString(@"recent.badge");
    uint64_t v5 = __UIAXStringForVariables();

    id v3 = (void *)v5;
  }

  return v3;
}

@end