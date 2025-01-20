@interface VideosContentRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosContentRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosContentRatingView";
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
  return (id)[(VideosContentRatingViewAccessibility *)self safeValueForKey:@"text"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

@end