@interface CAMSpatialCaptureButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CAMSpatialCaptureButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSpatialCaptureButton";
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
  return accessibilityCameraUILocalizedString(@"spatial.video.button");
}

- (id)accessibilityValue
{
  if ([(CAMSpatialCaptureButtonAccessibility *)self safeBoolForKey:@"active"]) {
    v2 = @"on.state";
  }
  else {
    v2 = @"off.state";
  }
  v3 = accessibilityCameraUILocalizedString(v2);

  return v3;
}

@end