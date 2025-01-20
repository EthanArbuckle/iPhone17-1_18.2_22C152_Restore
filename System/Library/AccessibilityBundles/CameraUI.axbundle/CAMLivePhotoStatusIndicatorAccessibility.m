@interface CAMLivePhotoStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axValueForLivePhotoMode:(int64_t)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMLivePhotoStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMLivePhotoStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"LIVEPHOTO_MODE_BUTTON_LABEL");
}

- (id)accessibilityValue
{
  v3 = [(CAMLivePhotoStatusIndicatorAccessibility *)self safeValueForKey:@"livePhotoMode"];
  uint64_t v4 = [v3 integerValue];

  return [(CAMLivePhotoStatusIndicatorAccessibility *)self _axValueForLivePhotoMode:v4];
}

- (id)_axValueForLivePhotoMode:(int64_t)a3
{
  v3 = @"LIVEPHOTO_MODE_BUTTON_VALUE_AUTO";
  if (a3 == 1) {
    v3 = @"LIVEPHOTO_MODE_BUTTON_VALUE_ON";
  }
  if (a3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"LIVEPHOTO_MODE_BUTTON_VALUE_OFF";
  }
  v5 = accessibilityCameraUILocalizedString(v4);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMLivePhotoStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMLivePhotoStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end