@interface CAMMessagesPhotosButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CAMMessagesPhotosButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMMessagesPhotosButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"photo.library.button");
}

@end