@interface PKPaymentSetupHeroViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (PKPaymentSetupHeroViewAccessibility)initWithContext:(int64_t)a3 featuredPaymentNetworks:(id)a4;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityEffectiveMediaAnalysisOptions;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKPaymentSetupHeroViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentSetupHeroView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentSetupHeroView" hasInstanceVariable:@"_context" withType:"q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentSetupHeroView", @"_isSmallPhone", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentSetupHeroViewAccessibility;
  [(PKPaymentSetupHeroViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(PKPaymentSetupHeroViewAccessibility *)self safeIntegerForKey:@"_context"];
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v4 = @"payment.hero.watch";
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if ([(PKPaymentSetupHeroViewAccessibility *)self safeBoolForKey:@"_isSmallPhone"])
    {
      v4 = @"payment.hero.label.small.phone";
    }
    else if (AXDeviceHasPearl())
    {
      v4 = @"payment.hero.label.face.id";
    }
    else
    {
      v4 = @"payment.hero.label.touch.id";
    }
  }
  uint64_t v3 = accessibilityLocalizedString(v4);
LABEL_10:

  return (id)v3;
}

- (unsigned)_accessibilityEffectiveMediaAnalysisOptions
{
  return 2048;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (PKPaymentSetupHeroViewAccessibility)initWithContext:(int64_t)a3 featuredPaymentNetworks:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupHeroViewAccessibility;
  v4 = [(PKPaymentSetupHeroViewAccessibility *)&v6 initWithContext:a3 featuredPaymentNetworks:a4];
  [(PKPaymentSetupHeroViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end