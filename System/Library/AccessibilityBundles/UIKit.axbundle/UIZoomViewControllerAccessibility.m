@interface UIZoomViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilitySetZoomButtonLabel;
- (void)_changeZoom:(id)a3;
- (void)loadView;
@end

@implementation UIZoomViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIZoomViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplication", @"_fakingRequiresHighResolution", "B", 0);
  objc_storeStrong(v4, obj);
}

- (void)_accessibilitySetZoomButtonLabel
{
  if (a1)
  {
    id v9 = (id)[(id)*MEMORY[0x263F1D020] safeValueForKey:@"_shouldZoom"];
    char v10 = [v9 BOOLValue];

    if (v10)
    {
      id v6 = (id)[a1 safeValueForKey:@"_zoomButton"];
      id v5 = accessibilityLocalizedString(@"normal.zoom");
      objc_msgSend(v6, "setAccessibilityLabel:");
    }
    else
    {
      id v8 = (id)[a1 safeValueForKey:@"_zoomButton"];
      id v7 = accessibilityLocalizedString(@"fullscreen.zoom");
      objc_msgSend(v8, "setAccessibilityLabel:");
    }
    id v4 = (id)objc_msgSend(a1, "safeValueForKey:");
    id v3 = (id)[a1 safeValueForKey:@"_zoomButton"];
    id v2 = (id)[v3 titleForState:0];
    objc_msgSend(v4, "setAccessibilityIdentifier:");

    if ([(id)*MEMORY[0x263F1D020] safeBoolForKey:@"_fakingRequiresHighResolution"])
    {
      id v1 = (id)[a1 safeValueForKey:@"_zoomButton"];
      [v1 setAccessibilityElementsHidden:1];
    }
  }
}

- (void)loadView
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIZoomViewControllerAccessibility;
  [(UIZoomViewControllerAccessibility *)&v2 loadView];
  -[UIZoomViewControllerAccessibility _accessibilitySetZoomButtonLabel](v4);
}

- (void)_changeZoom:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIZoomViewControllerAccessibility;
  [(UIZoomViewControllerAccessibility *)&v3 _changeZoom:location[0]];
  -[UIZoomViewControllerAccessibility _accessibilitySetZoomButtonLabel](v5);
  objc_storeStrong(location, 0);
}

@end