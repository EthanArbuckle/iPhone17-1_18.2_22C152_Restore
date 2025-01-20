@interface SKUIReviewInAppRatingButtonViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setEnabled:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SKUIReviewInAppRatingButtonViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIReviewInAppRatingButtonViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIReviewInAppRatingButtonViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIReviewInAppRatingButtonViewController", @"isEnabled", "B", 0);
  [v3 validateClass:@"SKUIReviewInAppRatingButtonViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIReviewInAppRatingButtonViewController", @"setEnabled:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)SKUIReviewInAppRatingButtonViewControllerAccessibility;
  [(SKUIReviewInAppRatingButtonViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  char v7 = 0;
  objc_opt_class();
  id v3 = [(SKUIReviewInAppRatingButtonViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityTraits];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __100__SKUIReviewInAppRatingButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_2650AB988;
  v6[4] = self;
  v6[5] = v5;
  [v4 _setAccessibilityTraitsBlock:v6];
}

uint64_t __100__SKUIReviewInAppRatingButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1CEE8] | *(void *)(a1 + 40);
  int v2 = [*(id *)(a1 + 32) safeBoolForKey:@"isEnabled"];
  uint64_t v3 = *MEMORY[0x263F1CF20];
  if (v2) {
    uint64_t v3 = 0;
  }
  return v1 | v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIReviewInAppRatingButtonViewControllerAccessibility;
  [(SKUIReviewInAppRatingButtonViewControllerAccessibility *)&v3 viewDidLoad];
  [(SKUIReviewInAppRatingButtonViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIReviewInAppRatingButtonViewControllerAccessibility;
  [(SKUIReviewInAppRatingButtonViewControllerAccessibility *)&v4 setEnabled:a3];
  [(SKUIReviewInAppRatingButtonViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end