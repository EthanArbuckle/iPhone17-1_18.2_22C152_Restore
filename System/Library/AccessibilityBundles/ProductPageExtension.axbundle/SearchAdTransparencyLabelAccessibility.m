@interface SearchAdTransparencyLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SearchAdTransparencyLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.SearchAdTransparencyLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(@"advertisement.button");
}

@end