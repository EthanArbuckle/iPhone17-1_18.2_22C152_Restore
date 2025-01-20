@interface MKCompassViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MKCompassViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKCompassView";
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
  return AXMapKitLocString(@"COMPASS_HINT");
}

- (id)accessibilityLabel
{
  return AXMapKitLocString(@"COMPASS_BUTTON");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68] | *MEMORY[0x263F1CEE8];
}

- (id)accessibilityValue
{
  v2 = [(MKCompassViewAccessibility *)self safeValueForKey:@"_assetImageView"];
  v3 = [v2 layer];
  v4 = [v3 valueForKeyPath:@"transform.rotation.z"];
  [v4 floatValue];

  v5 = NSString;
  v6 = AXMapKitLocString(@"HEADING_FORMAT");
  v7 = AXDescriptionForHeadingInDegrees();
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end