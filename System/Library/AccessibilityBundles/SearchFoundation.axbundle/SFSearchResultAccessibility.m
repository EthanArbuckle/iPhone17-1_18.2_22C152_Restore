@interface SFSearchResultAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SFSearchResultAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFSearchResult";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFSearchResult", @"title", "@", 0);
  [v3 validateClass:@"SFText"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFText", @"text", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SFSearchResultAccessibility *)self safeValueForKey:@"title"];
  id v3 = [v2 safeValueForKey:@"text"];

  return v3;
}

@end