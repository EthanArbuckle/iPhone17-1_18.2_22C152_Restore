@interface CapsuleTabGroupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScrollable;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription;
- (BOOL)_axIsInteractionEnabled;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilityAllTabGroups;
- (id)_accessibilityCapsuleCollectionView;
- (id)accessibilityLabel;
- (int64_t)_accessibilityIndexOfSelfIn:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CapsuleTabGroupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFCapsuleTabGroupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFCapsuleTabGroupView" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"SFCapsuleTabGroupView" hasSwiftField:@"isSelected" withSwiftType:"Bool"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MobileSafari.ScrollingCapsuleCollectionView", @"accessibilityTapItemAtIndex:", "v", "q", 0);
  [v3 validateClass:@"SFScrollingCapsuleCollectionViewLayout" hasSwiftField:@"content" withSwiftType:"Content"];
  [v3 validateSwiftStruct:@"MobileSafari.ScrollingCapsuleCollectionView[class].Content" hasSwiftField:@"items" withSwiftType:"Array<Item>"];
  [v3 validateSwiftStruct:@"MobileSafari.ScrollingCapsuleCollectionView[class].Item" hasSwiftField:@"isInteractivelyInserted" withSwiftType:"Bool"];
  [v3 validateSwiftStruct:@"MobileSafari.ScrollingCapsuleCollectionView[class].Item" hasSwiftField:@"id" withSwiftType:"UUID"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UILabel", @"text", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CapsuleTabGroupViewAccessibility;
  [(CapsuleTabGroupViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CapsuleTabGroupViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  BOOL v3 = [(CapsuleTabGroupViewAccessibility *)self _axIsInteractionEnabled];
  if (v3)
  {
    objc_super v4 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityAllTabGroups];
    [(CapsuleTabGroupViewAccessibility *)self _accessibilityIndexOfSelfIn:v4];
    v7 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityCapsuleCollectionView];
    id v5 = v7;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
  }
  return v3;
}

uint64_t __57__CapsuleTabGroupViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityTapItemAtIndex:*(void *)(a1 + 40)];
}

- (BOOL)_accessibilityScrollToVisible
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)CapsuleTabGroupViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(CapsuleTabGroupViewAccessibility *)&v10 accessibilityTraits];
  int v4 = [(CapsuleTabGroupViewAccessibility *)self safeSwiftBoolForKey:@"isSelected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v3 | v5;
  BOOL v7 = [(CapsuleTabGroupViewAccessibility *)self _axIsInteractionEnabled];
  uint64_t v8 = *MEMORY[0x263F1CF20];
  if (v7) {
    uint64_t v8 = 0;
  }
  return v6 | v8;
}

- (id)accessibilityLabel
{
  v2 = [(CapsuleTabGroupViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  unint64_t v3 = [v2 safeValueForKey:@"text"];
  unint64_t v6 = accessibilityMobileSafariLocalizedString(@"tab.group");
  int v4 = __UIAXStringForVariables();

  return v4;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (![(CapsuleTabGroupViewAccessibility *)self _axIsInteractionEnabled]) {
    return 0;
  }
  uint64_t v5 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityCapsuleCollectionView];
  unint64_t v6 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityAllTabGroups];
  int64_t v7 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityIndexOfSelfIn:v6];
  uint64_t v8 = [v5 safeSwiftValueForKey:@"$__lazy_storage_$_scrollView"];
  if (v8)
  {
    BOOL v9 = 0;
    if ([(CapsuleTabGroupViewAccessibility *)self safeSwiftBoolForKey:@"isSelected"]&& v7 != -1)
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = __Block_byref_object_copy__0;
      v18[4] = __Block_byref_object_dispose__0;
      objc_super v10 = [v6 objectAtIndexedSubscript:v7];
      v11 = [v10 safeSwiftValueForKey:@"id"];
      id v19 = [v11 safeStringForKey:@"UUIDString"];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __56__CapsuleTabGroupViewAccessibility_accessibilityScroll___block_invoke;
      v17[3] = &unk_265135DA8;
      v17[4] = v18;
      uint64_t v12 = [v6 indexOfObjectPassingTest:v17];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL
        || (unint64_t)(a3 - 1) > 5
        || (uint64_t v13 = v12 + qword_2422F7678[a3 - 1], v13 < 0)
        || v13 >= (unint64_t)[v6 count])
      {
        BOOL v9 = 0;
      }
      else
      {
        id v16 = v5;
        AXPerformSafeBlock();
        id v15 = v16;
        AXPerformBlockOnMainThreadAfterDelay();

        BOOL v9 = 1;
      }
      _Block_object_dispose(v18, 8);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __56__CapsuleTabGroupViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 safeSwiftValueForKey:@"id"];
  int v4 = [v3 safeStringForKey:@"UUIDString"];

  uint64_t v5 = [v4 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  return v5;
}

uint64_t __56__CapsuleTabGroupViewAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityTapItemAtIndex:*(void *)(a1 + 40)];
}

void __56__CapsuleTabGroupViewAccessibility_accessibilityScroll___block_invoke_3(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) _accessibilityAccessibleDescendants];
  uint64_t v2 = [v12 indexOfObject:*(void *)(a1 + 40)];
  if ((unint64_t)[v12 count] < 2)
  {
    if ([v12 count] != 1) {
      goto LABEL_12;
    }
    UIAccessibilityNotifications v8 = *MEMORY[0x263F1CE68];
    BOOL v9 = v12;
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  BOOL v5 = v3 <= v4;
  if (v3 >= v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = -1;
  }
  if (!v5) {
    uint64_t v6 = 1;
  }
  uint64_t v7 = v6 + v2;
  if (v6 + v2 < (unint64_t)[v12 count])
  {
    UIAccessibilityNotifications v8 = *MEMORY[0x263F1CE68];
    BOOL v9 = v12;
    uint64_t v10 = v7;
LABEL_11:
    v11 = [v9 objectAtIndexedSubscript:v10];
    UIAccessibilityPostNotification(v8, v11);
  }
LABEL_12:
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  return 1;
}

- (_NSRange)accessibilityRowRange
{
  uint64_t v3 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityAllTabGroups];
  unint64_t v4 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityIndexOfSelfIn:v3];
  if (v4 == -1 || (NSUInteger v5 = v4, v4 >= [v3 count]))
  {
    NSUInteger v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v3 count];
  }

  NSUInteger v7 = v5;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)_accessibilityAllTabGroups
{
  uint64_t v2 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityCapsuleCollectionView];
  uint64_t v3 = [v2 safeSwiftValueForKey:@"$__lazy_storage_$_layout"];
  unint64_t v4 = [v3 safeSwiftValueForKey:@"content"];
  NSUInteger v5 = [v4 safeSwiftValueForKey:@"items"];

  uint64_t v6 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);

  return v6;
}

uint64_t __62__CapsuleTabGroupViewAccessibility__accessibilityAllTabGroups__block_invoke(uint64_t a1, void *a2)
{
  return [a2 safeSwiftBoolForKey:@"isInteractivelyInserted"] ^ 1;
}

- (id)_accessibilityCapsuleCollectionView
{
  uint64_t v2 = self;
  if (v2)
  {
    uint64_t v3 = v2;
    do
    {
      MEMORY[0x245655C80](@"MobileSafari.ScrollingCapsuleCollectionView");
      if (objc_opt_isKindOfClass()) {
        unint64_t v4 = v3;
      }
      else {
        unint64_t v4 = 0;
      }
      NSUInteger v5 = [(CapsuleTabGroupViewAccessibility *)v3 superview];

      if (v4) {
        break;
      }
      uint64_t v3 = v5;
    }
    while (v5);
  }
  else
  {
    NSUInteger v5 = 0;
    unint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_accessibilityIndexOfSelfIn:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(CapsuleTabGroupViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  uint64_t v6 = [v5 safeValueForKey:@"text"];

  if (v6 && [v4 count])
  {
    int64_t v7 = 0;
    while (1)
    {
      NSUInteger v8 = [v4 objectAtIndexedSubscript:v7];
      BOOL v9 = [v8 safeSwiftStringForKey:@"title"];
      char v10 = [v9 isEqualToString:v6];

      if (v10) {
        break;
      }
      if (++v7 >= (unint64_t)[v4 count]) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    int64_t v7 = -1;
  }

  return v7;
}

- (BOOL)_accessibilityIsScrollable
{
  return 1;
}

- (BOOL)_axIsInteractionEnabled
{
  uint64_t v2 = [(CapsuleTabGroupViewAccessibility *)self _accessibilityCapsuleCollectionView];
  objc_opt_class();
  uint64_t v3 = [v2 safeSwiftValueForKey:@"scrollView"];
  id v4 = __UIAccessibilityCastAsClass();

  LOBYTE(v3) = [v4 isUserInteractionEnabled];
  return (char)v3;
}

@end