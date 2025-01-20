@interface _TVShowCaseCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
@end

@implementation _TVShowCaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVShowcaseCell";
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

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)_accessibilityFrameDelegate
{
  return (id)[(_TVShowCaseCellAccessibility *)self safeValueForKey:@"imageView"];
}

@end