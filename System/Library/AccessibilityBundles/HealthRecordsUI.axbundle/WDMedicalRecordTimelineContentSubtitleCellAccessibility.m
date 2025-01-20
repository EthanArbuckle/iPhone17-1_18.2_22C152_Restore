@interface WDMedicalRecordTimelineContentSubtitleCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation WDMedicalRecordTimelineContentSubtitleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDMedicalRecordTimelineContentSubtitleCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)WDMedicalRecordTimelineContentSubtitleCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(WDMedicalRecordTimelineContentSubtitleCellAccessibility *)&v3 accessibilityTraits];
}

@end