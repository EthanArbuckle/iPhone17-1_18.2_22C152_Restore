@interface SFLinkPreviewHeaderContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFLinkPreviewHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFLinkPreviewHeaderContentView";
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
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SFLinkPreviewHeaderContentViewAccessibility;
  [(SFLinkPreviewHeaderContentViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(SFLinkPreviewHeaderContentViewAccessibility *)self safeUIViewForKey:@"_domainLabel"];
  [v4 setAccessibilityTraits:v3];
}

@end