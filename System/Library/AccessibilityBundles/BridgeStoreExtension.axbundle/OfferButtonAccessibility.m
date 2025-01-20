@interface OfferButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (OfferButtonAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
- (void)accessibilityShowLoading;
- (void)accessibilityShowProgress:(double)a3;
- (void)accessibilityShowRedownload;
- (void)accessibilityShowText:(id)a3;
@end

@implementation OfferButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.OfferButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.OfferButton", @"accessibilityShowRedownload", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.OfferButton", @"accessibilityShowLoading", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.OfferButton", @"accessibilityShowProgress:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.OfferButton", @"accessibilityShowText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.OfferButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.OfferButton", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"BridgeStoreExtension.OfferButton" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.OfferButton", @"accessibilityOfferLabel", "@", 0);
  [v3 validateClass:@"BridgeStoreExtension.OfferButton" hasSwiftField:@"label" withSwiftType:"DynamicTypeLabel"];
  [v3 validateClass:@"BridgeStoreExtension.OfferButton" hasSwiftField:@"subtitleLabel" withSwiftType:"DynamicTypeLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)OfferButtonAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(OfferButtonAccessibility *)&v5 accessibilityTraits] | *MEMORY[0x263F1CF68];
  if ([(OfferButtonAccessibility *)self safeBoolForKey:@"isEnabled"]) {
    return v3 & ~*MEMORY[0x263F1CF20];
  }
  else {
    return *MEMORY[0x263F1CF20] | v3;
  }
}

- (id)accessibilityLabel
{
  v14.receiver = self;
  v14.super_class = (Class)OfferButtonAccessibility;
  unint64_t v3 = [(OfferButtonAccessibility *)&v14 accessibilityLabel];
  v4 = [(OfferButtonAccessibility *)self safeSwiftValueForKey:@"label"];
  objc_super v5 = [(OfferButtonAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v6 = [v4 accessibilityLabel];
  v7 = v6;
  if (v6) {
    BOOL v8 = v3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
  }
  else
  {
    v9 = [v4 accessibilityLabel];
    int v10 = [v3 containsString:v9];

    if (v10)
    {
      uint64_t v11 = __UIAXStringForVariables();
      goto LABEL_10;
    }
  }
  uint64_t v11 = [v3 localizedLowercaseString];
LABEL_10:
  v12 = (void *)v11;

  return v12;
}

- (OfferButtonAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfferButtonAccessibility;
  unint64_t v3 = -[OfferButtonAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(OfferButtonAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)accessibilityShowRedownload
{
  v3.receiver = self;
  v3.super_class = (Class)OfferButtonAccessibility;
  [(OfferButtonAccessibility *)&v3 accessibilityShowRedownload];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  [(OfferButtonAccessibility *)self setAccessibilityHint:0];
  [(OfferButtonAccessibility *)self setAccessibilityValue:0];
}

- (void)accessibilityShowLoading
{
  v4.receiver = self;
  v4.super_class = (Class)OfferButtonAccessibility;
  [(OfferButtonAccessibility *)&v4 accessibilityShowLoading];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_super v3 = accessibilityAppStoreLocalizedString(@"cancel.download.hint");
  [(OfferButtonAccessibility *)self setAccessibilityHint:v3];

  [(OfferButtonAccessibility *)self setAccessibilityValue:0];
}

- (void)accessibilityShowProgress:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OfferButtonAccessibility;
  -[OfferButtonAccessibility accessibilityShowProgress:](&v6, sel_accessibilityShowProgress_);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_super v4 = accessibilityAppStoreLocalizedString(@"cancel.download.hint");
  [(OfferButtonAccessibility *)self setAccessibilityHint:v4];

  objc_super v5 = AXFormatFloatWithPercentage();
  [(OfferButtonAccessibility *)self setAccessibilityValue:v5];
}

- (void)accessibilityShowText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OfferButtonAccessibility;
  [(OfferButtonAccessibility *)&v4 accessibilityShowText:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  [(OfferButtonAccessibility *)self setAccessibilityValue:0];
  [(OfferButtonAccessibility *)self setAccessibilityHint:0];
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  objc_super v3 = [(OfferButtonAccessibility *)self safeValueForKey:@"accessibilityOfferLabel"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  objc_super v5 = __UIAXStringForVariables();
  objc_super v6 = MEMORY[0x245645800](v5);

  return v6;
}

@end