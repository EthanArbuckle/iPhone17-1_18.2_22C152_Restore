@interface SUCompletionCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SUCompletionCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUCompletionCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SUCompletionCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  id v4 = *(id *)[v3 bytes];

  return v4;
}

@end