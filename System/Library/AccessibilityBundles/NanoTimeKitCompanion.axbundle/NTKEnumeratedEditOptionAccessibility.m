@interface NTKEnumeratedEditOptionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityEditOptionDescription;
@end

@implementation NTKEnumeratedEditOptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKEnumeratedEditOption";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKEnumeratedEditOption" isKindOfClass:@"NTKEditOption"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKEditOption", @"localizedName", "@", 0);
}

- (id)_accessibilityEditOptionDescription
{
  return [(NTKEnumeratedEditOptionAccessibility *)self safeValueForKey:@"localizedName"];
}

@end