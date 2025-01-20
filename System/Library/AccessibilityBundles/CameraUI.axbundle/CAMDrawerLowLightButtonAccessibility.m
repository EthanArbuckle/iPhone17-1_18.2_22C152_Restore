@interface CAMDrawerLowLightButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
@end

@implementation CAMDrawerLowLightButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerLowLightButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"CAMControlDrawerExpandableButton" hasMethod:@"isExpanded" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"CAMControlDrawerCustomButton" conformsToProtocol:@"CAMControlDrawerExpandableButton"];
  [v3 validateClass:@"CAMDrawerLowLightButton" isKindOfClass:@"CAMControlDrawerCustomButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerLowLightButton", @"isOn", "B", 0);
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(CAMDrawerLowLightButtonAccessibility *)self safeBoolForKey:@"isExpanded"])return 1; {
  else
  }
    return 2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"lowlight.button");
}

- (id)accessibilityIdentifier
{
  return @"LowLightButton";
}

- (id)accessibilityValue
{
  if ([(CAMDrawerLowLightButtonAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    v6.receiver = self;
    v6.super_class = (Class)CAMDrawerLowLightButtonAccessibility;
    id v3 = [(CAMDrawerLowLightButtonAccessibility *)&v6 accessibilityValue];
  }
  else
  {
    if ([(CAMDrawerLowLightButtonAccessibility *)self safeBoolForKey:@"isOn"]) {
      v4 = @"on.state";
    }
    else {
      v4 = @"off.state";
    }
    id v3 = accessibilityCameraUILocalizedString(v4);
  }

  return v3;
}

@end