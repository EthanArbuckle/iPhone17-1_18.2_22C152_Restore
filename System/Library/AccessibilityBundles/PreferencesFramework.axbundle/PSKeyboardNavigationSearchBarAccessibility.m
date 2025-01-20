@interface PSKeyboardNavigationSearchBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (id)keyCommands;
@end

@implementation PSKeyboardNavigationSearchBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSKeyboardNavigationSearchBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (id)keyCommands
{
  if ([(PSKeyboardNavigationSearchBarAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    v3 = [(PSKeyboardNavigationSearchBarAccessibility *)self _accessibilityKeyCommands];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PSKeyboardNavigationSearchBarAccessibility;
    v3 = [(PSKeyboardNavigationSearchBarAccessibility *)&v5 keyCommands];
  }

  return v3;
}

@end