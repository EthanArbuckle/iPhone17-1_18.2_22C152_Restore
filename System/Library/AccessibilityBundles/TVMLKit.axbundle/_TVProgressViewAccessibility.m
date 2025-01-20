@interface _TVProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation _TVProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVProgressView";
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
  return accessibilityLocalizedString(@"playback.progress.label");
}

- (id)accessibilityValue
{
  [(_TVProgressViewAccessibility *)self safeCGFloatForKey:@"progress"];
  v2.n128_f32[0] = v2.n128_f64[0];

  return (id)MEMORY[0x270F0A108](0, v2);
}

@end