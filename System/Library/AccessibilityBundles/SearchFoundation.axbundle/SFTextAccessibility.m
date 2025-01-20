@interface SFTextAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SFTextAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFText";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(SFTextAccessibility *)self safeStringForKey:@"text"];
}

@end