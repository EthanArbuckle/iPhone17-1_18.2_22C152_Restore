@interface VideosUI_SearchEntityCardCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VideosUI_SearchEntityCardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.SearchEntityCardCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.SearchEntityCardCell" hasProperty:@"accessibilityTitleLabel" withType:"@"];
  [v3 validateClass:@"VideosUI.SearchEntityCardCell" hasProperty:@"accessibilitySubitleLabel" withType:"@"];
  [v3 validateClass:@"VideosUI.SearchEntityCardCell" hasProperty:@"accessibilityCaptionLabel" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(VideosUI_SearchEntityCardCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilitySubitleLabel, accessibilityCaptionLabel"];
}

@end