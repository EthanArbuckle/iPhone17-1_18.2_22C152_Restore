@interface _NTKPigmentAddCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation _NTKPigmentAddCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NTKPigmentAddCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKPigmentAddCell", @"pigmentEditOption", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKEditOption", @"localizedName", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(_NTKPigmentAddCellAccessibility *)self safeValueForKey:@"pigmentEditOption"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 _accessibilityEditOptionDescription];
    id v6 = [v5 length];

    if (v6) {
      [v4 _accessibilityEditOptionDescription];
    }
    else {
    uint64_t v7 = [v4 safeValueForKey:@"localizedName"];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_NTKPigmentAddCellAccessibility;
    uint64_t v7 = [(_NTKPigmentAddCellAccessibility *)&v10 accessibilityLabel];
  }
  v8 = (void *)v7;

  return v8;
}

@end