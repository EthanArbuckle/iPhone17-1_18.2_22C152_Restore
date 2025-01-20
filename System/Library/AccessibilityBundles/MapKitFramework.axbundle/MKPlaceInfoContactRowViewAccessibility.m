@interface MKPlaceInfoContactRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MKPlaceInfoContactRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceInfoContactRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MKPlaceInfoContactRowView" hasInstanceVariable:@"_titleLabel" withType:"MKVibrantLabel"];
  [v3 validateClass:@"MKVibrantLabel" hasInstanceVariable:@"_label" withType:"UILabel"];
  [v3 validateClass:@"MKPlaceInfoContactRowView" hasInstanceVariable:@"_valueLabel" withType:"_MKUILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MKPlaceInfoContactRowViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [v3 accessibilityLabel];

  if (![v4 length])
  {
    v5 = [(MKPlaceInfoContactRowViewAccessibility *)self safeValueForKey:@"_titleLabel"];
    v6 = [v5 safeValueForKey:@"_label"];
    uint64_t v7 = [v6 accessibilityLabel];

    v4 = (void *)v7;
  }

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(MKPlaceInfoContactRowViewAccessibility *)self safeValueForKey:@"_valueLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end