@interface SULoadMoreMediaCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SULoadMoreMediaCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SULoadMoreMediaCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SULoadMoreMediaCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  [v3 bytes];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end