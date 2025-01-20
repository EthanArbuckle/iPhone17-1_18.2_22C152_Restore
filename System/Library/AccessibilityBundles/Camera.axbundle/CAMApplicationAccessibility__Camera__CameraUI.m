@interface CAMApplicationAccessibility__Camera__CameraUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CAMApplicationAccessibility__Camera__CameraUI

+ (id)safeCategoryTargetClassName
{
  return @"CAMApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.name.camera");
}

@end