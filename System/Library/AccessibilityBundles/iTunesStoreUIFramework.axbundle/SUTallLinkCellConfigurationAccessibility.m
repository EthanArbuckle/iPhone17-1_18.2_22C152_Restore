@interface SUTallLinkCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SUTallLinkCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTallLinkCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  v3 = [(SUTallLinkCellConfigurationAccessibility *)self safeValueForKey:@"_representedObject"];
  v4 = [v3 safeValueForKey:@"reviewStatistics"];
  v5 = [v4 safeValueForKey:@"numberOfUserRatings"];
  uint64_t v6 = [v5 integerValue];

  if (v6 < 1)
  {
    v10 = 0;
  }
  else
  {
    v7 = [v4 safeValueForKey:@"averageUserRating"];
    [v7 floatValue];
    float v9 = v8;

    v10 = starStringForStarCount(v9);
  }
  id v11 = [(SUTallLinkCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  uint64_t v12 = [v11 bytes];
  v13 = *(void **)(v12 + 32);
  v14 = *(void **)(v12 + 8);
  id v15 = *(id *)(v12 + 24);
  id v16 = v14;
  id v17 = v13;
  v18 = __UIAXStringForVariables();

  return v18;
}

@end