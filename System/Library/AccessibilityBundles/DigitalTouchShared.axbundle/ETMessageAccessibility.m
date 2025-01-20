@interface ETMessageAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityColorString;
- (id)accessibilityLabel;
@end

@implementation ETMessageAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETMessage";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETMessageAccessibility"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETMessage", @"color", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"unknown.message.label");
}

- (id)_accessibilityColorString
{
  v2 = [(ETMessageAccessibility *)self safeValueForKey:@"color"];
  id v3 = [v2 axColorStringForSpeaking];

  return v3;
}

@end