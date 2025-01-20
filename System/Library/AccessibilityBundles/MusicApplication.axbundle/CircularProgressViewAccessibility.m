@interface CircularProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CircularProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.CircularProgressView";
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

- (id)accessibilityValue
{
  [(CircularProgressViewAccessibility *)self safeCGFloatForKey:@"accessibilityProgressValue"];

  return (id)AXFormatFloatWithPercentage();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CircularProgressViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(CircularProgressViewAccessibility *)&v3 accessibilityTraits];
}

@end