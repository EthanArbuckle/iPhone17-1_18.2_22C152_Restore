@interface TVStackedImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFrameDelegate;
@end

@implementation TVStackedImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVStackedImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityFrameDelegate
{
  return (id)[(TVStackedImageViewAccessibility *)self safeValueForKey:@"_imageStackLayer"];
}

@end