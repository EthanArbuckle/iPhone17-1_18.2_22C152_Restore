@interface CAMAutoMacroButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CAMAutoMacroButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMAutoMacroButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"auto.macro.mode");
}

- (id)accessibilityValue
{
  if ([(CAMAutoMacroButtonAccessibility *)self safeBoolForKey:@"active"]) {
    v2 = @"on.state";
  }
  else {
    v2 = @"off.state";
  }
  v3 = accessibilityCameraUILocalizedString(v2);

  return v3;
}

@end