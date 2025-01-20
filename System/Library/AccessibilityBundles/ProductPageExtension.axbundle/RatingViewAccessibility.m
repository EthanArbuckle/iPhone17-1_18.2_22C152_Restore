@interface RatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation RatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.RatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(RatingViewAccessibility *)self safeFloatForKey:@"accessibilityRating"];
  v3.n128_f64[0] = v3.n128_f32[0];

  return (id)MEMORY[0x270F80920](v2, v3);
}

@end