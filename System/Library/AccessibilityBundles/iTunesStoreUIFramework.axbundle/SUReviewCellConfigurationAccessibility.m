@interface SUReviewCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SUReviewCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUReviewCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SUReviewCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  [v3 bytes];
  v4 = [(SUReviewCellConfigurationAccessibility *)self safeValueForKey:@"_representedObject"];
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

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

@end