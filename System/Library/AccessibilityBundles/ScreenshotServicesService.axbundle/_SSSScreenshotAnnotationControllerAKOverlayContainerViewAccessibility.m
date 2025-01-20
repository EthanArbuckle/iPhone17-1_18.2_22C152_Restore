@interface _SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLabelForOverlayView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupAKOverlayView;
- (void)setManagedView:(id)a3;
@end

@implementation _SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SSSScreenshotAnnotationControllerAKOverlayContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SSSScreenshotsView" hasInstanceVariable:@"_screenshotViews" withType:"NSMutableArray"];
  [v3 validateClass:@"SSSScreenshotsView"];
  [v3 validateClass:@"SSSScreenshotView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SSSScreenshotAnnotationControllerAKOverlayContainerView", @"managedView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SSSScreenshotAnnotationControllerAKOverlayContainerView", @"setManagedView:", "v", "@", 0);
}

- (void)setManagedView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility;
  [(_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility *)&v4 setManagedView:a3];
  [(_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility *)self _axMarkupAKOverlayView];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility;
  [(_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility *)self _axMarkupAKOverlayView];
}

- (void)_axMarkupAKOverlayView
{
  objc_super v3 = [(_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility *)self safeValueForKey:@"managedView"];
  MEMORY[0x24565F4F0](@"AKOverlayView");
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    objc_super v4 = [v3 safeValueForKey:@"_accessibilityCreateOverlayViewElement"];
    v5 = __UIAccessibilityCastAsClass();

    [v5 setAccessibilityIdentifier:@"ScreenshotImageView"];
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __95___SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility__axMarkupAKOverlayView__block_invoke;
    v6[3] = &unk_26514CF68;
    objc_copyWeak(&v7, &location);
    [v5 _setAccessibilityLabelBlock:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (id)_accessibilityLabelForOverlayView
{
  objc_super v3 = [(_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x24565F4F0](@"SSSScreenshotView", a2)];
  objc_super v4 = [(_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x24565F4F0](@"SSSScreenshotsView")];
  v5 = [v4 safeArrayForKey:@"_screenshotViews"];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [v5 indexOfObject:v3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = accessibilityLocalizedString(@"screenshot.title");
  }
  else
  {
    uint64_t v9 = v7;
    v10 = NSString;
    v11 = accessibilityLocalizedString(@"screenshot.with.index");
    v8 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v9 + 1, v6);
  }

  return v8;
}

@end