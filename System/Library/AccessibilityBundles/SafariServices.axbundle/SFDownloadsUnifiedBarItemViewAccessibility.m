@interface SFDownloadsUnifiedBarItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SFDownloadsUnifiedBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFDownloadsUnifiedBarItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(@"downloads.button");
}

@end