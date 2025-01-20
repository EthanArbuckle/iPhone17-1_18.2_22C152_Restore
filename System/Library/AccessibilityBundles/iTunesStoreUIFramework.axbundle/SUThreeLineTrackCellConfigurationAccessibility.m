@interface SUThreeLineTrackCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SUThreeLineTrackCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUThreeLineTrackCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SUThreeLineTrackCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  uint64_t v4 = [v3 bytes];
  v5 = *(void **)(v4 + 16);
  v6 = *(void **)(v4 + 24);
  id v7 = *(id *)(v4 + 8);
  id v8 = v5;
  id v9 = v6;
  v12 = [(SUThreeLineTrackCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityVideoIconString"];
  v10 = __UIAXStringForVariables();

  return v10;
}

@end