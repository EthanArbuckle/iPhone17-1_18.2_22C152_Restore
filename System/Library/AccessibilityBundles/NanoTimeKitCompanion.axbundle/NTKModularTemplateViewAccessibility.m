@interface NTKModularTemplateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation NTKModularTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKModularTemplateView";
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
  v3 = [(NTKModularTemplateViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(NTKModularTemplateViewAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    v5 = [(NTKModularTemplateViewAccessibility *)self safeValueForKey:@"complicationTemplate"];
    v4 = [v5 accessibilityLabel];
  }

  return v4;
}

- (id)accessibilityValue
{
  v3 = [(NTKModularTemplateViewAccessibility *)self accessibilityUserDefinedValue];

  if (v3)
  {
    v4 = [(NTKModularTemplateViewAccessibility *)self accessibilityUserDefinedValue];
  }
  else
  {
    v5 = [(NTKModularTemplateViewAccessibility *)self safeValueForKey:@"complicationTemplate"];
    v4 = [v5 accessibilityValue];
  }

  return v4;
}

@end