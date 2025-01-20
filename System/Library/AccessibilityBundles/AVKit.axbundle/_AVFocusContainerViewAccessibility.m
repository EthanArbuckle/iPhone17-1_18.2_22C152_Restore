@interface _AVFocusContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt;
- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor;
@end

@implementation _AVFocusContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_AVFocusContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt
{
  return 1;
}

- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor
{
  v3 = [(_AVFocusContainerViewAccessibility *)self _accessibilityViewController];
  NSClassFromString(&cfstr_Avunifiedplaye_1.isa);
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_AVFocusContainerViewAccessibility;
    BOOL v4 = [(_AVFocusContainerViewAccessibility *)&v6 _accessibilityShouldIncludeMediaDescriptionsRotor];
  }

  return v4;
}

@end