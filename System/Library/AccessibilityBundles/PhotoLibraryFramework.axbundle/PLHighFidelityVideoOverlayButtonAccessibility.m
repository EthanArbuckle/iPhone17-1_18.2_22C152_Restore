@interface PLHighFidelityVideoOverlayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (PLHighFidelityVideoOverlayButtonAccessibility)initWithStyle:(int64_t)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_playButtonTapped:(id)a3;
@end

@implementation PLHighFidelityVideoOverlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLHighFidelityVideoOverlayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLHighFidelityVideoOverlayButton" hasInstanceVariable:@"_button" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLHighFidelityVideoOverlayButton", @"initWithStyle:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLHighFidelityVideoOverlayButton", @"_playButtonTapped:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PLHighFidelityVideoOverlayButtonAccessibility;
  [(PLHighFidelityVideoOverlayButtonAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PLHighFidelityVideoOverlayButtonAccessibility *)self safeValueForKey:@"_button"];
  [v3 setIsAccessibilityElement:0];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"play.video.button.txt");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PLHighFidelityVideoOverlayButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PLHighFidelityVideoOverlayButtonAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF40];
}

- (PLHighFidelityVideoOverlayButtonAccessibility)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLHighFidelityVideoOverlayButtonAccessibility;
  objc_super v3 = [(PLHighFidelityVideoOverlayButtonAccessibility *)&v5 initWithStyle:a3];
  [(PLHighFidelityVideoOverlayButtonAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)_playButtonTapped:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PLHighFidelityVideoOverlayButtonAccessibility;
  [(PLHighFidelityVideoOverlayButtonAccessibility *)&v3 _playButtonTapped:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end