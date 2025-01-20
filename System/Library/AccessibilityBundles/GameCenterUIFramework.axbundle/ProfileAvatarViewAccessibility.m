@interface ProfileAvatarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsEditable;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation ProfileAvatarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.ProfileAvatarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.ProfileAvatarView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.ProfileAvatarView", @"accessibilityIsEditable", "B", 0);
  [v3 validateClass:@"GameCenterUI.PlayerProfileHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.PlayerProfileHeaderView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.ProfileAvatarView", @"accessibilityRoundedEditButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.ProfileAvatarView", @"accessibilityProfileEditButtonBackground", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.ProfileAvatarView", @"accessibilityProfileEditLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_axIsEditable
{
  return [(ProfileAvatarViewAccessibility *)self safeBoolForKey:@"accessibilityIsEditable"];
}

- (unint64_t)accessibilityTraits
{
  if ([(ProfileAvatarViewAccessibility *)self _axIsEditable]) {
    return *MEMORY[0x263F1CEE8];
  }
  v4.receiver = self;
  v4.super_class = (Class)ProfileAvatarViewAccessibility;
  return [(ProfileAvatarViewAccessibility *)&v4 accessibilityTraits];
}

- (id)accessibilityLabel
{
  v2 = [(ProfileAvatarViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x24564DC30](@"GameCenterUI.PlayerProfileHeaderView", a2)];
  id v3 = [v2 safeValueForKey:@"accessibilityTitleLabel"];
  objc_super v4 = NSString;
  v5 = AXGameCenterUIFrameworkLocString(@"PLAYER_PHOTO_BUTTON_OF");
  v6 = [v3 accessibilityLabel];
  v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

  return v7;
}

- (id)accessibilityHint
{
  if ([(ProfileAvatarViewAccessibility *)self _axIsEditable])
  {
    id v3 = AXGameCenterUIFrameworkLocString(@"PLAYER_PHOTO_BUTTON_HINT");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ProfileAvatarViewAccessibility;
    id v3 = [(ProfileAvatarViewAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2 = 0x7FFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)automationElements
{
  v12.receiver = self;
  v12.super_class = (Class)ProfileAvatarViewAccessibility;
  NSUInteger v3 = [(ProfileAvatarViewAccessibility *)&v12 automationElements];
  objc_super v4 = (void *)[v3 mutableCopy];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  v8 = [(ProfileAvatarViewAccessibility *)self safeValueForKey:@"accessibilityRoundedEditButton"];
  if ([v8 _accessibilityViewIsVisible])
  {
    [v8 _setIsAccessibilityElementBlock:&__block_literal_global_4];
    [v8 _setAccessibilityLabelBlock:&__block_literal_global_311];
    [v8 _setAccessibilityTraitsBlock:&__block_literal_global_317];
    [v7 axSafelyAddObject:v8];
  }
  v9 = [(ProfileAvatarViewAccessibility *)self safeValueForKey:@"accessibilityProfileEditButtonBackground"];
  if ([v9 _accessibilityViewIsVisible])
  {
    v10 = [(ProfileAvatarViewAccessibility *)self safeValueForKey:@"accessibilityProfileEditLabel"];
    [v10 _setIsAccessibilityElementBlock:&__block_literal_global_319];
    [v10 _setAccessibilityLabelBlock:&__block_literal_global_321];
    [v10 _setAccessibilityTraitsBlock:&__block_literal_global_323];
    [v7 axSafelyAddObject:v10];
  }

  return v7;
}

uint64_t __52__ProfileAvatarViewAccessibility_automationElements__block_invoke()
{
  return 1;
}

id __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_2()
{
  return AXGameCenterUIFrameworkLocString(@"EDIT_PLAYER_PHOTO");
}

uint64_t __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_3()
{
  return *MEMORY[0x263F1CEE8];
}

uint64_t __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_4()
{
  return 1;
}

id __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_5()
{
  return AXGameCenterUIFrameworkLocString(@"EDIT_PLAYER_PHOTO");
}

uint64_t __52__ProfileAvatarViewAccessibility_automationElements__block_invoke_6()
{
  return *MEMORY[0x263F1CEE8];
}

@end