@interface _NTKCFaceDetailCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _NTKCFaceDetailCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NTKCFaceDetailCollectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCFaceDetailCollectionCell", @"active", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCFaceDetailCollectionCell", @"disabled", "B", 0);
  [v3 validateClass:@"_NTKCFaceDetailCollectionCell" hasInstanceVariable:@"_label" withType:"_NTKCFaceDetailCollectionCellLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCFaceDetailCollectionCellLabel", @"text", "@", 0);
  [v3 validateClass:@"NTKEditOption"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKEditOption", @"localizedName", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(_NTKCFaceDetailCollectionCellAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return 1;
  }
  v4 = [(_NTKCFaceDetailCollectionCellAccessibility *)self isAccessibilityUserDefinedElement];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (id)accessibilityLabel
{
  id v3 = [(_NTKCFaceDetailCollectionCellAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(_NTKCFaceDetailCollectionCellAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    unsigned __int8 v5 = [(_NTKCFaceDetailCollectionCellAccessibility *)self _accessibilityValueForKey:@"AXNTKEditOption"];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 _accessibilityEditOptionDescription];
      id v8 = [v7 length];

      if (v8) {
        [v6 _accessibilityEditOptionDescription];
      }
      else {
      v4 = [v6 safeValueForKey:@"localizedName"];
      }
    }
    else
    {
      v9 = [(_NTKCFaceDetailCollectionCellAccessibility *)self safeValueForKey:@"_label"];
      v10 = [v9 safeStringForKey:@"text"];

      if ([v10 length])
      {
        id v11 = v10;
      }
      else
      {
        v13.receiver = self;
        v13.super_class = (Class)_NTKCFaceDetailCollectionCellAccessibility;
        id v11 = [(_NTKCFaceDetailCollectionCellAccessibility *)&v13 accessibilityLabel];
      }
      v4 = v11;
    }
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)_NTKCFaceDetailCollectionCellAccessibility;
  unint64_t v3 = [(_NTKCFaceDetailCollectionCellAccessibility *)&v6 accessibilityTraits];
  if ([(_NTKCFaceDetailCollectionCellAccessibility *)self safeBoolForKey:@"disabled"])
  {
    v4 = &UIAccessibilityTraitNotEnabled;
LABEL_5:
    v3 |= *v4;
    return v3;
  }
  if ([(_NTKCFaceDetailCollectionCellAccessibility *)self safeBoolForKey:@"active"])
  {
    v4 = &UIAccessibilityTraitSelected;
    goto LABEL_5;
  }
  return v3;
}

@end