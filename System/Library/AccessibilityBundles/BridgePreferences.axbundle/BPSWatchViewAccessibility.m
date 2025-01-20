@interface BPSWatchViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation BPSWatchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BPSWatchView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(BPSWatchViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return 1;
  }
  v4 = [(BPSWatchViewAccessibility *)self isAccessibilityUserDefinedElement];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)accessibilityLabel
{
  v3 = [(BPSWatchViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3) {
    [(BPSWatchViewAccessibility *)self accessibilityUserDefinedLabel];
  }
  else {
  v4 = accessibilityLocalizedString(@"generic.watch.view");
  }

  return v4;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end