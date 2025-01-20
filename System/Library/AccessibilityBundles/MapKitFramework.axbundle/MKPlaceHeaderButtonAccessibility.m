@interface MKPlaceHeaderButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MKPlaceHeaderButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceHeaderButton";
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
  v2 = [(MKPlaceHeaderButtonAccessibility *)self safeValueForKey:@"titleLabel"];
  v3 = [v2 accessibilityLabel];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"\n", @", " withString];

  return v4;
}

@end