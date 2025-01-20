@interface ENUILoggingStatusCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation ENUILoggingStatusCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ENUILoggingStatusCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUILoggingStatusCell", @"sectionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUILoggingStatusCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUILoggingStatusCell", @"subtitleLabel", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(ENUILoggingStatusCellAccessibility *)self safeUIViewForKey:@"sectionLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  return (id)[(ENUILoggingStatusCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, subtitleLabel"];
}

@end