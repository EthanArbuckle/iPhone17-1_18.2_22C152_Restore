@interface VideosExtrasLockupElementViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityButtonifyArtworkView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation VideosExtrasLockupElementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosExtrasLockupElementViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosExtrasLockupElementViewController" hasInstanceVariable:@"_artworkContainerView" withType:"VideosExtrasConstrainedArtworkContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosExtrasConstrainedArtworkContainerView", @"artworkView", "@", 0);
  [v3 validateClass:@"VideosExtrasLockupElementViewController" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"VideosExtrasLockupElementViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityButtonifyArtworkView
{
  id v3 = [(VideosExtrasLockupElementViewControllerAccessibility *)self safeValueForKeyPath:@"_artworkContainerView.artworkView"];
  [v3 setIsAccessibilityElement:1];
  objc_opt_class();
  v4 = [(VideosExtrasLockupElementViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 accessibilityLabel];

  if (v6)
  {
    v7 = NSString;
    v8 = accessibilityLocalizedString(@"play.extra.format");
    v9 = objc_msgSend(v7, "stringWithFormat:", v8, v6);
  }
  else
  {
    v9 = accessibilityLocalizedString(@"play.extra.fallback");
  }
  [v3 setAccessibilityLabel:v9];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasLockupElementViewControllerAccessibility;
  [(VideosExtrasLockupElementViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(VideosExtrasLockupElementViewControllerAccessibility *)self _accessibilityButtonifyArtworkView];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasLockupElementViewControllerAccessibility;
  [(VideosExtrasLockupElementViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(VideosExtrasLockupElementViewControllerAccessibility *)self _accessibilityButtonifyArtworkView];
}

@end