@interface AirDropNoContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)isAccessibilityElement;
@end

@implementation AirDropNoContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AirDropNoContentView";
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
  return 0;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end