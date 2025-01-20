@interface QLOverlayPlayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (QLOverlayPlayButtonAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_playButtonTapped:(id)a3;
@end

@implementation QLOverlayPlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLOverlayPlayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLOverlayPlayButton", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLOverlayPlayButton", @"_playButtonTapped:", "v", "@", 0);
  [v3 validateClass:@"QLOverlayPlayButton" hasInstanceVariable:@"_button" withType:"UIButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)QLOverlayPlayButtonAccessibility;
  [(QLOverlayPlayButtonAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(QLOverlayPlayButtonAccessibility *)self safeValueForKey:@"_button"];
  v4 = accessibilityLocalizedString(@"play.button");
  [v3 setAccessibilityLabel:v4];
}

- (QLOverlayPlayButtonAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLOverlayPlayButtonAccessibility;
  id v3 = -[QLOverlayPlayButtonAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(QLOverlayPlayButtonAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

- (void)_playButtonTapped:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)QLOverlayPlayButtonAccessibility;
  [(QLOverlayPlayButtonAccessibility *)&v3 _playButtonTapped:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end