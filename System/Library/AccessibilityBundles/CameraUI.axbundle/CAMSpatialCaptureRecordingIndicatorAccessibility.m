@interface CAMSpatialCaptureRecordingIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CAMSpatialCaptureRecordingIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSpatialCaptureRecordingIndicator";
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
  return accessibilityCameraUILocalizedString(@"recording.spatial.video");
}

@end