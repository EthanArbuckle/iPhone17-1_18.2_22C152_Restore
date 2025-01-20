@interface PXZoomableInlineHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PXZoomableInlineHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXZoomableInlineHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXZoomableInlineHeaderView", @"userData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXZoomableInlineHeaderViewConfiguration", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXZoomableInlineHeaderViewConfiguration", @"subtitle", "@", 0);
  [v3 validateClass:@"PXZoomableInlineHeaderView" isKindOfClass:@"UIView"];
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(PXZoomableInlineHeaderViewAccessibility *)self safeValueForKey:@"userData"];
  char v3 = [v2 safeValueForKey:@"title"];
  v6 = [v2 safeValueForKey:@"subtitle"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PXZoomableInlineHeaderViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PXZoomableInlineHeaderViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEF8];
}

@end