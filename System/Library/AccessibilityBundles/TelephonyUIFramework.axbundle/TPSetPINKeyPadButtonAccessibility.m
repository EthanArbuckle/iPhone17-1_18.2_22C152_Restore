@interface TPSetPINKeyPadButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsBlankButton;
- (BOOL)canBecomeFocused;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TPSetPINKeyPadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSetPINKeyPadButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TPSetPINKeyPadButton" isKindOfClass:@"UIView"];
  [v3 validateClass:@"TPSetPINKeyPadButton" isKindOfClass:@"TPNumberPadButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPNumberPadButton", @"character", "q", 0);
}

- (BOOL)_accessibilityIsBlankButton
{
  v2 = [(TPSetPINKeyPadButtonAccessibility *)self safeValueForKey:@"character"];
  uint64_t v3 = [v2 integerValue];

  return v3 == 13;
}

- (BOOL)canBecomeFocused
{
  return ![(TPSetPINKeyPadButtonAccessibility *)self _accessibilityIsBlankButton];
}

- (unint64_t)accessibilityTraits
{
  if ([(TPSetPINKeyPadButtonAccessibility *)self _accessibilityIsBlankButton]) {
    return *MEMORY[0x263F1CF18];
  }
  else {
    return *MEMORY[0x263F1CF08] | *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF28];
  }
}

- (id)accessibilityLabel
{
  v2 = [(TPSetPINKeyPadButtonAccessibility *)self safeValueForKey:@"character"];
  uint64_t v3 = [v2 integerValue];

  v4 = 0;
  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      v4 = AXFormatInteger();
      goto LABEL_3;
    case 12:
      v6 = @"number.pad.delete";
      accessibilityLocalizedString(@"number.pad.delete");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_3:
      v5 = v4;
      v6 = v5;
      break;
  }
  v7 = v5;

  return v7;
}

@end