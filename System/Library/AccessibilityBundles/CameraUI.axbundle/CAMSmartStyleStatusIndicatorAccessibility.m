@interface CAMSmartStyleStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
@end

@implementation CAMSmartStyleStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSmartStyleStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSmartStyleStatusIndicator", @"isActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSmartStyleStatusIndicator", @"smartStyle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSmartStyle", @"presetType", "q", 0);
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(CAMSmartStyleStatusIndicatorAccessibility *)self safeBoolForKey:@"isActive"])return 1; {
  else
  }
    return 2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUI3LocalizedString(@"smart.style.button");
}

- (id)accessibilityValue
{
  v2 = [(CAMSmartStyleStatusIndicatorAccessibility *)self safeValueForKey:@"smartStyle"];
  id v3 = accessibilityDescriptionStringForPresetStyle([v2 safeIntegerForKey:@"presetType"]);

  return v3;
}

@end