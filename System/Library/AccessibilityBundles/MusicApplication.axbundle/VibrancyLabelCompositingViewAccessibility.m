@interface VibrancyLabelCompositingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VibrancyLabelCompositingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.VibrancyLabelCompositingView";
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
  return (id)[(VibrancyLabelCompositingViewAccessibility *)self safeStringForKey:@"text"];
}

@end