@interface MKUserTrackingBarButtonItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MKUserTrackingBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKUserTrackingBarButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHint
{
  return AXMapKitLocString(@"TRACKING_BUTTON_HINT");
}

- (id)accessibilityLabel
{
  return AXMapKitLocString(@"TRACKING_BUTTON_LABEL");
}

- (id)accessibilityValue
{
  v2 = [(MKUserTrackingBarButtonItemAccessibility *)self safeValueForKey:@"_state"];
  unint64_t v3 = [v2 integerValue];

  if (v3 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = AXMapKitLocString(off_26512C5B0[v3]);
  }

  return v4;
}

@end