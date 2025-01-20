@interface SBFolderScrollAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestReverseOrder;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (BOOL)_axIsSearchPillHidden;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_axPageControl;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation SBFolderScrollAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFolderScrollAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFolderScrollAccessoryView" hasProperty:@"pageControl" withType:"@"];
  [v3 validateClass:@"SBFolderScrollAccessoryView" hasProperty:@"auxiliaryView" withType:"@"];
  [v3 validateClass:@"SBIconListPageControl" hasInstanceVariable:@"_delegate" withType:"<SBIconListPageControlDelegate>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"isEditing", "B", 0);
}

- (id)accessibilityLabel
{
  if ([(SBFolderScrollAccessoryViewAccessibility *)self _axIsSearchPillHidden]
    || ([(SBFolderScrollAccessoryViewAccessibility *)self _axPageControl],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 safeValueForKey:@"delegate"],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 safeBoolForKey:@"isEditing"],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFolderScrollAccessoryViewAccessibility;
    v6 = [(SBFolderScrollAccessoryViewAccessibility *)&v8 accessibilityLabel];
  }
  else
  {
    v6 = accessibilityLocalizedString(@"home.search.pill.view.label");
  }

  return v6;
}

- (id)accessibilityIdentifier
{
  if ([(SBFolderScrollAccessoryViewAccessibility *)self _axIsSearchPillHidden])
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFolderScrollAccessoryViewAccessibility;
    id v3 = [(SBFolderScrollAccessoryViewAccessibility *)&v6 accessibilityIdentifier];
  }
  else
  {
    v4 = [(SBFolderScrollAccessoryViewAccessibility *)self safeValueForKey:@"auxiliaryView"];
    id v3 = [v4 accessibilityIdentifier];
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(SBFolderScrollAccessoryViewAccessibility *)self _axIsSearchPillHidden]
    || ([(SBFolderScrollAccessoryViewAccessibility *)self _axPageControl],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 safeValueForKey:@"delegate"],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 safeBoolForKey:@"isEditing"],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    objc_super v6 = [(SBFolderScrollAccessoryViewAccessibility *)self _axPageControl];
    v7 = [v6 accessibilityHint];
  }
  else
  {
    v7 = accessibilityLocalizedString(@"home.search.pill.view.hint");
  }

  return v7;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return ![(SBFolderScrollAccessoryViewAccessibility *)self _axIsSearchPillHidden];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  if ([(SBFolderScrollAccessoryViewAccessibility *)self _axIsSearchPillHidden]) {
    [(SBFolderScrollAccessoryViewAccessibility *)self _axPageControl];
  }
  else {
  id v3 = [(SBFolderScrollAccessoryViewAccessibility *)self safeValueForKey:@"auxiliaryView"];
  }
  [v3 accessibilityFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  double v4 = [(SBFolderScrollAccessoryViewAccessibility *)self _axPageControl];
  LOBYTE(a3) = [v4 accessibilityScroll:a3];

  return a3;
}

- (void)accessibilityIncrement
{
  id v2 = [(SBFolderScrollAccessoryViewAccessibility *)self _axPageControl];
  [v2 accessibilityIncrement];
}

- (void)accessibilityDecrement
{
  id v2 = [(SBFolderScrollAccessoryViewAccessibility *)self _axPageControl];
  [v2 accessibilityDecrement];
}

- (id)accessibilityValue
{
  id v2 = [(SBFolderScrollAccessoryViewAccessibility *)self _axPageControl];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)_axIsSearchPillHidden
{
  id v2 = [(SBFolderScrollAccessoryViewAccessibility *)self safeValueForKey:@"auxiliaryView"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isHidden];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)_axPageControl
{
  return (id)[(SBFolderScrollAccessoryViewAccessibility *)self safeValueForKey:@"pageControl"];
}

@end