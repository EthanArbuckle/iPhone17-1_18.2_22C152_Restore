@interface CNTransportButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_axTransportType;
@end

@implementation CNTransportButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNTransportButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNFaceTimeCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNTransportButton", @"transportType", "q", 0);
}

- (int64_t)_axTransportType
{
  v2 = [(CNTransportButtonAccessibility *)self safeValueForKey:@"transportType"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  if (UIAccessibilityIsVoiceOverRunning() || _AXSAssistiveTouchScannerEnabled())
  {
    int64_t v3 = [(CNTransportButtonAccessibility *)self _axTransportType];
    if (v3) {
      LOBYTE(v3) = [(CNTransportButtonAccessibility *)self _axTransportType] != 6;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)accessibilityLabel
{
  int64_t v3 = [(CNTransportButtonAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  MEMORY[0x2456487F0](@"CNFaceTimeCell");
  char isKindOfClass = objc_opt_isKindOfClass();
  int64_t v5 = [(CNTransportButtonAccessibility *)self _axTransportType] - 1;
  v6 = @"transport.button.text";
  switch(v5)
  {
    case 0:
      if (isKindOfClass) {
        v6 = @"transport.button.phone.facetime";
      }
      else {
        v6 = @"transport.button.phone";
      }
      goto LABEL_11;
    case 1:
      goto LABEL_11;
    case 2:
      v6 = @"transport.button.video";
      goto LABEL_11;
    case 3:
      v6 = @"transport.button.email";
      goto LABEL_11;
    case 4:
      v6 = @"transport.button.map";
      goto LABEL_11;
    case 5:
      v6 = @"transport.button.medical.id";
      goto LABEL_11;
    case 6:
      v6 = @"transport.button.tty";
LABEL_11:
      v7 = accessibilityLocalizedString(v6);
      break;
    default:
      v7 = 0;
      break;
  }
  v8 = [v3 accessibilityLabel];
  v11 = [v3 accessibilityValue];
  v9 = __UIAXStringForVariables();

  return v9;
}

@end