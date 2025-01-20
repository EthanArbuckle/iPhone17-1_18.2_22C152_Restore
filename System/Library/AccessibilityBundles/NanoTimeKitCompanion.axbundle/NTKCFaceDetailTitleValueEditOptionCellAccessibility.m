@interface NTKCFaceDetailTitleValueEditOptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation NTKCFaceDetailTitleValueEditOptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailTitleValueEditOptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKCFaceDetailTitleValueEditOptionCell" hasProperty:@"titleText" withType:"@"];
  [v3 validateClass:@"NTKCFaceDetailTitleValueEditOptionCell" hasProperty:@"valueText" withType:"@"];
  [v3 validateClass:@"NTKCFaceDetailTitleValueEditOptionCell" hasProperty:@"active" withType:"B"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(NTKCFaceDetailTitleValueEditOptionCellAccessibility *)self safeStringForKey:@"titleText"];
}

- (id)accessibilityValue
{
  if ([(NTKCFaceDetailTitleValueEditOptionCellAccessibility *)self safeBoolForKey:@"active"])
  {
    id v3 = [(NTKCFaceDetailTitleValueEditOptionCellAccessibility *)self safeStringForKey:@"valueText"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKCFaceDetailTitleValueEditOptionCellAccessibility;
    id v3 = [(NTKCFaceDetailTitleValueEditOptionCellAccessibility *)&v5 accessibilityValue];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCFaceDetailTitleValueEditOptionCellAccessibility;
  unint64_t v3 = [(NTKCFaceDetailTitleValueEditOptionCellAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(NTKCFaceDetailTitleValueEditOptionCellAccessibility *)self safeBoolForKey:@"active"];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

@end