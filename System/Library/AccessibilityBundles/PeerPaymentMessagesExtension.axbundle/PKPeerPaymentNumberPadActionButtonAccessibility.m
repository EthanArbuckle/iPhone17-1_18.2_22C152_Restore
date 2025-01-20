@interface PKPeerPaymentNumberPadActionButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPeerPaymentNumberPadActionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentNumberPadActionButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentNumberPadActionButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PKPeerPaymentNumberPadActionButtonAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF08] | *MEMORY[0x263F1CF28];
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(PKPeerPaymentNumberPadActionButtonAccessibility *)self safeIntegerForKey:@"action"];
  if (v3 == 10)
  {
    v4 = @"decimal.button";
    goto LABEL_5;
  }
  if (v3 == 12)
  {
    v4 = @"delete.button";
LABEL_5:
    v5 = accessibilityPeerPaymentLocalizedString(v4);
    goto LABEL_7;
  }
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentNumberPadActionButtonAccessibility;
  v5 = [(PKPeerPaymentNumberPadActionButtonAccessibility *)&v7 accessibilityLabel];
LABEL_7:

  return v5;
}

@end