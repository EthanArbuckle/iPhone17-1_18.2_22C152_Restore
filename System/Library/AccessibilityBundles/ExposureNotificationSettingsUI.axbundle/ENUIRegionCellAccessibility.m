@interface ENUIRegionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation ENUIRegionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ENUIRegionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIRegionCell", @"sectionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIRegionCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIRegionCell", @"regionCapsuleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CapsuleLabel", @"text", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(ENUIRegionCellAccessibility *)self safeUIViewForKey:@"sectionLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(ENUIRegionCellAccessibility *)self safeValueForKey:@"regionCapsuleLabel"];
  v4 = [(ENUIRegionCellAccessibility *)self safeUIViewForKey:@"titleLabel"];
  v5 = [v4 accessibilityLabel];
  v8 = [v3 safeStringForKey:@"text"];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end