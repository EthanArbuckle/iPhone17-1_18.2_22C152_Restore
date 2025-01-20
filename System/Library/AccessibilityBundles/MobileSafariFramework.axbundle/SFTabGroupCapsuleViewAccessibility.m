@interface SFTabGroupCapsuleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAllTabGroups;
- (id)_accessibilityCapsuleCollectionView;
- (id)_accessibilityLabelFrom:(id)a3;
- (id)_accessibilityScrollStatusFrom:(id)a3;
- (id)_accessibilityTabGroupSwitcherViewControllerFrom:(id)a3;
- (id)accessibilityLabel;
- (int64_t)_accessibilityIndexOfSelfIn:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFTabGroupCapsuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFTabGroupCapsuleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFTabGroupCapsuleView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFTabGroupCapsuleView", @"title", "@", 0);
  [v3 validateClass:@"SFCapsuleCollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFCapsuleCollectionView", @"delegate", "@", 0);
  [v3 validateClass:@"WBTabGroup"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBTabGroup", @"uuid", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBTabGroup", @"displayTitle", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SFTabGroupCapsuleViewAccessibility;
  [(SFTabGroupCapsuleViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SFTabGroupCapsuleViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SFTabGroupCapsuleViewAccessibility *)self _accessibilityAllTabGroups];
  objc_super v4 = [(SFTabGroupCapsuleViewAccessibility *)self _accessibilityLabelFrom:v3];

  return v4;
}

- (id)_accessibilityLabelFrom:(id)a3
{
  objc_super v4 = [(SFTabGroupCapsuleViewAccessibility *)self _accessibilityScrollStatusFrom:a3];
  v5 = [(SFTabGroupCapsuleViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  v6 = [v5 accessibilityLabel];
  if (v4)
  {
    v7 = __UIAXStringForVariables();
  }
  else
  {
    v9 = accessibilityMobileSafariLocalizedString(@"tab.group");
    v7 = __UIAXStringForVariables();
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SFTabGroupCapsuleViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SFTabGroupCapsuleViewAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilityCapsuleCollectionView
{
  v2 = self;
  if (v2)
  {
    objc_super v3 = v2;
    do
    {
      MEMORY[0x245655C80](@"SFCapsuleCollectionView");
      if (objc_opt_isKindOfClass()) {
        objc_super v4 = v3;
      }
      else {
        objc_super v4 = 0;
      }
      v5 = [(SFTabGroupCapsuleViewAccessibility *)v3 superview];

      if (v4) {
        break;
      }
      objc_super v3 = v5;
    }
    while (v5);
  }
  else
  {
    v5 = 0;
    objc_super v4 = 0;
  }

  return v4;
}

- (id)_accessibilityTabGroupSwitcherViewControllerFrom:(id)a3
{
  objc_super v3 = [a3 safeValueForKey:@"delegate"];
  MEMORY[0x245655C80](@"TabGroupSwitcherViewController");
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)_accessibilityIndexOfSelfIn:(id)a3
{
  id v4 = a3;
  v5 = [(SFTabGroupCapsuleViewAccessibility *)self safeStringForKey:@"title"];
  if (v5 && [v4 count])
  {
    int64_t v6 = 0;
    while (1)
    {
      v7 = [v4 objectAtIndexedSubscript:v6];
      v8 = [v7 safeStringForKey:@"displayTitle"];
      char v9 = [v8 isEqualToString:v5];

      if (v9) {
        break;
      }
      if (++v6 >= (unint64_t)[v4 count]) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    int64_t v6 = -1;
  }

  return v6;
}

- (id)_accessibilityAllTabGroups
{
  objc_super v3 = [(SFTabGroupCapsuleViewAccessibility *)self _accessibilityCapsuleCollectionView];
  id v4 = [(SFTabGroupCapsuleViewAccessibility *)self _accessibilityTabGroupSwitcherViewControllerFrom:v3];
  v5 = [v4 safeArrayForKey:@"_tabGroups"];

  return v5;
}

- (id)_accessibilityScrollStatusFrom:(id)a3
{
  id v4 = a3;
  if ([(SFTabGroupCapsuleViewAccessibility *)self _accessibilityIndexOfSelfIn:v4] == -1)
  {
    char v9 = 0;
  }
  else
  {
    v5 = NSString;
    int64_t v6 = accessibilityMobileSafariLocalizedString(@"tab.group");
    v7 = AXFormatInteger();
    [v4 count];
    v8 = AXFormatInteger();
    char v9 = [v5 stringWithFormat:@"%@ %@ of %@", v6, v7, v8];
  }

  return v9;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v5 = [(SFTabGroupCapsuleViewAccessibility *)self _accessibilityCapsuleCollectionView];
  int64_t v6 = [(SFTabGroupCapsuleViewAccessibility *)self _accessibilityTabGroupSwitcherViewControllerFrom:v5];
  v7 = [v6 safeValueForKey:@"_tabController"];
  MEMORY[0x245655C80](@"TabController");
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 safeArrayForKey:@"_tabGroups"];
    char v9 = [v7 safeValueForKey:@"activeTabGroup"];
    uint64_t v10 = [v8 indexOfObject:v9];

    if ((unint64_t)(a3 - 1) > 5
      || (uint64_t v11 = v10 + qword_2422F76D0[a3 - 1], v11 < 0)
      || v11 >= (unint64_t)[v8 count])
    {
      BOOL v14 = 0;
    }
    else
    {
      v12 = [v8 objectAtIndexedSubscript:v11];
      v13 = [v12 safeStringForKey:@"uuid"];

      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      id v16 = v7;
      id v17 = v13;
      id v18 = v6;
      id v19 = v5;
      id v20 = v8;
      AXPerformSafeBlock();
      BOOL v14 = *((unsigned char *)v22 + 24) != 0;

      _Block_object_dispose(&v21, 8);
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __58__SFTabGroupCapsuleViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeValueForKeyPath:@"tabCollectionViewProvider.tabOverview"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__SFTabGroupCapsuleViewAccessibility_accessibilityScroll___block_invoke_2;
  v6[3] = &unk_265136008;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v2 performUpdatesWithoutTabCloseAnimation:v6];

  objc_super v3 = [*(id *)(a1 + 48) capsuleCollectionView:*(void *)(a1 + 56) contentViewForItemAtIndex:*(void *)(a1 + 80)];
  MEMORY[0x245655C80](@"SFTabGroupCapsuleView");
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _AXAssert();
  }
  MEMORY[0x245655C80](@"SFTabGroupCapsuleView");
  if (objc_opt_isKindOfClass())
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v3);
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE30];
    v5 = [v3 _accessibilityLabelFrom:*(void *)(a1 + 64)];
    UIAccessibilityPostNotification(v4, v5);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
}

uint64_t __58__SFTabGroupCapsuleViewAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActiveTabGroupUUID:*(void *)(a1 + 40)];
}

@end