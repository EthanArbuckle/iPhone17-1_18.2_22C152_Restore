@interface AVTViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
@end

@implementation AVTViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTView", @"faceIsTracked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTView", @"enableFaceTracking", "B", 0);
  [v3 validateClass:@"AVTView" hasInstanceVariable:@"_faceTrackingPaused" withType:"B"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  id v3 = [(AVTViewAccessibility *)self accessibilityUserDefinedValue];
  if ([(AVTViewAccessibility *)self safeBoolForKey:@"enableFaceTracking"]
    && ([(AVTViewAccessibility *)self safeBoolForKey:@"_faceTrackingPaused"] & 1) == 0)
  {
    if ([(AVTViewAccessibility *)self safeBoolForKey:@"faceIsTracked"]) {
      v5 = @"tracking.enabled";
    }
    else {
      v5 = @"tracking.disabled";
    }
    v7 = accessibilityAvatarKitLocalizedString(v5);
    __UIAXStringForVariables();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

@end