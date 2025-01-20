@interface CAMLivePhotoButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMLivePhotoButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMLivePhotoButton";
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
  return accessibilityCameraUILocalizedString(@"live.photo");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMLivePhotoButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMLivePhotoButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  uint64_t v2 = [(CAMLivePhotoButtonAccessibility *)self safeIntegerForKey:@"livePhotoMode"];
  objc_super v3 = @"off";
  if (v2 == 2) {
    objc_super v3 = @"auto";
  }
  if (v2 == 1) {
    v4 = @"on";
  }
  else {
    v4 = v3;
  }
  v5 = accessibilityCameraUILocalizedString(v4);

  return v5;
}

- (id)accessibilityIdentifier
{
  return @"Iris";
}

@end