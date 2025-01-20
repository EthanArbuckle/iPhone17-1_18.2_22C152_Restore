@interface PKPassPaymentPayStateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PKPassPaymentPayStateViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_applyStatePreservingGlyphState:(BOOL)a3 overridingText:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)emphasizeStateIfPossible:(int64_t)a3 withOverrideText:(id)a4;
@end

@implementation PKPassPaymentPayStateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassPaymentPayStateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassPaymentPayStateView", @"emphasizeStateIfPossible:withOverrideText:", "v", "q", "@", 0);
  [v3 validateClass:@"PKPassPaymentPayStateView" hasInstanceVariable:@"_label" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassPaymentPayStateView", @"_applyStatePreservingGlyphState: overridingText: animated: completionHandler:", "v", "B", "@", "B", "@?", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentPayStateViewAccessibility;
  [(PKPassPaymentPayStateViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKPassPaymentPayStateViewAccessibility *)self safeValueForKey:@"_label"];
  [v3 _setAccessibilityServesAsFirstElement:1];
}

- (PKPassPaymentPayStateViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassPaymentPayStateViewAccessibility;
  id v3 = -[PKPassPaymentPayStateViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKPassPaymentPayStateViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (void)emphasizeStateIfPossible:(int64_t)a3 withOverrideText:(id)a4
{
  id v6 = a4;
  v7 = [(PKPassPaymentPayStateViewAccessibility *)self safeValueForKey:@"_label"];
  v8 = [v7 accessibilityLabel];

  v11.receiver = self;
  v11.super_class = (Class)PKPassPaymentPayStateViewAccessibility;
  [(PKPassPaymentPayStateViewAccessibility *)&v11 emphasizeStateIfPossible:a3 withOverrideText:v6];

  v9 = [(PKPassPaymentPayStateViewAccessibility *)self safeValueForKey:@"_label"];
  v10 = [v9 accessibilityLabel];

  if (([v10 isEqual:v8] & 1) == 0 && objc_msgSend(v8, "length") && objc_msgSend(v10, "length")) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v10);
  }
}

- (void)_applyStatePreservingGlyphState:(BOOL)a3 overridingText:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = [(PKPassPaymentPayStateViewAccessibility *)self safeValueForKey:@"_label"];
  v13 = [v12 accessibilityLabel];

  v16.receiver = self;
  v16.super_class = (Class)PKPassPaymentPayStateViewAccessibility;
  [(PKPassPaymentPayStateViewAccessibility *)&v16 _applyStatePreservingGlyphState:v8 overridingText:v11 animated:v6 completionHandler:v10];

  [(PKPassPaymentPayStateViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v14 = [(PKPassPaymentPayStateViewAccessibility *)self safeValueForKey:@"_label"];
  v15 = [v14 accessibilityLabel];

  if (([v15 isEqual:v13] & 1) == 0 && objc_msgSend(v15, "length")) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v15);
  }
}

@end