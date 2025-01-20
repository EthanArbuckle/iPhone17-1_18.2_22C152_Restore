@interface PKContinuousButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setShowSpinner:(BOOL)a3;
@end

@implementation PKContinuousButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKContinuousButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKContinuousButton" hasInstanceVariable:@"_activityIndicatorView" withType:"UIActivityIndicatorView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKContinuousButton", @"setShowSpinner:", "v", "B", 0);
}

- (void)setShowSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKContinuousButtonAccessibility;
  -[PKContinuousButtonAccessibility setShowSpinner:](&v6, sel_setShowSpinner_);
  if (v3)
  {
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
    v5 = accessibilityLocalizedString(@"loading");
    UIAccessibilityPostNotification(v4, v5);
  }
}

- (id)accessibilityValue
{
  BOOL v3 = [(PKContinuousButtonAccessibility *)self safeUIViewForKey:@"_activityIndicatorView"];
  UIAccessibilityNotifications v4 = [v3 window];

  if (v4)
  {
    v5 = accessibilityLocalizedString(@"loading");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKContinuousButtonAccessibility;
    v5 = [(PKContinuousButtonAccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end