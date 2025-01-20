@interface SBFolderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)automationElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SBFolderViewAccessibility

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBFolderViewAccessibility;
  [(SBFolderViewAccessibility *)&v3 layoutSubviews];
  [(SBFolderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBFolderViewAccessibility;
  [(SBFolderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(SBFolderViewAccessibility *)self safeValueForKey:@"scalingView"];
  [v3 setAccessibilityIdentifier:@"SBFolderScalingView"];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBFolderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"folder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"pageControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"scalingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"_titleTextField", "@", 0);
  [v3 validateClass:@"SBHIconManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"hasOpenFolder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"closingFolder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"closeFolderAnimated:withCompletion:", "v", "B", "@?", 0);
}

- (id)automationElements
{
  id v3 = [(SBFolderViewAccessibility *)self safeValueForKey:@"folder"];
  objc_super v4 = [v3 automationElements];

  v5 = [(SBFolderViewAccessibility *)self safeUIViewForKey:@"pageControl"];
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  v7 = [(SBFolderViewAccessibility *)self safeUIViewForKey:@"_titleTextField"];
  [v6 axSafelyAddObject:v7];

  [v6 axSafelyAddObjectsFromArray:v4];
  if ([v5 _accessibilityViewIsVisible]) {
    [v6 axSafelyAddObject:v5];
  }

  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = AXSBHIconManagerFromSharedIconController();
  if ([v2 safeBoolForKey:@"hasOpenFolder"])
  {
    id v6 = v2;
    AXPerformSafeBlock();
    id v3 = [v6 safeValueForKey:@"closingFolder"];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __55__SBFolderViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeFolderAnimated:1 withCompletion:0];
}

@end