@interface _MKModernCompassViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _MKModernCompassViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MKModernCompassView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
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
  [(_MKModernCompassViewAccessibility *)self safeDoubleForKey:@"mapHeading"];
  v2 = NSString;
  v3 = AXMapKitLocString(@"HEADING_FORMAT");
  v4 = AXDescriptionForHeadingInDegrees();
  v5 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v4);

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end