@interface SFUnifiedTabBarItemTitleContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsMinimized;
- (BOOL)_axShowingLockIcon;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityNavBarParent;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation SFUnifiedTabBarItemTitleContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFUnifiedTabBarItemTitleContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFCapsuleNavigationBar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFCapsuleNavigationBar", @"isMinimized", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemTitleContainerView", @"showsLockIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemTitleContainerView", @"securityAnnotation", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemTitleContainerView", @"showsPrivateAnnotation", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemTitleContainerView", @"_showsPlaceholder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemTitleContainerView", @"showsSearchIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemTitleContainerView", @"showsSearchField", "B", 0);
  [v3 validateClass:@"SFUnifiedTabBarItemTitleContainerView" hasInstanceVariable:@"_titleLabel" withType:"SFURLLabel"];
  [v3 validateClass:@"SFUnifiedTabBarItemTitleContainerView" hasInstanceVariable:@"_lockView" withType:"UIImageView"];
}

- (BOOL)_axShowingLockIcon
{
  if ([(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self safeBoolForKey:@"_showsLockIcon"])return 1; {
  v4 = [(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self safeUIViewForKey:@"_lockView"];
  }
  char v5 = [v4 _accessibilityViewIsVisible];

  return v5;
}

- (id)accessibilityValue
{
  if ([(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self _axShowingLockIcon])
  {
    id v3 = accessibilitySafariServicesLocalizedString(@"secure.icon");
  }
  else
  {
    id v3 = 0;
  }
  if ([(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self safeIntegerForKey:@"securityAnnotation"] == 1)
  {
    v4 = accessibilitySafariServicesLocalizedString(@"not.secure.icon");
  }
  else
  {
    v4 = 0;
  }
  if ([(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self safeBoolForKey:@"showsPrivateAnnotation"])
  {
    char v5 = accessibilitySafariServicesLocalizedString(@"private.icon");
  }
  else
  {
    char v5 = 0;
  }
  v6 = [(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  v7 = [v6 accessibilityLabel];

  if ([(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self safeBoolForKey:@"_showsPlaceholder"])
  {
    v8 = [MEMORY[0x263F21660] axAttributedStringWithString:v7];
    [v8 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21820]];

    v7 = v8;
  }
  v9 = __UIAXStringForVariables();

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return [(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self safeBoolForKey:@"showsSearchField"] ^ 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)SFUnifiedTabBarItemTitleContainerViewAccessibility;
  unint64_t v3 = [(SFUnifiedTabBarItemTitleContainerViewAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self _accessibilityIsMinimized];
  uint64_t v5 = *MEMORY[0x263F81408];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityLabel
{
  return accessibilityMobileSafariLocalizedString(@"address.text");
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self _accessibilityIsMinimized])
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_accessibilityIsMinimized
{
  v2 = [(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self _accessibilityNavBarParent];
  char v3 = [v2 safeBoolForKey:@"isMinimized"];

  return v3;
}

- (id)_accessibilityNavBarParent
{
  uint64_t v3 = MEMORY[0x245655C80](@"SFCapsuleNavigationBar", a2);

  return (id)[(SFUnifiedTabBarItemTitleContainerViewAccessibility *)self _accessibilityAncestorIsKindOf:v3];
}

@end