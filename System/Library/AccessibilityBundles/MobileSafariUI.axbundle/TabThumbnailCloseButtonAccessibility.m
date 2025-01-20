@interface TabThumbnailCloseButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation TabThumbnailCloseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TabThumbnailCloseButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(@"close.button");
}

- (id)accessibilityIdentifier
{
  return @"Close";
}

@end