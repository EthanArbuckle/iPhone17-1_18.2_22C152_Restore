@interface ENUIExposureCheckCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation ENUIExposureCheckCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ENUIExposureCheckCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIExposureCheckCell", @"sectionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIExposureCheckCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIExposureCheckCell", @"subtitleLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(ENUIExposureCheckCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"sectionLabel, titleLabel, subtitleLabel"];
}

@end