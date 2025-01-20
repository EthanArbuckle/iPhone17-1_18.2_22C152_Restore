@interface MediaControlsRoutingCornerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MediaControlsRoutingCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsRoutingCornerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsRoutingCornerView", @"isRouting", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsRoutingCornerView", @"routesAreAvailable", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  if ([v3 _accessibilityViewIsVisible]) {
    char v4 = [(MediaControlsRoutingCornerViewAccessibility *)self safeBoolForKey:@"routesAreAvailable"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)accessibilityLabel
{
  if ([(MediaControlsRoutingCornerViewAccessibility *)self safeBoolForKey:@"isRouting"])
  {
    id v3 = @"connected.route";
LABEL_5:
    char v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(MediaControlsRoutingCornerViewAccessibility *)self safeBoolForKey:@"routesAreAvailable"])
  {
    id v3 = @"available.route";
    goto LABEL_5;
  }
  char v4 = 0;
LABEL_7:

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end