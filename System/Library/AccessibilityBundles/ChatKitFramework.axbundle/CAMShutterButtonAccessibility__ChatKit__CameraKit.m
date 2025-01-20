@interface CAMShutterButtonAccessibility__ChatKit__CameraKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)accessibilityLabel;
@end

@implementation CAMShutterButtonAccessibility__ChatKit__CameraKit

+ (id)safeCategoryTargetClassName
{
  return @"CAMShutterButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMShutterButton", @"mode", "q", 0);
  [v3 validateClass:@"CKActionMenuView"];
}

- (id)accessibilityLabel
{
  id v3 = [(CAMShutterButtonAccessibility__ChatKit__CameraKit *)self accessibilityContainer];
  NSClassFromString(&cfstr_Ckactionmenuvi_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && [(CAMShutterButtonAccessibility__ChatKit__CameraKit *)self safeIntegerForKey:@"mode"] == 4)
  {
    v5 = accessibilityLocalizedString(@"audio.button.stop.label");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMShutterButtonAccessibility__ChatKit__CameraKit;
    v5 = [(CAMShutterButtonAccessibility__ChatKit__CameraKit *)&v7 accessibilityLabel];
  }

  return v5;
}

- (BOOL)accessibilityActivate
{
  if ([(CAMShutterButtonAccessibility__ChatKit__CameraKit *)self _accessibilityBoolValueForKey:@"AXShouldBypassAXActivate"])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)CAMShutterButtonAccessibility__ChatKit__CameraKit;
  return [(CAMShutterButtonAccessibility__ChatKit__CameraKit *)&v4 accessibilityActivate];
}

@end