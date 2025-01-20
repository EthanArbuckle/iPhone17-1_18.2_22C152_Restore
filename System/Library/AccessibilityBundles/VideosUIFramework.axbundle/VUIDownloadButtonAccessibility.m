@interface VUIDownloadButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityDownloadState;
- (unint64_t)accessibilityTraits;
@end

@implementation VUIDownloadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIDownloadButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIDownloadButton" hasProperty:@"viewModel" withType:"@"];
  [v3 validateClass:@"VUIDownloadButtonViewModel" hasProperty:@"downloadProgress" withType:"d"];
  [v3 validateClass:@"VUIDownloadButtonViewModel" hasProperty:@"downloadState" withType:"Q"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityDownloadState
{
  v2 = [(VUIDownloadButtonAccessibility *)self safeValueForKey:@"viewModel"];
  unint64_t v3 = [v2 safeIntegerForKey:@"downloadState"];

  return v3;
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(VUIDownloadButtonAccessibility *)self _accessibilityDownloadState] - 1;
  if (v2 > 3) {
    unint64_t v3 = @"download.button.download";
  }
  else {
    unint64_t v3 = off_2651661D0[v2];
  }

  return accessibilityLocalizedString(v3);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VUIDownloadButtonAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF68];
}

- (id)accessibilityValue
{
  if ([(VUIDownloadButtonAccessibility *)self _accessibilityDownloadState] == 2)
  {
    objc_super v3 = [(VUIDownloadButtonAccessibility *)self safeValueForKey:@"viewModel"];
    [v3 safeCGFloatForKey:@"downloadProgress"];

    v4 = AXFormatFloatWithPercentage();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIDownloadButtonAccessibility;
    v4 = [(VUIDownloadButtonAccessibility *)&v6 accessibilityValue];
  }

  return v4;
}

- (id)accessibilityHint
{
  unint64_t v3 = [(VUIDownloadButtonAccessibility *)self _accessibilityDownloadState];
  if (v3 == 4)
  {
    v4 = @"download.button.remove.hint";
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    v4 = @"download.button.cancel.hint";
LABEL_5:
    v5 = accessibilityLocalizedString(v4);
    goto LABEL_7;
  }
  v7.receiver = self;
  v7.super_class = (Class)VUIDownloadButtonAccessibility;
  v5 = [(VUIDownloadButtonAccessibility *)&v7 accessibilityHint];
LABEL_7:

  return v5;
}

@end