@interface CAMImageWellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation CAMImageWellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMImageWell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return [(CAMImageWellAccessibility *)self safeBoolForKey:@"_accessibilityViewIsVisible"];
}

- (id)accessibilityIdentifier
{
  return @"GoToCameraRoll";
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"photos.button.text");
}

@end