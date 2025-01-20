@interface PLFlatVideoOverlayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation PLFlatVideoOverlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLFlatVideoOverlayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"play.video.button.txt");
}

- (id)accessibilityIdentifier
{
  return @"Play video";
}

@end