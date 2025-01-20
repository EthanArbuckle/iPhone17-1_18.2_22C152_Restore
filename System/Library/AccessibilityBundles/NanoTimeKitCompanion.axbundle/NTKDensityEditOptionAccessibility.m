@interface NTKDensityEditOptionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityEditOptionDescription;
@end

@implementation NTKDensityEditOptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKDensityEditOption";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityEditOptionDescription
{
  unint64_t v2 = (unint64_t)[(NTKDensityEditOptionAccessibility *)self safeUnsignedIntegerForKey:@"density"];
  if (v2 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityLocalizedString(off_245A8[v2], v3);
  }

  return v4;
}

@end