@interface GKChallengeDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityChallengeDetailElements;
- (id)_axElementsOfView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAccessibilityChallengeDetailElements:(id)a3;
- (void)updateIconViewWithSubView:(id)a3;
@end

@implementation GKChallengeDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKChallengeDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityChallengeDetailElements
{
}

- (void)_setAccessibilityChallengeDetailElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"iconView", "@", 0);
  [v3 validateClass:@"GKChallengeDetailViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"categoryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"descriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"playerAvatarView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"challengeByNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"shouldShowPlay", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"playNowButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"declineButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKChallengeDetailViewController", @"updateIconViewWithSubView:", "v", "@", 0);
  [v3 validateClass:@"GameCenterUI.AchievementBadge"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementBadge", @"accessibilityIsAchievementLocked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementBadge", @"accessibilityIsAchievementCompleted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementBadge", @"accessibilityIsAchievementInProgress", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementBadge", @"accessibilityProgress", "d", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v25.receiver = self;
  v25.super_class = (Class)GKChallengeDetailViewControllerAccessibility;
  [(GKChallengeDetailViewControllerAccessibility *)&v25 _accessibilityLoadAccessibilityInformation];
  id v3 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"iconView"];
  v4 = [v3 _accessibilityDescendantOfType:MEMORY[0x24564DC30](@"GameCenterUI.AchievementBadge")];
  [v3 _setIsAccessibilityElementBlock:&__block_literal_global_3];
  int v5 = [v4 safeBoolForKey:@"accessibilityIsAchievementLocked"];
  int v6 = [v4 safeBoolForKey:@"accessibilityIsAchievementCompleted"];
  int v7 = [v4 safeBoolForKey:@"accessibilityIsAchievementInProgress"];
  [v4 safeCGFloatForKey:@"accessibilityProgress"];
  if (v5)
  {
    v9 = @"LOCKED";
LABEL_5:
    v10 = AXGameCenterUIFrameworkLocString(v9);
    v11 = __UIAXStringForVariables();
    goto LABEL_6;
  }
  if (v6)
  {
    v9 = @"COMPLETED";
    goto LABEL_5;
  }
  if (!v7)
  {
    v11 = 0;
    goto LABEL_7;
  }
  double v15 = v8;
  v10 = AXGameCenterUIFrameworkLocString(@"IN_PROGRESS");
  float v16 = v15 / 100.0;
  v17 = MEMORY[0x24564DC50](0, v16);
  v11 = __UIAXStringForVariables();

LABEL_6:
LABEL_7:
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v23[3] = &unk_265122BE8;
  id v12 = v11;
  id v24 = v12;
  [v3 _setAccessibilityLabelBlock:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v21[3] = &unk_265122C10;
  id v13 = v4;
  id v22 = v13;
  [v3 _setAccessibilityPathBlock:v21];
  objc_initWeak(&location, self);
  v14 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"view"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v18[3] = &unk_265122C38;
  objc_copyWeak(&v19, &location);
  [v14 _setAccessibilityElementsBlock:v18];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

uint64_t __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

id __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityCirclePathBasedOnBoundsWidth];
}

id __90__GKChallengeDetailViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _axElementsOfView];

  return v2;
}

- (id)_axElementsOfView
{
  id v3 = [(GKChallengeDetailViewControllerAccessibility *)self _accessibilityChallengeDetailElements];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    v20 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"iconView"];
    objc_msgSend(v3, "axSafelyAddObject:");
    v4 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"categoryLabel"];
    int v5 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
    int v6 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"descriptionLabel"];
    id v19 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);
    int v7 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:self representedElements:v19];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke;
    v23[3] = &unk_265122C60;
    id v18 = v4;
    id v24 = v18;
    id v8 = v5;
    id v25 = v8;
    id v9 = v6;
    id v26 = v9;
    [v7 _setAccessibilityLabelBlock:v23];
    [v7 _setIsAccessibilityElementBlock:&__block_literal_global_347];
    [v3 axSafelyAddObject:v7];
    v10 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"playerAvatarView"];
    v11 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"challengeByNameLabel"];
    id v12 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v10, v11);
    id v13 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:self representedElements:v12];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke_3;
    v21[3] = &unk_265122BE8;
    id v22 = v11;
    id v14 = v11;
    [v13 _setAccessibilityLabelBlock:v21];
    [v13 _setIsAccessibilityElementBlock:&__block_literal_global_349];
    [v3 axSafelyAddObject:v13];
    if ([(GKChallengeDetailViewControllerAccessibility *)self safeBoolForKey:@"shouldShowPlay"])
    {
      double v15 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"playNowButton"];
      [v3 axSafelyAddObject:v15];
    }
    float v16 = [(GKChallengeDetailViewControllerAccessibility *)self safeValueForKey:@"declineButton"];
    [v3 axSafelyAddObject:v16];
    [(GKChallengeDetailViewControllerAccessibility *)self _setAccessibilityChallengeDetailElements:v3];
  }

  return v3;
}

id __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke(id *a1)
{
  v2 = [a1[4] accessibilityLabel];
  id v3 = [a1[5] accessibilityLabel];
  int v6 = [a1[6] accessibilityLabel];
  v4 = __UIAXStringForVariables();

  return v4;
}

uint64_t __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke_2()
{
  return 1;
}

id __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) accessibilityLabel];
  v2 = __UIAXStringForVariables();

  return v2;
}

uint64_t __65__GKChallengeDetailViewControllerAccessibility__axElementsOfView__block_invoke_4()
{
  return 1;
}

- (void)updateIconViewWithSubView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKChallengeDetailViewControllerAccessibility;
  [(GKChallengeDetailViewControllerAccessibility *)&v4 updateIconViewWithSubView:a3];
  [(GKChallengeDetailViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end