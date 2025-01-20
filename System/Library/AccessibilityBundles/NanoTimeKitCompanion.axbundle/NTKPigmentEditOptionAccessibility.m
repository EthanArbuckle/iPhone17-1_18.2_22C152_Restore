@interface NTKPigmentEditOptionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityEditOptionDescription;
@end

@implementation NTKPigmentEditOptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKPigmentEditOption";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPigmentEditOption", @"localizedName", "@", 0);
  [v3 validateClass:@"NTKPigmentEditOption" hasInstanceVariable:@"_fullname" withType:"NSString"];
}

- (id)_accessibilityEditOptionDescription
{
  id v3 = [(NTKPigmentEditOptionAccessibility *)self safeStringForKey:@"_fullname"];
  v4 = AXCFormattedString();
  v6 = accessibilityLocalizedString(v4, v5);
  if (objc_msgSend(v6, "isEqualToString:", v4, v3))
  {
    id v7 = [(NTKPigmentEditOptionAccessibility *)self safeStringForKey:@"localizedName"];
  }
  else
  {
    id v7 = v6;
  }
  v8 = v7;

  return v8;
}

@end