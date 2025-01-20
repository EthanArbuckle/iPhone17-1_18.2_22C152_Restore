@interface SFSectionDisclosureButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SFSectionDisclosureButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFSectionDisclosureButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFSectionDisclosureButton" hasInstanceVariable:@"_labelWhenCollapsed" withType:"UILabel"];
  [v3 validateClass:@"SFSectionDisclosureButton" hasInstanceVariable:@"_labelWhenExpanded" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFSectionDisclosureButton", @"isExpanded", "B", 0);
}

- (id)accessibilityLabel
{
  if ([(SFSectionDisclosureButtonAccessibility *)self safeBoolForKey:@"isExpanded"])id v3 = @"_labelWhenExpanded"; {
  else
  }
    id v3 = @"_labelWhenCollapsed";
  v4 = [(SFSectionDisclosureButtonAccessibility *)self safeValueForKey:v3];
  v5 = [v4 accessibilityLabel];

  return v5;
}

@end