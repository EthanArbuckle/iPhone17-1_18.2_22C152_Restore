@interface HKMedicalIDPersonSummaryCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (HKMedicalIDPersonSummaryCellInvertColorsAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadInvertColors;
@end

@implementation HKMedicalIDPersonSummaryCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDPersonSummaryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (HKMedicalIDPersonSummaryCellInvertColorsAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicalIDPersonSummaryCellInvertColorsAccessibility;
  v3 = -[HKMedicalIDPersonSummaryCellInvertColorsAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HKMedicalIDPersonSummaryCellInvertColorsAccessibility *)v3 _accessibilityLoadInvertColors];

  return v3;
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(HKMedicalIDPersonSummaryCellInvertColorsAccessibility *)self safeUIViewForKey:@"_pictureView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end