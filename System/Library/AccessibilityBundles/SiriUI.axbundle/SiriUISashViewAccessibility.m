@interface SiriUISashViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SiriUISashViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUISashView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUISashView", @"sashItem", "@", 0);
  [v3 validateClass:@"SiriUISashItem" isKindOfClass:@"SiriSharedUISashItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriSharedUISashItem", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriSharedUISashItem", @"isHidden", "B", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SiriUISashViewAccessibility *)self safeValueForKey:@"sashItem"];
  id v3 = [v2 safeStringForKey:@"title"];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SiriUISashViewAccessibility *)self safeValueForKey:@"sashItem"];
  char v3 = [v2 safeBoolForKey:@"isHidden"] ^ 1;

  return v3;
}

@end