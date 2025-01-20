@interface AVTomatoRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation AVTomatoRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTomatoRatingView";
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
  v2 = [(AVTomatoRatingViewAccessibility *)self safeValueForKey:@"tomatoFreshness"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityLocalizedString(off_265101AD0[v3]);
  }

  return v4;
}

@end