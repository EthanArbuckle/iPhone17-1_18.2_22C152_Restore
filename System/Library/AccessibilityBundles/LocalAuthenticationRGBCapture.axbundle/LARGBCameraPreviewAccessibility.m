@interface LARGBCameraPreviewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation LARGBCameraPreviewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LARGBCameraPreview";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"preview.view");
}

@end