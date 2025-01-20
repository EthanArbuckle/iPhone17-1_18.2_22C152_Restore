@interface AudioConferenceControlCenterModuleEffectControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation AudioConferenceControlCenterModuleEffectControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AudioConferenceControlCenterModule.EffectControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideoConferenceControlCenterModule.EffectControl" hasSwiftField:@"isExpanded" withSwiftType:"Bool"];
  [v3 validateClass:@"VideoConferenceControlCenterModule.EffectControl" hasSwiftField:@"buttonTitle" withSwiftType:"String"];
}

- (BOOL)isAccessibilityElement
{
  return [(AudioConferenceControlCenterModuleEffectControlAccessibility *)self safeSwiftBoolForKey:@"isExpanded"] ^ 1;
}

- (id)accessibilityLabel
{
  id v3 = [(AudioConferenceControlCenterModuleEffectControlAccessibility *)self safeSwiftStringForKey:@"buttonTitle"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AudioConferenceControlCenterModuleEffectControlAccessibility;
    id v5 = [(AudioConferenceControlCenterModuleEffectControlAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

@end