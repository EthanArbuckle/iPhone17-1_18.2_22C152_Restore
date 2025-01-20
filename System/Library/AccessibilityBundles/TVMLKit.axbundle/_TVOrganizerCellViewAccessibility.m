@interface _TVOrganizerCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySubviews;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation _TVOrganizerCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVOrganizerCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)_TVOrganizerCellViewAccessibility;
  [(_TVOrganizerCellViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_TVOrganizerCellViewAccessibility;
  [(_TVOrganizerCellViewAccessibility *)&v3 layoutSubviews];
  [(_TVOrganizerCellViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilitySubviews
{
  objc_super v3 = [(_TVOrganizerCellViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Tvmlshelfview.isa)];

  if (v3)
  {
    v4 = [(_TVOrganizerCellViewAccessibility *)self subviews];
    if ([v4 count] == 2)
    {
      v5 = [v4 firstObject];
      v6 = [v5 accessibilityLabel];

      v7 = [v6 uppercaseString];
      int v8 = [v7 isEqualToString:v6];

      if (v8)
      {
        v9 = [v4 firstObject];
        [v9 frame];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;

        v18 = [v4 lastObject];
        [v18 frame];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;

        if (v13 < v22)
        {
          v27 = [v4 firstObject];
          objc_msgSend(v27, "setAccessibilityFrame:", v20, v22, v24, v26);

          v28 = [v4 lastObject];
          objc_msgSend(v28, "setAccessibilityFrame:", v11, v13, v15, v17);
        }
      }
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)_TVOrganizerCellViewAccessibility;
  v29 = [(_TVOrganizerCellViewAccessibility *)&v31 _accessibilitySubviews];

  return v29;
}

@end