@interface MainButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
@end

@implementation MainButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFBrowsingAssistantMainButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  v2 = [(MainButtonAccessibility *)self accessibilityIdentifier];
  if (([v2 isEqualToString:@"MoreMenuItem"] & 1) != 0
    || ([v2 isEqualToString:@"FindOnPage"] & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = !UIAccessibilityIsVoiceOverRunning();
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 performPrimaryAction];

  return 1;
}

@end