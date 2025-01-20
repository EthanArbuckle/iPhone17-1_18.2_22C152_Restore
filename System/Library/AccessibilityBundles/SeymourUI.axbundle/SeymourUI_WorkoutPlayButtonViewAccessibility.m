@interface SeymourUI_WorkoutPlayButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SeymourUI_WorkoutPlayButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WorkoutPlayButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"play.button");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_WorkoutPlayButtonViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SeymourUI_WorkoutPlayButtonViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF40];
}

@end