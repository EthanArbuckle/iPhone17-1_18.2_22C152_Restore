@interface ScreenshotCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ScreenshotCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.ScreenshotCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(@"screenshot.image");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ScreenshotCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CF00] | [(ScreenshotCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityIdentifier
{
  return @"Screenshot";
}

@end