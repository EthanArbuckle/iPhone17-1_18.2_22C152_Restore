@interface CAMPhotoVideoModeSwitchAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMPhotoVideoModeSwitchAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMPhotoVideoModeSwitch";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = (void *)[(CAMPhotoVideoModeSwitchAccessibility *)self safeUnsignedIntegerForKey:@"mode"];
  if (v2)
  {
    if (v2 != (void *)1) {
      goto LABEL_6;
    }
    v3 = @"video.mode";
  }
  else
  {
    v3 = @"photo.mode";
  }
  v2 = accessibilityCameraUI3LocalizedString(v3);
LABEL_6:

  return v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityHint
{
  v2 = (void *)[(CAMPhotoVideoModeSwitchAccessibility *)self safeUnsignedIntegerForKey:@"mode"];
  if (v2)
  {
    if (v2 != (void *)1) {
      goto LABEL_6;
    }
    v3 = @"switch.to.photo";
  }
  else
  {
    v3 = @"switch.to.video";
  }
  v2 = accessibilityCameraUI3LocalizedString(v3);
LABEL_6:

  return v2;
}

@end