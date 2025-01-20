@interface CNAtomViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CNAtomViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAtomView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAtomView", @"presentationOptions", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAtomView", @"title", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CNAtomViewAccessibility *)self safeValueForKey:@"presentationOptions"];
  int v4 = [v3 integerValue];

  if ((v4 & 0x10) != 0)
  {
    v6 = accessibilityLocalizedString(@"vip.sender");
  }
  else
  {
    if ((*(void *)&v4 & 0x20001) != 0)
    {
      v5 = accessibilityLocalizedString(@"address.failure.style");
      v6 = 0;
      goto LABEL_7;
    }
    v6 = 0;
  }
  v5 = 0;
LABEL_7:
  v7 = [(CNAtomViewAccessibility *)self safeStringForKey:@"title"];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"address.atom.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end