@interface PlayerProfileHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PlayerProfileHeaderViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PlayerProfileHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.PlayerProfileHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.PlayerProfileHeaderView", @"accessibilityFriendStatusLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.PlayerProfileHeaderView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PlayerProfileHeaderViewAccessibility;
  [(PlayerProfileHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PlayerProfileHeaderViewAccessibility *)self safeValueForKey:@"accessibilityFriendStatusLabel"];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_7];
}

id __82__PlayerProfileHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return AXGameCenterUIFrameworkLocString(@"FRIEND");
}

- (PlayerProfileHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PlayerProfileHeaderViewAccessibility;
  id v3 = -[PlayerProfileHeaderViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PlayerProfileHeaderViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end