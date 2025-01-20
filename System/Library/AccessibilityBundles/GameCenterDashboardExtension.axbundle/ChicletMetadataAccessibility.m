@interface ChicletMetadataAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation ChicletMetadataAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterDashboardExtension.ChicletMetadata";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterDashboardExtension.ChicletMetadata", @"accessibilityChicletRank", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterDashboardExtension.ChicletMetadata", @"accessibilityChicletCaption", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterDashboardExtension.ChicletMetadata", @"accessibilityChicletSubtitle", "@", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(ChicletMetadataAccessibility *)self safeValueForKey:@"accessibilityChicletRank"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 _accessibilityViewIsVisible]) {
    v5 = @"accessibilityChicletCaption, accessibilityChicletRank, accessibilityChicletSubtitle";
  }
  else {
    v5 = @"accessibilityChicletCaption, accessibilityChicletSubtitle";
  }
  v6 = [(ChicletMetadataAccessibility *)self _accessibilityStringForLabelKeyValues:v5];

  return v6;
}

@end