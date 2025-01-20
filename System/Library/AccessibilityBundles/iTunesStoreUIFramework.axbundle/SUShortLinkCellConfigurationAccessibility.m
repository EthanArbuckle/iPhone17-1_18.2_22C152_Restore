@interface SUShortLinkCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SUShortLinkCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUShortLinkCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SUShortLinkCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  uint64_t v4 = [v3 bytes];
  v5 = *(void **)(v4 + 16);
  id v6 = *(id *)(v4 + 24);
  id v7 = v5;
  v8 = __UIAXStringForVariables();

  return v8;
}

@end