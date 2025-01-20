@interface CAMDrawerFilterButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
@end

@implementation CAMDrawerFilterButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerFilterButton";
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
  [v3 validateClass:@"CAMDrawerFilterButton" isKindOfClass:@"CAMControlDrawerCustomButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerFilterButton", @"isOn", "B", 0);
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(CAMDrawerFilterButtonAccessibility *)self safeBoolForKey:@"isExpanded"]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"filter.button");
}

- (id)accessibilityIdentifier
{
  return @"FilterButton";
}

- (id)accessibilityValue
{
  if ([(CAMDrawerFilterButtonAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    v6.receiver = self;
    v6.super_class = (Class)CAMDrawerFilterButtonAccessibility;
    id v3 = [(CAMDrawerFilterButtonAccessibility *)&v6 accessibilityValue];
  }
  else
  {
    if ([(CAMDrawerFilterButtonAccessibility *)self safeBoolForKey:@"isOn"]) {
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