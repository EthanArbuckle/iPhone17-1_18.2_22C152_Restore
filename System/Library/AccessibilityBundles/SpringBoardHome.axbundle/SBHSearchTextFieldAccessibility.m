@interface SBHSearchTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (unint64_t)accessibilityTraits;
- (void)updateVisualStyling;
@end

@implementation SBHSearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHSearchTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF30];
  v4.receiver = self;
  v4.super_class = (Class)SBHSearchTextFieldAccessibility;
  return [(SBHSearchTextFieldAccessibility *)&v4 accessibilityTraits] | v2;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_super v4 = AXSBIconControllerSharedInstance();
  v5 = v4;
  if (a3 == 1 && [v4 _axIsShowingAppLibrary])
  {
    [v5 _axHideAppLibrary];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  v3 = AXSBIconControllerSharedInstance();
  if ([v3 _axIsShowingAppLibrary])
  {
    [v3 _axHideAppLibrary];
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHSearchTextFieldAccessibility;
    BOOL v4 = [(SBHSearchTextFieldAccessibility *)&v6 accessibilityPerformEscape];
  }

  return v4;
}

- (void)updateVisualStyling
{
  v3.receiver = self;
  v3.super_class = (Class)SBHSearchTextFieldAccessibility;
  [(SBHSearchTextFieldAccessibility *)&v3 updateVisualStyling];
  if ([(SBHSearchTextFieldAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    if ([(SBHSearchTextFieldAccessibility *)self _accessibilityViewIsVisible])UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], self); {
  }
    }
}

@end