@interface SUButtonCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SUButtonCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUButtonCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SUButtonCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  id v4 = *(id *)[v3 bytes];

  return v4;
}

@end