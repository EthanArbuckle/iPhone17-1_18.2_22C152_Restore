@interface CAMDrawerSemanticStyleButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
@end

@implementation CAMDrawerSemanticStyleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerSemanticStyleButton";
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
  [v3 validateClass:@"CAMDrawerSemanticStyleButton" isKindOfClass:@"CAMControlDrawerCustomButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerSemanticStyleButton", @"isOn", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerSemanticStyleButton", @"shouldShowSlashForCurrentState", "B", 0);
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(CAMDrawerSemanticStyleButtonAccessibility *)self safeBoolForKey:@"isExpanded"])return 1; {
  else
  }
    return 2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUID6xLocalizedString(@"semantic.style");
}

- (id)accessibilityIdentifier
{
  return @"SemanticStyleButton";
}

- (id)accessibilityValue
{
  if ([(CAMDrawerSemanticStyleButtonAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    int v3 = [(CAMDrawerSemanticStyleButtonAccessibility *)self safeBoolForKey:@"shouldShowSlashForCurrentState"];
    v4 = @"on.state";
    v5 = @"off.state";
  }
  else
  {
    int v3 = [(CAMDrawerSemanticStyleButtonAccessibility *)self safeBoolForKey:@"isOn"];
    v4 = @"off.state";
    v5 = @"on.state";
  }
  if (v3) {
    v6 = v5;
  }
  else {
    v6 = v4;
  }
  v7 = accessibilityCameraUILocalizedString(v6);

  return v7;
}

@end