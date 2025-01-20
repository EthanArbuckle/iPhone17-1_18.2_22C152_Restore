@interface SUReviewsHeaderCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SUReviewsHeaderCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUReviewsHeaderCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SUReviewsHeaderCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  [v3 bytes];
  v4 = [(SUReviewsHeaderCellConfigurationAccessibility *)self safeValueForKey:@"_representedObject"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 safeValueForKey:@"reviewStatistics"];
    v7 = [v6 safeValueForKey:@"averageUserRating"];
    [v7 floatValue];
    float v9 = v8;

    v10 = starStringForStarCount(v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = __UIAXStringForVariables();

  return v11;
}

@end