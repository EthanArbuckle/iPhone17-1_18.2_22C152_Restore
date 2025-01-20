@interface SULoadMoreCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SULoadMoreCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SULoadMoreCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SULoadMoreCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  id v4 = *(id *)[v3 bytes];

  return v4;
}

@end