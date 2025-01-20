@interface SocialProfileButtonUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SocialProfileButtonUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SocialProfileButtonUIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicUI.SocialProfileButtonUIView", @"layoutSubviews", "v", 0);
  [v3 validateClass:@"MusicUI.SocialProfileButtonUIView" hasSwiftField:@"presenter" withSwiftType:"SocialProfilePresenter"];
  [v3 validateClass:@"MusicUI.SocialProfileButtonUIView" hasSwiftField:@"notificationBadgeView" withSwiftType:"NotificationBadgeView"];
  [v3 validateClass:@"MusicUI.SocialProfilePresenter" hasSwiftField:@"userSocialProfileCoordinator" withSwiftType:"UserSocialProfileCoordinator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPModelSocialPerson", @"name", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)SocialProfileButtonUIViewAccessibility;
  [(SocialProfileButtonUIViewAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  [(SocialProfileButtonUIViewAccessibility *)self setIsAccessibilityElement:1];
  [(SocialProfileButtonUIViewAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__SocialProfileButtonUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_26513E688;
  objc_copyWeak(&v10, &location);
  [(SocialProfileButtonUIViewAccessibility *)self setAccessibilityLabelBlock:v9];
  id v3 = [(SocialProfileButtonUIViewAccessibility *)self safeSwiftValueForKey:@"notificationBadgeView"];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 safeSwiftIntForKey:@"value"];
    if (v5 >= 1)
    {
      v6 = NSString;
      v7 = accessibilityMusicLocalizedString(@"FOLLOW_REQUEST");
      v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5);
      [(SocialProfileButtonUIViewAccessibility *)self setAccessibilityValue:v8];
    }
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __84__SocialProfileButtonUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeSwiftValueForKey:@"presenter"];
  id v3 = [v2 safeSwiftValueForKey:@"userSocialProfileCoordinator"];
  v4 = [v3 safeSwiftValueForKey:@"_userSocialProfile"];
  uint64_t v5 = NSString;
  v6 = accessibilityMusicUILocalizedString(@"account");
  v7 = [v4 safeStringForKey:@"name"];
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  return v8;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SocialProfileButtonUIViewAccessibility;
  [(SocialProfileButtonUIViewAccessibility *)&v3 layoutSubviews];
  [(SocialProfileButtonUIViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end