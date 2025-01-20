@interface ACAssistantAlternateProviderResultViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ACAssistantAlternateProviderResultViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACAssistantAlternateProviderResultView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ACAssistantAlternateProviderResultViewAccessibility *)self safeValueForKey:@"_providerNameLabel"];
  v3 = [v2 accessibilityLabel];

  if ([v3 length])
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"providedby.format");
    v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end